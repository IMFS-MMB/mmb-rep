clear all
close all
clc

%% Adjust path to folder where replication file is stored
cd([cd '/US_CFOP14_rep']);


%% Run JPM Model

dynare US_CFOP14_repJPT

periods = options_.irf ;

X = zeros(12,periods,4);
X(1,:,1)	=	oo_.irfs.gdp_upsilons	;
X(2,:,1)	=	oo_.irfs.c_upsilons	;
X(3,:,1)	=	oo_.irfs.i_upsilons	;
X(4,:,1)	=	oo_.irfs.p_upsilons*4	;
X(5,:,1)	=	oo_.irfs.w_upsilons	;
X(6,:,1)	=	oo_.irfs.R_upsilons*4	;
X(9,:,1)	=	oo_.irfs.q_upsilons	;
X(10,:,1)	=	oo_.irfs.Rk_upsilons*4	;

X(1,:,4)	=	oo_.irfs.gdp_Rs	;
X(2,:,4)	=	oo_.irfs.c_Rs	;
X(3,:,4)	=	oo_.irfs.i_Rs	;
X(4,:,4)	=	oo_.irfs.p_Rs*4	;
X(5,:,4)	=	oo_.irfs.w_Rs	;
X(6,:,4)	=	oo_.irfs.R_Rs*4	;
X(9,:,4)	=	oo_.irfs.q_Rs	;
X(10,:,4)	=	oo_.irfs.Rk_Rs*4	;

X(7,:,1)	=	zeros(1,periods)	;
X(8,:,1)	=	zeros(1,periods)	;
X(11,:,1)	=	zeros(1,periods)	;
X(12,:,1)	=	zeros(1,periods)	;
X(:,:,2)	=	zeros(12,periods)	;
X(:,:,3)	=	zeros(12,periods)	;
X(7,:,4)	=	zeros(1,periods)	;
X(8,:,4)	=	zeros(1,periods)	;
X(11,:,4)	=	zeros(1,periods)	;
X(12,:,4)	=	zeros(1,periods)	;

save('JPT_IRFs');


%% Run BGG Model

dynare US_CFOP14_repBGG

periods = options_.irf ;

Y = zeros(12,periods,4);
Y(1,:,1)	=	oo_.irfs.gdp_upsilons	;
Y(2,:,1)	=	oo_.irfs.c_upsilons	;
Y(3,:,1)	=	oo_.irfs.i_upsilons	;
Y(4,:,1)	=	oo_.irfs.p_upsilons*4	;
Y(5,:,1)	=	oo_.irfs.w_upsilons	;
Y(6,:,1)	=	oo_.irfs.R_upsilons*4	;
Y(7,:,1)	=	oo_.irfs.spr_upsilons	;
Y(8,:,1)	=	oo_.irfs.nw_upsilons	;
Y(9,:,1)	=	oo_.irfs.q_upsilons	;
Y(10,:,1)	=	oo_.irfs.Rk_upsilons*4	;
Y(11,:,1)	=	oo_.irfs.promz_upsilons*4	;
Y(12,:,1)	=	oo_.irfs.credit_upsilons	;

Y(1,:,2)	=	oo_.irfs.gdp_nws	;
Y(2,:,2)	=	oo_.irfs.c_nws	;
Y(3,:,2)	=	oo_.irfs.i_nws	;
Y(4,:,2)	=	oo_.irfs.p_nws*4	;
Y(5,:,2)	=	oo_.irfs.w_nws	;
Y(6,:,2)	=	oo_.irfs.R_nws*4	;
Y(7,:,2)	=	oo_.irfs.spr_nws	;
Y(8,:,2)	=	oo_.irfs.nw_nws	;
Y(9,:,2)	=	oo_.irfs.q_nws	;
Y(10,:,2)	=	oo_.irfs.Rk_nws*4	;
Y(11,:,2)	=	oo_.irfs.promz_nws*4	;
Y(12,:,2)	=	oo_.irfs.credit_nws ;

