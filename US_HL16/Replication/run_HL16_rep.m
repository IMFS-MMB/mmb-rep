% Plot IRFs to a positive technology shock


clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/US_HL16_rep']);

dynare US_HL16_NEP
load US_HL16_NEP_results.mat;

y_epsilon_z_NEP = y_epsilon_z;
i_d_epsilon_z_NEP = i_d_epsilon_z;
pi_epsilon_z_NEP = pi_epsilon_z;
y_epsilon_i_NEP = y_epsilon_i;
i_d_epsilon_i_NEP = i_d_epsilon_i;
pi_epsilon_i_NEP = pi_epsilon_i;
y_epsilon_p_NEP = y_epsilon_p;
i_d_epsilon_p_NEP = i_d_epsilon_p;
pi_epsilon_p_NEP = pi_epsilon_p;

k_BL_epsilon_z_NEP = k_BL_epsilon_z;
i_e_epsilon_z_NEP = i_e_epsilon_z;
l_e_epsilon_z_NEP= l_e_epsilon_z;
d_epsilon_z_NEP = d_epsilon_z;
k_BL_epsilon_i_NEP = k_BL_epsilon_i;
i_e_epsilon_i_NEP = i_e_epsilon_i;
l_e_epsilon_i_NEP= l_e_epsilon_i;
d_epsilon_i_NEP = d_epsilon_i;
k_BL_epsilon_p_NEP = k_BL_epsilon_p;
i_e_epsilon_p_NEP = i_e_epsilon_p;
l_e_epsilon_p_NEP= l_e_epsilon_p;
d_epsilon_p_NEP = d_epsilon_p;


%%

dynare US_HL16_FI
load US_HL16_FI_results.mat;

y_epsilon_z_FI = y_epsilon_z;
i_d_epsilon_z_FI = i_d_epsilon_z;
q_psi_epsilon_z_FI = q_psi_epsilon_z;
pi_epsilon_z_FI = pi_epsilon_z;
y_epsilon_i_FI = y_epsilon_i;
i_d_epsilon_i_FI = i_d_epsilon_i;
q_psi_epsilon_i_FI = q_psi_epsilon_i;
pi_epsilon_i_FI = pi_epsilon_i;
y_epsilon_psi_FI = y_epsilon_psi;
i_d_epsilon_psi_FI = i_d_epsilon_psi;
q_psi_epsilon_psi_FI = q_psi_epsilon_psi;
pi_epsilon_psi_FI = pi_epsilon_psi;
y_epsilon_p_FI = y_epsilon_p;
i_d_epsilon_p_FI = i_d_epsilon_p;
q_psi_epsilon_p_FI = q_psi_epsilon_p;
pi_epsilon_p_FI = pi_epsilon_p;

k_BL_epsilon_z_FI = k_BL_epsilon_z;
i_e_epsilon_z_FI = i_e_epsilon_z;
l_e_epsilon_z_FI= l_e_epsilon_z;
d_epsilon_z_FI = d_epsilon_z;
k_BL_epsilon_i_FI = k_BL_epsilon_i;
i_e_epsilon_i_FI = i_e_epsilon_i;
l_e_epsilon_i_FI= l_e_epsilon_i;
d_epsilon_i_FI = d_epsilon_i;
k_BL_epsilon_psi_FI = k_BL_epsilon_psi;
i_e_epsilon_psi_FI = i_e_epsilon_psi;
l_e_epsilon_psi_FI= l_e_epsilon_psi;
d_epsilon_psi_FI = d_epsilon_psi;
k_BL_epsilon_p_FI = k_BL_epsilon_p;
i_e_epsilon_p_FI = i_e_epsilon_p;
l_e_epsilon_p_FI= l_e_epsilon_p;
d_epsilon_p_FI = d_epsilon_p;


%%
%run replication dynare file
dynare US_HL16_BEP;


%load results
load US_HL16_BEP_results.mat;


t=1:1:15;

%% Figure 4
figure;
subplot(4,4,1);
plot(t,100*y_epsilon_z,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*y_epsilon_z_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*y_epsilon_z_FI,'k:', 'LineWidth',2);
ylabel('Output');
title('Technology shock');
grid on;

subplot(4,4,5);
plot(t,100*i_d_epsilon_z,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*i_d_epsilon_z_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*i_d_epsilon_z_FI,'k:', 'LineWidth',2);
ylabel('Policy rate');
grid on;

subplot(4,4,9);
plot(t,100*q_psi_epsilon_z,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*q_psi_epsilon_z_FI,'k:', 'LineWidth',2);
ylabel('Equity price');
grid on;

