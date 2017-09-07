clear all
close all
clc

%% Adjust path to folder where replication file is stored
cd([cd '/US_JPT11_rep']);


%% Run JPM Model

dynare US_JPT11_rep

periods = options_.irf ;

X = zeros(7,periods);
X(1,:)	=	oo_.irfs.gdp_upsilons	;
X(2,:)	=	oo_.irfs.c_upsilons	;
X(3,:)	=	oo_.irfs.i_upsilons	;
X(4,:)	=	oo_.irfs.L_upsilons	;
X(5,:)	=	oo_.irfs.w_upsilons	;
X(6,:)	=	oo_.irfs.p_upsilons	;
X(7,:)	=	oo_.irfs.R_upsilons	;

titles = ['        Output           '; '      Consumption        '; '      Investment         ';  '         Hours           ';  '       Real Wages        '; '       Inflation         '; '  Nominal Interest Rate  '];


ylimits = [0.4  -0.2   0     0     0    -0.02     0  ;
           1.8  0.8   8.5   1.6   0.45   0.1    0.25 ];
                 


figure('NumberTitle','off','Name','Marginal Efficiency of Investment Shock');    
 for j = 1:7
     subplot(4,2,j)
     plot(1:1:periods,X(j,:),'-k')
     xlabel('Periods')
     title(titles(j,:));
     ylim(ylimits(:,j)');
 end

      
%% Go back to original path
cd('..');




