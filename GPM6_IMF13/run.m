% Model: GPM6_IMF13
% GPM6 - The Global Projection Model with 6 Regions
% Further references:
% Ioan Carabenciov et. al (2013), IMF Working Paper (WP/13/87)
% The original matlab file to replicate figures is provided by the authors of Ioan Carabenciov et. al (2013)
% and modified by Jinhyuk Yoo in order to plot IRF of figure 1 in the papaer in question.


clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/GPM6_IMF13_rep']);

%run replication dynare file
dynare GPM6_IMF13_rep; 
 
t=1:1:40;
 


h=figure; 
set(h,'Position',[50 50 800 900]);
subplot(4,2,1);
plot(t,Y_US_RES_Y_US,'k','LineWidth',1.5);  
title('Output Gap US');
grid on

subplot(4,2,2);
plot(t,PIE_US_RES_Y_US,'k','LineWidth',1.5);  
title('Inflation US');
grid on

subplot(4,2,3);
plot(t,RS_US_RES_Y_US,'k','LineWidth',1.5);    
title('Nominal Interest Rate US');
grid on

subplot(4,2,4);
plot(t,RR_US_RES_Y_US,'k','LineWidth',1.5);   
title('Real Interest Rate US');
grid on

subplot(4,2,5);
plot(t,LRR_GAP_US_RES_Y_US,'k','LineWidth',1.5);   
title('Medium-term Interest Rate Gap US');
grid on

subplot(4,2,6);
plot(t,FACT_US_RES_Y_US,'k','LineWidth',1.5);   
title('Foreign Activity US');
grid on

subplot(4,2,7);
plot(t,REER_T_GAP_US_RES_Y_US,'k','LineWidth',1.5); 
title('Real Effective Exchange Rate US');
grid on

subplot(4,2,8);
plot(t,BLT_US_RES_Y_US,'k','LineWidth',1.5);   
title('Bank Lending Tightening US');
grid on

cd ..
tightfig;
saveas(gcf, 'Figure_1', 'pdf') %Save figure