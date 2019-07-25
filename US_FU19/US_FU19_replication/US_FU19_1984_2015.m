%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'US_FU19_1984_2015';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('US_FU19_1984_2015.log');
M_.exo_names = 'eZ';
M_.exo_names_tex = 'eZ';
M_.exo_names_long = 'eZ';
M_.exo_names = char(M_.exo_names, 'ep');
M_.exo_names_tex = char(M_.exo_names_tex, 'ep');
M_.exo_names_long = char(M_.exo_names_long, 'ep');
M_.exo_names = char(M_.exo_names, 'ew');
M_.exo_names_tex = char(M_.exo_names_tex, 'ew');
M_.exo_names_long = char(M_.exo_names_long, 'ew');
M_.exo_names = char(M_.exo_names, 'eb2');
M_.exo_names_tex = char(M_.exo_names_tex, 'eb2');
M_.exo_names_long = char(M_.exo_names_long, 'eb2');
M_.exo_names = char(M_.exo_names, 'emu');
M_.exo_names_tex = char(M_.exo_names_tex, 'emu');
M_.exo_names_long = char(M_.exo_names_long, 'emu');
M_.exo_names = char(M_.exo_names, 'eg');
M_.exo_names_tex = char(M_.exo_names_tex, 'eg');
M_.exo_names_long = char(M_.exo_names_long, 'eg');
M_.exo_names = char(M_.exo_names, 'ems');
M_.exo_names_tex = char(M_.exo_names_tex, 'ems');
M_.exo_names_long = char(M_.exo_names_long, 'ems');
M_.endo_names = 'mc';
M_.endo_names_tex = 'mc';
M_.endo_names_long = 'mc';
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'r_k');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_k');
M_.endo_names_long = char(M_.endo_names_long, 'r_k');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'L');
M_.endo_names_tex = char(M_.endo_names_tex, 'L');
M_.endo_names_long = char(M_.endo_names_long, 'L');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names_long = char(M_.endo_names_long, 'u');
M_.endo_names = char(M_.endo_names, 'k_bar');
M_.endo_names_tex = char(M_.endo_names_tex, 'k\_bar');
M_.endo_names_long = char(M_.endo_names_long, 'k_bar');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'Q');
M_.endo_names_tex = char(M_.endo_names_tex, 'Q');
M_.endo_names_long = char(M_.endo_names_long, 'Q');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'w_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'w\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'w_flex');
M_.endo_names = char(M_.endo_names, 'r_k_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_k\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'r_k_flex');
M_.endo_names = char(M_.endo_names, 'c_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'c_flex');
M_.endo_names = char(M_.endo_names, 'R_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'R_flex');
M_.endo_names = char(M_.endo_names, 'L_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'L\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'L_flex');
M_.endo_names = char(M_.endo_names, 'k_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'k\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'k_flex');
M_.endo_names = char(M_.endo_names, 'u_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'u\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'u_flex');
M_.endo_names = char(M_.endo_names, 'k_bar_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'k\_bar\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'k_bar_flex');
M_.endo_names = char(M_.endo_names, 'i_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'i_flex');
M_.endo_names = char(M_.endo_names, 'y_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'y_flex');
M_.endo_names = char(M_.endo_names, 'Q_flex');
M_.endo_names_tex = char(M_.endo_names_tex, 'Q\_flex');
M_.endo_names_long = char(M_.endo_names_long, 'Q_flex');
M_.endo_names = char(M_.endo_names, 'Z');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z');
M_.endo_names_long = char(M_.endo_names_long, 'Z');
M_.endo_names = char(M_.endo_names, 'lambda_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda\_p');
M_.endo_names_long = char(M_.endo_names_long, 'lambda_p');
M_.endo_names = char(M_.endo_names, 'lambda_w');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda\_w');
M_.endo_names_long = char(M_.endo_names_long, 'lambda_w');
M_.endo_names = char(M_.endo_names, 'b2');
M_.endo_names_tex = char(M_.endo_names_tex, 'b2');
M_.endo_names_long = char(M_.endo_names_long, 'b2');
M_.endo_names = char(M_.endo_names, 'mu');
M_.endo_names_tex = char(M_.endo_names_tex, 'mu');
M_.endo_names_long = char(M_.endo_names_long, 'mu');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'ms');
M_.endo_names_tex = char(M_.endo_names_tex, 'ms');
M_.endo_names_long = char(M_.endo_names_long, 'ms');
M_.endo_names = char(M_.endo_names, 'dy');
M_.endo_names_tex = char(M_.endo_names_tex, 'dy');
M_.endo_names_long = char(M_.endo_names_long, 'dy');
M_.endo_names = char(M_.endo_names, 'dc');
M_.endo_names_tex = char(M_.endo_names_tex, 'dc');
M_.endo_names_long = char(M_.endo_names_long, 'dc');
M_.endo_names = char(M_.endo_names, 'dinve');
M_.endo_names_tex = char(M_.endo_names_tex, 'dinve');
M_.endo_names_long = char(M_.endo_names_long, 'dinve');
M_.endo_names = char(M_.endo_names, 'dw');
M_.endo_names_tex = char(M_.endo_names_tex, 'dw');
M_.endo_names_long = char(M_.endo_names_long, 'dw');
M_.endo_names = char(M_.endo_names, 'pinfobs');
M_.endo_names_tex = char(M_.endo_names_tex, 'pinfobs');
M_.endo_names_long = char(M_.endo_names_long, 'pinfobs');
M_.endo_names = char(M_.endo_names, 'robs');
M_.endo_names_tex = char(M_.endo_names_tex, 'robs');
M_.endo_names_long = char(M_.endo_names_long, 'robs');
M_.endo_names = char(M_.endo_names, 'labobs');
M_.endo_names_tex = char(M_.endo_names_tex, 'labobs');
M_.endo_names_long = char(M_.endo_names_long, 'labobs');
M_.endo_names = char(M_.endo_names, 'AUX_EXO_LAG_39_0');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_EXO\_LAG\_39\_0');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_EXO_LAG_39_0');
M_.endo_names = char(M_.endo_names, 'AUX_EXO_LAG_40_0');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_EXO\_LAG\_40\_0');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_EXO_LAG_40_0');
M_.endo_partitions = struct();
M_.param_names = 'h';
M_.param_names_tex = 'h';
M_.param_names_long = 'h';
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'sigma_c');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_c');
M_.param_names_long = char(M_.param_names_long, 'sigma_c');
M_.param_names = char(M_.param_names, 'wLc');
M_.param_names_tex = char(M_.param_names_tex, 'wLc');
M_.param_names_long = char(M_.param_names_long, 'wLc');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'beta_bar');
M_.param_names_tex = char(M_.param_names_tex, 'beta\_bar');
M_.param_names_long = char(M_.param_names_long, 'beta_bar');
M_.param_names = char(M_.param_names, 'inv_adj_cost');
M_.param_names_tex = char(M_.param_names_tex, 'inv\_adj\_cost');
M_.param_names_long = char(M_.param_names_long, 'inv_adj_cost');
M_.param_names = char(M_.param_names, 'r_kSS');
M_.param_names_tex = char(M_.param_names_tex, 'r\_kSS');
M_.param_names_long = char(M_.param_names_long, 'r_kSS');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'invest_ratioSS');
M_.param_names_tex = char(M_.param_names_tex, 'invest\_ratioSS');
M_.param_names_long = char(M_.param_names_long, 'invest_ratioSS');
M_.param_names = char(M_.param_names, 'Phi');
M_.param_names_tex = char(M_.param_names_tex, 'Phi');
M_.param_names_long = char(M_.param_names_long, 'Phi');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'zeta_p');
M_.param_names_tex = char(M_.param_names_tex, 'zeta\_p');
M_.param_names_long = char(M_.param_names_long, 'zeta_p');
M_.param_names = char(M_.param_names, 'iota_p');
M_.param_names_tex = char(M_.param_names_tex, 'iota\_p');
M_.param_names_long = char(M_.param_names_long, 'iota_p');
M_.param_names = char(M_.param_names, 'lambda_pSS');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_pSS');
M_.param_names_long = char(M_.param_names_long, 'lambda_pSS');
M_.param_names = char(M_.param_names, 'zeta_w');
M_.param_names_tex = char(M_.param_names_tex, 'zeta\_w');
M_.param_names_long = char(M_.param_names_long, 'zeta_w');
M_.param_names = char(M_.param_names, 'nu_L');
M_.param_names_tex = char(M_.param_names_tex, 'nu\_L');
M_.param_names_long = char(M_.param_names_long, 'nu_L');
M_.param_names = char(M_.param_names, 'iota_w');
M_.param_names_tex = char(M_.param_names_tex, 'iota\_w');
M_.param_names_long = char(M_.param_names_long, 'iota_w');
M_.param_names = char(M_.param_names, 'lambda_wSS');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_wSS');
M_.param_names_long = char(M_.param_names_long, 'lambda_wSS');
M_.param_names = char(M_.param_names, 'rhoR');
M_.param_names_tex = char(M_.param_names_tex, 'rhoR');
M_.param_names_long = char(M_.param_names_long, 'rhoR');
M_.param_names = char(M_.param_names, 'psi1');
M_.param_names_tex = char(M_.param_names_tex, 'psi1');
M_.param_names_long = char(M_.param_names_long, 'psi1');
M_.param_names = char(M_.param_names, 'psi2');
M_.param_names_tex = char(M_.param_names_tex, 'psi2');
M_.param_names_long = char(M_.param_names_long, 'psi2');
M_.param_names = char(M_.param_names, 'psi3');
M_.param_names_tex = char(M_.param_names_tex, 'psi3');
M_.param_names_long = char(M_.param_names_long, 'psi3');
M_.param_names = char(M_.param_names, 'consumpt_ratioSS');
M_.param_names_tex = char(M_.param_names_tex, 'consumpt\_ratioSS');
M_.param_names_long = char(M_.param_names_long, 'consumpt_ratioSS');
M_.param_names = char(M_.param_names, 'capital_ratioSS');
M_.param_names_tex = char(M_.param_names_tex, 'capital\_ratioSS');
M_.param_names_long = char(M_.param_names_long, 'capital_ratioSS');
M_.param_names = char(M_.param_names, 'gSS');
M_.param_names_tex = char(M_.param_names_tex, 'gSS');
M_.param_names_long = char(M_.param_names_long, 'gSS');
M_.param_names = char(M_.param_names, 'capital_to_laborSS');
M_.param_names_tex = char(M_.param_names_tex, 'capital\_to\_laborSS');
M_.param_names_long = char(M_.param_names_long, 'capital_to_laborSS');
M_.param_names = char(M_.param_names, 'wSS');
M_.param_names_tex = char(M_.param_names_tex, 'wSS');
M_.param_names_long = char(M_.param_names_long, 'wSS');
M_.param_names = char(M_.param_names, 'ctrend');
M_.param_names_tex = char(M_.param_names_tex, 'ctrend');
M_.param_names_long = char(M_.param_names_long, 'ctrend');
M_.param_names = char(M_.param_names, 'const_pi');
M_.param_names_tex = char(M_.param_names_tex, 'const\_pi');
M_.param_names_long = char(M_.param_names_long, 'const_pi');
M_.param_names = char(M_.param_names, 'const_R');
M_.param_names_tex = char(M_.param_names_tex, 'const\_R');
M_.param_names_long = char(M_.param_names_long, 'const_R');
M_.param_names = char(M_.param_names, 'const_L');
M_.param_names_tex = char(M_.param_names_tex, 'const\_L');
M_.param_names_long = char(M_.param_names_long, 'const_L');
M_.param_names = char(M_.param_names, 'constebeta');
M_.param_names_tex = char(M_.param_names_tex, 'constebeta');
M_.param_names_long = char(M_.param_names_long, 'constebeta');
M_.param_names = char(M_.param_names, 'rhoZ');
M_.param_names_tex = char(M_.param_names_tex, 'rhoZ');
M_.param_names_long = char(M_.param_names_long, 'rhoZ');
M_.param_names = char(M_.param_names, 'rhob2');
M_.param_names_tex = char(M_.param_names_tex, 'rhob2');
M_.param_names_long = char(M_.param_names_long, 'rhob2');
M_.param_names = char(M_.param_names, 'rhog');
M_.param_names_tex = char(M_.param_names_tex, 'rhog');
M_.param_names_long = char(M_.param_names_long, 'rhog');
M_.param_names = char(M_.param_names, 'rhogZ');
M_.param_names_tex = char(M_.param_names_tex, 'rhogZ');
M_.param_names_long = char(M_.param_names_long, 'rhogZ');
M_.param_names = char(M_.param_names, 'rhomu');
M_.param_names_tex = char(M_.param_names_tex, 'rhomu');
M_.param_names_long = char(M_.param_names_long, 'rhomu');
M_.param_names = char(M_.param_names, 'rhop');
M_.param_names_tex = char(M_.param_names_tex, 'rhop');
M_.param_names_long = char(M_.param_names_long, 'rhop');
M_.param_names = char(M_.param_names, 'thetap');
M_.param_names_tex = char(M_.param_names_tex, 'thetap');
M_.param_names_long = char(M_.param_names_long, 'thetap');
M_.param_names = char(M_.param_names, 'rhow');
M_.param_names_tex = char(M_.param_names_tex, 'rhow');
M_.param_names_long = char(M_.param_names_long, 'rhow');
M_.param_names = char(M_.param_names, 'thetaw');
M_.param_names_tex = char(M_.param_names_tex, 'thetaw');
M_.param_names_long = char(M_.param_names_long, 'thetaw');
M_.param_names = char(M_.param_names, 'rhoms');
M_.param_names_tex = char(M_.param_names_tex, 'rhoms');
M_.param_names_long = char(M_.param_names_long, 'rhoms');
M_.param_names = char(M_.param_names, 'czcap');
M_.param_names_tex = char(M_.param_names_tex, 'czcap');
M_.param_names_long = char(M_.param_names_long, 'czcap');
M_.param_names = char(M_.param_names, 'curvp');
M_.param_names_tex = char(M_.param_names_tex, 'curvp');
M_.param_names_long = char(M_.param_names_long, 'curvp');
M_.param_names = char(M_.param_names, 'curvw');
M_.param_names_tex = char(M_.param_names_tex, 'curvw');
M_.param_names_long = char(M_.param_names_long, 'curvw');
M_.param_names = char(M_.param_names, 'invest_to_capitalbarSS');
M_.param_names_tex = char(M_.param_names_tex, 'invest\_to\_capitalbarSS');
M_.param_names_long = char(M_.param_names_long, 'invest_to_capitalbarSS');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 7;
M_.endo_nbr = 40;
M_.param_nbr = 47;
M_.orig_endo_nbr = 38;
M_.aux_vars(1).endo_index = 39;
M_.aux_vars(1).type = 3;
M_.aux_vars(1).orig_index = 2;
M_.aux_vars(1).orig_lead_lag = 0;
M_.aux_vars(2).endo_index = 40;
M_.aux_vars(2).type = 3;
M_.aux_vars(2).orig_index = 3;
M_.aux_vars(2).orig_lead_lag = 0;
M_.Sigma_e = zeros(7, 7);
M_.Correlation_matrix = eye(7, 7);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('US_FU19_1984_2015_static');
erase_compiled_function('US_FU19_1984_2015_dynamic');
M_.orig_eq_nbr = 38;
M_.eq_nbr = 40;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 21 0;
 1 22 61;
 0 23 62;
 2 24 63;
 3 25 64;
 4 26 0;
 0 27 65;
 0 28 0;
 0 29 0;
 5 30 0;
 6 31 66;
 0 32 67;
 7 33 0;
 0 34 0;
 0 35 68;
 8 36 69;
 0 37 0;
 0 38 70;
 0 39 0;
 0 40 0;
 9 41 0;
 10 42 71;
 11 43 0;
 0 44 72;
 12 45 0;
 13 46 0;
 14 47 0;
 15 48 0;
 16 49 0;
 17 50 0;
 18 51 0;
 0 52 0;
 0 53 0;
 0 54 0;
 0 55 0;
 0 56 0;
 0 57 0;
 0 58 0;
 19 59 0;
 20 60 0;]';
