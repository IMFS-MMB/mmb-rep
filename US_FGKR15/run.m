clear all
close all
clc

%% Adjust path to folder where replication file is stored
cd([cd '/main_code_FGKR_20121236']);

%% Run Model
dynare main_code_FGKR

%% Go back to original path
cd('..');


