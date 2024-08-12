%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file plots Figure A4

clear all; close all; 

SAVE=0;


load path0  % Tax       
load path1
load path2  % GQE2+Tax
load path3  % GQE


Tfull=length(y0)-1;         % path length
T=200;
Ta=1;
Tb=T;

% Define objects for plotting
FigW=30;FigH=FigW;
usedfont='Georgia';

cellvarspap=     {'y',       'c',           'k',     'h',    'r',             'pi',       'e',       'x',       'x_ea', 'ab',      'price'...
                 'yG'         'yB'         ,                        'sp',       'bCG',       're'        };
cellvarlabelspap={'Output', 'Consumption','Capital','Labor','Interest rate', 'Inflation','Emissions','Global pollution','EA pollution','Abatement/GDP','Carbon price'...
               'Green output','Brown output', 'Green-brown spread','Green cb bonds', 'Reserves'};


           
           


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
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda2(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'Linewidth',1.5);
hold on
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda3(Ta:Tb)],'r:','Linewidth',1.5);

axis tight
ax = gca;
ax.YAxis.Exponent = 0;
title(cellvarlabelspap{j},'Fontsize',12,'fontweight','bold')
if j==2
legend('GQE and Tax','Only GQE','Location','southeast')
end
if j==11
axis([-9 Tb-Ta -0.01 0.01])
end
end
if SAVE==1
 print('-dpng','-r500',['./figures/gqeeffect_only.png'])
end


