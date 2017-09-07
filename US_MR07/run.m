% Programm to replicate impulse response functions of
% Mankiw and Reis (2007), "Sticky Information in GE" (Figure 1 on page 608)


% Written by Christian Rühl

% Calls the dynare mod-file US_MR07_rep and the function SIGEmafive1
% SIGEmafive1 is adopted form the code found on homepage of Ricardo Reis


clc; clear all; close all;


% Compute impulse reponses to monetary shock usind dynare
% To change number of lagged information sets, change the dynare mod-file


% Adjust path to folder where replication file is stored
cd([cd '\US_MR07_rep']);


tic;

dynare US_MR07_rep;

clc;
close all;

disp('It took')
t = toc/60
disp('minutes to solve model using Dynare');

% Store Impulse Responses
ir_p  = pi_e_e;
ir_x  = x_e_e;
ir_l  = l_e_e;

cd('..');
cd([cd '/US_MR07_orig']);

% Compute impulse responses to monetary shock using Mankiw and Reis (2007) code
N = 1000;

[ma_m] = SIGEmafive1(N);

% Plot Impulse Response 

figure(1);

subplot(1,3,1);
hold on;
plot(pi_e_e, 'LineWidth', 3);
plot(0.012*ma_m(1:40,1), 'r', 'LineWidth', 3);
hold off;
title('Inflation');
legend('Dynare Code', 'Code of Reis', 'Location', 'NorthEast');
ylim([0 0.01]);
set(gca, 'yTick', 0:0.002:0.01);
xlim([0 40]);
axis square;

subplot(1,3,2);
hold on;
plot(x_e_e, 'LineWidth', 3);
plot(0.012*ma_m(1:40,2), 'r', 'LineWidth', 3);
hold off;
title('Outputgap');
legend('Dynare Code', 'Code of Reis', 'Location', 'NorthEast');
xlim([0 40]);
axis square;

subplot(1,3,3);
ylim([0 0.015]);
hold on;
plot(l_e_e, 'LineWidth', 3);
plot(0.012*ma_m(1:40,5), 'r', 'LineWidth', 3);
hold off;
title('Hours workes');
legend('Dynare Code', 'Code of Reis', 'Location', 'NorthEast');
ylim([0 0.025]);
axis square;
xlim([0 40]);


