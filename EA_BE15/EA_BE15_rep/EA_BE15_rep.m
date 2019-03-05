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
M_.fname = 'EA_BE15_rep';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('EA_BE15_rep.log');
M_.exo_names = 'ua';
M_.exo_names_tex = 'ua';
M_.exo_names_long = 'ua';
M_.exo_names = char(M_.exo_names, 'uu');
M_.exo_names_tex = char(M_.exo_names_tex, 'uu');
M_.exo_names_long = char(M_.exo_names_long, 'uu');
M_.exo_names = char(M_.exo_names, 'ui');
M_.exo_names_tex = char(M_.exo_names_tex, 'ui');
M_.exo_names_long = char(M_.exo_names_long, 'ui');
M_.exo_names = char(M_.exo_names, 'up');
M_.exo_names_tex = char(M_.exo_names_tex, 'up');
M_.exo_names_long = char(M_.exo_names_long, 'up');
M_.exo_names = char(M_.exo_names, 'un');
M_.exo_names_tex = char(M_.exo_names_tex, 'un');
M_.exo_names_long = char(M_.exo_names_long, 'un');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'ir');
M_.endo_names_tex = char(M_.endo_names_tex, 'ir');
M_.endo_names_long = char(M_.endo_names_long, 'ir');
M_.endo_names = char(M_.endo_names, 'mp');
M_.endo_names_tex = char(M_.endo_names_tex, 'mp');
M_.endo_names_long = char(M_.endo_names_long, 'mp');
M_.endo_names = char(M_.endo_names, 'mn');
M_.endo_names_tex = char(M_.endo_names_tex, 'mn');
M_.endo_names_long = char(M_.endo_names_long, 'mn');
M_.endo_names = char(M_.endo_names, 'yf');
M_.endo_names_tex = char(M_.endo_names_tex, 'yf');
M_.endo_names_long = char(M_.endo_names_long, 'yf');
M_.endo_names = char(M_.endo_names, 'mpf');
M_.endo_names_tex = char(M_.endo_names_tex, 'mpf');
M_.endo_names_long = char(M_.endo_names_long, 'mpf');
M_.endo_names = char(M_.endo_names, 'mnf');
M_.endo_names_tex = char(M_.endo_names_tex, 'mnf');
M_.endo_names_long = char(M_.endo_names_long, 'mnf');
M_.endo_names = char(M_.endo_names, 'ea');
M_.endo_names_tex = char(M_.endo_names_tex, 'ea');
M_.endo_names_long = char(M_.endo_names_long, 'ea');
M_.endo_names = char(M_.endo_names, 'eu');
M_.endo_names_tex = char(M_.endo_names_tex, 'eu');
M_.endo_names_long = char(M_.endo_names_long, 'eu');
M_.endo_names = char(M_.endo_names, 'ei');
M_.endo_names_tex = char(M_.endo_names_tex, 'ei');
M_.endo_names_long = char(M_.endo_names_long, 'ei');
M_.endo_names = char(M_.endo_names, 'ep');
M_.endo_names_tex = char(M_.endo_names_tex, 'ep');
M_.endo_names_long = char(M_.endo_names_long, 'ep');
M_.endo_names = char(M_.endo_names, 'en');
M_.endo_names_tex = char(M_.endo_names_tex, 'en');
M_.endo_names_long = char(M_.endo_names_long, 'en');
M_.endo_names = char(M_.endo_names, 'vel');
M_.endo_names_tex = char(M_.endo_names_tex, 'vel');
M_.endo_names_long = char(M_.endo_names_long, 'vel');
M_.endo_names = char(M_.endo_names, 'rr');
M_.endo_names_tex = char(M_.endo_names_tex, 'rr');
M_.endo_names_long = char(M_.endo_names_long, 'rr');
M_.endo_names = char(M_.endo_names, 'ygap');
M_.endo_names_tex = char(M_.endo_names_tex, 'ygap');
M_.endo_names_long = char(M_.endo_names_long, 'ygap');
M_.endo_partitions = struct();
M_.param_names = 'alphan';
M_.param_names_tex = 'alphan';
M_.param_names_long = 'alphan';
M_.param_names = char(M_.param_names, 'alpham');
M_.param_names_tex = char(M_.param_names_tex, 'alpham');
M_.param_names_long = char(M_.param_names_long, 'alpham');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'teta');
M_.param_names_tex = char(M_.param_names_tex, 'teta');
M_.param_names_long = char(M_.param_names_long, 'teta');
M_.param_names = char(M_.param_names, 'nu');
M_.param_names_tex = char(M_.param_names_tex, 'nu');
M_.param_names_long = char(M_.param_names_long, 'nu');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'khi');
M_.param_names_tex = char(M_.param_names_tex, 'khi');
M_.param_names_long = char(M_.param_names_long, 'khi');
M_.param_names = char(M_.param_names, 'neta');
M_.param_names_tex = char(M_.param_names_tex, 'neta');
M_.param_names_long = char(M_.param_names_long, 'neta');
M_.param_names = char(M_.param_names, 'epsilon');
M_.param_names_tex = char(M_.param_names_tex, 'epsilon');
M_.param_names_long = char(M_.param_names_long, 'epsilon');
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
M_.param_names = char(M_.param_names, 'cible');
M_.param_names_tex = char(M_.param_names_tex, 'cible');
M_.param_names_long = char(M_.param_names_long, 'cible');
M_.param_names = char(M_.param_names, 'rhoa1');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa1');
M_.param_names_long = char(M_.param_names_long, 'rhoa1');
M_.param_names = char(M_.param_names, 'rhou1');
M_.param_names_tex = char(M_.param_names_tex, 'rhou1');
M_.param_names_long = char(M_.param_names_long, 'rhou1');
M_.param_names = char(M_.param_names, 'rhoi1');
M_.param_names_tex = char(M_.param_names_tex, 'rhoi1');
M_.param_names_long = char(M_.param_names_long, 'rhoi1');
M_.param_names = char(M_.param_names, 'rhop1');
M_.param_names_tex = char(M_.param_names_tex, 'rhop1');
M_.param_names_long = char(M_.param_names_long, 'rhop1');
M_.param_names = char(M_.param_names, 'rhon1');
M_.param_names_tex = char(M_.param_names_tex, 'rhon1');
M_.param_names_long = char(M_.param_names_long, 'rhon1');
M_.param_names = char(M_.param_names, 'vel0');
M_.param_names_tex = char(M_.param_names_tex, 'vel0');
M_.param_names_long = char(M_.param_names_long, 'vel0');
M_.param_names = char(M_.param_names, 'vel1');
M_.param_names_tex = char(M_.param_names_tex, 'vel1');
M_.param_names_long = char(M_.param_names_long, 'vel1');
M_.param_names = char(M_.param_names, 'vel2');
M_.param_names_tex = char(M_.param_names_tex, 'vel2');
M_.param_names_long = char(M_.param_names_long, 'vel2');
M_.param_names = char(M_.param_names, 'vym');
M_.param_names_tex = char(M_.param_names_tex, 'vym');
M_.param_names_long = char(M_.param_names_long, 'vym');
M_.param_names = char(M_.param_names, 'vyc');
M_.param_names_tex = char(M_.param_names_tex, 'vyc');
M_.param_names_long = char(M_.param_names_long, 'vyc');
M_.param_names = char(M_.param_names, 'vya');
M_.param_names_tex = char(M_.param_names_tex, 'vya');
M_.param_names_long = char(M_.param_names_long, 'vya');
M_.param_names = char(M_.param_names, 'vyp');
M_.param_names_tex = char(M_.param_names_tex, 'vyp');
M_.param_names_long = char(M_.param_names_long, 'vyp');
M_.param_names = char(M_.param_names, 'mnf1');
M_.param_names_tex = char(M_.param_names_tex, 'mnf1');
M_.param_names_long = char(M_.param_names_long, 'mnf1');
M_.param_names = char(M_.param_names, 'mnf2');
M_.param_names_tex = char(M_.param_names_tex, 'mnf2');
M_.param_names_long = char(M_.param_names_long, 'mnf2');
M_.param_names = char(M_.param_names, 'mnf3');
M_.param_names_tex = char(M_.param_names_tex, 'mnf3');
M_.param_names_long = char(M_.param_names_long, 'mnf3');
M_.param_names = char(M_.param_names, 'mnf4');
M_.param_names_tex = char(M_.param_names_tex, 'mnf4');
M_.param_names_long = char(M_.param_names_long, 'mnf4');
M_.param_names = char(M_.param_names, 'pi1');
M_.param_names_tex = char(M_.param_names_tex, 'pi1');
M_.param_names_long = char(M_.param_names_long, 'pi1');
M_.param_names = char(M_.param_names, 'pi2');
M_.param_names_tex = char(M_.param_names_tex, 'pi2');
M_.param_names_long = char(M_.param_names_long, 'pi2');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 16;
M_.param_nbr = 34;
M_.orig_endo_nbr = 16;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'y'};
options_.varobs(2)  = {'pi'};
options_.varobs(3)  = {'ir'};
options_.varobs(4)  = {'mp'};
options_.varobs(5)  = {'mn'};
options_.varobs_id = [ 1 2 3 4 5  ];
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
erase_compiled_function('EA_BE15_rep_static');
erase_compiled_function('EA_BE15_rep_dynamic');
M_.orig_eq_nbr = 16;
M_.eq_nbr = 16;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 7 23;
 0 8 24;
 1 9 0;
 0 10 0;
 0 11 0;
 0 12 25;
 0 13 0;
 0 14 0;
 2 15 0;
 3 16 26;
 4 17 0;
 5 18 0;
 6 19 0;
 0 20 0;
 0 21 0;
 0 22 0;]';
