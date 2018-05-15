%********************************************************
%Run and plot IRFs for Lubik and Schorfheide (2007) for:
% a monetary shock (epsR)
% a terms of trade (TOT) shock (epsq)
% a row output shock (epsy_star)
% a row inflation shock (epspi_star)

%Note: the IRFs in the paper are Bayesian impulse responses, 
%    hence the replicated impulse responses do not match the IRFs in the paper precisely;
%    the impulse responses for monetary, TOT, row output and row inflatuion shock do qualitatively match the
%    IRFs in the paper; we are not able to qualitatively replicate the IRFs
%    for the technology shock (epsz)
%********************************************************

clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/CA_LS07_rep']);

%run replication dynare file
dynare CA_LS07_rep;

%load results
load CA_LS07_rep_results.mat;

nul=zeros(13,1);
t0 = 0:1:12;
t=1:1:12;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot IRFs for the variables:
%   output (y),
%   annualized inflation (inflationq),
%   annualized nominal interest rate (interest),
%   exchange rate growth (deltae) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Impulse responses','numbertitle','off')

%MP shock
subplot(4,4,1);
plot(t,y_epsR,'b','LineWidth',1.5);           hold on          
plot(t0,nul,'r');
axis([0 12 -0.36 0]);
ylabel('output'); 
title('monetary shock');

subplot(4,4,2);
plot(t,inflationq_epsR,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 -2 0]);
ylabel('inflation');
title('monetary shock');

subplot(4,4,3);
plot(t,interest_epsR,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 0 0.9]);
ylabel('nom. interest rate');
title('monetary shock');

subplot(4,4,4);
plot(t,deltae_epsR,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 -0.5 0]);
ylabel('exch.rate growth');
title('monetary shock');

%TOT shock
subplot(4,4,5);
plot(t,y_epsq,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 0 0.08]);
ylabel('output');
title('TOT shock');

subplot(4,4,6);
plot(t,inflationq_epsq,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 -0.3 0.2]);
ylabel('inflation');
title('TOT shock');

subplot(4,4,7);
plot(t,interest_epsq,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 -0.26 0.05]);
ylabel('nom. interest rate');
title('TOT shock');

subplot(4,4,8);
plot(t,deltae_epsq,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 -1.6 0.4]);
ylabel('exch.rate growth');
title('TOT shock');


%row output shock
subplot(4,4,9);
plot(t,y_epsy_star,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
%axis([0 12 -0.4 0]);
axis([0 12 -0.6 0]);
ylabel('output');
title('row output shock');

subplot(4,4,10);
plot(t,inflationq_epsy_star,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 0.4 2]);
ylabel('inflation');
title('row output shock');

subplot(4,4,11);
plot(t,interest_epsy_star,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 0.5 1.1]);
ylabel('nom. interest rate');
title('row output shock');

subplot(4,4,12);
plot(t,deltae_epsy_star,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 0.1 0.5]);
ylabel('exch.rate growth');
title('row output shock');

%row inflation shock
subplot(4,4,13);
plot(t,y_epspi_star,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 0 0.14]);
ylabel('output');
title('row inflation shock');

subplot(4,4,14);
plot(t,inflationq_epspi_star,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 0 0.9]);
ylabel('inflation');
title('row inflation shock');

subplot(4,4,15);
plot(t,interest_epspi_star,'b','LineWidth',1.5);           hold on          
plot(t0,nul,'r');
axis([0 12 -0.1 0.06]);
ylabel('nom. interest rate');
title('row inflation shock');

subplot(4,4,16);
plot(t,deltae_epspi_star,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 12 -2 0.2]);
ylabel('exch.rate growth');
title('row inflation shock');

