clear
close all 
clc

% Calibrations
cd([cd '/NK_DEFK17_rep']);

%No intervention Great Recession Calibration
    
dynare DEFK_noint_GE

infl(1) = round(infl(1));

% Price level (assume P(0) = 1)
P_noint(1) = infl(1);

for i = 2:length(infl)
    P_noint(i) = infl(i) * P_noint(i-1);
end

% Nominal value of capital
PQK = P_noint'.* QK;
% Nominal value of liquidity
PB = P_noint'.* LY.* Y;
% Real value of liquidity
B = LY.* Y;

Y_noint    = 100 * log(Y / Y(1));
GDP_noint  = 100 * log(GDP / GDP(1));
C_noint    = 100 * log(C / C(1));
Inv_noint  = 100 * log(Inv / Inv(1));
Spr_noint  = 40000 * Spr;
Q_noint    = 100 * log(Q / Q(1));
PQK_noint  = 100 * log(PQK / PQK(1));
PB_noint   = 100 * log(PB / PB(1));
B_noint    = 100 * log(B / B(1));
BY_noint   = 100 * log(LY / LY(1));
Ng_noint   = 100 * Q_ss * Ng /(4 * Y_ss);
infl_noint = 100 * (infl.^4 - 1);
R_noint    = 100 * (R.^4 - 1);

ERQ_noint  = 100 * (ERQ.^4 - 1);
rr_noint   = 100 * (rr.^4 - 1);
pI_noint   = 100 * log(pI / pI(1));
rK_noint   = 400 * rK;
RK_noint   = 400 * RK;
CY_noint   = 400 * CY;
CY2_noint  = 100 * (rr0.^4 - rr.^4); 

Y_lev_noint = Y;


    
save AR_noint_GE Y_noint GDP_noint C_noint Inv_noint Spr_noint Q_noint...
        Ng_noint infl_noint R_noint ERQ_noint rr_noint pI_noint...
            rK_noint RK_noint CY_noint CY2_noint Y_lev_noint P_noint...
                PQK_noint PB_noint...

clear
    
% No intervention

dynare DEFK_noint

infl(1) = round(infl(1));

% Price level (assume P(0) = 1)
P_noint(1) = infl(1);

for i = 2:length(infl)
    P_noint(i) = infl(i) * P_noint(i-1);
end

% Nominal value of capital
PQK = P_noint'.* QK;
% Nominal value of liquidity
PB = P_noint'.* LY.* Y;
% Real value of liquidity
B = LY.* Y;

Y_noint    = 100 * log(Y / Y(1));
GDP_noint  = 100 * log(GDP / GDP(1));
C_noint    = 100 * log(C / C(1));
Inv_noint  = 100 * log(Inv / Inv(1));
Spr_noint  = 40000 * Spr;
Q_noint    = 100 * log(Q / Q(1));
PQK_noint  = 100 * log(PQK / PQK(1));
PB_noint   = 100 * log(PB / PB(1));
B_noint    = 100 * log(B / B(1));
BY_noint   = 100 * log(LY / LY(1));
Ng_noint   = 100 * Q_ss * Ng /(4 * Y_ss);
infl_noint = 100 * (infl.^4 - 1);
R_noint    = 100 * (R.^4 - 1);

ERQ_noint  = 100 * (ERQ.^4 - 1);
rr_noint   = 100 * (rr.^4 - 1);
pI_noint   = 100 * log(pI / pI(1));
rK_noint   = 400 * rK;
RK_noint   = 400 * RK;
CY_noint   = 400 * CY;
CY2_noint  = 100 * (rr0.^4 - rr.^4); 

Y_lev_noint = Y;


    
save AR_noint Y_noint GDP_noint C_noint Inv_noint Spr_noint Q_noint... 
        Ng_noint infl_noint R_noint ERQ_noint rr_noint pI_noint...
            rK_noint RK_noint CY_noint CY2_noint Y_lev_noint P_noint...
                PQK_noint PB_noint B_noint BY_noint...




clear

% Intervention Great Recession

dynare DEFK_int_GE

infl(1) = round(infl(1));

% Price level (assume P(0) = 1)
P_int(1) = infl(1);

for i = 2:length(infl)
    P_int(i) = infl(i) * P_int(i-1);
end