subplot(4,4,13);
plot(t,100*pi_epsilon_z,'k-', 'LineWidth',2);
%axis([0 20 -0.26 0.05]);
hold on;
plot(t,100*pi_epsilon_z_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*pi_epsilon_z_FI,'k:', 'LineWidth',2);
ylabel('Inflation');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,4,2);
plot(t,100*y_epsilon_i, 'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*y_epsilon_i_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*y_epsilon_i_FI,'k:', 'LineWidth',2);
title('Mon. policy shock');
grid on;

subplot(4,4,6);
plot(t,100*i_d_epsilon_i,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*i_d_epsilon_i_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*i_d_epsilon_i_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,10);
plot(t,100*q_psi_epsilon_i,'k-', 'LineWidth',2);
hold on;
plot(t,100*q_psi_epsilon_i_FI,'k:', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
grid on;

subplot(4,4,14);
plot(t,100*pi_epsilon_i,'k-', 'LineWidth',2);
%axis([0 20 -0.26 0.05]);
hold on;
plot(t,100*pi_epsilon_i_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*pi_epsilon_i_FI,'k:', 'LineWidth',2);
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,4,3);
plot(t,100*y_epsilon_psi, 'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*y_epsilon_psi_FI,'k:', 'LineWidth',2);
title('Equity price shock');
grid on;

subplot(4,4,7);
plot(t,100*i_d_epsilon_psi,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*i_d_epsilon_psi_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,11);
plot(t,100*q_psi_epsilon_psi,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*q_psi_epsilon_psi_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,15);
plot(t,100*pi_epsilon_psi,'k-', 'LineWidth',2);
%axis([0 20 -0.26 0.05]);
hold on;
plot(t,100*pi_epsilon_psi_FI,'k:', 'LineWidth',2);
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,4,4);
plot(t,100*y_epsilon_p, 'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*y_epsilon_p_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*y_epsilon_p_FI,'k:', 'LineWidth',2);
title('Price markup shock');
grid on;

subplot(4,4,8);
plot(t,100*i_d_epsilon_p,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*i_d_epsilon_p_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*i_d_epsilon_p_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,12);
plot(t,100*q_psi_epsilon_p,'k-', 'LineWidth',2);
hold on;
plot(t,100*q_psi_epsilon_p_FI,'k:', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
grid on;

subplot(4,4,16);
plot(t,100*pi_epsilon_p,'k-', 'LineWidth',2);
%axis([0 20 -0.26 0.05]);
hold on;
plot(t,100*pi_epsilon_p_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*pi_epsilon_p_FI,'k:', 'LineWidth',2);
grid on;
legend('Bseline(BEP)','No equity (NEP)','Flexible rates (FI)', 'Location', 'southoutside','orientation', 'horizontal')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Figure 5
figure;
subplot(4,4,1);
plot(t,100*k_BL_epsilon_z,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*k_BL_epsilon_z_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*k_BL_epsilon_z_FI,'k:', 'LineWidth',2);
ylabel('Capital-asset ratio');
title('Technology shock');
grid on;

subplot(4,4,5);
plot(t,100*i_e_epsilon_z,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*i_e_epsilon_z_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*i_e_epsilon_z_FI,'k:', 'LineWidth',2);
ylabel('Entrepreneur rate');
grid on;

subplot(4,4,9);
plot(t,100*l_e_epsilon_z,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*l_e_epsilon_z_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*l_e_epsilon_z_FI,'k:', 'LineWidth',2);
ylabel('Entrepreneur loans');
grid on;

subplot(4,4,13);
plot(t,100*d_epsilon_z,'k-', 'LineWidth',2);
%axis([0 20 -0.26 0.05]);
hold on;
plot(t,100*d_epsilon_z_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*d_epsilon_z_FI,'k:', 'LineWidth',2);
ylabel('Deposits');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,4,2);
plot(t,100*k_BL_epsilon_i, 'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*k_BL_epsilon_i_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*k_BL_epsilon_i_FI,'k:', 'LineWidth',2);
title('Mon. policy shock');
grid on;

subplot(4,4,6);
plot(t,100*i_e_epsilon_i,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*i_e_epsilon_i_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*i_e_epsilon_i_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,10);
plot(t,100*l_e_epsilon_i,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*l_e_epsilon_i_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*l_e_epsilon_i_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,14);
plot(t,100*d_epsilon_i,'k-', 'LineWidth',2);
%axis([0 20 -0.26 0.05]);
hold on;
plot(t,100*d_epsilon_i_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*d_epsilon_i_FI,'k:', 'LineWidth',2);
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,4,3);
plot(t,100*k_BL_epsilon_psi, 'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*k_BL_epsilon_psi_FI,'k:', 'LineWidth',2);
title('Equity price shock');
grid on;

subplot(4,4,7);
plot(t,100*i_e_epsilon_psi,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*i_e_epsilon_psi_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,11);
plot(t,100*l_e_epsilon_psi,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*l_e_epsilon_psi_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,15);
plot(t,100*d_epsilon_psi,'k-', 'LineWidth',2);
%axis([0 20 -0.26 0.05]);
hold on;
plot(t,100*d_epsilon_psi_FI,'k:', 'LineWidth',2);
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,4,4);
plot(t,100*k_BL_epsilon_p, 'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*k_BL_epsilon_p_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*k_BL_epsilon_p_FI,'k:', 'LineWidth',2);
title('Price markup shock');
grid on;

subplot(4,4,8);
plot(t,100*i_e_epsilon_p,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*i_e_epsilon_p_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*i_e_epsilon_p_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,12);
plot(t,100*l_e_epsilon_p,'k-', 'LineWidth',2);
%axis([0 20 -1.2 0.2]);
hold on;
plot(t,100*l_e_epsilon_p_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*l_e_epsilon_p_FI,'k:', 'LineWidth',2);
grid on;

subplot(4,4,16);
plot(t,100*d_epsilon_p,'k-', 'LineWidth',2);
%axis([0 20 -0.26 0.05]);
hold on;
plot(t,100*d_epsilon_p_NEP,'k--', 'LineWidth',2);
hold on;
plot(t,100*d_epsilon_p_FI,'k:', 'LineWidth',2);
grid on;

legend('Bseline(BEP)','No equity (NEP)','Flexible rates (FI)', 'Location', 'southoutside','orientation', 'horizontal')

