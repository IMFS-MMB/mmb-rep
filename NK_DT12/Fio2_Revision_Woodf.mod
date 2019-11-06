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
mu_oi, std_oi, rho_a, tau, poly, rhoint, nbeta, zet_hous, rho_pol, gam] = param_Fio2_Revision;

steady;
check;

shocks;
var epsA; stderr 1.0 ; // in percentage terms
var epstau; stderr 1.0; 
var epspol; stderr 0.25; // in percentage terms
var epsstd; stderr 0.6;
end;

stoch_simul(order=1,irf=12, irf_shocks = (epsA, epspol, epstau)) infl ygap i_dep spread credit cons_h q_t chi_t tau_t a_t pol_t stdoi_t  Bankrupt cons_e omeg_t s_t y_t y_e; 
close(1);
% close(2);
% close(3);
% close(4);
% close(5);
% close(6);
% close(7);
% close(8);

% load Taylor_NK; load Taylor_CC; load Taylor_ACC;

% figure(100);
% subplot(3,3,1);
% plot(infl_epsstd);
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('infl','FontSize',14);
% subplot(3,3,2);
% plot(ygap_epsstd); 
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('ygap','FontSize',14);
% subplot(3,3,3);
% plot(i_dep_epsstd);
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('i dep','FontSize',14);
% subplot(3,3,4);
% plot(spread_epsstd);
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('spread','FontSize',14);
% subplot(3,3,5);
% plot(stdoi_t_epsstd);
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('\sigma_\omega','FontSize',14);
% subplot(3,3,6);
% plot(credit_epsstd);
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('credit','FontSize',14);
% subplot(3,3,7);
% plot(Bankrupt_epsstd);
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('Bankrupt','FontSize',14);
% subplot(3,3,8);
% plot(cons_e_epsstd);
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('cons e','FontSize',14);
% subplot(3,3,9);
% plot(cons_h_epsstd);
% line(1:1:12,zeros(size(infl_epsstd)),'Color','r','LineWidth',1)
% axis tight;
% title('c','FontSize',14);

 close all;

figure(100);
subplot(3,3,1);
p1=plot(-infl_epsA ,'LineWidth',2);
ylabel('%');
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1);
legend([p1],{'DT'});
axis tight;     % 
ylim([-inf 0.24]);
title('infl','FontSize',10);

subplot(3,3,2);
plot(-ygap_epsA,'LineWidth',2); 
ylabel('%');
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1);
axis tight;     % 
ylim([-0.5 inf]);
title('ygap','FontSize',10);

subplot(3,3,3);
plot(-i_dep_epsA ,'LineWidth',2);
ylabel('%');
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1);
axis tight;     % 
ylim([0 0.3]);
title('i dep','FontSize',10);

subplot(3,3,4);
plot(-spread_epsA,'LineWidth',2);
ylabel('%');    
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1);
axis tight;     % 
ylim([-inf 0]);
title('spread','FontSize',10);

subplot(3,3,5);
plot(-credit_epsA ,'LineWidth',2);
ylabel('%');
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1);
axis tight;     % 
ylim([-4.3 0]);
title('credit','FontSize',10);

subplot(3,3,6);
plot(-cons_h_epsA ,'LineWidth',2);
ylabel('%');
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1);
axis tight;     % 
ylim([-4.3 0]);
title('c','FontSize',10);

subplot(3,3,7);
plot(-q_t_epsA,'LineWidth',2);
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1)
axis tight;     % 
ylim([-inf 0]);
title('q','FontSize',10);

subplot(3,3,8);
plot(chi_t_epsA,'LineWidth',2);
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1)
axis tight;     % 
ylim([-inf 0.15]);
title('-\chi','FontSize',10);

subplot(3,3,9);
plot(-a_t_epsA+q_t_epsA+chi_t_epsA,'LineWidth',2);
line(1:1:12,zeros(size(infl_epsA)),'Color','r','LineWidth',1)
axis tight;     % 
ylim([-1.1 0]);
legend('DT');
title('w','FontSize',10);

 orient(figure(100),'portrait');
% //print -dpsc2 TaylA -r1200;
% //print -dpdf TaylA ;
 print -depsc2 ..\Graphs\TaylA -r1200;

