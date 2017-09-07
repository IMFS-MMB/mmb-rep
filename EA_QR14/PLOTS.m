%GRAPHS

close all;
%run dynare code before plotting IRFs
run = 1;

if run ==1 
    %Simulating the models and saving the results
    dynare estimatedTR.mod 
    irf_estTR = oo_.irfs;
    save('RESULTS_estTR.mat', 'irf_estTR');    
    close all;
    clear;

    dynare optimalTR.mod  
    irf_optTR = oo_.irfs;
    save('RESULTS_optTR.mat', 'irf_optTR');    
    close all;
    clear;

    dynare optimalTRandREG.mod   
    irf_optTRoptREG = oo_.irfs;
    save('RESULTS_optTRoptREG.mat', 'irf_optTRoptREG');    
    close all;
    clear;
    % 
    % dynare optimalTRoptimalREGfinSHOCKS.mod  
    % irf_optTRoptREGfinSH = oo_.irfs;
    % save('RESULTS_optTRoptREGfinSH2nd.mat', 'irf_optTRoptREGfinSH');    
    % close all;
    % clear;
    % 
    % dynare optimalTRoptimalREGprefSHOCKS.mod  
    % irf_optTRoptREGprefSH = oo_.irfs;
    % save('RESULTS_optTRoptREGprefSH2nd.mat', 'irf_optTRoptREGprefSH');    
    % close all;
    % clear;
    % 
    % dynare optimalTRoptimalREGtechSHOCKS.mod  
    % irf_optTRoptREGtechSH = oo_.irfs;
    % save('RESULTS_optTRoptREGtechSH2nd.mat', 'irf_optTRoptREGtechSH');    
    % close all;
    % clear;
end;

%Loading the results (1st order approximation)
load RESULTS_estTR;
load RESULTS_optTR.mat;
load RESULTS_optTRoptREG.mat;

t=0:12;

norm1=(-0.25/4)^(-1)*irf_estTR.spread_s_e_risk_s(1);
% normalized such that spreads decline by 25 basis points on an annualized
% basis
norm2=(0.01)^(-1)*irf_estTR.dpd_s_e_prefd_s(1); 
% normalized such that nominal house prices increase by 1 percent in the
% periphery countries
norm3=0.0083;
% 1 SD permanent technology shock

%RISK SHOCK 
% normalized such that spreads decline by 25 basis points on an annualized
% basis
figure('Name','Risk Shock, Periphery','NumberTitle','off')
subplot(4,3,1)
plot(t,irf_estTR.y_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.y_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.y_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);
hold off
title('Y');

subplot(4,3,2)
plot(t,irf_estTR.y_s_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.y_s_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.y_s_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('Y^*');

subplot(4,3,3)
plot(t,irf_estTR.dpc_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpc_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpc_e_risk_s/norm1,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CPI INFLATION');

subplot(4,3,4)
plot(t,irf_estTR.dpc_s_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpc_s_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpc_s_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CPI INFLATION^*');

subplot(4,3,5)
plot(t,irf_estTR.dpd_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpd_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpd_e_risk_s/norm1,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('HP INFLATION');

subplot(4,3,6)
plot(t,irf_estTR.dpd_s_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpd_s_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpd_s_e_risk_s/norm1,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('HP INFLATION^*');
legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru', 'Location','NorthEast');


subplot(4,3,7)
plot(t,irf_estTR.r_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.r_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.r_e_risk_s/norm1,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('R');

subplot(4,3,8)
plot(t,irf_estTR.spread_int_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_int_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_int_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INTERNATIONAL SPREAD');

subplot(4,3,9)
plot(t,irf_estTR.spread_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('LENDING SPREAD');

subplot(4,3,10)
plot(t,irf_estTR.spread_s_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_s_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_s_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('LENDING SPREAD^*');

subplot(4,3,11)
plot(t,irf_estTR.CtoY_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.CtoY_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.CtoY_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1); hold off
title('CREDIT/GDP RATIO');

subplot(4,3,12)
plot(t,irf_estTR.CtoY_s_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.CtoY_s_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.CtoY_s_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CREDIT/GDP RATIO^*');
%legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru');

%HOUSING DEMAND SHOCK 
% normalized such that nominal house prices increase by 1 percent in the
% periphery countries
figure('Name','Housing Demand Shock, Periphery','NumberTitle','off')
subplot(4,3,1)
plot(t,irf_estTR.y_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.y_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.y_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('Y');

subplot(4,3,2)
plot(t,irf_estTR.y_s_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.y_s_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.y_s_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('Y^*');

subplot(4,3,3)
plot(t,irf_estTR.dpc_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpc_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpc_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CPI INFLATION');

subplot(4,3,4)
plot(t,irf_estTR.dpc_s_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpc_s_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpc_s_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CPI INFLATION^*');

subplot(4,3,5)
plot(t,irf_estTR.dpd_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpd_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpd_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('HP INFLATION');

subplot(4,3,6)
plot(t,irf_estTR.dpd_s_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpd_s_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpd_s_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('HP INFLATION^*');
legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru', 'Location','NorthEast');

subplot(4,3,7)
plot(t,irf_estTR.r_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.r_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.r_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('R');

subplot(4,3,8)
plot(t,irf_estTR.spread_int_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_int_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_int_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INTERNATIONAL SPREAD');

subplot(4,3,9)
plot(t,irf_estTR.spread_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('LENDING SPREAD');

subplot(4,3,10)
plot(t,irf_estTR.spread_s_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_s_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_s_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('LENDING SPREAD^*');

subplot(4,3,11)
plot(t,irf_estTR.CtoY_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.CtoY_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.CtoY_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CREDIT/GDP RATIO');

subplot(4,3,12)
plot(t,irf_estTR.CtoY_s_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.CtoY_s_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.CtoY_s_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CREDIT/GDP RATIO^*');
%legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru');

%UNIT ROOT TECH SHOCK
% 1 SD permanent technology shock
figure('Name','Unit Root Tech Shock','NumberTitle','off')
subplot(4,3,1)
plot(t,irf_estTR.y_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.y_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.y_e_tech+norm3,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('Y');

subplot(4,3,2)
plot(t,irf_estTR.y_s_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.y_s_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.y_s_e_tech+norm3,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('Y^*');

subplot(4,3,3)
plot(t,irf_estTR.dpc_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpc_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpc_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CPI INFLATION');

subplot(4,3,4)
plot(t,irf_estTR.dpc_s_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpc_s_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpc_s_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CPI INFLATION^*');

subplot(4,3,5)
plot(t,irf_estTR.dpd_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpd_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpd_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('HP INFLATION');

subplot(4,3,6)
plot(t,irf_estTR.dpd_s_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.dpd_s_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.dpd_s_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('HP INFLATION^*');

subplot(4,3,7)
plot(t,irf_estTR.r_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.r_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.r_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('R');

subplot(4,3,8)
plot(t,irf_estTR.spread_int_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_int_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_int_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INTERNATIONAL SPREAD');

subplot(4,3,9)
plot(t,irf_estTR.spread_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('LENDING SPREAD');
legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru', 'Location','SouthEast');

subplot(4,3,10)
plot(t,irf_estTR.spread_s_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.spread_s_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.spread_s_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('LENDING SPREAD^*');

subplot(4,3,11)
plot(t,irf_estTR.CtoY_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.CtoY_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.CtoY_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CREDIT/GDP RATIO');

subplot(4,3,12)
plot(t,irf_estTR.CtoY_s_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.CtoY_s_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.CtoY_s_e_tech,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('CREDIT/GDP RATIO^*');
%legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru');