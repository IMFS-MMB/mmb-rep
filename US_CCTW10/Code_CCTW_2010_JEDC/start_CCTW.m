%This Matlab-File replicates figure 2, 3, 4 and 6 of the paper J.F. Cogan, T. Cwik, J.B. Taylor and V. Wieland (2010), 
%"New Keynesian versus old Keynesian government spending multipliers", Journal of Economic Dynamics & Control 34, 281-295.
clear all;
close all;

%Dynare reads in the model equations of the original model
dynare SW_US_fiscal2002
warning off;
options_.periods=2000;
options_.simul_algo=0;
options_.dynatol=0.00001;
options_.maxit=10;
options_.slowc=1;
options_.timing=0;
options_.gstep=1e-2;
options_.scalv=1;
clc;

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('J.F. Cogan, T. Cwik, J.B. Taylor and V. Wieland (2010)');, 
disp('"New Keynesian versus old Keynesian government spending multipliers"');
disp('Journal of Economic Dynamics & Control 34, 281-295');
disp(' ');
disp('Deterministic simulation to replicate figure 2, 3, 4 and 6 of the paper.');
disp('Figure 2 displays the output effects of government purchases in the February 2009 stimulus legislation and');
disp('figure 3 the consumption and investment effects and');
disp('figure 4 the output effects in the original Smets and Wouters model and the model with non Ricardian consumers');
disp('figure 6 the output effects based on projections of the Smets-Wouters model using US data throughout 2009Q1');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');
%Starts the deterministic simulation 
simul(oo_.dr); %Dynare V4

results.original.output=output;
results.original.inve=ciy*inve;
results.original.cons=ccy*c;

save result results

%Dynare reads in the model equations of the extended model
dynare SW_US_fiscal_LC.mod
warning off;
options_.periods=2000;
options_.simul_algo=0;
options_.dynatol=0.00001;
options_.maxit=10;
options_.slowc=1;
options_.timing=0;
options_.gstep=1e-2;
options_.scalv=1;
clc;

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('J.F. Cogan, T. Cwik, J.B. Taylor and V. Wieland (2010)');, 
disp('"New Keynesian versus old Keynesian government spending multipliers"');
disp('Journal of Economic Dynamics & Control 34, 281-295');
disp(' ');
disp('Deterministic simulation to replicate figure 2, 3, 4 and 6 of the paper.');
disp('Figure 2 displays the output effects of government purchases in the February 2009 stimulus legislation and');
disp('figure 3 the consumption and investment effects and');
disp('figure 4 the output effects in the original Smets and Wouters model and the model with non Ricardian consumers');
disp('figure 6 the output effects based on projections of the Smets-Wouters model using US data throughout 2009Q1');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');
%Starts the deterministic simulation 
simul(oo_.dr); %Dynare V4

load result 

results.extended.output=output;

save result results

% Dynare simulates the recovery out of the recession in 2009Q1 with and
% without ARRA package and plots the relative response of output 

%Simulation without Fiscal package

dynare SW_US_fiscal

options_.periods=5000;
options_.simul_algo=0;
options_.dynatol=0.00001;
options_.maxit=20;
options_.slowc=1;
options_.timing=0;
options_.gstep=1e-2;
options_.scalv=1;
clc;

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('J.F. Cogan, T. Cwik, J.B. Taylor and V. Wieland (2010)');, 
disp('"New Keynesian versus old Keynesian government spending multipliers"');
disp('Journal of Economic Dynamics & Control 34, 281-295');
disp(' ');
disp('Deterministic simulation to replicate figure 2, 3, 4 and 6 of the paper.');
disp('Figure 2 displays the output effects of government purchases in the February 2009 stimulus legislation and');
disp('figure 3 the consumption and investment effects and');
disp('figure 4 the output effects in the original Smets and Wouters model and the model with non Ricardian consumers');
disp('figure 6 the output effects based on projections of the Smets-Wouters model using US data throughout 2009Q1');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');


