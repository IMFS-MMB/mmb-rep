function set_steadystate_08_22

global M_

NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for i = 1:NumberOfParameters                                  % Loop...
%   paramname = deblank(M_.param_names(i,:));                   %    Get the name of parameter i. 
  paramname = char(deblank(M_.param_names(i,:)));                   %    KB: adjusted so that paramnames is a char that enters eval function
  eval([ paramname ' = M_.params(' int2str(i) ');']);         %    Get the value of parameter i.
end  





%% Steady State


pr_ts    = 1;

betta_a = pi_ts/(1 + i_a_ts);
betta_b = pi_ts/(1 + i_b_ts);
i_c_ts  = i_a_ts;

i_Ga_ts = i_a_ts;
i_Gb_ts = i_b_ts;

i_policy_ts=i_a_ts;

q_a_ts=1;
q_b_ts=1;

Rk_a_ts=i_a_ts;
Rk_b_ts=i_b_ts;

rk_a_ts=(((1+ Rk_a_ts)/pi_ts -tauk_a*delta_a) -(1-delta_a))/(1-tauk_a) ;
rk_b_ts=(((1+ Rk_b_ts)/pi_ts -tauk_b*delta_b) -(1-delta_b))/(1-tauk_b) ;
   
mcr_a_ts   = (1-tau_a)*((theta_a-1)/theta_a);
mcr_b_ts   = (1-tau_b)*((theta_b-1)/theta_b);

in_a_ts = 0.172*GDP_a_ts;
in_b_ts = 0.193*GDP_b_ts;

k_a_ts  = in_a_ts/delta_a;
k_b_ts  = in_b_ts/delta_b;

l_o_a_ts = l_a_ts;
l_o_b_ts = l_b_ts;

l_r_a_ts = l_a_ts;
l_r_b_ts = l_b_ts;

n_a_ts    = (1-ur_a_ts)*l_a_ts;   
n_b_ts    = (1-ur_b_ts)*l_b_ts;   

nG_a_ts = n_a_ts*gn_a;
nG_b_ts = n_b_ts*gn_b;

nP_a_ts = n_a_ts - nG_a_ts;
nP_b_ts = n_b_ts - nG_b_ts;

n_k_a = nP_a_ts/k_a_ts;
n_k_b = nP_b_ts/k_b_ts;

wr_a_ts    = rk_a_ts*n_k_a^(-1)*(1-rho_a)/(rho_a*(1+tausc_a));
wr_b_ts    = rk_b_ts*n_k_b^(-1)*(1-rho_b)/(rho_b*(1+tausc_b));

%n_k_a     = (rk_a_ts/(mcr_a_ts)/rho_a)^(1/(1-rho_a));
%n_k_b     = (rk_b_ts/(mcr_b_ts)/rho_b)^(1/(1-rho_b));

% wr_a_ts    = rk_a_ts*n_k_a^(-1)*(1-rho_a)/(rho_a*(1+tausc_a));
% wr_b_ts    = rk_b_ts*n_k_b^(-1)*(1-rho_b)/(rho_b*(1+tausc_b));

wrG_a_ts = wr_a_ts*(1+mg_a);
wrG_b_ts = wr_b_ts*(1+mg_b);

y_a_ts = GDP_a_ts - (1+tausc_a)*wrG_a_ts*nG_a_ts;
y_b_ts = GDP_b_ts - (1+tausc_b)*wrG_b_ts*nG_b_ts;

A_a = (wr_a_ts*(1+tausc_a)*n_k_a^rho_a)/(mcr_a_ts*(1-rho_a));
A_b = (wr_b_ts*(1+tausc_b)*n_k_b^rho_b)/(mcr_b_ts*(1-rho_b));

%k_a_ts    = nP_a_ts/(n_k_a); 
%k_b_ts    = nP_b_ts/(n_k_b); 

k_o_a_ts    = k_a_ts/(1-mu_a); 
k_o_b_ts    = k_b_ts/(1-mu_b);

%in_a_ts   = delta_a*k_a_ts;
%in_b_ts   = delta_b*k_b_ts;

in_o_a_ts    = in_a_ts/(1-mu_a); 
in_o_b_ts    = in_b_ts/(1-mu_b);

