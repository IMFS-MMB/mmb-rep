%*****************************************************************
% Impulse Responses for:
% Kilponen, Orjasniemi, Ripatti and Verona, "The Aino 2.0 model",
% Bank of Finland Research Discussion Paper No. 16 / 2016
%*****************************************************************

clear all;
close all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/FI_AINO16_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare FI_AINO16_rep.mod;
load FI_AINO16_rep_results.mat;

var_vec = [ 'y      ';
            'cH     ';
            'iH     ';
            'x      ' ;
            'm      ';
            'tbY    ';
            'rK     ';
            'rwage  ';
            'mcY    ';
            'hF     ';
            'ToT    ';
            'pieY   ';
            'rb     ';
            'btot   ';
            'bka    ';
            'nwe    ';
            'q      ';
            'rs     '];

var_desc = ['final output                 ';
            'private consumption          ';
            'private investment           ';
            'exports                      ';
            'imports                      ';
            'trade balance per output     ';
            'rental rate of capital       ';
            'real wages                   ';
            'marginal cost                ';
            'hours                        ';
            'terms of trade               ';
            'output deflator inflation    ';
            'interest rate on loans       ';
            'loans                        ';
            'bank capital-to-asset ratio  ';
            'entrepreneur net worth       ';
            'Q                            ';
            'real exchange rate           '];
          
nul=zeros(21,1);
t=0:1:20;
cd('../')

% productivity shock
figure6= figure('name','IRFs to a capital productivity shock','numbertitle','off')
for iii = 1:length(var_vec)
subplot(6,3,iii)
plot(t, 100*[0; eval(strcat((var_vec(iii,:)),'_epsLAMBDAK'))], '-b', 'LineWidth', 2); hold on
plot(t,nul,'k'); hold on;
title(deblank(var_desc(iii,:)))
end
print('FI_AINO16_irf_tech','-dpdf','-fillpage')

% euro area interest rate shock
figure8= figure('name','IRFs to a euro area interest rate shock','numbertitle','off')
for iii = 1:length(var_vec)
subplot(6,3,iii)
plot(t, 100*[0; eval(strcat((var_vec(iii,:)),'_epsrEUR'))], '-b', 'LineWidth', 2); hold on
plot(t,nul,'k'); hold on;
title(deblank(var_desc(iii,:)))
end
print('FI_AINO16_irf_mon','-dpdf','-fillpage')

