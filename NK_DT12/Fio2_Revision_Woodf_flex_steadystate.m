function [ys,check]=Fio2_Revision_Woodf_steadystate(ys,~);  %% added additional input, to prevent error for missing exogenous vars
check=0;
%% global cons_h_ss i_dep_ss  infl_ss  omeg_t_ss  s_t_ss  chi_t_ss  thet1_t_ss  thet2_t_ss  y_t_ss  spread_ss  q_t_ss  ygap_ss  cons_e_ss  mon_cost_ss Bankrupt_ss  fo_t_ss  ho_t_ss   Util_ss Welf_ss i_e_ss y_e_ss a_t_ss mu_t_ss i_l_ss credit_ss pol_t_ss tau_t_ss stdoi_t_ss
global M_

[psai, phi, sig, mu_hat, bet, zet, rho_mu, epsil, thet, Omega1, zet_gap, ...
mu_oi, std_oi, rho_a, tau, poly, rhoint, nbeta, zet_hous, rho_pol, gam] = param_Fio2_Revision_flex;

a_t = 1.0 ;  
mu_t = mu_hat ;
pol_t = 1.0 ;
tau_t = tau;
stdoi_t = std_oi;
% ... and nominal/policy variables
infl = 1.0 ;
i_dep = infl/bet ;
chi_t = epsil/(epsil-1)*((1-bet*thet*infl^(epsil-2))/(1-bet*thet*infl^(epsil-1)))*((1-thet)/(1-thet*infl^(epsil-1)))^(1/(1-epsil)) ;
s_t = (1-thet)/(1-thet*infl^epsil)*((1-thet*infl^(epsil-1))/(1-thet))^(-epsil/(1-epsil)) ;

i_n = 1/ bet;
    
    % =========================================================================
    % With log-normally distributed omega_t
    % write integral functions in terms of erf function
    % =========================================================================
    % f(omega) is written as 
    % fo_t = (exp(log(mu_oi)+std_oi^2./2)./2.*(1+erf((log(mu_oi)+std_oi^2-log(omeg_t))./sqrt(2)./std_oi)) ...
    %        - omeg_t./2.*(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi)))
    % 
    % CapPhi(omega) is written as 
    % co_t = (1+erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))./2
    % 
    % f'(omega) is CapPhi(omega)-1
    % co_t - 1 = -(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))./2
    % 
    % phi(omega) is written as ho_t      
    % ho_t = exp(-0.5.*((log(omeg_t)-log(mu_oi))./std_oi).^2)./sqrt(2.*pi)./std_oi./omeg_t ;
    % 
    % BGG's G(omega) is written as CapG(omega)
    % CapG = exp(log(mu_oi)+std_oi^2./2)./2.*(1-erf((log(mu_oi)+std_oi^2-log(omeg_t))./sqrt(2)./std_oi))
    %
    % G'(omega) is written as CapGprime
    % CapGprime = omeg_t.*ho_t
    %
    % phi'(omega) is written as ho_tprime
    % ho_tprime = ho_t.*(log(mu_oi)-log(omeg_t)-std_oi.^2)./omeg_t./std_oi.^2
    % =========================================================================

% % ===== >>> IMPOSING A CERTAINT SPREAD 
% % ===== >>> Note that given a spread Delta, a mu_hat, and a std_oi, we automatically get omeg_t
% del_targ = 1.005 ; % target value for the spread
% eq_endo = @(omeg_t) [- del_targ + omeg_t./(1 - mu_t.*((1+erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))./2) - (exp(log(mu_oi)+std_oi^2./2)./2.*(1+erf((log(mu_oi)+std_oi^2-log(omeg_t))./sqrt(2)./std_oi)) - omeg_t./2.*(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))))]
% omeg_t = csolve(eq_endo,.9,[],1.0e-15,100) ; 

