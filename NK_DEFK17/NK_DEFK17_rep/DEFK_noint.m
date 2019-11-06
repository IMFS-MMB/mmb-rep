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
M_.fname = 'DEFK_noint';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('DEFK_noint.log');
M_.exo_names = 'e_phi';
M_.exo_names_tex = 'e\_phi';
M_.exo_names_long = 'e_phi';
M_.endo_names = 'C';
M_.endo_names_tex = 'C';
M_.endo_names_long = 'C';
M_.endo_names = char(M_.endo_names, 'Inv');
M_.endo_names_tex = char(M_.endo_names_tex, 'Inv');
M_.endo_names_long = char(M_.endo_names_long, 'Inv');
M_.endo_names = char(M_.endo_names, 'S_Inv');
M_.endo_names_tex = char(M_.endo_names_tex, 'S\_Inv');
M_.endo_names_long = char(M_.endo_names_long, 'S_Inv');
M_.endo_names = char(M_.endo_names, 'dS_Inv');
M_.endo_names_tex = char(M_.endo_names_tex, 'dS\_Inv');
M_.endo_names_long = char(M_.endo_names_long, 'dS_Inv');
M_.endo_names = char(M_.endo_names, 'H');
M_.endo_names_tex = char(M_.endo_names_tex, 'H');
M_.endo_names_long = char(M_.endo_names_long, 'H');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'Ng');
M_.endo_names_tex = char(M_.endo_names_tex, 'Ng');
M_.endo_names_long = char(M_.endo_names_long, 'Ng');
M_.endo_names = char(M_.endo_names, 'LY');
M_.endo_names_tex = char(M_.endo_names_tex, 'LY');
M_.endo_names_long = char(M_.endo_names_long, 'LY');
M_.endo_names = char(M_.endo_names, 'QK');
M_.endo_names_tex = char(M_.endo_names_tex, 'QK');
M_.endo_names_long = char(M_.endo_names_long, 'QK');
M_.endo_names = char(M_.endo_names, 'GDP');
M_.endo_names_tex = char(M_.endo_names_tex, 'GDP');
M_.endo_names_long = char(M_.endo_names_long, 'GDP');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'Q');
M_.endo_names_tex = char(M_.endo_names_tex, 'Q');
M_.endo_names_long = char(M_.endo_names_long, 'Q');
M_.endo_names = char(M_.endo_names, 'pI');
M_.endo_names_tex = char(M_.endo_names_tex, 'pI');
M_.endo_names_long = char(M_.endo_names_long, 'pI');
M_.endo_names = char(M_.endo_names, 'RK');
M_.endo_names_tex = char(M_.endo_names_tex, 'RK');
M_.endo_names_long = char(M_.endo_names_long, 'RK');
M_.endo_names = char(M_.endo_names, 'rK');
M_.endo_names_tex = char(M_.endo_names_tex, 'rK');
M_.endo_names_long = char(M_.endo_names_long, 'rK');
M_.endo_names = char(M_.endo_names, 'rr');
M_.endo_names_tex = char(M_.endo_names_tex, 'rr');
M_.endo_names_long = char(M_.endo_names_long, 'rr');
M_.endo_names = char(M_.endo_names, 'rr0');
M_.endo_names_tex = char(M_.endo_names_tex, 'rr0');
M_.endo_names_long = char(M_.endo_names_long, 'rr0');
M_.endo_names = char(M_.endo_names, 'ERQ');
M_.endo_names_tex = char(M_.endo_names_tex, 'ERQ');
M_.endo_names_long = char(M_.endo_names_long, 'ERQ');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'infl_w');
M_.endo_names_tex = char(M_.endo_names_tex, 'infl\_w');
M_.endo_names_long = char(M_.endo_names_long, 'infl_w');
M_.endo_names = char(M_.endo_names, 'X1w');
M_.endo_names_tex = char(M_.endo_names_tex, 'X1w');
M_.endo_names_long = char(M_.endo_names_long, 'X1w');
M_.endo_names = char(M_.endo_names, 'X2w');
M_.endo_names_tex = char(M_.endo_names_tex, 'X2w');
M_.endo_names_long = char(M_.endo_names_long, 'X2w');
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'infl');
M_.endo_names_tex = char(M_.endo_names_tex, 'infl');
M_.endo_names_long = char(M_.endo_names_long, 'infl');
M_.endo_names = char(M_.endo_names, 'X1p');
M_.endo_names_tex = char(M_.endo_names_tex, 'X1p');
M_.endo_names_long = char(M_.endo_names_long, 'X1p');
M_.endo_names = char(M_.endo_names, 'X2p');
M_.endo_names_tex = char(M_.endo_names_tex, 'X2p');
M_.endo_names_long = char(M_.endo_names_long, 'X2p');
M_.endo_names = char(M_.endo_names, 'Delta_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'Delta\_p');
M_.endo_names_long = char(M_.endo_names_long, 'Delta_p');
M_.endo_names = char(M_.endo_names, 'CY');
M_.endo_names_tex = char(M_.endo_names_tex, 'CY');
M_.endo_names_long = char(M_.endo_names_long, 'CY');
M_.endo_names = char(M_.endo_names, 'Spr');
M_.endo_names_tex = char(M_.endo_names_tex, 'Spr');
M_.endo_names_long = char(M_.endo_names_long, 'Spr');
M_.endo_names = char(M_.endo_names, 'phi');
M_.endo_names_tex = char(M_.endo_names_tex, 'phi');
M_.endo_names_long = char(M_.endo_names_long, 'phi');
M_.endo_partitions = struct();
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'nu');
M_.param_names_tex = char(M_.param_names_tex, 'nu');
M_.param_names_long = char(M_.param_names_long, 'nu');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'Gamma');
M_.param_names_tex = char(M_.param_names_tex, 'Gamma');
M_.param_names_long = char(M_.param_names_long, 'Gamma');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 's0');
M_.param_names_tex = char(M_.param_names_tex, 's0');
M_.param_names_long = char(M_.param_names_long, 's0');
M_.param_names = char(M_.param_names, 'lambda_w');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_w');
M_.param_names_long = char(M_.param_names_long, 'lambda_w');
M_.param_names = char(M_.param_names, 'lambda_p');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_p');
M_.param_names_long = char(M_.param_names_long, 'lambda_p');
M_.param_names = char(M_.param_names, 'xi_w');
M_.param_names_tex = char(M_.param_names_tex, 'xi\_w');
M_.param_names_long = char(M_.param_names_long, 'xi_w');
M_.param_names = char(M_.param_names, 'xi_p');
M_.param_names_tex = char(M_.param_names_tex, 'xi\_p');
M_.param_names_long = char(M_.param_names_long, 'xi_p');
M_.param_names = char(M_.param_names, 'psi_p');
M_.param_names_tex = char(M_.param_names_tex, 'psi\_p');
M_.param_names_long = char(M_.param_names_long, 'psi_p');
M_.param_names = char(M_.param_names, 'psi_y');
M_.param_names_tex = char(M_.param_names_tex, 'psi\_y');
M_.param_names_long = char(M_.param_names_long, 'psi_y');
M_.param_names = char(M_.param_names, 'rho_i');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_i');
M_.param_names_long = char(M_.param_names_long, 'rho_i');
M_.param_names = char(M_.param_names, 'psi_k');
M_.param_names_tex = char(M_.param_names_tex, 'psi\_k');
M_.param_names_long = char(M_.param_names_long, 'psi_k');
M_.param_names = char(M_.param_names, 'psi_tau');
M_.param_names_tex = char(M_.param_names_tex, 'psi\_tau');
M_.param_names_long = char(M_.param_names_long, 'psi_tau');
M_.param_names = char(M_.param_names, 'rho_phi');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_phi');
M_.param_names_long = char(M_.param_names_long, 'rho_phi');
M_.param_names = char(M_.param_names, 'Y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Y\_ss');
M_.param_names_long = char(M_.param_names_long, 'Y_ss');
M_.param_names = char(M_.param_names, 'C_ss');
M_.param_names_tex = char(M_.param_names_tex, 'C\_ss');
M_.param_names_long = char(M_.param_names_long, 'C_ss');
M_.param_names = char(M_.param_names, 'I_ss');
M_.param_names_tex = char(M_.param_names_tex, 'I\_ss');
M_.param_names_long = char(M_.param_names_long, 'I_ss');
M_.param_names = char(M_.param_names, 'K_ss');
M_.param_names_tex = char(M_.param_names_tex, 'K\_ss');
M_.param_names_long = char(M_.param_names_long, 'K_ss');
M_.param_names = char(M_.param_names, 'H_ss');
M_.param_names_tex = char(M_.param_names_tex, 'H\_ss');
M_.param_names_long = char(M_.param_names_long, 'H_ss');
M_.param_names = char(M_.param_names, 'R_ss');
M_.param_names_tex = char(M_.param_names_tex, 'R\_ss');
M_.param_names_long = char(M_.param_names_long, 'R_ss');
M_.param_names = char(M_.param_names, 'Q_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Q\_ss');
M_.param_names_long = char(M_.param_names_long, 'Q_ss');
M_.param_names = char(M_.param_names, 'RK_ss');
M_.param_names_tex = char(M_.param_names_tex, 'RK\_ss');
M_.param_names_long = char(M_.param_names_long, 'RK_ss');
M_.param_names = char(M_.param_names, 'rK_ss');
M_.param_names_tex = char(M_.param_names_tex, 'rK\_ss');
M_.param_names_long = char(M_.param_names_long, 'rK_ss');
M_.param_names = char(M_.param_names, 'w_ss');
M_.param_names_tex = char(M_.param_names_tex, 'w\_ss');
M_.param_names_long = char(M_.param_names_long, 'w_ss');
M_.param_names = char(M_.param_names, 'tau_ss');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_ss');
M_.param_names_long = char(M_.param_names_long, 'tau_ss');
M_.param_names = char(M_.param_names, 'LY_ss');
M_.param_names_tex = char(M_.param_names_tex, 'LY\_ss');
M_.param_names_long = char(M_.param_names_long, 'LY_ss');
M_.param_names = char(M_.param_names, 'A_ss');
M_.param_names_tex = char(M_.param_names_tex, 'A\_ss');
M_.param_names_long = char(M_.param_names_long, 'A_ss');
M_.param_names = char(M_.param_names, 'phi_ss');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_ss');
M_.param_names_long = char(M_.param_names_long, 'phi_ss');
M_.param_names = char(M_.param_names, 'shock_val');
M_.param_names_tex = char(M_.param_names_tex, 'shock\_val');
M_.param_names_long = char(M_.param_names_long, 'shock_val');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 33;
M_.param_nbr = 34;
M_.orig_endo_nbr = 33;
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
erase_compiled_function('DEFK_noint_static');
erase_compiled_function('DEFK_noint_dynamic');
M_.orig_eq_nbr = 33;
M_.eq_nbr = 33;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 10 43;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 1 15 0;
 0 16 0;
 2 17 0;
 3 18 0;
 4 19 0;
 5 20 0;
 0 21 0;
 0 22 0;
 6 23 0;
 0 24 44;
 0 25 45;
 0 26 46;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 7 31 0;
 0 32 47;
 0 33 48;
 0 34 49;
 0 35 0;
 0 36 50;
 0 37 51;
 0 38 52;
 8 39 0;
 0 40 0;
 0 41 0;
 9 42 53;]';
