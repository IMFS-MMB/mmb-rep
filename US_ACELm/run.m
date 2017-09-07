% Run and plot IRF of replication file 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_ACELm_rep']);

% Run replication dynare file
dynare US_ACEL1m_rep


infirf = inflationq_epsilon_M_; % quarterly inflation
intirf = interest_epsilon_M_;  % interest rate 
mirf = mgrowth_epsilon_M_; % money growth
yirf = ytilde_t_epsilon_M_; % output
wtilde_tpred = wtilde_tpred_epsilon_M_;
h_t = h_t_epsilon_M_;
c_tpred = c_tpred_epsilon_M_;
i_t = i_t_epsilon_M_;



% Go back to original path
cd('..');


% Plot replicated IRF
t = 0:1:length(infirf)-1;
%zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy shock (one standard deviation)');
subplot(4,2,1);
plot(t,yirf,'Marker','o','LineWidth',2);
axis([0 19 -0.4 0.4]);
xlabel('quarters','FontSize',8);
title('Output','FontSize',10);

subplot(4,2,2);
plot(t,infirf,'Marker','o','LineWidth',2);
axis([0 19 -0.2 0.3]);
xlabel('quarters','FontSize',8);
%legend1 = legend('replication','original');
%set(legend1,'Position',[0.6435 0.2317 0.2089 0.1]);
title('Inflation','FontSize',10);

subplot(4,2,3);
plot(t,intirf,'Marker','o','LineWidth',2);
axis([0 19 -0.65 0.3]);
xlabel('quarters','FontSize',8);
title('Federal Funds Rate','FontSize',10);

subplot(4,2,4);
plot(t,h_t,'Marker','o','LineWidth',2);
axis([0 19 -0.3 0.5]);
xlabel('quarters','FontSize',8);
title('Average Hours','FontSize',10);

subplot(4,2,5);
plot(t,wtilde_tpred,'Marker','o','LineWidth',2);
axis([0 19 -0.2 0.1]);
xlabel('quarters','FontSize',8);
title('Real Wage','FontSize',10);

subplot(4,2,6);
plot(t,c_tpred,'Marker','o','LineWidth',2);
axis([0 19 -0.3 0.25]);
xlabel('quarters','FontSize',8);
title('Consumption','FontSize',10);

subplot(4,2,7);
plot(t,i_t,'Marker','o','LineWidth',2);
axis([0 19 -1.2 1.5]);
xlabel('quarters','FontSize',8);
title('Investment','FontSize',10);

subplot(4,2,8);
plot(t,mirf,'Marker','o','LineWidth',2);
axis([0 19 -2 2]);
xlabel('quarters','FontSize',8);
title('Annualized Money Growth','FontSize',10);




