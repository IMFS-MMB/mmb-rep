%% "Should MP Lean against the Wind? An Analysis based on a DSGE Model with Banking"
% L. Gambacorta and F.M. Signoretti (2014), Journal of Economic Dynamics & Control 43, pp. 146-174

%%
clear all;
clc;
close all;

% adjust path to folder where replication file is stored
cd([cd '/NK_GS14_rep']);

%% IRFs with Taylor rule
dynare NK_GS14_rep;
pie_TR = oo_.irfs.pie_e_A_e;
Y_TR = oo_.irfs.Y_e_A_e;
I_TR = oo_.irfs.I_e_A_e;
Lev_TR = oo_.irfs.lev_e_A_e;
R_ib_TR = oo_.irfs.r_ib_e_A_e;
R_b_TR = oo_.irfs.r_b_e_A_e;
save('results.mat', 'pie_TR', 'Y_TR', 'I_TR', 'Lev_TR', 'R_ib_TR' ,'R_b_TR');

%% IRFs with Asset-price augmented rule
dynare NK_GS14_asset_price_rule_rep;

figure (2)
subplot(2,3,1);
plot(oo_.irfs.pie_e_A_e','k-.s','LineWidth',1)
hold on
plot(pie_TR, 'k-.o','LineWidth',2)
grid on
title('Inflation')

subplot(2,3,2);
plot(oo_.irfs.Y_e_A_e','k-.s','LineWidth',1)
hold on
plot(Y_TR, 'k-.o','LineWidth',2)
grid on
title('Output')

subplot(2,3,3);
plot(oo_.irfs.I_e_A_e','k-.s','LineWidth',1)
hold on
plot(I_TR, 'k-.o','LineWidth',2)
grid on
title('Investment')

subplot(2,3,4);
plot(oo_.irfs.lev_e_A_e','k-.s','LineWidth',1)
hold on
plot(Lev_TR, 'k-.o','LineWidth',2)
grid on
ylim([0 0.4])
title('Leverage')

subplot(2,3,5);
plot(oo_.irfs.r_ib_e_A_e','k-.s','LineWidth',1)
hold on
plot(R_ib_TR, 'k-.o','LineWidth',2)
grid on
ylim([-0.05 0.15])
title('Policy rate')
legend('Asset-price augm. rule','Standard rule')
legend('Location','southoutside')
legend('Orientation','horizontal')

subplot(2,3,6);
plot(oo_.irfs.r_b_e_A_e','k-.s','LineWidth',1)
hold on
plot(R_b_TR, 'k-.o','LineWidth',2)
grid on
ylim([-0.05 0.15])
title('Loan rate')



