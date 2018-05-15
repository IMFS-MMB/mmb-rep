%********************************************************
%Run and plot IRFs in Fig.1. in  Kirchner, M., S. van Wijnbergen. 2016. " Fiscal deficits, financial fragility, 
% and the effectiveness of government policies". Journal of Monetary Economics 80, pp. 51-68.

% Codes prepared by Felix Strobel
%********************************************************

clear all;
clc;
close all;
warning off;
%adjust path to folder where replication file is stored
cd([cd '/NK_KW16_rep']);

%run replication dynare file
dynare NK_KW16_rep;

%load results 
 
load NK_KW16_rep_results.mat;

shocks={'e_g'};

horizon = 30;

Var={'Gy'; 'ERb'; 'ERk'; 'I'; 'K'; 'Q'; 'N'; ...
     'Phi'; 'G'; 'C'; 'Y'}; 
 
for v = 1:size(Var,1)
    for s = 1:size(shocks,1)         
            eval(['dd= oo_.irfs.' Var{v} '_' shocks{s} ';'])
            eval(['IRFs( v , s ,1: horizon ) = dd(1:horizon);'])           
    end
end

cd ..
t=0:1:horizon;
Var_name={'Gov. Spending'; 'Return on Bonds'; 'Return on Capital'; 'Investment'; 'Capital'; 'Price of Capital'; 'Bank Net Worth'; 'Bank Leverage';
         'Gov. Spending'; 'Consumption'; 'Output'}; 
for s = 1:size(shocks,1) 
    figure('name','IRFs to a government spending shock','numbertitle','off','Position', [10, 10, 900, 1000])
    for v = 1:11 
        subplot(4,3,v);        
        plot(t,[0; squeeze(IRFs(v,s,1:horizon))],'k','LineWidth',1.2); hold on        
        title(Var_name{v});
    end
end

saveas(gcf, 'Fig1' , 'pdf')