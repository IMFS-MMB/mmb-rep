% Run and plot IRFs of replication file 

clear;
clc;
close all;

% Adjust path to folder where replication file is stored
%cd 'C:\Users\PL\Dropbox\PhD(DB)\3.WS15\SeminarMacro-FinancialModeling\Update'

% Run replication dynare file
 cd([cd '/NK_ET14_rep']);
dynare NK_ET14_rep.mod

% Generate figure variables
t = 1:length(Y_epsnu);
z = ones(length(t),1)*0;

% Replication of Figure 1
figure
subplot(4,3,1)
plot(t, Pi_epsnu, 'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([0 4e-04])
title('\Pi','FontSize',10);
subplot(4,3,2)
plot(t, Y_epsnu, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-5e-04 5e-04])
title('Y','FontSize',10);
subplot(4,3,3)
plot(t, i_epsnu, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-5e-03 5e-03])
title('i','FontSize',10);
subplot(4,3,4)
plot(t, PB_epsnu, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-5e-03 5e-03])
title('P^B','FontSize',10);
subplot(4,3,5)
plot(t, PQ_epsnu, 'black',t, z,'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-0.05 0.05])
title('P^Q','FontSize',10);
subplot(4,3,6)
plot(t, Pss_epsnu,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-0.02 0])
title('P^S * s','FontSize',10);
subplot(4,3,7)
plot(t, b_epsnu, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-0.02 0])
title('b','FontSize',10);
subplot(4,3,8)
plot(t, q_epsnu, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-0.02 0.02])
title('q','FontSize',10);
subplot(4,3,9)
plot(t, s_epsnu,'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-0.02 0])
title('s','FontSize',10);
subplot(4,3,10)
plot(t, qCB_epsnu,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-0.02 0.02])
title('q^{CB}','FontSize',10);
subplot(4,3,11)
plot(t, L_epsnu,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([0 2e-03])
title('L','FontSize',10);
subplot(4,3,12)
plot(t, w_epsnu, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([0 1e-03])
title('w','FontSize',10);

% Replication of Figure 2
figure
subplot(4,3,1)
plot(t, Pi_epsksi, 'black',t, z,'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([0 5e-05])
title('\Pi','FontSize',10);
subplot(4,3,2)
plot(t, Y_epsksi,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-5e-05 5e-05])
title('Y','FontSize',10);
subplot(4,3,3)
plot(t, i_epsksi,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([0 5e-05])
title('i','FontSize',10);
subplot(4,3,4)
plot(t, PB_epsksi,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-5e-05 0])
title('P^B','FontSize',10);
subplot(4,3,5)
plot(t, PQ_epsksi,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-5e-03 5e-03])
title('P^Q','FontSize',10);
subplot(4,3,6)
plot(t, Pss_epsksi,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-2e-03 0])
title('P^S * s','FontSize',10);
subplot(4,3,7)
plot(t, b_epsksi, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-2e-03 0])
title('b','FontSize',10);
subplot(4,3,8)
plot(t, q_epsksi, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-1e-03 1e-03])
title('q','FontSize',10);
subplot(4,3,9)
plot(t, s_epsksi,'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-2e-03 0])
title('s','FontSize',10);
subplot(4,3,10)
plot(t, qCB_epsksi,'black', t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([-1e-03 1e-03])
title('q^{CB}','FontSize',10);
subplot(4,3,11)
plot(t, L_epsksi, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([0 2e-04 ])
title('L','FontSize',10);
subplot(4,3,12)
plot(t, w_epsksi, 'black',t, z, 'red', 'LineWidth', 1.5)
xlim([1 20])
ylim([0 1e-04 ])
title('w','FontSize',10);