FC_a=A_a*(k_a_ts^rho_a)*(nP_a_ts^(1-rho_a)) - y_a_ts;
FC_b=A_b*(k_b_ts^rho_b)*(nP_b_ts^(1-rho_b)) - y_b_ts;

% FC_a=A_a*(k_a_ts^rho_a)*(nP_a_ts^(1-rho_a))*(1-mcr_a_ts/(1-tau_a));
% FC_b=A_b*(k_b_ts^rho_b)*(nP_b_ts^(1-rho_b))*(1-mcr_b_ts/(1-tau_b));

% y_a_ts  = k_a_ts^rho_a*nP_a_ts^(1-rho_a)-FC_a;
% y_b_ts  = k_b_ts^rho_b*nP_b_ts^(1-rho_b)-FC_b;

% GDP_a_ts = y_a_ts + (1+tausc_a)*wrG_a_ts*nG_a_ts;
% GDP_b_ts = y_b_ts + (1+tausc_b)*wrG_b_ts*nG_b_ts;

BG_a_ts = 2.4*GDP_a_ts;
BG_b_ts = 2.4*GDP_b_ts;

cG_a_ts = GDP_a_ts*gc_a;
cG_b_ts = GDP_b_ts*gc_b;

inG_a_ts = GDP_a_ts*gin_a;
inG_b_ts = GDP_b_ts*gin_b;

kG_a_ts = inG_a_ts/delta_a;
kG_b_ts = inG_b_ts/delta_b;

z_a = yG_a_ts/(kG_a_ts^eta_kG_a*nG_a_ts^eta_nG_a);
z_b = yG_b_ts/(kG_b_ts^eta_kG_b*nG_b_ts^eta_nG_b);

UB_a = rrs_a*wr_a_ts*(1-tauw_a);
UB_b = rrs_b*wr_b_ts*(1-tauw_b);

% If net exports=0 is assumed:
c_a_ts    = y_a_ts - in_a_ts - cG_a_ts - inG_a_ts; 
c_b_ts    = y_b_ts - in_b_ts - cG_b_ts - inG_b_ts;

y_c_ts = (y_a_ts+y_b_ts)/2;

cG_c_ts = gc_c*y_c_ts;
%inG_c_ts = gin_c*y_c_ts;
in_c_ts = in_c*y_c_ts;
c_c_ts = c_c*y_c_ts;

% Matching observed import shares to GDP ratios with openness parameters 
n_ab=0.130*GDP_a_ts/(c_a_ts+in_a_ts+cG_a_ts+inG_a_ts);%Government purchases added since they are GDP and
n_ac=0.229*GDP_a_ts/(c_a_ts+in_a_ts+cG_a_ts+inG_a_ts);% in observed imports included! (Otherwise n_a_b is too high!)
n_ba=0.066*GDP_b_ts/(c_b_ts+in_b_ts+cG_b_ts+inG_b_ts);
n_bc=n_ac;
%share in RoW consumption basket used to deliver trade balance = 0
n_ca=(n_ab*(c_a_ts+in_a_ts)+n_ac*(c_a_ts+in_a_ts)-pop_b/pop_a*n_ba*(c_b_ts+in_b_ts))/(pop_c/pop_a*(c_c_ts+in_c_ts));
n_cb=(n_ba*(c_b_ts+in_b_ts)+n_bc*(c_b_ts+in_b_ts)-pop_a/pop_b*n_ab*(c_a_ts+in_a_ts))/(pop_c/pop_b*(c_c_ts+in_c_ts));

n_aa=1-n_ab-n_ac;
n_bb=1-n_ba-n_bc;
n_cc=1-n_ca-n_cb;

% home bias calculation
 vtheta_ab    = n_ab/pop_b*(pop_a + pop_b + pop_c);
 vtheta_ac    = n_ac/pop_c*(pop_a + pop_b + pop_c);

 vtheta_ba   = n_ba/pop_a*(pop_a + pop_b + pop_c);
 vtheta_bc  = n_bc/(pop_c)*(pop_a + pop_b + pop_c);


% RoW demand must be such that net exports=0 is fulfilled (holds for
% country b implicitely)
%y_c_ts  = (c_a_ts+in_a_ts-n_aa*(c_a_ts+in_a_ts)-n_ab*(c_b_ts+in_b_ts))/(n_ac*(c_c+in_c));

