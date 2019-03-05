%% run file for EA_PV16
%% as no IRFs shown in paper, does not replicate figure

%clear 
%close all

cd EA_PV_rep             %set path to folder where mod files are stored


dynare EA_PV16_rep.mod noclearall
ea_y_print = ea_y;          %real GDP
%ea_py_print = ea_py;        %rel GDP in first difference
ea_tby_print = ea_tby;      %trade balance to GDP
ea_inom_print = ea_inom;    %nominal interest rate risk free
ea_infy_print = ea_infy;    %inflation

%%
style = ['--k  '; '-.b  '; ' :r  '; '  k  '];
lw = 2;
irf_len = 20;
close all


figure(1)
subplot(2,2,1)
plot(0:1:irf_len,ea_y_print(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hTitle= title('Output')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(2,2,2)
plot(0:1:irf_len,ea_tby_print(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Trade Balance to GDP')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(2,2,3)
plot(0:1:irf_len,ea_inom_print(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hTitle=title('Nominal interest rate risk free')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(2,2,4)
plot(0:1:irf_len,ea_infy_print(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Inflation')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
saveas(1,'../QE_shock.png' ) 