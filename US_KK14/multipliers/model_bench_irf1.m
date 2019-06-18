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
M_.fname = 'model_bench_irf1';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('model_bench_irf1.log');
M_.exo_names = 'e_i';
M_.exo_names_tex = 'e\_i';
M_.exo_names_long = 'e_i';
M_.exo_names = char(M_.exo_names, 'e_z');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_z');
M_.exo_names_long = char(M_.exo_names_long, 'e_z');
M_.exo_names = char(M_.exo_names, 'e_q');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_q');
M_.exo_names_long = char(M_.exo_names_long, 'e_q');
M_.exo_names = char(M_.exo_names, 'eps_m');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_m');
M_.exo_names_long = char(M_.exo_names_long, 'eps_m');
M_.exo_names = char(M_.exo_names, 'eps_cg');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_cg');
M_.exo_names_long = char(M_.exo_names_long, 'eps_cg');
M_.exo_names = char(M_.exo_names, 'eps_tr');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_tr');
M_.exo_names_long = char(M_.exo_names_long, 'eps_tr');
M_.exo_names = char(M_.exo_names, 'eps_tauk');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_tauk');
M_.exo_names_long = char(M_.exo_names_long, 'eps_tauk');
M_.exo_names = char(M_.exo_names, 'eps_tauw');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_tauw');
M_.exo_names_long = char(M_.exo_names_long, 'eps_tauw');
M_.endo_names = 'MUL';
M_.endo_names_tex = 'MUL';
M_.endo_names_long = 'MUL';
M_.endo_names = char(M_.endo_names, 'MRS');
M_.endo_names_tex = char(M_.endo_names_tex, 'MRS');
M_.endo_names_long = char(M_.endo_names_long, 'MRS');
M_.endo_names = char(M_.endo_names, 'chi');
M_.endo_names_tex = char(M_.endo_names_tex, 'chi');
M_.endo_names_long = char(M_.endo_names_long, 'chi');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'inf_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'inf\_p');
M_.endo_names_long = char(M_.endo_names_long, 'inf_p');
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names_long = char(M_.endo_names_long, 'u');
M_.endo_names = char(M_.endo_names, 'Rb');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rb');
M_.endo_names_long = char(M_.endo_names_long, 'Rb');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'lp');
M_.endo_names_tex = char(M_.endo_names_tex, 'lp');
M_.endo_names_long = char(M_.endo_names_long, 'lp');
M_.endo_names = char(M_.endo_names, 'rk');
M_.endo_names_tex = char(M_.endo_names_tex, 'rk');
M_.endo_names_long = char(M_.endo_names_long, 'rk');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'inf_w');
M_.endo_names_tex = char(M_.endo_names_tex, 'inf\_w');
M_.endo_names_long = char(M_.endo_names_long, 'inf_w');
M_.endo_names = char(M_.endo_names, 'tax');
M_.endo_names_tex = char(M_.endo_names_tex, 'tax');
M_.endo_names_long = char(M_.endo_names_long, 'tax');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names_long = char(M_.endo_names_long, 'b');
M_.endo_names = char(M_.endo_names, 'tau_w');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_w');
M_.endo_names_long = char(M_.endo_names_long, 'tau_w');
M_.endo_names = char(M_.endo_names, 'tau_k');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_k');
M_.endo_names_long = char(M_.endo_names_long, 'tau_k');
M_.endo_names = char(M_.endo_names, 'cg');
M_.endo_names_tex = char(M_.endo_names_tex, 'cg');
M_.endo_names_long = char(M_.endo_names_long, 'cg');
M_.endo_names = char(M_.endo_names, 'eps_i');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_i');
M_.endo_names_long = char(M_.endo_names_long, 'eps_i');
M_.endo_names = char(M_.endo_names, 'eps_z');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_z');
M_.endo_names_long = char(M_.endo_names_long, 'eps_z');
M_.endo_names = char(M_.endo_names, 'eps_q');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_q');
M_.endo_names_long = char(M_.endo_names_long, 'eps_q');
M_.endo_names = char(M_.endo_names, 'tr');
M_.endo_names_tex = char(M_.endo_names_tex, 'tr');
M_.endo_names_long = char(M_.endo_names_long, 'tr');
M_.endo_names = char(M_.endo_names, 'GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'GDP');
M_.endo_names_long = char(M_.endo_names_long, 'GDP');
M_.endo_names = char(M_.endo_names, 'tax_rev_tauw');
M_.endo_names_tex = char(M_.endo_names_tex, 'tax\_rev\_tauw');
M_.endo_names_long = char(M_.endo_names_long, 'tax_rev_tauw');
M_.endo_names = char(M_.endo_names, 'tax_rev_tauk');
M_.endo_names_tex = char(M_.endo_names_tex, 'tax\_rev\_tauk');
M_.endo_names_long = char(M_.endo_names_long, 'tax_rev_tauk');
M_.endo_partitions = struct();
M_.param_names = 'nbeta';
M_.param_names_tex = 'nbeta';
M_.param_names_long = 'nbeta';
M_.param_names = char(M_.param_names, 'nalpha');
M_.param_names_tex = char(M_.param_names_tex, 'nalpha');
M_.param_names_long = char(M_.param_names_long, 'nalpha');
M_.param_names = char(M_.param_names, 'sigma_l');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_l');
M_.param_names_long = char(M_.param_names_long, 'sigma_l');
M_.param_names = char(M_.param_names, 'sigma_c');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_c');
M_.param_names_long = char(M_.param_names_long, 'sigma_c');
M_.param_names = char(M_.param_names, 'theta_w');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_w');
M_.param_names_long = char(M_.param_names_long, 'theta_w');
M_.param_names = char(M_.param_names, 'theta_p');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_p');
M_.param_names_long = char(M_.param_names_long, 'theta_p');
M_.param_names = char(M_.param_names, 'gamma_w');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_w');
M_.param_names_long = char(M_.param_names_long, 'gamma_w');
M_.param_names = char(M_.param_names, 'gamma_p');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_p');
M_.param_names_long = char(M_.param_names_long, 'gamma_p');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'nu');
M_.param_names_tex = char(M_.param_names_tex, 'nu');
M_.param_names_long = char(M_.param_names_long, 'nu');
M_.param_names = char(M_.param_names, 'sigma_u');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_u');
M_.param_names_long = char(M_.param_names_long, 'sigma_u');
M_.param_names = char(M_.param_names, 'h');
M_.param_names_tex = char(M_.param_names_tex, 'h');
M_.param_names_long = char(M_.param_names_long, 'h');
M_.param_names = char(M_.param_names, 'rho_R');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_R');
M_.param_names_long = char(M_.param_names_long, 'rho_R');
M_.param_names = char(M_.param_names, 'rho_pi');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_pi');
M_.param_names_long = char(M_.param_names_long, 'rho_pi');
M_.param_names = char(M_.param_names, 'rho_y');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_y');
M_.param_names_long = char(M_.param_names_long, 'rho_y');
M_.param_names = char(M_.param_names, 'rho_w');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_w');
M_.param_names_long = char(M_.param_names_long, 'rho_w');
M_.param_names = char(M_.param_names, 'rho_k');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_k');
M_.param_names_long = char(M_.param_names_long, 'rho_k');
M_.param_names = char(M_.param_names, 'rho_cg');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_cg');
M_.param_names_long = char(M_.param_names_long, 'rho_cg');
M_.param_names = char(M_.param_names, 'rho_eps_i');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_eps\_i');
M_.param_names_long = char(M_.param_names_long, 'rho_eps_i');
M_.param_names = char(M_.param_names, 'rho_eps_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_eps\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_eps_z');
M_.param_names = char(M_.param_names, 'rho_eps_q');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_eps\_q');
M_.param_names_long = char(M_.param_names_long, 'rho_eps_q');
M_.param_names = char(M_.param_names, 'rho_tr');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tr');
M_.param_names_long = char(M_.param_names_long, 'rho_tr');
M_.param_names = char(M_.param_names, 'cgy');
M_.param_names_tex = char(M_.param_names_tex, 'cgy');
M_.param_names_long = char(M_.param_names_long, 'cgy');
M_.param_names = char(M_.param_names, 'tau_k_SS');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_k\_SS');
M_.param_names_long = char(M_.param_names_long, 'tau_k_SS');
M_.param_names = char(M_.param_names, 'tau_w_SS');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_w\_SS');
M_.param_names_long = char(M_.param_names_long, 'tau_w_SS');
M_.param_names = char(M_.param_names, 'l_SS');
M_.param_names_tex = char(M_.param_names_tex, 'l\_SS');
M_.param_names_long = char(M_.param_names_long, 'l_SS');
M_.param_names = char(M_.param_names, 'R_SS');
M_.param_names_tex = char(M_.param_names_tex, 'R\_SS');
M_.param_names_long = char(M_.param_names_long, 'R_SS');
M_.param_names = char(M_.param_names, 'tr_o_y');
M_.param_names_tex = char(M_.param_names_tex, 'tr\_o\_y');
M_.param_names_long = char(M_.param_names_long, 'tr_o_y');
M_.param_names = char(M_.param_names, 'rho_P');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_P');
M_.param_names_long = char(M_.param_names_long, 'rho_P');
M_.param_names = char(M_.param_names, 'rho_L');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_L');
M_.param_names_long = char(M_.param_names_long, 'rho_L');
M_.param_names = char(M_.param_names, 'etaWk');
M_.param_names_tex = char(M_.param_names_tex, 'etaWk');
M_.param_names_long = char(M_.param_names_long, 'etaWk');
M_.param_names = char(M_.param_names, 'etaWb');
M_.param_names_tex = char(M_.param_names_tex, 'etaWb');
M_.param_names_long = char(M_.param_names_long, 'etaWb');
M_.param_names = char(M_.param_names, 'etaWy');
M_.param_names_tex = char(M_.param_names_tex, 'etaWy');
M_.param_names_long = char(M_.param_names_long, 'etaWy');
M_.param_names = char(M_.param_names, 'etaWc');
M_.param_names_tex = char(M_.param_names_tex, 'etaWc');
M_.param_names_long = char(M_.param_names_long, 'etaWc');
M_.param_names = char(M_.param_names, 'etaWh');
M_.param_names_tex = char(M_.param_names_tex, 'etaWh');
M_.param_names_long = char(M_.param_names_long, 'etaWh');
M_.param_names = char(M_.param_names, 'etaWw');
M_.param_names_tex = char(M_.param_names_tex, 'etaWw');
M_.param_names_long = char(M_.param_names_long, 'etaWw');
M_.param_names = char(M_.param_names, 'etaWI');
M_.param_names_tex = char(M_.param_names_tex, 'etaWI');
M_.param_names_long = char(M_.param_names_long, 'etaWI');
M_.param_names = char(M_.param_names, 'etaWpi');
M_.param_names_tex = char(M_.param_names_tex, 'etaWpi');
M_.param_names_long = char(M_.param_names_long, 'etaWpi');
M_.param_names = char(M_.param_names, 'etaWR');
M_.param_names_tex = char(M_.param_names_tex, 'etaWR');
M_.param_names_long = char(M_.param_names_long, 'etaWR');
M_.param_names = char(M_.param_names, 'etaKk');
M_.param_names_tex = char(M_.param_names_tex, 'etaKk');
M_.param_names_long = char(M_.param_names_long, 'etaKk');
M_.param_names = char(M_.param_names, 'etaKb');
M_.param_names_tex = char(M_.param_names_tex, 'etaKb');
M_.param_names_long = char(M_.param_names_long, 'etaKb');
M_.param_names = char(M_.param_names, 'etaKy');
M_.param_names_tex = char(M_.param_names_tex, 'etaKy');
M_.param_names_long = char(M_.param_names_long, 'etaKy');
M_.param_names = char(M_.param_names, 'etaKc');
M_.param_names_tex = char(M_.param_names_tex, 'etaKc');
M_.param_names_long = char(M_.param_names_long, 'etaKc');
M_.param_names = char(M_.param_names, 'etaKh');
M_.param_names_tex = char(M_.param_names_tex, 'etaKh');
M_.param_names_long = char(M_.param_names_long, 'etaKh');
M_.param_names = char(M_.param_names, 'etaKw');
M_.param_names_tex = char(M_.param_names_tex, 'etaKw');
M_.param_names_long = char(M_.param_names_long, 'etaKw');
M_.param_names = char(M_.param_names, 'etaKI');
M_.param_names_tex = char(M_.param_names_tex, 'etaKI');
M_.param_names_long = char(M_.param_names_long, 'etaKI');
M_.param_names = char(M_.param_names, 'etaKpi');
M_.param_names_tex = char(M_.param_names_tex, 'etaKpi');
M_.param_names_long = char(M_.param_names_long, 'etaKpi');
M_.param_names = char(M_.param_names, 'etaKR');
M_.param_names_tex = char(M_.param_names_tex, 'etaKR');
M_.param_names_long = char(M_.param_names_long, 'etaKR');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 8;
M_.endo_nbr = 29;
M_.param_nbr = 48;
M_.orig_endo_nbr = 29;
M_.aux_vars = [];
M_.Sigma_e = zeros(8, 8);
M_.Correlation_matrix = eye(8, 8);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('model_bench_irf1_static');
erase_compiled_function('model_bench_irf1_dynamic');
M_.orig_eq_nbr = 29;
M_.eq_nbr = 29;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 14 0;
 0 15 0;
 0 16 43;
 1 17 0;
 0 18 44;
 0 19 0;
 0 20 45;
 0 21 0;
 0 22 0;
 0 23 0;
 2 24 46;
 3 25 47;
 0 26 0;
 0 27 48;
 4 28 0;
 5 29 0;
 0 30 49;
 0 31 0;
 6 32 0;
 7 33 0;
 8 34 50;
 9 35 0;
 10 36 0;
 11 37 0;
 12 38 51;
 13 39 0;
 0 40 0;
 0 41 0;
 0 42 0;]';
