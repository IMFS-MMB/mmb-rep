%********************************************************
%Run and plot IRFs in Fig.1. in  Peter Ireland. ``Monetary policy, bond risk premia, and the economy''
%In: Journal of Monetary Economics (2015)
% Codes prepared by Meguy Kuete
%********************************************************

clear all;
clc;
close all;
warning off;
%adjust path to folder where replication file is stored
cd([cd '/US_IR15_rep']);

%run replication dynare file
dynare US_IR15_rep;

%load results 
 
load US_IR15_rep_results.mat;

shocks={'epsilon_r'};

horizon = 20;

Var={'output'; 'y_4_a'; 'P_y_4_a'; 'inflation'; 'y_8_a'; 'P_y_8_a'; 'r_a'; ...
     'y_12_a'; 'P_y_12_a'; 'v'; 'y_16_a'; 'P_y_16_a'; 'tau'; 'y_20_a'; 'P_y_20_a'}; 
 
for v = 1:size(Var,1)
    for s = 1:size(shocks,1)         
            eval(['dd= oo_.irfs.' Var{v} '_' shocks{s} ';'])
            eval(['IRFs( v , s ,1: horizon ) = dd(1:horizon);'])           
    end
end

cd ..
t=0:1:horizon;
Var_name={'Output Gap'; 'One-Year Rate'; 'One-Year Risk Premium'; 'Inflation'; 'Two-Year Rate'; 'Two-Year Risk Premium';
         'Short Rate';'Three-Year Rate'; 'Three-Year Risk Premium'; 'Risk Variable'; 'Four-Year Rate'; 'Four-Year Risk Premium';...
         'Inflation Target'; 'Five-Year Rate'; 'Five-Year Risk Premium'}; 
for s = 1:size(shocks,1) 
    figure('name','IRFs to a monetary policy shock','numbertitle','off','Position', [10, 10, 900, 1000])
    for v = 1:15 
        subplot(5,3,v);        
        plot(t,[0; squeeze(IRFs(v,s,1:horizon))],'k','LineWidth',1.2); hold on        
        title(Var_name{v});
    end
end

saveas(gcf, 'IRFs_MP_Shock' , 'pdf')