%*******************************************************************
% Program to generate the matrices and other information that
% define the dynamic structure of the model. To do so, the 
% procedure retrieves information from Dynare's parsing of the
% model. This information includes the stochastic solution to the
% model described by the decision rule yc = ghxfull*y1 + ghu*xc,
% where yc is the current-period solution, y1 the solution in the
% prior quarter, and xc contains the current-period values of
% exogenous shocks. For more information, see the stochsim manual.
%
% Inputs, in addition to the matrices created by the execution of
% Dynare in make_rundmod, are:
%   predqtrs -- number of quarters that the ELB and other nonlinear
%     constraints will be imposed on the expected funds rate path
%   mprule -- the policy rule used in the simulations
%   uthresh_imposed, pithresh_imposed -- indicators of whether
%     threshold conditions are imposed on liftoff from the ELB
%   track_names -- series for which simulation results are saved
%   
% Outputs:
%   ghxfull and ghu -- the matrices used in the decision rule to
%     compute current economic conditions based on prior quarter
%     conditions, current behavioral equation shocks, and additive
%     adjustments to the expected path of the federal funds rate
%   endo_names -- namelist of endogenous variables in the model
%   exog_names -- namelist of exogenous variables in the model
%   nyv, nxv -- number of endogenous and exogenous variables,
%     respectively 
%   {track_names}_loc -- location of tracked series in the list of
%     endogenous variables 
%   {name}_loc -- locations of variables whose expected paths at
%     time t will be generated in order to impose nonlinear
%     constraints 
%   ar_{name} -- matrices used to generate the projected paths of
%     various variables from t to t+predqtrs-1 based on conditions
%     at time t
%   eradd_locs -- locations of the ERADD, ERADD1, ..., ERADDk
%     terms, k=elbqtrs-1, in the list of endogenous variables
%   rff_eradd_locs -- locations of the funds rate adjustments E0 to
%     Ek,k=elbqtrs-1, in the list of exogenous variables
%   deriv -- matrix of derivatives of the projected federal funds
%     rate from t to t+elbqtrs-1 with respect to {E0,...,Ek} 
%   fiscal_shock_loc -- location of the ECFS fiscal shock in the
%     list of exogenous variables
%********************************************************************

  
% Retrieve Dynare parsing information about the model

disp("  ");
disp("Retrieving model structure and generating related matrices");
ghx = oo_.dr.ghx;
ghu = oo_.dr.ghu;
order_var = oo_.dr.order_var;
inv_order_var = oo_.dr.inv_order_var;
k2 = oo_.dr.kstate(find(oo_.dr.kstate(:,2)<=M_.maximum_lag+1),[1 2]);
k2 = k2(:,1) + (M_.maximum_lag+1-k2(:,2))*M_.endo_nbr;
endo_names = cellstr(M_.endo_names);
exog_names = cellstr(M_.exo_names);
nyv = size(ghx,1);
nxv = size(ghu,2);


% Transform ghx to ghxfull so that the decision rule updates all
% endogenous variables rather than just the state variables

ghxfull = zeros(nyv,nyv);
for i = 1:size(ghx,2)
    ghxfull(:,k2(i)) = ghx(:,i);
end


% Find the locations of the tracked variables in the list of
% endogenous variables

ntrack = size(track_names,2);
track_locs = [1:ntrack];
for i = 1:ntrack
    track_locs(i) = inv_order_var(endo_names==track_names(i));
end


% Find the location of the fiscal shock if the ECFS option is
% selected 

if ecfs_option == "yes"
    fiscal_shk_loc = find(exog_names=="fiscal_aerr");
end


% If predqtrs equals zero, no further matrices or lists need to be
% defined so return

if predqtrs == 0
    return;
end



% Find the locations of variables whose time t paths will be
% projected in order to impose nonlinear constraints
    
rff_loc = inv_order_var(endo_names=="rff");
xgap2_loc = inv_order_var(endo_names=="xgap2");
if mprule == "adur"
    dlur2_loc = inv_order_var(endo_names=="dlur2");
end
if mprule == "adur" | uthresh_imposed == "yes"
    ucond_loc = inv_order_var(endo_names == "ucond");
end
if mprule == "aait"
    pic32_loc = inv_order_var(endo_names=="pic32");
    picx4_loc = inv_order_var(endo_names=="picx4");
end
if pithresh_imposed == "yes"
    picond_loc = inv_order_var(endo_names=="picond");
end


% Construct "ar_" matrices that will be used to generate the
% projected paths of variables with nonlinear constraints
    
ar_rff = zeros(predqtrs,nyv);
ar_rff(1,rff_loc) = 1;
ar_xgap2 = zeros(predqtrs,nyv);
ar_xgap2(1,xgap2_loc) = 1;
if mprule == "adur"
    ar_dlur2 = zeros(predqtrs,nyv);
    ar_dlur2(1,dlur2_loc) = 1;
end
if mprule == "adur" | uthresh_imposed == "yes"
    ar_ucond = zeros(predqtrs,nyv);
    ar_ucond(1,ucond_loc) = 1;
end
if mprule == "aait"
    ar_pic32 = zeros(predqtrs,nyv);
    ar_pic32(1,pic32_loc) = 1;
    ar_picx4 = zeros(predqtrs,nyv);
    ar_picx4(1,picx4_loc) = 1;
end
if pithresh_imposed == "yes"
    ar_picond = zeros(predqtrs,nyv);
    ar_picond(1,picond_loc) = 1;
end

aamat=eye(nyv,nyv);
for i = 2:predqtrs
    aamat = ghxfull*aamat;   
    ar_rff(i,:) = aamat(rff_loc,:);
    ar_xgap2(i,:) = aamat(xgap2_loc,:);
    if mprule == "adur"
        ar_dlur2(i,:) = aamat(dlur2_loc,:);
    end
    if mprule == "adur" | uthresh_imposed == "yes"
        ar_ucond(i,:) = aamat(ucond_loc,:);
    end
    if mprule == "aait"
        ar_pic32(i,:) = aamat(pic32_loc,:);
        ar_picx4(i,:) = aamat(picx4_loc,:);
    end
    if pithresh_imposed == "yes"
        ar_picond(i,:) = aamat(picond_loc,:);
    end
end
    
    
% Find the locations of the eradd terms in the list of endogenous
% variables 
    
a = ["eradd",compose("eradd%.0f",[1:predqtrs-1])]';
eradd_locs = [1:predqtrs];
for i = 1:predqtrs;
    eradd_locs(i) = inv_order_var(endo_names==a(i));
end


% Find the locations of the "Ek" adjustments to the projected
% funds rate path in the list of exogenous variables 
    
rff_eradd_names = compose("e%.0f",[0:predqtrs-1])';
rff_eradd_locs = [1:predqtrs];
xlocs = [1:nxv];
for i = 1:predqtrs;
    rff_eradd_locs(i) = xlocs(exog_names==rff_eradd_names(i)); 
end


% Compute the derivatives of current and future values of the
% funds rate with respect to the additive adjustments
    
z = ghu;
deriv(1,:) = z(rff_loc,rff_eradd_locs);
for i = 2:predqtrs
    z = ghxfull*z;
    deriv(i,:) = z(rff_loc,rff_eradd_locs);
end
    















  
