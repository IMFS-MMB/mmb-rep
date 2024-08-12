%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This code computes the initial steady state

clear all; 
clc;
close all;

TRANS=0;  % if 1, it runs the transition, if 0 business cycle simulation, 2 if you do not want to run console_clean

%% Parameters

epsilon=3.8571;               % elasticity of substitution between differentiated goods (NAWM II)
theta=1.0038;                 % steady-state growth (NAWM II) 
delta=0.025;                  % depreciation rate firms (NAWM II)
phi=2;                        % inverse of Frisch elasticity (NAWM II)
csi=2;                        % elasticity of substitution btw erowgreen and brown production (CHM 21)
zeta=0.8;                     % brown sector size (GKRW 21)
chi=1.6;                      % curvature the abatement function (GH 21)
pi=1.005;                     % steady-state inflation (ECB) 
deltax=1-0.9965;              % pollution depreciation (GH 21)
nuM=0.074*(1+chi);            % abatement shifter (GH 21)
gdpEUR=3022.4;                % euro area quarterly GDP in 2019Q4 (mld EUR) https://appsso.eurostat.ec.europa.eu/nui/submitViewTableAction.do
XGtC=870.1476;                % pollution in Gigatons of Carbon in 2018 (https://ourworldindata.org/atmospheric-concentrations, 1ppm=2.13 GtC)
varsig=0.8;                   % habits formation (to match volatility)
%% Targets

rr=1.005;                     % real interest rate  (NAWM-II)
I_y=0.21;                     % investment/GDP      (NAWM-II)
G=0.215;                      % public spending/GDP ratio (NAWM-II)
gammaG=-15;                   % green spread in basis points yearly
gammaB=-gammaG;               % brown spread in basis points yearly
RoW=15.31;                    % RoW emission / country emission (see excel file)
mu=0.000;                     % fraction of emissions abated
vG=300;                       % green elasticity to spread
vB=vG;                        % brown elasticity to spread
re_Y=0.4;                     % reserves/GDP ratio (ECB liabilities in 2019 over GDP)
% bCG_Y=0.2052*184.505/(4*gdpEUR);
% bCB_Y=(1-0.2052)*184.505/(4*gdpEUR);
bCG_Y=0.00;                   % green bonds held by the central bank. In alternative:  bCG_Y=0.2052*184.505/(4*gdpEUR)
bCB_Y=0.00;                   % brown bonds held by the central bank.  In alternative: bCB_Y=(1-0.2052)*184.505/(4*gdpEUR)
price=65;                     % carbon price in Euro under full abatement  
S3=3.67;                      % 1 unit of carbon=3.67 units of CO2
%% Steady State

betta=theta/rr;               % discount factor
r=pi*theta/betta;             % nominal interest rate
rG=rr+gammaG/40000;           % green rate
rB=rr+gammaB/40000;           % brown rate
rkG=rG-(1-delta);             % green capital rental rate
rkB=rB-(1-delta);             % brown capital rental rate
pI=(epsilon-1)/epsilon;       % real marginal costs
dC_Y=re_Y-bCG_Y-bCB_Y;        % public debt in cb balance sheet/GDP ratio
load x0
x0=x0+0.001;       

options = optimoptions('fsolve','MaxFunEvals',300000,'MaxIter',30000,'TolFun',1e-15);

[x,F,Fval] = fsolve(@(xx) find_steady(xx,phi,theta,delta,csi,pI,G,zeta,chi,dC_Y,re_Y,nuM,mu,rkG,rkB,bCG_Y,I_y,gdpEUR,XGtC,price,S3,RoW,deltax,varsig,betta),x0,options);
y=x(1);
pB=x(2);
e=x(3);

if csi==1
pG=((1-zeta)^(1-zeta)*zeta^(zeta)*pI*(pB)^(-zeta))^(1/(1-zeta));
else
pG=(1/(1-zeta)*(pI^(1-csi)-zeta*(pB)^(1-csi)))^(1/(1-csi));
end
erow=RoW*e;
X=(e+erow)/(1-(1-deltax)/theta); 
S1=gdpEUR/y;                         
S2=XGtC/X;                         
nuE=nuM/price*S1*S2/S3; 
yB=zeta*((pB/pI)^(-csi)*y);
yG=(1-zeta)*(pG/pI)^(-csi)*y;  
tau=nuM/nuE*mu^(chi);
i=I_y*y;
k=i/(1-(1-delta)/theta); 
pBnet=pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi);
alfa=k/(theta*(pG*yG/rkG+pBnet*yB/rkB));
kG=alfa*theta*pG*yG/(rkG);
kB=alfa*theta*pBnet*yB/(rkB);                       
hB=(yB/((kB/theta)^(alfa)))^(1/(1-alfa));
hG=(yG/((kG/theta)^(alfa)))^(1/(1-alfa));
w=(1-alfa)*pG*yG/hG;
h=hB+hG;
dC=dC_Y*4*y;
re=re_Y*4*y;
bCG=bCG_Y*4*y;
bCB=re-dC-bCG;
bHG=kG-bCG;
bHB=kB-bCB;
g=G*y;
c=y-i-g-nuM/(1+chi)*mu^(1+chi)*yB;
lam=(theta-betta*varsig)/(c*(theta-varsig));

kappaB=rB/(vB*(rB-theta/betta));
kappaG=rG/(vG*(theta/betta-rG));

% kappaG=1;
% kappaB=1;

nuG=(1-betta/theta*rG)*lam/(bHG^(-kappaG));
nuB=(betta/theta*rB-1)*lam/(bHB^(kappaB));

 

if Fval>-1           
x0=[y,pB,e];
save x0 x0
end



%% Parameters that do not affect the ss

kappaI=10.78;             % investment adjustment cost (NAWM: 10.78). 
phipi=2.74;               % mp response to inflation (NAWM)
rhor=0.93;                % monetary policy inertia (NAWM)
calvo=0.82;               % price rigidity in calvo framework (NAWM)
kappaP=(epsilon-1)*calvo/(pi^2*(1-calvo)*(1-betta*calvo));  % (CAMBIA!!!) 
iota=0.0;                % price indexation


%% Steady state values
rss=r;
piss=pi;
rG_start=rG;
rB_start=rB;
y_start=y;
pB_start=pB;
mu_start=mu;
X_start=X;
bCG_start=bCG;
re_start=re;
e_start=e;
bCB_start=bCB;
tau_start=tau;
kGshare=kG/k;



%% Save parameters

save par_trans betta alfa epsilon delta phi chi csi theta deltax erow zeta g nuE nuM nuG nuB kappaG kappaB dC...
               rG_start rB_start rss piss y_start pB_start mu_start X_start bCG_start tau_start e_start...
               kappaI phipi rhor kappaP bCB_start S1 S2 S3 tau_start kGshare re_start varsig iota
save par_plot  yG yB pBnet pG lam

if TRANS==1
console_ss_clean
elseif TRANS==0
dynare    gqe_stoch
end