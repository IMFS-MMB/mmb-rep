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
M_.fname = 'NK_JO15_lt_rep';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_JO15_lt_rep.log');
M_.exo_names = 'm';
M_.exo_names_tex = 'm';
M_.exo_names_long = 'm';
M_.exo_names = char(M_.exo_names, 'm_star');
M_.exo_names_tex = char(M_.exo_names_tex, 'm\_star');
M_.exo_names_long = char(M_.exo_names_long, 'm_star');
M_.exo_names = char(M_.exo_names, 'xi');
M_.exo_names_tex = char(M_.exo_names_tex, 'xi');
M_.exo_names_long = char(M_.exo_names_long, 'xi');
M_.exo_names = char(M_.exo_names, 'xi_star');
M_.exo_names_tex = char(M_.exo_names_tex, 'xi\_star');
M_.exo_names_long = char(M_.exo_names_long, 'xi_star');
M_.endo_names = 'x';
M_.endo_names_tex = 'x';
M_.endo_names_long = 'x';
M_.endo_names = char(M_.endo_names, 'pi_H');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_H');
M_.endo_names_long = char(M_.endo_names_long, 'pi_H');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'x_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'x\_star');
M_.endo_names_long = char(M_.endo_names_long, 'x_star');
M_.endo_names = char(M_.endo_names, 'pi_F_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_F\_star');
M_.endo_names_long = char(M_.endo_names_long, 'pi_F_star');
M_.endo_names = char(M_.endo_names, 'r_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_star');
M_.endo_names_long = char(M_.endo_names_long, 'r_star');
M_.endo_names = char(M_.endo_names, 'pi_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_star');
M_.endo_names_long = char(M_.endo_names_long, 'pi_star');
M_.endo_names = char(M_.endo_names, 'r_bar');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_bar');
M_.endo_names_long = char(M_.endo_names_long, 'r_bar');
M_.endo_names = char(M_.endo_names, 'r_bar_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_bar\_star');
M_.endo_names_long = char(M_.endo_names_long, 'r_bar_star');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'a_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'a\_star');
M_.endo_names_long = char(M_.endo_names_long, 'a_star');
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'mc_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc\_star');
M_.endo_names_long = char(M_.endo_names_long, 'mc_star');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'y_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_star');
M_.endo_names_long = char(M_.endo_names_long, 'y_star');
M_.endo_names = char(M_.endo_names, 'y_bar');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_bar');
M_.endo_names_long = char(M_.endo_names_long, 'y_bar');
M_.endo_names = char(M_.endo_names, 'y_bar_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_bar\_star');
M_.endo_names_long = char(M_.endo_names_long, 'y_bar_star');
M_.endo_names = char(M_.endo_names, 'p');
M_.endo_names_tex = char(M_.endo_names_tex, 'p');
M_.endo_names_long = char(M_.endo_names_long, 'p');
M_.endo_names = char(M_.endo_names, 'p_star');
M_.endo_names_tex = char(M_.endo_names_tex, 'p\_star');
M_.endo_names_long = char(M_.endo_names_long, 'p_star');
M_.endo_names = char(M_.endo_names, 'e');
M_.endo_names_tex = char(M_.endo_names_tex, 'e');
M_.endo_names_long = char(M_.endo_names_long, 'e');
M_.endo_names = char(M_.endo_names, 's');
M_.endo_names_tex = char(M_.endo_names_tex, 's');
M_.endo_names_long = char(M_.endo_names_long, 's');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_partitions = struct();
M_.param_names = 'sigma';
M_.param_names_tex = 'sigma';
M_.param_names_long = 'sigma';
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'theta_H');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_H');
M_.param_names_long = char(M_.param_names_long, 'theta_H');
M_.param_names = char(M_.param_names, 'theta_F');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_F');
M_.param_names_long = char(M_.param_names_long, 'theta_F');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'varphi');
M_.param_names_tex = char(M_.param_names_tex, 'varphi');
M_.param_names_long = char(M_.param_names_long, 'varphi');
M_.param_names = char(M_.param_names, 'kappa_H');
M_.param_names_tex = char(M_.param_names_tex, 'kappa\_H');
M_.param_names_long = char(M_.param_names_long, 'kappa_H');
M_.param_names = char(M_.param_names, 'kappa_F');
M_.param_names_tex = char(M_.param_names_tex, 'kappa\_F');
M_.param_names_long = char(M_.param_names_long, 'kappa_F');
M_.param_names = char(M_.param_names, 'omega_2');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_2');
M_.param_names_long = char(M_.param_names_long, 'omega_2');
M_.param_names = char(M_.param_names, 'omega_4');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_4');
M_.param_names_long = char(M_.param_names_long, 'omega_4');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'varsigma');
M_.param_names_tex = char(M_.param_names_tex, 'varsigma');
M_.param_names_long = char(M_.param_names_long, 'varsigma');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'sigma_omega');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_omega');
M_.param_names_long = char(M_.param_names_long, 'sigma_omega');
M_.param_names = char(M_.param_names, 'oomega_2');
M_.param_names_tex = char(M_.param_names_tex, 'oomega\_2');
M_.param_names_long = char(M_.param_names_long, 'oomega_2');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'rho_star');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_star');
M_.param_names_long = char(M_.param_names_long, 'rho_star');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi');
M_.param_names_long = char(M_.param_names_long, 'phi_pi');
M_.param_names = char(M_.param_names, 'phi_pi_star');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi\_star');
M_.param_names_long = char(M_.param_names_long, 'phi_pi_star');
M_.param_names = char(M_.param_names, 'phi_x');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_x');
M_.param_names_long = char(M_.param_names_long, 'phi_x');
M_.param_names = char(M_.param_names, 'phi_x_star');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_x\_star');
M_.param_names_long = char(M_.param_names_long, 'phi_x_star');
M_.param_names = char(M_.param_names, 'varrho');
M_.param_names_tex = char(M_.param_names_tex, 'varrho');
M_.param_names_long = char(M_.param_names_long, 'varrho');
M_.param_names = char(M_.param_names, 'varrho_star');
M_.param_names_tex = char(M_.param_names_tex, 'varrho\_star');
M_.param_names_long = char(M_.param_names_long, 'varrho_star');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 23;
M_.param_nbr = 24;
M_.orig_endo_nbr = 23;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('NK_JO15_lt_rep_static');
erase_compiled_function('NK_JO15_lt_rep_dynamic');
M_.orig_eq_nbr = 23;
M_.eq_nbr = 23;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 9 32;
 0 10 33;
 2 11 0;
 0 12 0;
 3 13 34;
 0 14 35;
 4 15 0;
 0 16 36;
 0 17 0;
 0 18 0;
 5 19 0;
 6 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 7 27 0;
 8 28 0;
 0 29 0;
 0 30 0;
 0 31 0;]';
