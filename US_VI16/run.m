clear all;      
close all;
clc;

%%%%%%%%%%%%%%
%run corrected mod-file 
%%%%%%%%%%%%%%
cd('US_VI16_replication')

dynare US_VI16_rep.mod;
load US_VI16_rep_results.mat;

nul=zeros(20,1);
t=1:20;

cd('..')
% monetary policy shock
figure1= figure('name','IRFs','numbertitle','off')
subplot(3,2,1)
plot(t,y_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('GDP')
subplot(3,2,2)
plot(t,i_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('Investment')
subplot(3,2,3)
plot(t,pi_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('Inflation')
subplot(3,2,4)
plot(t,n_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('Net Worth')
subplot(3,2,5)
plot(t,ext_pr_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('Spread')
saveas(gcf,'IRFmonetary.pdf');


clear all;
close all;
clc;

%%%%%%%%%%%%%%
%run original mod-file 
%%%%%%%%%%%%%%

cd('US_VI16_replication')
dynare US_VI16_rep_orig.mod;
load US_VI16_rep_orig_results.mat;

nul=zeros(20,1);
t=1:20;

cd('..')
% monetary policy shock
figure1= figure('name','IRFs','numbertitle','off')
subplot(3,2,1)
plot(t,y_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('GDP')
subplot(3,2,2)
plot(t,i_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('Investment')
subplot(3,2,3)
plot(t,pi_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('Inflation')
subplot(3,2,4)
plot(t,n_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('Net Worth')
subplot(3,2,5)
plot(t,ext_pr_e_r,'-k' ,'LineWidth',2); hold on 
plot(t,nul,'r');hold on
title('Spread')
saveas(gcf,'IRFmonetary_orig.pdf');


