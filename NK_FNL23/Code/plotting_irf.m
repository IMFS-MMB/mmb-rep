%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This code plots the IRFs to temporary shocks


clc; clear all; close all
dynare gqe_stoch noclearall

shock1='va';        % TFP shock
shock2='vg';        % Investment shock
shock3='vm';        % Monetary shock
%% Settings
T=41;
shock='vm';
SAVE=0;
FigW=25;
FigH=FigW;
usedfont='Georgia';

%%

cellvars=     {'ylog','clog',  'ilog',...
               'klog',  'piA','yGlog',...
                'elog','Xlog', 'Xealog'};
cellvarlabels={'GDP','Consumption','Investment',...
               'Capital', 'Inflation','Green output'...
               'Emissions','Pollution','EA pollution',};



%% TFP


if strcmp(shock, shock1)

figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);

    
for j=1:9
subplot(3,3,j)
plottanda_=eval([cellvars{j} '_' shock ';']);
plot([-1:1:T-1], [0;100*plottanda_(1:T)],'b','Linewidth',2);
title(cellvarlabels{j},'Fontsize',12,'fontweight','bold')
axis tight
ax = gca;
ax.YAxis.Exponent = 0;
end
if SAVE==1
print('-dpng','-r500',['./figures/IRF_va.png'])
end


%% Investment

elseif strcmp(shock, shock2)

figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);

    
for j=1:9
subplot(3,3,j)
plottanda_=eval([cellvars{j} '_' shock ';']);
plot([-1:1:T-1], [0;100*plottanda_(1:T)],'b','Linewidth',2);
title(cellvarlabels{j},'Fontsize',12,'fontweight','bold')
axis tight
ax = gca;
ax.YAxis.Exponent = 0;
end
if SAVE==1
print('-dpng','-r500',['./figures/IRF_vi.png'])
end


elseif strcmp(shock, shock3)

%% Monetary shock
figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);

    
for j=1:9
subplot(3,3,j)
plottanda_=eval([cellvars{j} '_' shock ';']);
plot([-1:1:T-1], [0;100*plottanda_(1:T)],'b','Linewidth',2);
title(cellvarlabels{j},'Fontsize',12,'fontweight','bold')
axis tight
ax = gca;
ax.YAxis.Exponent = 0;
end
if SAVE==1
print('-dpng','-r500',['./figures/IRF_vm.png'])
end

end