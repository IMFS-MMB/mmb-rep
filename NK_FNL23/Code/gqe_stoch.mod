%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code simulates business cycle fluctuations

close all;
warning off

% Specify the intratemporal elasticity between green and brown sector: if ela=1, csi=1 and final output is cobb douglas
@#define ela =  0
tfp_stand=0.017;  %0.017
mon_stand=0.000;
%%%%%%%%%%%%%%%%%%%%%%%Endogenous Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var
lam
c 
rkG
rkB
w 
h
hB
hG
y 
k 
kB
kG
q
I
r
pI
pi
yB
yG
pG
pB
rB
rG
bHG
bHB
bCB
bCG
mu
e
X
G
rGE
rBE
sp
price
X_ea

tau
re
a
epsI

ylog
clog
ilog
klog
hlog
piA
rGA
rBA
elog
yGlog
Xealog
Xlog
;
%%
%%%%%%%%%%%%%%%%%%%%%%%Exogenous Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varexo 
va   % TFP shocks
vm   % monetary shochks
vi   % investment specific shocks
vg
;  
    
%%
%%%%%%%%%%%%%%%%%%%%%%%Parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parameters

betta 
alfa 
epsilon
delta
phi
chi
csi
theta
deltax
zeta
g 
nuM
nuE
dC
nuG
nuB

rG_start
rB_start
y_start
pB_start
mu_start
X_start
bCG_start
re_start
bCB_start
rss
piss
kappaI
phipi
rhor
kappaP
kappaG
kappaB
S1
S2
S3
tau_start
varsig
iota
erow

rhoa
rhoi
standa
standi
standm
standg
rhog
;

load par_trans;  % load mat file created in console_ss

for jj=1:length(M_.param_names)-7
set_param_value(M_.param_names{jj},eval(M_.param_names{jj})); 
end;

rhoa=0.92;
rhoi=0.95;
rhog=0.95;
standa=tfp_stand;
standm=mon_stand;
standi=0.00;  
standg=0.00;




%%
%%%%%%%%%%%%%%%%%%%%%%%Non-Linear Model%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

model;
%Households
h^(phi)=w*lam;                                                         %(1)
1=betta*lam(1)/(lam*theta)*r/pi(1);                                    %(2)
1=betta*lam(1)/(lam*theta)*rG(1)+nuG/lam*bHG^(-kappaG);                %(3)
1=betta*lam(1)/(lam*theta)*rB(1)-nuB/lam*bHB^ (kappaB);                %(4)
% Intermediated Firms
@#if ela
y=yG^(1-zeta)*yB^(zeta);                                                                %(5a)
@#else
y^((csi-1)/csi)=(1-zeta)^(1/csi)*(yG)^((csi-1)/csi)+(zeta)^(1/csi)*(yB)^((csi-1)/csi);  %(5b)
@#endif
yG=(1-zeta)*(pG/pI)^(-csi)*y;                                          %(6)
yB=zeta    *(pB/pI)^(-csi)*y;                                          %(7)
(pi-pi(-1)^(iota)*piss^(1-iota))*pi=betta*lam(1)/lam*y(1)/y*pi(1)*(pi(1)-pi^(iota)*piss^(1-iota))+epsilon/kappaP*(pI-(epsilon-1)/epsilon); %(8)
% Basic Firms
yG=a*(kG(-1)/theta)^(alfa)*hG^(1-alfa);                                  %(9)
yB=a*(kB(-1)/theta)^(alfa)*hB^(1-alfa);                                 %(10)
(1-alfa)*pG                                        *yG=w*hG;          %(11)
(1-alfa)*(pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi))*yB=w*hB;          %(12)
alfa*pG                                        *yG=rkG*kG(-1)/theta;  %(13)
alfa*(pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi))*yB=rkB*kB(-1)/theta;  %(14)
rkG=rG*q(-1)-(1-delta)*q;                                             %(15)
rkB=rB*q(-1)-(1-delta)*q;                                             %(16)
mu=0;                                                                 %(17)
% Pollution
X=(1-deltax)*X(-1)/theta+e+erow;                                      %(18)
e=(1-mu)*nuE*yB;                                                      %(19)
%Capital-firms
k=(1-delta)*k(-1)/theta+epsI*(1-kappaI/2*(I/I(-1)*theta-theta)^2)*I;  %(20)
1=epsI*q*(1-kappaI/2*(I/I(-1)*theta-theta)^2-kappaI*(I/I(-1)*theta-theta)*I/I(-1)*theta)+kappaI*betta*lam(1)/(lam*theta)*q(1)*epsI(1)*(I(1)/I*theta-theta)*(I(1)/I*theta)^2; %(21)   
% Market clearing                
h=hG+hB;                                                              %(22)
k=kG+kB;                                                              %(23)
bHG+bCG=q*kG;                                                         %(24)
bHB+bCB=q*kB;                                                         %(25)
y=c+I+G+ yB*nuM/(1+chi)*mu^(1+chi)+y*kappaP/2*(pi-pi(-1)^(iota)*piss^(1-iota))^2;            %(26)
% Policy
bCG+bCB+dC=re;                                                        %(27)
r/(rss)=((pi/piss)^(phipi))^(1-rhor)*(r(-1)/rss)^(rhor)-vm;           %(28)
log(G)=(1-rhog)*log(g)+rhog*log(G(-1))+vg;
% Other variables
lam=1/(c-varsig*c(-1)/theta)-betta*varsig/(c(1)*theta-varsig*c);      %(29)
log(a)=rhoa*log(a(-1))+va;
log(epsI)=rhoi*log(epsI(-1))+vi;
re=re_start;
tau=tau_start;
sp=rG(1)-rB(1);
rGE=rG(1);
rBE=rB(1);
bCB=bCB_start;
price=tau*S1*S2/S3; 
X_ea=(1-deltax)*X_ea(-1)/theta+e;
ylog=log(y);
clog=log(c);
ilog=log(I);
klog=log(k);
hlog=log(h);
piA=4*pi;
rGA=4*rG(1);
rBA=4*rB(1);
elog=log(e);
yGlog=log(yG);
Xealog=log(X_ea);
Xlog=log(X);
end;


