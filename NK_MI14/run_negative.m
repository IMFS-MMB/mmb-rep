%This file creates impulse response functions of the endogenous variables
%as a response to negative technology shock AND public employment shock.
%Replicates Figure 3 (red dashed line) of Michaillat(2014)

clear

cd([cd '/NK_MI14_rep']);

dynare NK_MI14_rep_neg_nog

a_irf = oo_.endo_simul(1,:);  
c_irf = oo_.endo_simul(2,:); 
pie_irf = oo_.endo_simul(3,:); 
l_irf = oo_.endo_simul(4,:); 
n_irf = oo_.endo_simul(5,:);
th_irf = oo_.endo_simul(6,:);
R_irf = oo_.endo_simul(7,:); 
g_irf = oo_.endo_simul(8,:); 
gendo_irf = oo_.endo_simul(9,:); 
y_irf = oo_.endo_simul(10,:);
u_irf = oo_.endo_simul(11,:);

ts1 = timeseries(a_irf(2:401));
ts1.Name = 'Technology';
ts1.TimeInfo.Units = 'weeks';

ts2 = timeseries(c_irf(2:401));
ts2.Name = 'Consumption';
ts2.TimeInfo.Units = 'weeks';

ts3 = timeseries(pie_irf(2:401));
ts3.Name = 'Inflation';
ts3.TimeInfo.Units = 'weeks';

ts4 = timeseries(l_irf(2:401));
ts4.Name = 'Private employment';
ts4.TimeInfo.Units = 'weeks';

ts5 = timeseries(n_irf(2:401));
ts5.Name = 'Total employment';
ts5.TimeInfo.Units = 'weeks';

ts6 = timeseries(th_irf(2:401));
ts6.Name = 'Labor market tightness';
ts6.TimeInfo.Units = 'weeks';

ts7 = timeseries(R_irf(2:401));
ts7.Name = 'Interest rate';
ts7.TimeInfo.Units = 'weeks';

ts8 = timeseries(g_irf(2:401));
ts8.Name = 'Public employment';
ts8.TimeInfo.Units = 'weeks';

ts9 = timeseries(y_irf(2:401));
ts9.Name = 'Output';
ts9.TimeInfo.Units = 'weeks';

ts10 = timeseries(u_irf(2:401));
ts10.Name = 'Unemployment';
ts10.TimeInfo.Units = 'weeks';

figure(1) %combine several plots to obtain Figure 2
subplot(3,2,1)   
plot(ts1,'b','Linewidth',2)        
title('Technology')
subplot(3,2,2)   
plot(ts8,'b','Linewidth',2)        
title('Public employment')
subplot(3,2,3)      
plot(ts6,'b','Linewidth',2)           
title('Labor market tightness')
subplot(3,2,4)      
plot(ts4,'b','Linewidth',2)
title('Private employment')
subplot(3,2,5)
plot(ts10,'b','Linewidth',2)
title('Unemployment')
subplot(3,2,6)      
plot(ts9,'b','Linewidth',2)
title('Output')

dynare NK_MI14_rep_neg 

a_irf = oo_.endo_simul(1,:);  
c_irf = oo_.endo_simul(2,:); 
pie_irf = oo_.endo_simul(3,:); 
l_irf = oo_.endo_simul(4,:); 
n_irf_1 = oo_.endo_simul(5,:);
th_irf = oo_.endo_simul(6,:);
R_irf = oo_.endo_simul(7,:); 
g_irf_1 = oo_.endo_simul(8,:); 
gendo_irf = oo_.endo_simul(9,:); 
y_irf = oo_.endo_simul(10,:);
u_irf = oo_.endo_simul(11,:);

ts1 = timeseries(a_irf(2:401));
ts1.Name = 'Technology';
ts1.TimeInfo.Units = 'weeks';

ts2 = timeseries(c_irf(2:401));
ts2.Name = 'Consumption';
ts2.TimeInfo.Units = 'weeks';

ts3 = timeseries(pie_irf(2:401));
ts3.Name = 'Inflation';
ts3.TimeInfo.Units = 'weeks';

ts4 = timeseries(l_irf(2:401));
ts4.Name = 'Private employment';
ts4.TimeInfo.Units = 'weeks';

ts5 = timeseries(n_irf_1(2:401));
ts5.Name = 'Total employment';
ts5.TimeInfo.Units = 'weeks';

ts6 = timeseries(th_irf(2:401));
ts6.Name = 'Labor market tightness';
ts6.TimeInfo.Units = 'weeks';

ts7 = timeseries(R_irf(2:401));
ts7.Name = 'Interest rate';
ts7.TimeInfo.Units = 'weeks';

ts8 = timeseries(g_irf_1(2:401));
ts8.Name = 'Public employment';
ts8.TimeInfo.Units = 'weeks';

ts9 = timeseries(y_irf(2:401));
ts9.Name = 'Output';
ts9.TimeInfo.Units = 'weeks';

ts10 = timeseries(u_irf(2:401));
ts10.Name = 'Unemployment';
ts10.TimeInfo.Units = 'weeks';

figure(1) %combine several plots to obtain Figure 2
subplot(3,2,1)
hold on
plot(ts1,'--m','Linewidth',2)        
title('Technology')
hold off
subplot(3,2,2) 
hold on
plot(ts8,'--m','Linewidth',2)        
title('Public employment')
hold off
subplot(3,2,3)
hold on
plot(ts6,'--m','Linewidth',2)           
title('Labor market tightness')
hold off
subplot(3,2,4) 
hold on
plot(ts4,'--m','Linewidth',2)
title('Private employment')
hold off
subplot(3,2,5)
hold on
plot(ts10,'--m','Linewidth',2)
title('Unemployment')
hold off
subplot(3,2,6) 
hold on
plot(ts9,'--m','Linewidth',2)
title('Output')
hold off



%%%%%%%%%%%%%%%Multiplier%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mult = (-n_irf+n_irf_1)./(-g_irf+g_irf_1);
mult_ts = timeseries(mult(2:401));
mult_ts.Name = 'Multiplier after negative shock';
mult_ts.TimeInfo.Units = 'weeks';
figure(2)
plot(mult_ts,'-r','Linewidth',2);
title('Multiplier after negative shock')