load initvalues_2009Q1   
options_.initval_file = 0;
endval_=0;
oo_.steady_state=initialvalues(:,end);
   oo_.endo_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
    oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
    oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;

    %
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
recurs0_ = recurs_;
endval_ = 1;
oo_.steady_state( 1 ) = 0.5509;
oo_.steady_state( 2 ) = 1.5495;
oo_.steady_state( 3 ) = 0.7869;
oo_.steady_state( 4 ) = 0.4312;
oo_.steady_state( 5 ) = 0.4312;
oo_.steady_state( 6 ) = 0.4312;
oo_.steady_state( 7 ) = 0.4312;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 17 ) = 0;
oo_.steady_state( 18 ) = 0;
oo_.steady_state( 19 ) = 0;
oo_.steady_state( 20 ) = 0;
oo_.steady_state( 21 ) = 0;
oo_.steady_state( 22 ) = 0;
oo_.steady_state( 23 ) = 0;
oo_.steady_state( 24 ) = 0;
oo_.steady_state( 25 ) = 0;
oo_.steady_state( 26 ) = 0;
oo_.steady_state( 27 ) = 0;
oo_.steady_state( 28 ) = 0;
oo_.steady_state( 29 ) = 0;
oo_.steady_state( 30 ) = 0;
oo_.steady_state( 31 ) = 0;
oo_.steady_state( 32 ) = 0;
oo_.steady_state( 33 ) = 0;
oo_.steady_state( 34 ) = 0;
oo_.steady_state( 35 ) = 0;
oo_.steady_state( 36 ) = 0;
oo_.steady_state( 37 ) = 0;
oo_.steady_state( 38 ) = 0;
oo_.steady_state( 39 ) = 0;
oo_.steady_state( 40 ) = 0;
oo_.steady_state( 41 ) = 0;
oo_.steady_state( 42 ) = 0;
oo_.steady_state( 43 ) = 0;
oo_.steady_state( 44 ) = 0;
oo_.steady_state( 45 ) = 0;
oo_.steady_state( 46 ) = 0;
oo_.steady_state( 47 ) = 0;
oo_.steady_state( 48 ) = 0;
oo_.steady_state( 49 ) = 0;
oo_.steady_state( 50 ) = 3.0503;
oo_.steady_state( 51 ) = 0;
oo_.steady_state( 52 ) = 3.1476;
oo_.steady_state( 53 ) = 6.1979;
oo_.steady_state( 54 ) = 1.7248;

make_ex_;
set_shocks(0,1:50, loc(M_.exo_names,'dummy_MP'), 1);

%Starts the deterministic simulation 
simul(oo_.dr); %Dynare V4

load result

results.endogenousZLB_wo_ARRA.output=output;

save result results




%Simulation with ARRA package

dynare SW_US_fiscal

options_.periods=5000;
options_.simul_algo=0;
options_.dynatol=0.00001;
options_.maxit=20;
options_.slowc=1;
options_.timing=0;
options_.gstep=1e-2;
options_.scalv=1;
clc;

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('J.F. Cogan, T. Cwik, J.B. Taylor and V. Wieland (2010)');, 
disp('"New Keynesian versus old Keynesian government spending multipliers"');
disp('Journal of Economic Dynamics & Control 34, 281-295');
disp(' ');
disp('Deterministic simulation to replicate figure 2, 3, 4 and 6 of the paper.');
disp('Figure 2 displays the output effects of government purchases in the February 2009 stimulus legislation and');
disp('figure 3 the consumption and investment effects and');
disp('figure 4 the output effects in the original Smets and Wouters model and the model with non Ricardian consumers');
disp('figure 6 the output effects based on projections of the Smets-Wouters model using US data throughout 2009Q1');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');

