%US_KK14

% Martin Kliem and Alexander Kriwoluzky "Toward a Taylor Rule of Fiscal Policy", 
% Review of Economic Dynamics 17, pp. 294-302

cd('multipliers')
dynare model_bench_irf1;

dynare model_ext_irf1;

clc;

plt_multiplier;

cd('..')