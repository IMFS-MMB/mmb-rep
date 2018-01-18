%*****************************************************************
% Impulse Responses for:
% Charles T. Carlstrom & Timothy S. Fuerst & Matthias Paustian, 2010.
% "Optimal Monetary Policy in a Model with Agency Costs" 
% Journal of Money, Credit and Banking, Blackwell Publishing
% vol. 42(s1), pages 37-70, September.
%*****************************************************************

clear all;
close all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/NK_CFP10_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare NK_CFP10_rep.mod;
load NK_CFP10_rep_results.mat;

nul=zeros(21,1);
t=0:1:20;

cd('../')
% monetary policy shock
figure1= figure('name','IRFs to a monetary policy shock','numbertitle','off')
subplot(2,3,1)
plot(t,400*b*phi_eta_R,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('credit distortion (ann. bsp)')
subplot(2,3,2)
plot(t,z_eta_R,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('marginal cost')
subplot(2,3,3)
plot(t,400*pi_eta_R,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('inflation (ann. bsp)')
subplot(2,3,4)
plot(t,eps_R_eta_R,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('shock')
subplot(2,3,5)
plot(t,400*R_eta_R,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('nominal rate (ann. bsp)')
subplot(2,3,6)
plot(t,yg_eta_R,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('output gap')
print('NK_CFP10_irf_mon','-dpdf','-fillpage')

% productivity shock
figure2= figure('name','IRFs to a productivity shock','numbertitle','off')
subplot(2,3,1)
plot(t,400*b*phi_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('credit distortion (ann. bsp)')
subplot(2,3,2)
plot(t,z_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('marginal cost')
subplot(2,3,3)
plot(t,400*pi_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('inflation (ann. bsp)')
subplot(2,3,4)
plot(t,a_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('shock')
subplot(2,3,5)
plot(t,400*R_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('nominal rate (ann. bsp)')
subplot(2,3,6)
plot(t,yg_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('output gap')
print('NK_CFP10_irf_tech','-dpdf','-fillpage')


