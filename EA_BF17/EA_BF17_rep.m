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
M_.fname = 'EA_BF17_rep';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('EA_BF17_rep.log');
M_.exo_names = 'up';
M_.exo_names_tex = 'up';
M_.exo_names_long = 'up';
M_.exo_names = char(M_.exo_names, 'ui');
M_.exo_names_tex = char(M_.exo_names_tex, 'ui');
M_.exo_names_long = char(M_.exo_names_long, 'ui');
M_.exo_names = char(M_.exo_names, 'um');
M_.exo_names_tex = char(M_.exo_names_tex, 'um');
M_.exo_names_long = char(M_.exo_names_long, 'um');
M_.exo_names = char(M_.exo_names, 'ua');
M_.exo_names_tex = char(M_.exo_names_tex, 'ua');
M_.exo_names_long = char(M_.exo_names_long, 'ua');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'mp');
M_.endo_names_tex = char(M_.endo_names_tex, 'mp');
M_.endo_names_long = char(M_.endo_names_long, 'mp');
M_.endo_names = char(M_.endo_names, 'yf');
M_.endo_names_tex = char(M_.endo_names_tex, 'yf');
M_.endo_names_long = char(M_.endo_names_long, 'yf');
M_.endo_names = char(M_.endo_names, 'mpf');
M_.endo_names_tex = char(M_.endo_names_tex, 'mpf');
M_.endo_names_long = char(M_.endo_names_long, 'mpf');
M_.endo_names = char(M_.endo_names, 'ep');
M_.endo_names_tex = char(M_.endo_names_tex, 'ep');
M_.endo_names_long = char(M_.endo_names_long, 'ep');
M_.endo_names = char(M_.endo_names, 'ei');
M_.endo_names_tex = char(M_.endo_names_tex, 'ei');
M_.endo_names_long = char(M_.endo_names_long, 'ei');
M_.endo_names = char(M_.endo_names, 'em');
M_.endo_names_tex = char(M_.endo_names_tex, 'em');
M_.endo_names_long = char(M_.endo_names_long, 'em');
M_.endo_names = char(M_.endo_names, 'at');
M_.endo_names_tex = char(M_.endo_names_tex, 'at');
M_.endo_names_long = char(M_.endo_names_long, 'at');
M_.endo_names = char(M_.endo_names, 'ygap');
M_.endo_names_tex = char(M_.endo_names_tex, 'ygap');
M_.endo_names_long = char(M_.endo_names_long, 'ygap');
M_.endo_partitions = struct();
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'teta');
M_.param_names_tex = char(M_.param_names_tex, 'teta');
M_.param_names_long = char(M_.param_names_long, 'teta');
M_.param_names = char(M_.param_names, 'vega');
M_.param_names_tex = char(M_.param_names_tex, 'vega');
M_.param_names_long = char(M_.param_names_long, 'vega');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'neta');
M_.param_names_tex = char(M_.param_names_tex, 'neta');
M_.param_names_long = char(M_.param_names_long, 'neta');
M_.param_names = char(M_.param_names, 'epsilon');
M_.param_names_tex = char(M_.param_names_tex, 'epsilon');
M_.param_names_long = char(M_.param_names_long, 'epsilon');
M_.param_names = char(M_.param_names, 'b');
M_.param_names_tex = char(M_.param_names_tex, 'b');
M_.param_names_long = char(M_.param_names_long, 'b');
M_.param_names = char(M_.param_names, 'a1');
M_.param_names_tex = char(M_.param_names_tex, 'a1');
M_.param_names_long = char(M_.param_names_long, 'a1');
M_.param_names = char(M_.param_names, 'a2');
M_.param_names_tex = char(M_.param_names_tex, 'a2');
M_.param_names_long = char(M_.param_names_long, 'a2');
M_.param_names = char(M_.param_names, 'li1');
M_.param_names_tex = char(M_.param_names_tex, 'li1');
M_.param_names_long = char(M_.param_names_long, 'li1');
M_.param_names = char(M_.param_names, 'li2');
M_.param_names_tex = char(M_.param_names_tex, 'li2');
M_.param_names_long = char(M_.param_names_long, 'li2');
M_.param_names = char(M_.param_names, 'li3');
M_.param_names_tex = char(M_.param_names_tex, 'li3');
M_.param_names_long = char(M_.param_names_long, 'li3');
M_.param_names = char(M_.param_names, 'li4');
M_.param_names_tex = char(M_.param_names_tex, 'li4');
M_.param_names_long = char(M_.param_names_long, 'li4');
M_.param_names = char(M_.param_names, 'rhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa');
M_.param_names_long = char(M_.param_names_long, 'rhoa');
M_.param_names = char(M_.param_names, 'rhop');
M_.param_names_tex = char(M_.param_names_tex, 'rhop');
M_.param_names_long = char(M_.param_names_long, 'rhop');
M_.param_names = char(M_.param_names, 'rhoi');
M_.param_names_tex = char(M_.param_names_tex, 'rhoi');
M_.param_names_long = char(M_.param_names_long, 'rhoi');
M_.param_names = char(M_.param_names, 'rhom');
M_.param_names_tex = char(M_.param_names_tex, 'rhom');
M_.param_names_long = char(M_.param_names_long, 'rhom');
M_.param_names = char(M_.param_names, 'pb');
M_.param_names_tex = char(M_.param_names_tex, 'pb');
M_.param_names_long = char(M_.param_names_long, 'pb');
M_.param_names = char(M_.param_names, 'yb');
M_.param_names_tex = char(M_.param_names_tex, 'yb');
M_.param_names_long = char(M_.param_names_long, 'yb');
M_.param_names = char(M_.param_names, 'mpb');
M_.param_names_tex = char(M_.param_names_tex, 'mpb');
M_.param_names_long = char(M_.param_names_long, 'mpb');
M_.param_names = char(M_.param_names, 'rb');
M_.param_names_tex = char(M_.param_names_tex, 'rb');
M_.param_names_long = char(M_.param_names_long, 'rb');
M_.param_names = char(M_.param_names, 'cstd');
M_.param_names_tex = char(M_.param_names_tex, 'cstd');
M_.param_names_long = char(M_.param_names_long, 'cstd');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 11;
M_.param_nbr = 23;
M_.orig_endo_nbr = 11;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('EA_BF17_rep_static');
erase_compiled_function('EA_BF17_rep_dynamic');
M_.orig_eq_nbr = 11;
M_.eq_nbr = 11;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 6 17;
 0 7 18;
 1 8 0;
 0 9 19;
 0 10 20;
 0 11 0;
 2 12 0;
 3 13 0;
 4 14 21;
 5 15 0;
 0 16 0;]';
