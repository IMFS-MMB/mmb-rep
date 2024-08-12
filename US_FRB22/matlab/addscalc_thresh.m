% Routine to compute the additive addjustments to the projected
% path of the federal funds rate that are required to hold it at
% the ELB until the threshold conditions are projected to be
% persistently satisfied without the ELB binding. The solution
% routine assumes that agents expect policymakers to abide by their
% threshold commitment for a maximum of maxfgq quarters into the
% future, where maxfgq must be at least equal to 1 and no greater
% than predqtrs. When maxfgq=predqtrs, the threshold commitment is
% effectively fully credible; otherwise, the commitment has limited
% credibility. 


% If the ECFS option is used, switch it on to begin so that ECFS
% shocks are generated on the initial projection

if ecfs_option == "yes"
    ecfs_switch = 1;
else
    ecfs_switch = 0;
end


% If the initial projected path of the funds rate without any
% adjustments had ELB violations or needs to conform to the
% constrained prescriptions of a nonlinear rule, call addscalc to
% eliminate the violations and impose any other nonlinear
% adjustments ignoring the threshold conditions

if eradds_needed == 1 | eradds_needed == 3
    threshold_forces = "no";
    addscalc;
    yc = ghxfull*yl + ghu*xc;
    rtest = ar_rff*yc - elb;
    pitest = ar_picond*yc - pithresh;
    utest = ar_ucond*yc - uthresh;
    if ecfs_option == "yes"
        xgap2_pred = ar_xgap2*yc;
    end
    threshold_forces = "yes";
end


% If expectations are VAR and thresholds are not satistified in
% the current quarter, force RFF to the ELB and quit 

if expvers == "var"
    if utest>0 | pitest<0
        lfqtr = 1;
        addscalc;
        yc = ghxfull*yl + ghu*xc;
        rtest = ar_rff*yc - elb;
        pitest = ar_picond*yc - pithresh;
        utest = ar_ucond*yc - uthresh;
        if ecfs_option == "yes"
            xgap2_pred = ar_xgap2*yc;
        end
    end
    if utest<=0 & pitest>=0
        threshold_solution_type = 0;
    else
        threshold_solution_type = 1;
    end
    return
end
    

% Find the earliest quarter along the initial projected path that
% satisfies the threshold conditions to define the initial upper
% limit on the possible liftoff point (lfqtr_max)

z = [1:predqtrs+4]*0 + 2;
z(1:predqtrs) = (utest<=0) + (pitest>=0);
zz = zeros(predqtrs,4)+2;
zz(:,1) = z(1:predqtrs);
zz(:,2) = z(2:predqtrs+1);
zz(:,3) = z(3:predqtrs+2);
zz(:,4) = z(4:predqtrs+3);
tt = [1:4]*0+1;
tstate = zz*tt'/4;
w = [1:predqtrs+4]*0 + 1;
w(1:predqtrs) = (eradds<=0 & rtest>=-elb_epsi);
ww = zeros(predqtrs,4)+1;
ww(:,1) = w(1:predqtrs);
ww(:,2) = w(2:predqtrs+1);
ww(:,3) = w(3:predqtrs+2);
ww(:,4) = w(4:predqtrs+3);
rstate = ww*tt'/4;
combstate = tstate'+rstate';
v1 = find(combstate==3);
if isempty(v1) < 1
    lfqtr_max = v1(1);
else
    lfqtr_max= predqtrs;
end
if lfqtr_max > maxfgq
    lfqtr_max = maxfgq;
end



% If expectations are not VAR and the maximum liftoff quarter is
% the first quarter, no need for lfqtr search so return

if lfqtr_max == 1
    threshold_solution_type = -9999;
    return
end


% If the ELB was not binding in the prior quarter and is not
% projected to be binding in the future, no need for lfqtr search
% so return

v2 = find(rstate<0);
if isempty(v2) == 1 & yl(rff_loc) > elb+elb_epsi
    threshold_solution_type = -9999;
    return
end


% To facilitate convergence during the search for the liftoff point
% that satisfies the thresholds, turn off computation of ECFS
% adjustments

ecfs_switch = 0;


% Search for the smallest value of lfqtr that, when the federal
% funds rate is forced to the ELB from t to t+lfqtr along its
% projected path, causes the threshold conditions to be
% continuously satisfied without the ELB binding for the next four
% quarters, ignoring any ELB violations beyond that point. On
% each iteration, lfqtr is provisionally set to the midpoint of the
% feasible range [lfqtr_min,lqqtr_max] in which lfqtr must lie, as
% determined by projection results on previous iterations. 

