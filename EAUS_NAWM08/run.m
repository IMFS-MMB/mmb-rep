% Run and plot IRF of replication file
% original IRF in Coenen, McAdam and Straub (2008, JEDC), Figure 2, p. 2567


% Software requirement: DYNARE version 4
% This file runs smoothly with DYNARE version 4.2


clear all;
close all;
clc;

%Adjust path to folder where replication dynare file is stored
cd([cd '/EAUS_NAWM08_rep']);

%Run replication dynare file
dynare EAUS_NAWM08_rep

%Display and save (as pdf) replication results
range=-1:20;
figure;
set(0,'defaultaxesfontsize',15);
a=plot(range,[0;0;EA_Y_EA_EPSG(1:20)]/oo_.steady_state(111),'-b', range, [0;0;EA_C_EA_EPSG(1:20)]/oo_.steady_state(5), '--r', range, [0;0;EA_I_EA_EPSG(1:20)]/oo_.steady_state(38), '--g', range, zeros(22,1), ':k');
set(a, 'linewidth',4); set(gca, 'Ytick',[-1.2:.6:1.2], 'YtickLabel',[-1.2:.6:1.2]);
h=legend('Output', 'Consumption','Investment',1);axis([-1 20 -1.2 1.2]);title('Output and private absorption');
print -depsc -tiff replic_fig2_1

figure;
set(0,'defaultaxesfontsize',15);
a=plot(range,[0;0;EA_IM_EA_EPSG(1:20)]/oo_.steady_state(40),'-b', range, [0;0;US_IM_EA_EPSG(1:20)]/oo_.steady_state(155), '--r', range, zeros(22,1), ':k');
set(a, 'linewidth',4); set(gca, 'Ytick',[-.8:.4:.8], 'YtickLabel',[-.8:.4:.8]);
h=legend('Imports', 'Exports',1);axis([-1 20 -.8 .8]);set(0,'defaultaxesfontsize',4);title('Trade volumes');
print -depsc -tiff replic_fig2_2

figure;
set(0,'defaultaxesfontsize',15);
a=plot(range,[0;0;(EA_PIC_EA_EPSG(1:20)+oo_.steady_state(64)).^4-oo_.steady_state(64).^4],'-b', range, [0;0;(EA_R_EA_EPSG(1:20)+oo_.steady_state(74)).^4-oo_.steady_state(74).^4], '--r', range, zeros(22,1), ':k');
set(a, 'linewidth',4); set(gca, 'Ytick',[-.04:.04:.12], 'YtickLabel',[-.04:.04:.12]);
h=legend('Consumer price index', 'Nominal interest rate',1);axis([-1 20 -0.04 0.12]);set(0,'defaultaxesfontsize',4);title('Inflation and interest rate');
print -depsc -tiff replic_fig2_3

figure;
set(0,'defaultaxesfontsize',15);
a=plot(range,[0;0;EA_RER_EA_EPSG(1:20)/oo_.steady_state(75)],'-b', range, [0;0;EA_TOT_EA_EPSG(1:20)/oo_.steady_state(95)], '--r', range, zeros(22,1), ':k');
set(a, 'linewidth',4); set(gca, 'Ytick',[-.15:.05:0.05], 'YtickLabel',[-.15:.05:0.05]);
h=legend('Real exchange rate', 'Terms of trade',1);axis([-1 20 -0.15 0.05]);set(0,'defaultaxesfontsize',4);title('International relative prices');
print -depsc -tiff replic_fig2_4

figure;
set(0,'defaultaxesfontsize',15);
a=plot(range,[0;0;EA_W_EA_EPSG(1:20)]/oo_.steady_state(106),'-b', range, [0;0;EA_ND_EA_EPSG(1:20)]/oo_.steady_state(56), '--r', range, zeros(22,1), ':k');
set(a, 'linewidth',4); set(gca, 'Ytick',[-.4:.4:1.2], 'YtickLabel',[-.4:.4:1.2]);
h=legend('Real wage', 'Hours worked',1);axis([-1 20 -0.40 1.20]);set(0,'defaultaxesfontsize',4);title('Real wage and hours worked');
print -depsc -tiff replic_fig2_5

figure;
set(0,'defaultaxesfontsize',15);
a=plot(range,[0;0;((EA_RK_EA_EPSG(1:20)+oo_.steady_state(77))./(EA_PY_EA_EPSG(1:20)+oo_.steady_state(70))/oo_.steady_state(77)*oo_.steady_state(70))-1],'-b', range, [0;0;((EA_MC_EA_EPSG(1:20)+oo_.steady_state(53))./(EA_PY_EA_EPSG(1:20)+oo_.steady_state(70))/oo_.steady_state(53)*oo_.steady_state(70))-1], '--r', range, zeros(22,1), ':k');
set(a, 'linewidth',4); set(gca, 'Ytick',[-.06:.06:.18], 'YtickLabel',[-.06:.06:.18]);
h=legend('Real rental rate of capital', 'Real marginal cost',1);axis([-1 20 -0.06 0.18]);set(0,'defaultaxesfontsize',4);title('Rental rate and marginal cost');
print -depsc -tiff replic_fig2_6

