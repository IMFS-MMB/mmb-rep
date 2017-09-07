%GRAPHS

close all;
%run dynare code before plotting IRFs
run = 0;

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
norm2=(0.01)^(-1)*irf_estTR.dpd_s_e_prefd_s(1);
norm3=0.0083;

%RISK SHOCK 

figure('Name','Risk Shock, Periphery','NumberTitle','off')
subplot(4,3,1)
plot(t,irf_estTR.c_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);
hold off
title('C');

subplot(4,3,2)
plot(t,irf_estTR.c_borr_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_borr_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_borr_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C BORR');

subplot(4,3,3)
plot(t,irf_estTR.inv_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_e_risk_s/norm1,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV');

subplot(4,3,4)
plot(t,irf_estTR.inv_borr_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_borr_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV BORR');

subplot(4,3,5)
plot(t,irf_estTR.l_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_e_risk_s/norm1,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L');

subplot(4,3,6)
plot(t,irf_estTR.l_borr_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_borr_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_borr_e_risk_s/norm1,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L BORR');

subplot(4,3,7)
plot(t,irf_estTR.c_s_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_s_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_s_e_risk_s/norm1,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C*');

subplot(4,3,8)
plot(t,irf_estTR.c_s_borr_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_s_borr_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_s_borr_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C BORR*');

subplot(4,3,9)
plot(t,irf_estTR.inv_s_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_s_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_s_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV*');

subplot(4,3,10)
plot(t,irf_estTR.inv_s_borr_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_s_borr_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_s_borr_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV BORR*');

subplot(4,3,11)
plot(t,irf_estTR.l_s_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_s_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_s_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1); hold off
title('L*');

subplot(4,3,12)
plot(t,irf_estTR.l_s_borr_e_risk_s/norm1,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_s_borr_e_risk_s/norm1,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_s_borr_e_risk_s/norm1,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L BORR*');
legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru');

%HOUSING DEMAND SHOCK 
figure('Name','Housing Demand Shock, Periphery','NumberTitle','off')
subplot(4,3,1)
plot(t,irf_estTR.c_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C');

subplot(4,3,2)
plot(t,irf_estTR.c_borr_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_borr_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_borr_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C BORR');

subplot(4,3,3)
plot(t,irf_estTR.inv_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV');

subplot(4,3,4)
plot(t,irf_estTR.inv_borr_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_borr_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_borr_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV BORR');

subplot(4,3,5)
plot(t,irf_estTR.l_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L');

subplot(4,3,6)
plot(t,irf_estTR.l_borr_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_borr_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_borr_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L BORR');

subplot(4,3,7)
plot(t,irf_estTR.c_s_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_s_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_s_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C*');

subplot(4,3,8)
plot(t,irf_estTR.c_s_borr_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_s_borr_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_s_borr_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C BORR*');

subplot(4,3,9)
plot(t,irf_estTR.inv_s_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_s_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_s_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV*');

subplot(4,3,10)
plot(t,irf_estTR.inv_s_borr_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_s_borr_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_s_borr_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV BORR*');

subplot(4,3,11)
plot(t,irf_estTR.l_s_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_s_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_s_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L*');

subplot(4,3,12)
plot(t,irf_estTR.l_s_borr_e_prefd_s/norm2,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_s_borr_e_prefd_s/norm2,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_s_borr_e_prefd_s/norm2,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L BORR*');
legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru');

%UNIT ROOT TECH SHOCK 
figure('Name','Unit Root Tech Shock','NumberTitle','off')
subplot(4,3,1)
plot(t,irf_estTR.c_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_e_tech+norm3,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C');

subplot(4,3,2)
plot(t,irf_estTR.c_borr_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_borr_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_borr_e_tech+norm3,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C BORR');

subplot(4,3,3)
plot(t,irf_estTR.inv_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_e_tech+norm3,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV');

subplot(4,3,4)
plot(t,irf_estTR.inv_borr_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_borr_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_borr_e_tech+norm3,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV BORR');

subplot(4,3,5)
plot(t,irf_estTR.l_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L');

subplot(4,3,6)
plot(t,irf_estTR.l_borr_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_borr_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_borr_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L BORR');

subplot(4,3,7)
plot(t,irf_estTR.c_s_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_s_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_s_e_tech+norm3,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C*');

subplot(4,3,8)
plot(t,irf_estTR.c_s_borr_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.c_s_borr_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.c_s_borr_e_tech+norm3,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('C BORR*');

subplot(4,3,9)
plot(t,irf_estTR.inv_s_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_s_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_s_e_tech+norm3,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV*');

subplot(4,3,10)
plot(t,irf_estTR.inv_s_borr_e_tech+norm3,'k-','LineWidth',2); hold on
plot(t,irf_optTR.inv_s_borr_e_tech+norm3,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.inv_s_borr_e_tech+norm3,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('INV BORR*');

subplot(4,3,11)
plot(t,irf_estTR.l_s_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_s_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_s_e_tech,'r-.', 'LineWidth',2);
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L*');

subplot(4,3,12)
plot(t,irf_estTR.l_s_borr_e_tech,'k-','LineWidth',2); hold on
plot(t,irf_optTR.l_s_borr_e_tech,'--', 'LineWidth',2);
plot(t,irf_optTRoptREG.l_s_borr_e_tech,'r-.', 'LineWidth',2); 
plot(t,0*t,'-', 'LineWidth',1);hold off
title('L BORR*');
legend('Estimated','Opt.Mon','Opt.Mon and Macro-Pru');