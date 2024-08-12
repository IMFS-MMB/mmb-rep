%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file plots Figure 1,2,4


clear all; close all; 

SAVE=0;
SIZE=0;
PRES=0;

load path0  
load path1
load path2
load path3

Tfull=length(y0)-1;         % path length
T=200;
Ta=1;
Tb=T;

% Define objects for plotting
FigW=30;FigH=FigW;
usedfont='Georgia';

cellvarspap=     {'y',       'c',           'k',     'h',    'r',             'pi',       'e',       'x',       'x_ea', 'ab',      'price'...
                 'yG'         'yB'         ,   'sp',                'bCG',       're'        };
cellvarlabelspap={'Output', 'Consumption','Capital','Labor','Interest rate', 'Inflation','Emissions','Global pollution','EA pollution','Abatement/GDP','Carbon price'...
               'Green output','Brown output', 'Green-brown spread','Green cb bonds', 'Reserves'};

cellvarspres=     {'y',       'c',           'k',         'r',             'pi',       'e',       'x',       'x_ea', 'ab',      'price'...
                 'yG'         'yB'         ,                        'sp',       'bCG',       're'        };
cellvarlabelspres={'Output', 'Consumption','Capital','Interest rate', 'Inflation','Emissions','Global pollution','EA pollution','Abatement/GDP','Carbon price'...
               'Green output','Brown output', 'Green-brown spread','Green cb bonds', 'Reserves'};


           
         
%% Transition
if PRES==0  
if SIZE==0
figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);

for j=1:16
subplot(4,4,j)
plottanda0=eval(['100*' cellvarspap{j} '0' ';']); 
plot(plottanda0(1:T),'Linewidth',1.5);
title(cellvarlabelspap{j},'Fontsize',12,'fontweight','bold')
axis tight
ax = gca;
ax.YAxis.Exponent = 0;
end
if SAVE==1
print('-dpng','-r500',['./figures/trans.png'])
end

%% Green QE


figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);
for j=1:16
subplot(4,4,j)
plottanda0=eval(['100*' cellvarspap{j} '0' ';']);
plottanda1=eval(['100*' cellvarspap{j} '1' ';']); 
plottanda2=eval(['100*' cellvarspap{j} '2' ';']); 
plottanda3=eval(['100*' cellvarspap{j} '3' ';']); 
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda1(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'Linewidth',1.5);
hold on
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda2(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'r:','Linewidth',1.5);
hold on
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda3(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'k--','Linewidth',1.5);

axis tight
ax = gca;
ax.YAxis.Exponent = 0;
title(cellvarlabelspap{j},'Fontsize',12,'fontweight','bold')
if j==2
legend('GQE1','GQE2','GQE3','Location','southeast')
end
if j==11
axis([-9 Tb-Ta -0.01 0.01])
end
end
if SAVE==1
 print('-dpng','-r500',['./figures/gqeeffect.png'])
end


%% Different size

else

figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);
for j=1:16
subplot(4,4,j)
plottanda0=eval(['100*' cellvarspap{j} '0' ';']);
plottanda1=eval(['100*' cellvarspap{j} '1' ';']); 
plottanda2=eval(['100*' cellvarspap{j} '2' ';']); 
plottanda3=eval(['100*' cellvarspap{j} '3' ';']); 
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda3(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'Linewidth',1.5);
hold on
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda1(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'r:','Linewidth',1.5);
hold on
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda2(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'k--','Linewidth',1.5);

axis tight
ax = gca;
ax.YAxis.Exponent = 0;
title(cellvarlabelspap{j},'Fontsize',12,'fontweight','bold')
if j==2
legend('50%','25%','75%','Location','southeast')
end
if j==11
axis([-9 Tb-Ta -0.01 0.01])
end
end
if SAVE==1
print('-dpng','-r500',['./figures/gqeeffect_size.png'])
end

end

else
%% Presentation
FigW=30;FigH=FigW/2;
figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);
for j=1:15
subplot(3,5,j)
plottanda0=eval(['100*' cellvarspres{j} '0' ';']); 
plot(plottanda0,'Linewidth',1.5);
title(cellvarlabelspres{j},'Fontsize',12,'fontweight','bold')
axis tight
ax = gca;
ax.YAxis.Exponent = 0;
end

if SAVE==1
print('-dpng','-r500',['./figures/trans_pres.png'])
end

figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);

for j=1:15
subplot(3,5,j)
plottanda0=eval(['100*' cellvarspres{j} '0' ';']);
plottanda1=eval(['100*' cellvarspres{j} '1' ';']); 
plottanda2=eval(['100*' cellvarspres{j} '2' ';']); 
plottanda3=eval(['100*' cellvarspres{j} '3' ';']); 
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda1(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'Linewidth',1.5);
hold on
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda2(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'r:','Linewidth',1.5);
hold on
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda3(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'k--','Linewidth',1.5);

axis tight
ax = gca;
ax.YAxis.Exponent = 0;
title(cellvarlabelspres{j},'Fontsize',12,'fontweight','bold')
if j==2
legend('GQE1','GQE2','GQE3','Location','southeast')
end
if j==10
axis([-9 Tb-Ta -0.01 0.01])
end
end

if SAVE==1
print('-dpng','-r500',['./figures/gqe_pres.png'])
end
end

