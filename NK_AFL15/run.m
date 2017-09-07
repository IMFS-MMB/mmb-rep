% Run and plot IRFs of replication file 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '\NK_AFL15_rep']);

% Run replication dynare file
dynare NK_AFL15_rep

%For technology shock
irf_afl_y_a   = y_ua;
irf_afl_pi_a  = pai_ua;
irf_afl_c_a   = c_ua*(yss/css);
irf_afl_inv_a = inv_ua*(yss/invss);
irf_afl_deprat_a = deprat_ua;
irf_afl_br_a  =  br_ua;

%For monetary policy shock
irf_afl_y_r   = y_ur;
irf_afl_pi_r  = pai_ur;
irf_afl_c_r   = c_ur*(yss/css);
irf_afl_inv_r = inv_ur*(yss/invss);
irf_afl_deprat_r = deprat_ur;
irf_afl_br_r  =  br_ur;

% Go back to original path
cd('..');


% Plot replicated IRFs
t = 0:1:length(irf_afl_y_a)-1;
t2 = 0:1:15;
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Technology Shock');
subplot(3,2,1);
plot(t,irf_afl_y_a,'LineWidth',2);
grid on
ylim([0 0.2]);
%yticks([0 0.1 0.2]);
title('Output','FontSize',10);

subplot(3,2,2);
plot(t,irf_afl_pi_a,'LineWidth',2);
grid on
ylim([-0.4 0]);
%yticks([-0.4 -0.2 0]);
title('Inflation','FontSize',10);

subplot(3,2,3);
plot(t,irf_afl_c_a,'LineWidth',2);
grid on
ylim([0 0.2]);
%yticks([0 0.1 0.2]);
title('Consumption','FontSize',10);

subplot(3,2,4);
plot(t,irf_afl_inv_a,'LineWidth',2);
grid on
ylim([-0.5 0.5]);
%yticks([-0.5 0 0.5]);
title('Investment','FontSize',10);

subplot(3,2,5);
plot(t,irf_afl_deprat_a,'LineWidth',2);
grid on
ylim([0 0.4]);
%yticks([0 0.2 0.4]);
title('Deposit Ratio','FontSize',10);

subplot(3,2,6);
plot(t,irf_afl_br_a,'LineWidth',2);
grid on
ylim([0 0.1]);
%yticks([0 0.05 0.1]);
title('Bank Riskiness','FontSize',10);

figure2 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy Shock');
subplot(3,2,1);
plot(t2,irf_afl_y_r(1:length(t2)),'LineWidth',2);
grid on
ylim([-2 0]);
%yticks([-2 -1 0]);
title('Output','FontSize',10);

subplot(3,2,2);
plot(t2,irf_afl_pi_r(1:length(t2)),'LineWidth',2);
grid on
ylim([-0.5 0.5]);
%yticks([-0.5 0 0.5]);
title('Inflation','FontSize',10);

subplot(3,2,3);
plot(t2,irf_afl_c_r(1:length(t2)),'LineWidth',2);
grid on
ylim([-0.5 0]);
%yticks([-0.4 -0.2 0]);
title('Consumption','FontSize',10);

subplot(3,2,4);
plot(t2,irf_afl_inv_r(1:length(t2)),'LineWidth',2);
grid on
ylim([-10 10]);
%yticks([-10 0 10]);
title('Investment','FontSize',10);

subplot(3,2,5);
plot(t2,irf_afl_deprat_r(1:length(t2)),'LineWidth',2);
grid on
ylim([-0.05 0]);
%yticks([-0.04 -0.02 0]);
title('Deposit Ratio','FontSize',10);

subplot(3,2,6);
plot(t2,irf_afl_br_r(1:length(t2)),'LineWidth',2);
grid on
ylim([-0.5 0]);
%yticks([-0.4 -0.2 0]);
title('Bank Riskiness','FontSize',10);