load initvalues_2009Q1   
options_.initval_file = 0;
endval_=0;
oo_.steady_state=initialvalues(:,end);
  oo_.endo_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
    oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
    oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;

    %
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
recurs0_ = recurs_;
endval_ = 1;
oo_.steady_state( 1 ) = 0.5509;
oo_.steady_state( 2 ) = 1.5495;
oo_.steady_state( 3 ) = 0.7869;
oo_.steady_state( 4 ) = 0.4312;
oo_.steady_state( 5 ) = 0.4312;
oo_.steady_state( 6 ) = 0.4312;
oo_.steady_state( 7 ) = 0.4312;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 17 ) = 0;
oo_.steady_state( 18 ) = 0;
oo_.steady_state( 19 ) = 0;
oo_.steady_state( 20 ) = 0;
oo_.steady_state( 21 ) = 0;
oo_.steady_state( 22 ) = 0;
oo_.steady_state( 23 ) = 0;
oo_.steady_state( 24 ) = 0;
oo_.steady_state( 25 ) = 0;
oo_.steady_state( 26 ) = 0;
oo_.steady_state( 27 ) = 0;
oo_.steady_state( 28 ) = 0;
oo_.steady_state( 29 ) = 0;
oo_.steady_state( 30 ) = 0;
oo_.steady_state( 31 ) = 0;
oo_.steady_state( 32 ) = 0;
oo_.steady_state( 33 ) = 0;
oo_.steady_state( 34 ) = 0;
oo_.steady_state( 35 ) = 0;
oo_.steady_state( 36 ) = 0;
oo_.steady_state( 37 ) = 0;
oo_.steady_state( 38 ) = 0;
oo_.steady_state( 39 ) = 0;
oo_.steady_state( 40 ) = 0;
oo_.steady_state( 41 ) = 0;
oo_.steady_state( 42 ) = 0;
oo_.steady_state( 43 ) = 0;
oo_.steady_state( 44 ) = 0;
oo_.steady_state( 45 ) = 0;
oo_.steady_state( 46 ) = 0;
oo_.steady_state( 47 ) = 0;
oo_.steady_state( 48 ) = 0;
oo_.steady_state( 49 ) = 0;
oo_.steady_state( 50 ) = 3.0503;
oo_.steady_state( 51 ) = 0;
oo_.steady_state( 52 ) = 3.1476;
oo_.steady_state( 53 ) = 6.1979;
oo_.steady_state( 54 ) = 1.7248;

make_ex_;           
set_shocks(0,1, loc(M_.exo_names,'fiscal_'), 0.1964);
set_shocks(0,2:3, loc(M_.exo_names,'fiscal_'), 0.4657);   
set_shocks(0,4, loc(M_.exo_names,'fiscal_'), 0.59);
set_shocks(0,5:7, loc(M_.exo_names,'fiscal_'), 0.77);
set_shocks(0,8, loc(M_.exo_names,'fiscal_'), 0.73);
set_shocks(0,9:11, loc(M_.exo_names,'fiscal_'), 0.49);
set_shocks(0,12, loc(M_.exo_names,'fiscal_'), 0.4);
set_shocks(0,13:15, loc(M_.exo_names,'fiscal_'), 0.25);
set_shocks(0,16, loc(M_.exo_names,'fiscal_'), 0.17);
set_shocks(0,17:20, loc(M_.exo_names,'fiscal_'), 0.16);
set_shocks(0,21:23, loc(M_.exo_names,'fiscal_'), 0.15);
set_shocks(0,24:27, loc(M_.exo_names,'fiscal_'), 0.06);      
set_shocks(0,28:31, loc(M_.exo_names,'fiscal_'),-0.01);
set_shocks(0,32:35, loc(M_.exo_names,'fiscal_'), 0.01);          
set_shocks(0,36:39, loc(M_.exo_names,'fiscal_'),-0.01);
set_shocks(0,40:43, loc(M_.exo_names,'fiscal_'), 0.01);  

set_shocks(0,1:50, loc(M_.exo_names,'dummy_MP'), 1);

%Starts the deterministic simulation 
simul(oo_.dr); %Dynare V4

load result

results.endogenousZLB_with_ARRA.output=output;

%Taking the difference in output
results.endogenousZLB.output=results.endogenousZLB_with_ARRA.output-results.endogenousZLB_wo_ARRA.output;

save result results



%Options
horizon=20;
time = (0:horizon)';
% US package
gs=[0;0.1964;0.4657;0.4657;0.59;0.77;0.77;0.77;0.73;0.49;0.49;0.49;0.4;0.25;0.25;0.25;0.17;0.16;0.16;0.16;0.16];  

