%********************************************************
%Run and plot IRFs in Fig.1. for the financial accelerator case in  Gertler, M. and Karadi, P. ``A Model of Unconvetional Monetary Policy''
%In: Journal of Monetary Economics (2011)
 
%********************************************************

clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/NK_GK11_rep']);

%run replication dynare file
dynare NK_GK11_rep;

%load results
load NK_GK11_rep_results.mat;

 
t=1:1:40;


figure('name','Impulse responses','numbertitle','off') 
subplot(3,3,1);
plot(t,Y_e_a,'k','LineWidth',1.5);  
ylabel([{'a'};{'$\%\Delta$ from ss'}], 'Interpreter','LaTex'); 
title('Y');

subplot(3,3,2);
plot(t,I_e_a,'k','LineWidth',1.5);  
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex'); 
title('I');


subplot(3,3,3);
plot(t,4*prem_e_a,'k','LineWidth',1.5);  
ylabel('Annualized $\%\Delta$ from ss', 'Interpreter','LaTex'); 
title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');

subplot(3,3,4);
plot(t,Y_e_i,'k','LineWidth',1.5); 
ylabel([{'m'};{'$\%\Delta$ from ss'}], 'Interpreter','LaTex'); 
title('Y');

subplot(3,3,5);
plot(t,I_e_i,'k','LineWidth',1.5);  
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex'); 
title('I');


subplot(3,3,6);
plot(t,4*prem_e_i,'k','LineWidth',1.5);  
ylabel('Annualized $\%\Delta$ from ss', 'Interpreter','LaTex'); 
title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');

subplot(3,3,7);
plot(t,Y_e_Ne,'k','LineWidth',1.5); 
ylabel([{'N'};{'$\%\Delta$ from ss'}], 'Interpreter','LaTex'); 
title('Y');

subplot(3,3,8);
plot(t,I_e_Ne,'k','LineWidth',1.5);  
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex'); 
title('I');


subplot(3,3,9);
plot(t,4*prem_e_Ne,'k','LineWidth',1.5);  
ylabel('Annualized $\%\Delta$ from ss', 'Interpreter','LaTex'); 
title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');
cd ..
saveas(gcf, 'irf_fig_1_FA', 'pdf') %Save figure