% Nominal value of capital
PQK = P_int'.* QK;
% Nominal value of liquidity
PB = P_int'.* LY.* Y;
% Real value of liquidity
B = LY.* Y;

Y_int    = 100 * log(Y / Y(1));
GDP_int  = 100 * log(GDP / GDP(1));
C_int    = 100 * log(C / C(1));
Inv_int  = 100 * log(Inv / Inv(1));
Spr_int  = 40000 * Spr;
Q_int    = 100 * log(Q / Q(1));
PQK_int  = 100 * log(PQK / PQK(1));
PB_int   = 100 * log(PB / PB(1));
B_int    = 100 * log(B / B(1));
BY_int   = 100 * log(LY / LY(1));
Ng_int   = 100 * Q_ss * Ng /(4 * Y_ss);
infl_int = 100 * (infl.^4 - 1);
R_int    = 100 * (R.^4 - 1);

ERQ_int  = 100 * (ERQ.^4 - 1);
rr_int   = 100 * (rr.^4 - 1);
pI_int   = 100 * log(pI / pI(1));
rK_int   = 400 * rK;
RK_int   = 400 * RK;
CY_int   = 400 * CY;
CY2_int  = 100 * (rr0.^4 - rr.^4); 

Y_lev_int  = Y;
Ng_lev_int = Ng;
Q_lev_int  = Q;
B_lev_int  = B;
rr_lev_int = rr;
RK_lev_int = RK;
ERQ_lev_int = ERQ;
    
save AR_int_GE Y_int GDP_int C_int Inv_int Spr_int Q_int PQK_int PB_int Ng_int...
        B_int BY_int infl_int R_int ERQ_int ERQ_lev_int rr_int pI_int...
            rK_int RK_int CY_int CY2_int...
                Y_lev_int Ng_lev_int Q_lev_int P_int B_lev_int rr_lev_int RK_lev_int

% Intervention

dynare DEFK_int

infl(1) = round(infl(1));

% Price level (assume P(0) = 1)
P_int(1) = infl(1);

for i = 2:length(infl)
    P_int(i) = infl(i) * P_int(i-1);
end

% Nominal value of capital
PQK = P_int'.* QK;
% Nominal value of liquidity
PB = P_int'.* LY.* Y;
% Real value of liquidity
B = LY.* Y;

Y_int    = 100 * log(Y / Y(1));
GDP_int  = 100 * log(GDP / GDP(1));
C_int    = 100 * log(C / C(1));
Inv_int  = 100 * log(Inv / Inv(1));
Spr_int  = 40000 * Spr;
Q_int    = 100 * log(Q / Q(1));
PQK_int  = 100 * log(PQK / PQK(1));
PB_int   = 100 * log(PB / PB(1));
B_int    = 100 * log(B / B(1));
BY_int   = 100 * log(LY / LY(1));
Ng_int   = 100 * Q_ss * Ng /(4 * Y_ss);
infl_int = 100 * (infl.^4 - 1);
R_int    = 100 * (R.^4 - 1);

ERQ_int  = 100 * (ERQ.^4 - 1);
rr_int   = 100 * (rr.^4 - 1);
pI_int   = 100 * log(pI / pI(1));
rK_int   = 400 * rK;
RK_int   = 400 * RK;
CY_int   = 400 * CY;
CY2_int  = 100 * (rr0.^4 - rr.^4); 

Y_lev_int  = Y;
Ng_lev_int = Ng;
Q_lev_int  = Q;
B_lev_int  = B;
rr_lev_int = rr;
RK_lev_int = RK;
ERQ_lev_int = ERQ;
    
save AR_int Y_int GDP_int C_int Inv_int Spr_int Q_int PQK_int PB_int Ng_int...
        B_int BY_int infl_int R_int ERQ_int ERQ_lev_int rr_int pI_int...
            rK_int RK_int CY_int CY2_int...
                Y_lev_int Ng_lev_int Q_lev_int P_int B_lev_int rr_lev_int RK_lev_int


%% Figure 4

xlimit = [1 16];
xtickey = [5 10 15];
    
% Model variables in Figure 4

