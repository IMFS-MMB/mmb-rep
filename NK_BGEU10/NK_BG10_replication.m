%% A New Keynesian Model with Unemployment
%  Dennis Gram and Johannes Van Vlodrop
%  Replication Exercise

%% References
%  Blanchard, O., and J. Galí. 2010. "Labor Markets and Monetary Policy: 
%  A New Keynesian Model with Unemployment."
%  AEL: Macroeconomics 2, 2(2), pp. 1-30.

%% Housekeeping
clc;
close all
clear all;

%% Optimal Monetary Policy: dynare

dynare rep_NK_BG10US_opt_mp.mod;

% Save IRFs
us_u_opt = oo_.irfs.uhat_a_;                                    
us_infl_opt = oo_.irfs.inflation_a_;
save('results.mat', 'us_u_opt', 'us_infl_opt');

dynare rep_NK_BG10EU_opt_mp.mod;
eu_u_opt = oo_.irfs.uhat_a_;
eu_infl_opt = oo_.irfs.inflation_a_;
save('results.mat', 'eu_u_opt', 'eu_infl_opt', '-append');

%% Inflation Targeting: dynare

dynare rep_NK_BG10US_pi_mp.mod;

us_u_infl = oo_.irfs.uhat_a_;
us_infl_infl = oo_.irfs.inflation_a_;
save('results.mat', 'us_u_infl', 'us_infl_infl', '-append');

dynare rep_NK_BG10EU_pi_mp.mod;
eu_u_infl = oo_.irfs.uhat_a_;
eu_infl_infl = oo_.irfs.inflation_a_;
save('results.mat', 'eu_u_infl', 'eu_infl_infl', '-append');

%% Unemployment Stabilization: dynare

dynare rep_NK_BG10US_u_mp.mod;

us_u_une = oo_.irfs.uhat_a_;
us_infl_une = oo_.irfs.inflation_a_;
save('results.mat', 'us_u_une', 'us_infl_une', '-append');

dynare rep_NK_BG10EU_u_mp.mod;
eu_u_une = oo_.irfs.uhat_a_;
eu_infl_une = oo_.irfs.inflation_a_;

opt_irf = options_.irf;

save('results.mat', 'eu_u_une', 'eu_infl_une', 'opt_irf', '-append');

%%
clear all;
close all;
clc;
load('results.mat'); t = [0:1:opt_irf-1];

%% Replication Exercise: Figure 2, p. 22
figure('Name','Dynamic responses to a persistent productiviy shock')
subplot(2,2,1), 
hold on
plot(t, us_infl_une,'*-r')
plot(t, eu_infl_une,'.-b')
axis([-1 30 -0.2 1.7])
legend('US','Europe')
legend('Location','northeast')
xlabel('Inflation')
hold off
title('Constant Unemployment Policy')
subplot(2,2,2)
hold on
plot(t, us_u_infl,'*-r')
plot(t, eu_u_infl,'.-b')
axis([-1 30 0 8])
xlabel('Unemployment')
legend('US','Europe')
legend('Location','northeast')
hold off
title('Strict Inflation Targeting')

subplot(2,2,3), 
hold on
plot(t, us_infl_opt,'*-r')
plot(t, eu_infl_opt,'.-b')
axis([-1 30 -0.2 1.7])
legend('US','Europe')
legend('Location','northeast')
xlabel('Inflation')
hold off
title('Optimal Policy')
subplot(2,2,4)
hold on
plot(t, us_u_opt,'*-r')
plot(t, eu_u_opt,'.-b')
axis([-1 30 0 8])
xlabel('Unemployment')
legend('US','Europe')
legend('Location','northeast')
hold off
title('Optimal Policy')
print('NK_BG10_irf','-dpdf')
