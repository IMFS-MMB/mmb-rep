% Run and plot IRF of replication file and compare plotted results to
% original IRF (stored)

% G3_CW03 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/G3_CW03_rep']);

% Run replication dynare file
dynare G3_CW03_rep

% IRF to 0.5 percentage points of potential output demand shock

% Interest Rate
is_us_e_d_us = [0; 0; is_us_e_d_us];
is_eu_e_d_us = [0; 0; is_eu_e_d_us]; 
is_ja_e_d_us = [0; 0; is_ja_e_d_us];

is_us_e_d_eu = [0; 0; is_us_e_d_eu];
is_eu_e_d_eu = [0; 0; is_eu_e_d_eu];
is_ja_e_d_eu = [0; 0; is_ja_e_d_eu];

is_us_e_d_ja = [0; 0; is_us_e_d_ja];
is_eu_e_d_ja = [0; 0; is_eu_e_d_ja];
is_ja_e_d_ja = [0; 0; is_ja_e_d_ja];

% Output gap
q_us_e_d_us = [0; 0; q_us_e_d_us];
q_eu_e_d_us = [0; 0; q_eu_e_d_us]; 
q_ja_e_d_us = [0; 0; q_ja_e_d_us];

q_us_e_d_eu = [0; 0; q_us_e_d_eu];
q_eu_e_d_eu = [0; 0; q_eu_e_d_eu];
q_ja_e_d_eu = [0; 0; q_ja_e_d_eu];

q_us_e_d_ja = [0; 0; q_us_e_d_ja];
q_eu_e_d_ja = [0; 0; q_eu_e_d_ja];
q_ja_e_d_ja = [0; 0; q_ja_e_d_ja];

% Annual inflation 
pi4_us_e_d_us = [0; 0; pi4_us_e_d_us];
pi4_eu_e_d_us = [0; 0; pi4_eu_e_d_us]; 
pi4_ja_e_d_us = [0; 0; pi4_ja_e_d_us];

pi4_us_e_d_eu = [0; 0; pi4_us_e_d_eu];
pi4_eu_e_d_eu = [0; 0; pi4_eu_e_d_eu];
pi4_ja_e_d_eu = [0; 0; pi4_ja_e_d_eu];

pi4_us_e_d_ja = [0; 0; pi4_us_e_d_ja];
pi4_eu_e_d_ja = [0; 0; pi4_eu_e_d_ja];
pi4_ja_e_d_ja = [0; 0; pi4_ja_e_d_ja];







% Go back to original path
cd('..');

% Load original IRF
% irpinf = (xlsread('\AW_rep_results',1,'A6:A46'));
% irq = (xlsread('\AW_rep_results',1,'C6:C46'));
% irr = (xlsread('\AW_rep_results',1,'E6:E46'));
% 
% irpinf = [0; irpinf];
% irq = [0; irq];


% Plot original IRF and replicated IRF
t = 2:1:length(pi4_us_e_d_ja)+1;
zeroline = ones(length(t),1)*0;


subplot(3,3,1);
plot(t,q_us_e_d_us,'r-',t,q_eu_e_d_us,'g--',t,q_ja_e_d_us,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
ylabel('United States','FontSize',8);
xlabel('quarters','FontSize',8);
annotation('textbox',...
    'String',{'Solid line: US. Dashed line: Euro Area. Dot-dashed line: Japan'},...
    'FitHeightToText','off',...
    'LineStyle','none',...
    'Position',[0.1724 0.01576 0.7472 0.03503]);
title('Output gap','FontSize',10);

subplot(3,3,2);
plot(t,pi4_us_e_d_us,'r-',t,pi4_eu_e_d_us,'g--',t,pi4_ja_e_d_us,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
xlabel('quarters','FontSize',8);
title('Annual Inflation');

subplot(3,3,3);
plot(t,is_us_e_d_us,'r-',t,is_eu_e_d_us,'g--',t,is_ja_e_d_us,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
xlabel('quarters','FontSize',8);
title('Interest Rate');

subplot(3,3,4);
plot(t,q_us_e_d_eu,'r-',t,q_eu_e_d_eu,'g--',t,q_ja_e_d_eu,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
ylabel('Euro Area','FontSize',8);
xlabel('quarters','FontSize',8);

subplot(3,3,5);
plot(t,pi4_us_e_d_eu,'r-',t,pi4_eu_e_d_eu,'g--',t,pi4_ja_e_d_eu,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
xlabel('quarters','FontSize',8);

subplot(3,3,6);
plot(t,is_us_e_d_eu,'r-',t,is_eu_e_d_eu,'g--',t,is_ja_e_d_eu,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
xlabel('quarters','FontSize',8);

subplot(3,3,7);
plot(t,q_us_e_d_ja,'r-',t,q_eu_e_d_ja,'g--',t,q_ja_e_d_ja,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
ylabel('Japan','FontSize',8);
xlabel('quarters','FontSize',8);

subplot(3,3,8);
plot(t,pi4_us_e_d_ja,'r-',t,pi4_eu_e_d_ja,'g--',t,pi4_ja_e_d_ja,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
xlabel('quarters','FontSize',8);

subplot(3,3,9);
plot(t,is_us_e_d_ja,'r-',t,is_eu_e_d_ja,'g--',t,is_ja_e_d_ja,'k-.','LineWidth',2);
axis([0 30 -0.5 1]);
xlabel('quarters','FontSize',8);

% Uncomment to compare annual inflation and annualized quarterly inflation
% in replication:
% plot(t,inflation_interest_,t,inflationq_interest_);
% legend('annual inflation','annualized quarterly inflation');