M_.nstatic = 2;
M_.nfwrd   = 4;
M_.npred   = 4;
M_.nboth   = 1;
M_.nsfwrd   = 5;
M_.nspred   = 5;
M_.ndynamic   = 9;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(23, 1);
M_.NNZDerivatives = [48; -1; -1];
M_.params( 1 ) = 0.295;
alpha = M_.params( 1 );
M_.params( 2 ) = 0.995;
beta = M_.params( 2 );
M_.params( 3 ) = 0.65;
teta = M_.params( 3 );
M_.params( 4 ) = 1.25;
vega = M_.params( 4 );
M_.params( 5 ) = 2.;
sigma = M_.params( 5 );
M_.params( 8 ) = 0.25;
b = M_.params( 8 );
M_.params( 9 ) = 1/(1+(M_.params(8)/(1-M_.params(8)))^(1-M_.params(4))*(1/(1-exp((-1)/M_.params(2))))^((1-M_.params(4))/M_.params(4)));
a1 = M_.params( 9 );
M_.params( 10 ) = 1/(exp(1/M_.params(2))-1);
a2 = M_.params( 10 );
M_.params( 6 ) = 2.0;
neta = M_.params( 6 );
M_.params( 7 ) = 6.0;
epsilon = M_.params( 7 );
M_.params( 11 ) = 0.42;
li1 = M_.params( 11 );
M_.params( 12 ) = 1.8;
li2 = M_.params( 12 );
M_.params( 13 ) = 1;
li3 = M_.params( 13 );
M_.params( 14 ) = 0.0;
li4 = M_.params( 14 );
M_.params( 15 ) = 0.98;
rhoa = M_.params( 15 );
M_.params( 16 ) = 0.968;
rhop = M_.params( 16 );
M_.params( 17 ) = 0.42;
rhoi = M_.params( 17 );
M_.params( 18 ) = 0.0;
rhom = M_.params( 18 );
M_.params( 19 ) = 0.92;
pb = M_.params( 19 );
M_.params( 20 ) = 0.00;
yb = M_.params( 20 );
M_.params( 21 ) = 0.00;
mpb = M_.params( 21 );
M_.params( 22 ) = 0.00;
rb = M_.params( 22 );
M_.params( 23 ) = 0.008;
cstd = M_.params( 23 );
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = M_.params(23)^2;
options_.irf = 3;
options_.order = 1;
var_list_ = char('em','y','ygap','pi');
info = stoch_simul(var_list_);
save('EA_BF17_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('EA_BF17_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('EA_BF17_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('EA_BF17_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('EA_BF17_rep_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('EA_BF17_rep_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('EA_BF17_rep_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
