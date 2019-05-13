% clear variables
clear;
clc;

%% Produce figure 3 and 4 from the paper


% adjust working folder
folder = '/files/model1';
cd([cd folder])

% call first dynare file 

dynare('basic_model1_opt');

file = strcat('basic_model1_opt');


% delete folders and files that dynare created
files = {strcat(file, '.m' ), strcat(file, '.log'), strcat(file, '_static.m'), strcat(file, '_set_auxiliary_variables.m'), strcat(file, '_results.mat'), strcat(file, '_dynamic.m')};
for i=1:6
    delete(char(files(i)))
end
rmdir basic_model1_opt s;

%preparing variables that will be needed to adjust irf levels as in paper
positionOfDpss = find(strcmp(cellstr(eval(strcat('M_.endo_names'))),'dpnk'));
dpss = oo_.steady_state(positionOfDpss); 
positionOfRdss = find(strcmp(cellstr(eval(strcat('M_.endo_names'))),'Rdnk'));
Rdss = oo_.steady_state(positionOfRdss);

%scaling values for normal technology shock
output_ez1 = 100* oo_.irfs.ynk_ez;
pie_ez1 = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_ez)-1);
depRate_ez1 = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_ez)-1);
WorkHours_ez1 = 100 * oo_.irfs.hnk_ez;
cons_ez1 = 100 * oo_.irfs.cnk_ez;
inv_ez1 = 100 * oo_.irfs.ink_ez;
capital_ez1 = 100 * oo_.irfs.knk_ez;

%scaling values for risky technology shock
output_et1 = 100* oo_.irfs.ynk_et;
pie_et1 = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_et)-1);
depRate_et1 = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_et)-1);
WorkHours_et1 = 100 * oo_.irfs.hnk_et;
cons_et1 = 100 * oo_.irfs.cnk_et;
inv_et1 = 100 * oo_.irfs.ink_et;
capital_et1 = 100 * oo_.irfs.knk_et;

% adjust working folder
cd ../..
save('irf1', 'output_ez1', 'pie_ez1', 'depRate_ez1', 'WorkHours_ez1', 'cons_ez1', 'inv_ez1', 'capital_ez1', 'output_et1', 'pie_et1', 'depRate_et1', 'WorkHours_et1', 'cons_et1', 'inv_et1', 'capital_et1');
cd([cd '/files/model2'])

% call first dynare file 
dynare basic_model2_opt.mod

% delete folders and files that dynare created
file = 'basic_model2_opt';
files = {strcat(file, '.m' ), strcat(file, '.log'), strcat(file, '_static.m'), strcat(file, '_set_auxiliary_variables.m'), strcat(file, '_results.mat'), strcat(file, '_dynamic.m')};
for i=1:6
    delete(char(files(i)))
end
rmdir basic_model2_opt s;

%preparing variables that will be needed to adjust irf levels as in paper
positionOfDpss = find(strcmp(cellstr(eval(strcat('M_.endo_names'))),'dpnk'));
dpss = oo_.steady_state(positionOfDpss); 
positionOfRdss = find(strcmp(cellstr(eval(strcat('M_.endo_names'))),'Rdnk'));
Rdss = oo_.steady_state(positionOfRdss);

%scaling values for normal technology shock
output_ez2 = 100* oo_.irfs.ynk_ez;
pie_ez2 = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_ez)-1);
depRate_ez2 = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_ez)-1);
WorkHours_ez2 = 100 * oo_.irfs.hnk_ez;
cons_ez2 = 100 * oo_.irfs.cnk_ez;
inv_ez2 = 100 * oo_.irfs.ink_ez;
capital_ez2 = 100 * oo_.irfs.knk_ez;
kappa_ez2 = 0.12 * exp(oo_.irfs.kpnk_ez);

%scaling values for risky technology shock
output_et2 = 100* oo_.irfs.ynk_et;
pie_et2 = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_et)-1);
depRate_et2 = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_et)-1);
WorkHours_et2 = 100 * oo_.irfs.hnk_et;
cons_et2 = 100 * oo_.irfs.cnk_et;
inv_et2 = 100 * oo_.irfs.ink_et;
capital_et2 = 100 * oo_.irfs.knk_et;
kappa_et2 = 0.12 * exp(oo_.irfs.kpnk_et);


% adjust working folder
cd ../..
save('irf2', 'output_ez2', 'pie_ez2', 'depRate_ez2', 'WorkHours_ez2', 'cons_ez2', 'inv_ez2', 'capital_ez2', 'kappa_ez2', 'output_et2', 'pie_et2', 'depRate_et2', 'WorkHours_et2', 'cons_et2', 'inv_et2', 'capital_et2', 'kappa_et2');
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

%preparing variables that will be needed to adjust irf levels as in paper
positionOfDpss = find(strcmp(cellstr(eval(strcat('M_.endo_names'))),'dpnk'));
dpss = oo_.steady_state(positionOfDpss); 
positionOfRdss = find(strcmp(cellstr(eval(strcat('M_.endo_names'))),'Rdnk'));
Rdss = oo_.steady_state(positionOfRdss);

