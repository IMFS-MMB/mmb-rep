% Run and plot IRF of replication file and compare plotted results to
% original IRF (stored)

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/EA_CW05ta_rep']);

% Run replication dynare file
dynare EA_CW05ta_rep

% Display replication results
disp(' ');
disp('Replication Results: impulse responses')
disp(' ');
disp('Inflation')
disp(inflation_interest_)
disp(' ');
disp('Output gap')
disp(outputgap_interest_)
disp(' ');
disp('Interest rate')
disp(interest_interest_)

inflation_interest_ = [0; inflation_interest_];
outputgap_interest_ = [0; outputgap_interest_];

% Go back to original path
cd('..');

% Load original IRF
irpinf = (xlsread('\EA_CW05ta_rep_results',1,'A7:A47'));
irq = (xlsread('\EA_CW05ta_rep_results',1,'C7:C47'));
irr = (xlsread('\EA_CW05ta_rep_results',1,'E7:E47'));

irpinf = [0; irpinf];
irq = [0; irq];

% Plot original IRF and replicated IRF
t = 0:1:length(inflation_interest_)-1;
t2 = 1:1:length(interest_interest_);
zeroline = ones(length(t),1)*0;

subplot(2,2,1);
plot(t,inflation_interest_,'b-',t,irpinf,'r-.',t,zeroline,'k-','LineWidth',2);
axis([0 40 -0.3 0.2]);
ylabel('annual inflation','FontSize',8);
xlabel('quarters','FontSize',8);
legend1 = legend('replication','original');
set(legend1,'Position',[0.6435 0.2317 0.2089 0.1]);
title('IRF to monetary shock','FontSize',10);

subplot(2,2,2);
plot(t,outputgap_interest_,'b-',t,irq,'r-.',t,zeroline,'k-','LineWidth',2);
axis([0 40 -0.8 0.2]);
ylabel('outputgap','FontSize',8);
xlabel('quarters','FontSize',8);
title('IRF to monetary shock','FontSize',10);

subplot(2,2,3);
plot(t2,interest_interest_,'b-',t2,irr,'r-.','LineWidth',2);
axis([0 40 -0.5 1.5]);
ylabel('annualized interest rate','FontSize',8);
xlabel('quarters','FontSize',8);
title('IRF to monetary shock','FontSize',10);

% Uncomment to compare annual inflation and annualized quarterly inflation
% in replication:
% plot(t,inflation_interest_,t,inflationq_interest_);
% legend('annual inflation','annualized quarterly inflation');

