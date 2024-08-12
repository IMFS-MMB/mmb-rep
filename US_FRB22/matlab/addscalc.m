% Routine to calculate additive adjustments to the model's
% equations to impose the following nonlinear relationships on the
% model's otherwise linear solutions:
%   1. ELB on the expected path of the federal funds rate
%   2. Asymmetric component of the nonlinear AAIT rule, if selected
%   3. Asymmetric component of the ADUR rule, if selected
%   4. A preset ELB liftoff date (lfqtr), if imposed
%   5. Extreme case fiscal stabilization, if selected


% Set miscellaneous solution parameters

loss_crit = .0001;
addcalc_itmax = 10;
addcalc_itmax2 = 50;
ecfs_epsi = 1;
asym_epsi = .02;
fshk = 0;
fshkqtrs = min(predqtrs,8);
fshkcoef = 1;
ind_nonelb_adds = 0;
if ecfs_option == "yes" | mprule == "adur" | mprule == "aait"
    ind_nonelb_adds = 1;
end
if mprule == "aait"
    materm_mat = zeros(addcalc_itmax2,predqtrs);
end
decay = 1;
madiff_asymterm = 50;
asymterm = rtest*0;


% Iteratively search for those quarters along the projected paths of
% RFF and other ELB-constrained interest rates that require
% positive additive adjustments to prevent them from falling below
% the ELB, using OLS to compute the required adjustments.

