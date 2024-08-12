%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file plots the bond functions in Figure 3


clear all; 
clc;
close all;
SAVE=0;
FigW=25;
FigH=FigW;
usedfont='Georgia';

load par_trans
load par_bond
load par_plot


N=1000;

bGstart=bHG(end);
bGend=bHG(1);

bBstart=bHB(end);
bBend=bHB(1);

gg = linspace(bGstart-0.1,bGend+0.1,N)';
bb = linspace(bBstart-1,bBend+3,N)';

gg2 = gg;
bb2 = bb;

gg2(1:96)=NaN*ones(96,1);
gg2(905:end)=NaN*ones(96,1);
bb2(1:177)=NaN*ones(177,1);
bb2(472:end)=NaN*ones(529,1);


rG=zeros(N,1);
rB=zeros(N,1);
rG2=zeros(N,1);
rB2=zeros(N,1);

for ii=1:N
    rG(ii)=theta/betta*(1-nuG./lam.*(gg(ii).^(-kappaG)));
    rB(ii)=theta/betta*(1+nuB./lam.*(bb(ii).^(+kappaB)));
    rG2(ii)=theta/betta*(1-nuG./lam.*(gg2(ii).^(-kappaG)));
    rB2(ii)=theta/betta*(1+nuB./lam.*(bb2(ii).^(+kappaB)));
end

figure;
set(gcf,'color', 'white',...
        'PaperUnits','centimeters','PaperSize',[FigW FigH],...
        'PaperPosition',[0,0,FigW,FigH],'PaperPositionMode','manual',...
        'Units','centimeters',...
        'Position',[0,0,FigW,FigH]);

subplot(2,1,1)
plot(100*gg/(4*y_start), 400*(rG-1),'b','Linewidth',2);
hold on
plot(100*gg2/(4*y_start), 400*(rG2-1),'r','Linewidth',2);
title('Green bond demand','Fontsize',12,'fontweight','bold')
xlim([100*gg(1)/(4*y_start) 100*gg(end)/(4*y_start)])
%ylim([-1 0.006*400])
xlabel('Green bonds % GDP','Fontsize',11,'fontweight','bold') 
ylabel('Green rate','Fontsize',11,'fontweight','bold') 


subplot(2,1,2)
plot(100*bb/(4*y_start), 400*(rB-1),'b','Linewidth',2);
hold on
plot(100*bb2/(4*y_start), 400*(rB2-1),'r','Linewidth',2);
title('Brown bond demand','Fontsize',12,'fontweight','bold')
xlim([100*bb(1)/(4*y_start) 100*bb(end)/(4*y_start)])
ylim([-1 0.0074*400])
xlabel('Brown bonds % GDP','Fontsize',11,'fontweight','bold') 
ylabel('Brown rate','Fontsize',11,'fontweight','bold') 

if SAVE==1
print('-dpng','-r500',['./figures/bond.png'])
end