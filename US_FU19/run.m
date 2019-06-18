% Run and plot IRF of replication file and compare plotted results to
% original IRF (stored)

% US_SW07 model

clear all;
clc;

% Adjust path to folder where replication file is stored
cd('US_FU19_replication')

% Run replication dynare file
dynare US_FU19_rep
load US_FU19_rep_results.mat;

cd('..')
% Plot replicated IRF
t = 1:1:length(pinfobs_ems);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy shock (one standard deviation)');
subplot(3,3,1);
plot(t,pinfobs_ems,'LineWidth',2);
%axis([1 20 -0.4 0.05]);
%xlabel('quarters','FontSize',8);
title('pinfobs','FontSize',10);

subplot(3,3,2);
plot(t,dy_ems,'LineWidth',2);
%axis([1 20 -0.3 0.05]);
%xlabel('quarters','FontSize',8);
title('dy','FontSize',10);

subplot(3,3,3);
plot(t,robs_ems,'LineWidth',2);
%axis([1 20 -0.07 0.01]);
%xlabel('quarters','FontSize',8);
title('robs','FontSize',10);

subplot(3,3,4);
plot(t,dc_ems,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dc','FontSize',10);

subplot(3,3,5);
plot(t,dinve_ems,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dinve','FontSize',10);

subplot(3,3,6);
plot(t,labobs_ems,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('labobs','FontSize',10);

subplot(3,3,7);
plot(t,dw_ems,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dw','FontSize',10);
saveas(gcf,'IRFmonetary.pdf');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure2 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a TFP shock (one standard deviation)');
subplot(3,3,1);
plot(t,pinfobs_eZ,'LineWidth',2);
%axis([1 20 -0.4 0.05]);
%xlabel('quarters','FontSize',8);
title('pinfobs','FontSize',10);

subplot(3,3,2);
plot(t,dy_eZ,'LineWidth',2);
%axis([1 20 -0.3 0.05]);
%xlabel('quarters','FontSize',8);
title('dy','FontSize',10);

subplot(3,3,3);
plot(t,robs_eZ,'LineWidth',2);
%axis([1 20 -0.07 0.01]);
%xlabel('quarters','FontSize',8);
title('robs','FontSize',10);

subplot(3,3,4);
plot(t,dc_eZ,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dc','FontSize',10);

subplot(3,3,5);
plot(t,dinve_eZ,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dinve','FontSize',10);

subplot(3,3,6);
plot(t,labobs_eZ,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('labobs','FontSize',10);

subplot(3,3,7);
plot(t,dw_eZ,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dw','FontSize',10);
saveas(gcf,'IRFtechnology.pdf');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure3 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a risk premium shock (one standard deviation)');
subplot(3,3,1);
plot(t,pinfobs_eb2,'LineWidth',2);
%axis([1 20 -0.4 0.05]);
%xlabel('quarters','FontSize',8);
title('pinfobs','FontSize',10);

subplot(3,3,2);
plot(t,dy_eb2,'LineWidth',2);
%axis([1 20 -0.3 0.05]);
%xlabel('quarters','FontSize',8);
title('dy','FontSize',10);

subplot(3,3,3);
plot(t,robs_eb2,'LineWidth',2);
%axis([1 20 -0.07 0.01]);
%xlabel('quarters','FontSize',8);
title('robs','FontSize',10);

subplot(3,3,4);
plot(t,dc_eb2,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dc','FontSize',10);

subplot(3,3,5);
plot(t,dinve_eb2,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dinve','FontSize',10);

subplot(3,3,6);
plot(t,labobs_eb2,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('labobs','FontSize',10);

subplot(3,3,7);
plot(t,dw_eb2,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dw','FontSize',10);
saveas(gcf,'IRFriskpremium.pdf');

clear all;
close all;
clc;

% Adjust path to folder where replication file is stored
cd('US_FU19_replication')

% Run replication dynare file
dynare US_FU19_1984_2015
load US_FU19_1984_2015_results.mat;

cd('..')
% Plot replicated IRF
t = 1:1:length(pinfobs_ems);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy shock (one standard deviation)');
subplot(3,3,1);
plot(t,pinfobs_ems,'LineWidth',2);
%axis([1 20 -0.4 0.05]);
%xlabel('quarters','FontSize',8);
title('pinfobs','FontSize',10);

subplot(3,3,2);
plot(t,dy_ems,'LineWidth',2);
%axis([1 20 -0.3 0.05]);
%xlabel('quarters','FontSize',8);
title('dy','FontSize',10);

subplot(3,3,3);
plot(t,robs_ems,'LineWidth',2);
%axis([1 20 -0.07 0.01]);
%xlabel('quarters','FontSize',8);
title('robs','FontSize',10);

subplot(3,3,4);
plot(t,dc_ems,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dc','FontSize',10);

subplot(3,3,5);
plot(t,dinve_ems,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dinve','FontSize',10);

subplot(3,3,6);
plot(t,labobs_ems,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('labobs','FontSize',10);

subplot(3,3,7);
plot(t,dw_ems,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dw','FontSize',10);
saveas(gcf,'IRFmonetary1984_2015.pdf');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure2 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a TFP shock (one standard deviation)');
subplot(3,3,1);
plot(t,pinfobs_eZ,'LineWidth',2);
%axis([1 20 -0.4 0.05]);
%xlabel('quarters','FontSize',8);
title('pinfobs','FontSize',10);

subplot(3,3,2);
plot(t,dy_eZ,'LineWidth',2);
%axis([1 20 -0.3 0.05]);
%xlabel('quarters','FontSize',8);
title('dy','FontSize',10);

subplot(3,3,3);
plot(t,robs_eZ,'LineWidth',2);
%axis([1 20 -0.07 0.01]);
%xlabel('quarters','FontSize',8);
title('robs','FontSize',10);

subplot(3,3,4);
plot(t,dc_eZ,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dc','FontSize',10);

subplot(3,3,5);
plot(t,dinve_eZ,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dinve','FontSize',10);

subplot(3,3,6);
plot(t,labobs_eZ,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('labobs','FontSize',10);

subplot(3,3,7);
plot(t,dw_eZ,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dw','FontSize',10);
saveas(gcf,'IRFtechnology1984_2015.pdf');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure3 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a risk premium shock (one standard deviation)');
subplot(3,3,1);
plot(t,pinfobs_eb2,'LineWidth',2);
%axis([1 20 -0.4 0.05]);
%xlabel('quarters','FontSize',8);
title('pinfobs','FontSize',10);

subplot(3,3,2);
plot(t,dy_eb2,'LineWidth',2);
%axis([1 20 -0.3 0.05]);
%xlabel('quarters','FontSize',8);
title('dy','FontSize',10);

subplot(3,3,3);
plot(t,robs_eb2,'LineWidth',2);
%axis([1 20 -0.07 0.01]);
%xlabel('quarters','FontSize',8);
title('robs','FontSize',10);

subplot(3,3,4);
plot(t,dc_eb2,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dc','FontSize',10);

subplot(3,3,5);
plot(t,dinve_eb2,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dinve','FontSize',10);

subplot(3,3,6);
plot(t,labobs_eb2,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('labobs','FontSize',10);

subplot(3,3,7);
plot(t,dw_eb2,'LineWidth',2);
%axis([1 20 -0.05 0.25]);
%xlabel('quarters','FontSize',8);
title('dw','FontSize',10);
saveas(gcf,'IRFriskpremium1984_2015.pdf');