% ===== >>> NOT IMPOSING A SPREAD (AND FOR GIVEN SS OF inflLATION)
% eq_omeg = @(omeg_t) [-(1 - fo_t/chi_t*s_t)^sig*psai*s_t^phi*chi_t*i_dep*(tau*chi_t*i_dep/s_t)^(phi+sig)/Omega1 ...
%   + fo_t^(phi+sig)*(1 - mu_t*Bankrupt + mu_t*fo_t*ho_t/fo_prime)*(1+mu_t*ho_t/fo_prime)^(phi+sig)];
eq_omeg = @(omeg_t) [-(1 - (exp(log(mu_oi)+std_oi^2./2)./2.*(1+erf((log(mu_oi)+std_oi^2-log(omeg_t))./sqrt(2)./std_oi)) - omeg_t./2.*(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi)))./chi_t.*s_t).^sig*psai.*s_t^phi.*chi_t.*i_dep.*(tau.*chi_t.*i_dep./s_t)^(phi+sig)/Omega1 ...
    + (exp(log(mu_oi)+std_oi^2./2)./2.*(1+erf((log(mu_oi)+std_oi^2-log(omeg_t))./sqrt(2)./std_oi)) - omeg_t./2.*(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))).^(phi+sig)*(1 - mu_t.*((1+erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))./2) + mu_t.*(exp(log(mu_oi)+std_oi^2./2)./2.*(1+erf((log(mu_oi)+std_oi^2-log(omeg_t))./sqrt(2)./std_oi)) - omeg_t./2.*(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))).*(exp(-0.5.*((log(omeg_t)-log(mu_oi))./std_oi).^2)./sqrt(2.*pi)./std_oi./omeg_t)./(-(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))./2))*(1+mu_t.*(exp(-0.5.*((log(omeg_t)-log(mu_oi))./std_oi).^2)./sqrt(2.*pi)./std_oi./omeg_t)./(-(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))./2))^(phi+sig)];
 [omeg_t,ef] = csolve(eq_omeg,.7,[],1.0e-15,100) ; 
% omeg_t = fsolve(eq_omeg,1.2) ; 

% eq_omeg_n = @(omeg_n) [-(1 - (exp(log(mu_oi)+std_oi^2./2)./2.*(1+erf((log(mu_oi)+std_oi^2-log(omeg_n))./sqrt(2)./std_oi)) - omeg_n./2.*(1-erf((log(omeg_n)-log(mu_oi))./sqrt(2)./std_oi)))./(epsil/(epsil-1))).^sig*psai.*(epsil/(epsil-1)).*i_n.*(tau.*(epsil/(epsil-1)).*i_n)^(phi+sig)/Omega1 ...
%     + (exp(log(mu_oi)+std_oi^2./2)./2.*(1+erf((log(mu_oi)+std_oi^2-log(omeg_n))./sqrt(2)./std_oi)) - omeg_n./2.*(1-erf((log(omeg_n)-log(mu_oi))./sqrt(2)./std_oi))).^(phi+sig)*(1 - mu_t.*((1+erf((log(omeg_n)-log(mu_oi))./sqrt(2)./std_oi))./2) + mu_t.*(exp(log(mu_oi)+std_oi^2./2)./2.*(1+erf((log(mu_oi)+std_oi^2-log(omeg_n))./sqrt(2)./std_oi)) - omeg_n./2.*(1-erf((log(omeg_n)-log(mu_oi))./sqrt(2)./std_oi))).*(exp(-0.5.*((log(omeg_n)-log(mu_oi))./std_oi).^2)./sqrt(2.*pi)./std_oi./omeg_n)./(-(1-erf((log(omeg_n)-log(mu_oi))./sqrt(2)./std_oi))./2))*(1+mu_t.*(exp(-0.5.*((log(omeg_n)-log(mu_oi))./std_oi).^2)./sqrt(2.*pi)./std_oi./omeg_n)./(-(1-erf((log(omeg_n)-log(mu_oi))./sqrt(2)./std_oi))./2))^(phi+sig)];
% omeg_n = csolve(eq_omeg_n,.7,[],1.0e-15,100) ; 

    % Define integrals
    fo_t = (exp(log(mu_oi)+std_oi^2/2)/2*(1+erf((log(mu_oi)+std_oi^2-log(omeg_t))/sqrt(2)/std_oi)) ...
            - omeg_t/2*(1-erf((log(omeg_t)-log(mu_oi))/sqrt(2)/std_oi))) ;
    co_t = (1+erf((log(omeg_t)-log(mu_oi))/sqrt(2)/std_oi))/2 ;
    ho_t = exp(-0.5.*((log(omeg_t)-log(mu_oi))./std_oi).^2)./sqrt(2.*pi)./std_oi./omeg_t ;
    Bankrupt = co_t ;
    fo_prime = -(1-erf((log(omeg_t)-log(mu_oi))./sqrt(2)./std_oi))./2;

