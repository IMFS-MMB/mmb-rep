%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'NK_CFP10_rep';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_CFP10_rep.log');
M_.exo_names = 'eta_a';
M_.exo_names_tex = 'eta\_a';
M_.exo_names_long = 'eta_a';
M_.exo_names = char(M_.exo_names, 'eta_pi');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_pi');
M_.exo_names_long = char(M_.exo_names_long, 'eta_pi');
M_.exo_names = char(M_.exo_names, 'eta_n');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_n');
M_.exo_names_long = char(M_.exo_names_long, 'eta_n');
M_.exo_names = char(M_.exo_names, 'eta_R');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_R');
M_.exo_names_long = char(M_.exo_names_long, 'eta_R');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'yeff');
M_.endo_names_tex = char(M_.endo_names_tex, 'yeff');
M_.endo_names_long = char(M_.endo_names_long, 'yeff');
M_.endo_names = char(M_.endo_names, 'yg');
M_.endo_names_tex = char(M_.endo_names_tex, 'yg');
M_.endo_names_long = char(M_.endo_names_long, 'yg');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'phi');
M_.endo_names_tex = char(M_.endo_names_tex, 'phi');
M_.endo_names_long = char(M_.endo_names_long, 'phi');
M_.endo_names = char(M_.endo_names, 'e');
M_.endo_names_tex = char(M_.endo_names_tex, 'e');
M_.endo_names_long = char(M_.endo_names_long, 'e');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'L');
M_.endo_names_tex = char(M_.endo_names_tex, 'L');
M_.endo_names_long = char(M_.endo_names_long, 'L');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names_long = char(M_.endo_names_long, 'u');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'eps_pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_pi');
M_.endo_names_long = char(M_.endo_names_long, 'eps_pi');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'eps_R');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_R');
M_.endo_names_long = char(M_.endo_names_long, 'eps_R');
M_.param_names = 'betta';
M_.param_names_tex = '\beta';
M_.param_names_long = 'betta';
M_.param_names = char(M_.param_names, 'sig');
M_.param_names_tex = char(M_.param_names_tex, '\sigma');
M_.param_names_long = char(M_.param_names_long, 'sig');
M_.param_names = char(M_.param_names, 'thet');
M_.param_names_tex = char(M_.param_names_tex, '\thet');
M_.param_names_long = char(M_.param_names_long, 'thet');
M_.param_names = char(M_.param_names, 'eps');
M_.param_names_tex = char(M_.param_names_tex, '\epsilon');
M_.param_names_long = char(M_.param_names_long, 'eps');
M_.param_names = char(M_.param_names, 'alfa');
M_.param_names_tex = char(M_.param_names_tex, '\alpha');
M_.param_names_long = char(M_.param_names_long, 'alfa');
M_.param_names = char(M_.param_names, 'b');
M_.param_names_tex = char(M_.param_names_tex, 'b');
M_.param_names_long = char(M_.param_names_long, 'b');
M_.param_names = char(M_.param_names, 'Lam');
M_.param_names_tex = char(M_.param_names_tex, '\Lambda');
M_.param_names_long = char(M_.param_names_long, 'Lam');
M_.param_names = char(M_.param_names, 'varphi');
M_.param_names_tex = char(M_.param_names_tex, '\varphi');
M_.param_names_long = char(M_.param_names_long, 'varphi');
M_.param_names = char(M_.param_names, 'lam');
M_.param_names_tex = char(M_.param_names_tex, '\lambda');
M_.param_names_long = char(M_.param_names_long, 'lam');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, '\rho_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_R');
M_.param_names_tex = char(M_.param_names_tex, '\rho_R');
M_.param_names_long = char(M_.param_names_long, 'rho_R');
M_.param_names = char(M_.param_names, 'rho_pi');
M_.param_names_tex = char(M_.param_names_tex, '\rho_\pi');
M_.param_names_long = char(M_.param_names_long, 'rho_pi');
M_.param_names = char(M_.param_names, 'rho_n');
M_.param_names_tex = char(M_.param_names_tex, '\rho_n');
M_.param_names_long = char(M_.param_names_long, 'rho_n');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, '\tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'tau_g');
M_.param_names_tex = char(M_.param_names_tex, '\tau_g');
M_.param_names_long = char(M_.param_names_long, 'tau_g');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 18;
M_.param_nbr = 15;
M_.orig_endo_nbr = 18;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('NK_CFP10_rep_static');
erase_compiled_function('NK_CFP10_rep_dynamic');
M_.lead_lag_incidence = [
 0 6 24;
 0 7 0;
 0 8 25;
 0 9 0;
 0 10 26;
 0 11 0;
 0 12 27;
 1 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 0;
 2 20 28;
 3 21 0;
 4 22 29;
 5 23 0;]';
M_.nstatic = 9;
M_.nfwrd   = 4;
M_.npred   = 3;
M_.nboth   = 2;
M_.nsfwrd   = 6;
M_.nspred   = 5;
M_.ndynamic   = 9;
M_.equations_tags = {
  1 , 'name' , '(A1)' ;
  2 , 'name' , '(A2)' ;
  3 , 'name' , '(A3)' ;
  4 , 'name' , '(A4) rewritten as in (35)' ;
  5 , 'name' , '(A5)' ;
  6 , 'name' , '(A6) rewritten as in (34)' ;
  7 , 'name' , '(A7) rewritten as in (19)' ;
  8 , 'name' , '(A8)' ;
  9 , 'name' , '(A9)' ;
  10 , 'name' , '(A10)' ;
  11 , 'name' , '(A11)' ;
  12 , 'name' , 'Taylor Rule' ;
  13 , 'name' , 'Output without price and credit frictions' ;
  14 , 'name' , 'Output gap' ;
  15 , 'name' , 'Technology' ;
  16 , 'name' , 'Mark-up shock' ;
  17 , 'name' , 'Net worth shock' ;
  18 , 'name' , 'Monetary policy shock' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(18, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(15, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 67;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.99;
betta = M_.params( 1 );
M_.params( 2 ) = 0.16;
sig = M_.params( 2 );
M_.params( 3 ) = 0.47;
thet = M_.params( 3 );
M_.params( 4 ) = 10;
eps = M_.params( 4 );
M_.params( 5 ) = 0.50;
alfa = M_.params( 5 );
M_.params( 6 ) = 0.20;
b = M_.params( 6 );
M_.params( 7 ) = M_.params(6)-1;
Lam = M_.params( 7 );
M_.params( 8 ) = 173.08;
varphi = M_.params( 8 );
M_.params( 9 ) = (M_.params(4)-1)/M_.params(8);
lam = M_.params( 9 );
M_.params( 10 ) = 0.95;
rho_a = M_.params( 10 );
M_.params( 13 ) = 0.90;
rho_n = M_.params( 13 );
M_.params( 12 ) = 0.90;
rho_pi = M_.params( 12 );
M_.params( 11 ) = 0.40;
rho_R = M_.params( 11 );
M_.params( 14 ) = 1.5;
tau = M_.params( 14 );
M_.params( 15 ) = 0.5;
tau_g = M_.params( 15 );
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (2.205993)^2;
oo_.dr.eigval = check(M_,options_,oo_);
steady;
close all;
options_.irf = 21;
options_.noprint = 1;
options_.order = 1;
var_list_=[];
var_list_ = 'pi';
var_list_ = char(var_list_, 'R');
var_list_ = char(var_list_, 'y');
info = stoch_simul(var_list_);
save('NK_CFP10_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_CFP10_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_CFP10_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_CFP10_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_CFP10_rep_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
