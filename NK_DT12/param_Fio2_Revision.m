function [psai, phi, sig, mu_hat, bet, zet, rho_mu, epsil, thet, Omega1, zet_gap, ...
mu_oi, std_oi, rho_a, tau, poly, rhoint, nbeta, zet_hous, rho_pol, gam] = param_Fio2_Revision

% Parameter values
phi = 0.0;
psai = 3.5 ;  % scaling disutility of labor === WAS 1.0
sig = 1.0 ; % risk aversion ++>>> WHEN CHANGED NEED TO CHANGE UTILITY DEFINITION ALSO IN Fio2_steadystate
% phi = 5.0;
% psai = 60.3*(1+phi);  % scaling disutility of labor 
% sig = 1.5 ; % risk aversion
% XXXXXXXXXXXXXXXXXXXX
% phi = 0.11 & sig = 0.16 a'la Woodford
% XXXXXXXXXXXXXXXXXXXX
phi = 0.11;
psai = 1.35;  % scaling disutility of labor 
sig = 0.16 ; % risk aversion

epsil = 11.0 ; % elasticity of substitution across goods
thet = .66 ; % probability of not adjusting prices  
mu_hat = 0.12 ; % WAS ==>> 0.15 <<== SS financial mark-up  
bet = .99 ; % discount factor
rho_mu = .7317 ; % persistence of financial shocks: as in the endogenous case
rho_pol = 0.5 ; % persistence of policy shocks
rho_a = 0.9 ; % persistence of tech shocks
% std_mu = .01 ; % stdev of financial shocks
% std_pol = 0.01 ; % stdev of policy shocks  0.5/3*.15/12/2/1000000
% std_a = 0.01 ; % stdev of policy shocks
tau = 0.046 ;  % DT case with entr. cons, Woodford parameters
% tau = 0.044 ;  % DT case no entr cons, Woodford parameters
gam = .08 ;

% Original Taylor rule
zet = 1.5 ; % inflation response parameter in policy rule
zet_gap = 0.5/4 ; % output gap response parameter in policy rule
rhoint = 0.0; % interest rate smoothing

mu_oi = 1.0 ;
std_oi = 0.073 ; %   DT case with entr. cons, Woodford parameters
% std_oi = 0.072 ; %   DT case no entr. cons, Woodford parameters

% zet_hous = 1/(1 + cons_h^(-sig)) ;     
zet_hous = 1/(1 + 0.309669908^(-sig)) ;  % DT case
% zet_hous = 1 ;

% Omega1 = chi_t*q_t
% Omega1 = epsil/(epsil-1) ;     % NK case
% Omega1 = epsil/(epsil-1)*1.01010101 ;     % CC case
Omega1 = epsil/(epsil-1)*1.02215437 ;     % DT case with entr. cons, Woodford parameters
% Omega1 = epsil/(epsil-1)*1.01985047 ;     % DT case no entr. cons, Woodford parameters

poly = 0 ;
nbeta = bet;
