function [ys,params1,check] = model_var_est_steadystate(ys,exe,M_,options_)

global M_ oo_

%% DO NOT CHANGE THIS PART.
%%
%% Here we load the values of the deep parameters in a loop.
%%

set_steadystate_31_08_aw1;
params1=M_.params;
NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for i = 1:NumberOfParameters                                  % Loop...
%   paramname = deblank(M_.param_names(i,:));                   %    Get the name of parameter i. 
  paramname = char(deblank(M_.param_names(i,:)));                   %    Get the name of parameter i. 
  eval([ paramname ' = M_.params(' int2str(i) ');']);         %    Get the value of parameter i.
end                                                           % End of the loop.  

check=0;


%*************************************************************************
% Determining the intitial values for steady state calculation
% (steady state calculated analytically; initial equal fin_a_tsl values)
%*************************************************************************

i_a_t   = i_a_ts;
i_b_t   = i_b_ts;
i_c_t   = i_c_ts;

i_Ga_t  = i_Ga_ts;
i_Gb_t  = i_Gb_ts;

i_ba_t  = i_a_ts;
i_ac_t  = i_a_ts;
i_bc_t  = i_a_ts;

i_policy_t = i_policy_ts;

y_a_t   = y_a_ts;
y_b_t   = y_b_ts;
y_c_t   = y_c_ts;
y_c_aux_t = y_c_ts;

dgdp_a_t = 0; 
dgdp_b_t = 0;

shock_eCG_a_t   = 0;
shock_einG_a_t  = 0;
shock_eTR_a_t   = 0;
shock_eT_a_t    = 0;
shock_etauw_a_t = 0;
shock_etausc_a_t= 0;
shock_etauc_a_t = 0;
shock_etauk_a_t = 0;
shock_enG_a_t  = 0;
shock_emg_a_t  = 0;

shock_eCG_b_t   = 0;
shock_einG_b_t  = 0;
shock_eTR_b_t   = 0;
shock_eT_b_t    = 0;
shock_etauw_b_t = 0;
shock_etausc_b_t= 0;
shock_etauc_b_t = 0;
shock_etauk_b_t = 0;
shock_enG_b_t  = 0;
shock_emg_b_t  = 0;
epsilon_enG_a_t  = 0;
epsilon_enG_b_t  = 0;

c_a_t   = c_a_ts;
c_b_t   = c_b_ts;

c_o_a_t   = c_o_a_ts;
c_o_b_t   = c_o_b_ts;

c_r_a_t   = c_r_a_ts;
c_r_b_t   = c_r_b_ts;

in_a_t  = in_a_ts;
in_b_t  = in_b_ts;

in_o_a_t  = in_o_a_ts;
in_o_b_t  = in_o_b_ts;

lambda_o_a_t  = lambda_o_a_ts;
lambda_o_b_t  = lambda_o_b_ts;

lambda_r_a_t  = lambda_o_a_ts;
lambda_r_b_t  = lambda_o_b_ts;

c_o_tild_a_t = c_tild_a_ts;
c_o_tild_b_t = c_tild_b_ts;

c_r_tild_a_t = c_tild_a_ts;
c_r_tild_b_t = c_tild_b_ts;

n_a_t   = n_a_ts;
n_b_t   = n_b_ts;

nP_a_t   = nP_a_ts;
nP_b_t   = nP_b_ts;

nG_a_t   = nG_a_ts;
nG_b_t   = nG_b_ts;

wr_a_t   = wr_a_ts;
wr_b_t   = wr_b_ts;

wrG_a_t   = wrG_a_ts;
wrG_b_t   = wrG_b_ts;

k_a_t   = k_a_ts;
k_b_t   = k_b_ts;

k_o_a_t   = k_o_a_ts;
k_o_b_t   = k_o_b_ts;

mcr_a_t  = mcr_a_ts;
mcr_b_t  = mcr_b_ts;

rk_a_t  = rk_a_ts;
rk_b_t  = rk_b_ts;

