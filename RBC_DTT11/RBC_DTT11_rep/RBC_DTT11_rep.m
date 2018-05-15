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
M_.fname = 'RBC_DTT11_rep';
M_.dynare_version = '4.5.3';
oo_.dynare_version = '4.5.3';
options_.dynare_version = '4.5.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('RBC_DTT11_rep.log');
M_.exo_names = 'epsA';
M_.exo_names_tex = 'epsA';
M_.exo_names_long = 'epsA';
M_.exo_names = char(M_.exo_names, 'epsmu');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsmu');
M_.exo_names_long = char(M_.exo_names_long, 'epsmu');
M_.exo_names = char(M_.exo_names, 'epsgam');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsgam');
M_.exo_names_long = char(M_.exo_names_long, 'epsgam');
M_.exo_names = char(M_.exo_names, 'epsstd');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsstd');
M_.exo_names_long = char(M_.exo_names_long, 'epsstd');
M_.exo_names = char(M_.exo_names, 'epspol');
M_.exo_names_tex = char(M_.exo_names_tex, 'epspol');
M_.exo_names_long = char(M_.exo_names_long, 'epspol');
M_.endo_names = 'c_t';
M_.endo_names_tex = 'c\_t';
M_.endo_names_long = 'c_t';
M_.endo_names = char(M_.endo_names, 'r_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_t');
M_.endo_names_long = char(M_.endo_names_long, 'r_t');
M_.endo_names = char(M_.endo_names, 'pi_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_t');
M_.endo_names_long = char(M_.endo_names_long, 'pi_t');
M_.endo_names = char(M_.endo_names, 'z_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'z\_t');
M_.endo_names_long = char(M_.endo_names_long, 'z_t');
M_.endo_names = char(M_.endo_names, 'zbar_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'zbar\_t');
M_.endo_names_long = char(M_.endo_names_long, 'zbar_t');
M_.endo_names = char(M_.endo_names, 'fo_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'fo\_t');
M_.endo_names_long = char(M_.endo_names_long, 'fo_t');
M_.endo_names = char(M_.endo_names, 'CapG_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'CapG\_t');
M_.endo_names_long = char(M_.endo_names_long, 'CapG_t');
M_.endo_names = char(M_.endo_names, 'co_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'co\_t');
M_.endo_names_long = char(M_.endo_names_long, 'co_t');
M_.endo_names = char(M_.endo_names, 'ho_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'ho\_t');
M_.endo_names_long = char(M_.endo_names_long, 'ho_t');
M_.endo_names = char(M_.endo_names, 'omeg_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'omeg\_t');
M_.endo_names_long = char(M_.endo_names_long, 'omeg_t');
M_.endo_names = char(M_.endo_names, 'n_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'n\_t');
M_.endo_names_long = char(M_.endo_names_long, 'n_t');
M_.endo_names = char(M_.endo_names, 'y_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_t');
M_.endo_names_long = char(M_.endo_names_long, 'y_t');
M_.endo_names = char(M_.endo_names, 'ni_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'ni\_t');
M_.endo_names_long = char(M_.endo_names_long, 'ni_t');
M_.endo_names = char(M_.endo_names, 'rl_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'rl\_t');
M_.endo_names_long = char(M_.endo_names_long, 'rl_t');
M_.endo_names = char(M_.endo_names, 'del_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'del\_t');
M_.endo_names_long = char(M_.endo_names_long, 'del_t');
M_.endo_names = char(M_.endo_names, 'lagz_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'lagz\_t');
M_.endo_names_long = char(M_.endo_names_long, 'lagz_t');
M_.endo_names = char(M_.endo_names, 'dumnum_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dumnum\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dumnum_t');
M_.endo_names = char(M_.endo_names, 'dumden_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'dumden\_t');
M_.endo_names_long = char(M_.endo_names_long, 'dumden_t');
M_.endo_names = char(M_.endo_names, 'a_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'a\_t');
M_.endo_names_long = char(M_.endo_names_long, 'a_t');
M_.endo_names = char(M_.endo_names, 'mu_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'mu\_t');
M_.endo_names_long = char(M_.endo_names_long, 'mu_t');
M_.endo_names = char(M_.endo_names, 'gam_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'gam\_t');
M_.endo_names_long = char(M_.endo_names_long, 'gam_t');
M_.endo_names = char(M_.endo_names, 'std_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'std\_t');
M_.endo_names_long = char(M_.endo_names_long, 'std_t');
M_.endo_names = char(M_.endo_names, 'pol_t');
M_.endo_names_tex = char(M_.endo_names_tex, 'pol\_t');
M_.endo_names_long = char(M_.endo_names_long, 'pol_t');
M_.endo_names = char(M_.endo_names, 'Util');
M_.endo_names_tex = char(M_.endo_names_tex, 'Util');
M_.endo_names_long = char(M_.endo_names_long, 'Util');
M_.endo_names = char(M_.endo_names, 'Welf');
M_.endo_names_tex = char(M_.endo_names_tex, 'Welf');
M_.endo_names_long = char(M_.endo_names_long, 'Welf');
M_.endo_partitions = struct();
M_.param_names = 'alf';
M_.param_names_tex = 'alf';
M_.param_names_long = 'alf';
M_.param_names = char(M_.param_names, 'sig');
M_.param_names_tex = char(M_.param_names_tex, 'sig');
M_.param_names_long = char(M_.param_names_long, 'sig');
M_.param_names = char(M_.param_names, 'mu');
M_.param_names_tex = char(M_.param_names_tex, 'mu');
M_.param_names_long = char(M_.param_names_long, 'mu');
M_.param_names = char(M_.param_names, 'gam');
M_.param_names_tex = char(M_.param_names_tex, 'gam');
M_.param_names_long = char(M_.param_names_long, 'gam');
M_.param_names = char(M_.param_names, 'bet');
M_.param_names_tex = char(M_.param_names_tex, 'bet');
M_.param_names_long = char(M_.param_names_long, 'bet');
M_.param_names = char(M_.param_names, 'std_oi');
M_.param_names_tex = char(M_.param_names_tex, 'std\_oi');
M_.param_names_long = char(M_.param_names_long, 'std_oi');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'zet');
M_.param_names_tex = char(M_.param_names_tex, 'zet');
M_.param_names_long = char(M_.param_names_long, 'zet');
M_.param_names = char(M_.param_names, 'rho_mu');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_mu');
M_.param_names_long = char(M_.param_names_long, 'rho_mu');
M_.param_names = char(M_.param_names, 'rho_gam');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_gam');
M_.param_names_long = char(M_.param_names_long, 'rho_gam');
M_.param_names = char(M_.param_names, 'rho_std');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_std');
M_.param_names_long = char(M_.param_names_long, 'rho_std');
M_.param_names = char(M_.param_names, 'poly');
M_.param_names_tex = char(M_.param_names_tex, 'poly');
M_.param_names_long = char(M_.param_names_long, 'poly');
M_.param_names = char(M_.param_names, 'g');
M_.param_names_tex = char(M_.param_names_tex, 'g');
M_.param_names_long = char(M_.param_names_long, 'g');
M_.param_names = char(M_.param_names, 'nbeta');
M_.param_names_tex = char(M_.param_names_tex, 'nbeta');
M_.param_names_long = char(M_.param_names_long, 'nbeta');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 25;
M_.param_nbr = 14;
M_.orig_endo_nbr = 25;
M_.aux_vars = [];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('RBC_DTT11_rep_static');
erase_compiled_function('RBC_DTT11_rep_dynamic');
M_.orig_eq_nbr = 25;
M_.eq_nbr = 25;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 12 37;
 0 13 0;
 0 14 38;
 1 15 0;
 2 16 0;
 3 17 39;
 0 18 40;
 0 19 41;
 0 20 42;
 0 21 43;
 0 22 0;
 0 23 0;
 4 24 44;
 5 25 0;
 0 26 0;
 6 27 0;
 0 28 0;
 0 29 0;
 7 30 0;
 8 31 45;
 9 32 0;
 10 33 0;
 11 34 0;
 0 35 0;
 0 36 46;]';
M_.nstatic = 7;
M_.nfwrd   = 7;
M_.npred   = 8;
M_.nboth   = 3;
M_.nsfwrd   = 10;
M_.nspred   = 11;
M_.ndynamic   = 18;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(25, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(14, 1);
M_.NNZDerivatives = [90; -1; -1];
M_.params( 1 ) = 5.0;
alf = M_.params( 1 );
M_.params( 2 ) = 1.0;
sig = M_.params( 2 );
M_.params( 3 ) = 0.12;
mu = M_.params( 3 );
M_.params( 4 ) = 0.06;
gam = M_.params( 4 );
M_.params( 5 ) = .99;
bet = M_.params( 5 );
M_.params( 14 ) = M_.params(5);
nbeta = M_.params( 14 );
M_.params( 8 ) = 1.5;
zet = M_.params( 8 );
M_.params( 12 ) = 0;
poly = M_.params( 12 );
M_.params( 6 ) = 0.07;
std_oi = M_.params( 6 );
M_.params( 7 ) = 0.9;
rho_a = M_.params( 7 );
M_.params( 9 ) = 0.9;
rho_mu = M_.params( 9 );
M_.params( 10 ) = 0.0;
rho_gam = M_.params( 10 );
M_.params( 11 ) = 0.9;
rho_std = M_.params( 11 );
rho_g = 0.9 ;   
M_.params( 13 ) = 0.02;
g = M_.params( 13 );
bbar = 0.0479 ; 
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 4 ) = (-1.93586);
oo_.steady_state( 5 ) = (-3.5818);
oo_.steady_state( 1 ) = (-1.62824);
oo_.steady_state( 7 ) = 0.00921582;
oo_.steady_state( 8 ) = 0.0110763;
oo_.steady_state( 15 ) = 0.00444679;
oo_.steady_state( 18 ) = 0.988924;
oo_.steady_state( 17 ) = 0.0499456;
oo_.steady_state( 6 ) = 0.150652;
oo_.steady_state( 21 ) = (-2.81341);
oo_.steady_state( 9 ) = 0.488501;
oo_.steady_state( 16 ) = (-1.93586);
oo_.steady_state( 20 ) = (-2.12026);
oo_.steady_state( 11 ) = (-1.62713);
oo_.steady_state( 13 ) = 0.0188031;
oo_.steady_state( 10 ) = (-0.160142);
oo_.steady_state( 2 ) = 0.0100503;
oo_.steady_state( 14 ) = 0.0144971;
oo_.steady_state( 22 ) = (-2.65926);
oo_.steady_state( 24 ) = (-2.6107);
oo_.steady_state( 25 ) = (-261.07);
oo_.steady_state( 12 ) = (-1.62713);
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
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1.2)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
M_.Sigma_e(5, 5) = (1)^2;
options_.irf = 12;
options_.order = 1;
var_list_ = char('a_t','mu_t','gam_t','std_t','y_t','ni_t','c_t','omeg_t','del_t','pi_t','z_t','zbar_t','fo_t','CapG_t','co_t','n_t','r_t');
info = stoch_simul(var_list_);
close all
save('RBC_DTT11_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('RBC_DTT11_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('RBC_DTT11_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('RBC_DTT11_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('RBC_DTT11_rep_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('RBC_DTT11_rep_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('RBC_DTT11_rep_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
