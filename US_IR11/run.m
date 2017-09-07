%********************************************************
%Run and plot IRFs for Ireland (2011) for:
% a preference shock (epsa)
% a renormalized cost-push shock (epse)
% a technolgy shock (epsz)
% a monetary policy shock (epsr)
%********************************************************

%**************************************************************************
%Note: we define annualized inflation (inflationq) and interest rate (interest)
%        and express the output and the ouptput gap in levels (output and output gap)
%**************************************************************************

clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/US_IR11_rep']);

%run replication dynare file
dynare US_IR11_rep;

%load results
load US_IR11_rep_results.mat;

nul=zeros(21,1);
t0=0:1:20;
t=0:1:20;

output_epsa=[0;output_epsa];
output_epse=[0;output_epse];
output_epsz=[0;output_epsz];
output_epsr=[0;output_epsr];

inflationq_epsa=[0;inflationq_epsa];
inflationq_epse=[0;inflationq_epse];
inflationq_epsz=[0;inflationq_epsz];
inflationq_epsr=[0;inflationq_epsr];

interest_epsa=[0;interest_epsa];
interest_epse=[0;interest_epse];
interest_epsz=[0;interest_epsz];
interest_epsr=[0;interest_epsr];

x_epsa=[0;x_epsa];
x_epse=[0;x_epse];
x_epsz=[0;x_epsz];
x_epsr=[0;x_epsr];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot IRFs for the variables:
%   output (output),
%   annualized inflation (inflationq),
%   annualized nominal interest rate (interest),
%   output gap (x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Impulse responses','numbertitle','off')

%Output response
subplot(4,4,1);
plot(t,output_epsa,'b','LineWidth',1.5);           hold on          
plot(t0,nul,'r');
axis([0 20 0 0.35]);
title('Output to Preference');

subplot(4,4,2);
plot(t,output_epse,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.12 0]);
title('Output to Cost-Push');

subplot(4,4,3);
plot(t,output_epsz,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 0 1]);
title('Output to Technology');

subplot(4,4,4);
plot(t,output_epsr,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.25 0]);
title('Output to Monetary Policy');

%Inflation response
subplot(4,4,5);
plot(t,inflationq_epsa,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.1 0.6]);
title('Inflation to Preference');

subplot(4,4,6);
plot(t,inflationq_epse,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.2 0.5]);
title('Inflation to Cost-Push');

subplot(4,4,7);
plot(t,inflationq_epsz,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.4 0]);
title('Inflation to Technology');

subplot(4,4,8);
plot(t,inflationq_epsr,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.5 0]);
title('Inflation to Monetary Policy');


%Interest Rate response
subplot(4,4,9);
plot(t,interest_epsa,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 0 0.7]);
title('Interest Rate to Preference');

subplot(4,4,10);
plot(t,interest_epse,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 0 0.15]);
title('Interest Rate to Cost-Push');

subplot(4,4,11);
plot(t,interest_epsz,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 0 0.08]);
title('Interest Rate to Technology');

subplot(4,4,12);
plot(t,interest_epsr,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 0 0.3]);
title('Interest Rate to Monetary Policy');

%Output Gap response
subplot(4,4,13);
plot(t,x_epsa,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.05 0.25]);
title('Output Gap to Preference');

subplot(4,4,14);
plot(t,x_epse,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.12 0]);
title('Output Gap to Cost-Push');

subplot(4,4,15);
plot(t,x_epsz,'b','LineWidth',1.5);           hold on          
plot(t0,nul,'r');
axis([0 20 -0.2 0]);
title('Output Gap to Technology');

subplot(4,4,16);
plot(t,x_epsr,'b','LineWidth',1.5);              hold on
plot(t0,nul,'r');
axis([0 20 -0.25 0]);
title('Output Gap to Monetary Policy');