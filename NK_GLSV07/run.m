%*****************************************************************
% impulse response functions for Gali, J. et al. (2007) for:
% a fiscal policy shock 
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/NK_GLSV07_rep']);

%%%%%%%%%%%%%%
%run mod-files 
%%%%%%%%%%%%%%

dynare NK_GLSV07_iclm_rep;
g_iclm = g_e_g;
y_iclm = y_e_g;
c_iclm = c_e_g;
i_iclm = i_e_g;
n_iclm = n_e_g;
w_iclm = w_e_g;

save('results.mat', 'g_iclm', 'y_iclm', 'c_iclm', 'i_iclm', 'n_iclm', 'w_iclm' );

dynare NK_GLSV07_pclm_rep;
g_pclm = g_e_g;
y_pclm = y_e_g;
c_pclm = c_e_g;
i_pclm = i_e_g;
n_pclm = n_e_g;
w_pclm = w_e_g;

save('results.mat', 'g_pclm', 'y_pclm', 'c_pclm', 'i_pclm', 'n_pclm', 'w_pclm', '-append' );


load('results.mat');
nul=zeros(20,1);
t=1:1:20;


% fiscal policy shock

figure1= figure('name','Non-Competitive Labor Market','numbertitle','off')
subplot(3,2,1);
plot(t,g_iclm,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
title('Government spending');

subplot(3,2,2);
plot(t,y_iclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Output');

subplot(3,2,3);
plot(t,c_iclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Consumption');

subplot(3,2,4);
plot(t,i_iclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Investment');

subplot(3,2,5);
plot(t,n_iclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Hours');

subplot(3,2,6);
plot(t,w_iclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Real wages');

figure2= figure('name', 'Competitive Labor Market','numbertitle','off')
subplot(3,2,1);
plot(t,g_pclm,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
title('Government spending');

subplot(3,2,2);
plot(t,y_pclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Output');

subplot(3,2,3);
plot(t,c_pclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Consumption');

subplot(3,2,4);
plot(t,i_pclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Investment');

subplot(3,2,5);
plot(t,n_pclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Hours');

subplot(3,2,6);
plot(t,w_pclm,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('Real wages');



