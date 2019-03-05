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
M_.fname = 'NK_GM16dit_rep';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_GM16dit_rep.log');
M_.exo_names = 'ez';
M_.exo_names_tex = 'ez';
M_.exo_names_long = 'ez';
M_.exo_names = char(M_.exo_names, 'ea');
M_.exo_names_tex = char(M_.exo_names_tex, 'ea');
M_.exo_names_long = char(M_.exo_names_long, 'ea');
M_.exo_names = char(M_.exo_names, 'ezx1');
M_.exo_names_tex = char(M_.exo_names_tex, 'ezx1');
M_.exo_names_long = char(M_.exo_names_long, 'ezx1');
M_.exo_names = char(M_.exo_names, 'ezx2');
M_.exo_names_tex = char(M_.exo_names_tex, 'ezx2');
M_.exo_names_long = char(M_.exo_names_long, 'ezx2');
M_.exo_names = char(M_.exo_names, 'et');
M_.exo_names_tex = char(M_.exo_names_tex, 'et');
M_.exo_names_long = char(M_.exo_names_long, 'et');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 's');
M_.endo_names_tex = char(M_.endo_names_tex, 's');
M_.endo_names_long = char(M_.endo_names_long, 's');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'zx1');
M_.endo_names_tex = char(M_.endo_names_tex, 'zx1');
M_.endo_names_long = char(M_.endo_names_long, 'zx1');
M_.endo_names = char(M_.endo_names, 'zx2');
M_.endo_names_tex = char(M_.endo_names_tex, 'zx2');
M_.endo_names_long = char(M_.endo_names_long, 'zx2');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'dpc');
M_.endo_names_tex = char(M_.endo_names_tex, 'dpc');
M_.endo_names_long = char(M_.endo_names_long, 'dpc');
M_.endo_names = char(M_.endo_names, 'e');
M_.endo_names_tex = char(M_.endo_names_tex, 'e');
M_.endo_names_long = char(M_.endo_names_long, 'e');
M_.endo_names = char(M_.endo_names, 'p');
M_.endo_names_tex = char(M_.endo_names_tex, 'p');
M_.endo_names_long = char(M_.endo_names_long, 'p');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'dp');
M_.endo_names_tex = char(M_.endo_names_tex, 'dp');
M_.endo_names_long = char(M_.endo_names_long, 'dp');
M_.endo_names = char(M_.endo_names, 't');
M_.endo_names_tex = char(M_.endo_names_tex, 't');
M_.endo_names_long = char(M_.endo_names_long, 't');
M_.endo_names = char(M_.endo_names, 'wp');
M_.endo_names_tex = char(M_.endo_names_tex, 'wp');
M_.endo_names_long = char(M_.endo_names_long, 'wp');
M_.endo_names = char(M_.endo_names, 'dw');
M_.endo_names_tex = char(M_.endo_names_tex, 'dw');
M_.endo_names_long = char(M_.endo_names_long, 'dw');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'pc');
M_.endo_names_tex = char(M_.endo_names_tex, 'pc');
M_.endo_names_long = char(M_.endo_names_long, 'pc');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'de');
M_.endo_names_tex = char(M_.endo_names_tex, 'de');
M_.endo_names_long = char(M_.endo_names_long, 'de');
M_.endo_names = char(M_.endo_names, 'ygap');
M_.endo_names_tex = char(M_.endo_names_tex, 'ygap');
M_.endo_names_long = char(M_.endo_names_long, 'ygap');
M_.endo_names = char(M_.endo_names, 'wgap');
M_.endo_names_tex = char(M_.endo_names_tex, 'wgap');
M_.endo_names_long = char(M_.endo_names_long, 'wgap');
M_.endo_names = char(M_.endo_names, 'sgap');
M_.endo_names_tex = char(M_.endo_names_tex, 'sgap');
M_.endo_names_long = char(M_.endo_names_long, 'sgap');
M_.endo_names = char(M_.endo_names, 'cgap');
M_.endo_names_tex = char(M_.endo_names_tex, 'cgap');
M_.endo_names_long = char(M_.endo_names_long, 'cgap');
M_.endo_names = char(M_.endo_names, 'ngap');
M_.endo_names_tex = char(M_.endo_names_tex, 'ngap');
M_.endo_names_long = char(M_.endo_names_long, 'ngap');
M_.endo_names = char(M_.endo_names, 'ngapx');
M_.endo_names_tex = char(M_.endo_names_tex, 'ngapx');
M_.endo_names_long = char(M_.endo_names_long, 'ngapx');
M_.endo_names = char(M_.endo_names, 'yn');
M_.endo_names_tex = char(M_.endo_names_tex, 'yn');
M_.endo_names_long = char(M_.endo_names_long, 'yn');
M_.endo_names = char(M_.endo_names, 'sn');
M_.endo_names_tex = char(M_.endo_names_tex, 'sn');
M_.endo_names_long = char(M_.endo_names_long, 'sn');
M_.endo_names = char(M_.endo_names, 'cn');
M_.endo_names_tex = char(M_.endo_names_tex, 'cn');
M_.endo_names_long = char(M_.endo_names_long, 'cn');
M_.endo_names = char(M_.endo_names, 'nn');
M_.endo_names_tex = char(M_.endo_names_tex, 'nn');
M_.endo_names_long = char(M_.endo_names_long, 'nn');
M_.endo_names = char(M_.endo_names, 'ne');
M_.endo_names_tex = char(M_.endo_names_tex, 'ne');
M_.endo_names_long = char(M_.endo_names_long, 'ne');
M_.endo_names = char(M_.endo_names, 'wpn');
M_.endo_names_tex = char(M_.endo_names_tex, 'wpn');
M_.endo_names_long = char(M_.endo_names_long, 'wpn');
M_.endo_names = char(M_.endo_names, 'ngraph');
M_.endo_names_tex = char(M_.endo_names_tex, 'ngraph');
M_.endo_names_long = char(M_.endo_names_long, 'ngraph');
M_.endo_names = char(M_.endo_names, 'igraph');
M_.endo_names_tex = char(M_.endo_names_tex, 'igraph');
M_.endo_names_long = char(M_.endo_names_long, 'igraph');
M_.endo_names = char(M_.endo_names, 'rgraph');
M_.endo_names_tex = char(M_.endo_names_tex, 'rgraph');
M_.endo_names_long = char(M_.endo_names_long, 'rgraph');
M_.endo_names = char(M_.endo_names, 'sgraph');
M_.endo_names_tex = char(M_.endo_names_tex, 'sgraph');
M_.endo_names_long = char(M_.endo_names_long, 'sgraph');
M_.endo_partitions = struct();
M_.param_names = 'bet';
M_.param_names_tex = 'bet';
M_.param_names_long = 'bet';
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'epsp');
M_.param_names_tex = char(M_.param_names_tex, 'epsp');
M_.param_names_long = char(M_.param_names_long, 'epsp');
M_.param_names = char(M_.param_names, 'alf');
M_.param_names_tex = char(M_.param_names_tex, 'alf');
M_.param_names_long = char(M_.param_names_long, 'alf');
M_.param_names = char(M_.param_names, 'epsw');
M_.param_names_tex = char(M_.param_names_tex, 'epsw');
M_.param_names_long = char(M_.param_names_long, 'epsw');
M_.param_names = char(M_.param_names, 'thep');
M_.param_names_tex = char(M_.param_names_tex, 'thep');
M_.param_names_long = char(M_.param_names_long, 'thep');
M_.param_names = char(M_.param_names, 'thew');
M_.param_names_tex = char(M_.param_names_tex, 'thew');
M_.param_names_long = char(M_.param_names_long, 'thew');
M_.param_names = char(M_.param_names, 'phiy');
M_.param_names_tex = char(M_.param_names_tex, 'phiy');
M_.param_names_long = char(M_.param_names_long, 'phiy');
M_.param_names = char(M_.param_names, 'nu');
M_.param_names_tex = char(M_.param_names_tex, 'nu');
M_.param_names_long = char(M_.param_names_long, 'nu');
M_.param_names = char(M_.param_names, 'lamw');
M_.param_names_tex = char(M_.param_names_tex, 'lamw');
M_.param_names_long = char(M_.param_names_long, 'lamw');
M_.param_names = char(M_.param_names, 'lamp');
M_.param_names_tex = char(M_.param_names_tex, 'lamp');
M_.param_names_long = char(M_.param_names_long, 'lamp');
M_.param_names = char(M_.param_names, 'rhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa');
M_.param_names_long = char(M_.param_names_long, 'rhoa');
M_.param_names = char(M_.param_names, 'rhoz');
M_.param_names_tex = char(M_.param_names_tex, 'rhoz');
M_.param_names_long = char(M_.param_names_long, 'rhoz');
M_.param_names = char(M_.param_names, 'rhot');
M_.param_names_tex = char(M_.param_names_tex, 'rhot');
M_.param_names_long = char(M_.param_names_long, 'rhot');
M_.param_names = char(M_.param_names, 'rhozx1');
M_.param_names_tex = char(M_.param_names_tex, 'rhozx1');
M_.param_names_long = char(M_.param_names_long, 'rhozx1');
M_.param_names = char(M_.param_names, 'rhozx2');
M_.param_names_tex = char(M_.param_names_tex, 'rhozx2');
M_.param_names_long = char(M_.param_names_long, 'rhozx2');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 36;
M_.param_nbr = 16;
M_.orig_endo_nbr = 36;
M_.aux_vars = [];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('NK_GM16dit_rep_static');
erase_compiled_function('NK_GM16dit_rep_dynamic');
M_.orig_eq_nbr = 36;
M_.eq_nbr = 36;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 10 0;
 0 11 46;
 0 12 0;
 1 13 0;
 2 14 0;
 3 15 0;
 0 16 0;
 0 17 47;
 4 18 0;
 5 19 0;
 0 20 0;
 6 21 0;
 0 22 48;
 7 23 0;
 0 24 0;
 0 25 49;
 8 26 0;
 9 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;
 0 32 0;
 0 33 0;
 0 34 0;
 0 35 0;
 0 36 0;
 0 37 0;
 0 38 0;
 0 39 0;
 0 40 0;
 0 41 0;
 0 42 0;
 0 43 0;
 0 44 0;
 0 45 0;]';