nfa_a_ts=0;
nfa_b_ts=0;
nfa_c_ts=0;

B_c_ts   = 0;
B_ba_ts  = 0;
B_a_ts   = 0;
B_ac_ts  = 0;
B_bc_ts  = 0;

%If net exports not equal to 0 is assumed:




% c_a_ts = (cG_c_ts*n_ac*n_bb + inG_c_ts*n_ac*n_bb - cG_c_ts*n_ab*n_bc - inG_c_ts*n_ab*n_bc +... 
%      in_a_ts*n_ac*n_bb*n_ca - in_a_ts*n_ab*n_bc*n_ca - cG_b_ts*n_ac*n_cb - inG_b_ts*n_ac*n_cb -... 
%      in_a_ts*n_ac*n_ba*n_cb + cG_a_ts*n_bc*n_cb + inG_a_ts*n_bc*n_cb + in_a_ts*n_aa*n_bc*n_cb +... 
%      cG_b_ts*n_ab*n_cc + inG_b_ts*n_ab*n_cc + in_a_ts*n_ab*n_ba*n_cc - cG_a_ts*n_bb*n_cc -... 
%      inG_a_ts*n_bb*n_cc - in_a_ts*n_aa*n_bb*n_cc - n_bc*n_cb*y_a_ts + n_bb*n_cc*y_a_ts +... 
%      n_ac*n_cb*y_b_ts - n_ab*n_cc*y_b_ts - n_ac*n_bb*y_c_ts +... 
%      n_ab*n_bc*y_c_ts)/(-n_ac*n_bb*n_ca + n_ab*n_bc*n_ca + n_ac*n_ba*n_cb -...
%      n_aa*n_bc*n_cb - n_ab*n_ba*n_cc + n_aa*n_bb*n_cc); 
%  c_b_ts = (cG_c_ts*n_ac*n_ba + inG_c_ts*n_ac*n_ba - cG_c_ts*n_aa*n_bc - inG_c_ts*n_aa*n_bc -... 
%      cG_b_ts*n_ac*n_ca - inG_b_ts*n_ac*n_ca - in_b_ts*n_ac*n_bb*n_ca + cG_a_ts*n_bc*n_ca +... 
%      inG_a_ts*n_bc*n_ca + in_b_ts*n_ab*n_bc*n_ca + in_b_ts*n_ac*n_ba*n_cb -... 
%      in_b_ts*n_aa*n_bc*n_cb + cG_b_ts*n_aa*n_cc + inG_b_ts*n_aa*n_cc - cG_a_ts*n_ba*n_cc -... 
%      inG_a_ts*n_ba*n_cc - in_b_ts*n_ab*n_ba*n_cc + in_b_ts*n_aa*n_bb*n_cc - n_bc*n_ca*y_a_ts +... 
%      n_ba*n_cc*y_a_ts + n_ac*n_ca*y_b_ts - n_aa*n_cc*y_b_ts - n_ac*n_ba*y_c_ts +... 
%      n_aa*n_bc*y_c_ts)/(n_ac*n_bb*n_ca - n_ab*n_bc*n_ca - n_ac*n_ba*n_cb +... 
%      n_aa*n_bc*n_cb + n_ab*n_ba*n_cc - n_aa*n_bb*n_cc);
%  c_c_ts = -(-(-n_ab*n_ca +... 
%           n_aa*n_cb)*(-n_ba*(cG_a_ts + inG_a_ts + in_b_ts*n_ab + in_c_ts*n_ac - y_a_ts) +... 
%          n_aa*(cG_b_ts + inG_b_ts + in_b_ts*n_bb + in_c_ts*n_bc - y_b_ts)) + (-n_ab*n_ba +... 
%          n_aa*n_bb)*(-n_ca*(cG_a_ts + inG_a_ts + in_b_ts*n_ab + in_c_ts*n_ac - y_a_ts) +... 
%          n_aa*(cG_c_ts + inG_c_ts + in_b_ts*n_cb + in_c_ts*n_cc -... 
%             y_c_ts)))/(n_aa*(-n_ac*n_bb*n_ca + n_ab*n_bc*n_ca + n_ac*n_ba*n_cb -... 
%         n_aa*n_bc*n_cb - n_ab*n_ba*n_cc + n_aa*n_bb*n_cc));
% 
% c_c = c_c_ts/y_c_ts;

