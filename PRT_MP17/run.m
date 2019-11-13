%% This file replicates results from Martin and Philippon (2017)

clear all;
close all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/PRT_MP17_rep']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figures and Tables %%%%%%%%%%%%%%%%%%%%%%%%
% lines can be executed autonomously 

% Figure 4 (p.1924) Benchmark Model Fit
Prog_Sim_Structural_NKM('pigs');

% Table 5 (p.1924) Goodness of Fit 
goodness_fit_table() ;

% Figures 5-12 Counterfactual Experiments
Prog_Sim_Counterfactual('pigs','save','cf_fiscal','fiscal counterfactual') ;
Prog_Sim_Counterfactual('pigs','save','cf_mp','macroprudential counterfactual') ;
Prog_Sim_Counterfactual('pigs','save','cf_fiscalmp','fiscal+mp counterfactual') ;
Prog_Sim_Counterfactual('pigs','save','cf_rho','no segmentation counterfactual') ;

% Table 6 (p.1933) Employment Change 
employment_change_table('pigs');
