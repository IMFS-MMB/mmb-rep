%*****************************************************************
% Impulse Responses for:
% Jesús Fernández-Villaverde, 2010.
% "The econometrics of DSGE models" 
% SERIEs: Journal of the Spanish Economic Association, Springer;Spanish Economic Association
% vol. 1(1), pages 3-49, March.
%*****************************************************************

clear all;
close all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/US_FV10_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare US_FV10_rep.mod;
load US_FV10_rep_results.mat;

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
print('US_FV10_irf_mon','-dpdf','-fillpage')

% productivity shock
figure2= figure('name','IRFs to a productivity shock','numbertitle','off')
plot(t,PI_epsA,'-.r' ,'LineWidth',2);              hold on
plot(t,yg_epsA,':b','LineWidth',2);  
plot(t,R_epsA,'g','LineWidth',2);              hold on
plot(t,nul,'k');hold on
legend('Inflation', 'Output Growth', 'Interest Rate')
print('US_FV10_irf_tech','-dpdf','-fillpage')


