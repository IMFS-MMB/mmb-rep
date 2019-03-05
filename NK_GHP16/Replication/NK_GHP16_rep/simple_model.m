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
M_.fname = 'simple_model';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('simple_model.log');
M_.exo_names = 'e_g';
M_.exo_names_tex = 'e\_g';
M_.exo_names_long = 'e_g';
M_.endo_names = 'C';
M_.endo_names_tex = 'C';
M_.endo_names_long = 'C';
M_.endo_names = char(M_.endo_names, 'C_m');
M_.endo_names_tex = char(M_.endo_names_tex, 'C\_m');
M_.endo_names_long = char(M_.endo_names_long, 'C_m');
M_.endo_names = char(M_.endo_names, 'C_n');
M_.endo_names_tex = char(M_.endo_names_tex, 'C\_n');
M_.endo_names_long = char(M_.endo_names_long, 'C_n');
M_.endo_names = char(M_.endo_names, 'W');
M_.endo_names_tex = char(M_.endo_names_tex, 'W');
M_.endo_names_long = char(M_.endo_names_long, 'W');
M_.endo_names = char(M_.endo_names, 'h_m');
M_.endo_names_tex = char(M_.endo_names_tex, 'h\_m');
M_.endo_names_long = char(M_.endo_names_long, 'h_m');
M_.endo_names = char(M_.endo_names, 'h_n');
M_.endo_names_tex = char(M_.endo_names_tex, 'h\_n');
M_.endo_names_long = char(M_.endo_names_long, 'h_n');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'infl');
M_.endo_names_tex = char(M_.endo_names_tex, 'infl');
M_.endo_names_long = char(M_.endo_names_long, 'infl');
M_.endo_names = char(M_.endo_names, 'inflstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflstar');
M_.endo_names_long = char(M_.endo_names_long, 'inflstar');
M_.endo_names = char(M_.endo_names, 'x_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'x\_1');
M_.endo_names_long = char(M_.endo_names_long, 'x_1');
M_.endo_names = char(M_.endo_names, 'x_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'x\_2');
M_.endo_names_long = char(M_.endo_names_long, 'x_2');
M_.endo_names = char(M_.endo_names, 'RMC');
M_.endo_names_tex = char(M_.endo_names_tex, 'RMC');
M_.endo_names_long = char(M_.endo_names_long, 'RMC');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'D');
M_.endo_names_tex = char(M_.endo_names_tex, 'D');
M_.endo_names_long = char(M_.endo_names_long, 'D');
M_.endo_partitions = struct();
M_.param_names = 'g_ratio';
M_.param_names_tex = 'g\_ratio';
M_.param_names_long = 'g_ratio';
M_.param_names = char(M_.param_names, 'taup');
M_.param_names_tex = char(M_.param_names_tex, 'taup');
M_.param_names_long = char(M_.param_names_long, 'taup');
M_.param_names = char(M_.param_names, 'b_1');
M_.param_names_tex = char(M_.param_names_tex, 'b\_1');
M_.param_names_long = char(M_.param_names_long, 'b_1');
M_.param_names = char(M_.param_names, 'alpha_1');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_1');
M_.param_names_long = char(M_.param_names_long, 'alpha_1');
M_.param_names = char(M_.param_names, 'alpha_2');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_2');
M_.param_names_long = char(M_.param_names_long, 'alpha_2');
M_.param_names = char(M_.param_names, 'alpha_3');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_3');
M_.param_names_long = char(M_.param_names_long, 'alpha_3');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'xi');
M_.param_names_tex = char(M_.param_names_tex, 'xi');
M_.param_names_long = char(M_.param_names_long, 'xi');
M_.param_names = char(M_.param_names, 'b');
M_.param_names_tex = char(M_.param_names_tex, 'b');
M_.param_names_long = char(M_.param_names_long, 'b');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'eps');
M_.param_names_tex = char(M_.param_names_tex, 'eps');
M_.param_names_long = char(M_.param_names_long, 'eps');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'G_ss');
M_.param_names_tex = char(M_.param_names_tex, 'G\_ss');
M_.param_names_long = char(M_.param_names_long, 'G_ss');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'phi_infl');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_infl');
M_.param_names_long = char(M_.param_names_long, 'phi_infl');
M_.param_names = char(M_.param_names, 'RMC_ss');
M_.param_names_tex = char(M_.param_names_tex, 'RMC\_ss');
M_.param_names_long = char(M_.param_names_long, 'RMC_ss');
M_.param_names = char(M_.param_names, 'h_n_ss');
M_.param_names_tex = char(M_.param_names_tex, 'h\_n\_ss');
M_.param_names_long = char(M_.param_names_long, 'h_n_ss');
M_.param_names = char(M_.param_names, 'h_m_ss');
M_.param_names_tex = char(M_.param_names_tex, 'h\_m\_ss');
M_.param_names_long = char(M_.param_names_long, 'h_m_ss');
M_.param_names = char(M_.param_names, 'kn_y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'kn\_y\_ss');
M_.param_names_long = char(M_.param_names_long, 'kn_y_ss');
M_.param_names = char(M_.param_names, 'km_y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'km\_y\_ss');
M_.param_names_long = char(M_.param_names_long, 'km_y_ss');
M_.param_names = char(M_.param_names, 'Y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Y\_ss');
M_.param_names_long = char(M_.param_names_long, 'Y_ss');
M_.param_names = char(M_.param_names, 'C_m_ss');
M_.param_names_tex = char(M_.param_names_tex, 'C\_m\_ss');
M_.param_names_long = char(M_.param_names_long, 'C_m_ss');
M_.param_names = char(M_.param_names, 'C_n_ss');
M_.param_names_tex = char(M_.param_names_tex, 'C\_n\_ss');
M_.param_names_long = char(M_.param_names_long, 'C_n_ss');
M_.param_names = char(M_.param_names, 'W_ss');
M_.param_names_tex = char(M_.param_names_tex, 'W\_ss');
M_.param_names_long = char(M_.param_names_long, 'W_ss');
M_.param_names = char(M_.param_names, 'h_ss');
M_.param_names_tex = char(M_.param_names_tex, 'h\_ss');
M_.param_names_long = char(M_.param_names_long, 'h_ss');
M_.param_names = char(M_.param_names, 'l_ss');
M_.param_names_tex = char(M_.param_names_tex, 'l\_ss');
M_.param_names_long = char(M_.param_names_long, 'l_ss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 16;
M_.param_nbr = 28;
M_.orig_endo_nbr = 16;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('simple_model_static');
erase_compiled_function('simple_model_dynamic');
M_.orig_eq_nbr = 16;
M_.eq_nbr = 16;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 0;
 0 5 0;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 0 10 19;
 0 11 20;
 0 12 0;
 0 13 21;
 0 14 22;
 0 15 0;
 1 16 0;
 0 17 0;
 2 18 0;]';
M_.nstatic = 10;
M_.nfwrd   = 4;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 4;
M_.nspred   = 2;
M_.ndynamic   = 6;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(28, 1);
M_.NNZDerivatives = [62; -1; -1];
M_.params( 10 ) = 0.99;
beta = M_.params( 10 );
M_.params( 12 ) = 11;
eps = M_.params( 12 );
M_.params( 13 ) = 0.75;
theta = M_.params( 13 );
M_.params( 8 ) = 252.5;
xi = M_.params( 8 );
M_.params( 11 ) = 2;
sigma = M_.params( 11 );
M_.params( 16 ) = 0.8;
rho_g = M_.params( 16 );
M_.params( 7 ) = 0.0241;
delta = M_.params( 7 );
M_.params( 14 ) = 0;
tau = M_.params( 14 );
M_.params( 2 ) = 1/M_.params(12);
taup = M_.params( 2 );
M_.params( 17 ) = 1.5;
phi_infl = M_.params( 17 );
M_.params( 1 ) = 0;
g_ratio = M_.params( 1 );
M_.params( 6 ) = 0;
alpha_3 = M_.params( 6 );
M_.params( 5 ) = 0;
alpha_2 = M_.params( 5 );
M_.params( 18 ) = (M_.params(12)-1)/(M_.params(12)*(1-M_.params(14)));
RMC_ss = M_.params( 18 );
M_.params( 19 ) = 0.19;
h_n_ss = M_.params( 19 );
M_.params( 20 ) = 0.33;
h_m_ss = M_.params( 20 );
M_.params( 21 ) = 0;
kn_y_ss = M_.params( 21 );
M_.params( 22 ) = 0;
km_y_ss = M_.params( 22 );
load parameterfile;
set_param_value('b_1',b_1)
M_.params( 23 ) = M_.params(20);
Y_ss = M_.params( 23 );
M_.params( 24 ) = M_.params(23);
C_m_ss = M_.params( 24 );
M_.params( 15 ) = 0;
G_ss = M_.params( 15 );
M_.params( 26 ) = M_.params(18);
W_ss = M_.params( 26 );
M_.params( 25 ) = M_.params(19);
C_n_ss = M_.params( 25 );
M_.params( 4 ) = (1-M_.params(5))*M_.params(25)^M_.params(3)/(M_.params(19)*M_.params(26))/((1-M_.params(5))*M_.params(25)^M_.params(3)/(M_.params(19)*M_.params(26))+M_.params(24)^(M_.params(3)-1));
alpha_1 = M_.params( 4 );
M_.params( 27 ) = M_.params(20)+M_.params(19);
h_ss = M_.params( 27 );
M_.params( 28 ) = 1-M_.params(27);
l_ss = M_.params( 28 );
M_.params( 9 ) = (M_.params(19)*M_.params(26)+(1-M_.params(5))*M_.params(24))/(M_.params(19)*M_.params(26)+(1-M_.params(5))*(M_.params(24)+M_.params(26)*M_.params(28)));
b = M_.params( 9 );
C_ss        =   (alpha_1*C_m_ss^b_1+(1-alpha_1)*C_n_ss^b_1)^(1/b_1);
I_ss        =    0;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 15 ) = log(M_.params(23));
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 5 ) = log(M_.params(20));
oo_.steady_state( 6 ) = log(M_.params(19));
oo_.steady_state( 4 ) = log(M_.params(26));
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 1 ) = log(C_ss);
oo_.steady_state( 2 ) = log(M_.params(24));
oo_.steady_state( 3 ) = log(M_.params(25));
oo_.steady_state( 8 ) = log(M_.params(24)^(M_.params(3)-1)*M_.params(9)*M_.params(4)*(1-M_.params(19)-M_.params(20))^((1-M_.params(9))*(1-M_.params(11)))*C_ss^(M_.params(9)*(1-M_.params(11))-M_.params(3)));
oo_.steady_state( 7 ) = log(1/M_.params(10))-1;
oo_.steady_state( 13 ) = log(M_.params(18));
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 11 ) = log((M_.params(24)+M_.params(15))/(1-M_.params(10)*M_.params(13)));
oo_.steady_state( 12 ) = oo_.steady_state(11);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
resid;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(23)^2;
options_.irf = 20;
options_.nograph = 1;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('simple_model_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('simple_model_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('simple_model_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('simple_model_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('simple_model_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('simple_model_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('simple_model_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 1 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
