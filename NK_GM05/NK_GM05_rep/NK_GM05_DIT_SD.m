%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_
options_ = [];
M_.fname = 'NK_GM05_DIT_SD';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'NK_GM05_DIT_SD.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'ystar_';
M_.exo_names_tex = 'ystar\_';
M_.exo_names = char(M_.exo_names, 'a_');
M_.exo_names_tex = char(M_.exo_names_tex, 'a\_');
M_.endo_names = 'pih';
M_.endo_names_tex = 'pih';
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, 'x');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names = char(M_.endo_names, 'ynat');
M_.endo_names_tex = char(M_.endo_names_tex, 'ynat');
M_.endo_names = char(M_.endo_names, 'rnat');
M_.endo_names_tex = char(M_.endo_names_tex, 'rnat');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names = char(M_.endo_names, 's');
M_.endo_names_tex = char(M_.endo_names_tex, 's');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names = char(M_.endo_names, 'p');
M_.endo_names_tex = char(M_.endo_names_tex, 'p');
M_.endo_names = char(M_.endo_names, 'ph');
M_.endo_names_tex = char(M_.endo_names_tex, 'ph');
M_.endo_names = char(M_.endo_names, 'e');
M_.endo_names_tex = char(M_.endo_names_tex, 'e');
M_.endo_names = char(M_.endo_names, 'ystar');
M_.endo_names_tex = char(M_.endo_names_tex, 'ystar');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names = char(M_.endo_names, 'pistar');
M_.endo_names_tex = char(M_.endo_names_tex, 'pistar');
M_.param_names = 'sigma';
M_.param_names_tex = 'sigma';
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names = char(M_.param_names, 'xi');
M_.param_names_tex = char(M_.param_names_tex, 'xi');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, 'omega');
M_.param_names = char(M_.param_names, 'phipi');
M_.param_names_tex = char(M_.param_names_tex, 'phipi');
M_.param_names = char(M_.param_names, 'rhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa');
M_.param_names = char(M_.param_names, 'rhoy');
M_.param_names_tex = char(M_.param_names_tex, 'rhoy');
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 14;
M_.param_nbr = 12;
M_.orig_endo_nbr = 14;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.H = 0;
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('NK_GM05_DIT_SD_dynamic');
M_.lead_lag_incidence = [
 0 7 21;
 0 8 22;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 1 13 0;
 0 14 0;
 2 15 0;
 3 16 0;
 4 17 0;
 5 18 0;
 6 19 0;
 0 20 0;]';
M_.equations_tags = {
};
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(14, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(12, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 44;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 1;
sigma = M_.params( 1 );
M_.params( 2 ) = 0.0101;
rho = M_.params( 2 );
M_.params( 3 ) = 1;
tau = M_.params( 3 );
M_.params( 4 ) = 0.4;
alpha = M_.params( 4 );
M_.params( 5 ) = 0;
theta = M_.params( 5 );
M_.params( 7 ) = 0.99;
beta = M_.params( 7 );
M_.params( 8 ) = 0.3433;
kappa = M_.params( 8 );
M_.params( 9 ) = (-0.1277);
omega = M_.params( 9 );
M_.params( 6 ) = 0;
xi = M_.params( 6 );
M_.params( 10 ) = 1.5;
phipi = M_.params( 10 );
M_.params( 11 ) = 0.66;
rhoa = M_.params( 11 );
M_.params( 12 ) = 0.86;
rhoy = M_.params( 12 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 6.083999999999999e-005;
M_.Sigma_e(2, 2) = 5.041e-005;
M_.Sigma_e(2, 1) = 1.6614e-005;
M_.Sigma_e(1, 2) = M_.Sigma_e(2, 1);
M_.sigma_e_is_diagonal = 0;
options_.nograph = 1;
options_.noprint = 1;
var_list_=[];
var_list_ = 'y';
var_list_ = char(var_list_, 'pih');
var_list_ = char(var_list_, 'pi');
var_list_ = char(var_list_, 'r');
var_list_ = char(var_list_, 's');
info = stoch_simul(var_list_);
save('NK_GM05_DIT_SD_results.mat', 'oo_', 'M_', 'options_');
diary off

disp(['Total computing time : ' dynsec2hms(toc) ]);
