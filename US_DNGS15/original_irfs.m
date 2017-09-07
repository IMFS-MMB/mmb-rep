% IRFs not available in the paper and original code
% Deriving IRFs from the original code estimations

%*****************************************************************
% impulse response functions for Del Negro et al. (2015) for:
% a monetary policy shock 
% a fiscal policy shock 
% a productivity shock 
% one standard deviation shocks
%*****************************************************************

% necessary to opet the original code folder and call setpath.m

spec_904_aux

f = fopen(string('mhparam9049354700020085020Mode'),'r');
para = fread(f,'single');

[TTT,RRR,CCC,valid] = dsgesolv(para,mspec,nant);

sa = zeros(20,60);

% monetary policy shock

sig_rm=0.2919
eps = [ 0 0 0 0 0 0 sig_rm 0 0 0 0 ]';

sa(2,:) = (RRR*eps)';

for t = 3:20

    sa(t,:) = (TTT*sa(t-1,:)')';

end

yrm = sa(2:20,1);
pirm = sa(2:20,12);
Rrm = sa(2:20,16);
yfrm = sa(2:20,38);
ogrm = yrm-yfrm;


nul=zeros(19,1);
ha=1:1:19;

% graph representation for a monetary policy shock

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse responses to a monetary policy shock');

subplot(2,2,1);
plot(ha,ogrm,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Output gap');

subplot(2,2,2);
plot(ha,pirm,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Inflation');

subplot(2,2,3);
plot(ha,Rrm,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Interest rate');

subplot(2,2,4);
plot(ha,yrm,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Output');


% fiscal policy shock

sig_g=2.908
eps = [ sig_g 0 0 0 0 0 0 0 0 0 0 ]';

sa(2,:) = (RRR*eps)';

for t = 3:20

    sa(t,:) = (TTT*sa(t-1,:)')';

end

yg = sa(2:20,1);
pig = sa(2:20,12);
Rg = sa(2:20,16);
yfg = sa(2:20,38);
ogg = yg-yfg;

nul=zeros(19,1);
ha=1:1:19;

% graph representation for a fiscal policy shock

figure2 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse responses to a fiscal policy shock');

subplot(2,2,1);
plot(ha,ogg,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Output gap');

subplot(2,2,2);
plot(ha,pig,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Inflation');

subplot(2,2,3);
plot(ha,Rg,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Interest rate');

subplot(2,2,4);
plot(ha,yg,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Output');

%  productivity shock

sig_z=0.4961
eps = [ 0 0 0 sig_z 0 0 0 0 0 0 0 ]';

sa(2,:) = (RRR*eps)';

for t = 3:20

    sa(t,:) = (TTT*sa(t-1,:)')';

end

yz = sa(2:20,1);
piz = sa(2:20,12);
Rz = sa(2:20,16);
yfz = sa(2:20,38);
ogz = yz-yfz;

nul=zeros(19,1);
ha=1:1:19;

% graph representation for a productivity shock

figure3 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse responses to a productivity shock');

subplot(2,2,1);
plot(ha,ogz,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Output gap');

subplot(2,2,2);
plot(ha,piz,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Inflation');

subplot(2,2,3);
plot(ha,Rz,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Interest rate');

subplot(2,2,4);
plot(ha,yz,'b','LineWidth',1.5);              hold on
plot(ha,nul,'r');
title('Output');