M_.nstatic = 14;
M_.nfwrd   = 10;
M_.npred   = 8;
M_.nboth   = 1;
M_.nsfwrd   = 11;
M_.nspred   = 9;
M_.ndynamic   = 19;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(33, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(34, 1);
M_.NNZDerivatives = [144; 0; -1];
close all;
M_.params( 1 ) = 0.99347;
beta = M_.params( 1 );
M_.params( 2 ) = 1;
sigma = M_.params( 2 );
M_.params( 3 ) = 1;
nu = M_.params( 3 );
M_.params( 5 ) = 0.79246;
theta = M_.params( 5 );
M_.params( 4 ) = 0.009486;
kappa = M_.params( 4 );
M_.params( 8 ) = 0.024291;
delta = M_.params( 8 );
M_.params( 6 ) = 0.34002;
gamma = M_.params( 6 );
M_.params( 9 ) = 0.75;
s0 = M_.params( 9 );
M_.params( 13 ) = 0.75;
xi_p = M_.params( 13 );
M_.params( 12 ) = 0.75;
xi_w = M_.params( 12 );
M_.params( 11 ) = 0.1;
lambda_p = M_.params( 11 );
M_.params( 10 ) = 0.1;
lambda_w = M_.params( 10 );
M_.params( 14 ) = 1.5;
psi_p = M_.params( 14 );
M_.params( 15 ) = 0.125;
psi_y = M_.params( 15 );
M_.params( 16 ) = 0;
rho_i = M_.params( 16 );
M_.params( 18 ) = 0.1;
psi_tau = M_.params( 18 );
M_.params( 25 ) = 1.0055;
R_ss = M_.params( 25 );
M_.params( 32 ) = 1;
A_ss = M_.params( 32 );
M_.params( 33 ) = 0.3092;
phi_ss = M_.params( 33 );
M_.params( 31 ) = 1.6;
LY_ss = M_.params( 31 );
M_.params( 20 ) = 2.6779;
Y_ss = M_.params( 20 );
M_.params( 23 ) = 29.2064;
K_ss = M_.params( 23 );
M_.params( 24 ) = 0.90345;
H_ss = M_.params( 24 );
M_.params( 22 ) = 0.70945;
I_ss = M_.params( 22 );
M_.params( 21 ) = 1.9685;
C_ss = M_.params( 21 );
M_.params( 26 ) = 1.0223;
Q_ss = M_.params( 26 );
M_.params( 27 ) = 0.031176;
RK_ss = M_.params( 27 );
M_.params( 28 ) = 0.031176;
rK_ss = M_.params( 28 );
CY_ss=0.0011116;
M_.params( 29 ) = 1.9563;
w_ss = M_.params( 29 );
M_.params( 30 ) = 0.023387;
tau_ss = M_.params( 30 );
KY_ratio=10.9064;
KH_ratio=32.3277;
IY_ratio=0.26493;
CY_ratio=0.73507;
M_.params( 7 ) = 0.26779;
Gamma = M_.params( 7 );
M_.params( 17 ) = (-4.8064);
psi_k = M_.params( 17 );
M_.params( 34 ) = (-0.218);
shock_val = M_.params( 34 );
M_.params( 19 ) = 0.9525;
rho_phi = M_.params( 19 );
GE=0;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = M_.params(21);
oo_.steady_state( 2 ) = M_.params(22);
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = M_.params(24);
oo_.steady_state( 6 ) = M_.params(20);
oo_.steady_state( 11 ) = M_.params(31);
oo_.steady_state( 7 ) = M_.params(30);
oo_.steady_state( 8 ) = M_.params(23);
oo_.steady_state( 9 ) = M_.params(23);
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 14 ) = M_.params(25);
oo_.steady_state( 19 ) = M_.params(25);
oo_.steady_state( 20 ) = M_.params(25)*(1+CY_ss);
oo_.steady_state( 21 ) = M_.params(27)/M_.params(26)+1-M_.params(8);
oo_.steady_state( 32 ) = oo_.steady_state(21)-oo_.steady_state(19);
oo_.steady_state( 15 ) = M_.params(26);
oo_.steady_state( 16 ) = 1;
oo_.steady_state( 17 ) = M_.params(27);
oo_.steady_state( 18 ) = M_.params(28);
oo_.steady_state( 31 ) = CY_ss;
oo_.steady_state( 22 ) = M_.params(29);
oo_.steady_state( 23 ) = 1;
oo_.steady_state( 24 ) = (1+M_.params(10))*M_.params(24)^(1+M_.params(3))/(1-M_.params(1)*M_.params(12));
oo_.steady_state( 25 ) = M_.params(24)*M_.params(29)*M_.params(21)^(-M_.params(2))/(1-M_.params(1)*M_.params(12));
oo_.steady_state( 26 ) = 1/(1+M_.params(11));
oo_.steady_state( 27 ) = 1;
oo_.steady_state( 28 ) = M_.params(20)*M_.params(21)^(-M_.params(2))/(1-M_.params(1)*M_.params(13));
oo_.steady_state( 29 ) = M_.params(20)*M_.params(21)^(-M_.params(2))/(1-M_.params(1)*M_.params(13));
oo_.steady_state( 30 ) = 1;
oo_.steady_state( 33 ) = M_.params(33);
oo_.exo_steady_state( 1 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
options_.solve_algo = 2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',M_.params(34)) ];
M_.exo_det_length = 0;
options_.periods = 300;
perfect_foresight_setup;
perfect_foresight_solver;
save('DEFK_noint_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('DEFK_noint_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('DEFK_noint_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('DEFK_noint_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('DEFK_noint_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('DEFK_noint_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('DEFK_noint_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