M_.nstatic = 7;
M_.nfwrd   = 3;
M_.npred   = 5;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 6;
M_.ndynamic   = 9;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(34, 1);
M_.NNZDerivatives = [62; -1; -1];
M_.params( 1 ) = 0.50;
alphan = M_.params( 1 );
M_.params( 2 ) = 0.25;
alpham = M_.params( 2 );
M_.params( 3 ) = 0.9926;
beta = M_.params( 3 );
M_.params( 4 ) = 0.66;
teta = M_.params( 4 );
M_.params( 5 ) = 1.3567;
nu = M_.params( 5 );
M_.params( 6 ) = 1.8465;
sigma = M_.params( 6 );
M_.params( 10 ) = 6.00;
epsilon = M_.params( 10 );
M_.params( 9 ) = 1.00;
neta = M_.params( 9 );
M_.params( 7 ) = 0.4399;
gamma = M_.params( 7 );
M_.params( 8 ) = 0.9998;
khi = M_.params( 8 );
M_.params( 11 ) = log(1-exp((-1)/M_.params(3)))-1/M_.params(3)/(exp(1/M_.params(3))-1);
a1 = M_.params( 11 );
M_.params( 12 ) = 1/(exp(1/M_.params(3))-1);
a2 = M_.params( 12 );
M_.params( 13 ) = 0.6005;
li1 = M_.params( 13 );
M_.params( 14 ) = 3.4258;
li2 = M_.params( 14 );
M_.params( 15 ) = 1.4118;
li3 = M_.params( 15 );
M_.params( 16 ) = 1.80;
cible = M_.params( 16 );
M_.params( 17 ) = 0.9398;
rhoa1 = M_.params( 17 );
M_.params( 18 ) = 0.9543;
rhou1 = M_.params( 18 );
M_.params( 19 ) = 0.1567;
rhoi1 = M_.params( 19 );
M_.params( 20 ) = 0.7656;
rhop1 = M_.params( 20 );
M_.params( 21 ) = 0.8342;
rhon1 = M_.params( 21 );
M_.params( 22 ) = 0.3082;
vel0 = M_.params( 22 );
M_.params( 23 ) = 2.0798;
vel1 = M_.params( 23 );
M_.params( 24 ) = 0.1617;
vel2 = M_.params( 24 );
M_.params( 25 ) = (M_.params(1)+M_.params(2)*(1+M_.params(9))-1)/(M_.params(1)+M_.params(9)-(1-M_.params(6))*(1-M_.params(1)));
vym = M_.params( 25 );
M_.params( 26 ) = (1-M_.params(1))*(log(M_.params(2)*(1-M_.params(1)))-log(M_.params(8))-log(M_.params(10)/(M_.params(10)-1)))/(M_.params(1)+M_.params(9)-(1-M_.params(6))*(1-M_.params(1)));
vyc = M_.params( 26 );
M_.params( 27 ) = (1+M_.params(9))/(M_.params(1)+M_.params(9)-(1-M_.params(6))*(1-M_.params(1)));
vya = M_.params( 27 );
M_.params( 28 ) = M_.params(2)*(1+M_.params(9))/(M_.params(1)+M_.params(9)-(1-M_.params(6))*(1-M_.params(1)));
vyp = M_.params( 28 );
M_.params( 29 ) = M_.params(6)/M_.params(5);
mnf1 = M_.params( 29 );
M_.params( 30 ) = (-(M_.params(6)*M_.params(12)/M_.params(5)));
mnf2 = M_.params( 30 );
M_.params( 31 ) = (-((-log(M_.params(3)))*M_.params(12)/M_.params(5)))-((-log(M_.params(7)))+M_.params(11))/M_.params(5);
mnf3 = M_.params( 31 );
M_.params( 32 ) = 1/M_.params(5);
mnf4 = M_.params( 32 );
M_.params( 33 ) = (M_.params(1)+M_.params(9)-(1-M_.params(6))*(1-M_.params(1)))*(1-M_.params(4))*(1-M_.params(3)*M_.params(4))/(M_.params(4)*(1-M_.params(1)+M_.params(10)*(2*M_.params(1)-1)));
pi1 = M_.params( 33 );
M_.params( 34 ) = (1-M_.params(4))*(1-M_.params(3)*M_.params(4))/(M_.params(4)*(1-M_.params(1)+M_.params(10)*(2*M_.params(1)-1)))*(1-M_.params(1)-M_.params(2)*(1+M_.params(9)));
pi2 = M_.params( 34 );
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.0071)^2;
M_.Sigma_e(2, 2) = (0.1063)^2;
M_.Sigma_e(3, 3) = (0.0290)^2;
M_.Sigma_e(4, 4) = (0.0164)^2;
M_.Sigma_e(5, 5) = (0.0169)^2;
estim_params_.var_exo = zeros(0, 10);
estim_params_.var_endo = zeros(0, 10);
estim_params_.corrx = zeros(0, 11);
estim_params_.corrn = zeros(0, 11);
estim_params_.param_vals = zeros(0, 10);
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 1, 0.50, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 1, 0.25, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, 0.66, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 3, 1.25, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 3, 2.00, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, NaN, (-Inf), Inf, 3, 6.00, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 9, NaN, (-Inf), Inf, 3, 1.00, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, NaN, (-Inf), Inf, 3, 0.44, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 8, NaN, (-Inf), Inf, 3, 1.00, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 13, NaN, (-Inf), Inf, 1, 0.50, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 14, NaN, (-Inf), Inf, 3, 3.50, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 15, NaN, (-Inf), Inf, 3, 1.50, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 16, NaN, (-Inf), Inf, 3, 2.0, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 22, NaN, (-Inf), Inf, 3, 0.31, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 23, NaN, (-Inf), Inf, 3, 1.00, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 24, NaN, (-Inf), Inf, 1, 0.50, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 17, NaN, (-Inf), Inf, 1, 0.75, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 18, NaN, (-Inf), Inf, 1, 0.75, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 19, NaN, (-Inf), Inf, 1, 0.15, 0.01, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 20, NaN, (-Inf), Inf, 1, 0.75, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 21, NaN, (-Inf), Inf, 1, 0.75, 0.1, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 4, 0.02, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, NaN, (-Inf), Inf, 4, 0.02, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, NaN, (-Inf), Inf, 4, 0.02, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 4, NaN, (-Inf), Inf, 4, 0.02, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 5, NaN, (-Inf), Inf, 4, 0.02, 2, NaN, NaN, NaN ];
options_.irf = 40;
options_.nograph = 1;
options_.order = 1;
options_.graph_format = char('eps');
options_.conditional_variance_decomposition = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;46;47;48;49;50;51;52;53;54;55;56;57;58;59;60;];
var_list_ = char('pi','y','ir','rr','ygap','mp','mn','vel');
info = stoch_simul(var_list_);
save('EA_BE15_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('EA_BE15_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('EA_BE15_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('EA_BE15_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('EA_BE15_rep_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('EA_BE15_rep_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('EA_BE15_rep_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
