%*****************************************************************
% impulse response functions for Del Negro et al. (2015) for:
% a monetary policy shock 
% a fiscal policy shock 
% a productivity shock 
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/US_DNGS15_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare US_DNGS15_rep;
load US_DNGS15_rep_results.mat;

nul=zeros(20,1);
t=1:1:20;


% monetary policy shock
figure1= figure('name','IRFs to a monetary policy shock','numbertitle','off')
subplot(2,2,1);
plot(t,og_psi_rm,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
title('Output gap');

subplot(2,2,2);
plot(t,pi_psi_rm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Inflation');

subplot(2,2,3);
plot(t,R_psi_rm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Interest rate');

subplot(2,2,4);
plot(t,y_psi_rm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Output');


% fiscal policy shock
figure2= figure('name','IRFs to a fiscal policy shock','numbertitle','off')
subplot(2,2,1);
plot(t,og_psi_g,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
title('Output gap');

subplot(2,2,2);
plot(t,pi_psi_g,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Inflation');

subplot(2,2,3);
plot(t,R_psi_g,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Interest rate');

subplot(2,2,4);
plot(t,y_psi_g,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Output');

% productivity shock
figure3= figure('name','IRFs to a productivity shock','numbertitle','off')
subplot(2,2,1);
plot(t,og_psi_z,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
title('Output gap');

subplot(2,2,2);
plot(t,pi_psi_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Inflation');

subplot(2,2,3);
plot(t,R_psi_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Interest rate');

subplot(2,2,4);
plot(t,y_psi_z,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Output');


