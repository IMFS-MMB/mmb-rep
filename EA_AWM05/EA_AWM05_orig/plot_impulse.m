%--------------------------------------------------------------
%
% plot_impulse.m
%
% Plots the impulse-responses towards a 100 bps monetary shock
% For the four models, CW-T, CW-F, SWEAR, AWM
%
% by: Keith Küster, July 2003 
% Changed October 2004
%--------------------------------------------------------------

clear
load c:\Wieland_project\impulse_data\Taylor_Gerdes_IR
load c:\Wieland_project\impulse_data\FM_Gerdes_IR
load c:\Wieland_project\impulse_data\SWEAR_Gerdes_IR
load c:\Wieland_project\impulse_data\AWM_Gerdes_IR

% --------------------------------------
% Set a few features
% --------------------------------------
periods = 30;  %periods following the shock

% --------------------------------------
% Do the plots
% --------------------------------------
clf;nstart=1;
subplot(1,3,1);hold on; plot1=plot(1:length(irpinf_T),irpinf_T,'--'); 
plot1=plot(1:length(irpinf_F),irpinf_F,'-.'); 
plot1=plot(1:length(irpinf_SW),irpinf_SW,'.-'); 
plot1=plot(1:length(irpinf_AWM),irpinf_AWM,'-'); 
title('Annual Inflation','Fontsize', 16, 'VerticalAlignment', 'bottom')
                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 12);    
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 12)
                % ----------------------------------
                % Depending on the rule chosen, set 
                % the bounds of the graphs
                % ----------------------------------
                if rule==1
                    set(gca,'YTick', [-0.04:.01:.04], ...
                    'YTickLabel', num2str([-0.04:.01:.04]'), 'FontSize', 12)
                    axis([1 periods+1 -.04 0.011])
                end
                
           hold off;

subplot(1,3,2);hold on; plot1=plot(1:length(irq_T),irq_T,'--'); 
plot1=plot(1:length(irq_F),irq_F,'-.'); 
plot1=plot(1:length(irq_SW),irq_SW,'.-'); 
plot1=plot(1:length(irq_AWM),irq_AWM,'-'); 
title('Output Gap','Fontsize', 16, 'VerticalAlignment', 'bottom')

                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
                       axis tight; %axis([1 21 -.3 0.4]);
                xlabel('Quarters', 'Fontsize', 12); 
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 12)
                hold off;
                if rule==1
                     set(gca,'YTick', [-0.14:.02:.04], ...
                    'YTickLabel', num2str([-0.04:.01:.04]'), 'FontSize', 12)
                    axis ([1 periods+1 -.1 0.02])
                end
                
subplot(1,3,3);hold on; plot1=plot(1:length(irr_T),irr_T,'--'); 
plot1=plot(1:length(irr_F),irr_F,'-.'); 
plot1=plot(1:length(irr_SW),irr_SW,'.-'); 
plot1=plot(1:length(irr_AWM),irr_AWM,'-'); 
set(gca,'FontSize',16)
legend('CW-T','CW-F','SW','AWM',1);
title('Nominal Rate','Fontsize', 16, 'VerticalAlignment', 'bottom')
                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
                        axis tight;%axis([1 21 -.6 0.025]);
                xlabel('Quarters', 'Fontsize', 12);
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 12)
                hold off;
                if rule==1
                     set(gca,'YTick', [-10:2:10], ...
                    'YTickLabel', num2str([-10:2:10]'), 'FontSize', 12)
                    axis ([1 periods+1 -10 5])
                end

                