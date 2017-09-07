// Title: Inflation dynamics and international linkages: a model of the United States, the euro area and Japan
// Authors: Günther Coenen and Volker Wieland
// Publication: ECB Working Paper 181, September 2002


// Replication of 0.5 percentage points demand shock

var q_eu cwp_eu pi1_eu pi4_eu is_eu il_eu rl_eu reer_eu q_ja cwp_ja pi1_ja pi4_ja is_ja il_ja rl_ja reer_ja
    q_us cwp_us index_us pi1_us pi4_us is_us il_us rl_us reer_us rer_euja rer_euus rer_jaus one;



varexo e_cw_eu e_d_ja e_cw_ja e_d_us e_cw_us

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ e_d_eu;                                                 //*
//************************************************************************** 

parameters f0_eu f1_eu f2_eu f3_eu gamma_eu sigma_e_cw_eu delta0_eu delta1_eu delta2_eu delta3_eu delta4_eu delta5_eu 
	   sigma_e_d_eu rho_eu alpha_eu beta_eu pitarget_eu rlbar_eu w_euja w_euus 
	   f0_ja f1_ja f2_ja f3_ja gamma_ja sigma_e_cw_ja delta0_ja delta1_ja delta2_ja delta3_ja delta4_ja delta5_ja 
           sigma_e_d_ja rho_ja alpha_ja beta_ja pitarget_ja rlbar_ja w_jaeu w_jaus 
	   f0_us f1_us f2_us f3_us gamma_us sigma_e_cw_us delta0_us delta1_us delta2_us delta3_us delta4_us delta5_us 
	   sigma_e_d_us rho_us alpha_us beta_us pitarget_us rlbar_us w_useu w_usja;



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
sigma_e_d_eu = 1; //0.0054;  

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
sigma_e_d_ja = 1; //0.0068;

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
sigma_e_d_us = 1; //0.0071;

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



model(linear);


q_eu     =  delta1_eu*q_eu(-1) + delta2_eu*q_eu(-2) + delta3_eu*q_eu(-3) + delta4_eu*(rl_eu(-1) - rlbar_eu*one) + delta5_eu*reer_eu + sigma_e_d_eu*e_d_eu;
cwp_eu   =  (f1_eu+f2_eu+f3_eu)*pi1_eu(+1) + (f2_eu+f3_eu)*pi1_eu(+2) + f3_eu*pi1_eu(+3) + gamma_eu*(f0_eu*q_eu + f1_eu*q_eu(+1) + f2_eu*q_eu(+2) + f3_eu*q_eu(+3)) + sigma_e_cw_eu*e_cw_eu;
pi1_eu   =  (f0_eu*cwp_eu + f1_eu*cwp_eu(-1) + f2_eu*cwp_eu(-2) + f3_eu*cwp_eu(-3) - (f2_eu+f3_eu)*pi1_eu(-1) - f3_eu*pi1_eu(-2))/(f1_eu+f2_eu+f3_eu);
pi4_eu   =  pi1_eu + pi1_eu(-1) + pi1_eu(-2) + pi1_eu(-3);
is_eu    =  (1-rho_eu)*(rlbar_eu*one + pi4_eu) + rho_eu*is_eu(-1) + alpha_eu*(pi4_eu - pitarget_eu*one) + beta_eu*q_eu;
il_eu    =  (is_eu + is_eu(+1) + is_eu(+2) + is_eu(+3) + is_eu(+4) + is_eu(+5) + is_eu(+6) + is_eu(+7))/8;
rl_eu    =  il_eu - (pi1_eu(+8) + pi1_eu(+7) + pi1_eu(+6) + pi1_eu(+5) + pi1_eu(+4) + pi1_eu(+3) + pi1_eu(+2) + pi1_eu(+1))/2;
reer_eu  =  w_euja*rer_euja + w_euus*rer_euus;

