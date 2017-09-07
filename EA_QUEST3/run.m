% Run and plot IRF of replication file 

% EA_QUEST3 model

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/EA_QUEST3_rep']);

% Run replication dynare file
dynare EA_Quest3_rep


infirf = E_PHIC_E_EPS_M;
intirf = E_INOM_E_EPS_M;  
ygapirf =  E_LYGAP_E_EPS_M; 
infairf = E_PHI_E_EPS_M;
yirf =  cumsum(E_GY_E_EPS_M); 
cirf =  cumsum(E_GC_E_EPS_M); 
iirf =  cumsum(E_GI_E_EPS_M); 
cricirf =  cumsum(E_GCNLC_E_EPS_M); 
cliqcirf =  cumsum(E_GCLC_E_EPS_M); 

tbynirf =  E_TBYN_E_EPS_M;

ggirf =  cumsum(E_GG_E_EPS_M); 
gigirf =  cumsum(E_GIG_E_EPS_M); 

gtrirf =  cumsum(E_GTR_E_EPS_M); 
glirf =  cumsum(E_GL_E_EPS_M); 
rwirf =  cumsum(E_GWRY_E_EPS_M+E_GY_E_EPS_M); 
dbgynirf =  E_DBGYN_E_EPS_M; 
phiirf =  E_PHI_E_EPS_M; 
inomirf =  E_INOM_E_EPS_M; 
rirf =  E_R_E_EPS_M; 
geirf =  cumsum(E_GE_E_EPS_M); 





% Go back to original path
cd('..');


% Plot replicated IRF
t = 1:1:length(infirf);
zeroline = ones(length(t),1)*0;
figure
subplot(2,3,1);
plot(t,ygapirf,'LineWidth',2);
axis([0 42 -3*10^(-3) 1*10^(-3)]);
xlabel('quarters','FontSize',8);
title('Output gap: log(YGAP_{t})','FontSize',10);

subplot(2,3,2);
plot(t,infairf,'LineWidth',2);
axis([0 42 -8*10^(-4) 0]);
xlabel('quarters','FontSize',8);
title('Annual inflation: \pi_{t}','FontSize',10);

subplot(2,3,3);
plot(t,intirf,'LineWidth',2);
axis([0 42 -5*10^(-4) 15*10^(-4)]);
xlabel('quarters','FontSize',8);
title('Interest Rate: inom_{t}','FontSize',10);

subplot(2,3,4);
plot(t,infirf,'LineWidth',2);
axis([0 42 -1*10^(-3) 0]);
xlabel('quarters','FontSize',8);
%legend1 = legend('replication','original');
%set(legend1,'Position',[0.6435 0.2317 0.2089 0.1]);
title('Quarterly inflation: \pi_{t}^{c}','FontSize',10);


subplot(2,3,5);
plot(t,yirf,'LineWidth',2);
axis([0 42 -3*10^(-3) 1*10^(-3)]);
xlabel('quarters','FontSize',8);
title('Output: Y)','FontSize',10);


subplot(2,3,6);
plot(t,cirf,'LineWidth',2);
axis([0 42 -3*10^(-3) 1*10^(-3)]);
xlabel('quarters','FontSize',8);
title('Consumption)','FontSize',10);



figure
subplot(2,3,1);
plot(t,iirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Investment','FontSize',10);

subplot(2,3,2);
plot(t,cricirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Consumption Ricardian HH','FontSize',10);

subplot(2,3,3);
plot(t,cliqcirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Consumption Liq Con HH','FontSize',10);

subplot(2,3,4);
plot(t,tbynirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Nominal Trade Balance','FontSize',10);

subplot(2,3,5);
plot(t,ggirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Gov cons','FontSize',10);

subplot(2,3,6);
plot(t,gigirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Gov inv','FontSize',10);



figure
subplot(2,3,1);
plot(t,gtrirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Transfers','FontSize',10);

subplot(2,3,2);
plot(t,glirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Hours worked','FontSize',10);

subplot(2,3,3);
plot(t,rwirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Real Wage','FontSize',10);

subplot(2,3,4);
plot(t,dbgynirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Deficit','FontSize',10);

subplot(2,3,5);
plot(t,phiirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Inflation','FontSize',10);

subplot(2,3,6);
plot(t,infirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Consumer Price Inflation','FontSize',10);





figure
subplot(2,3,1);
plot(t,inomirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Nom interest rate','FontSize',10);

subplot(2,3,2);
plot(t,rirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('R','FontSize',10);

subplot(2,3,3);
plot(t,geirf,'LineWidth',2);
xlabel('quarters','FontSize',8);
title('Exchange rate','FontSize',10);

