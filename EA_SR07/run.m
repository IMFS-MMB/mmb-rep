% Run and plot IRF of replication file 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/EA_SR07_rep']);

% Run replication dynare file
dynare EA_SR07_rep

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

inflation = 4*[0; 0; pi_hat_epsilon_R]; % annualized domestic inflation
rwage = [0; 0; w_barhat_epsilon_R]; % real wage
cons = [0; 0; c_hat_epsilon_R]; % consumption
inve = [0; 0; i_hat_epsilon_R]; %investment
rer = [0; 0; x_epsilon_R]; %real exchange rate
interest = 4*[0; 0; R_hat_epsilon_R]; %interest rate
employ = [0; 0; E_epsilon_R]; %employment
output = [0; 0; y_hat_epsilon_R]; % output

%outputmc = [0; 0; y_hat_epsilon_lambdad];


% Go back to original path
cd('..');


% Plot IRF
t = 0:1:(length(inflation)-1);
zeroline = ones(length(t),1)*0;

figure;
plot(t,outputmc);

figure;
subplot(3,3,1);
plot(t,inflation,'LineWidth',2);
axis([0 21 -0.15 0.05]);
xlabel('quarters','FontSize',8);
title('Domestic inflation','FontSize',10);

subplot(3,3,2);
plot(t,rwage,'LineWidth',2);
axis([0 21 -0.2 0]);
xlabel('quarters','FontSize',8);
title('Real wage','FontSize',10);

subplot(3,3,3);
plot(t,cons,'LineWidth',2);
axis([0 21 -0.4 0]);
xlabel('quarters','FontSize',8);
title('Consumption','FontSize',10);

subplot(3,3,4);
plot(t,inve,'LineWidth',2);
axis([0 21 -0.8 0]);
xlabel('quarters','FontSize',8);
title('Investment','FontSize',10);

subplot(3,3,5);
plot(t,rer,'LineWidth',2);
axis([0 21 -0.8 0]);
xlabel('quarters','FontSize',8);
title('Real exchange rate','FontSize',10);

subplot(3,3,6);
plot(t,interest,'LineWidth',2);
axis([0 21 -0.2 0.6]);
xlabel('quarters','FontSize',8);
title('Interest Rate','FontSize',10);

subplot(3,3,7);
plot(t,employ,'LineWidth',2);
axis([0 21 -0.4 0]);
xlabel('quarters','FontSize',8);
title('Employment','FontSize',10);

subplot(3,3,8);
plot(t,output,'LineWidth',2);
axis([0 21 -0.4 0]);
xlabel('quarters','FontSize',8);
title('Output','FontSize',10);






