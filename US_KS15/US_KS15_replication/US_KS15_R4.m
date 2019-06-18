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
M_.fname = 'US_KS15_R4';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('US_KS15_R4.log');
M_.exo_names = 'eps_z';
M_.exo_names_tex = 'eps\_z';
M_.exo_names_long = 'eps_z';
M_.exo_names = char(M_.exo_names, 'eps_nu');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_nu');
M_.exo_names_long = char(M_.exo_names_long, 'eps_nu');
M_.exo_names = char(M_.exo_names, 'eps_mu');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_mu');
M_.exo_names_long = char(M_.exo_names_long, 'eps_mu');
M_.exo_names = char(M_.exo_names, 'eps_a');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_a');
M_.exo_names_long = char(M_.exo_names_long, 'eps_a');
M_.exo_names = char(M_.exo_names, 'eps_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_g');
M_.exo_names_long = char(M_.exo_names_long, 'eps_g');
M_.exo_names = char(M_.exo_names, 'eps_m');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_m');
M_.exo_names_long = char(M_.exo_names_long, 'eps_m');
M_.endo_names = 'lambda';
M_.endo_names_tex = 'lambda';
M_.endo_names_long = 'lambda';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.endo_names = char(M_.endo_names, 'pit');
M_.endo_names_tex = char(M_.endo_names_tex, 'pit');
M_.endo_names_long = char(M_.endo_names_long, 'pit');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'nu');
M_.endo_names_tex = char(M_.endo_names_tex, 'nu');
M_.endo_names_long = char(M_.endo_names_long, 'nu');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'mu');
M_.endo_names_tex = char(M_.endo_names_tex, 'mu');
M_.endo_names_long = char(M_.endo_names_long, 'mu');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'psi');
M_.endo_names_tex = char(M_.endo_names_tex, 'psi');
M_.endo_names_long = char(M_.endo_names_long, 'psi');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'RR');
M_.endo_names_tex = char(M_.endo_names_tex, 'RR');
M_.endo_names_long = char(M_.endo_names_long, 'RR');
M_.endo_names = char(M_.endo_names, 'pit_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'pit\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'pit_obs');
M_.endo_names = char(M_.endo_names, 'R_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'R_obs');
M_.endo_partitions = struct();
M_.param_names = 'eta_cc';
M_.param_names_tex = 'eta\_cc';
M_.param_names_long = 'eta_cc';
M_.param_names = char(M_.param_names, 'eta_ch');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_ch');
M_.param_names_long = char(M_.param_names_long, 'eta_ch');
M_.param_names = char(M_.param_names, 'eta_hc_sigma_h');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_hc\_sigma\_h');
M_.param_names_long = char(M_.param_names_long, 'eta_hc_sigma_h');
M_.param_names = char(M_.param_names, 'sigma_c');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_c');
M_.param_names_long = char(M_.param_names_long, 'sigma_c');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, 'omega');
M_.param_names_long = char(M_.param_names_long, 'omega');
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, 'betta');
M_.param_names_long = char(M_.param_names_long, 'betta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'rho_pi');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_pi');
M_.param_names_long = char(M_.param_names_long, 'rho_pi');
M_.param_names = char(M_.param_names, 'rho_y');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_y');
M_.param_names_long = char(M_.param_names_long, 'rho_y');
M_.param_names = char(M_.param_names, 'g_o_y');
M_.param_names_tex = char(M_.param_names_tex, 'g\_o\_y');
M_.param_names_long = char(M_.param_names_long, 'g_o_y');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'rho_nu');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_nu');
M_.param_names_long = char(M_.param_names_long, 'rho_nu');
M_.param_names = char(M_.param_names, 'rho_mu');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_mu');
M_.param_names_long = char(M_.param_names_long, 'rho_mu');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'eta_R');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_R');
M_.param_names_long = char(M_.param_names_long, 'eta_R');
M_.param_names = char(M_.param_names, 'rho_R');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_R');
M_.param_names_long = char(M_.param_names_long, 'rho_R');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 6;
M_.endo_nbr = 17;
M_.param_nbr = 18;
M_.orig_endo_nbr = 17;
M_.aux_vars = [];
M_.Sigma_e = zeros(6, 6);
M_.Correlation_matrix = eye(6, 6);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('US_KS15_R4_static');
erase_compiled_function('US_KS15_R4_dynamic');
M_.orig_eq_nbr = 17;
M_.eq_nbr = 17;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 9 26;
 1 10 27;
 2 11 0;
 0 12 28;
 3 13 29;
 4 14 0;
 0 15 0;
 5 16 0;
 0 17 0;
 6 18 0;
 0 19 0;
 7 20 0;
 8 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;]';
M_.nstatic = 7;
M_.nfwrd   = 2;
M_.npred   = 6;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 8;
M_.ndynamic   = 10;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:6];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(17, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(6, 1);
M_.params = NaN(18, 1);
M_.NNZDerivatives = [59; 0; -1];
M_.params( 5 ) = 0;
gamma = M_.params( 5 );
M_.params( 7 ) = 0.99;
betta = M_.params( 7 );
M_.params( 6 ) = 3.5;
omega = M_.params( 6 );
M_.params( 4 ) = 0.99;
sigma_c = M_.params( 4 );
M_.params( 8 ) = 0.5;
alpha = M_.params( 8 );
M_.params( 11 ) = 0.2;
g_o_y = M_.params( 11 );
M_.params( 1 ) = 0.01;
eta_cc = M_.params( 1 );
M_.params( 17 ) = 20;
eta_R = M_.params( 17 );
M_.params( 18 ) = 0.0;
rho_R = M_.params( 18 );
M_.params( 9 ) = 1.5;
rho_pi = M_.params( 9 );
M_.params( 10 ) = 0;
rho_y = M_.params( 10 );
M_.params( 2 ) = 0;
eta_ch = M_.params( 2 );
M_.params( 3 ) = 0.85;
eta_hc_sigma_h = M_.params( 3 );
M_.params( 12 ) = 0.5;
rho_z = M_.params( 12 );
M_.params( 13 ) = 0.5;
rho_nu = M_.params( 13 );
M_.params( 14 ) = 0.5;
rho_mu = M_.params( 14 );
M_.params( 15 ) = 0.5;
rho_a = M_.params( 15 );
M_.params( 16 ) = 0.5;
rho_g = M_.params( 16 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.0140)^2;
M_.Sigma_e(2, 2) = (0.0152)^2;
M_.Sigma_e(3, 3) = (0.0188)^2;
M_.Sigma_e(4, 4) = (0.0044)^2;
M_.Sigma_e(5, 5) = (1)^2;
M_.Sigma_e(6, 6) = (0.0055)^2;
options_.irf = 20;
options_.nograph = 1;
var_list_ = char('c','y','m','pit','RR','R');
info = stoch_simul(var_list_);
save('US_KS15_R4_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('US_KS15_R4_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('US_KS15_R4_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('US_KS15_R4_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('US_KS15_R4_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('US_KS15_R4_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('US_KS15_R4_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
