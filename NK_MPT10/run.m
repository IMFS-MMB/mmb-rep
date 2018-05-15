%********************************************************
%Run and plot IRFs in Fig.1. in  T. Monacelli, R. Perotti, A. Trigari (2010): "Unemployment Fiscal Multiplier", 
% Journal of Monetary Economics 57, pp.531-553

% Codes prepared by Felix Strobel
%********************************************************

clear all;
clc;
close all;
warning off;
%adjust path to folder where replication file is stored
cd([cd '/NK_MPT10_rep']);

%run replication dynare file
dynare NK_MPT10_rep;

%load results 
 
load NK_MPT10_rep_results.mat;

shocks={'e'};

horizon = 40;
cd ..

figure;
subplot(2,2,1);
plot(y_e/y_ss*100,'k','LineWidth',1.2); 
title('Output')
subplot(2,2,2);
plot(n_e/n_ss*100,'k','LineWidth',1.2); 
title('Employment')
subplot(2,2,3); 
plot(u_e/(u_ss+n_ss)*100,'k','LineWidth',1.2);  
title('Unemployment (in %)')
subplot(2,2,4); 
plot(c_e/c_ss*100,'k','LineWidth',1.2); 
title('Consumption')

saveas(gcf, 'Fig11' , 'pdf')