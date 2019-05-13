% This code compares the MMB implemetnation to the replication where the
% optimal monetary policy is used. This is done for the version of the
% model where prudential policy is set too low the risky technology is 
% used and there is moral hazard 

% clear variables
clear;
clc;


%% First you need to call the MMB...
MMB

%% Produce figure 3 and 4 from the paper

% insert folder where current file is located into the next command
cd('Copy and paste location of current folder')
save('MMB_results', 'oo_')

% go to replication file
cd([cd '/files/model3'])
% call first dynare file 
dynare basic_model3_opt.mod

% delete folders and files that dynare created
file = 'basic_model3_opt';

files = {strcat(file, '.m' ), strcat(file, '.log'), strcat(file, '_static.m'), strcat(file, '_set_auxiliary_variables.m'), strcat(file, '_results.mat'), strcat(file, '_dynamic.m')};
for i=1:6
    delete(char(files(i)))
end
rmdir basic_model3_opt s;

% preparing variables that will be needed to adjust irf levels as in paper
positionOfDpss = find(strcmp(cellstr(eval(strcat('M_.endo_names'))),'dpnk'));
dpss = oo_.steady_state(positionOfDpss); 
positionOfRdss = find(strcmp(cellstr(eval(strcat('M_.endo_names'))),'Rdnk'));
Rdss = oo_.steady_state(positionOfRdss);

% scaling values for normal technology shock
output_ez = 100* oo_.irfs.ynk_ez;
pie_ez = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_ez)-1);
depRate_ez = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_ez)-1);
WorkHours_ez = 100 * oo_.irfs.hnk_ez;
cons_ez = 100 * oo_.irfs.cnk_ez;
inv_ez = 100 * oo_.irfs.ink_ez;
capital_ez = 100 * oo_.irfs.knk_ez;
kappa_ez = 0.1 * ones(20,1);

% scaling values for risky technology shock
output_et = 100* oo_.irfs.ynk_et;
pie_et = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_et)-1);
depRate_et = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_et)-1);
WorkHours_et = 100 * oo_.irfs.hnk_et;
cons_et = 100 * oo_.irfs.cnk_et;
inv_et = 100 * oo_.irfs.ink_et;
capital_et = 100 * oo_.irfs.knk_et;
kappa_et = 0.1 * ones(20,1);


% adjust working folder
cd ../..

% load results of MMB
load('MMB_results');

% scaling values for normal technology shock
output_ez_MMB = 100* oo_.irfs.ynk_ez;
pie_ez_MMB = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_ez)-1);
depRate_ez_MMB = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_ez)-1);
WorkHours_ez_MMB = 100 * oo_.irfs.hnk_ez;
cons_ez_MMB = 100 * oo_.irfs.cnk_ez;
inv_ez_MMB = 100 * oo_.irfs.ink_ez;
capital_ez_MMB = 100 * oo_.irfs.knk_ez;
kappa_ez_MMB = 0.1 * ones(20,1);

% scaling values for risky technology shock
output_et_MMB = 100* oo_.irfs.ynk_et;
pie_et_MMB = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_et)-1);
depRate_et_MMB = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_et)-1);
WorkHours_et_MMB = 100 * oo_.irfs.hnk_et;
cons_et_MMB = 100 * oo_.irfs.cnk_et;
inv_et_MMB = 100 * oo_.irfs.ink_et;
capital_et_MMB = 100 * oo_.irfs.knk_et;
kappa_et_MMB = 0.1*ones(20,1);

% making graph for normal technology shock (figure 3 in paper)
f3 = figure;
p3 = uipanel('Parent',f3,'BorderType','none'); 
p3.Title = 'Normal Productivity Shock - Similar to Fig. 3 in Paper'; 
p3.TitlePosition = 'centertop'; 
p3.FontSize = 12;
p3.FontWeight = 'bold';

subplot(2,4,1,'Parent',p3);
plot(output_ez);
hold on;
plot(output_ez_MMB);
title('Output');
legend('Original', 'MMB - Taylor Rule')
ylabel('% dev.');

subplot(2,4,2,'Parent',p3) 
plot(pie_ez);
hold on;
plot(pie_ez_MMB);
axis([0 20 -1 1]);
title('Inflation');
ylabel('annualised rate');

subplot(2,4,3,'Parent',p3); 
plot(depRate_ez);
hold on;
plot(depRate_ez_MMB);
title('Deposit Rate');
ylabel('annnualised rate');

subplot(2,4,4,'Parent',p3); 
plot(kappa_ez);
hold on;
plot(kappa_ez_MMB);
title('Capital Requirements');
ylabel('%');

subplot(2,4,5,'Parent',p3); 
plot(WorkHours_ez);
hold on;
plot(WorkHours_ez_MMB);
title('Hours Worked');
ylabel('% dev.');

subplot(2,4,6,'Parent',p3) 
plot(cons_ez);
hold on;
plot(cons_ez_MMB);
title('Consumption');
ylabel('% dev.');

subplot(2,4,7,'Parent',p3);
plot(inv_ez);
hold on;
plot(inv_ez_MMB);
title('Investment');
ylabel('% dev.');

subplot(2,4,8,'Parent',p3);
plot(capital_ez);
hold on;
plot(capital_ez_MMB);
title('Capital');
ylabel('% dev.');


% making graph for risky technology shock (figure 4 in paper)
f4 = figure;
p4 = uipanel('Parent',f4,'BorderType','none'); 
p4.Title = 'Risky Technology Shock - Similar to Fig. 4 in Paper'; 
p4.TitlePosition = 'centertop'; 
p4.FontSize = 12;
p4.FontWeight = 'bold';

 
subplot(2,4,1,'Parent',p4);
plot(output_et);
hold on;
plot(output_et_MMB);
title('Output');
legend('Original', 'MMB - Taylor Rule')
ylabel('% dev.');

subplot(2,4,2,'Parent',p4) 
plot(pie_et);
hold on;
plot(pie_et_MMB);
axis([0 20 -1 1]);
title('Inflation');
ylabel('annualised rate');
 
subplot(2,4,3,'Parent',p4); 
plot(depRate_et);
hold on;
plot(depRate_et_MMB);
title('Deposit Rate');
ylabel('annualised rate');

subplot(2,4,4,'Parent',p4); 
plot(kappa_et);
hold on;
plot(kappa_et_MMB);
title('Capital Requirements');
ylabel('%');

subplot(2,4,5,'Parent',p4); 
plot(WorkHours_et);
hold on;
plot(WorkHours_et_MMB);
title('Hours Worked');
ylabel('% dev.');
 
subplot(2,4,6,'Parent',p4); 
plot(cons_et);
hold on;
plot(cons_et_MMB);
title('Consumption');
ylabel('% dev.');
 
subplot(2,4,7,'Parent',p4);
plot(inv_et);
hold on;
plot(inv_et_MMB);
title('Investment');
ylabel('% dev.');
 
subplot(2,4,8,'Parent',p4);
plot(capital_et);
hold on;
plot(capital_et_MMB);
title('Capital');
ylabel('% dev.');

% delete MMB results in order to keep folder clean
delete( 'MMB_results.mat');