Y(1,:,3)	=	oo_.irfs.gdp_efps	;
Y(2,:,3)	=	oo_.irfs.c_efps	;
Y(3,:,3)	=	oo_.irfs.i_efps	;
Y(4,:,3)	=	oo_.irfs.p_efps*4	;
Y(5,:,3)	=	oo_.irfs.w_efps	;
Y(6,:,3)	=	oo_.irfs.R_efps*4	;
Y(7,:,3)	=	oo_.irfs.spr_efps	;
Y(8,:,3)	=	oo_.irfs.nw_efps	;
Y(9,:,3)	=	oo_.irfs.q_efps	;
Y(10,:,3)	=	oo_.irfs.Rk_efps*4	;
Y(11,:,3)	=	oo_.irfs.promz_efps*4	;
Y(12,:,3)	=	oo_.irfs.credit_efps ;

Y(1,:,4)	=	oo_.irfs.gdp_Rs	;
Y(2,:,4)	=	oo_.irfs.c_Rs	;
Y(3,:,4)	=	oo_.irfs.i_Rs	;
Y(4,:,4)	=	oo_.irfs.p_Rs*4	;
Y(5,:,4)	=	oo_.irfs.w_Rs	;
Y(6,:,4)	=	oo_.irfs.R_Rs*4	;
Y(7,:,4)	=	oo_.irfs.spr_Rs	;
Y(8,:,4)	=	oo_.irfs.nw_Rs	;
Y(9,:,4)	=	oo_.irfs.q_Rs	;
Y(10,:,4)	=	oo_.irfs.Rk_Rs*4	;
Y(11,:,4)	=	oo_.irfs.promz_Rs*4	;
Y(12,:,4)	=	oo_.irfs.credit_Rs ;

save('BGG_IRFs');


%% Run Rk Indexation Model

dynare US_CFOP14_repRk_index

periods = options_.irf ;

Z = zeros(11,periods,4);
Z(1,:,1)	=	oo_.irfs.gdp_upsilons	;
Z(2,:,1)	=	oo_.irfs.c_upsilons	;
Z(3,:,1)	=	oo_.irfs.i_upsilons	;
Z(4,:,1)	=	oo_.irfs.p_upsilons*4	;
Z(5,:,1)	=	oo_.irfs.w_upsilons	;
Z(6,:,1)	=	oo_.irfs.R_upsilons*4	;
Z(7,:,1)	=	oo_.irfs.spr_upsilons	;
Z(8,:,1)	=	oo_.irfs.nw_upsilons	;
Z(9,:,1)	=	oo_.irfs.q_upsilons	;
Z(10,:,1)	=	oo_.irfs.Rk_upsilons*4	;
Z(11,:,1)	=	oo_.irfs.promz_upsilons*4	;
Z(12,:,1)	=	oo_.irfs.credit_upsilons	;

Z(1,:,2)	=	oo_.irfs.gdp_nws	;
Z(2,:,2)	=	oo_.irfs.c_nws	;
Z(3,:,2)	=	oo_.irfs.i_nws	;
Z(4,:,2)	=	oo_.irfs.p_nws*4	;
Z(5,:,2)	=	oo_.irfs.w_nws	;
Z(6,:,2)	=	oo_.irfs.R_nws*4	;
Z(7,:,2)	=	oo_.irfs.spr_nws	;
Z(8,:,2)	=	oo_.irfs.nw_nws	;
Z(9,:,2)	=	oo_.irfs.q_nws	;
Z(10,:,2)	=	oo_.irfs.Rk_nws*4	;
Z(11,:,2)	=	oo_.irfs.promz_nws*4	;
Z(12,:,2)	=	oo_.irfs.credit_nws ;