q_ja     =  delta1_ja*q_ja(-1) + delta2_ja*q_ja(-2) + delta3_ja*q_ja(-3) + delta4_ja*(rl_ja(-1) - rlbar_ja*one) + delta5_ja*reer_ja + sigma_e_d_ja*e_d_ja;
cwp_ja   =  (f1_ja+f2_ja+f3_ja)*pi1_ja(+1) + (f2_ja+f3_ja)*pi1_ja(+2) + f3_ja*pi1_ja(+3) + gamma_ja*(f0_ja*q_ja + f1_ja*q_ja(+1) + f2_ja*q_ja(+2) + f3_ja*q_ja(+3)) + sigma_e_cw_ja*e_cw_ja;
pi1_ja   =  (f0_ja*cwp_ja + f1_ja*cwp_ja(-1) + f2_ja*cwp_ja(-2) + f3_ja*cwp_ja(-3) - (f2_ja+f3_ja)*pi1_ja(-1) - f3_ja*pi1_ja(-2))/(f1_ja+f2_ja+f3_ja);
pi4_ja   =  pi1_ja + pi1_ja(-1) + pi1_ja(-2) + pi1_ja(-3);
is_ja    =  (1-rho_ja)*(rlbar_ja*one + pi4_ja) + rho_ja*is_ja(-1) + alpha_ja*(pi4_ja - pitarget_ja*one) + beta_ja*q_ja;
il_ja    =  (is_ja + is_ja(+1) + is_ja(+2) + is_ja(+3) + is_ja(+4) + is_ja(+5) + is_ja(+6) + is_ja(+7) + is_ja(+8) + is_ja(+9) + is_ja(+10) + is_ja(+11))/12;
rl_ja    =  il_ja - (pi1_ja(+12) + pi1_ja(+11) + pi1_ja(+10) + pi1_ja(+9) + pi1_ja(+8) + pi1_ja(+7) + pi1_ja(+6) + pi1_ja(+5) + pi1_ja(+4) + pi1_ja(+3) + pi1_ja(+2) + pi1_ja(+1))/3;
reer_ja  =  - w_jaeu*rer_euja + w_jaus*rer_jaus;

q_us     =  delta1_us*q_us(-1) + delta2_us*q_us(-2) + delta3_us*q_us(-3) + delta4_us*(rl_us(-1) - rlbar_us*one) + delta5_us*reer_us + sigma_e_d_us*e_d_us;
cwp_us   =  f0_us*index_us + f1_us*index_us(+1) + f2_us*index_us(+2) + f3_us*index_us(+3) + gamma_us*(f0_us*q_us + f1_us*q_us(+1) + f2_us*q_us(+2) + f3_us*q_us(+3)) + sigma_e_cw_us*e_cw_us;
index_us =  f0_us*cwp_us + f1_us*cwp_us(-1) + f2_us*cwp_us(-2) + f3_us*cwp_us(-3);
pi1_us   =  (f0_us*cwp_us + f1_us*cwp_us(-1) + f2_us*cwp_us(-2) + f3_us*cwp_us(-3) - (f2_us+f3_us)*pi1_us(-1) - f3_us*pi1_us(-2))/(f1_us+f2_us+f3_us);
pi4_us   =  pi1_us + pi1_us(-1) + pi1_us(-2) + pi1_us(-3);
is_us    =  (1-rho_us)*(rlbar_us*one + pi4_us) + rho_us*is_us(-1) + alpha_us*(pi4_us - pitarget_us*one) + beta_us*q_us;
il_us    =  (is_us + is_us(+1) + is_us(+2) + is_us(+3) + is_us(+4) + is_us(+5) + is_us(+6) + is_us(+7))/8;
rl_us    =  il_us - (pi1_us(+8) + pi1_us(+7) + pi1_us(+6) + pi1_us(+5) + pi1_us(+4) + pi1_us(+3) + pi1_us(+2) + pi1_us(+1))/2;
reer_us  =  - w_useu*rer_euus - w_usja*rer_jaus;

rer_euja =  rer_euja(+1) + 4*pi1_eu(+1) - 4*pi1_ja(+1) - is_eu + is_ja;
rer_euus =  rer_euus(+1) + 4*pi1_eu(+1) - 4*pi1_us(+1) - is_eu + is_us;
rer_jaus =  rer_euus - rer_euja; 

one = one(-1);
end;

// Here variance = 0.25, ie s.dev = 0.5 because we look at a 05 shock
shocks;
var e_d_eu = 0.25; //1;
var interest_ = 1;
var e_cw_eu = 1;
var e_d_ja  = 0.25; //1;
var e_cw_ja = 1; 
var e_d_us  = 0.25; //1;
var e_cw_us = 1;
end;

stoch_simul (order=1, irf = 28, ar=0, nograph, noprint) is_eu pi4_eu q_eu is_ja pi4_ja q_ja is_us pi4_us q_us;
