% *********************************************************************
% Program to simulate stochastic outcomes using LINVER subject to
% behavioral equation shocks, imposing adjustments as needed to the
% projected path of the federal funds rate to make it consistent
% with nonlinearities such as the ELB constraint, the asymmetric
% components of the ADUR and AAIT policy rules, and threshold
% conditions that must be satisfied for liftoff from the ELB, if
% those options are selected. If the ECFS option is select, the
% program and the routines it calls also impose fiscal shocks as
% needed to prevent the projected output gap from falling below a
% specfied level.
%
% Required inputs:
%   nreplic -- number of individual outcomes to be simulated
%   nsimqtrs -- length in quarters of each simulated outcome
%   nyv -- number of endogenous variables in the model
%   nxv -- number of exogenous variables in the model
%   shocks -- matrix of random behavioral equation shocks
%   shock_locs -- locations of behavioral equation shocks in the
%     list of exogenous variables 
%   ghxfull, ghu -- decision-rule matrices used to generate current
%     economic conditions based on the lagged state of the economy,
%     the current behavioral equation shocks, and additive
%     adjustments to the expected future path of the federal funds
%     rate  
%   ntrack -- number of variables whose solution values will be
%     saved 
%   mprule -- policy rule
%   elb_imposed -- indicator of whether the ELB is imposed
%   uthresh_imposed, pithresh_imposed -- indicators of whether an
%     unemployment and/or inflation threshold condition is to be
%     applied 
%   ecfs_option -- indicator of whether extreme case fiscal
%     stabilization is used if needed
%
% Optional inputs (not all needed under some policy settings)
%   uthresh, pithresh -- unemployment and inflation thresholds
%   elb -- value of the ELB constraint 
%   eradd_locs -- locations of ERADD, ERADD1, ... terms in the list
%     of endogenous variables
%   {varname}_locs -- location of variable {varname} in the list of
%     endogenous variables, where varname may include RFF, XGAP2,
%     UCOND, PICX4, PICX32, and PICOND, depending on the chosen
%     policy settings 
%   ar_{varname} -- matrix for generating the expected path of
%     endogenous variable {varname} from t to t+predqtrs-1
%     conditional on the state of the economy at time t, where
%     varname may include RFF, XGAP2, UCOND, PICX4, PICX32, and
%     PICOND, depending on the chosen policy settings
%   ecfs_floor -- ECFS imposed-floor on the expected output gap
%
% Outputs:
%   ysave -- matrix holding simulation results for the tracked
%     variables 
%   pathinfo -- matrix holding information about the future path
%     of the federal funds rate expected for each quarter of each
%     outcome, ECFS fiscal shocks, and convergence results
%   rffpaths -- matrix storing the paths of the federal funds rate
%     expected at time t for all nsimqtrs quarters of all nreplic
%     outcomes (only used if the ELB is imposed)
%   gappaths -- matrix storing the paths of the output gap expected
%     at time t for all nsimqtrs quarters of all nreplic outcomes
%     (used only if the ECFS option is used) 
% *********************************************************************
  
disp("Running stochastic simulations");
tic


% Initialize matrices that will hold simulation results.

ysave = zeros(ntrack,nsimqtrs,nreplic);
options = optimset('Display','off','TolFun',1E-3);
pathinfo = zeros(nreplic,nsimqtrs,20);
if predqtrs > 0
    rffpaths = zeros(nreplic,nsimqtrs,predqtrs);
end
if ecfs_option == "yes"
    gappaths = zeros(nreplic,nsimqtrs,predqtrs);
    ecfs_switch = 1;
else
    ecfs_switch = 0;
end



% Set tolerance criterion for judging ELB violations

elb_epsi = .01;




% *****************************************************************
% Stochastic simulation loops. The outer ireplic loop is for the
% current outcome being simulated and the inner iqtr loop is for
% the current quarter of the current outcome.
% *****************************************************************