Z(1,:,3)	=	oo_.irfs.gdp_efps	;
Z(2,:,3)	=	oo_.irfs.c_efps	;
Z(3,:,3)	=	oo_.irfs.i_efps	;
Z(4,:,3)	=	oo_.irfs.p_efps*4	;
Z(5,:,3)	=	oo_.irfs.w_efps	;
Z(6,:,3)	=	oo_.irfs.R_efps*4	;
Z(7,:,3)	=	oo_.irfs.spr_efps	;
Z(8,:,3)	=	oo_.irfs.nw_efps	;
Z(9,:,3)	=	oo_.irfs.q_efps	;
Z(10,:,3)	=	oo_.irfs.Rk_efps*4	;
Z(11,:,3)	=	oo_.irfs.promz_efps*4	;
Z(12,:,3)	=	oo_.irfs.credit_efps ;

Z(1,:,4)	=	oo_.irfs.gdp_Rs	;
Z(2,:,4)	=	oo_.irfs.c_Rs	;
Z(3,:,4)	=	oo_.irfs.i_Rs	;
Z(4,:,4)	=	oo_.irfs.p_Rs*4	;
Z(5,:,4)	=	oo_.irfs.w_Rs	;
Z(6,:,4)	=	oo_.irfs.R_Rs*4	;
Z(7,:,4)	=	oo_.irfs.spr_Rs	;
Z(8,:,4)	=	oo_.irfs.nw_Rs	;
Z(9,:,4)	=	oo_.irfs.q_Rs	;
Z(10,:,4)	=	oo_.irfs.Rk_Rs*4	;
Z(11,:,4)	=	oo_.irfs.promz_Rs*4	;
Z(12,:,4)	=	oo_.irfs.credit_Rs ;

save('CFOP_IRFs');


%% Build Plots

load('JPT_IRFs');
load('BGG_IRFs');
load('CFOP_IRFs');
periods = options_.irf ;
titles = ['     Output       '; '   Consumption    '; '   Investment     '; '    Inflation     '; '      Wages       '; '  Federal Funds   '; '      Spread      '; '     Net Worth    '; 'Price of Capital  '; 'Return on Capital '; 'Promised Repayment';  '      Credit      '];

ylimits = zeros(2,12,4);
ylimits(:,:,1) = [-0.1  -0.05  -1  -0.05  0  -0.1  -0.12   -0.8  -0.7  -2   -6   -2;
                  0.6   0.2    3   0.25   0.12   0.35  0.08  0.6  0.1  0.5   1   1.5];

ylimits(:,:,2) = [0   -0.1  -1  -0.02   -0.02   -0.02  -0.4   0   -0.1  -1  -1  -1.5;
                 1.2   0.6   6   0.12    0.16    1.2   0.05   3    0.9   4   5   1.5];
               
ylimits(:,:,3) = [-0.25  -0.12 -0.9  -0.16  -0.018  -0.08   0   -0.6  -0.3  -1.2  -2.5   -0.45;
                    0      0    0.1    0     0.002   0.04  0.4   0.4  0.05   0.6    1      0  ];
         

ylimits(:,:,4) = [-0.7 -0.45 -2.5  -0.25  -0.07  -0.1  -0.15  -1.2  -0.8  -3  -5   -1.2;
                    0    0    0.5   0.05   0.01   0.9   0.1    0.4   0.1  1.5  2     0 ];
                 

Shocks = ['Marginal Efficiency of Investment Shock'; 'Net Worth Shock                        '; 'Idiosyncratic Variance Shock           '; 'Monetary Policy Shock                  '];
for i = 1:4
    figure('NumberTitle','off','Name',Shocks(i,:));
    
    for j = 1:12
        
        subplot(4,3,j)
        plot(1:1:periods,zeros(1,periods),'-k',1:1:periods,X(j,:,i),'-g',1:1:periods,Y(j,:,i),'.r',1:1:periods,Z(j,:,i),'--b')
        xlabel('Periods')
        title(titles(j,:));
        ylim(ylimits(:,j,i)');
        
    end
    
    legend('Zero Line','JTP','BGG','Indexation to R^k');
    set(legend,'Orientation','horizontal',...
    'Position',[0.258058075679575 0.0131239595598583 0.491215226939971 0.0445859872611465]);
    
end
      
%% Go back to original path
cd('..');