itmax_thresh = 21;
lfqtr_min = 1;
lfqtr_mat = [1:itmax_thresh]*0;
type = -9999;
eradds = rtest*0;
rtest0 = rtest;
ovflag = 1;
thresh_counter = 0;
while ovflag == 1
    thresh_counter = thresh_counter + 1;

    % Set the trial value of the last forcing quarter, lfqtr, equal 
    % to the midpoint between lfqtr_min and lfqtr_max unless it is
    % the first iteration, in which case set lfqtr equal to
    % lfqtr_max 
    if thresh_counter == 1 
        lfqtr = lfqtr_max;
    else
        lfqtr = round((lfqtr_min+lfqtr_max)/2);
    end
    lfqtr_mat(thresh_counter) = lfqtr;

    
    % Call addscalc to ompute the adjustments needed to hold the
    % funds rate at the ELB in quarters 1 through lfqtr as well as
    % any adjustments needed in other quarters to prevent ELB
    % violations, impose the nonlinear components (if any) of the
    % policy rule, and implement the ECFS option if selected.
    addscalc;
    yc = ghxfull*yl + ghu*xc;
    rtest = ar_rff*yc - elb;
    pitest = ar_picond*yc - pithresh;
    utest = ar_ucond*yc - uthresh;
    if ecfs_option == "yes"
        xgap2_pred = ar_xgap2*yc;
    end

    
    % Define tstate, equal to 2 if both threshold conditions are
    % continuously met in the next 4 quarters and less than 2
    % otherwise 
    z = [1:predqtrs+4]*0 + 2;
    z(1:predqtrs) = (utest<=0) + (pitest>=0);
    zz = zeros(predqtrs,4)+2;
    zz(:,1) = z(1:predqtrs);
    zz(:,2) = z(2:predqtrs+1);
    zz(:,3) = z(3:predqtrs+2);
    zz(:,4) = z(4:predqtrs+3);
    tt = [1:4]*0+1;
    tstate = zz*tt'/4;
    tstate = tstate';
    
    
    % Define rstate, equal to 1 if the ELB is continuously not
    % binding in the next 4 quarters and zero otherwise, and
    % combstate equal to the sum of tstate and rstate
    w = [1:predqtrs+4]*0 + 1;
    w(1:predqtrs) = (eradds<=0 & rtest>=-elb_epsi);
    ww = zeros(predqtrs,4)+1;
    ww(:,1) = w(1:predqtrs);
    ww(:,2) = w(2:predqtrs+1);
    ww(:,3) = w(3:predqtrs+2);
    ww(:,4) = w(4:predqtrs+3);
    tt = [1:4]*0+1;
    rstate = ww*tt'/4;
    rstate = rstate';
    combstate = tstate+rstate;

    
    % Check for type 0 convergence, which requires:
    %   1. combstate=3 in quarter t+lfqtr
    %   2. combstate<3 in quarters t to t+lfqtr-1 unless ELB
    %      violations were originally projected, in which case
    %      combstate<3 in quarters t+3 to t+lfqtr-1 
    if combstate(lfqtr)==3
        if lfqtr==1 
            ovflag = 0;
            type = 0;
        else
            if eradds_needed == 2
                if min(find(combstate==3))==lfqtr 
                    ovflag = 0;
                    type = 0;
                end
            else 
                zz = min(setdiff(find(combstate==3),[1,2,3]));
                if zz==lfqtr
                    ovflag = 0;
                    type = 0;
                end
            end
        end
    end
    
    
    % Check for type 1 convergence, in which all quarters are
    % forced without satisfying the threshold conditions 
    if lfqtr==maxfgq & tstate(lfqtr)<2
        ovflag = 0;
        type = 1;
    end
            
    
    % If max iterations have been reached, stop iterating
    if thresh_counter > itmax_thresh-1
        a = "Max threshold iterations reached in quarter %.0f";
        disp(compose(a,iqtr));
        ovflag = 0;
        type = 3;
    end
    
    
    % If further iterations are still indicated, determine whether
    % the current setting of the last forcing quarter has resulted
    % in undershooting or undershooting, and reset the feasible
    % range of lfqtr accordingly
    if ovflag == 1
        overshot = 0; 
        if eradds_needed==2 & min(find(combstate==3))<lfqtr
            overshot = 1;
        end
        zz = min(setdiff(find(combstate==3),[1,2,3]));
        if eradds_needed==1 & zz<lfqtr
            overshot = 1;
        end
        if overshot == 0
            lfqtr_min = lfqtr;
        end
        if overshot == 1
            lfqtr_max = lfqtr;
        end
    end
    
    
    % Before starting a new iteration, see if the trial value of
    % lfqtr on the next iteration will be a repeat; if so, stop
    % because the liftoff point is not well defined
    if ovflag == 1
        lfqtr_next = round((lfqtr_min+lfqtr_max)/2);
        if isempty(find(lfqtr_mat(1:thresh_counter)==lfqtr_next)) < 1
            ovflag = 0;
            type = 2;
        end
    end
end


% Check for any remaining ELB violations 
if min(rtest)<-elb_epsi
    type = 3;
end


% Save information on solution results

threshold_solution_type = type;
solution_thresh_counter = thresh_counter;











 