%Figure 2 (page 286)
figure(2);
set(gcf,'Visible','on')
axes1=axes('XTickLabel',{'2009','2010','2011','2012','2013'},'XTick',[1 5 9 13 17],'FontName','Arial');
hold(axes1,'all');
axis([0 20 -0.1 0.8])
bar(time,gs,'w','LineWidth',2);
hold on;
plot(time,results.original.output(1:21),'Color',[1 0 0],'LineWidth',4); hold on;
set(gca, 'FontSize',14);
h= legend('Government purchases','Impact on GDP');    
set(h,'Box','off','Position',[0.5948 0.7183 0.2017 0.08282])
ylabel({'Percent of GDP',''});


%Figure 3 (page 287)
figure(3);
set(gcf,'Visible','on')
axes1=axes('XTickLabel',{'2009','2010','2011','2012','2013'},'XTick',[1 5 9 13 17],'FontName','Arial');
hold(axes1,'all');
axis([0 20 -0.4 0.8])
bar(time,gs,'w','LineWidth',2);
hold on;
plot(time,results.original.cons(1:21),'Color',[0.5 0 0.5],'LineWidth',4); hold on;
plot(time,results.original.inve(1:21),'Color',[0 0.5 0],'LineWidth',4); hold on;
plot(time,results.original.cons(1:21)+results.original.inve(1:21),'Color',[0.2 0.2 0.2],'LineWidth',4); hold on;
set(gca, 'FontSize',14);
ylabel({'Percent of GDP',''});
annotation('textbox',[0.459 0.3179 0.1732 0.04438],...
    'String',{'Consumption (C)'},...
    'FontSize',12,...
    'FontName','Arial',...
    'EdgeColor','none','FitBoxToText','on');
annotation('textbox',[0.4317 0.2512 0.14 0.04438],...
    'String',{'Investment (I)'},...
    'FontSize',12,...
    'FontName','Arial',...
    'EdgeColor','none','FitBoxToText','on');
annotation('textbox',[0.4412 0.1719 0.09371 0.04438],...
    'String',{'C plus I'},...
    'FontSize',12,...
    'FontName','Arial',...
    'EdgeColor','none','FitBoxToText','on');
annotation('textbox',[0.4719 0.7704 0.2539 0.04438],...
    'String',{'Government purchases (G)'},...
    'FontSize',12,...
    'FontName','Arial',...
    'EdgeColor','none','FitBoxToText','on');


%Figure 4 (page 287)
figure(4);
set(gcf,'Visible','on')
axes1=axes('XTickLabel',{'2009','2010','2011','2012','2013'},'XTick',[1 5 9 13 17],'FontName','Arial');
hold(axes1,'all');
axis([0 20 -0.1 0.8])
bar(time,gs,'w','LineWidth',2);
hold on;
plot(time,results.original.output(1:21),'Color',[1 0 0],'LineWidth',4); hold on;
plot(time,results.extended.output(1:21),'Color',[1 0 0],'LineStyle','--','LineWidth',4); hold on;
set(gca, 'FontSize',14);
h= legend('Government purchases','GDP (Smets Wouters Model)','GDP (Extended Model)');    
set(h,'Box','off','Position',[0.5948 0.7183 0.2017 0.08282])
ylabel({'Percent of GDP',''});


%Figure 6 (page 290)
figure(6);
set(gcf,'Visible','on')
axes1=axes('XTickLabel',{'2009','2010','2011','2012','2013'},'XTick',[1 5 9 13 17],'FontName','Arial');
hold(axes1,'all');
axis([0 20 -0.1 0.6001])
plot(time,results.original.output(1:21),'Color',[1 0 0],'LineWidth',4,'DisplayName',['Constant Interest Rate in 2009',sprintf('\n'),'(Figure 2)']); hold on;
plot(time,results.endogenousZLB.output(1:21),'Color',[0 0.2 0.4],'linestyle','--','LineWidth',4,'DisplayName',['Smets-Wouters Rule, Start in',sprintf('\n'),'Recession State, Zero Bound',sprintf('\n'),'Endogenous']); hold on;
set(gca, 'FontSize',14);
h = legend(axes1,'show');
set(h,'Box','off','Position',[0.57 0.5 0.2492 0.2444]);
plot(time,zeros(horizon+1,1),'Color',[0 0 0],'LineWidth',1); hold on;
ylabel({'Percent of GDP',''});
