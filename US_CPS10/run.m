% Run and plot IRFs of replication file 

clear all;
close all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_CPS10_rep']);

% Run replication dynare file for subsample 1960:Qq
dynare US_CPS10_rep1

%Save Data
inflgap_pits_6079=inflgap_pits;
realR_pits_6079=realR_pits;
save sample1 inflgap_pits_6079 realR_pits_6079
clear all;

% Run replication dynare file for counterfactual
dynare US_CPS10_rep2

inflgap_pits_counterfact=inflgap_pits;
realR_pits_counterfact=realR_pits;
save counterfact inflgap_pits_counterfact realR_pits_counterfact
clear all;



% Plot replicated IRFs
load sample1
load counterfact

x=0:1:16;
set(groot,'defaultLineLineWidth',2)

subplot(1,2,1), plot(x,inflgap_pits_6079,'black',x,inflgap_pits_counterfact,'--g');
title('Response of inflation gap to target shock');
axis([0,16,0.1,0.5])
subplot(1,2,2), plot(x,realR_pits_6079,'black',x,realR_pits_counterfact,'--g');
title('Response of real interest rate to target shock');
axis([0,16,-1.5,0.1])
legend('First subsample','Counterfactual')





