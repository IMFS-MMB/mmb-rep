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
M_.fname = 'NK_MI14_rep_neg';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_MI14_rep_neg.log');
M_.exo_names = 'epsa';
M_.exo_names_tex = 'epsa';
M_.exo_names_long = 'epsa';
M_.exo_names = char(M_.exo_names, 'hireg');
M_.exo_names_tex = char(M_.exo_names_tex, 'hireg');
M_.exo_names_long = char(M_.exo_names_long, 'hireg');
M_.endo_names = 'a';
M_.endo_names_tex = 'a';
M_.endo_names_long = 'a';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'pie');
M_.endo_names_tex = char(M_.endo_names_tex, 'pie');
M_.endo_names_long = char(M_.endo_names_long, 'pie');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'th');
M_.endo_names_tex = char(M_.endo_names_tex, 'th');
M_.endo_names_long = char(M_.endo_names_long, 'th');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'gendo');
M_.endo_names_tex = char(M_.endo_names_tex, 'gendo');
M_.endo_names_long = char(M_.endo_names_long, 'gendo');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names_long = char(M_.endo_names_long, 'u');
M_.endo_names = char(M_.endo_names, 'h');
M_.endo_names_tex = char(M_.endo_names_tex, 'h');
M_.endo_names_long = char(M_.endo_names_long, 'h');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'mpl');
M_.endo_names_tex = char(M_.endo_names_tex, 'mpl');
M_.endo_names_long = char(M_.endo_names_long, 'mpl');
M_.endo_names = char(M_.endo_names, 'f');
M_.endo_names_tex = char(M_.endo_names_tex, 'f');
M_.endo_names_long = char(M_.endo_names_long, 'f');
M_.endo_partitions = struct();
M_.param_names = 'phi';
M_.param_names_tex = 'phi';
M_.param_names_long = 'phi';
M_.param_names = char(M_.param_names, 'phipi');
M_.param_names_tex = char(M_.param_names_tex, 'phipi');
M_.param_names_long = char(M_.param_names_long, 'phipi');
M_.param_names = char(M_.param_names, 'D');
M_.param_names_tex = char(M_.param_names_tex, 'D');
M_.param_names_long = char(M_.param_names_long, 'D');
M_.param_names = char(M_.param_names, 's');
M_.param_names_tex = char(M_.param_names_tex, 's');
M_.param_names_long = char(M_.param_names_long, 's');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'r');
M_.param_names_tex = char(M_.param_names_tex, 'r');
M_.param_names_long = char(M_.param_names_long, 'r');
M_.param_names = char(M_.param_names, 'omegah');
M_.param_names_tex = char(M_.param_names_tex, 'omegah');
M_.param_names_long = char(M_.param_names_long, 'omegah');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, 'omega');
M_.param_names_long = char(M_.param_names_long, 'omega');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'R_ss');
M_.param_names_tex = char(M_.param_names_tex, 'R\_ss');
M_.param_names_long = char(M_.param_names_long, 'R_ss');
M_.param_names = char(M_.param_names, 'rhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa');
M_.param_names_long = char(M_.param_names_long, 'rhoa');
M_.param_names = char(M_.param_names, 'epsilon');
M_.param_names_tex = char(M_.param_names_tex, 'epsilon');
M_.param_names_long = char(M_.param_names_long, 'epsilon');
M_.param_names = char(M_.param_names, 'sigmaa');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaa');
M_.param_names_long = char(M_.param_names_long, 'sigmaa');
M_.param_names = char(M_.param_names, 'phir');
M_.param_names_tex = char(M_.param_names_tex, 'phir');
M_.param_names_long = char(M_.param_names_long, 'phir');
M_.param_names = char(M_.param_names, 'zeta');
M_.param_names_tex = char(M_.param_names_tex, 'zeta');
M_.param_names_long = char(M_.param_names_long, 'zeta');
M_.param_names = char(M_.param_names, 'gexo');
M_.param_names_tex = char(M_.param_names_tex, 'gexo');
M_.param_names_long = char(M_.param_names_long, 'gexo');
M_.param_names = char(M_.param_names, 'th_ss');
M_.param_names_tex = char(M_.param_names_tex, 'th\_ss');
M_.param_names_long = char(M_.param_names_long, 'th_ss');
M_.param_names = char(M_.param_names, 'n_ss');
M_.param_names_tex = char(M_.param_names_tex, 'n\_ss');
M_.param_names_long = char(M_.param_names_long, 'n_ss');
M_.param_names = char(M_.param_names, 'a_ss');
M_.param_names_tex = char(M_.param_names_tex, 'a\_ss');
M_.param_names_long = char(M_.param_names_long, 'a_ss');
M_.param_names = char(M_.param_names, 'l_ss');
M_.param_names_tex = char(M_.param_names_tex, 'l\_ss');
M_.param_names_long = char(M_.param_names_long, 'l_ss');
M_.param_names = char(M_.param_names, 'u_ss');
M_.param_names_tex = char(M_.param_names_tex, 'u\_ss');
M_.param_names_long = char(M_.param_names_long, 'u_ss');
M_.param_names = char(M_.param_names, 'h_ss');
M_.param_names_tex = char(M_.param_names_tex, 'h\_ss');
M_.param_names_long = char(M_.param_names_long, 'h_ss');
M_.param_names = char(M_.param_names, 'w_ss');
M_.param_names_tex = char(M_.param_names_tex, 'w\_ss');
M_.param_names_long = char(M_.param_names_long, 'w_ss');
M_.param_names = char(M_.param_names, 'mpl_ss');
M_.param_names_tex = char(M_.param_names_tex, 'mpl\_ss');
M_.param_names_long = char(M_.param_names_long, 'mpl_ss');
M_.param_names = char(M_.param_names, 'f_ss');
M_.param_names_tex = char(M_.param_names_tex, 'f\_ss');
M_.param_names_long = char(M_.param_names_long, 'f_ss');
M_.param_names = char(M_.param_names, 'g_ss');
M_.param_names_tex = char(M_.param_names_tex, 'g\_ss');
M_.param_names_long = char(M_.param_names_long, 'g_ss');
M_.param_names = char(M_.param_names, 'y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'y\_ss');
M_.param_names_long = char(M_.param_names_long, 'y_ss');
M_.param_names = char(M_.param_names, 'c_ss');
M_.param_names_tex = char(M_.param_names_tex, 'c\_ss');
M_.param_names_long = char(M_.param_names_long, 'c_ss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 15;
M_.param_nbr = 30;
M_.orig_endo_nbr = 15;
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
erase_compiled_function('NK_MI14_rep_neg_static');
erase_compiled_function('NK_MI14_rep_neg_dynamic');
M_.orig_eq_nbr = 15;
M_.eq_nbr = 15;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 5 20;
 0 6 21;
 0 7 22;
 0 8 0;
 2 9 0;
 0 10 23;
 3 11 0;
 0 12 0;
 4 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 0;]';
M_.nstatic = 8;
M_.nfwrd   = 3;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 4;
M_.ndynamic   = 7;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(15, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(30, 1);
M_.NNZDerivatives = [54; 0; -1];
M_.params( 9 ) = 0.66;
alpha = M_.params( 9 );
M_.params( 14 ) = 11;
epsilon = M_.params( 14 );
M_.params( 5 ) = 0.999014076834481;
delta = M_.params( 5 );
M_.params( 8 ) = 0.7;
eta = M_.params( 8 );
M_.params( 4 ) = 0.008950757575758;
s = M_.params( 4 );
M_.params( 11 ) = 0.5;
gamma = M_.params( 11 );
M_.params( 2 ) = 1.5;
phipi = M_.params( 2 );
M_.params( 16 ) = 0.961467727988398;
phir = M_.params( 16 );
M_.params( 1 ) = 61;
phi = M_.params( 1 );
M_.params( 13 ) = 0.991693729807990;
rhoa = M_.params( 13 );
M_.params( 3 ) = M_.params(5)*(1-M_.params(4));
D = M_.params( 3 );
M_.params( 17 ) = 0.165479788012770;
zeta = M_.params( 17 );
M_.params( 18 ) = 0.156346165403230;
gexo = M_.params( 18 );
valg=0.005;
M_.params( 15 ) = 0.003022418150967;
sigmaa = M_.params( 15 );
M_.params( 23 ) = 0.064;
u_ss = M_.params( 23 );
M_.params( 19 ) = 0.425619083447042;
th_ss = M_.params( 19 );
M_.params( 20 ) = (1-M_.params(23))/(1-M_.params(4));
n_ss = M_.params( 20 );
M_.params( 21 ) = 1;
a_ss = M_.params( 21 );
M_.params( 28 ) = M_.params(17)*M_.params(20);
g_ss = M_.params( 28 );
M_.params( 22 ) = M_.params(20)-M_.params(28);
l_ss = M_.params( 22 );
M_.params( 7 ) = M_.params(4)*M_.params(20)*M_.params(19)^(M_.params(8)-1)/M_.params(23);
omegah = M_.params( 7 );
M_.params( 10 ) = (M_.params(14)-1)/M_.params(14)*M_.params(9)*M_.params(22)^(M_.params(9)-1)/(1+(1-M_.params(3))*0.32/(M_.params(7)*M_.params(19)^(-M_.params(8))));
omega = M_.params( 10 );
M_.params( 6 ) = 0.32*M_.params(10);
r = M_.params( 6 );
M_.params( 24 ) = M_.params(4)*M_.params(20);
h_ss = M_.params( 24 );
M_.params( 25 ) = M_.params(10)*M_.params(21)^M_.params(11);
w_ss = M_.params( 25 );
M_.params( 26 ) = M_.params(22)^(M_.params(9)-1)*M_.params(9)*M_.params(21);
mpl_ss = M_.params( 26 );
M_.params( 27 ) = min(1,M_.params(7)*M_.params(19)^(1-M_.params(8)));
f_ss = M_.params( 27 );
M_.params( 12 ) = 1/M_.params(5);
R_ss = M_.params( 12 );
M_.params( 29 ) = M_.params(21)*M_.params(22)^M_.params(9);
y_ss = M_.params( 29 );
M_.params( 30 ) = M_.params(29)-M_.params(21)*M_.params(6)*M_.params(24)/(M_.params(7)*M_.params(19)^(-M_.params(8)));
c_ss = M_.params( 30 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 5 ) = M_.params(20);
oo_.steady_state( 6 ) = M_.params(19);
oo_.steady_state( 4 ) = M_.params(22);
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 2 ) = M_.params(30);
oo_.steady_state( 10 ) = M_.params(29);
oo_.steady_state( 1 ) = M_.params(21);
oo_.steady_state( 7 ) = M_.params(12);
oo_.steady_state( 9 ) = 0;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 2 ) = 0;
oo_.steady_state( 8 ) = oo_.steady_state(9)+M_.params(18);
oo_.steady_state( 11 ) = M_.params(23);
oo_.steady_state( 12 ) = M_.params(24);
oo_.steady_state( 13 ) = M_.params(25);
oo_.steady_state( 14 ) = M_.params(26);
oo_.steady_state( 15 ) = M_.params(27);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',(-12)*M_.params(15)) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',2,'multiplicative',0,'periods',1:1,'value',valg) ];
M_.exo_det_length = 0;
options_.periods = 15000;
perfect_foresight_setup;
perfect_foresight_solver;
save('NK_MI14_rep_neg_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_MI14_rep_neg_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_MI14_rep_neg_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_MI14_rep_neg_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_MI14_rep_neg_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_MI14_rep_neg_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_MI14_rep_neg_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