steady_state_model;
pi=piss;
q=1;
r=pi*theta/betta;             
rG=rG_start;                        
rB=rB_start;                        
rkG=rG-(1-delta);             
rkB=rB-(1-delta);             
pI=(epsilon-1)/epsilon;  
y=y_start;
pB=pB_start;
mu=mu_start;
X=X_start;
e=(1-(1-deltax)/theta)*X-erow;                       
bCG=bCG_start;
re=re_start;
@#if ela
pG=((1-zeta)^(1-zeta)*zeta^(zeta)*pI*(pB)^(-zeta))^(1/(1-zeta));
@#else
pG=(1/(1-zeta)*(pI^(1-csi)-zeta*(pB)^(1-csi)))^(1/(1-csi));
@#endif
yB=zeta*((pB/pI)^(-csi)*y);
yG=(1-zeta)*(pG/pI)^(-csi)*y;   
tau=nuM/nuE*mu^(chi);
kG=alfa*theta*pG*yG/(rkG);
kB=alfa*theta*(pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi))*yB/(rkB);                       
hB=(yB/((kB/theta)^(alfa)))^(1/(1-alfa));
hG=(yG/((kG/theta)^(alfa)))^(1/(1-alfa));
k=kG+kB;
I=(1-(1-delta)/theta)*k;                           
w=(1-alfa)*pG*yG/hG;
h=hB+hG;
bCB=re-dC-bCG;
bHG=kG-bCG;
bHB=kB-bCB;
c=y-I-g-nuM/(1+chi)*mu^(1+chi)*yB;   
sp=rG-rB;
rGE=rG;
rBE=rB;
price=tau*S1*S2/S3; 
X_ea=e/(1-(1-deltax)/theta);
ylog=log(y);
yGlog=log(yG);
Xealog=log(X_ea);
Xlog=log(X);
clog=log(c);
ilog=log(I);
klog=log(k);
hlog=log(h);
piA=4*pi;
a=1;
epsI=1;
rGA=4*rG;
rBA=4*rB;
elog=log(e);
lam=(theta-betta*varsig)/(c*(theta-varsig));
G=g;
end;

steady;
check;


shocks;
var va; stderr standa;   
var vi; stderr standi; 
var vm; stderr standm;  
var vg; stderr standg;  
end;

%% IRFs
stoch_simul(irf=100,order=1, hp_filter=1600,noprint,ar=1,nograph)
ylog clog ilog pi elog piA hlog klog Xealog Xlog yGlog  

;

sym=oo_.var(1,1)^0.5;
scm=oo_.var(2,2)^0.5;
sim=oo_.var(3,3)^0.5;
spim=oo_.var(4,4)^0.5;
scM=scm/sym;
siM=sim/sym;
spiM=spim/sym;
rhoycM=oo_.var(1,2)/(sym*scm);
rhoyiM=oo_.var(1,3)/(sym*sim);
rhoypiM=oo_.var(1,4)/(sym*spim);
rhoy1M=oo_.autocorr{1,1}(1,1);
rhoc1M=oo_.autocorr{1,1}(2,2);
rhoi1M=oo_.autocorr{1,1}(3,3);
rhopi1M=oo_.autocorr{1,1}(4,4);

MD=[100*sym,100*scm,100*sim,100*spim;1,scM,siM,spiM;1,rhoycM,rhoyiM,rhoypiM;rhoy1M,rhoc1M,rhoi1M,rhopi1M];
load stat

SS=[HP(1,:);MD(1,:);HP(2,:);MD(2,:);HP(3,:);MD(3,:);HP(4,:);MD(4,:)];

