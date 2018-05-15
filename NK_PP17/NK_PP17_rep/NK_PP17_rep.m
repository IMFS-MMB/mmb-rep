%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'NK_PP17_rep';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_PP17_rep.log');
M_.exo_names = 'eta_a';
M_.exo_names_tex = 'eta\_a';
M_.exo_names_long = 'eta_a';
M_.exo_names = char(M_.exo_names, 'eta_m');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_m');
M_.exo_names_long = char(M_.exo_names_long, 'eta_m');
M_.exo_names = char(M_.exo_names, 'eta_n');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_n');
M_.exo_names_long = char(M_.exo_names_long, 'eta_n');
M_.exo_names = char(M_.exo_names, 'eta_R');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_R');
M_.exo_names_long = char(M_.exo_names_long, 'eta_R');
M_.exo_names = char(M_.exo_names, 'eta_l');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_l');
M_.exo_names_long = char(M_.exo_names_long, 'eta_l');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'yg');
M_.endo_names_tex = char(M_.endo_names_tex, 'yg');
M_.endo_names_long = char(M_.endo_names_long, 'yg');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'phi');
M_.endo_names_tex = char(M_.endo_names_tex, 'phi');
M_.endo_names_long = char(M_.endo_names_long, 'phi');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'del');
M_.endo_names_tex = char(M_.endo_names_tex, 'del');
M_.endo_names_long = char(M_.endo_names_long, 'del');
M_.endo_names = char(M_.endo_names, 'S');
M_.endo_names_tex = char(M_.endo_names_tex, 'S');
M_.endo_names_long = char(M_.endo_names_long, 'S');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'ns');
M_.endo_names_tex = char(M_.endo_names_tex, 'ns');
M_.endo_names_long = char(M_.endo_names_long, 'ns');
M_.endo_names = char(M_.endo_names, 'eps_m');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_m');
M_.endo_names_long = char(M_.endo_names_long, 'eps_m');
M_.endo_names = char(M_.endo_names, 'eps_R');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_R');
M_.endo_names_long = char(M_.endo_names_long, 'eps_R');
M_.endo_names = char(M_.endo_names, 'lam');
M_.endo_names_tex = char(M_.endo_names_tex, 'lam');
M_.endo_names_long = char(M_.endo_names_long, 'lam');
M_.param_names = 'betta';
M_.param_names_tex = '\beta';
M_.param_names_long = 'betta';
M_.param_names = char(M_.param_names, 'sig');
M_.param_names_tex = char(M_.param_names_tex, '\sigma');
M_.param_names_long = char(M_.param_names_long, 'sig');
M_.param_names = char(M_.param_names, 'alfa');
M_.param_names_tex = char(M_.param_names_tex, '\alpha');
M_.param_names_long = char(M_.param_names_long, 'alfa');
M_.param_names = char(M_.param_names, 'thet');
M_.param_names_tex = char(M_.param_names_tex, '\thet');
M_.param_names_long = char(M_.param_names_long, 'thet');
M_.param_names = char(M_.param_names, 'eps');
M_.param_names_tex = char(M_.param_names_tex, '\epsilon');
M_.param_names_long = char(M_.param_names_long, 'eps');
M_.param_names = char(M_.param_names, 'del_ss');
M_.param_names_tex = char(M_.param_names_tex, '\delta_{ss}');
M_.param_names_long = char(M_.param_names_long, 'del_ss');
M_.param_names = char(M_.param_names, 'phi_ss');
M_.param_names_tex = char(M_.param_names_tex, '\phi_{ss}');
M_.param_names_long = char(M_.param_names_long, 'phi_ss');
M_.param_names = char(M_.param_names, 'varphi');
M_.param_names_tex = char(M_.param_names_tex, '\varphi');
M_.param_names_long = char(M_.param_names_long, 'varphi');
M_.param_names = char(M_.param_names, 'b');
M_.param_names_tex = char(M_.param_names_tex, 'b');
M_.param_names_long = char(M_.param_names_long, 'b');
M_.param_names = char(M_.param_names, 'kap');
M_.param_names_tex = char(M_.param_names_tex, '\kappa');
M_.param_names_long = char(M_.param_names_long, 'kap');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, '\rho_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_m');
M_.param_names_tex = char(M_.param_names_tex, '\rho_m');
M_.param_names_long = char(M_.param_names_long, 'rho_m');
M_.param_names = char(M_.param_names, 'rho_n');
M_.param_names_tex = char(M_.param_names_tex, '\rho_n');
M_.param_names_long = char(M_.param_names_long, 'rho_n');
M_.param_names = char(M_.param_names, 'rho_R');
M_.param_names_tex = char(M_.param_names_tex, '\rho_R');
M_.param_names_long = char(M_.param_names_long, 'rho_R');
M_.param_names = char(M_.param_names, 'rho_l');
M_.param_names_tex = char(M_.param_names_tex, '\rho_l');
M_.param_names_long = char(M_.param_names_long, 'rho_l');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, '\tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'tau_g');
M_.param_names_tex = char(M_.param_names_tex, '\tau_g');
M_.param_names_long = char(M_.param_names_long, 'tau_g');
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 14;
M_.param_nbr = 17;
M_.orig_endo_nbr = 14;
M_.aux_vars = [];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('NK_PP17_rep_static');
erase_compiled_function('NK_PP17_rep_dynamic');
M_.lead_lag_incidence = [
 0 11 0;
 0 12 25;
 1 13 0;
 0 14 26;
 2 15 0;
 3 16 0;
 4 17 27;
 5 18 0;
 0 19 0;
 6 20 28;
 7 21 0;
 8 22 0;
 9 23 0;
 10 24 29;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 7;
M_.nboth   = 3;
M_.nsfwrd   = 5;
M_.nspred   = 10;
M_.ndynamic   = 12;
M_.equations_tags = {
  1 , 'name' , '(22) Phillips curve' ;
  2 , 'name' , '(23) Euler equation' ;
  3 , 'name' , '(24) Net worth evolution' ;
  4 , 'name' , '(25) Firms labor demand and bank sector' ;
  5 , 'name' , '(26) Incentive compatability constraint' ;
  6 , 'name' , 'Macroprudential policy' ;
  7 , 'name' , 'Taylor Rule' ;
  8 , 'name' , 'Output gap' ;
  9 , 'name' , 'Marginal costs' ;
  10 , 'name' , 'Technology' ;
  11 , 'name' , 'Mark-up shock' ;
  12 , 'name' , 'Net worth shock' ;
  13 , 'name' , 'Monetary policy shock' ;
  14 , 'name' , 'Moral hazard shock' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(14, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(17, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 59;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.99;
betta = M_.params( 1 );
M_.params( 2 ) = 1;
sig = M_.params( 2 );
M_.params( 3 ) = 0.50;
alfa = M_.params( 3 );
M_.params( 4 ) = 0.47;
thet = M_.params( 4 );
M_.params( 5 ) = 10;
eps = M_.params( 5 );
M_.params( 6 ) = 9;
del_ss = M_.params( 6 );
M_.params( 7 ) = 0.02;
phi_ss = M_.params( 7 );
M_.params( 8 ) = 211;
varphi = M_.params( 8 );
M_.params( 9 ) = 1/(1+M_.params(7));
b = M_.params( 9 );
M_.params( 10 ) = (M_.params(5)-1)/M_.params(8);
kap = M_.params( 10 );
M_.params( 11 ) = 0.95;
rho_a = M_.params( 11 );
M_.params( 12 ) = 0.95;
rho_m = M_.params( 12 );
M_.params( 13 ) = 0;
rho_n = M_.params( 13 );
M_.params( 14 ) = 0.5;
rho_R = M_.params( 14 );
M_.params( 15 ) = 0.5;
rho_l = M_.params( 15 );
M_.params( 16 ) = 1.5;
tau = M_.params( 16 );
M_.params( 17 ) = 0.125;
tau_g = M_.params( 17 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.5)^2;
M_.Sigma_e(2, 2) = (0.5)^2;
M_.Sigma_e(3, 3) = (4.3)^2;
M_.Sigma_e(4, 4) = (1)^2;
M_.Sigma_e(5, 5) = (1)^2;
oo_.dr.eigval = check(M_,options_,oo_);
steady;
close all;
options_.irf = 21;
options_.noprint = 1;
options_.order = 1;
var_list_=[];
var_list_ = 'yg';
var_list_ = char(var_list_, 'pi');
var_list_ = char(var_list_, 'R');
var_list_ = char(var_list_, 'y');
info = stoch_simul(var_list_);
save('NK_PP17_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_PP17_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_PP17_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_PP17_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_PP17_rep_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
