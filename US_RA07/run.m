% Run and plot IRFs of replication file 

% US_RB07

clear all;
clc;
close all;

cd([cd '/replication_code_orig']);
dynare replication_code_orig;

cd('..');
cd([cd '/replication_code']);

clear all;
dynare replication_code;
cd('..');

disp (' ');
disp('Note:');
disp('The first two figures result from the original code, the latter two from the corrected code.');
disp(' ');

