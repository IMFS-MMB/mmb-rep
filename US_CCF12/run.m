% Run and plot IRF of replication file and compare plotted results to
% original IRF (stored)

% US_CCF12 model

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_CCF12_rep']);

% Run replication dynare file
dynare chen_replication

%conventional monetary policy shock
dy_irf          = dy_eps_m;  %annualized percentage rate
y_irf           = y_eps_m;               %percentage deviation from trend, not annualized
infl_irf        = infl_eps_m;            %annualized percentage rate
FFR_irf         = FFR_eps_m;              %annualized percentage rate
bondrate_irf    = bondrate_eps_m;             %annualized percentage rate
risk_prem_irf   = riskprem_eps_m;                %annualized percentage rate


% Go back to original path
cd('..');


% Plot replicated IRF
t = 1:1:length(dy_irf);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy shock (one standard deviation)');
subplot(3,3,1);
plot(t,dy_irf,'LineWidth',2);
hold  on
plot(t,zeroline,'LineWidth',2);
axis([0 24 -0.4 0.1]);
xlabel('quarters','FontSize',8); 
title('Output Growth','FontSize',10);

subplot(3,3,2);
plot(t,y_irf,'LineWidth',2);
hold  on
plot(t,zeroline,'LineWidth',2);
axis([0 24 -0.3 0.1]);
xlabel('quarters','FontSize',8);
title('Output Level','FontSize',10);

subplot(3,3,3);
plot(t,infl_irf,'LineWidth',2);
hold  on
plot(t,zeroline,'LineWidth',2);
axis([0 24 -0.05 0.02]);
xlabel('quarters','FontSize',8);
title('Inflation','FontSize',10);

subplot(3,3,4);
plot(t,FFR_irf,'LineWidth',2);
hold  on
plot(t,zeroline,'LineWidth',2);
axis([0 24 -0.05 0.3]);
xlabel('quarters','FontSize',8);
title('FFR','FontSize',10);

subplot(3,3,5);
plot(t,bondrate_irf,'LineWidth',2);
hold  on
plot(t,zeroline,'LineWidth',2);
axis([0 24 -0.02 0.02]);
xlabel('quarters','FontSize',8);
title('long-term rate','FontSize',10);

subplot(3,3,6);
plot(t,risk_prem_irf,'LineWidth',2);
hold  on
plot(t,zeroline,'LineWidth',2);
axis([0 24 -0.1 0.1]);
xlabel('quarters','FontSize',8);
title('risk premium','FontSize',10);