M_.nstatic = 12;
M_.nfwrd   = 3;
M_.npred   = 6;
M_.nboth   = 2;
M_.nsfwrd   = 5;
M_.nspred   = 8;
M_.ndynamic   = 11;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(23, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(24, 1);
M_.NNZDerivatives = [101; 0; -1];
M_.params( 1 ) = 4.5;
sigma = M_.params( 1 );
M_.params( 2 ) = 2.5;
eta = M_.params( 2 );
M_.params( 3 ) = 0.99;
beta = M_.params( 3 );
M_.params( 4 ) = 0.9;
theta_H = M_.params( 4 );
M_.params( 5 ) = 0.75;
theta_F = M_.params( 5 );
M_.params( 6 ) = 0.1;
alpha = M_.params( 6 );
M_.params( 8 ) = (1-M_.params(4))*(1-M_.params(4)*M_.params(3))/M_.params(4);
kappa_H = M_.params( 8 );
M_.params( 9 ) = (1-M_.params(5))*(1-M_.params(3)*M_.params(5))/M_.params(5);
kappa_F = M_.params( 9 );
M_.params( 7 ) = 3;
varphi = M_.params( 7 );
M_.params( 10 ) = 2*M_.params(6)*(1-M_.params(6))*(M_.params(1)*M_.params(2)-1);
omega_2 = M_.params( 10 );
M_.params( 11 ) = (M_.params(1)*M_.params(2)-1)*(1-M_.params(6))*M_.params(6)*4;
omega_4 = M_.params( 11 );
M_.params( 12 ) = (1+M_.params(11))*(1+M_.params(7));
psi = M_.params( 12 );
M_.params( 13 ) = M_.params(1)*(1+M_.params(10))+(1+M_.params(11))*M_.params(7);
varsigma = M_.params( 13 );
M_.params( 14 ) = M_.params(1)^2*(1+2*M_.params(10))+(1+M_.params(11))*(1+M_.params(10))*M_.params(7)*2*M_.params(1)+(1+M_.params(11))^2*M_.params(7)^2;
delta = M_.params( 14 );
M_.params( 15 ) = M_.params(1)*(1+M_.params(10))/(1+M_.params(11));
sigma_omega = M_.params( 15 );
M_.params( 16 ) = (1+M_.params(7))*M_.params(6)*M_.params(1)*(M_.params(13)+M_.params(1)*M_.params(10))/M_.params(14);
oomega_2 = M_.params( 16 );
M_.params( 17 ) = 0.55;
rho = M_.params( 17 );
M_.params( 18 ) = 0.55;
rho_star = M_.params( 18 );
M_.params( 19 ) = 1.5;
phi_pi = M_.params( 19 );
M_.params( 20 ) = 1.5;
phi_pi_star = M_.params( 20 );
M_.params( 21 ) = 0.5;
phi_x = M_.params( 21 );
M_.params( 22 ) = 0.5;
phi_x_star = M_.params( 22 );
M_.params( 23 ) = 0.4;
varrho = M_.params( 23 );
M_.params( 24 ) = 0.4;
varrho_star = M_.params( 24 );
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
oo_.steady_state( 8 ) = 0;
oo_.exo_steady_state( 3 ) = 0;
oo_.exo_steady_state( 4 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(4, 4) = (1)^2;
options_.irf = 40;
options_.nograph = 1;
var_list_ = char('p_star','e','s','q');
info = stoch_simul(var_list_);
save('NK_JO15_lt_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_JO15_lt_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_JO15_lt_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_JO15_lt_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_JO15_lt_rep_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_JO15_lt_rep_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_JO15_lt_rep_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