q_a_t   = q_a_ts;
q_b_t   = q_b_ts;

ex_a_t  = ex_a_ts;
im_a_t  = im_a_ts;
ex_b_t  = ex_b_ts;
im_b_t  = im_b_ts;

Rk_a_t=i_a_ts;
Rk_b_t=i_a_ts;

l_o_a_t = l_o_a_ts;
l_o_b_t = l_o_b_ts;

l_r_a_t = l_r_a_ts;
l_r_b_t = l_r_b_ts;

l_a_t = l_a_ts;
l_b_t = l_b_ts;

kappaw_a_t = kappaw_a_ts;
kappaw_b_t = kappaw_b_ts;

ur_a_t = ur_a_ts;
ur_b_t = ur_b_ts;

cG_a_t = cG_a_ts;
cG_b_t = cG_b_ts;

tauw_a_t = tauw_a;
tauw_b_t =tauw_b;

tausc_a_t = tausc_a;
tausc_b_t = tausc_b;

tauk_a_t = tauk_a;
tauk_b_t = tauk_b;

tauc_a_t = tauc_a;
tauc_b_t = tauc_b;

TR_r_a_t = TR_r_a_ts;
TR_r_b_t = TR_r_b_ts;

TR_o_a_t = TR_o_a_ts;
TR_o_b_t = TR_o_b_ts;

TR_a_t = TR_a_ts;
TR_b_t = TR_b_ts;

T_a_t = T_a_ts;
T_b_t = T_b_ts;

UB_a_t = UB_a;
UB_b_t = UB_b;

BG_a_t = BG_a_ts;
BG_b_t = BG_b_ts;

kG_a_t   = kG_a_ts;
kG_b_t   = kG_b_ts;

yG_a_t   = yG_a_ts;
yG_b_t   = yG_b_ts;

inG_a_t  = inG_a_ts;
inG_b_t  = inG_b_ts;

GDP_a_t   = GDP_a_ts;
GDP_b_t   = GDP_b_ts;

omega_o_a_t = omega_o_a_ts;
omega_o_b_t = omega_o_b_ts;

omega_r_a_t = omega_r_a_ts;
omega_r_b_t = omega_r_b_ts;

pi_w_a_t = pi_ts;
pi_w_b_t = pi_ts;

ap_aa_t      = pi_ts;
ap_bb_t      = pi_ts;

%f_aa_t      = f_aa_ts;
%h_aa_t      = h_aa_ts;
%f_bb_t      = f_bb_ts;
%h_bb_t      = h_bb_ts;

PR_star_aa_t = pr_ts;
PR_star_bb_t = pr_ts;

pr_aa_t  = pr_ts;
pr_ba_t  = pr_ts;
pr_ca_t  = pr_ts;
pi_a_t   = pi_ts;

pr_ab_t  = pr_ts;
pr_bb_t  = pr_ts;
pr_cb_t  = pr_ts;
pi_b_t   = pi_ts;

pr_ac_t  = pr_ts;
pr_bc_t  = pr_ts;
pr_cc_t  = pr_ts;
pi_c_t   = pi_ts;

pi_aa_t = pi_ts;
pi_bb_t = pi_ts;
pi_cc_t = pi_ts;
pi_ab_t = pi_ts;
pi_ac_t = pi_ts;
pi_ba_t = pi_ts;
pi_bc_t = pi_ts;
pi_ca_t = pi_ts;
pi_cb_t = pi_ts;

c_o_aa_t = n_aa*c_o_a_ts;
c_r_aa_t = n_aa*c_r_a_ts;
c_aa_t = mu_a*n_aa*c_r_a_ts + (1-mu_a)*n_aa*c_o_a_ts;

c_o_ab_t = n_ab*c_o_a_ts;
c_r_ab_t = n_ab*c_r_a_ts;
c_ab_t = mu_a*n_ab*c_r_a_ts + (1-mu_a)*n_ab*c_o_a_ts;

