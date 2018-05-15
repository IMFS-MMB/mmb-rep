% -----------------------------------------
%
% MCM_par.m 
%
% program to read and define the parameters 
% in the model file 
%
% by: Guenter Coenen, 5 September 2001
%
% -----------------------------------------


%----------
% Euro Area
%----------

% Taylor contracts

f0_eu = 0.2846; 
f1_eu = 0.2828;
f2_eu = 0.2443;
f3_eu = 1-f0_eu-f1_eu-f2_eu;

gamma_eu = 0.0158;

sigma_e_cw_eu = 0.0042;

% IS curve

delta0_eu =  0.00; 
delta1_eu =  1.0521;
delta2_eu =  0.0779;
delta3_eu = -0.1558;
delta4_eu = -0.0787;
delta5_eu =  0.0188;

sigma_e_d_eu = 0.0054;

% Taylor rule

rho_eu   = 0.00;
alpha_eu = 0.50;
beta_eu  = 0.50;

% steady states

pitarget_eu = 0.00;

rlbar_eu = -delta0_eu/delta4_eu;               

% eer_eights

w_euja = 0.1702;
w_euus = 0.2353;


%------
% Japan
%------

% Taylor contracts

f0_ja = 0.3301; 
f1_ja = 0.2393;
f2_ja = 0.2393;
f3_ja = 1-f0_ja-f1_ja-f2_ja;

gamma_ja = 0.0185;

sigma_e_cw_ja = 0.0068;

% IS curve

delta0_ja =  0.00; 
delta1_ja =  0.9071;
delta2_ja =  0.00;
delta3_ja =  0.00;
delta4_ja = -0.0781;
delta5_ja =  0.0122;

sigma_e_d_ja = 0.0068;

% Taylor rule

rho_ja   = 0.00;
alpha_ja = 0.50;
beta_ja  = 0.50;

% steady states

pitarget_ja = 0.00;

rlbar_ja = -delta0_ja/delta4_ja; 

% eer_eights

w_jaeu = 0.2870;
w_jaus = 0.3530;


%--------------
% United States
%--------------

% Fuhrer/Moore contracts

f0_us = 0.6788; 
f1_us = 0.2103;
f2_us = 0.0676;
f3_us = 1-f0_us-f1_us-f2_us;

gamma_us = 0.0014;

sigma_e_cw_us = 0.0004;

% IS curve

delta0_us =  0.00; 
delta1_us =  1.2184;
delta2_us = -0.1381;
delta3_us = -0.2116;
delta4_us = -0.0867;
delta5_us =  0.0188;

sigma_e_d_us = 0.0071;

% Taylor rule

rho_us   = 0.00;
alpha_us = 0.50;
beta_us  = 0.50;

% steady states

pitarget_us = 0.00;

rlbar_us = -delta0_us/delta4_us; 

% eer_eights

w_useu = 0.2442;
w_usja = 0.2339;


%-----------
% renormalise standard deviation of structural 
% shocks for computation of historical shocks
%-----------

hsh = 0;    % hsh = 0: use estimated standard deviation of structural shock
            % hsh = 1: normalise standard deviation of structural shocks to
            %          compute historical shocks

if hsh == 1
  sigma_e_d_eu  = 1.00;
  sigma_e_cw_eu = 1.00;
  sigma_e_d_ja  = 1.00;
  sigma_e_cw_ja = 1.00;
  sigma_e_d_us  = 1.00;
  sigma_e_cw_us = 1.00;
end

