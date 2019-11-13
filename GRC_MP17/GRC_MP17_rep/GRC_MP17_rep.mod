% Small Open Economy with fixed exchange rate
% 5 shocks: nominal borrowing limit (zbh_nom), monetary policy (zr), 
% nominal gov expenditures and transfers (zg_nom and ztrans_nom), foreign demand (zcf)
% With "behavioral" equations for private debt and fiscal policy
% Adding government BC and sudden stop shock, with 2nd order approximation
% NOTE: IN THE NOTATIONS BHoY IS INDIVIDUAL DEBT TO INCOME, NOT AGGREGATE
%
% Annual calibration

% NOTE: the parameters in this code are only used when the code is run on its own.
% When the code is run from the "Structural" and "Counterfactual" programs,
% the parameters are defined there.

% close all;

%----------------------------------------------------------------
% 1. Variables in logs: inflation, output, real wage, policy rate
%----------------------------------------------------------------

var y c n r cs cb pinf winf cpinf ; % 9
var bh g trans; % 12
var w tot bg_nom nfa; % endogenous states % 16
var zbh_nom zr zg_nom ztrans_nom zcf zrecap zprod ; % exogenous states 
varexo ee_zbh_nom ee_zr ee_zg_nom ee_ztrans_nom ee_zcf ee_zrecap ee_zprod ;


%----------------------------------------------------------------
% 2. Calibrate parameters
%----------------------------------------------------------------

parameters rho_zbh rho_zr rho_zg rho_ztrans rho_zcf rho_zrecap rho_zprod ;
parameters beta labc crra pimc wimrs ;
parameters open gamma eta ;
parameters calvop calvow elasp elasw ; 
parameters GoY ;
parameters chi ToY BHoY tau BGoY;

parameters lambda_rho0 lambda_bhrho gamma_gn gamma_grho lambda_rhobg lambda_rhobh lambda_rhorec;
parameters coef_rhonfa coef_gbg;

beta = 0.98 ;   % quarterly discount factor
open = 0.3  ;   % degree of openness of the economy
gamma = 1   ;   % elasticity between exports
eta = 1     ;   % elasticity between home and foreign goods
labc = 1  ;     % inverse labor supply elasticity
crra = 1   ;    % risk aversion
calvop = 0.5;   % price stickynesss Calvo parameter
elasp = 6   ;   % elasticity of substitution among price setters 
calvow = 0.5;   % wage stickynesss Calvo parameter
elasw = 6   ;   % elasticity of substitution among wage setters 
chi = 0.5 ;     % fraction of impatient agents

pimc = (1-calvop)*(1-beta*calvop)/calvop ;
wimrs = (1-calvow)*(1-beta*calvow)/calvow/(1+labc*elasw) ;

rho_zbh = 0.99 ;
rho_zr = 0.5 ;
rho_zg = 0.99;
rho_ztrans = 0.99;
rho_zcf = 0.99 ;
rho_zrecap = 0.99;
rho_zprod = 0.9 ;

AGG_DEBT_GDP = 1 ;
BHoY = AGG_DEBT_GDP/chi ;  % per capita debt/income of borrower
GoY = 0.2 ;     % steady state G/Y
ToY = 0.2 ;     % steady state T/Y
BGoY = 0.6 ;    % steady state BG/Y

tau = GoY + ToY + (1-beta)*BGoY ; % steady state tax rate

% Structural model additions
lambda_bhrho = -1.8; % Slope of private debt demand curve
gamma_gn = -0.8; % Gov exp/trans slope wrt labor
gamma_grho = -2.5; % Gov exp/trans slope wrt rho
lambda_rho0 = -2.3; % Constant term in rho equation
lambda_rhobg = 2.0; % rho slope wrt gov debt
lambda_rhobh = 1.2; % rho slope wrt private debt
lambda_rhorec = 15; % rho slope wrt recap

coef_rhonfa = -0.001; % For stability, add nfa feedback into spread rule

coef_gbg = -0.02; % Gov debt feedback into fiscal policy rules

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;

# mc = w + open*tot ;
# mrs = crra*c + labc*n ;

pinf = beta*pinf(+1) + pimc*mc ;    
winf = beta*winf(+1) + wimrs*(mrs-w) ;
cpinf = (1-open)*pinf ;
w = w(-1) + winf - cpinf ;
tot = tot(-1) - pinf ;

y = n + zprod ;
y = (1-open)*(1-GoY)*(c+open*eta*tot) + open*(1-GoY)*(zcf+gamma*tot) + GoY*g;
c = chi*cb + (1-chi)*cs ;

(1-GoY)*(cb + open*tot) = (1-tau)*(w+n) + BHoY*(beta*(bh-r)-bh(-1) +pinf) + ToY*trans ;
1 = exp(r)*exp(crra*(cs-cs(+1)))/exp(cpinf(+1)); % Non-linear Euler equation

beta*nfa = nfa(-1) + y - (1-GoY)*(open*tot+c) - GoY*g ; 
r = zr*(lambda_rho0 + lambda_rhobg*BGoY*(1+bg_nom) + lambda_rhobh*chi*BHoY*(1+bh -tot ) + lambda_rhorec*zrecap ) + coef_rhonfa*nfa ;

zbh_nom = rho_zbh*zbh_nom(-1) + ee_zbh_nom ;
zr = rho_zr*zr(-1) + ee_zr ;
zg_nom = rho_zg*zg_nom(-1) + ee_zg_nom ;
ztrans_nom = rho_ztrans*ztrans_nom(-1) + ee_ztrans_nom ;
zcf = rho_zcf*zcf(-1) + ee_zcf ;
zrecap = rho_zrecap*zrecap(-1) + ee_zrecap ;
zprod = rho_zprod*zprod(-1) + ee_zprod ;

BHoY*(bh - tot) = BHoY*zbh_nom + (lambda_bhrho/chi)*r;
GoY*(g - tot) = GoY*zg_nom + gamma_gn*n + gamma_grho*r + coef_gbg*BGoY*bg_nom;
ToY*(trans - tot) = ToY*ztrans_nom + gamma_gn*n + gamma_grho*r + coef_gbg*BGoY*bg_nom;

% Add government BC, for real debt, with nominal debt inside
beta*BGoY*(bg_nom + tot - r) + tau*y = GoY*g + ToY*trans + BGoY*(bg_nom(-1) + tot) + zrecap;

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

check ;

steady;

shocks;
var ee_zbh_nom = 1e-4;
var ee_zr = 1e-14;
var ee_zg_nom = 1e-4;
var ee_ztrans_nom = 1e-4;
var ee_zcf = 1e-4;
var ee_zrecap = 1e-4;
var ee_zprod = 1e-4;
end;

%stoch_simul(linear,irf=10, nocorr, nomoments);
stoch_simul(order=2,irf=0, nocorr, nomoments,noprint);
clc;