M_.nstatic = 14;
M_.nfwrd   = 6;
M_.npred   = 14;
M_.nboth   = 6;
M_.nsfwrd   = 12;
M_.nspred   = 20;
M_.ndynamic   = 26;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:7];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(40, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(7, 1);
M_.params = NaN(47, 1);
M_.NNZDerivatives = [160; 0; -1];
close all
M_.params( 9 ) = .025;
delta = M_.params( 9 );
M_.params( 19 ) = 0.5;
lambda_wSS = M_.params( 19 );
M_.params( 26 ) = 0.18;
gSS = M_.params( 26 );
M_.params( 45 ) = 10;
curvp = M_.params( 45 );
M_.params( 46 ) = 10;
curvw = M_.params( 46 );
M_.params( 12 ) = .22;
alpha = M_.params( 12 );
M_.params( 2 ) = 1.0039;
gamma = M_.params( 2 );
M_.params( 33 ) = 0.25;
constebeta = M_.params( 33 );
M_.params( 3 ) = 1.25;
sigma_c = M_.params( 3 );
cpie =          1.0063;
M_.params( 11 ) = 1.47;
Phi = M_.params( 11 );
M_.params( 37 ) = 0.49;
rhogZ = M_.params( 37 );
M_.params( 7 ) = 5.67;
inv_adj_cost = M_.params( 7 );
M_.params( 1 ) = 0.51;
h = M_.params( 1 );
M_.params( 16 ) = 0.81;
zeta_w = M_.params( 16 );
M_.params( 17 ) = 1.55;
nu_L = M_.params( 17 );
M_.params( 13 ) = 0.86;
zeta_p = M_.params( 13 );
M_.params( 18 ) = 0.44;
iota_w = M_.params( 18 );
M_.params( 14 ) = 0.25;
iota_p = M_.params( 14 );
M_.params( 44 ) = 0.9;
czcap = M_.params( 44 );
M_.params( 21 ) = 1.68;
psi1 = M_.params( 21 );
M_.params( 20 ) = 0.88;
rhoR = M_.params( 20 );
M_.params( 22 ) = 0.11;
psi2 = M_.params( 22 );
M_.params( 23 ) = 0.15;
psi3 = M_.params( 23 );
M_.params( 34 ) = 0.98;
rhoZ = M_.params( 34 );
M_.params( 35 ) = 0.9;
rhob2 = M_.params( 35 );
M_.params( 36 ) = 0.95;
rhog = M_.params( 36 );
M_.params( 38 ) = 0.75;
rhomu = M_.params( 38 );
M_.params( 43 ) = 0.48;
rhoms = M_.params( 43 );
M_.params( 39 ) = 0.77;
rhop = M_.params( 39 );
M_.params( 41 ) = 0.59;
rhow = M_.params( 41 );
M_.params( 40 ) = 0.66;
thetap = M_.params( 40 );
M_.params( 42 ) = 0.57;
thetaw = M_.params( 42 );
M_.params( 32 ) = 0.39;
const_L = M_.params( 32 );
M_.params( 5 ) = 1/(1+M_.params(33)/100);
beta = M_.params( 5 );
M_.params( 6 ) = M_.params(5)*M_.params(2)^(-M_.params(3));
beta_bar = M_.params( 6 );
M_.params( 29 ) = 100*(M_.params(2)-1);
ctrend = M_.params( 29 );
M_.params( 15 ) = M_.params(11)-1;
lambda_pSS = M_.params( 15 );
cr =                cpie/(beta*gamma^(-sigma_c));
M_.params( 8 ) = M_.params(5)^(-1)*M_.params(2)^M_.params(3)-(1-M_.params(9));
r_kSS = M_.params( 8 );
M_.params( 28 ) = (M_.params(12)^M_.params(12)*(1-M_.params(12))^(1-M_.params(12))/(M_.params(11)*M_.params(8)^M_.params(12)))^(1/(1-M_.params(12)));
wSS = M_.params( 28 );
M_.params( 47 ) = 1-(1-M_.params(9))/M_.params(2);
invest_to_capitalbarSS = M_.params( 47 );
M_.params( 27 ) = M_.params(12)/(1-M_.params(12))*M_.params(28)/M_.params(8);
capital_to_laborSS = M_.params( 27 );
M_.params( 25 ) = M_.params(11)*M_.params(27)^(1-M_.params(12));
capital_ratioSS = M_.params( 25 );
M_.params( 10 ) = M_.params(2)*(1-(1-M_.params(9))/M_.params(2))*M_.params(25);
invest_ratioSS = M_.params( 10 );
M_.params( 24 ) = 1-M_.params(26)-M_.params(2)*(1-(1-M_.params(9))/M_.params(2))*M_.params(25);
consumpt_ratioSS = M_.params( 24 );
M_.params( 4 ) = M_.params(25)*M_.params(8)*(1-M_.params(12))*1/(1+M_.params(19))/M_.params(12)/M_.params(24);
wLc = M_.params( 4 );
M_.params( 31 ) = 100*(cr-1);
const_R = M_.params( 31 );
M_.params( 30 ) = 100*(cpie-1);
const_pi = M_.params( 30 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.35)^2;
M_.Sigma_e(2, 2) = (0.08)^2;
M_.Sigma_e(3, 3) = (0.29)^2;
M_.Sigma_e(4, 4) = (0.19)^2;
M_.Sigma_e(5, 5) = (0.37)^2;
M_.Sigma_e(6, 6) = (0.41)^2;
M_.Sigma_e(7, 7) = (0.1)^2;
estim_params_.var_exo = zeros(0, 10);
estim_params_.var_endo = zeros(0, 10);
estim_params_.corrx = zeros(0, 11);
estim_params_.corrn = zeros(0, 11);
estim_params_.param_vals = zeros(0, 10);
estim_params_.var_exo = [estim_params_.var_exo; 1, 0.4618, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 4, 0.1818513, 0.025, 5, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 6, 0.6090, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 5, 0.46017, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 7, 0.2397, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, 0.1455, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, 0.2089, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 34, .9676, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 35, .2703, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 36, .9930, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 38, .5724, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 43, .3, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 39, .8692, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 41, .9546, .001, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 40, .7652, 0.01, .9999, 1, 0.5, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 42, .8936, 0.01, .9999, 1, 0.5, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, 6.3325, 2, 15, 3, 4, 1.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, 1.2312, 0.25, 3, 3, 1.50, 0.375, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 1, 0.7205, 0.001, 0.99, 1, 0.7, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 16, 0.7937, 0.3, 0.95, 1, 0.5, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 17, 2.8401, 0.25, 10, 3, 2, 0.75, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 13, 0.7813, 0.5, 0.95, 1, 0.5, 0.10, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 18, 0.4425, 0.01, 0.99, 1, 0.5, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 14, 0.3291, 0.01, 0.99, 1, 0.5, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 44, 0.2648, 0.01, 1, 1, 0.5, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 11, 1.4672, 1.0, 3, 3, 1.25, 0.125, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 21, 1.7985, 1.0, 3, 3, 1.5, 0.25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 20, 0.8258, 0.5, 0.975, 1, 0.75, 0.10, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 22, 0.0893, 0.001, 0.5, 3, 0.125, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 23, 0.2239, 0.001, 0.5, 3, 0.125, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 30, 0.7, 0.1, 2.0, 2, 0.625, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 33, 0.7420, 0.01, 2.0, 2, 0.25, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 32, 1.2918, (-10.0), 10.0, 3, 0.0, 2.0, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 29, 0.3982, 0.1, 0.8, 3, 0.4, 0.10, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 37, 0.05, 0.01, 2.0, 3, 0.5, 0.25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 12, 0.24, 0.01, 1.0, 3, 0.3, 0.05, NaN, NaN, NaN ];
options_.irf = 20;
options_.nograph = 1;
options_.nomoments = 1;
var_list_ = char('pinfobs','dy','robs','dc','dinve','labobs','dw');
info = stoch_simul(var_list_);
save('US_FU19_1984_2015_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('US_FU19_1984_2015_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('US_FU19_1984_2015_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('US_FU19_1984_2015_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('US_FU19_1984_2015_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('US_FU19_1984_2015_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('US_FU19_1984_2015_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off