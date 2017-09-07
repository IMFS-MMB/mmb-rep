% Replication file for BRA_SAMBA08 


clear all; close all;
clc;


% Adjust path to folder where replication file is stored
cd([cd '/BRA_SAMBA08_rep']);

% Run replication dynare file
dynare BRA_SAMBA08_rep;


figure(1)
subplot(3,3,1)
subplot(3,3,1), plot(0:20,r_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([0 0.1])
title('Interest Rate');
subplot(3,3,2), plot(0:20,pi_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([0 0.02])
title('Inflation');
subplot(3,3,3), plot(0:20,q_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.2 0.2])
title('Real Exchange Rate');
subplot(3,3,4), plot(0:20,yva_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.1 0.3])
title('GDP');
subplot(3,3,5), plot(0:20,c_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.5 1])
title('Consumption');
subplot(3,3,6), plot(0:20,i_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.6 0.2])
title('Investment');
subplot(3,3,7), plot(0:20,nxy_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.2 0.2])
title('Net Exports');
subplot(3,3,8), plot(0:20,x_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.2 0.2])
title('Exports');
subplot(3,3,9), plot(0:20,m_c_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.5 1.5]);
title('Imports');



figure(2)
subplot(3,3,1)
subplot(3,3,1), plot(0:20,r_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.5 1])
title('Interest Rate');
subplot(3,3,2), plot(0:20,pi_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.03 0])
title('Inflation');
subplot(3,3,3), plot(0:20,q_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-1.5 0])
title('Real Exchange Rate');
subplot(3,3,4), plot(0:20,yva_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-1.5 0.5])
title('GDP');
subplot(3,3,5), plot(0:20,c_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-1.5 0.5])
title('Consumption');
subplot(3,3,6), plot(0:20,i_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.4 0.4])
title('Investment');
subplot(3,3,7), plot(0:20,nxy_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.1 0.3])
title('Net Exports');
subplot(3,3,8), plot(0:20,x_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-1.5 0])
title('Exports');
subplot(3,3,9), plot(0:20,m_r_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-3 1]);
title('Imports');





figure(3)
subplot(3,3,1)
subplot(3,3,1), plot(0:20,r_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.01 0.03])
title('Interest Rate');
subplot(3,3,2), plot(0:20,pi_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-1.5*10^(-3) 0])
title('Inflation');
subplot(3,3,3), plot(0:20,q_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.2 0])
title('Real Exchange Rate');
subplot(3,3,4), plot(0:20,yva_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.05 0.15])
title('GDP');
subplot(3,3,5), plot(0:20,c_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.02 0.04])
title('Consumption');
subplot(3,3,6), plot(0:20,i_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.02 0.04])
title('Investment');
subplot(3,3,7), plot(0:20,nxy_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.05 0.15])
title('Net Exports');
subplot(3,3,8), plot(0:20,x_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([-0.5 1])
title('Exports');
subplot(3,3,9), plot(0:20,m_mstar_,'-k'); hold on 
plot(0:20,zeros(1,21),'--k');
ylim([0 0.8]);
title('Imports');

