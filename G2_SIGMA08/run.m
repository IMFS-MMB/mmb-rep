% Run and plot IRF of replication file 

% G2_SIGMA08 model

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/G2_SIGMA08_rep']);

% Run replication dynare file
dynare G2_SIGMA08_rep


realimpirf = realimp_errtaxktf; % real imports (home country)
realexpirf = realexp_errtaxktf;  % real exports
realerirf = realerpq_errtaxktf; % exchange rate
tb_gdp = 4*ntby_errtaxktf; % trade balance as a share of GDP

% Go back to original path
cd('..');


% Plot replicated IRF
t = 1:1:length(realexpirf);
%zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Foreign Investment Demand Shock');
subplot(2,2,1);
plot(t,realexpirf,'LineWidth',2);
axis([1 30 -0.5 4]);
xlabel('quarters','FontSize',8);
%legend1 = legend('replication','original');
%set(legend1,'Position',[0.6435 0.2317 0.2089 0.1]);
title('Real Exports','FontSize',10);

subplot(2,2,2);
plot(t,realimpirf,'LineWidth',2);
axis([1 30 -3.5 1]);
xlabel('quarters','FontSize',8);
title('Real Imports','FontSize',10);

subplot(2,2,3);
plot(t,realerirf,'LineWidth',2);
axis([1 30 -1 3]);
xlabel('quarters','FontSize',8);
title('Exchange Rate','FontSize',10);

subplot(2,2,4);
plot(t,tb_gdp,'LineWidth',2);
axis([1 30 -0.1 0.8]);
xlabel('quarters','FontSize',8);
title('Trade Balance (GDP share)','FontSize',10);


