% Run and plot IRFs of replication file 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_FMS134_replication']);

% Run replication dynare file
dynare US_FMS134_replication

% Go back to original path
cd('..');

% Plot replicated IRFs
t = 0:1:length(oo_.irfs.y_zetar)-1;
t2 = 1:1:length(oo_.irfs.y_zetar);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy Shock');
subplot(2,2,1);
plot(t2,oo_.irfs.y_zetar,'LineWidth',2);
axis([1 20 -0.4 0]);
%xlabel('quarters','FontSize',8);
title('OUTPUT','FontSize',10);

subplot(2,2,2);
plot(t2,oo_.irfs.c_zetar,'LineWidth',2);
axis([1 20 -0.4 0]);
%xlabel('quarters','FontSize',8);
title('CONSUMPTION','FontSize',10);

subplot(2,2,3);
plot(t2,oo_.irfs.g_zetar,'LineWidth',2);
axis([1 20 -0.05 .15]);
%xlabel('quarters','FontSize',8);
title('GOVERNMENT SPENDING','FontSize',10);

subplot(2,2,4);
plot(t2,oo_.irfs.x_zetar,'LineWidth',2);
axis([1 20 -1.5 0]);
%xlabel('quarters','FontSize',8);
title('INVESTMENT','FontSize',10);



figure2 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Fiscal Policy Shock');
subplot(2,2,1);
plot(t2,oo_.irfs.y_zetag,'LineWidth',2);
axis([1 20 0 .4]);
%xlabel('quarters','FontSize',8);
title('OUTPUT','FontSize',10);

subplot(2,2,2);
plot(t2,oo_.irfs.c_zetag,'LineWidth',2);
axis([1 20 -.05 .15]);
%xlabel('quarters','FontSize',8);
title('CONSUMPTION','FontSize',10);

subplot(2,2,3);
plot(t2,oo_.irfs.g_zetag,'LineWidth',2);
axis([1 20 0 1.5]);
%xlabel('quarters','FontSize',8);
title('GOVERNMENT SPENDING','FontSize',10);

subplot(2,2,4);
plot(t2,oo_.irfs.x_zetag,'LineWidth',2);
axis([1 20 -0.2 0]);
%xlabel('quarters','FontSize',8);
title('INVESTMENT','FontSize',10);
