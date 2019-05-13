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
M_.fname = 'NK_GS14_rep';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_GS14_rep.log');
M_.exo_names = 'e_A_e';
M_.exo_names_tex = 'e\_A\_e';
M_.exo_names_long = 'e_A_e';
M_.exo_names = char(M_.exo_names, 'e_mk_y');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_mk\_y');
M_.exo_names_long = char(M_.exo_names_long, 'e_mk_y');
M_.endo_names = 'c_p';
M_.endo_names_tex = 'c\_p';
M_.endo_names_long = 'c_p';
M_.endo_names = char(M_.endo_names, 'd_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'd\_p');
M_.endo_names_long = char(M_.endo_names_long, 'd_p');
M_.endo_names = char(M_.endo_names, 'lam_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'lam\_p');
M_.endo_names_long = char(M_.endo_names_long, 'lam_p');
M_.endo_names = char(M_.endo_names, 'l_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'l\_p');
M_.endo_names_long = char(M_.endo_names_long, 'l_p');
M_.endo_names = char(M_.endo_names, 'c_e');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_e');
M_.endo_names_long = char(M_.endo_names_long, 'c_e');
M_.endo_names = char(M_.endo_names, 'k_e');
M_.endo_names_tex = char(M_.endo_names_tex, 'k\_e');
M_.endo_names_long = char(M_.endo_names_long, 'k_e');
M_.endo_names = char(M_.endo_names, 'b_ee');
M_.endo_names_tex = char(M_.endo_names_tex, 'b\_ee');
M_.endo_names_long = char(M_.endo_names_long, 'b_ee');
M_.endo_names = char(M_.endo_names, 'lam_e');
M_.endo_names_tex = char(M_.endo_names_tex, 'lam\_e');
M_.endo_names_long = char(M_.endo_names_long, 'lam_e');
M_.endo_names = char(M_.endo_names, 's_e');
M_.endo_names_tex = char(M_.endo_names_tex, 's\_e');
M_.endo_names_long = char(M_.endo_names_long, 's_e');
M_.endo_names = char(M_.endo_names, 'l_pd');
M_.endo_names_tex = char(M_.endo_names_tex, 'l\_pd');
M_.endo_names_long = char(M_.endo_names_long, 'l_pd');
M_.endo_names = char(M_.endo_names, 'y_e');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_e');
M_.endo_names_long = char(M_.endo_names_long, 'y_e');
M_.endo_names = char(M_.endo_names, 'r_k');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_k');
M_.endo_names_long = char(M_.endo_names_long, 'r_k');
M_.endo_names = char(M_.endo_names, 'pie');
M_.endo_names_tex = char(M_.endo_names_tex, 'pie');
M_.endo_names_long = char(M_.endo_names_long, 'pie');
M_.endo_names = char(M_.endo_names, 'mc_E');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc\_E');
M_.endo_names_long = char(M_.endo_names_long, 'mc_E');
M_.endo_names = char(M_.endo_names, 'J_R');
M_.endo_names_tex = char(M_.endo_names_tex, 'J\_R');
M_.endo_names_long = char(M_.endo_names_long, 'J_R');
M_.endo_names = char(M_.endo_names, 'q_k');
M_.endo_names_tex = char(M_.endo_names_tex, 'q\_k');
M_.endo_names_long = char(M_.endo_names_long, 'q_k');
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, 'x');
M_.endo_names_long = char(M_.endo_names_long, 'x');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names_long = char(M_.endo_names_long, 'C');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'w_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'w\_p');
M_.endo_names_long = char(M_.endo_names_long, 'w_p');
M_.endo_names = char(M_.endo_names, 'B');
M_.endo_names_tex = char(M_.endo_names_tex, 'B');
M_.endo_names_long = char(M_.endo_names_long, 'B');
M_.endo_names = char(M_.endo_names, 'D');
M_.endo_names_tex = char(M_.endo_names_tex, 'D');
M_.endo_names_long = char(M_.endo_names_long, 'D');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'r_ib');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_ib');
M_.endo_names_long = char(M_.endo_names_long, 'r_ib');
M_.endo_names = char(M_.endo_names, 'J_B');
M_.endo_names_tex = char(M_.endo_names_tex, 'J\_B');
M_.endo_names_long = char(M_.endo_names_long, 'J_B');
M_.endo_names = char(M_.endo_names, 'r_b');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_b');
M_.endo_names_long = char(M_.endo_names_long, 'r_b');
M_.endo_names = char(M_.endo_names, 'spread');
M_.endo_names_tex = char(M_.endo_names_tex, 'spread');
M_.endo_names_long = char(M_.endo_names_long, 'spread');
M_.endo_names = char(M_.endo_names, 'K_b');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_b');
M_.endo_names_long = char(M_.endo_names_long, 'K_b');
M_.endo_names = char(M_.endo_names, 'R_b');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_b');
M_.endo_names_long = char(M_.endo_names_long, 'R_b');
M_.endo_names = char(M_.endo_names, 'lev');
M_.endo_names_tex = char(M_.endo_names_tex, 'lev');
M_.endo_names_long = char(M_.endo_names_long, 'lev');
M_.endo_names = char(M_.endo_names, 'rr');
M_.endo_names_tex = char(M_.endo_names_tex, 'rr');
M_.endo_names_long = char(M_.endo_names_long, 'rr');
M_.endo_names = char(M_.endo_names, 'Y1');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y1');
M_.endo_names_long = char(M_.endo_names_long, 'Y1');
M_.endo_names = char(M_.endo_names, 'mk_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'mk\_y');
M_.endo_names_long = char(M_.endo_names_long, 'mk_y');
M_.endo_names = char(M_.endo_names, 'A_e');
M_.endo_names_tex = char(M_.endo_names_tex, 'A\_e');
M_.endo_names_long = char(M_.endo_names_long, 'A_e');
M_.endo_partitions = struct();
M_.param_names = 'beta_p';
M_.param_names_tex = 'beta\_p';
M_.param_names_long = 'beta_p';
M_.param_names = char(M_.param_names, 'beta_e');
M_.param_names_tex = char(M_.param_names_tex, 'beta\_e');
M_.param_names_long = char(M_.param_names_long, 'beta_e');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'm_e_ss');
M_.param_names_tex = char(M_.param_names_tex, 'm\_e\_ss');
M_.param_names_long = char(M_.param_names_long, 'm_e_ss');
M_.param_names = char(M_.param_names, 'gamma_p');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_p');
M_.param_names_long = char(M_.param_names_long, 'gamma_p');
M_.param_names = char(M_.param_names, 'gamma_e');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_e');
M_.param_names_long = char(M_.param_names_long, 'gamma_e');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'vi');
M_.param_names_tex = char(M_.param_names_tex, 'vi');
M_.param_names_long = char(M_.param_names_long, 'vi');
M_.param_names = char(M_.param_names, 'mcspread');
M_.param_names_tex = char(M_.param_names_tex, 'mcspread');
M_.param_names_long = char(M_.param_names_long, 'mcspread');
M_.param_names = char(M_.param_names, 'delta_b');
M_.param_names_tex = char(M_.param_names_tex, 'delta\_b');
M_.param_names_long = char(M_.param_names_long, 'delta_b');
M_.param_names = char(M_.param_names, 'eps_y');
M_.param_names_tex = char(M_.param_names_tex, 'eps\_y');
M_.param_names_long = char(M_.param_names_long, 'eps_y');
M_.param_names = char(M_.param_names, 'mk_y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'mk\_y\_ss');
M_.param_names_long = char(M_.param_names_long, 'mk_y_ss');
M_.param_names = char(M_.param_names, 'ksi');
M_.param_names_tex = char(M_.param_names_tex, 'ksi');
M_.param_names_long = char(M_.param_names_long, 'ksi');
M_.param_names = char(M_.param_names, 'kappa_p');
M_.param_names_tex = char(M_.param_names_tex, 'kappa\_p');
M_.param_names_long = char(M_.param_names_long, 'kappa_p');
M_.param_names = char(M_.param_names, 'kappa_i');
M_.param_names_tex = char(M_.param_names_tex, 'kappa\_i');
M_.param_names_long = char(M_.param_names_long, 'kappa_i');
M_.param_names = char(M_.param_names, 'deltak');
M_.param_names_tex = char(M_.param_names_tex, 'deltak');
M_.param_names_long = char(M_.param_names_long, 'deltak');
M_.param_names = char(M_.param_names, 'piss');
M_.param_names_tex = char(M_.param_names_tex, 'piss');
M_.param_names_long = char(M_.param_names_long, 'piss');
M_.param_names = char(M_.param_names, 'r_ib_ss');
M_.param_names_tex = char(M_.param_names_tex, 'r\_ib\_ss');
M_.param_names_long = char(M_.param_names_long, 'r_ib_ss');
M_.param_names = char(M_.param_names, 'rho_ib');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_ib');
M_.param_names_long = char(M_.param_names_long, 'rho_ib');
M_.param_names = char(M_.param_names, 'phi_pie');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pie');
M_.param_names_long = char(M_.param_names_long, 'phi_pie');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'phi_AP');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_AP');
M_.param_names_long = char(M_.param_names_long, 'phi_AP');
M_.param_names = char(M_.param_names, 'phi_B');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_B');
M_.param_names_long = char(M_.param_names_long, 'phi_B');
M_.param_names = char(M_.param_names, 'rho_A_e');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_A\_e');
M_.param_names_long = char(M_.param_names_long, 'rho_A_e');
M_.param_names = char(M_.param_names, 'rho_mk_y');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_mk\_y');
M_.param_names_long = char(M_.param_names_long, 'rho_mk_y');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 35;
M_.param_nbr = 25;
M_.orig_endo_nbr = 35;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('NK_GS14_rep_static');
erase_compiled_function('NK_GS14_rep_dynamic');
M_.orig_eq_nbr = 35;
M_.eq_nbr = 35;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 12 0;
 1 13 0;
 0 14 47;
 0 15 0;
 0 16 0;
 2 17 0;
 3 18 0;
 0 19 48;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 49;
 0 24 50;
 0 25 0;
 0 26 0;
 0 27 51;
 0 28 0;
 4 29 52;
 0 30 0;
 0 31 53;
 0 32 0;
 0 33 0;
 0 34 0;
 5 35 0;
 6 36 0;
 7 37 0;
 8 38 0;
 0 39 0;
 9 40 0;
 0 41 0;
 0 42 0;
 0 43 0;
 0 44 0;
 10 45 0;
 11 46 0;]';
