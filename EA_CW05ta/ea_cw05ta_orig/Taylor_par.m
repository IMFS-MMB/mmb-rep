% -----------------------------------------
%
% Taylor_par.m 
%
% program to read and define the parameters 
% in the model file 
%
% by: Guenter Coenen, 5 September 2001
%
% -----------------------------------------

% Taylor contracts

s = 0.0456;

f0 = 0.25+(1.5-0)*s;
f1 = 0.25+(1.5-1)*s;
f2 = 0.25+(1.5-2)*s;
f3 = 0.25+(1.5-3)*s;

gamma = 0.0115;

sigma_e_cw = 0.0038;

% IS curve

delta0 =  0.0027; 
delta1 =  1.1807;
delta2 = -0.2045;
delta3 = -0.0947;

sigma_e_d = 0.0056;

% Taylor's rule

%rho   = 0.00;
%alpha = 1.50;
%beta  = 0.50;

% steady states

pitarget = 0.00;

rlbar = -delta0/delta3*0;               

%-----------
% renormalise standard deviation of structural 
% shocks for computation of historical shocks
%-----------

hsh = 1;    % hsh = 0: use estimated standard deviation of structural shock
            % hsh = 1: normalise standard deviation of structural shocks to
            %          compute historical shocks

if hsh == 1
  sigma_e_d  = 1.00;
  sigma_e_cw = 1.00;
end
load Taylor_shocks79q2_98q4 shocks;
Omega = cov(shocks); clear shocks; 
