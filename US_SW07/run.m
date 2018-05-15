% Run and plot IRF of replication file and compare plotted results to
% original IRF (stored)

% US_SW07 model

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_SW07_rep']);

% Run replication dynare file
dynare US_SW07_rep

% Display replication results
% disp('Replication Results:')
% disp(' ');
% disp('Inflation')
% disp(inflation_interest_)
% disp(' ');
% disp('Output')
% disp(output_interest_)
% disp(' ');
% disp('Interest rate')
% disp(interest_interest_)

infirf = pinf_em; % quarterly inflation (not annualized)
intirf = r_em;  % interest rate (not annualized
Eirf = lab_em; % hours worked
yirf = y_em; % output


% Go back to original path
cd('..');


% Plot original IRF and replicated IRF
t = 1:1:length(infirf);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy shock (one standard deviation)');
subplot(2,2,1);
plot(t,yirf,t,zeroline,'LineWidth',2);
axis([1 20 -0.4 0.05]);
xlabel('quarters','FontSize',8);
title('Output','FontSize',10);

subplot(2,2,2);
plot(t,Eirf,t,zeroline,'LineWidth',2);
axis([1 20 -0.3 0.05]);
xlabel('quarters','FontSize',8);
title('Hours','FontSize',10);

subplot(2,2,3);
plot(t,infirf,t,zeroline,'LineWidth',2);
axis([1 20 -0.07 0.01]);
xlabel('quarters','FontSize',8);
title('Quarterly inflation','FontSize',10);

subplot(2,2,4);
plot(t,intirf,t,zeroline,'LineWidth',2);
axis([1 20 -0.05 0.25]);
xlabel('quarters','FontSize',8);
title('Interest Rate','FontSize',10);