% nfa_a_ts=(y_a_ts-inG_a_ts-cG_a_ts-c_a_ts-in_a_ts)/(1-1/betta_a);
% nfa_b_ts=(y_b_ts-inG_b_ts-cG_b_ts-c_b_ts-in_b_ts)/(1-1/betta_b);
% nfa_c_ts=(y_c_ts-inG_c_ts-cG_c_ts-c_c_ts-in_c_ts)/(1-1/betta_a); %Das funktioniert auch!
%nfa_c_ts = (0 -pop_a*nfa_a_ts - pop_b*nfa_b_ts)/pop_c;

% B_c_ts   = nfa_c_ts;
% B_ba_ts  = 0; One bond position must be targeted (but in set_params.m file)
% B_a_ts   = -pop_b/pop_a*B_ba_ts;
% B_ac_ts  = nfa_a_ts + pop_b/pop_a*B_ba_ts;
% B_bc_ts  = nfa_b_ts - B_ba_ts;


c_r_a_ts    = c_a_ts; 
c_r_b_ts    = c_b_ts;

c_o_a_ts    = c_a_ts; 
c_o_b_ts    = c_b_ts;

c_tild_a_ts = c_o_a_ts;
c_tild_b_ts = c_o_b_ts;

lambda_o_a_ts = (c_tild_a_ts-hab_a*c_tild_a_ts)^(-sigma_a)/(1+tauc_a);
lambda_o_b_ts = (c_tild_b_ts-hab_b*c_tild_b_ts)^(-sigma_b)/(1+tauc_b);

%f_aa_ts    = ((1-betta_a*gamma_a)^(-1))*mcr_a_ts*y_a_ts*lambda_o_a_ts;
%h_aa_ts    = ((1-betta_a*gamma_a)^(-1))*(1-tau_a)*y_a_ts*lambda_o_a_ts;

%f_bb_ts    = ((1-betta_b*gamma_b)^(-1))*mcr_b_ts*y_b_ts*lambda_o_b_ts;
%h_bb_ts    = ((1-betta_b*gamma_b)^(-1))*(1-tau_b)*y_b_ts*lambda_o_b_ts;

kappaw_a_ts = lambda_o_a_ts*(wr_a_ts*(1-tauw_a)*nP_a_ts+wrG_a_ts*(1-tauw_a)*nG_a_ts+UB_a*(l_o_a_ts - n_a_ts))/(l_o_a_ts^psi_a*n_a_ts);
omega_o_a_ts = ((1-mu_a)*lambda_o_a_ts*UB_a)/(lambda_o_a_ts*UB_a-psi_a*l_o_a_ts^(psi_a-1)*n_a_ts*kappaw_a_ts);
omega_r_a_ts = ((mu_a)*lambda_o_a_ts*UB_a)/(lambda_o_a_ts*UB_a-psi_a*l_r_a_ts^(psi_a-1)*n_a_ts*kappaw_a_ts);

thetaw_a = (lambda_o_a_ts*wr_a_ts*(1-tauw_a)*(nP_a_ts - (omega_o_a_ts+omega_r_a_ts)*(nP_a_ts )))/(lambda_o_a_ts*nP_a_ts*wr_a_ts*(1-tauw_a) - kappaw_a_ts*nP_a_ts*n_a_ts^psi_a - UB_a*lambda_o_a_ts*nP_a_ts - (omega_o_a_ts+omega_r_a_ts)*(lambda_o_a_ts*wr_a_ts*(1-tauw_a)*nP_a_ts - UB_a*nP_a_ts*lambda_o_a_ts - kappaw_a_ts*nP_a_ts*l_o_a_ts^psi_a));    

kappaw_b_ts = lambda_o_b_ts*(wr_b_ts*(1-tauw_b)*nP_b_ts+wrG_b_ts*(1-tauw_b)*nG_b_ts+UB_b*(l_o_b_ts - n_b_ts))/(l_o_b_ts^psi_b*n_b_ts);
omega_o_b_ts = ((1-mu_b)*lambda_o_b_ts*UB_b)/(lambda_o_b_ts*UB_b-psi_b*l_o_b_ts^(psi_b-1)*n_b_ts*kappaw_b_ts);
omega_r_b_ts = ((mu_b)*lambda_o_b_ts*UB_b)/(lambda_o_b_ts*UB_b-psi_b*l_r_b_ts^(psi_b-1)*n_b_ts*kappaw_b_ts);

