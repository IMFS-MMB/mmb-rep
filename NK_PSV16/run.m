%*****************************************************************
% impulse response functions for Pancrazi, R. et al. (2016) for:
% a monetary policy shock
% a technology shock
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/NK_PSV16_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare NK_PSV16_rep;


load('NK_PSV16_rep_results.mat');
nul=zeros(12,1);
t=1:1:12;



% monetary policy shock

figure1= figure('name','IRFs to a monetary policy shock','numbertitle','off')
subplot(3,3,1),
hold on  
plot(t,y_eM,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Output');

subplot(3,3,2),
hold on  
plot(t,c_eM,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Consumption');

subplot(3,3,3),
hold on  
plot(t,i_eM,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Investment');

subplot(3,3,4),
hold on  
plot(t,n_eM,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Net worth');

subplot(3,3,5),
hold on  
plot(t,rk_eM - r_eM,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Spread');

subplot(3,3,6),
hold on  
plot(t,k_eM,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Capital');

subplot(3,3,7),
hold on  
plot(t,pi_eM,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Inflation');

subplot(3,3,8),
hold on  
plot(t,rn_eM,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Nominal rate');



% technology

figure2= figure('name','IRFs to a technology shock','numbertitle','off')

subplot(3,3,1),
hold on  
plot(t,y_eA,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Output');

subplot(3,3,2),
hold on  
plot(t,c_eA,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Consumption');

subplot(3,3,3),
hold on  
plot(t,i_eA,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Investment');

subplot(3,3,4),
hold on  
plot(t,n_eA,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Net worth');

subplot(3,3,5),
hold on  
plot(t,rk_eA-r_eA,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Spread');

subplot(3,3,6),
hold on  
plot(t,k_eA,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Capital');

subplot(3,3,7),
hold on  
plot(t,pi_eA,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Inflation');

subplot(3,3,8),
hold on  
plot(t,rn_eA,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
title('Nominal rate');
