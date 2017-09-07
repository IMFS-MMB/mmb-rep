% Replication file for EAES_RA09

%***********************************************************************
%plot figure 5 in the paper Rabanal (2009), p.1163 for eps_ZT and eps_GN
%***********************************************************************

clear all:
clc;

% Adjust path to folder where replication file is stored
cd([cd '/EAES_RA09_rep']);

%%%%%%%%%%
%run mod-file for restricted model and plot the impulse responses
%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NOTE: to be able to perfectly match the IRFs as depicted in the paper
%      the else positive estimated trends (see MOD-File Infl_diff)
%      have to be set equal to zero
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


dynare EAES_RA09_rep;
load EAES_RA09_rep_results.mat;

nul=zeros(15,1);
t=0:1:14;

figure('name','IRFs for the restricted model (with zero trends)','numbertitle','off')
%figure(111)

%ZT shock
subplot(3,2,1);
plot(t,pi_eps_ZT,'k','LineWidth',1.5);           hold on          
plot(t,pi_star_eps_ZT,'r--','LineWidth',1.5);    hold on
plot(t,nul,'k');
axis([0 15 -0.3 0.1]);
title('Inflation to Spain T Tech.shock');

subplot(3,2,3);
plot(t,pi_N_eps_ZT,'k','LineWidth',1.5);              hold on
plot(t,pi_N_star_eps_ZT,'r--','LineWidth',1.5);       hold on
plot(t,nul,'k');
axis([0 15 -0.06 0.02]);
title('N Inflation to Spain T Tech.shock');
legend('Spain','Rest of EMU');

subplot(3,2,5);
plot(t,dy_eps_ZT,'k','LineWidth',1.5);              hold on
plot(t,dy_star_eps_ZT,'r--','LineWidth',1.5);       hold on
plot(t,nul,'k');
axis([0 15 -0.05 0.15]);
title('Real GDP Growth to Spain T Tech.shock');

% GN shock
subplot(3,2,2);
plot(t,pi_eps_GN,'k','LineWidth',1.5);              hold on
plot(t,pi_star_eps_GN,'r--','LineWidth',1.5);       hold on
plot(t,nul,'k');
axis([0 15 -0.05 0.15]);
title('Inflation to Spain N Dem.shock');

subplot(3,2,4);
plot(t,pi_N_eps_GN,'k','LineWidth',1.5);              hold on
plot(t,pi_N_star_eps_GN,'r--','LineWidth',1.5);       hold on
plot(t,nul,'k');
axis([0 15 -0.02 0.06]);
title('N Inflation to Spain N Dem.shock');
legend('Spain','Rest of EMU');

subplot(3,2,6);
plot(t,dy_eps_GN,'k','LineWidth',1.5);              hold on
plot(t,dy_star_eps_GN,'r--','LineWidth',1.5);       hold on
plot(t,nul,'k');
axis([0 15 -0.1 0.3]);
title('Real GDP Growth to Spain N Dem.shock');