c_o_ac_t = n_ac*c_o_a_ts;
c_r_ac_t = n_ac*c_r_a_ts;
c_ac_t = mu_a*n_ac*c_r_a_ts + (1-mu_a)*n_ac*c_o_a_ts;

c_o_ba_t = n_ba*c_o_b_ts;
c_r_ba_t = n_ba*c_r_b_ts;
c_ba_t = mu_b*n_ba*c_r_b_ts + (1-mu_b)*n_ba*c_o_b_ts;

c_o_bb_t = n_bb*c_o_b_ts;
c_r_bb_t = n_bb*c_r_b_ts;
c_bb_t = mu_b*n_bb*c_r_b_ts + (1-mu_b)*n_bb*c_o_b_ts;

c_o_bc_t = n_bc*c_o_b_ts;
c_r_bc_t = n_bc*c_r_b_ts;
c_bc_t = mu_b*n_bc*c_r_b_ts + (1-mu_b)*n_bc*c_o_b_ts;

in_o_aa_t = n_aa*in_o_a_ts;
in_aa_t = (1-mu_a)*n_aa*in_o_a_ts;

in_o_ab_t = n_ab*in_o_a_ts;
in_ab_t = (1-mu_a)*n_ab*in_o_a_ts;

in_o_ac_t = n_ac*in_o_a_ts;
in_ac_t = (1-mu_a)*n_ac*in_o_a_ts;

in_o_ba_t = n_ba*in_o_b_ts;
in_ba_t = (1-mu_b)*n_ba*in_o_b_ts;

in_o_bb_t = n_bb*in_o_b_ts;
in_bb_t = (1-mu_b)*n_bb*in_o_b_ts;

in_o_bc_t = n_bc*in_o_b_ts;
in_bc_t = (1-mu_b)*n_bc*in_o_b_ts;

Del_S_ba_t = 1;
Del_S_bc_t  = 1;
Del_S_ac_t = 1;
Del_S_ab_t = 1;
Del_S_cb_t = 1;
Del_S_ca_t= 1;

S_ba_t = 1;
S_bc_t = 1;
S_ac_t = 1;

rer_ba_t  = 1;
rer_ca_t  = 1;
rer_bc_t  = 1;
rer_ac_t  = 1;

B_c_t = B_c_ts;
B_ac_t = B_ac_ts; 
B_bc_t = B_bc_ts;
B_a_t = B_a_ts;
B_ba_t = B_ba_ts;

nfa_a_t = nfa_a_ts;
nfa_b_t = nfa_b_ts;
nfa_c_t = nfa_c_ts;

ca_a_t =0;
ca_b_t =0;
ca_c_t =0;

a_a_t=0;
a_b_t=0;
a_c_t=0;
z_g_t = 0;

e_b_a_t=0;
e_b_b_t=0;

e_n_a_t=0;
e_n_b_t=0;

e_in_a_t=0;
e_in_b_t=0;

e_rp_a_t=0;
e_rp_b_t=0;

e_RoW_a_t=0;
e_RoW_b_t=0;

e_RoE_a_t=0;
e_RoE_b_t=0;

e_tau_a_t=0;
e_tau_b_t=0;

mg_a_t=mg_a;
mg_b_t=mg_a;

pi_c_var_t=0;
i_c_var_t=0;
y_c_var_t=0;

BG_a_obs=0;
BG_b_obs=0;

y_a_obs =0;
y_b_obs =0;
y_c_obs =0;

c_a_obs =0;
c_b_obs =0;

in_a_obs =0;
in_b_obs =0;

n_a_obs =0;
n_b_obs =0;

wr_a_obs =0;
wr_b_obs =0;

pi_a_obs =0;
pi_b_obs =0;
pi_c_obs =0;

ca_a_obs =0;
ca_b_obs =0;
ca_c_obs =0;

i_EMU_obs =0;
i_c_obs =0;

l_a_obs =0;
l_b_obs =0;

ur_a_obs =0;
ur_b_obs =0;

ur_a_dif =0;
ur_b_dif =0;

def_a_obs = 0;
def_b_obs = 0;

