clear all;
close all;
clc;

%SMOE_TANK_old = load('SMOE_TANK_results_TANK.mat');
%SMOE_RANK     = load('SMOE_TANK_results_RANK.mat');
%SMOE_TANK_old = load('SMOE_TANK_results_TANK.mat');
%SMOE_RANK     = load('SMOE_TANK_results.mat');

%dynare Gas_RANK;
dynare Gas_TANK   -DRamsey=0   -DCOBBD=0 nostrict;    % TANK with Taylor, CES
dynare Gas_RANK   -DRamsey=0   -DCOBBD=0 nostrict;    % RANK with Taylor, CES



%%

robs_ann_target = 2.25/4;
r_ss            = exp(robs_ann_target/100);
pistar          = 1.005;
cbeta           = pistar/r_ss;

%r_ss           = pistar/cbeta;
rf_ss           = r_ss;
robs_ss         = 100*(log(r_ss));

%--------------------------------------------------------------------------
line_color_1     = rgb('blue');
line_thickness_1 = 1.75;
line_style_1     = '-';

line_color_2     = rgb('Red');
line_thickness_2 = 1.75;
line_style_2     = '-';


font_size_title_full  = 11;
font_size_legend      = 10;
font_size_legend_2    = 7;

marker_size1      = 5;
marker_size2      = 4;

marker_vec        = [2:2:20];

font_size_ylabel = 7;


%horizon_plot = 20;
%horizon_plot = 40;
%horizon_plot = 100;
horizon_plot  = 20;

nfig=0;

nfig=nfig+1;
figure(nfig)

subplot(2,3,1)
line1=plot(100.*oo_TANK_Taylor_.irfs.pEf_eta_pEf',line_style_1,'LineWidth',line_thickness_1,'Color',line_color_1);
hold on
line2=plot(100.*oo_RANK_Taylor_.irfs.pEf_eta_pEf',line_style_2,'LineWidth',line_thickness_2,'Color',line_color_2);
hold on
yline(0,'-k')
xticks([0:4:horizon_plot]) 
xlim([0 horizon_plot])
yticks([0:25:100]) 
grid off
ylabel('$\%$ dev from SS','fontsize',font_size_ylabel,'Interpreter','latex')
title({'Global Energy Price'},'fontsize',font_size_title_full,'Interpreter','latex')


subplot(2,3,2)
plot( 100.*(1.02+oo_TANK_Taylor_.irfs.Pi_CPI_ann_eta_pEf'-1),line_style_1,'LineWidth',line_thickness_1,'Color',line_color_1);
hold on
plot( 100.*(1.02+oo_RANK_Taylor_.irfs.Pi_CPI_ann_eta_pEf'-1),line_style_2,'LineWidth',line_thickness_2,'Color',line_color_2);
hold on
yline(2,'-k')
xticks([0:4:horizon_plot])
xlim([0 horizon_plot])
%yticks([-2:2:10]) 
ylim([1 5])
grid off
ylabel('ann pp','fontsize',font_size_ylabel,'Interpreter','latex')
title('CPI Inflation','fontsize',font_size_title_full,'Interpreter','latex')



subplot(2,3,3)
line1=plot( (oo_TANK_Taylor_.irfs.output_gap_eta_pEf'),line_style_1,'LineWidth',line_thickness_1,'Color',line_color_1);
hold on
line2=plot( (oo_RANK_Taylor_.irfs.output_gap_eta_pEf'),line_style_2,'LineWidth',line_thickness_2,'Color',line_color_2);
hold on
yline(0,'-k')
xticks([0:4:horizon_plot]) 
xlim([0 horizon_plot])
%yticks([-1:0.5:1]) 
%ylim([-1 1])
grid off
ylabel('pp','fontsize',font_size_ylabel,'Interpreter','latex')
title('Output Gap','fontsize',font_size_title_full,'Interpreter','latex')


subplot(2,3,4)
line1=plot( 100*(oo_TANK_Taylor_.irfs.N_flex_eta_pEf'),line_style_1,'LineWidth',line_thickness_1,'Color',line_color_1);
hold on
line2=plot( 100*(oo_TANK_Taylor_.irfs.N_eta_pEf'),'-.','LineWidth',line_thickness_1,'Color',line_color_1);
hold on
yline(0,'-k')
xticks([0:4:horizon_plot]) 
xlim([0 horizon_plot])
%yticks([-1:0.5:1]) 
%ylim([-1 1])
grid off
ylabel('pp','fontsize',font_size_ylabel,'Interpreter','latex')
title('TANK Flex Output','fontsize',font_size_title_full,'Interpreter','latex')
legend([line1,line2],{'Flex Price Output','Output'},'Location','SouthEast','fontsize',7,'Interpreter','latex')

subplot(2,3,5)
line1=plot( 400*(pistar/cbeta-1+oo_TANK_Taylor_.irfs.R_nom_eta_pEf'),line_style_1,'LineWidth',line_thickness_1,'Color',line_color_1);
hold on
line2=plot( 400*(pistar/cbeta-1+oo_RANK_Taylor_.irfs.R_nom_eta_pEf'),line_style_2,'LineWidth',line_thickness_2,'Color',line_color_2);
hold on
%yline(0,'-k')
yline(2.25,'-k')
xticks([0:4:horizon_plot]) 
xlim([0 horizon_plot])
%yticks([1:1:7]) 
%ylim([1 7])
grid off
ylabel('ann pp','fontsize',font_size_ylabel,'Interpreter','latex')
title('Nominal Interest Rate','fontsize',font_size_title_full,'Interpreter','latex')
legend([line1,line2],{'TANK','RANK'},'Location','NorthEast','fontsize',font_size_legend_2,'Interpreter','latex')

subplot(2,3,6)
line1=plot( 400*(1/cbeta-1+oo_TANK_Taylor_.irfs.R_real_eta_pEf'),line_style_1,'LineWidth',line_thickness_1,'Color',line_color_1);
hold on
line2=plot( 400*(1/cbeta-1+oo_RANK_Taylor_.irfs.R_real_eta_pEf'),line_style_2,'LineWidth',line_thickness_2,'Color',line_color_2);
hold on
yline(0.25,'-k')
xticks([0:4:horizon_plot]) 
xlim([0 horizon_plot])
%yticks([-2:1:3]) 
%ylim([-2.5 3])
grid off
ylabel('ann pp','fontsize',font_size_ylabel,'Interpreter','latex')
title('Real Interest Rate','fontsize',font_size_title_full,'Interpreter','latex')



