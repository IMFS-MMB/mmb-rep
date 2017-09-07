% ---------------------------------------------
% joint_IR.m
% plot joint autocorrelations for the four
% models
% Keith Küster, October 2004
% ---------------------------------------------
clear
%addpath c:\wieland_project\impulse_data

rule = 3;   % rule=1: Taylor, =2: smooth, 3: Gerdesmeier

% -----------------------------------
% load data
% -----------------------------------
load data_ac

if rule == 3;
    load AWM_autocorr
    if rule~=3
        error('not rule 3')
    end
    COR_AWM = COR;
    
    load Swear_autocorr
    if rule~=3
        error('not rule 3')
    end
    COR_SW  = COR;
    
    load FM_autocorr
    if rule~=3
        error('not rule 3')
    end
    COR_FM  = COR;

    load Taylor_autocorr
    if rule~=3
        error('not rule 3')
    end
    COR_T  = COR;
end
horizon = 41;length(COR_T(1,:));

short = 1;
% -----------------------------------
% plot impulseresponses
% -----------------------------------
figure;
hold on 
plot(1:horizon,COR_T(1,1:horizon),'ks','LineWidth',3.8,'Markersize',4)
plot(1:horizon,COR_FM(1,1:horizon),'k--','LineWidth',3.0)
plot(1:horizon,COR_SW(1,1:horizon),'k-.o','LineWidth',3.0,'MarkerSize',3.0)
plot(1:horizon,COR_AWM(1,1:horizon),'k:','LineWidth',3.8,'Markersize',6)
plot(1:horizon,autopi(:,1:horizon)','k-','LineWidth',3.0)
%plot(1:horizon,boundspi(:,1:horizon)','k:s','LineWidth',2.8,'Markersize',4)
%plot(irpinf_simple)
hold off
title('Annual Inflation','Fontsize', 22, 'VerticalAlignment', 'bottom')
                line('XData',[1, horizon],'YData',[0, 0], 'LineStyle',':'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 24); 
                ylabel('Autocorrelation','Fontsize',24);
                set(gca,'XTick', [1:4:200], ...
                    'XTickLabel', num2str([0:4:200]'), 'FontSize', 24)
legend('Taylor','FM','SW','AWM',0);
legend('CW-T','CW-F','SW','AW',4);
orient landscape
%axis tight
% print -deps c:\uni\Wieland_paper_2003\AC_pi_detrend_40.eps
figure;
hold on 
plot(1:horizon,COR_T(2,1:horizon),'ks','LineWidth',3.8,'Markersize',4)
plot(1:horizon,COR_FM(2,1:horizon),'k--','LineWidth',3.0)
plot(1:horizon,COR_SW(2,1:horizon),'k-.o','LineWidth',3.0,'MarkerSize',3.0)
plot(1:horizon,COR_AWM(2,1:horizon),'k:','LineWidth',3.8,'Markersize',6)
plot(1:horizon,autoy(:,1:horizon)','k-','LineWidth',3.0)
%plot(1:horizon,boundsy(:,1:horizon)','k:s','LineWidth',2.8,'Markersize',4)

%plot(irq_simple)
hold off
title('Output Gap','Fontsize', 22, 'VerticalAlignment', 'bottom')
                line('XData',[1, horizon],'YData',[0, 0], 'LineStyle',':'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 24);
                ylabel('Autocorrelation','Fontsize',24);
                set(gca,'XTick', [1:4:200], ...
                    'XTickLabel', num2str([0:4:200]'), 'FontSize', 24)
%legend('Taylor','FM','SW','AWM',0);
legend('CW-T','CW-F','SW','AW','Data',1);
%legend('Taylor','FM','SW','AWM','Data','Bounds',1);

orient landscape
%axis tight
% print -deps c:\uni\Wieland_paper_2003\AC_y_40.eps
return
figure;
hold on 
plot(1:horizon,COR_T(3,1:horizon),'-')
plot(1:horizon,COR_FM(3,1:horizon),'--')
plot(1:horizon,COR_SW(3,1:horizon),':')
plot(1:horizon,COR_AWM(3,1:horizon),'-.')
%plot(irq_simple)
hold off
title('Nominal Rate','Fontsize', 12, 'VerticalAlignment', 'bottom')
                line('XData',[1, horizon],'YData',[0, 0], 'LineStyle',':'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 9);    
                set(gca,'XTick', [1:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
legend('Taylor','FM','SW','AWM',1);
orient portrait
axis tight
% print -deps c:\uni\Wieland_paper_2003\AC_dr_40_bounds1.eps

%rmpath c:\wieland_project\impulse_data
orient portrait

%eval(['print -deps c:\uni\Wieland_paper_2003\rule' num2str(rule) '_IR.eps'])

