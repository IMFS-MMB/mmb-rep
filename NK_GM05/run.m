% Run NK_GM05 replication file
% Presents standard deviations of key variables under 4 different monetary
% policy regimes comparable to table 1 in Galí and Monacelli (2005)

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/NK_GM05_rep']);

% Run replication dynare files

dynare NK_GM05_DIT_SD;

y_DIT = sqrt(oo_.var(1,1))*100;
pih_DIT = sqrt(oo_.var(2,2))*100;
pi_DIT = sqrt(oo_.var(3,3))*100;
ir_DIT = sqrt(oo_.var(4,4))*100;
tot_DIT = sqrt(oo_.var(5,5))*100;
save NK_GM05_rep_results.mat y_DIT pih_DIT pi_DIT ir_DIT tot_DIT;


dynare NK_GM05_DITR_SD;

y_DITR = sqrt(oo_.var(1,1))*100;
pih_DITR = sqrt(oo_.var(2,2))*100;
pi_DITR = sqrt(oo_.var(3,3))*100;
ir_DITR = sqrt(oo_.var(4,4))*100;
tot_DITR = sqrt(oo_.var(5,5))*100;
save NK_GM05_rep_results.mat y_DITR pih_DITR pi_DITR ir_DITR tot_DITR -append;


dynare NK_GM05_CITR_SD;

y_CITR = sqrt(oo_.var(1,1))*100;
pih_CITR = sqrt(oo_.var(2,2))*100;
pi_CITR = sqrt(oo_.var(3,3))*100;
ir_CITR = sqrt(oo_.var(4,4))*100;
tot_CITR = sqrt(oo_.var(5,5))*100;
save NK_GM05_rep_results.mat y_CITR pih_CITR pi_CITR ir_CITR tot_CITR -append;


dynare NK_GM05_PEG_SD;

y_PEG = sqrt(oo_.var(1,1))*100;
pih_PEG = sqrt(oo_.var(2,2))*100;
pi_PEG = sqrt(oo_.var(3,3))*100;
ir_PEG = sqrt(oo_.var(4,4))*100;
tot_PEG = sqrt(oo_.var(5,5))*100;
%save NK_GM05_rep_results.mat y_CITR pih_CITR pi_CITR ir_CITR tot_CITR -append;
load NK_GM05_rep_results.mat;

disp('Replication results:');
disp('Standard deviations of...');
disp('Output');
disp('Domestic inflation');
disp('CPI inflation');
disp('Nominal interest rate');
disp('Terms of trade');
disp('under 4 alternative monetary policy regimes:');
disp(' ');
disp('DIT');
disp(y_DIT);
disp(pih_DIT);
disp(pi_DIT);
disp(ir_DIT);
disp(tot_DIT);
disp(' ');
disp('DITR');
disp(y_DITR);
disp(pih_DITR);
disp(pi_DITR);
disp(ir_DITR);
disp(tot_DITR);
disp(' ');
disp('CITR');
disp(y_CITR);
disp(pih_CITR);
disp(pi_CITR);
disp(ir_CITR);
disp(tot_CITR);
disp(' ');
disp('PEG');
disp(y_PEG);
disp(pih_PEG);
disp(pi_PEG);
disp(ir_PEG);
disp(tot_PEG);
