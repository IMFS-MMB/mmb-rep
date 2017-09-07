%**************************************************************************
% Model replication coded by: Rasa Pusinskaite, e_mail: pusinskaite@wiwi.uni-frankfurt.de
%**************************************************************************


% Adjust path to folder where replication file is stored
clear all;
clc;
cd([cd '/NK_BGG99_rep']);


load BGG1_FA_results.mat
IR_Y = oo_.irfs.yH_e_rn(1,1:12)*100;
IR_I = oo_.irfs.iH_e_rn(1,1:12)*100;
IR_r_n = oo_.irfs.r_nH_e_rn(1,1:12) * 4*100;
IR_premium = oo_.irfs.premiumH_e_rn(1,1:12) * 4*100;

NN=size(IR_Y,2);
load BGG1_NA_results.mat
IRN_Y = oo_.irfs.yH_e_rn(1,1:12)*100;
IRN_I = oo_.irfs.iH_e_rn(1,1:12)*100;
IRN_r_n = oo_.irfs.r_nH_e_rn(1,1:12) * 4*100;
IRN_premium = oo_.irfs.premiumH_e_rn(1,1:12) * 4 *100;

X=1:NN;

%****************************FIGURE1: monetary shock (the inflation is lagged)***********************
figure(1);
AA=get(gca,'ColorOrder');

subplot(2,2,1)
plot(X', IR_Y', '-', X', IRN_Y','--');
set(findobj(gca,'Type','line','Color', AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
%grid minor;
axis([0 13 0 1.45]);
title('Output (Y), %','FontSize',10);
legend('fin. acc.','no fin. acc.');

subplot(2,2,2)
plot(X', IR_I', '-', X', IRN_I','--');
set(findobj(gca,'Type','line','Color', AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
axis([0 13 0 5]);
title('Investment (I), %','FontSize',10);

subplot(2,2,3)
plot(X', IR_r_n', '-', X', IRN_r_n','--');
set(findobj(gca,'Type','line','Color', AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
axis([0 13 -0.3 0.05]);
title('Nominal interest rate, %','FontSize',10);

subplot(2,2,4)
plot(X', IR_premium', '-', X', IRN_premium','--');
set(findobj(gca,'Type','line','Color', AA(1,:)), 'Color',AA(1,:), 'LineWidth',2);
set(findobj(gca,'Type','line','Color',AA(2,:)), 'Color',AA(2,:), 'LineWidth',2);
axis([0 13 -0.3 0.05]);
title('External finance premium, %','FontSize',10);

saveas(gcf,'NK_BGG99_irf.pdf')

