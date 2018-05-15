%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'NK_GLSV07_iclm_rep';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_GLSV07_iclm_rep.log');
M_.exo_names = 'e_g';
M_.exo_names_tex = 'e\_g';
M_.exo_names_long = 'e_g';
M_.endo_names = 'n';
M_.endo_names_tex = 'n';
M_.endo_names_long = 'n';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names_long = char(M_.endo_names_long, 'b');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 't');
M_.endo_names_tex = char(M_.endo_names_tex, 't');
M_.endo_names_long = char(M_.endo_names_long, 't');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'gamma_c');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_c');
M_.param_names_long = char(M_.param_names_long, 'gamma_c');
M_.param_names = char(M_.param_names, 'gamma_c_bar');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_c\_bar');
M_.param_names_long = char(M_.param_names_long, 'gamma_c_bar');
M_.param_names = char(M_.param_names, 'gamma_g');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_g');
M_.param_names_long = char(M_.param_names_long, 'gamma_g');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'theta_n');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_n');
M_.param_names_long = char(M_.param_names_long, 'theta_n');
M_.param_names = char(M_.param_names, 'theta_tau');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_tau');
M_.param_names_long = char(M_.param_names_long, 'theta_tau');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names_long = char(M_.param_names_long, 'lambda');
M_.param_names = char(M_.param_names, 'lambda_p');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_p');
M_.param_names_long = char(M_.param_names_long, 'lambda_p');
M_.param_names = char(M_.param_names, 'my_p');
M_.param_names_tex = char(M_.param_names_tex, 'my\_p');
M_.param_names_long = char(M_.param_names_long, 'my_p');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'sigma_bar');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_bar');
M_.param_names_long = char(M_.param_names_long, 'sigma_bar');
M_.param_names = char(M_.param_names, 'phi_b');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_b');
M_.param_names_long = char(M_.param_names_long, 'phi_b');
M_.param_names = char(M_.param_names, 'phi_g');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_g');
M_.param_names_long = char(M_.param_names_long, 'phi_g');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi');
M_.param_names_long = char(M_.param_names_long, 'phi_pi');
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, 'omega');
M_.param_names_long = char(M_.param_names_long, 'omega');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'phicap');
M_.param_names_tex = char(M_.param_names_tex, 'phicap');
M_.param_names_long = char(M_.param_names_long, 'phicap');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 10;
M_.param_nbr = 22;
M_.orig_endo_nbr = 10;
M_.aux_vars = [];
M_.predetermined_variables = [ 4 5 ];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('NK_GLSV07_iclm_rep_static');
erase_compiled_function('NK_GLSV07_iclm_rep_dynamic');
M_.lead_lag_incidence = [
 0 4 14;
 0 5 15;
 0 6 16;
 1 7 0;
 2 8 0;
 3 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;]';
M_.nstatic = 4;
M_.nfwrd   = 3;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 3;
M_.ndynamic   = 6;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(22, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 48;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.33;
alpha = M_.params( 1 );
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 5 ) = 0.2;
gamma_g = M_.params( 5 );
M_.params( 6 ) = 0.025;
delta = M_.params( 6 );
M_.params( 7 ) = 1;
eta = M_.params( 7 );
M_.params( 8 ) = 0.75;
theta = M_.params( 8 );
M_.params( 11 ) = 0.5;
lambda = M_.params( 11 );
M_.params( 13 ) = 1.2;
my_p = M_.params( 13 );
M_.params( 21 ) = 0.2;
psi = M_.params( 21 );
M_.params( 19 ) = 1.5;
phi_pi = M_.params( 19 );
M_.params( 14 ) = M_.params(2)^(-1)-1;
rho = M_.params( 14 );
M_.params( 3 ) = 1-M_.params(5)-M_.params(6)*M_.params(1)/((M_.params(6)+M_.params(14))*M_.params(13));
gamma_c = M_.params( 3 );
M_.params( 4 ) = M_.params(5)+M_.params(3);
gamma_c_bar = M_.params( 4 );
M_.params( 12 ) = (1-M_.params(2)*M_.params(8))*(1-M_.params(8))/M_.params(8);
lambda_p = M_.params( 12 );
M_.params( 17 ) = 0.33;
phi_b = M_.params( 17 );
M_.params( 18 ) = 0.10;
phi_g = M_.params( 18 );
M_.params( 15 ) = 0.9;
rho_g = M_.params( 15 );
M_.params( 22 ) = 1/(M_.params(13)*M_.params(3)-M_.params(11)*(1-M_.params(1)));
phicap = M_.params( 22 );
M_.params( 16 ) = 1/(M_.params(13)*M_.params(3)*(1-M_.params(11))*M_.params(22));
sigma_bar = M_.params( 16 );
M_.params( 20 ) = M_.params(7)*(1-M_.params(2)*(1-M_.params(6)))*(1-M_.params(4));
omega = M_.params( 20 );
M_.params( 10 ) = M_.params(13)*M_.params(11)*M_.params(22);
theta_tau = M_.params( 10 );
M_.params( 9 ) = (1-M_.params(1))*M_.params(11)*M_.params(22)*(1+M_.params(21));
theta_n = M_.params( 9 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
options_.irf = 20;
options_.nograph = 1;
options_.noprint = 1;
var_list_=[];
info = stoch_simul(var_list_);
save('NK_GLSV07_iclm_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_GLSV07_iclm_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_GLSV07_iclm_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_GLSV07_iclm_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_GLSV07_iclm_rep_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