for ireplic = 1:nreplic
   
    disp(['Replication ',num2str(ireplic)])

    
    % Initialize y (endogenous variable solutions) and x (exogenous
    % behavioral equation shocks and additive adjustments to the
    % expected future path of the federal funds rate)

    y = zeros(nsimqtrs,nyv);
    x = zeros(nsimqtrs,nxv);
    
    
    % Solve the model quarter by quarter using the decision rule
    % conditional on the prior-quarter solution, the random shocks
    % to behavioral equations previously computed for the current
    % replication and quarter, any additive adjustments to the
    % expected path of the federal funds rate consistent with the
    % ELB constraint and the nonlinear component of the policy
    % rule, and any additional ECFS fiscal shocks that are imposed 
    % to limit outsized movements in the output gap.
    
    for iqtr = 1:nsimqtrs
        
        % Retrieve prior-quarter solution values or initialize at
        % zero if in the first quarter
        
        if iqtr == 1
            yl = 0*y(iqtr,:)';
        else
            yl = y(iqtr-1,:)';
        end
        
        
        % Initialize exogenous variables for the current quarter to
        % zero and then update them with random shocks to the
        % behavioral equations 
        
        xc = zeros(nxv,1);
        errors = shocks(ireplic,iqtr,:);
        xc(shock_locs) = errors;
          
        
        % To ensure that the initial projected path of the funds
        % rate equals the prescriptions of the linear portion of
        % the unconstrained policy rule when the ELB is not
        % imposed, set all the lagged eradd terms to zero 
        
        if elb_imposed=="yes" | mprule=="adur" | mprule=="aait"
            yl(eradd_locs,1) = 0;
        end
                
                
        % Solve for the current period ignoring the ELB constraint,
        % thresholds, and the nonlinear component of the policy
        % rule (if any). 
        
        yc = ghxfull*yl + ghu*xc;

        
        % Prior to computing any additive adjustments to the
        % expected path of the federal funds rate that may be
        % needed, initialize solution results to -9999
        
        loss_final = -9999;
        ecfs_conv = -9999;
        asymterm_conv = -9999;
        threshold_conv = -9999;
        madiff_asymterm = -9999;
        solution_type = -9999;
        threshold_solution_type = -9999;
        mingap = -9999;

        
        % If imposing the ELB constraint, employing a nonlinear
        % policy rule, applying threshold conditions for liftoff,
        % or invoking the ECFS option, compute an initial estimate
        % of the expected paths of the federal funds rate and other
        % variables (as needed) from t to t+predqtrs-1 conditional
        % on information at time t ignoring the various nonlinear
        % constraints. Note -- thresholds and ECFS are only allowed
        % if the ELB constraint is imposed.
         
        if elb_imposed=="yes" | mprule=="aait" | mprule=="adur"
            rtest = ar_rff*yc - elb;
        end
        if uthresh_imposed=="yes" | pithresh_imposed=="yes"
            utest = ar_ucond*yc - uthresh;
            pitest = ar_picond*yc - pithresh;
        end
        if ecfs_option == "yes"
            xgap2_pred = ar_xgap2*yc;
        end
        
        
        % If thresholds are not imposed, call addscalc to compute
        % required adjustments to the expected path of the federal
        % funds rate if the ELB constraint is imposed and there
        % are ELB violations along the initial projected RFF path
        % path or the policy rule is nonlinear. If the ECFS option
        % is selected, the addscalc routine also generates fiscal
        % shocks as needed to prevent the output gap from falling
        % below a specified level.
        
        if uthresh_imposed ~= "yes" & pithresh_imposed ~= "yes"
            if elb_imposed=="yes"
                if min(rtest)<elb_epsi
                    threshold_forces = "no";
                    addscalc;
                    yc = ghxfull*yl + ghu*xc;
                    rtest = ar_rff*yc - elb;
                    if ecfs_option == "yes"
                        xgap2_pred = ar_xgap2*yc;
                    end
                end
            end
            if elb_imposed =="no" 
                if mprule=="adur" | mprule=="aait"
                    threshold_forces = "no";
                    addscalc;
                    yc = ghxfull*yl + ghu*xc;
                    rtest = ar_rff*yc - elb;
                    if ecfs_option == "yes"
                        xgap2_pred = ar_xgap2*yc;
                    end
                end
            end
        end
               
        
        % If thresholds are imposed, determine whether adjustments
        % to the projected path of the federal funds rate are
        % needed. There are three possibilities:
        % 1. The initial projected funds rate path violates the ELB
        % 2. The initial projected funds rate path does not violate
        %    the ELB but was binding in the prior quarter and the
        %    threshold conditions are not initially satisfied along
        %    the projected path
        % 3. The initial projected funds rate path does not violate
        %    the ELB and the ELB was not binding in the prior
        %    quarter, but the policy rule is nonlinear
        
        if uthresh_imposed == "yes" | pithresh_imposed == "yes"
            eradds_needed = 0;
            if min(rtest)<=elb_epsi  
                eradds_needed = 1;
            else
                if yl(rff_loc) < elb+elb_epsi
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
                    if tstate(1) < 2
                        eradds_needed = 2;
                    end
                else
                    if mprule == "adur" | mprule == "aait"
                        eradds_needed = 3;
                    end
                end
            end
        end
                  
        
        % If thresholds are imposed and ELB/threshold adjustments
        % are needed (cases 1 and 2), call addscalc_thresh. If
        % adjustments are needed only to impose the onlinear
        % component of the policy rule (case 2), call addscalc.
        
        if uthresh_imposed == "yes" | pithresh_imposed == "yes"
            if eradds_needed == 1 | eradds_needed == 2
                addscalc_thresh;
            end
            if eradds_needed == 3
                threshold_forces = "no";
                addscalc;
            end
            yc = ghxfull*yl + ghu*xc;
            rtest = ar_rff*yc - elb;
            utest = ar_ucond*yc - uthresh;
            pitest = ar_picond*yc - pithresh;
            if ecfs_option == "yes"
                xgap2_pred = ar_xgap2*yc;
            end
        end
                                
        
        % Store final solution values for this replication
        
        y(iqtr,:) = yc';
        x(iqtr,:) = xc'; 

        
        % Save information on the projected paths
        
        pathinfo(ireplic,iqtr,1)  = ireplic;
        pathinfo(ireplic,iqtr,2)  = iqtr;
        if elb_imposed=="yes" 
            pathinfo(ireplic,iqtr,3)  = size(find(rtest<=elb_epsi),1);
            pathinfo(ireplic,iqtr,4)  = min(rtest);
        end
        if uthresh_imposed=="yes" | pithresh_imposed=="yes"
            pathinfo(ireplic,iqtr,5) = threshold_solution_type;
        else
            pathinfo(ireplic,iqtr,5) = solution_type;
        end
        pathinfo(ireplic,iqtr,6)  = loss_final;
        pathinfo(ireplic,iqtr,7)  = asymterm_conv;
        pathinfo(ireplic,iqtr,8)  = madiff_asymterm;
        if ecfs_option == "yes"
            pathinfo(ireplic,iqtr,11) = xc(fiscal_shk_loc);
            pathinfo(ireplic,iqtr,12) = ecfs_conv;
            pathinfo(ireplic,iqtr,13) = mingap;
            gappaths(ireplic,iqtr,:)  = xgap2_pred;
        end
        if predqtrs > 0
            rffpaths(ireplic,iqtr,:) = rtest;
        end
                
end
    
      
    % Save final nqtr solution values for the current replication 
    
    for itrack = 1:ntrack
        ysave(itrack,:,ireplic) = y(:,track_locs(itrack));
    end
end

