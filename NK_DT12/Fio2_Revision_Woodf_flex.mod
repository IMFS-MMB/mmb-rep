// DE FIORE TRISTANI II
// Revision for EJ, June 2011
// With coefficients a' la Woodford

// Endogenous variables
var cons_h, i_dep, infl, omeg_t, s_t, chi_t, thet1_t, thet2_t, 
y_t, spread, q_t, ygap, cons_e, mon_cost, Bankrupt, fo_t, ho_t,  i_l, credit, stdoi_t, %% deleted fo_prime
Util, Welf,
i_e, y_e, a_t, mu_t, pol_t, tau_t; 

// Disturbances;
varexo epsA, epsmu,epspol,epstau,epsstd;

//PARAMETERS
parameters psai, phi, sig, mu_hat, bet, zet, rho_mu, epsil, thet, Omega1, 
mu_oi, std_oi, rho_a, tau, poly, rhoint, nbeta, zet_hous, zet_gap, rho_pol, y_t_ss, y_e_ss;

model;           
// Welfare
exp(Util) = zet_hous*(exp(cons_h)^(1-sig)/(1-sig) - psai/(1+phi)*(exp(s_t)*exp(y_t)/exp(a_t))^(1+phi))+
     (1-zet_hous)*exp(cons_e) ;   
exp(Welf) = exp(Util) + nbeta*exp(Welf(+1));
// Actual economy
- exp(spread) + exp(omeg_t)/(1 - exp(mu_t)*exp(Bankrupt) - exp(fo_t));
- psai*exp(cons_h)^sig*exp(s_t)^phi*exp(y_t)^phi + exp(a_t)^(1+phi)*Omega1/exp(q_t)/exp(chi_t) ; 
- exp(chi_t)*exp(i_dep)*exp(tau_t)*exp(a_t)^0 + exp(s_t)*exp(y_t)*exp(fo_t)*(1+exp(mu_t)*exp(ho_t)/( 
        - (1-erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))/2    )) ;  %replaced fo_prime
- exp(q_t) + exp(i_dep)/(1 - exp(mu_t)*exp(Bankrupt) + exp(mu_t)*exp(fo_t)*exp(ho_t)/( 
        - (1-erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))/2    )) ;  %replaced fo_prime
- exp(Bankrupt) + (1+erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))/2 ;
- exp(fo_t) + (exp(log(mu_oi)+exp(stdoi_t)^2/2)/2*(1+erf((log(mu_oi)+exp(stdoi_t)^2-log(exp(omeg_t)))/sqrt(2)/exp(stdoi_t)))
    - exp(omeg_t)/2*(1-erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))) ;
- exp(ho_t) + 1/exp(omeg_t)*normpdf(omeg_t,log(mu_oi),exp(stdoi_t));
%%-  exp(fo_prime) - (1-erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))/2 ;
- exp(cons_h) + exp(y_t)*(1 - exp(fo_t)*exp(s_t)/exp(chi_t)) ;
- 1/exp(i_dep) + bet*exp(cons_h(+1))^(-sig)/(exp(cons_h)^(-sig))/exp(infl(+1)) ;
- 1 + thet*exp(infl)^(epsil-1) + (1-thet)*(epsil/(epsil-1)*exp(thet1_t)/exp(thet2_t))^(1-epsil) ;
- exp(thet1_t) + exp(y_t)/exp(chi_t) + thet*bet*exp(infl(+1))^(epsil-1)*exp(cons_h(+1))^(-sig)/(exp(cons_h)^(-sig))*exp(thet1_t(+1)) ;
- exp(thet2_t) + exp(y_t) + thet*bet*exp(infl(+1))^(epsil-2)*exp(cons_h(+1))^(-sig)/(exp(cons_h)^(-sig))*exp(thet2_t(+1)) ;
- exp(s_t) + (1-thet)*((1-thet*exp(infl)^(epsil-1))/(1-thet))^(-epsil/(1-epsil)) + thet*exp(infl)^epsil*exp(s_t(-1)) ;
- exp(ygap) + exp(y_t-y_e-y_t_ss+y_e_ss); 
- exp(cons_e) + exp(y_t) - exp(cons_h);
- exp(mon_cost) + exp(mu_t)*exp(Bankrupt);
- exp(i_l) + exp(i_dep)*exp(spread);
- exp(credit) + exp(tau_t)*exp(a_t)^0*exp(q_t)*(1 - exp(mu_t)*exp(Bankrupt) - exp(fo_t))/(exp(i_dep) - exp(q_t)*(1 - exp(mu_t)*exp(Bankrupt) - exp(fo_t)));
// Monetary Policy Rule
- exp(i_dep) + poly + (1/bet*exp(infl)^zet*exp(ygap)^zet_gap)^(1-rhoint) * (exp(i_dep(-1)))^rhoint * exp(pol_t);
// Exogenous Shocks 
- psai*exp(y_e)^(sig+phi) + exp(a_t)^(1+phi)/(epsil/(epsil-1))*Omega1 ;
1/exp(i_e)-bet*exp(y_e(+1))^(-sig)/(exp(y_e)^(-sig)) ;
mu_t-(1-rho_mu)*log(mu_hat)-rho_mu*mu_t(-1)-epsmu ;
tau_t-(1-rho_mu)*log(tau)-rho_mu*tau_t(-1)-epstau ;
stdoi_t-(1-rho_mu)*log(std_oi)-rho_mu*stdoi_t(-1)-epsstd ;
a_t-rho_a*a_t(-1)-epsA;
pol_t-rho_pol*pol_t(-1)-epspol;
end;

[psai, phi, sig, mu_hat, bet, zet, rho_mu, epsil, thet, Omega1, zet_gap, ...
mu_oi, std_oi, rho_a, tau, poly, rhoint, nbeta, zet_hous, rho_pol, gam] = param_Fio2_Revision_flex;

steady;
check;

shocks;
var epsA; stderr 1.0 ; // in percentage terms
var epstau; stderr 1.0; 
var epspol; stderr 0.25; // in percentage terms
var epsstd; stderr 0.6;
end;

stoch_simul(order=1,irf=12, irf_shocks = (epspol)) infl ygap i_dep spread credit cons_h q_t chi_t tau_t a_t pol_t stdoi_t  Bankrupt cons_e omeg_t s_t y_t y_e; 
close(1);
close(2);


infl_flex_epspol = infl_epspol;
i_dep_flex_epspol = i_dep_epspol;
ygap_flex_epspol = ygap_epspol;

save 'Taylor_flex_DT.mat' infl_flex_epspol i_dep_flex_epspol ygap_flex_epspol


