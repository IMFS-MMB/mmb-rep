% Run and plot IRF of replication file and compare plotted results to
% original IRF (stored)

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_FRB03_rep']);

% Run replication dynare file
dynare US_FRB03_rep

% Display replication results
disp('Replication Results:')
disp(' ');
disp('Inflation')
disp(inflationq_interest_)
disp(' ');
disp('Output gap')
disp(outputgap_interest_)
disp(' ');
disp('Interest rate')
disp(interest_interest_)

% Go back to original path
cd('..');

% Load original IRF
irpinf = (xlsread('\US_FRB03_rep_results',1,'A7:A22'));
irq = (xlsread('\US_FRB03_rep_results',1,'C7:C22'));
irr = (xlsread('\US_FRB03_rep_results',1,'E7:E22'));


% Plot original IRF and replicated IRF
t = 1:1:length(interest_interest_);

subplot(2,2,1);
plot(t,inflationq_interest_,'b-',t,irpinf,'r-.','LineWidth',2);
axis([0 17 -0.085 0.01]);
ylabel('Annualized quaterly inflation','FontSize',8);
xlabel('quarters','FontSize',8);
legend1 = legend('replication','original');
set(legend1,'Position',[0.6435 0.2317 0.2089 0.1]);
title('IRF to monetary shock','FontSize',10);

subplot(2,2,2);
plot(t,outputgap_interest_,'b-',t,irq,'r-.','LineWidth',2);
axis([0 17 -0.4 0.1]);
ylabel('Output gap','FontSize',8);
xlabel('quarters','FontSize',8);
title('IRF to monetary shock','FontSize',10);

subplot(2,2,3);
plot(t,interest_interest_,'b-',t,irr,'r-.','LineWidth',2);
ylabel('Annualized interest rate','FontSize',8);
xlabel('quarters','FontSize',8);
title('IRF to monetary shock','FontSize',10);

% Uncomment to compare annual inflation and annualized quarterly inflation
% in replication:
% plot(t,inflation_interest_,t,inflationq_interest_);
% legend('annual inflation','annualized quarterly inflation');