%scaling values for normal technology shock
output_ez3 = 100* oo_.irfs.ynk_ez;
pie_ez3 = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_ez)-1);
depRate_ez3 = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_ez)-1);
WorkHours_ez3 = 100 * oo_.irfs.hnk_ez;
cons_ez3 = 100 * oo_.irfs.cnk_ez;
inv_ez3 = 100 * oo_.irfs.ink_ez;
capital_ez3 = 100 * oo_.irfs.knk_ez;

%scaling values for risky technology shock
output_et3 = 100* oo_.irfs.ynk_et;
pie_et3 = 400 * (exp(dpss)*(1+oo_.irfs.dpnk_et)-1);
depRate_et3 = 400 * (exp(Rdss)*(1+oo_.irfs.Rdnk_et)-1);
WorkHours_et3 = 100 * oo_.irfs.hnk_et;
cons_et3 = 100 * oo_.irfs.cnk_et;
inv_et3 = 100 * oo_.irfs.ink_et;
capital_et3 = 100 * oo_.irfs.knk_et;



% load previous variables
cd ../..;
load('irf1');
load('irf2');

% making graph for technology shock (figure 3 in paper)
f3 = figure;
p3 = uipanel('Parent',f3,'BorderType','none'); 
p3.Title = 'Figure 3 in Paper - IRFs from Normal Productivity Shock'; 
p3.TitlePosition = 'centertop'; 
p3.FontSize = 12;
p3.FontWeight = 'bold';


subplot(2,4,1,'Parent',p3);
plot(output_ez1);
hold on;
plot(output_ez2);
hold on;
plot(output_ez3);
title('Output');
ylabel('% dev');

subplot(2,4,2,'Parent',p3) 
plot(pie_ez1);
hold on;
plot(pie_ez2);
hold on;
plot(pie_ez3);
axis([0 20 -1 1]);
title('Inflation');
ylabel('annualised rate');


subplot(2,4,3,'Parent',p3); 
plot(depRate_ez1);
hold on;
plot(depRate_ez2);
hold on;
plot(depRate_ez3);
title('Deposit Rate');
ylabel('annualised rate');

subplot(2,4,4,'Parent',p3); 
plot(ones(20,1)*0.14);
hold on;
plot(kappa_ez2);
hold on;
plot(ones(20,1)*0.1);
title('Capital Requirements');
ylabel('%');


subplot(2,4,5,'Parent',p3); 
plot(WorkHours_ez1);
hold on;
plot(WorkHours_ez2);
hold on;
plot(WorkHours_ez3);
title('Hours Worked');
ylabel('% dev.');


subplot(2,4,6,'Parent',p3) 
plot(cons_ez1);
hold on;
plot(cons_ez2);
hold on;
plot(cons_ez3);
title('Consumption');
ylabel('% dev.');

subplot(2,4,7,'Parent',p3);
plot(inv_ez1);
hold on;
plot(inv_ez2);
hold on;
plot(inv_ez3);
title('Investment');
ylabel('% dev.');

subplot(2,4,8,'Parent',p3);
plot(capital_ez1);
hold on;
plot(capital_ez2);
hold on;
plot(capital_ez3);
title('Capital');
ylabel('% dev.');

% making graph for risky technology shock (figure 4 in paper)
f4 = figure;
p4 = uipanel('Parent',f4,'BorderType','none'); 
p4.Title = 'Figure 4 in Paper - IRFs from Risky Productivity Shock'; 
p4.TitlePosition = 'centertop'; 
p4.FontSize = 12;
p4.FontWeight = 'bold';
 
subplot(2,4,1,'Parent',p4);
plot(output_et1);
hold on;
plot(output_et2);
hold on;
plot(output_et3);
title('Output');
ylabel('% dev.');


subplot(2,4,2,'Parent',p4) 
plot(pie_et1);
hold on; 
plot(pie_et2);
hold on;
plot(pie_et3);
axis([0 20 -1 1]);
title('Inflation');
ylabel('annualised rate');
 
subplot(2,4,3,'Parent',p4); 
plot(depRate_et1);
hold on;
plot(depRate_et2);
hold on;
plot(depRate_et3);
title('Deposit Rate');
ylabel('annualised rate');

subplot(2,4,4,'Parent',p4); 
plot(ones(20,1)*0.14);
hold on;
plot(kappa_et2);
hold on;
plot(ones(20,1)*0.1);
title('Capital Requirements');
ylabel('%');


subplot(2,4,5,'Parent',p4); 
plot(WorkHours_et1);
hold on;
plot(WorkHours_et2);
hold on;
plot(WorkHours_et3);
title('Hours Worked');
ylabel('% dev.');


subplot(2,4,6,'Parent',p4); 
plot(cons_et1);
hold on;
plot(cons_et2);
hold on;
plot(cons_et3);
title('Consumption');
ylabel('% dev.');

subplot(2,4,7,'Parent',p4);
plot(inv_et1);
hold on;
plot(inv_et2);
hold on;
plot(inv_et3);
title('Investment');
ylabel('% dev.');

subplot(2,4,8,'Parent',p4);
plot(capital_et1);
hold on;
plot(capital_et2);
hold on;
plot(capital_et3);
title('Capital');
ylabel('% dev.');


delete('irf1.mat', 'irf2.mat');