M_.nstatic = 18;
M_.nfwrd   = 6;
M_.npred   = 10;
M_.nboth   = 1;
M_.nsfwrd   = 7;
M_.nspred   = 11;
M_.ndynamic   = 17;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(35, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(25, 1);
M_.NNZDerivatives = [138; -1; -1];
M_.params( 1 ) = 0.996;
beta_p = M_.params( 1 );
M_.params( 2 ) = 0.975;
beta_e = M_.params( 2 );
M_.params( 3 ) = 1;
phi = M_.params( 3 );
M_.params( 4 ) = 0.35;
m_e_ss = M_.params( 4 );
M_.params( 5 ) = 1;
gamma_p = M_.params( 5 );
M_.params( 6 ) = 1;
gamma_e = M_.params( 6 );
M_.params( 11 ) = 6;
eps_y = M_.params( 11 );
M_.params( 12 ) = M_.params(11)/(M_.params(11)-1);
mk_y_ss = M_.params( 12 );
M_.params( 13 ) = 0.20;
ksi = M_.params( 13 );
M_.params( 14 ) = 28.65;
kappa_p = M_.params( 14 );
M_.params( 15 ) = 5;
kappa_i = M_.params( 15 );
M_.params( 16 ) = 0.050;
deltak = M_.params( 16 );
M_.params( 17 ) = 1.00;
piss = M_.params( 17 );
M_.params( 18 ) = M_.params(17)/M_.params(1)-1;
r_ib_ss = M_.params( 18 );
M_.params( 7 ) = 11;
theta = M_.params( 7 );
M_.params( 8 ) = 0.09;
vi = M_.params( 8 );
M_.params( 9 ) = 0.0050;
mcspread = M_.params( 9 );
M_.params( 10 ) = M_.params(18)+M_.params(9)/M_.params(8);
delta_b = M_.params( 10 );
M_.params( 19 ) = 0.77;
rho_ib = M_.params( 19 );
M_.params( 20 ) = 0.5;
phi_pie = M_.params( 20 );
M_.params( 21 ) = 0;
phi_y = M_.params( 21 );
M_.params( 22 ) = 0;
phi_AP = M_.params( 22 );
M_.params( 23 ) = 0;
phi_B = M_.params( 23 );
M_.params( 24 ) = 0.95;
rho_A_e = M_.params( 24 );
M_.params( 25 ) = 0.50;
rho_mk_y = M_.params( 25 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = (-0.137462976);
oo_.steady_state( 2 ) = (-0.559765003);
oo_.steady_state( 3 ) = 0.137462976;
oo_.steady_state( 4 ) = (-0.114893574);
oo_.steady_state( 5 ) = (-2.690622647);
oo_.steady_state( 6 ) = 0.65064922;
oo_.steady_state( 7 ) = (-0.465454324);
oo_.steady_state( 8 ) = 2.690622647;
oo_.steady_state( 9 ) = (-0.643270157);
oo_.steady_state( 10 ) = (-0.114893574);
oo_.steady_state( 11 ) = 0.038214985;
oo_.steady_state( 12 ) = (-2.404193704);
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 14 ) = (-0.182321557);
oo_.steady_state( 15 ) = (-1.753544484);
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 17 ) = 0.182321557;
oo_.steady_state( 18 ) = (-2.345083053);
oo_.steady_state( 19 ) = (-0.062508258);
oo_.steady_state( 20 ) = 0.038214985;
oo_.steady_state( 21 ) = (-0.252356549);
oo_.steady_state( 22 ) = (-0.465454324);
oo_.steady_state( 23 ) = (-0.559765003);
oo_.steady_state( 24 ) = 0.65064922;
oo_.steady_state( 25 ) = 0.01010101;
oo_.steady_state( 26 ) = (-5.596717606);
oo_.steady_state( 27 ) = 0.01510101;
oo_.steady_state( 28 ) = 0.005;
oo_.steady_state( 29 ) = (-2.873399932);
oo_.steady_state( 30 ) = 0.01510101;
oo_.steady_state( 31 ) = 2.407945609;
oo_.steady_state( 32 ) = (-0.98489899);
oo_.steady_state( 33 ) = 0.034637676;
oo_.steady_state( 34 ) = 0.182321557;
oo_.steady_state( 35 ) = (-3E-15);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
options_.solve_algo = 0;
steady;
resid;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 1;
options_.nograph   = 1;
options_.irf = 20;
options_.order = 1;
options_.periods = 10000;
var_list_ = char('pie','Y','I','lev','r_ib','r_b');
info = stoch_simul(var_list_);
save('NK_GS14_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_GS14_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_GS14_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_GS14_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_GS14_rep_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_GS14_rep_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_GS14_rep_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