M_.nstatic = 23;
M_.nfwrd   = 4;
M_.npred   = 9;
M_.nboth   = 0;
M_.nsfwrd   = 4;
M_.nspred   = 9;
M_.ndynamic   = 13;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(36, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(16, 1);
M_.NNZDerivatives = [119; 0; -1];
M_.params( 6 ) = 0.8;
thep = M_.params( 6 );
M_.params( 7 ) = 0.8;
thew = M_.params( 7 );
M_.params( 8 ) = 0;
phiy = M_.params( 8 );
M_.params( 2 ) = 2.22;
phi = M_.params( 2 );
M_.params( 4 ) = 0.26;
alf = M_.params( 4 );
M_.params( 1 ) = 0.99;
bet = M_.params( 1 );
M_.params( 9 ) = 0.3;
nu = M_.params( 9 );
M_.params( 5 ) = 1/(1-exp((-M_.params(2))*0.118));
epsw = M_.params( 5 );
M_.params( 3 ) = 3.85;
epsp = M_.params( 3 );
M_.params( 11 ) = (1-M_.params(1)*M_.params(6))*(1-M_.params(6))/M_.params(6)*(1-M_.params(4))/(1-M_.params(4)+M_.params(4)*M_.params(3));
lamp = M_.params( 11 );
M_.params( 10 ) = (1-M_.params(1)*M_.params(7))*(1-M_.params(7))/(M_.params(7)*(1+M_.params(2)*M_.params(5)));
lamw = M_.params( 10 );
M_.params( 13 ) = 0.9;
rhoz = M_.params( 13 );
M_.params( 12 ) = 0.9;
rhoa = M_.params( 12 );
M_.params( 15 ) = 0.9;
rhozx1 = M_.params( 15 );
M_.params( 16 ) = 0.9;
rhozx2 = M_.params( 16 );
M_.params( 14 ) = 0.9;
rhot = M_.params( 14 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 25 ) = 0;
oo_.steady_state( 26 ) = 0;
oo_.steady_state( 21 ) = 0;
oo_.steady_state( 23 ) = 0;
oo_.steady_state( 24 ) = 0;
oo_.steady_state( 22 ) = 0;
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 19 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 20 ) = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 32 ) = 0;
oo_.steady_state( 27 ) = 0;
oo_.steady_state( 30 ) = 0;
oo_.steady_state( 31 ) = 0;
oo_.steady_state( 28 ) = 0;
oo_.steady_state( 29 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 33 ) = 0;
oo_.steady_state( 34 ) = 0;
oo_.steady_state( 35 ) = 0;
oo_.steady_state( 36 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
options_.noprint = 1;
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(5, 5) = 0.0001;
options_.irf = 25;
options_.nograph = 1;
var_list_ = char('ngraph','igraph','rgraph','sgraph');
info = stoch_simul(var_list_);
save('NK_GM16dit_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_GM16dit_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_GM16dit_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_GM16dit_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_GM16dit_rep_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_GM16dit_rep_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_GM16dit_rep_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
