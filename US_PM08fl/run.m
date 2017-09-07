%********************************************************
%Run and plot IRFs for Carabenciov et al. (2008) for:
% a supply shock (RES_PIE_US),
% a demand shock (RES_Y_US),
% a policy rate shock (RES_RS_US),
% a BLT shock (RES_BLT_US)

clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/US_PM08fl_rep']);


%run replication dynare file
dynare US_PM08fl_rep;

%load results
load US_PM08fl_rep_results.mat;

nul=zeros(41,1);
t0 = 0:1:40;
t=1:1:40;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot IRFs for the variables:
%   output (Y_US),
%   inflation (PIE_US4),
%   interest rate (RS_US)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Impulse responses','numbertitle','off')

%Y_US variable response
subplot(3,4,1);
plot(t,Y_US_RES_PIE_US,'b','LineWidth',1.5);           hold on          
plot(t0,nul,'r');
axis([0 40 -0.05 0.15]);
ylabel('Y\_US'); 
title('Supply Shock');

subplot(3,4,2);
plot(t,Y_US_RES_Y_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -0.2 0.6]);
ylabel('Y\_US');
title('Demand Shock');

subplot(3,4,3);
plot(t,Y_US_RES_RS_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -0.15 0.05]);
ylabel('Y\_US');
title('Policy Rate Shock');

subplot(3,4,4);
plot(t,Y_US_RES_BLT_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -0.6 0.2]);
ylabel('Y\_US');
title('BLT Shock');

%PIE_US4 variable response
subplot(3,4,5);
plot(t,PIE_US4h_RES_PIE_US,'b','LineWidth',1.5);           hold on          
plot(t0,nul,'r');
axis([0 40 -0.6 0.2]);
ylabel('PIE\_US4'); 
title('Supply Shock');

subplot(3,4,6);
plot(t,PIE_US4h_RES_Y_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -0.05 0.15]);
ylabel('PIE\_US4');
title('Demand Shock');

subplot(3,4,7);
plot(t,PIE_US4h_RES_RS_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -0.1 0.1]);
ylabel('PIE\_US4');
title('Policy Rate Shock');

subplot(3,4,8);
plot(t,PIE_US4h_RES_BLT_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -0.4 0.4]);
ylabel('PIE\_US4');
title('BLT Shock');

%RS_US variable response
subplot(3,4,9);
plot(t,RS_USh_RES_PIE_US,'b','LineWidth',1.5);           hold on          
plot(t0,nul,'r');
axis([0 40 -0.3 0.1]);
ylabel('RS\_US'); 
title('Supply Shock');

subplot(3,4,10);
plot(t,RS_USh_RES_Y_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -0.1 0.3]);
ylabel('RS\_US');
title('Demand Shock');

subplot(3,4,11);
plot(t,RS_USh_RES_RS_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -0.2 0.6]);
ylabel('RS\_US');
title('Policy Rate Shock');

subplot(3,4,12);
plot(t,RS_USh_RES_BLT_US,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 40 -1 0.5]);
ylabel('RS\_US');
title('BLT Shock');


