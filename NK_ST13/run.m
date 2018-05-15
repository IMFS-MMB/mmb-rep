%********************************************************
%Run and plot IRFs in Fig.1. in   Stracca, L. 2013. "Inside Money in General Equilibrium: Does it matter for monetary policy?".
% Macroeconomic Dynamics 17, pp. 563-590.

% Codes prepared by Felix Strobel
%********************************************************

clear all;
clc;
close all;
warning off;
%adjust path to folder where replication file is stored
cd([cd '/NK_ST13_rep']);

%run replication dynare file
dynare NK_ST13_rep;

%load results 
 
load NK_ST13_rep_results.mat;

shocks={'epsilon_r'};

horizon = 25;

Var={'c'; 'i'; 'y'; 'pi'; 'R'; 'm'; 'd'; ...
     'IMP'}; 
 
for v = 1:size(Var,1)
    for s = 1:size(shocks,1)         
            eval(['dd= oo_.irfs.' Var{v} '_' shocks{s} ';'])
            eval(['IRFs( v , s ,1: horizon ) = dd(1:horizon);'])           
    end
end

cd ..
t=0:1:horizon;
Var_name={'Consumption'; 'Investment'; 'Output'; 'Inflation'; 'Nominal Interest Rate'; 'Outside Money'; 'Inside Money'; 'Inside Money Premium'
         }; 
for s = 1:size(shocks,1) 
    figure('name','IRFs to a monetary policyshock','numbertitle','off','Position', [10, 10, 900, 1000])
    for v = 1:8
        subplot(4,2,v);        
        plot(t,[0; squeeze(IRFs(v,s,1:horizon))],'k','LineWidth',1.2); hold on        
        title(Var_name{v});
    end
end

saveas(gcf, 'Fig2' , 'pdf')