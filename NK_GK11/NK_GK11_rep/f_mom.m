function diff = f_mom(XX,params,starting,moments, switches)

%Calculates difference from a vector of predetermined moments 
%Output:    diff: difference from the predetermined vector of moments
%Input:     XX: vector of starting values
%           params: structure of parameters

%Created by Peter Karadi
%June 2010

%Obtaining the starting values
omega  =   XX(1);
lambda =   XX(2);
chi    =   XX(3);

%Creating new structure for submitted parameters for f_KL
params_f    =   params;

%Adding the values to the parameters
params_f.omega   =   omega;
params_f.lambda  =   lambda;
params_f.chi      =   chi;

[vars_ss,vars_nolog_ss,varexo_ss]   =   f_simul(params_f,starting,switches);

%Getting the moments
RkmR    =   vars_ss.Rk-vars_ss.R;       %premiums
phi     =   vars_ss.phi;   
L       =   vars_ss.L;

%Obtaining moments
moments_names   =   fieldnames(moments);
kk  =   length(moments_names);
for ii=1:kk
    eval([moments_names{ii} '=moments.' moments_names{ii} ';']);
end;

%Setting the differences
diff(1)     =   log(RkmR/RkmR_mom);
diff(2)     =   log(phi/phi_mom);
diff(3)     =   log(L/L_mom);

