% ---------------------------------------------
% joint_IR.m
% plot impulseresponses for the four models
% used herein 
% Used for the paper
% Keith Küster, October 2004
% ---------------------------------------------
clear
addpath c:\wieland_project\impulse_data

rule = 3;   % rule=1: Taylor, =2: smooth, 3: Gerdesmeier

% -----------------------------------
% load data
% -----------------------------------

if rule == 1;
    load awm_taylor_ir
    load fm_taylor_ir
    load taylor_taylor_ir
    load swear_taylor_ir
    %load simple_taylor_ir
end

if rule == 2;
    load awm_smooth_ir
    load fm_smooth_ir
    load taylor_smooth_ir
    load swear_smooth_ir
    %load simple_smooth_ir
end

if rule == 3;
    load awm_gerdes_ir
    load fm_gerdes_ir
    load taylor_gerdes_ir
    load swear_gerdes_ir
    %load simple_gerdes_ir
end

short = 0;
% -----------------------------------
% plot impulseresponses
% -----------------------------------
clf

paper = 2; % = 2: plot as in new paper; = 1: plot as in old paper, = 0: plot as in presentation
horizon = 41;
if paper==1;
subplot(1,3,1)
hold on 
plot(1:length(irpinf_Taylor)-short,irpinf_Taylor(1:end-short),'-')
plot(1:length(irpinf_FM)-short,irpinf_FM(1:end-short),'--')
plot(1:length(irpinf_SWEAR)-short,irpinf_SWEAR(1:end-short),':')
plot(1:length(irpinf_AWM)-short,irpinf_AWM(1:end-short),'-.')
%plot(irpinf_simple)
hold off
title('Annual Inflation','Fontsize', 12, 'VerticalAlignment', 'bottom')
                line('XData',[1, length(irpinf_AWM)-short],'YData',[0, 0], 'LineStyle',':'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 9);    
                set(gca,'XTick', [1:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
%legend('Taylor','FM','SW','AWM',0);
axis tight

subplot(1,3,2)
hold on 
plot(1:length(irq_Taylor)-short,irq_Taylor(1:end-short),'-')
plot(1:length(irq_FM)-short,irq_FM(1:end-short),'--')
plot(1:length(irq_SWEAR)-short,irq_SWEAR(1:end-short),':')
plot(1:length(irq_AWM)-short,irq_AWM(1:end-short),'-.')
%plot(irq_simple)
hold off
title('Output gap','Fontsize', 12, 'VerticalAlignment', 'bottom')
                line('XData',[1, length(irpinf_AWM)-short],'YData',[0, 0], 'LineStyle',':'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 9);    
                set(gca,'XTick', [1:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
%legend('Taylor','FM','SW','AWM',0);
axis tight

subplot(1,3,3)
hold on 
plot(1:length(irr_Taylor)-short,irr_Taylor(1:end-short),'-')
plot(1:length(irr_FM)-short,irr_FM(1:end-short),'--')
plot(1:length(irr_SWEAR)-short,irr_SWEAR(1:end-short),':')
plot(1:length(irr_AWM)-short,irr_AWM(1:end-short),'-.')
%plot(irq_simple)
hold off
title('Nominal Rate','Fontsize', 12, 'VerticalAlignment', 'bottom')
                line('XData',[1, length(irpinf_AWM)-short],'YData',[0, 0], 'LineStyle',':'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 9);    
                set(gca,'XTick', [1:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
legend('Taylor','FM','SW','AWM',1);
axis tight

elseif paper==0;
subplot(1,2,1)
hold on 
plot(1:horizon,irpinf_Taylor(1:horizon),'k-','LineWidth',2.5)
plot(1:horizon,irpinf_FM(1:horizon),'k--','LineWidth',2.5)
plot(1:horizon,irpinf_SWEAR(1:horizon),'ko','LineWidth',3.0,'MarkerSize',2)
plot(1:horizon,irpinf_AWM(1:horizon),'k:*','LineWidth',2.0,'Markersize',6)
%plot(irpinf_simple)
hold off
title('Annual Inflation','Fontsize', 22, 'VerticalAlignment', 'bottom')
                line('XData',[1, horizon],'YData',[0, 0], 'LineStyle','-'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 20);    
                set(gca,'XTick', [1:4:200], ...
                    'XTickLabel', num2str([0:4:200]'), 'FontSize', 18)
%legend('Taylor','FM','SW','AWM',0);
axis tight


subplot(1,2,2)
hold on 
plot(1:horizon,irq_Taylor(1:horizon),'k-','LineWidth',2.5)
plot(1:horizon,irq_FM(1:horizon),'k--','LineWidth',2.5)
plot(1:horizon,irq_SWEAR(1:horizon),'ko','LineWidth',3.0,'MarkerSize',1)
plot(1:horizon,irq_AWM(1:horizon),'-.','LineWidth',2.0,'Markersize',6)
%plot(irq_simple)
hold off
title('Output gap','Fontsize', 22, 'VerticalAlignment', 'bottom')
                line('XData',[1, horizon],'YData',[0, 0], 'LineStyle','-'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 20);    
                set(gca,'XTick', [1:4:200], ...
                    'XTickLabel', num2str([0:4:200]'), 'FontSize', 18)
%legend('Taylor','FM','SW','AWM',0);
legend('Taylor','FM','SW','AWM',4);
axis tight
elseif paper==2;
figure(1)
hold on 
plot(1:horizon,irpinf_Taylor(1:horizon),'ks','LineWidth',3.8,'Markersize',4)
plot(1:horizon,irpinf_FM(1:horizon),'k--','LineWidth',3.0)
plot(1:horizon,irpinf_SWEAR(1:horizon),'k-.o','LineWidth',3.0,'MarkerSize',3.0)
plot(1:horizon,irpinf_AWM(1:horizon),'k:','LineWidth',3.8,'Markersize',6)
%plot(irpinf_simple)
hold off
%title('Annual Inflation','Fontsize',32, 'VerticalAlignment', 'bottom')
                line('XData',[1, horizon],'YData',[0, 0], 'LineStyle','-'), 
                axis tight;
                set(gca,'YTick', [-.10:.02:0.04], ...
                    'YTickLabel', ['-0.10';'-0.08';'-0.06';'-0.04';' 0.02';' 0.00';' 0.02';' 0.04'], 'FontSize', 24)
                xlabel('Quarters', 'Fontsize', 24);    
                set(gca,'XTick', [1:4:200], ...
                    'XTickLabel', num2str([0:4:200]'), 'FontSize', 24)
%legend('Taylor','FM','SW','AWM',0);
%axis tight
axis([1 horizon -.1 0.03])
orient tall
print -deps c:\uni\Wieland_paper_2003\ruleGerdes_IR_inf_40.eps



figure(2)
hold on 
plot(1:horizon,irq_Taylor(1:horizon),'ks','LineWidth',3.8,'Markersize',4)
plot(1:horizon,irq_FM(1:horizon),'k--','LineWidth',3.0)
plot(1:horizon,irq_SWEAR(1:horizon),'k-.o','LineWidth',3.0,'MarkerSize',3.0)
plot(1:horizon,irq_AWM(1:horizon),'k:','LineWidth',3.8,'Markersize',6)
%plot(irq_simple)
hold off
%title('Output gap','Fontsize',32, 'VerticalAlignment', 'bottom')
                line('XData',[1, horizon],'YData',[0, 0], 'LineStyle','-'), 
                axis tight;
                set(gca,'YTick', [-.2:.05:0.10], ...
                    'YTickLabel', ['-0.20';'-0.15';'-0.10';'-0.05';' 0.00';' 0.05';' 0.10'], 'FontSize', 24)
                xlabel('Quarters', 'Fontsize', 24);    
                set(gca,'XTick', [1:4:200], ...
                    'XTickLabel', num2str([0:4:200]'), 'FontSize', 24)
%legend('Taylor','FM','SW','AWM',0);
legend('CW-T','CW-F','SW','AW',4);
axis([1 horizon -.2 0.10])
orient tall
print -deps c:\uni\Wieland_paper_2003\ruleGerdes_IR_gap_40.eps

end 


rmpath c:\wieland_project\impulse_data


if paper==1;
eval(['print -deps c:\uni\Wieland_paper_2003\rule' num2str(rule) '_IR.eps'])
end
