%*****************************************************************
%impulse response functions for Bailliu et al (2012) for:
% a financial shock 
% a technology shock 
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
%cd C:\test;

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare Bailliu_orig_rep;
%%load mat_res_1.mat;%%load calculated IRF matrices

nul=zeros(20,1);
t=1:1:20;

figure('name','Effects of an Expansionary Financial Shock','numbertitle','off')

%NEGATIVE financial shock
subplot(4,4,1);
plot(t,yt_irf_f,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
axis([0 20 0 0.005]);
title('Output');

subplot(4,4,2);
plot(t,pit_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.005 0.005]);
title('Inflation');

subplot(4,4,3);
plot(t,cgn_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.01 0.01]);
title('Nominal Credit Growth');

subplot(4,4,4);
plot(t,rnt_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.002 0.002]);
title('Policy Rate');

subplot(4,4,5);
plot(t,qt_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.0005 0.0005]);
title('Asset Price');

subplot(4,4,6);
plot(t,nt_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.002 0.002]);
title('Net Worth');

subplot(4,4,7);
plot(t,lev_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.004]);
title('Leverage');

subplot(4,4,8);
plot(t,st_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.002 0.002]);
title('Risk Premium');

subplot(4,4,9);
plot(t,it_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.1 0.1]);
title('Investment');

subplot(4,4,10);
plot(t,ct_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.005 0.005]);
title('Consumption');

subplot(4,4,11);
plot(t,ht_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.01 0.01]);
title('Hours');

subplot(4,4,12);
plot(t,kt_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.004]);
title('Capital');

subplot(4,4,13);
plot(t,mct_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.01 0.01]);
title('Marginal costs');

subplot(4,4,14);
plot(t,ft_irf_f,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.002 0]);
title('Financial Shock');



figure('name','Effects of a Positive Technology Shock','numbertitle','off')

subplot(4,4,1);
plot(t,yt_irf_z,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
axis([0 20 0 0.005]);
title('Output');

subplot(4,4,2);
plot(t,pit_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.002 0.002]);
title('Inflation');

subplot(4,4,3);
plot(t,cgn_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.0005 0.0005]);
title('Nominal Credit Growth');

subplot(4,4,4);
plot(t,rnt_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.0005 0]);
title('Policy Rate');

subplot(4,4,5);
plot(t,qt_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.0002 0.0002]);
title('Asset Price');

subplot(4,4,6);
plot(t,nt_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.001]);
title('Net Worth');

subplot(4,4,7);
plot(t,lev_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.002]);
title('Leverage');

subplot(4,4,8);
plot(t,st_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.0002 0.0002]);
title('Risk Premium');

subplot(4,4,9);
plot(t,it_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.05 0.05]);
title('Investment');

subplot(4,4,10);
plot(t,ct_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.004]);
title('Consumption');

subplot(4,4,11);
plot(t,ht_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.002 0.002]);
title('Hours');

subplot(4,4,12);
plot(t,kt_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.004]);
title('Capital');

subplot(4,4,13);
plot(t,mct_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 -0.001 0]);
title('Marginal costs');

subplot(4,4,14);
plot(t,zt_irf_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
axis([0 20 0 0.01]);
title('TFP Shock');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
