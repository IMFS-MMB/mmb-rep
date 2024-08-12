%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file plots Figure 5, A3

clear all; close all; 
SAVE=0;
CQE=0; % if you want to plot a qualitative easing

load path0  % tax 
load path1  % tax+Green QE
load path2  % tax+QE



Tfull=length(y1)-1;         % path length
T=200;
Ta=1;
Tb=T;

% Define objects for plotting
FigW=30;FigH=FigW;
usedfont='Georgia';

cellvarspap=     {'y',       'c',           'k',     'h',    'r',             'pi',       'e',       'x',       'x_ea', 'ab',      'price'...
                 'yG'         'yB'         ,                        'sp',       'bCG',       'bCB'        };
cellvarlabelspap={'Output', 'Consumption','Capital','Labor','Interest rate', 'Inflation','Emissions','Global pollution','EA pollution','Abatement/GDP','Carbon price'...
               'Green output','Brown output', 'Green-brown spread','Green cb bonds', 'Brown Bonds'};


           


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
if CQE==0
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda1(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'Linewidth',1.5);
hold on
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda2(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'r:','Linewidth',1.5);


end
if CQE==1
plot([-9:1:Tb-Ta], [zeros(9,1); plottanda1(Ta:Tb)]-[zeros(9,1);plottanda0(Ta:Tb)],'Linewidth',1.5);
end

axis tight
ax = gca;
ax.YAxis.Exponent = 0;
title(cellvarlabelspap{j},'Fontsize',12,'fontweight','bold')
if j==2 && CQE==0
legend('GQE','QE','Location','southeast')
elseif j==2 && CQE==1
legend('CE','Location','northeast')  
end
if CQE==1 && (j==2 || j==4 || j==5 || j==6 || j==8 || j==9 || j==10 ||j==11)
axis([-9 Tb-Ta -0.01 0.01])
end
end
if SAVE==1 && CQE==0
print('-dpng','-r500',['./figures/qe.png'])
elseif SAVE==1 && CQE==1
print('-dpng','-r500',['./figures/cqe.png'])  
end


