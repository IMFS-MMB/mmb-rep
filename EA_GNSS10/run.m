% Plot IRFs to a positive technology shock


clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/EA_GNSS10_rep']);

%run replication dynare file
dynare EA_GNSS10_rep;

%load results
load EA_GNSS10_rep_results.mat;

t=1:1:20;


figure;
subplot(4,3,1);
plot(t,interestPol_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 -1.2 0.2]);
title('Policy rate');
grid on;
subplot(4,3,2);
plot(t,interestH_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 -1.2 0.2]);
title('Interest rate: households');
grid on;
subplot(4,3,3);
plot(t,interestF_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 -1.2 0.2]);
title('Interest rate: firms');
grid on;
subplot(4,3,4);
plot(t,inflation_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 -0.26 0.05]);
title('Inflation');
grid on;
subplot(4,3,5);
plot(t,loansH_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 0 3]);
title('Loans to households');
grid on;
subplot(4,3,6);
plot(t,loansF_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 0 0.8]);
title('Loans to firms');
grid on;
subplot(4,3,7);
plot(t,output_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 0 0.5]);
title('Output');
grid on;
subplot(4,3,8);
plot(t,consumption_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 0 0.5]);
title('Consumption');
grid on;
subplot(4,3,9);
plot(t,investment_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 0 1.2]);
title('Investment');
grid on;
subplot(4,3,10);
plot(t,deposits_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 0 1.6]);
title('Deposits');
grid on;
subplot(4,3,11);
plot(t,interestDep_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 -0.62 0.02]);
title('Deposit rate');
grid on;
subplot(4,3,12);
plot(t,bankcapital_e_A_e,'Marker','o','MarkerSize',2);
axis([0 20 -5 0.25]);
title('Bank capital');
grid on;
