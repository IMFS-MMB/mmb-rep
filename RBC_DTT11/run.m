% Run and plot IRFs of replication file 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '\RBC_DTT11_rep']);

% Run replication dynare file
dynare RBC_DTT11_rep

%For technology shock
yirftech = [0; y_t_epsA]; % output
niirftech =  [0; ni_t_epsA]; % hours
rirftech =  [0; r_t_epsA]; % nominal interest rate
piirftech = [0; pi_t_epsA]; % inflation 

%For financial shock
yirffin = [0; y_t_epsgam]; % output
niirffin =  [0; ni_t_epsgam]; % hours
rirffin =  [0; r_t_epsgam]; % nominal interest rate
piirffin = [0; pi_t_epsgam]; % inflation 

% Go back to original path
cd('..');


% Plot replicated IRFs
t = 0:1:length(yirffin)-1;
t2 = 1:1:length(yirffin);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Technology Shock (unit shock)');
subplot(2,2,1);
plot(t2,yirftech,'LineWidth',2);
axis([1 12 -0.5 1]);
%xlabel('quarters','FontSize',8);
title('OUTPUT','FontSize',10);

subplot(2,2,2);
plot(t2,niirftech,'LineWidth',2);
axis([1 12 -0.5 0.75]);
%xlabel('quarters','FontSize',8);
title('MARK-UP','FontSize',10);

subplot(2,2,3);
plot(t2,rirftech,'LineWidth',2);
axis([1 12 -0.5 0.5]);
%xlabel('quarters','FontSize',8);
title('NOMINAL INTEREST RATE','FontSize',10);

subplot(2,2,4);
plot(t2,piirftech,'LineWidth',2);
axis([1 12 -0.5 0.5]);
%xlabel('quarters','FontSize',8);
title('INFLATION','FontSize',10);

figure2 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Financial Shock (unit shock)');
subplot(2,2,1);
plot(t2,yirffin,'LineWidth',2);
axis([1 10 -0.002 0.002]);
%xlabel('quarters','FontSize',8);
title('OUTPUT','FontSize',10);

subplot(2,2,2);
plot(t2,niirffin,'LineWidth',2);
axis([1 10 -0.001 0.002]);
%xlabel('quarters','FontSize',8);
title('MARK-UP','FontSize',10);

subplot(2,2,3);
plot(t2,rirffin,'LineWidth',2);
axis([1 10 -0.002 0.002]);
%xlabel('quarters','FontSize',8);
title('NOMINAL INTEREST RATE','FontSize',10);

subplot(2,2,4);
plot(t2,piirffin,'LineWidth',2);
axis([1 10 -0.002 0.0005]);
%xlabel('quarters','FontSize',8);
title('INFLATION','FontSize',10);