%     fo_n = (exp(log(mu_oi)+std_oi^2/2)/2*(1+erf((log(mu_oi)+std_oi^2-log(omeg_n))/sqrt(2)/std_oi)) ...
%             - omeg_n/2*(1-erf((log(omeg_n)-log(mu_oi))/sqrt(2)/std_oi))) ;
%     Phi_n = (1+erf((log(omeg_n)-log(mu_oi))/sqrt(2)/std_oi))/2 ;
%     ho_n = exp(-0.5.*((log(omeg_n)-log(mu_oi))./std_oi).^2)./sqrt(2.*pi)./std_oi./omeg_n ;
%     fo_prime_n = -(1-erf((log(omeg_n)-log(mu_oi))./sqrt(2)./std_oi))./2;
    
    y_t = tau.*i_dep.*chi_t./(fo_t.*(1 + mu_t.*ho_t./fo_prime))./s_t ;
    cons_h = y_t*(1 - fo_t/chi_t*s_t) ;
    cons_e = y_t - cons_h ;
    thet2_t = y_t/(1-bet*thet*infl^(epsil-2)) ;
    thet1_t = y_t/(1-bet*thet*infl^(epsil-1))/chi_t ;
    spread = omeg_t/(1-mu_t*co_t-fo_t);
    q_t = i_dep/(1 - mu_t*Bankrupt + mu_t*fo_t*ho_t/fo_prime) ;

%     y_n = tau.*i_n.*(epsil/(epsil-1))./(fo_n.*(1 + mu_t.*ho_n./fo_prime_n)) ;
%     c_n = y_n*(1 - fo_n/(epsil/(epsil-1))) ;
%     q_n = i_n/(1 - mu_t*Phi_n + mu_t*fo_n*ho_n/fo_prime_n) ;

    ygap = 1 ;
    mon_cost = mu_t*Bankrupt; 
    i_e = 1/bet ;
    y_e = (Omega1/psai/(epsil/(epsil-1)))^(1/(sig+phi)) ;
    
    i_l = i_dep*spread ;
    credit = tau*q_t*(1 - mu_t*Bankrupt - fo_t)/(i_dep - q_t*(1 - mu_t*Bankrupt - fo_t));

% ====> UTILITY: sigma > 1
Util = zet_hous*(cons_h^(1-sig)/(1-sig) - psai/(1+phi)*(s_t*y_t/a_t)^(1+phi))+ ...
    (1-zet_hous)*(tau*i_dep/(1+mu_t*ho_t/fo_prime)) ;   
% ====> UTILITY: sigma = 1
% Util = zet_hous*(log(cons_h) - psai/(1+phi)*(s_t*y_t/a_t)^(1+phi))+ ...
%     (1-zet_hous)*(tau*i_dep/(1+mu_t*ho_t/fo_prime)) ;   
Welf = Util/(1-bet);

