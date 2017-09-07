% Run and plot IRFs of replication file 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_DG08_rep']);

% Run replication dynare file
dynare US_DG08_rep

%For interest rate shock
qirfmon =  Q_eta_R; % asset price
nirfmon =  N_eta_R;  % aggregate entrepreneurial net worth
premirfmon =  Prem_eta_R; % external finance premium
yirfmon =  Y_eta_R; % output

%For technology shock
qirftech =  Q_epsinno_A; % asset price
nirftech =  N_epsinno_A;  % aggregate entrepreneurial net worth
premirftech =  Prem_epsinno_A; % external finance premium
yirftech =  Y_epsinno_A; % output


% Go back to original path
cd('..');


% Plot replicated IRFs
t = 0:1:length(qirfmon)-1;
t2 = 1:1:length(qirfmon);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy Shock (one standard deviation)');
subplot(2,2,1);
plot(t2,qirfmon,t2,zeroline,'LineWidth',2);
axis([0 20 -0.2 0.8]);
%xlabel('quarters','FontSize',8);
title('Asset Price (Q)','FontSize',10);

subplot(2,2,2);
plot(t2,nirfmon,t2,zeroline,'LineWidth',2);
axis([0 20 0 1]);
%xlabel('quarters','FontSize',8);
title('Net Worth (N)','FontSize',10);

subplot(2,2,3);
plot(t2,premirfmon,t2,zeroline,'LineWidth',2);
axis([0 20 -0.04 0.01]);
%xlabel('quarters','FontSize',8);
title('PREMIUM','FontSize',10);

subplot(2,2,4);
plot(t2,yirfmon,t2,zeroline,'LineWidth',2);
axis([0 20 0 0.51]);
%xlabel('quarters','FontSize',8);
title('Output (Y)','FontSize',10);
%print -dpng irf.png

figure2 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Productivity Shock (one standard deviation)');
subplot(2,2,1);
plot(t2,qirftech,t2,zeroline,'LineWidth',2);
axis([0 20 -0.05 0.3]);
%xlabel('quarters','FontSize',8);
title('Asset Price (Q)','FontSize',10);

subplot(2,2,2);
plot(t2,nirftech,t2,zeroline,'LineWidth',2);
axis([0 20 0 0.35]);
%xlabel('quarters','FontSize',8);
title('Net Worth (N)','FontSize',10);

subplot(2,2,3);
plot(t2,premirftech,t2,zeroline,'LineWidth',2);
axis([0 20 -0.015 0.02]);
%xlabel('quarters','FontSize',8);
title('PREMIUM','FontSize',10);

subplot(2,2,4);
plot(t2,yirftech,t2,zeroline,'LineWidth',2);
axis([0 20 0 0.7]);
%xlabel('quarters','FontSize',8);
title('Output (Y)','FontSize',10);