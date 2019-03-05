%*****************************************************************
% impulse response functions for Galí and Monacelli (2016) for:
% a temporary payroll tax shock in two different monetary policy regimes
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/NK_GM16_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare NK_GM16cu_rep;

n_cu = ngraph_et;
i_cu = igraph_et;
r_cu = rgraph_et;
s_cu = sgraph_et;

save('results.mat', 'n_cu', 'i_cu', 'r_cu', 's_cu');

dynare NK_GM16dit_rep;

n_dit = ngraph_et;
i_dit = igraph_et;
r_dit = rgraph_et;
s_dit = sgraph_et;

save('results.mat', 'n_dit', 'i_dit', 'r_dit', 's_dit', '-append' );


load('results.mat');
nul=zeros(25,1);
t=1:1:25;


% labor tax shock
figure1= figure('name','Dynamic responses to a temporary payroll tax cut','numbertitle','off')
subplot(2,2,1),
hold on  
plot(t,n_cu,'b','LineWidth',1.5);  
plot(t,n_dit,'.-r','LineWidth',1.5);                   
legend('Currency union','Inflation targeting')
hold off
title('Employment');

subplot(2,2,2);
hold on  
plot(t,i_cu,'b','LineWidth',1.5);  
plot(t,i_dit,'.-r','LineWidth',1.5);                   
hold off
title('Nominal rate');

subplot(2,2,3);
hold on  
plot(t,r_cu,'b','LineWidth',1.5);  
plot(t,r_dit,'.-r','LineWidth',1.5);                   
hold off
title('Real rate');

subplot(2,2,4);
hold on  
plot(t,s_cu,'b','LineWidth',1.5);  
plot(t,s_dit,'.-r','LineWidth',1.5);                   
hold off
title('Terms of trade');