rtest0 = rtest;
eradds = rtest*0;
asymterm_eradds = rtest*0;
counter = 0;
vflag = 1;
while vflag == 1
    counter = counter + 1;

    % If employing ECFS, apply a positive fiscal shock at t=0 based
    % if the current projection of the output gap is too negative
    if ecfs_switch == 1
        xgap2_pred = ar_xgap2*yc;
        mingap = min(xgap2_pred(1:fshkqtrs));
        if mingap < ecfs_floor
            fshk = fshk - fshkcoef*(mingap-ecfs_floor);
        end
        xc(fiscal_shk_loc) = fshk;
    end
    
    
    % If the AAIT rule is used, compute its asymmetric component
    % using a moving-average smoother to speed convergence
    if mprule == "aait" & madiff_asymterm > asym_epsi
        picx4_pred = ar_picx4*yc;
        pic32_pred = ar_pic32*yc;
        asymtest = .5+.5*tanh(-25*(pic32_pred+.1));
        if asymqtrs<predqtrs
            asymtest(asymqtrs+1:predqtrs) = 0;
        end
        if counter == 1
            asymterm_last = asymtest*0;
        else
            asymterm_last = asymterm;
        end
        materm_mat(counter,:) = (1.2*pic32_pred-.075*picx4_pred).*asymtest;
        z = asymtest*0;
        ww = [1:counter].^decay;
        ww = ww/sum(ww);
        for j = 1:counter
            z = z + ww(j)*materm_mat(j,:)';
        end
        asymterm = z;
        asymterm_eradds = asymterm;
    end
            
        
    % If the ADUR rule is used, compute its asymmetric component
    if mprule == "adur" & madiff_asymterm > asym_epsi
        dlur2_pred = ar_dlur2*yc;
        ucond_pred = ar_ucond*yc;
        asymtest = (.5+.5*tanh(15*ucond_pred)).*(.5+.5*tanh(15*dlur2_pred));
        if asymqtrs<predqtrs
            asymtest(asymqtrs+1:predqtrs) = 0;
        end
        asymterm_last = asymterm;
        asymterm = -0.85*dlur2_pred.*asymtest;
        if counter > 15
            asymterm = .2*asymterm + .8*asymterm_last;
        end
        asymterm_eradds = asymterm;
    end    
    
     
    % If non-ELB additive adjustments have been applied, reproject  
    % economic conditions without any ELB-related adjustments
    if ind_nonelb_adds == 1
        eradds = rtest*0;
        xc(rff_eradd_locs) = eradds + asymterm_eradds;
        x(iqtr,:) = xc';
        yc = ghxfull*yl + ghu*xc;
        rtest = ar_rff*yc - elb;
        rtest0 = rtest;
    end
        
    
    % Find quarters with elb violations for first iteration    
    if counter == 1
        qviolations = (rtest < 0);
    end
    
    
    % Define quarters to be forced to the ELB, either because the
    % federal funds rate would violate the ELB constraint without
    % positive adds, or because negative adds are needed to prevent
    % violations of the threshold liftoff policy as determined in
    % the program addscalc_thresh 
    forceqtrs = qviolations;
    if threshold_forces == "yes"
        forceqtrs(1:lfqtr) = 1;
    end
        
    
    % Estimate adjustments needs to eliminate ELB violations and
    % impose immediate-drive-to-zero and threshold-based liftoff
    % constraints 
    jq = find(forceqtrs == 1);
    tmp = forceqtrs.*rtest0;
    elb_violation = tmp(jq);
    deriv_temp = deriv(jq,jq);
    uvec = deriv_temp\(-elb_violation);
    eradds = 0*eradds;
    eradds(jq) = uvec;
    xc(rff_eradd_locs) = eradds + asymterm_eradds;
    x(iqtr,:) = xc';
    
    
    % Recompute current conditions and projected elb violations 
    yc = ghxfull*yl + ghu*xc;
    rtest = ar_rff*yc - elb;
    qviol_prev = qviolations;
    qviolations = (rtest <= elb_epsi) & (eradds >= 0) ;

    
    % If the loss function for non-threshold-related ELB
    % adjustments is below loss_crit, or if repeating quarters,
    % declare the ELB constraint satisfied.
    z = eradds;
    if threshold_forces == "yes"
        z(1:lfqtr) = 0;
    end
    loss_ols = ((z.^2)'*(rtest>elb_epsi) + (rtest.^2)'*(rtest<=0) + (z.^2)'*(z<0));
    elb_conv = 0;
    if loss_ols < loss_crit | isequal(qviolations,qviol_prev)
        elb_conv = 1;
    end
    
    
    % Check for nonconvergence of ECFS adjustments, if applied
    ecfs_conv = 1;
    if ecfs_switch == 1
        xgap2_pred = ar_xgap2*yc;
        mingap = min(xgap2_pred(1:fshkqtrs));
        if mingap < ecfs_floor-ecfs_epsi
            ecfs_conv = 0;
        end
    end
    
    
    % Check for nonconvergence of asymmetric components if the ADUR
    % rule or AAIT rule is used
    asymterm_conv = 1;
    if mprule == "aait" | mprule == "adur"
        madiff_asymterm = max(abs(asymterm-asymterm_last));
        if madiff_asymterm > asym_epsi
            asymterm_conv = 0;
        end
    end
    
         
    % If all convergence tests are satisfied, or if maximum
    % iterations have been reached, stop iterating
    vflag = 1;
    if elb_conv==1 & ecfs_conv==1 & asymterm_conv==1 
        vflag = 0;
    end
    if counter>addcalc_itmax-1
        if ecfs_conv==1 & asymterm_conv==1 
            vflag = 0;
        end
    end
    if counter>addcalc_itmax2-1
        vflag = 0;
    end

end


% Save convergence results after OLS iterations

loss_final = loss_ols;
if loss_ols < loss_crit
    solution_type = counter;
else
    solution_type = -1000;
end


% If necessary, continue with LSQNONNEG iterations to fine tune ELB 
% adjustments without recomputing non-ELB adjustments

if loss_final >= loss_crit
    
    % Preserve OLS-generated adjustments and update rtest0
    ols_eradds = eradds + asymterm_eradds;
    rtest0 = rtest;
    
    counter = 0;
    vflag = 1;
    while vflag == 1
        counter = counter + 1;
        
        % Ignore quarters being forced because of thresholds
        forceqtrs = qviolations;
        if threshold_forces == "yes"
            forceqtrs(1:lfqtr) = 1;
        end

        % call lsqnonneq to estimate the adjustments needed to
        % eliminate elb violations 
        jq = find(forceqtrs == 1);
        elb_violation = forceqtrs.*rtest0;
        deriv_temp = zeros(predqtrs,predqtrs);
        deriv_temp(jq,jq) = deriv(jq,jq);
        uvec = lsqnonneg(deriv_temp,-elb_violation,[],options);
        eradds = uvec;
        xc(rff_eradd_locs) = eradds + ols_eradds;
        x(iqtr,:) = xc';

        % recompute current conditions and projected elb violations 
        yc = ghxfull*yl + ghu*xc;
        rtest = ar_rff*yc - elb;
        qviol_prev = qviolations;
        qviolations = (rtest <= elb_epsi);
    
        % check for convergence or maximum number of iterations
        z = eradds;
        if threshold_forces == "yes"
            z(1:lfqtr) = 0;
        end
        loss_nneg = ((z.^2)'*(rtest>elb_epsi) + (rtest.^2)'*(rtest<=0));
        vflag = 1;
        if isequal(qviolations,qviol_prev)
            vflag = 0;
        end
        if loss_nneg < loss_crit
            vflag = 0;
        end
        if counter > addcalc_itmax2 - 1 
            vflag = 0;
        end
    end

    % Save convergence results after NNEG iterations
    loss_final = loss_nneg;
    if loss_final < loss_crit
        solution_type = counter + 1000;
    else
        solution_type = -1000;
    end
end



