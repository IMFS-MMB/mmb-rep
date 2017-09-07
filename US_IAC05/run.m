% Run and plot IRF of replication file 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_IAC05_rep']);

% Run replication dynare file
dynare US_IAC05_rep

%For interest rate shock
rirfmon =  Rhat_eRhat; % nominal interest rate (quarterly)
piirfmon =  pihat_eRhat;  % quarterly inflation
qirfmon =  qhat_eRhat; % real house price
yirfmon =  Yhat_eRhat; % output


% Go back to original path
cd('..');


% Plot replicated IRFs
t = 0:1:length(qirfmon)-1;
t2 = 1:1:length(qirfmon);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy Shock (one standard deviation)');
subplot(2,2,1);
plot(t,rirfmon,t,zeroline,'LineWidth',2);
axis([0 20 -0.2 0.4]);
%xlabel('quarters','FontSize',8);
title('Nom. Int. Rate (R)','FontSize',10);

subplot(2,2,2);
plot(t,piirfmon,t,zeroline,'LineWidth',2);
axis([0 20 -0.2 0.4]);
%xlabel('quarters','FontSize',8);
title('Quarterly Inflation','FontSize',10);

subplot(2,2,3);
plot(t,qirfmon,t,zeroline,'LineWidth',2);
axis([0 20 -1.5 2]);
%xlabel('quarters','FontSize',8);
title('House Price (q)','FontSize',10);

subplot(2,2,4);
plot(t,yirfmon,t,zeroline,'LineWidth',2);
axis([0 20 -1.2 2]);
%xlabel('quarters','FontSize',8);
title('Output (Y)','FontSize',10);
%print -dpdf irf