thetaw_b = (lambda_o_b_ts*wr_b_ts*(1-tauw_b)*(nP_b_ts - (omega_o_b_ts+omega_r_b_ts)*(nP_b_ts )))/(lambda_o_b_ts*nP_b_ts*wr_b_ts*(1-tauw_b) - kappaw_b_ts*nP_b_ts*n_b_ts^psi_b - UB_b*lambda_o_b_ts*nP_b_ts - (omega_o_b_ts+omega_r_b_ts)*(lambda_o_b_ts*wr_b_ts*(1-tauw_b)*nP_b_ts - UB_b*nP_b_ts*lambda_o_b_ts - kappaw_b_ts*nP_b_ts*l_o_b_ts^psi_b));    

ex_a_ts  = pop_b/pop_a*n_ba* (c_b_ts + in_b_ts) + pop_c/pop_a*n_ca*((c_c*y_c_ts) + (in_c*y_c_ts));
im_a_ts  = pr_ts*(n_ab*c_a_ts  + n_ab*in_a_ts)+ pr_ts*(n_ac*c_a_ts + n_ac*in_a_ts);

ex_b_ts  = pop_a/pop_b*n_ab*(c_a_ts + in_a_ts) + pop_c/pop_b*n_cb*((c_c*y_c_ts) + (in_c*y_c_ts));
im_b_ts  = pr_ts*(n_ba*c_b_ts + n_ba*in_b_ts) + pr_ts*(n_bc*c_b_ts + n_bc*in_b_ts);

TR_r_a_ts = ((1+tauc_a)*c_r_a_ts - (1-tauw_a)*(nP_a_ts*wr_a_ts+nG_a_ts*wrG_a_ts) - UB_a*(l_r_a_ts-n_a_ts));
TR_a_ts = gTR_a*y_a_ts - (l_a_ts-n_a_ts)*UB_a;
TR_o_a_ts = (TR_a_ts - mu_a*TR_r_a_ts)/(1-mu_a);
T_a_ts = ((cG_a_ts + inG_a_ts + (1+tausc_a)*wrG_a_ts*nG_a_ts + (l_a_ts-n_a_ts)*UB_a + TR_a_ts - (tauw_a+tausc_a)*(nP_a_ts*wr_a_ts+nG_a_ts*wrG_a_ts) - tauk_a*(rk_a_ts-delta_a)*k_a_ts - tau_a*y_a_ts - tauc_a*c_a_ts + (1+i_Ga_ts)*BG_a_ts/pi_ts - BG_a_ts)/(1-mu_a));

TR_r_b_ts = ((1+tauc_b)*c_r_b_ts - (1-tauw_b)*(nP_b_ts*wr_b_ts+nG_b_ts*wrG_b_ts) - UB_b*(l_r_b_ts-n_b_ts));
TR_b_ts = gTR_b*y_b_ts - (l_b_ts-n_b_ts)*UB_b;
TR_o_b_ts = (TR_b_ts - mu_b*TR_r_b_ts)/(1-mu_b);
T_b_ts = ((cG_b_ts + inG_b_ts + (1+tausc_b)*wrG_b_ts*nG_b_ts + (l_b_ts-n_b_ts)*UB_b + TR_b_ts - (tauw_b+tausc_b)*(nP_b_ts*wr_b_ts+nG_b_ts*wrG_b_ts) - tauk_b*(rk_b_ts-delta_b)*k_b_ts - tau_b*y_b_ts - tauc_b*c_b_ts + (1+i_Gb_ts)*BG_b_ts/pi_ts - BG_b_ts)/(1-mu_b));




 NumberOfParameters = M_.param_nbr;
         for i = 1:NumberOfParameters
%              paramname = deblank(M_.param_names(i,:));
             paramname = char(deblank(M_.param_names(i,:)));  %KB, adjusted so that paramnames is char that can enter eval function
             eval(['M_.params(' int2str(i) ')=' paramname ';']);
         end 
