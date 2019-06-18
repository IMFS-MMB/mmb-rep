% Run and plot IRF of replication file and compare plotted results to
% original IRF (stored)

% US_KS15 model

clear all;
close all
clc;

% Adjust path to folder where replication file is stored
cd('US_KS15_replication')

C = zeros (20,2);
Y = zeros (20,2);
M = zeros (20,2);
Pi= zeros (20,2);
RR= zeros (20,2);
R = zeros (20,2);

% Run replication dynare file
dynare US_KS15_R3
load US_KS15_R3_results.mat;

C(:,1) = c_eps_g;
Y(:,1) = y_eps_g;
M(:,1) = m_eps_g;
Pi(:,1)= pit_eps_g;
RR(:,1)= RR_eps_g;
R(:,1) = R_eps_g;

dynare US_KS15_R4
load US_KS15_R4_results.mat;

C(:,2) = c_eps_g;
Y(:,2) = y_eps_g;
M(:,2) = m_eps_g;
Pi(:,2)= pit_eps_g;
RR(:,2)= RR_eps_g;
R(:,2) = R_eps_g;

cd('..')
% Plot replicated IRF
t = 1:1:length(R_eps_g);

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy shock (one standard deviation)');
subplot(2,3,1);
hold all
plot(t,C(:,1),'LineWidth',2);
plot(t,C(:,2),'R--','LineWidth',2);
title('Consumption','FontSize',10);
subplot(2,3,2);
hold all
plot(t,Y(:,1),'LineWidth',2);
plot(t,Y(:,2),'R--','LineWidth',2);
title('Output','FontSize',10);
subplot(2,3,3);
hold all
plot(t,M(:,1),'LineWidth',2);
plot(t,M(:,2),'R--','LineWidth',2);
title('Real Money','FontSize',10);
subplot(2,3,4);
hold all
plot(t,Pi(:,1),'LineWidth',2);
plot(t,Pi(:,2),'R--','LineWidth',2);
title('Inflation','FontSize',10);
subplot(2,3,5);
hold all
plot(t,RR(:,1),'LineWidth',2);
plot(t,RR(:,2),'R--','LineWidth',2);
title('Real Interest','FontSize',10);
subplot(2,3,6);
hold all
plot(t,R(:,1),'LineWidth',2);
plot(t,R(:,2),'R--','LineWidth',2);
title('Nominal Interest','FontSize',10);
legend('R3','R4')
saveas(gcf,'IRFgovernmentspending.pdf');
