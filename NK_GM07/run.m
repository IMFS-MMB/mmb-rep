%********************************************************
%Run and plot IRFs in Fig.4. in  Goodfriend, M., B.T. McCallum. 2007. " Banking and interest raets in monetary policy analysis: A quantitative exploration".
% Journal of Monetary Economics 54, pp. 1480-1507
% Codes prepared by Felix Strobel
%********************************************************

clear all;
clc;
close all;
warning off;
%adjust path to folder where replication file is stored
cd([cd '/NK_GM07_rep']);

%run replication dynare file
dynare NK_GM07_rep;

%load results 
 
load NK_GM07_rep_results.mat;

shocks={'eps_a1'};

horizon = 20;

Var={'n'; 'w'; 'm'; 'q'; 'rIB'; 'mc'; 'c'; ...
     'lambda'; 'EFP'; 'rB'; 'dp'; 'rT'}; 
 
for v = 1:size(Var,1)
    for s = 1:size(shocks,1)         
            eval(['dd= oo_.irfs.' Var{v} '_' shocks{s} ';'])
            eval(['IRFs( v , s ,1: horizon ) = dd(1:horizon);'])           
    end
end

cd ..
t=0:1:horizon;
Var_name={'Labor'; 'Wage'; 'Money'; 'Price of Capital'; 'Interbank Rate'; 'Marginal Cost';
         'Consumption';'Lag. Multiplier'; 'EFP'; 'Bond Rate'; 'Inflation'; 'Security Rate'}; 
for s = 1:size(shocks,1) 
    figure('name','IRFs to a technology shock','numbertitle','off','Position', [10, 10, 900, 1000])
    for v = 1:12 
        subplot(4,3,v);        
        plot(t,[0; squeeze(IRFs(v,s,1:horizon))],'k','LineWidth',1.2); hold on        
        title(Var_name{v});
    end
end

saveas(gcf, 'Fig4' , 'pdf')