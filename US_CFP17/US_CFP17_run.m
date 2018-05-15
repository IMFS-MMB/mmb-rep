%% run file for CFP17
%% replicates figure 3 of original paper

%clear 
%close all

cd US_CFP17_rep             %set path to folder where mod files are stored


dynare US_CFP17_rep_exo.mod noclearall
yield_exo           = r10_eps_i;
FFR_exo             = r1_eps_i;
output_exo          = y_eps_i;
investment_exo      = i_eps_i;
consumption_exo     = c_eps_i;
labor_dis_exo       = labor_dist_eps_i;
infl_exo            = ann_pin_eps_i;
tp_exo              = term_prem_eps_i;
bonds_exo           = b2_eps_i;


dynare US_CFP17_rep_endo.mod noclearall
yield_endo           = r10_eps_i;
FFR_endo             = r1_eps_i;
output_endo          = y_eps_i;
investment_endo      = i_eps_i;
consumption_endo     = c_eps_i;
labor_dis_endo       = labor_dist_eps_i;
infl_endo            = ann_pin_eps_i;
tp_endo              = term_prem_eps_i;
bonds_endo           = b2_eps_i;


%%
style = ['--k  '; '-.b  '; ' :r  '; '  k  '];
lw = 2;
irf_len = 20;
close all


figure
subplot(3,3,1)
plot(0:1:irf_len,yield_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,yield_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle= title('Bond Yield')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(3,3,2)
plot(0:1:irf_len, FFR_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,FFR_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('FFR')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(3,3,3)
plot(0:1:irf_len,output_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,output_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Output')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(3,3,4)
plot(0:1:irf_len,investment_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,investment_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Investment')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(3,3,5)
plot(0:1:irf_len,consumption_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,consumption_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Consumption')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(3,3,6)
plot(0:1:irf_len,labor_dis_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,labor_dis_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Labor Distortion')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(3,3,7)
plot(0:1:irf_len,infl_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,infl_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Inflation')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(3,3,8)
plot(0:1:irf_len,tp_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,tp_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Term Premium')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)
subplot(3,3,9)
plot(0:1:irf_len,bonds_exo(1:irf_len+1)', style(1,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len,bonds_endo(1:irf_len+1)', style(2,:), 'LineWidth',lw)
hold on
plot(0:1:irf_len, 0*(0:1:irf_len)', style(4,:), 'LineWidth',0.5)
hTitle=title('Gov Bonds held by FI')
set(hTitle,'FontSize',10)
set(gca,'FontSize',10)


% hL = legend('GK13', 'ET14', 'CFP17');
% newPosition = [0.4 -0.0725 0.2 0.2];
% newUnits = 'normalized';
% set(hL,'Position', newPosition,'Units', newUnits,'Orientation', 'Horizontal', 'FontSize', 10);
% legend('boxoff')
% print('C:\Dropbox\Research Plan\Master Thesis\comp_graphs\MP_var', '-depsc')
% print('C:\Dropbox\Research Plan\Master Thesis\comp_graphs\MP_var', '-djpeg')




%%
save('Trial_1')
cd ../