M_.nstatic = 11;
M_.nfwrd   = 5;
M_.npred   = 9;
M_.nboth   = 4;
M_.nsfwrd   = 9;
M_.nspred   = 13;
M_.ndynamic   = 18;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:8];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(29, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(8, 1);
M_.params = NaN(48, 1);
M_.NNZDerivatives = [133; -1; -1];
M_.params( 24 ) = 0.1929;
tau_k_SS = M_.params( 24 );
M_.params( 25 ) = 0.2088;
tau_w_SS = M_.params( 25 );
M_.params( 27 ) = 1.013;
R_SS = M_.params( 27 );
M_.params( 23 ) = 0.085;
cgy = M_.params( 23 );
M_.params( 28 ) = 0.105;
tr_o_y = M_.params( 28 );
M_.params( 26 ) = 0.3333333333333333;
l_SS = M_.params( 26 );
M_.params( 1 ) = 0.9935;
nbeta = M_.params( 1 );
M_.params( 2 ) = 0.36;
nalpha = M_.params( 2 );
M_.params( 9 ) = 0.025;
delta = M_.params( 9 );
cg_SS2=0;
M_.params( 4 ) = 1.5;
sigma_c = M_.params( 4 );
M_.params( 12 ) = 0.7;
h = M_.params( 12 );
M_.params( 3 ) = 2;
sigma_l = M_.params( 3 );
M_.params( 11 ) = 2;
sigma_u = M_.params( 11 );
M_.params( 10 ) = 5;
nu = M_.params( 10 );
M_.params( 8 ) = 0.7;
gamma_p = M_.params( 8 );
M_.params( 6 ) = 6;
theta_p = M_.params( 6 );
M_.params( 7 ) = 0.7;
gamma_w = M_.params( 7 );
M_.params( 5 ) = 11;
theta_w = M_.params( 5 );
M_.params( 13 ) = 0.8;
rho_R = M_.params( 13 );
M_.params( 14 ) = 2.1;
rho_pi = M_.params( 14 );
M_.params( 15 ) = 0.125;
rho_y = M_.params( 15 );
M_.params( 18 ) = 0.85;
rho_cg = M_.params( 18 );
M_.params( 22 ) = 0.85;
rho_tr = M_.params( 22 );
M_.params( 19 ) = 0.85;
rho_eps_i = M_.params( 19 );
M_.params( 20 ) = 0.85;
rho_eps_z = M_.params( 20 );
M_.params( 21 ) = 0.85;
rho_eps_q = M_.params( 21 );
M_.params( 30 ) = 0;
rho_L = M_.params( 30 );
M_.params( 29 ) = 0;
rho_P = M_.params( 29 );
M_.params( 16 ) = 0.7535;
rho_w = M_.params( 16 );
M_.params( 31 ) = 0;
etaWk = M_.params( 31 );
M_.params( 32 ) = 0.2;
etaWb = M_.params( 32 );
M_.params( 33 ) = 0;
etaWy = M_.params( 33 );
M_.params( 34 ) = 0;
etaWc = M_.params( 34 );
M_.params( 35 ) = 0;
etaWh = M_.params( 35 );
M_.params( 36 ) = 0;
etaWw = M_.params( 36 );
M_.params( 37 ) = 0;
etaWI = M_.params( 37 );
M_.params( 38 ) = 0;
etaWpi = M_.params( 38 );
M_.params( 39 ) = 0;
etaWR = M_.params( 39 );
M_.params( 17 ) = 0.9029;
rho_k = M_.params( 17 );
M_.params( 40 ) = 0;
etaKk = M_.params( 40 );
M_.params( 41 ) = 0.2;
etaKb = M_.params( 41 );
M_.params( 42 ) = 0;
etaKy = M_.params( 42 );
M_.params( 43 ) = 0;
etaKc = M_.params( 43 );
M_.params( 44 ) = 0;
etaKh = M_.params( 44 );
M_.params( 45 ) = 0;
etaKw = M_.params( 45 );
M_.params( 46 ) = 0;
etaKI = M_.params( 46 );
M_.params( 47 ) = 0;
etaKpi = M_.params( 47 );
M_.params( 48 ) = 0;
etaKR = M_.params( 48 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.02614)^2;
M_.Sigma_e(2, 2) = (0.006840000000000001)^2;
M_.Sigma_e(3, 3) = (0.01797)^2;
M_.Sigma_e(4, 4) = (0.00157)^2;
M_.Sigma_e(5, 5) = (0.01)^2;
M_.Sigma_e(6, 6) = (0.04944)^2;
M_.Sigma_e(7, 7) = (0.03175)^2;
M_.Sigma_e(8, 8) = (0.0152)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 300;
options_.nograph = 1;
options_.nomoments = 1;
options_.noprint = 1;
options_.order = 1;
var_list_ = char('lp','I','c','y','w','k','tax','Rb','R','b','tau_w','tau_k','tax_rev_tauw','tax_rev_tauk','cg','GDP');
info = stoch_simul(var_list_);
clc;
disp('loading posterior draws baseline model...')
load draws_bench.mat
disp('... done!')
nn=500;
kk=100;
horizon=20;
post_irf_tauk=zeros(kk,5,nn);
post_irf_tauw=zeros(kk,5,nn);
post_irf_cg=zeros(kk,5,nn);
post_SS=zeros(8,nn);
disp('calculating IRFs baseline model...')
for jj=1:nn
[Rb_SS,tax_rev_tauw_SS, tax_rev_tauk_SS, cg_SS, y_SS, w_SS, rk_SS, lp_SS]=setparams(para_draws(:,jj));
post_SS(:,jj)=[Rb_SS,tax_rev_tauw_SS, tax_rev_tauk_SS, cg_SS, y_SS, w_SS, rk_SS, lp_SS]';
options_.irf = 100;
options_.nograph = 1;
options_.nomoments = 1;
options_.noprint = 1;
options_.order = 1;
var_list_ = char('Rb','tax_rev_tauw','tax_rev_tauk','cg','GDP');
info = stoch_simul(var_list_);
post_irf_tauk(:,:,jj)=[Rb_eps_tauk tax_rev_tauw_eps_tauk tax_rev_tauk_eps_tauk cg_eps_tauk GDP_eps_tauk];
post_irf_tauw(:,:,jj)=[Rb_eps_tauw tax_rev_tauw_eps_tauw tax_rev_tauk_eps_tauw cg_eps_tauk GDP_eps_tauw];
post_irf_cg(:,:,jj)=[Rb_eps_cg tax_rev_tauw_eps_cg tax_rev_tauk_eps_cg cg_eps_cg GDP_eps_cg];
end
disp('... done!')
disp('calculating multiplier baseline model...')
multipl_tauw=zeros(horizon,nn);
multipl_tauk=zeros(horizon,nn);
for jj=1:nn
[multipl_tauk(:,jj) multipl_tauw(:,jj)]=compute_fiscal_multiplier(post_SS(:,jj), post_irf_tauk(:,:,jj), post_irf_tauw(:,:,jj),horizon);
end
save('multiplier_bench.mat', 'multipl_tauk', 'multipl_tauw')
disp('... done!')
disp(' ')
save('model_bench_irf1_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('model_bench_irf1_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('model_bench_irf1_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('model_bench_irf1_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('model_bench_irf1_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('model_bench_irf1_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('model_bench_irf1_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