% % =========================================================================
% % Display steady state values
% Vars_names = strvcat('c_t(h)  ', 'omeg_t  ','f(omeg_t)  ','y_t','Phi_t','del_t','dep_t'); %  
% Vars_vals = num2str([c_t; omeg_t; fo_t; y_t;co_t; del_t; dep_t]); %  
% 'Steady state values (in levels)'
% [Vars_names,Vars_vals]
% % 'Sensitivity of bankrupcies to omega_t'
% % 1/2/pi^(1/2)*exp(-1/2*(log(omeg_t)-log(mu_oi))^2/std_oi^2)/omeg_t*2^(1/2)/std_oi
% % =========================================================================
%Take logs
% a_t = log(a_t);
% mu_t = log(mu_t) ;
% tau_t = log(tau_t) ;
% stdoi_t = log(stdoi_t) ;
% pol_t = log(pol_t) ;
% cons_h = log(cons_h);
% i_dep = log(i_dep);
% infl = log(infl) ;
% omeg_t = log(omeg_t) ;
% s_t = log(s_t) ;
% chi_t = log(chi_t);
% thet1_t = log(thet1_t);
% thet2_t = log(thet2_t);
% y_t = log(y_t);
% q_t = log(q_t) ;
% spread = log(spread) ;
% cons_e = log(cons_e) ;
% i_e = log(i_e) ;
% y_e = log(y_e) ;
% ygap = log(ygap) ;
% fo_prime = log(fo_prime);
% mon_cost = log(mon_cost);
% Bankrupt = log(Bankrupt); 
% fo_t  = log(fo_t);
% ho_t = log(ho_t);
% i_l = log(i_l) ;
% credit = log(credit); 

% i_n = log(i_n);
% c_n = log(c_n);
% y_n = log(y_n);
% q_n = log(q_n);
% Phi_n = log(Phi_n);
% fo_n = log(fo_n);
% ho_n = log(ho_n);
% fo_prime_n = log(fo_prime_n);
% omeg_n = log(omeg_n);

% lgy_=evalin('base','lgy_');

a_t_ss  = log(a_t);
mu_t_ss  = log(mu_t) ;
tau_t_ss = log(tau_t );
pol_t_ss  = log(pol_t) ;
cons_h_ss  = log(cons_h);
i_dep_ss  = log(i_dep);     %% replace t with dep on lhs
infl_ss  = log(infl) ;
omeg_t_ss  = log(omeg_t) ;
s_t_ss  = log(s_t) ;
chi_t_ss  = log(chi_t);
thet1_t_ss  = log(thet1_t);
thet2_t_ss  = log(thet2_t);
y_t_ss  = log(y_t);
cons_e_ss  = log(cons_e);
q_t_ss  = log(q_t) ;
spread_ss  = log(spread) ;
Welf_ss=log(Welf);
Util_ss=log(Util);
ygap_ss  = log(ygap) ;
mon_cost_ss = log(mon_cost) ;
Bankrupt_ss  = log(Bankrupt) ;
fo_t_ss  = log(fo_t) ;
ho_t_ss  = log(ho_t);
i_l_ss = log(i_l) ;
credit_ss = log(credit); 
i_e_ss = log(i_e) ;
y_e_ss = log(y_e) ;
stdoi_t_ss = log(stdoi_t);   %% added this line
% i_n_ss = i_n;
% c_n_ss = c_n;
% y_n_ss = y_n;
% q_n_ss = q_n;
% Phi_n_ss = Phi_n;
% fo_n_ss = fo_n;
% ho_n_ss = ho_n;
% fo_prime_n_ss = fo_prime_n;
% omeg_n_ss = omeg_n ;

    for kkk=1:size(M_.endo_names,1)
        ys(kkk)=eval(strcat(deblank(M_.endo_names(kkk,:)),'_ss'))
    end
    
    for iter = 1:length(M_.params) %update parameters set in the file
        eval([ 'M_.params(' num2str(iter) ') = ' M_.param_names(iter,:) ';' ])
    end

return
