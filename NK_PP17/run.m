%*****************************************************************
% Impulse Responses for:
% PAOLI, B. D. and PAUSTIAN, M. (2017)
% Coordinating Monetary and Macroprudential Policies.
% Journal of Money, Credit and Banking, 49: 319–349.
%*****************************************************************

clear all;
close all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/NK_PP17_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare NK_PP17_rep.mod;
load NK_PP17_rep_results.mat;

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
plot(t,n_eta_R,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('net worth')
subplot(2,3,5)
plot(t,400*R_eta_R,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('nominal rate (ann. bsp)')
subplot(2,3,6)
plot(t,yg_eta_R,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('output gap')
print('NK_PP17_irf_mon','-dpdf','-fillpage')

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
plot(t,n_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('net worth')
subplot(2,3,5)
plot(t,400*R_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('nominal rate (ann. bsp)')
subplot(2,3,6)
plot(t,yg_eta_a,'-k' ,'LineWidth',2); hold on
plot(t,nul,'r');hold on
title('output gap')
print('NK_PP17_irf_tech','-dpdf','-fillpage')


