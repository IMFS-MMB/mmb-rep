%*****************************************************************
% impulse response functions for Poutineau, J.C. and Vermandel, G. (2015) for:
% a productivity shock 
% a spending shock 
% a price cost-push shock 
% a monetary policy shock 
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/US_PV15_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare US_PV15_rep;

nul=zeros(25,1);
t=1:1:25;

% productivity shock
figure1= figure('name','IRFs to an estimated productivity shock','numbertitle','off')
subplot(2,4,1);
plot(t,ln_yd_e_a,'b','LineWidth',1.5); 
xlim([0 30]);
title('GDP');

subplot(2,4,2);
plot(t,ln_c_e_a,'b','LineWidth',1.5); 
xlim([0 30]);
title('Consumption');

subplot(2,4,3);
hold on
plot(t,ln_i_e_a,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Investment');

subplot(2,4,4);
hold on
plot(t,ln_pi_e_a,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Inflation');

subplot(2,4,5);
hold on
plot(t,ln_y_e_a,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Intensive margin');

subplot(2,4,6);
plot(t,ln_n_e_a,'b','LineWidth',1.5);  
xlim([0 30]);
title('Firms number');

subplot(2,4,7);
plot(t,ln_v_e_a,'b','LineWidth',1.5);  
xlim([0 30]);
title('Firm value');

subplot(2,4,8);
hold on
plot(t,ln_r_e_a,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Nominal MP rate');


% spending shock
figure2= figure('name','IRFs to an estimated spending shock','numbertitle','off')
subplot(2,4,1);
plot(t,ln_yd_e_g,'b','LineWidth',1.5); 
xlim([0 30]);
title('GDP');

subplot(2,4,2);
hold on
plot(t,ln_c_e_g,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Consumption');

subplot(2,4,3);
hold on
plot(t,ln_i_e_g,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Investment');

subplot(2,4,4);
hold on
plot(t,ln_pi_e_g,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Inflation');

subplot(2,4,5);
plot(t,ln_y_e_g,'b','LineWidth',1.5);
xlim([0 30]);
title('Intensive margin');

subplot(2,4,6);
hold on
plot(t,ln_n_e_g,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Firms number');

subplot(2,4,7);
hold on
plot(t,ln_v_e_g,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Firm value');

subplot(2,4,8);
plot(t,ln_r_e_g,'b','LineWidth',1.5);  
xlim([0 30]);
title('Nominal MP rate');

% price cost-push shock
figure3= figure('name','IRFs to an estimated price cost-push shock','numbertitle','off')
subplot(2,4,1);
hold on
plot(t,ln_yd_e_p,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('GDP');

subplot(2,4,2);
hold on
plot(t,ln_c_e_p,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Consumption');

subplot(2,4,3);
hold on
plot(t,ln_i_e_p,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Investment');

subplot(2,4,4);
plot(t,ln_pi_e_p,'b','LineWidth',1.5);
xlim([0 30]);
title('Inflation');

subplot(2,4,5);
hold on
plot(t,ln_y_e_p,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Intensive margin');

subplot(2,4,6);
plot(t,ln_n_e_p,'b','LineWidth',1.5); 
xlim([0 30]);
title('Firms number');

subplot(2,4,7);
hold on
plot(t,ln_v_e_p,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Firm value');

subplot(2,4,8);
hold on
plot(t,ln_r_e_p,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Nominal MP rate');

% price cost-push shock
figure4= figure('name','IRFs to an estimated monetary policy shock','numbertitle','off')
subplot(2,4,1);
hold on
plot(t,ln_yd_e_r,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('GDP');

subplot(2,4,2);
hold on
plot(t,ln_c_e_r,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Consumption');

subplot(2,4,3);
hold on
plot(t,ln_i_e_r,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Investment');

subplot(2,4,4);
hold on
plot(t,ln_pi_e_r,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Inflation');

subplot(2,4,5);
hold on
plot(t,ln_y_e_r,'b','LineWidth',1.5);
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Intensive margin');

subplot(2,4,6);
hold on
plot(t,ln_n_e_r,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Firms number');

subplot(2,4,7);
hold on
plot(t,ln_v_e_r,'b','LineWidth',1.5); 
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Firm value');

subplot(2,4,8);
hold on
plot(t,ln_r_e_r,'b','LineWidth',1.5);  
plot(t,nul,'r');
hold off
xlim([0 30]);
title('Nominal MP rate');