figure(1)
subplot(2,2,1);
hold on
plot(1:302,Y_int,'Color','b','LineWidth',4);
title('Output','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('% \Delta from s.s.', 'FontWeight','bold')
yticks([-5:1:0]);
ylim([-5 0])
axis square


subplot(2,2,2);
hold on
plot(1:302,infl_int,'Color','b','LineWidth',4);
title('Inflation','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('annualized % \Delta from s.s.', 'FontWeight','bold')
yticks([-3:1:0])
ylim([-3 0])
axis square

subplot(2,2,[3 4]);
hold on
plot(1:302,R_int,'Color','b','LineWidth',4);
title('Nominal Interest Rate','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel({'annualized p.p. (level)'},...
    'FontWeight','bold', 'FontSize',12)
yticks([0:0.5:2.5])
ylim([0 2.5])
axis square
hold on
set(gcf,'PaperPositionMode','auto')
print('-dpng','-r0','../fig4.png')


close all

%% Figure 5
figure(1);
subplot(2,2,1);
hold on
plot(1:302,C_int,'Color','b','LineWidth',4);
title('Consumption','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel({'% \Delta from s.s.'},...
    'FontWeight','bold', 'FontSize',12)
yticks([-1.5:0.5:0])
ylim([-1.5 0])
axis square

subplot(2,2,2);
hold on
plot(1:302,Inv_int,'Color','b','LineWidth',4);
title('Investment','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel({'% \Delta from s.s.'},...
    'FontWeight','bold', 'FontSize',12)
yticks([-15:5:0])
ylim([-15 0])
axis square

subplot(2,2,3);
hold on
plot(1:302,100*(CY2_int-CY2_int(1)),'Color','b','LineWidth',4);
title('Convenience Yield','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel({'annualized b.p. \Delta from s.s.'},...
    'FontWeight','bold', 'FontSize',12)
yticks([0:50:200])
ylim([0 200])
axis square
 

subplot(2,2,4);
hold on
plot(1:302,PQK_int,'Color','b','LineWidth',4);
title('Value of Capital','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel({'% \Delta from s.s.'},...
    'FontWeight','bold', 'FontSize',12)
yticks([-5:1:0])
ylim([-5 0])
axis square
set(gcf,'PaperPositionMode','auto')
print('-dpng','-r0','../fig5.png')

close all
clear


%% Figure 6
xlimit = [1 16];
xtickey = [5 10 15];

load AR_int
load AR_noint
figure(1)
subplot(1,2,1);
hold on
plot(1:302,Y_int-Y_noint,'Color','b','LineWidth',4);
title('Baseline');
hold on
plot(1:302,infl_int-infl_noint,'--','Color','r','LineWidth',4);
hold off
xlim(xlimit)
xticks(xtickey)
ylabel({'% \Delta from s.s.'},...
    'FontWeight','bold', 'FontSize',12)
yticks([0:0.5:2])
ylim([-0.1 2])
legend('Output','Inflation');
axis square

load AR_int_GE
load AR_noint_GE
subplot(1,2,2);
hold on
plot(1:302,Y_int-Y_noint,'Color','b','LineWidth',4);
title('Great Escape');
hold on
plot(1:302,infl_int-infl_noint,'--','Color','r','LineWidth',4);
hold off
xlim(xlimit)
xticks(xtickey)
ylabel({'% \Delta from s.s.'},...
    'FontWeight','bold', 'FontSize',12)
yticks([0:2:10])
ylim([0 10])
axis square
set(gcf,'PaperPositionMode','auto')
print('-dpng','-r0','../fig6.png')


%% Figure 7
clear
close all

dynare DEFK_flex_noint

% Define variables of interest
Y_noint_flex    = 100 * log(Y / Y(1));
C_noint_flex    = 100 * log(C / C(1));
Inv_noint_flex  = 100 * log(Inv / Inv(1));
R_noint_flex    = 100 * (R.^4 - 1);

% Load baseline simulation without intervention

load AR_noint

limx = [1 16]; % Quarters to be plotted
xtickey = [5 10 15];
figure(1)

subplot(2,2,1); % Output
plot(Y_noint,'Color','b','LineWidth',4); 
hold on
plot(Y_noint_flex,'r--','LineWidth',4);
hold off
title('Output','FontSize',14);
xlim(limx)
xticks(xtickey)
ylabel('% \Delta from s.s.','FontWeight','bold')
yticks([-6:2:0])
ylim([-6 0])
box(subplot(2,2,1),'on');
set(subplot(2,2,1),'FontWeight','bold');

subplot(2,2,2); % Investment
plot(Inv_noint,'Color','b','LineWidth',4); 
hold on
plot(Inv_noint_flex,'r--','LineWidth',4);
hold off
title('Investment','FontSize',14);
xlim(limx)
xticks(xtickey)
box(subplot(2,2,2),'on');
set(subplot(2,2,2),'FontWeight','bold');
yticks([-20:5:0])
ylim([-20 0])

subplot(2,2,3); % Consumption
plot(C_noint,'Color','b','LineWidth',4); 
hold on
plot(C_noint_flex,'r--','LineWidth',4);
hold off
title('Consumption','FontSize',14);
xlim(limx)
xticks(xtickey)
ylabel('% \Delta from s.s.','FontWeight','bold')
box(subplot(2,2,3),'on');
set(subplot(2,2,3),'FontWeight','bold');
yticks([-3:1:2.5])
ylim([-3 2.5])

subplot(2,2,4); % Real rate
plot(rr_noint,'Color','b','LineWidth',4); 
hold on
plot(R_noint_flex,'r--','LineWidth',4);
plot(rr_noint(1)*ones(length(rr_noint),1),'k--','LineWidth',2);
hold off
title('Real Interest Rate','FontSize',14);
xlim(limx)
xticks(xtickey)
ylabel({'annualized p.p.', '(level)'},'FontWeight','bold')
box(subplot(2,2,4),'on');
set(subplot(2,2,4),'FontWeight','bold');
yticks([-2:1:3.5])
ylim([-2 3.5])

% Add legend

leg1 = legend('Sticky','Flexible','Orientation','horizontal');
legend boxoff
set(leg1,'Position',[0.5 0 0.01 0.05]);

% Save figure

set(gcf,'PaperPositionMode','auto')
print('-dpng','-r0','../fig7.png')

clear 
close all

%% Figure 8
clear
close all
clc

dynare DEFK_nozlb_noint

Y_noint_nozlb    = 100 * (Y / Y(1) - 1);
R_noint_nozlb    = 100 * (R.^4 - 1);
rr_noint_nozlb   = 100 * (rr.^4 - 1);

save AR_noint_nozlb Y_noint_nozlb R_noint_nozlb rr_noint_nozlb 

% Run simulation without ZLB and with intervention

dynare DEFK_nozlb_int

Y_int_nozlb    = 100 * (Y / Y(1) - 1);
R_int_nozlb    = 100 * (R.^4 - 1);
rr_int_nozlb   = 100 * (rr.^4 - 1);

load AR_noint_nozlb

limx = [1 16]; % Quarters to be plotted
xtickey = [5 10 15];

figure(1)

subplot(2,2,1); % Output without ZLB
plot(Y_int_nozlb,'Color','b','LineWidth',4); 
hold on
plot(Y_noint_nozlb,'r--','LineWidth',4); 
hold off
title('Output','FontSize',14);
xlim(limx)
xticks(xtickey)
ylabel('% \Delta from s.s.')
yticks([-3:1:0])
% ylim([-3 0])
axis square
box(subplot(2,2,1),'on');
set(subplot(2,2,1),'FontWeight','bold');

subplot(2,2,2); % Nominal Interest Rate without ZLB
plot(R_int_nozlb,'Color','b','LineWidth',4);  
hold on
plot(R_noint_nozlb,'r--','LineWidth',4); 
plot(R_noint_nozlb(1)*ones(length(R_noint_nozlb),1),'k--','LineWidth',2);
hold off
title('Nominal Interest Rate','FontSize',14);
xlim(limx)
xticks(xtickey)
ylabel('annualized p.p.')
yticks([-3:1:2])
ylim([-3.5 2])
axis square
box(subplot(2,2,2),'on');
set(subplot(2,2,2),'FontWeight','bold');

subplot(2,2,[3 4]); % Real Interest Rate without ZLB
plot(rr_int_nozlb,'Color','b','LineWidth',4); 
hold on
plot(rr_noint_nozlb,'r--','LineWidth',4); 
plot(rr_noint_nozlb(1)*ones(length(rr_noint_nozlb),1),'k--','LineWidth',2);
hold off
title('Real Interest Rate','FontSize',14);
xlim(limx)
xticks(xtickey)
ylabel('annualized p.p.')
axis square
yticks([-2:1:3])
ylim([-2 3])
box(subplot(2,2,[3 4]),'on');
set(subplot(2,2,[3 4]),'FontWeight','bold');

% Add legend

leg2 = legend('With intervention','Without intervention','Orientation','horizontal','FontSize',14);
legend boxoff
set(leg2,'Position',[0.5 0 0.01 0.05]);

set(gcf,'PaperPositionMode','auto')
print('-dpng','-r0','../fig8.png')

%% Figure A1

clear
close all

dynare productivity_shock

log_infl(1) = 0;


xlimit = [1 16];
xtickey = [2:2:16];

figure(1)

subplot(2,3,1);
hold on
plot(1:302,log_y,'Color','b','LineWidth',4);
title('Output','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('% \Delta from s.s.', 'FontWeight','bold')
yticks([0:0.05:0.45]);
ylim([0 0.45])
axis square


subplot(2,3,2);
hold on
plot(1:302,log_infl,'Color','b','LineWidth',4);
title('Inflation','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('annualized p.p', 'FontWeight','bold')
yticks([-0.8:0.1:0])
ylim([-0.8 0])
axis square

subplot(2,3,3);
hold on
plot(1:302,log_r,'Color','b','LineWidth',4);
title('Nominal Interest Rate','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel({'annualized p.p.'},...
    'FontWeight','bold')
yticks([-0.9:0.1:0])
ylim([-0.9 0])
axis square


subplot(2,3,4);
hold on
plot(1:302,log_c,'Color','b','LineWidth',4);
title('Consumption','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('% \Delta from s.s.', 'FontWeight','bold')
yticks([0:0.05:0.45]);
ylim([0 0.45])
axis square

subplot(2,3,5);
hold on
plot(1:302,log_inv,'Color','b','LineWidth',4);
title('Investement','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('% \Delta from s.s.', 'FontWeight','bold')
yticks([0:0.1:0.6]);
ylim([0 0.6])
axis square

subplot(2,3,6);
hold on
plot(1:302,log_tfp,'Color','b','LineWidth',4);
title('TFP','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('% \Delta from s.s.', 'FontWeight','bold')
yticks([0:0.05:0.45]);
ylim([0 0.45])
axis square

hold on
set(gcf,'PaperPositionMode','auto')
print('-dpng','-r0','../figA1.png')


% Figure A2
clear
close all

dynare monetary_shock

log_infl(1) = 0;


xlimit = [1 16];
xtickey = [2:2:16];

figure(1)

subplot(2,3,1);
hold on
plot(1:302,log_y,'Color','b','LineWidth',4);
title('Output','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('% \Delta from s.s.', 'FontWeight','bold')
yticks([-0.16:0.02:0]);
ylim([-0.16 0])
axis square


subplot(2,3,2);
hold on
plot(1:302,log_infl,'Color','b','LineWidth',4);
title('Inflation','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('annualized p.p', 'FontWeight','bold')
yticks([-0.12:0.02:0])
ylim([-0.12 0])
axis square

subplot(2,3,3);
hold on
plot(1:302,log_r,'Color','b','LineWidth',4);
title('Nominal Interest Rate','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel({'annualized p.p.'},...
    'FontWeight','bold')
yticks([0:0.01:0.06])
ylim([0 0.06])
axis square


subplot(2,3,4);
hold on
plot(1:302,log_c,'Color','b','LineWidth',4);
title('Consumption','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('% \Delta from s.s.', 'FontWeight','bold')
yticks([-0.16:0.02:0]);
ylim([-0.16 0])
axis square

subplot(2,3,5);
hold on
plot(1:302,log_inv,'Color','b','LineWidth',4);
title('Investement','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('% \Delta from s.s.', 'FontWeight','bold')
yticks([-0.15:0.05:0]);
ylim([-0.15 0])
axis square

subplot(2,3,6);
hold on
plot(1:302,sqrt(iot)*1000,'Color','b','LineWidth',4);
title('Monetary Policy Shock','FontSize',14);
xlim(xlimit)
xticks(xtickey)
ylabel('annualized bps', 'FontWeight','bold')
yticks([-5:5:25]);
ylim([-5 25])
axis square

hold on
set(gcf,'PaperPositionMode','auto')
print('-dpng','-r0','../figA2.png')
close all