% figure(101);
% subplot(3,3,1);
% plot(-infl_epstau,'LineWidth',2);
% ylabel('%');
% hold on;
% plot(-infl_ACC_epstau,'b:','LineWidth',2);
% hold off;
% legend('DT', 'DT acc');
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('infl','FontSize',14);
% subplot(3,3,2);
% plot(-ygap_epstau,'LineWidth',2); 
% ylabel('%');
% hold on;
% plot(-ygap_ACC_epstau,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('ygap','FontSize',14);
% subplot(3,3,3);
% plot(-i_dep_epstau,'LineWidth',2);
% ylabel('%');
% hold on;
% plot(-i_dep_ACC_epstau,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('i dep','FontSize',14);
% subplot(3,3,4);
% plot(-spread_epstau,'LineWidth',2);
% ylabel('%');
% hold on;
% plot(-spread_ACC_epstau,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('spread','FontSize',14);
% //subplot(3,3,5);
% //plot(-tau_t_epstau,'LineWidth',2);
% //ylabel('%');
% //hold on;
% //plot(-b_t_ACC_epstau,'b:','LineWidth',2);
% //hold off;
% //line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% //axis tight;
% //title('internal funds');
% subplot(3,3,5);
% plot(-credit_epstau,'LineWidth',2);
% ylabel('%');
% hold on;
% plot(-credit_ACC_epstau,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('credit','FontSize',14);
% //subplot(3,3,7);
% //plot(-Bankrupt_epstau,'LineWidth',2);
% //ylabel('%');
% //hold on;
% //plot(-Bankrupt_ACC_epstau,'b:','LineWidth',2);
% //hold off;
% //line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% //axis tight;
% //title('Bankrupt');
% //subplot(3,3,8);
% //plot(-cons_e_epstau,'LineWidth',2);
% //ylabel('%');
% //hold on;
% //plot(-cons_e_ACC_epstau,'b:','LineWidth',2);
% //hold off;
% //line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% //axis tight;
% //title('cons e');
% subplot(3,3,6);
% plot(-cons_h_epstau,'LineWidth',2);
% ylabel('%');
% hold on;
% plot(-cons_h_ACC_epstau,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('c','FontSize',14);
% subplot(3,3,7);
% plot(-q_t_epstau,'LineWidth',2);
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('q','FontSize',14);
% subplot(3,3,8);
% plot(chi_t_epstau,'LineWidth',2);
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('-\chi','FontSize',14);
% subplot(3,3,9);
% plot(q_t_epstau+chi_t_epstau,'LineWidth',2);
% line(1:1:12,zeros(size(infl_epstau)),'Color','r','LineWidth',1)
% axis tight;
% title('w','FontSize',14);

% orient(figure(101),'portrait');
% //print -dpsc2 TaylF -r1200;
% //print -dpdf TaylF ;

 infl_Tayl_epstau = infl_epstau ; 
 ygap_Tayl_epstau = ygap_epstau ; 
 i_dep_Tayl_epstau = i_dep_epstau ; 
 spread_Tayl_epstau = spread_epstau ; 
 tau_t_Tayl_epstau = tau_t_epstau ; 
 credit_Tayl_epstau = credit_epstau ; 
 Bankrupt_Tayl_epstau = Bankrupt_epstau ; 
 cons_h_Tayl_epstau = cons_h_epstau ; 
 q_t_Tayl_epstau = q_t_epstau ; 
 chi_t_Tayl_epstau= chi_t_epstau ; 

 save Taylor_DT infl_Tayl_epstau ygap_Tayl_epstau i_dep_Tayl_epstau spread_Tayl_epstau tau_t_Tayl_epstau credit_Tayl_epstau Bankrupt_Tayl_epstau cons_h_Tayl_epstau q_t_Tayl_epstau chi_t_Tayl_epstau ; 

% // CHANGE TO inflL, OUTPUT GAP, I RATE, with sticky and flex prices, 3 models

% figure(103);
% subplot(3,3,1);
% plot(infl_epspol,'LineWidth',2);
% ylabel('%');

% // legend('DT', 'CC', 'NK', 'DT acc');
% legend('DT', 'CC', 'NK');
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('infl','FontSize',14);
% subplot(3,3,2);
% plot(ygap_epspol,'LineWidth',2); 
% ylabel('%');
% hold on;
% plot(ygap_CC_epspol,'m--','LineWidth',2);
% plot(ygap_NK_epspol,'m-.','LineWidth',2);
% // plot(ygap_ACC_epspol,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('ygap','FontSize',14);
% subplot(3,3,3);
% plot(i_dep_epspol,'LineWidth',2);
% ylabel('%');
% hold on;
% plot(i_dep_CC_epspol,'m--','LineWidth',2);
% plot(i_dep_NK_epspol,'m-.','LineWidth',2);
% // plot(i_dep_ACC_epspol,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('i dep','FontSize',14);
% subplot(3,3,4);
% plot(spread_epspol,'LineWidth',2);
% ylabel('%');
% hold on;
% // plot(spread_ACC_epspol,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('spread','FontSize',14);
% //subplot(3,3,5);
% //plot(pol_t_epspol,'LineWidth',2);
% //ylabel('%');
% //line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% //axis tight;
% //title('pol shock');
% subplot(3,3,5);
% plot(credit_epspol,'LineWidth',2);
% ylabel('%');
% hold on;
% plot(credit_CC_epspol,'m--','LineWidth',2);
% // plot(credit_ACC_epspol,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('credit','FontSize',14);
% //subplot(3,3,7);
% //plot(Bankrupt_epspol,'LineWidth',2);
% //ylabel('%');
% //hold on;
% //plot(Bankrupt_ACC_epspol,'b:','LineWidth',2);
% //hold off;
% //line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% //axis tight;
% //title('Bankrupt');
% //subplot(3,3,8);
% //plot(cons_e_epspol,'LineWidth',2);
% //ylabel('%');
% //hold on;
% //plot(cons_e_ACC_epspol,'b:','LineWidth',2);
% //hold off;
% //line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% //axis tight;
% //title('cons e');
% subplot(3,3,6);
% plot(cons_h_epspol,'LineWidth',2);
% ylabel('%');
% hold on;
% plot(cons_h_CC_epspol,'m--','LineWidth',2);
% plot(cons_h_NK_epspol,'m-.','LineWidth',2);
% // plot(cons_h_ACC_epspol,'b:','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('c','FontSize',14);
% subplot(3,3,7);
% plot(q_t_epspol,'LineWidth',2);
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('q','FontSize',14);
% subplot(3,3,8);
% plot(-chi_t_epspol,'LineWidth',2);
% hold on;
% plot(-chi_t_CC_epspol,'m--','LineWidth',2);
% plot(-chi_t_NK_epspol,'m-.','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('-\chi','FontSize',14);
% subplot(3,3,9);
% plot(-q_t_epspol-chi_t_epspol,'LineWidth',2);
% hold on;
% plot(-i_dep_CC_epspol-chi_t_CC_epspol,'m--','LineWidth',2);
% plot(-chi_t_NK_epspol,'m-.','LineWidth',2);
% hold off;
% line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
% axis tight;
% title('w','FontSize',14);

 load Taylor_flex_DT; % load Taylor_flex_NK; load Taylor_flex_CC; 

figure(103);
subplot(3,2,1);
 p1=plot(infl_epspol,'LineWidth',2);
 ylabel('%');
 line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
 legend([p1],{'DT'});
 axis([1 12 -0.6 0]);
 title({'(a) sticky prices: infl'},'FontSize',10,'FontName','Serif','FontAngle','italic');

subplot(3,2,3);
 plot(ygap_epspol,'LineWidth',2); 
 ylabel('%');
 line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
 axis([1 12 -1.0 1.5]);
 title('ygap','FontSize',10,'FontName','Serif','FontAngle','italic');

subplot(3,2,5);
 plot(i_dep_epspol,'LineWidth',2);
 ylabel('%');
 line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
 axis([1 12 -0.4 0.04]);
 title('i dep','FontSize',10,'FontName','Serif','FontAngle','italic');

subplot(3,2,2);
 p2=plot(infl_flex_epspol,'LineWidth',2);
 ylabel('%');
 line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
 legend([p2],{'DT'});
 axis([1 12 -0.6 0]);
 title({'(b) flexible prices: infl'},'FontSize',10,'FontName','Serif','FontAngle','italic');

subplot(3,2,4);
 plot(ygap_flex_epspol,'LineWidth',2); 
 ylabel('%');
 line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
 axis([1 12 -1.0 1.5]);
 title('ygap','FontSize',10,'FontName','Serif','FontAngle','italic');

 subplot(3,2,6);
 plot(i_dep_flex_epspol,'LineWidth',2);
 ylabel('%');
 line(1:1:12,zeros(size(infl_epspol)),'Color','r','LineWidth',1)
 axis([1 12 -0.4 0.04]);
 title('i dep','FontSize',10,'FontName','Serif','FontAngle','italic');

 orient(figure(103),'portrait');
% //print -dpsc2 TaylP -r1200;
% //print -dpdf TaylP ;
 print -depsc2 ..\Graphs\TaylP -r1200;