theta_a_t = theta_a;
theta_b_t = theta_b;

thetaw_a_t = thetaw_a;
thetaw_b_t = thetaw_b;

 %  epsilon_enG_a_t = 0;
 %  epsilon_enG_b_t = 0;
   
   ger_gdp = gamma_a;
   ger_infl_gdp = 0;
   ger_priv_cns = gamma_a;
   ger_infl_cns_nds = 0;
   ger_priv_inv = gamma_a;
   ger_priv_inv_dur = gamma_a;
   ger_exp = gamma_a;
   ger_exp_euro = gamma_a;
   ger_exp_row = gamma_a;
   ger_emp = 0;
   ger_priv_emp = 0;
   ger_wage = gamma_a;
   ger_priv_wage = gamma_a;
   ger_comp = gamma_a;
   ger_u_rate = 0;
   ger_u_benefits = gamma_a;
   ger_gov_emp = 0;
   ger_gov_comp = gamma_a;
   ger_gov_wage = gamma_a;
   ger_gov_spn = gamma_a;
   ger_gov_cns = gamma_a;
   ger_transfers = gamma_a;
   ger_gov_inv = gamma_a;
   ger_tax_lab = gamma_a;
   ger_taxrate_lab_total = 0;
   ger_tax_cap = gamma_a;
   ger_taxrate_cap = 0;
   cap_tax_a_t = log(tauk_a*(rk_a_ts-delta_a)*k_a_ts);
   ger_tax_cns = gamma_a;
   ger_taxrate_cns = 0;
   ger_taxrate_socer = 0;
   ger_gov_deficit_ratio = 0;
   eur_gdp = gamma_b;
   eur_infl_gdp = 0;
   eur_priv_cns = gamma_b;
   eur_infl_cns_nds = 0;
   eur_priv_inv = gamma_b;
   eur_priv_inv_dur = gamma_b;
   eur_exp = gamma_b;
   eur_exp_ger = gamma_b;
   eur_exp_row = gamma_b;
   eur_emp = 0;
   eur_priv_emp = 0;
   eur_wage = gamma_b;
   eur_priv_wage = gamma_b;
   eur_comp = gamma_b; 
   eur_u_rate = 0;
   eur_i3m = 0;
   eur_gov_emp = 0;
   eur_gov_comp = gamma_b;
   eur_gov_wage = gamma_b;   
   eur_gov_spn = gamma_b;
   eur_transfers = gamma_b;
   eur_gov_cns = gamma_b;
   eur_gov_inv = gamma_b;
   eur_tax_lab = gamma_b;
   eur_taxrate_lab_total = 0;
   eur_tax_cap = gamma_b;
   eur_taxrate_cap = 0;
   cap_tax_b_t = log(tauk_b*(rk_b_ts-delta_b)*k_b_ts);
   eur_tax_cns = gamma_b;
   eur_taxrate_cns = 0;
   eur_taxrate_socer = 0;
   eur_gov_deficit_ratio = 0;
   row_gdp = 0;
   row_infl_gdp = 0;
   row_i3m = 0;



   e_cg_a_t = 0;
   e_cg_b_t = 0;
   e_ing_a_t = 0;
   e_ing_b_t = 0;
   e_Tr_a_t = 0;
   e_Tr_b_t = 0;
   e_tauw_a_t = 0;
   e_tauw_b_t = 0;
   
   
  endoList = M_.endo_names(~startsWith(M_.endo_names, "AUX_"));   
  NumberOfEndogenousVariables = numel(endoList);     
  ys = zeros(NumberOfEndogenousVariables,1);                    % Initialization of ys (steady state).
for i = 1:NumberOfEndogenousVariables                         % Loop...
%   varname = deblank(M_.endo_names(i,:)); %    Get the name of endogenous variable i.                      
  varname = char(deblank(endoList(i,:))); %    Get the name of endogenous variable i.
  eval(['ys(' int2str(i) ') = ' varname ';']);              %    Get the steady state value of this variable.
end   

