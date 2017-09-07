%*****************************************************************
%impulse response functions for Gelain (2010) for:
% a MP shock 
% a technology shock 
% a investment specific shock 
% a labor supply shock 
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/EA_GEL10_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare EA_GEL10_rep;
load EA_GEL10_rep_results.mat;

nul=zeros(20,1);
t=1:1:20;

figure('name','IRFs to a monetary policy shock','numbertitle','off')

%MP shock
subplot(3,3,1);
plot(t,c_ur,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
axis([0 20 -0.4 0]);
title('Consumption');

subplot(3,3,2);
plot(t,l_ur,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.5 0.5]);
title('Labor');

subplot(3,3,3);
plot(t,inv_ur,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -2 0]);
title('Investment');

subplot(3,3,4);
plot(t,q_ur,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -1 1]);
title('q');

subplot(3,3,5);
plot(t,nw_ur,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -2 0]);
title('Net Worth');

subplot(3,3,6);
plot(t,y_ur,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.4 0]);
title('Output');

subplot(3,3,7);
plot(t,k_ur,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.4 0]);
title('Capital');

subplot(3,3,8);
plot(t,rn_ur,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.2 0.2]);
title('Nom.int.rate');

subplot(3,3,9);
plot(t,S_ur,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.05 0.05]);
title('Ext. Finance Premium');


figure('name','IRFs to a technology shock','numbertitle','off')

%technology shock
subplot(3,3,1);
plot(t,c_ua,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
axis([0 20 0 1]);
title('Consumption');

subplot(3,3,2);
plot(t,l_ua,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -1 1]);
title('Labor');

subplot(3,3,3);
plot(t,inv_ua,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 4]);
title('Investment');

subplot(3,3,4);
plot(t,q_ua,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -1 1]);
title('q');

subplot(3,3,5);
plot(t,nw_ua,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 2]);
title('Net Worth');

subplot(3,3,6);
plot(t,y_ua,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 2]);
title('Output');

subplot(3,3,7);
plot(t,k_ua,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 1]);
title('Capital');

subplot(3,3,8);
plot(t,rn_ua,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.05 0.05]);
title('Nom.int.rate');

subplot(3,3,9);
plot(t,S_ua,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.02 0.02]);
title('Ext. Finance Premium');


figure('name','IRFs to an investment specific shock','numbertitle','off')

%investment specific shock
subplot(3,3,1);
plot(t,c_ux,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
axis([0 20 -0.2 0.25]);
title('Consumption');

subplot(3,3,2);
plot(t,l_ux,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.5 0.5]);
title('Labor');

subplot(3,3,3);
plot(t,inv_ux,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -5 5]);
title('Investment');

subplot(3,3,4);
plot(t,q_ux,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.6 0]);
title('q');

subplot(3,3,5);
plot(t,nw_ux,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -1 0]);
title('Net Worth');

subplot(3,3,6);
plot(t,y_ux,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.5]);
title('Output');

subplot(3,3,7);
plot(t,k_ux,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.5]);
title('Capital');

subplot(3,3,8);
plot(t,rn_ux,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.1 0.1]);
title('Nom.int.rate');

subplot(3,3,9);
plot(t,S_ux,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.02]);
title('Ext. Finance Premium');



figure('name','IRFs to an labor supply shock','numbertitle','off')

%labor supply shock
subplot(3,3,1);
plot(t,c_ul,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
axis([0 20 -0.25 0.2]);
title('Consumption');

subplot(3,3,2);
plot(t,l_ul,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.5 0.5]);
title('Labor');

subplot(3,3,3);
plot(t,inv_ul,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -2 2]);
title('Investment');

subplot(3,3,4);
plot(t,q_ul,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -1 1]);
title('q');

subplot(3,3,5);
plot(t,nw_ul,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -2 0]);
title('Net Worth');

subplot(3,3,6);
plot(t,y_ul,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.5 0.5]);
title('Output');

subplot(3,3,7);
plot(t,k_ul,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.4 0]);
title('Capital');

subplot(3,3,8);
plot(t,rn_ul,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.1 0]);
title('Nom.int.rate');

subplot(3,3,9);
plot(t,S_ul,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.02 0.025]);
title('Ext. Finance Premium');


