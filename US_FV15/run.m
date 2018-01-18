%*****************************************************************
% Impulse Responses for:
% Fernández-Villaverde, Jesús & Guerrón-Quintana, Pablo & Rubio-Ramírez, Juan F., 2015.
% "Estimating dynamic equilibrium models with stochastic volatility" 
% Journal of Econometrics, Elsevier, vol. 185(1), pages 216-229.
%*****************************************************************


clear all;
close all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/US_FV15_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare US_FV15_rep.mod;
load US_FV15_rep_results.mat;

nul=zeros(21,1);
t=0:1:20;

cd('../')
% monetary policy shock
figure1= figure('name','IRFs to a monetary policy shock','numbertitle','off')
plot(t,PI_epsm,'-.r' ,'LineWidth',2);              hold on
plot(t,yg_epsm,':b','LineWidth',2); 
plot(t,R_epsm,'g','LineWidth',2);              hold on
plot(t,nul,'k');hold on
legend('Inflation', 'Output Growth', 'Interest Rate')
print('US_FV15_irf_mon','-dpdf','-fillpage')

% productivity shock
figure2= figure('name','IRFs to a productivity shock','numbertitle','off')
plot(t,PI_epsA,'-.r' ,'LineWidth',2);              hold on
plot(t,yg_epsA,':b','LineWidth',2);  
plot(t,R_epsA,'g','LineWidth',2);              hold on
plot(t,nul,'k');hold on
legend('Inflation', 'Output Growth', 'Interest Rate')
print('US_FV15_irf_tech','-dpdf','-fillpage')
