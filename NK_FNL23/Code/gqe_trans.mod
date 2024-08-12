%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This code simulates the transition to a zero emission economy

close all;
warning off

% Specify the intratemporal elasticity between green and brown sector: if ela=1, csi=1 and final output is cobb douglas
% Specify if you are simulating a Green QE: if gqe=1, Green QE, if gqe=0, no Green QE
% Specify if you want save bond functions: BOND=1, yes, BOND=0 no

@#define ela =  0
@#define gqe =  1
BOND=0;
%%%%%%%%%%%%%%%%%%%%%%%Endogenous Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var
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
mu
e
X
lam
rGE
rBE
sp
price
X_ea
;
%%
%%%%%%%%%%%%%%%%%%%%%%%Exogenous Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varexo 
tau
re
bCG
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
bCB_start
re_start
erow
rss
piss
y_clean 
pB_clean
rG_clean
rB_clean
mu_clean
e_clean
bCG_end
varsig
iota
kappaI
phipi
rhor
kappaP
kappaG
kappaB
S1
S2
S3

;

load par_trans;  % load mat file created in console_ss
load par_clean;  % load mat file created in console_ss_clean

for jj=1:length(M_.param_names)
set_param_value(M_.param_names{jj},eval(M_.param_names{jj})); 
end;
              


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
yG=(kG(-1)/theta)^(alfa)*hG^(1-alfa);                                  %(9)
yB=(kB(-1)/theta)^(alfa)*hB^(1-alfa);                                 %(10)
(1-alfa)*pG                                        *yG=w*hG;          %(11)
(1-alfa)*(pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi))*yB=w*hB;          %(12)
alfa*pG                                        *yG=rkG*kG(-1)/theta;  %(13)
alfa*(pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi))*yB=rkB*kB(-1)/theta;  %(14)
rkG=rG*q(-1)-(1-delta)*q;                                             %(15)
rkB=rB*q(-1)-(1-delta)*q;                                             %(16)
mu=(nuE/nuM*tau)^(1/chi);                                             %(17)
% Pollution
X=(1-deltax)*X(-1)/theta+e+erow;                                      %(18)
e=(1-mu)*nuE*yB;                                                      %(19)
%Capital-firms
k=(1-delta)*k(-1)/theta+(1-kappaI/2*(I/I(-1)*theta-theta)^2)*I;       %(20)
1=q*(1-kappaI/2*(I/I(-1)*theta-theta)^2-kappaI*(I/I(-1)*theta-theta)*I/I(-1)*theta)+kappaI*betta*lam(1)/(lam*theta)*q(1)*(I(1)/I*theta-theta)*(I(1)/I*theta)^2; %(21)   
% Market clearing                
h=hG+hB;                                                              %(22)
k=kG+kB;                                                              %(23)
bHG+bCG=q*kG;                                                         %(24)
bHB+bCB=q*kB;                                                         %(25)
y=c+I+g+ yB*nuM/(1+chi)*mu^(1+chi)+y*kappaP/2*(pi-pi(-1)^(iota)*piss^(1-iota))^2;            %(26)
% Policy
bCG+bCB+dC=re;                                                        %(27)
r/(rss)=((pi/piss)^(phipi))^(1-rhor)*(r(-1)/rss)^(rhor);              %(28)

% Other variables
lam=1/(c-varsig*c(-1)/theta)-betta*varsig/(c(1)*theta-varsig*c);      %(29)
sp=rG(1)-rB(1);
rGE=rG(1);
rBE=rB(1);
price=tau*S1*S2/S3; 
X_ea=(1-deltax)*X_ea(-1)/theta+e;
end;


initval;
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
bHG=kG-bCG;
bCB=re-bCG-dC;
bHB=kB-bCB;
c=y-I-g-nuM/(1+chi)*mu^(1+chi)*yB;   
sp=rG-rB;
rGE=rG;
rBE=rB;
price=tau*S1*S2/S3; 
X_ea=e/(1-(1-deltax)/theta);
lam=(theta-betta*varsig)/(c*(theta-varsig));
end;

steady;

endval;
pi=piss;
q=1;
r=pi*theta/betta;             
rG=rG_clean;                        
rB=rB_clean;                        
rkG=rG-(1-delta);             
rkB=rB-(1-delta);             
pI=(epsilon-1)/epsilon;  
y=y_clean;
pB=pB_clean;
mu=mu_clean;
e=e_clean;
X=(erow+e)/(1-(1-deltax)/theta);
@#if gqe
bCG=bCG_end;   
re=re_end;
@#else
bCG=bCG_start; 
re=re_start;
@#endif
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
bCB=re-bCG-dC;
bHG=kG-bCG;
bHB=kB-bCB;
c=y-I-g-nuM/(1+chi)*mu^(1+chi)*yB;   
sp=rG-rB;
rGE=rG;
rBE=rB;
price=tau*S1*S2/S3; 
X_ea=e/(1-(1-deltax)/theta);
lam=(theta-betta*varsig)/(c*(theta-varsig));
end;
 
steady;

% Policy values (we start from period 2, becuase period 1 (the steady state) will be added by Dynare by the default
t2=tt(2:end);                   % taxes
re2=rre(2:end);                 % reserves
bCG2=bbGG(2:end);               % green bonds
shocks;
% Green QE...
@#if gqe
var tau;
periods 1:420;
values (t2);
var re;
periods 1:420;
values (re2);
var bCG;
periods 1:420;
values (bCG2);
% No Green QE...
@#else
var tau;
periods 1:420;
values (t2);
var re;
periods 1:420;
values (re_start);
var bCG;
periods 1:420;
values (bCG_start);
@#endif
end;


perfect_foresight_setup(periods=420);
perfect_foresight_solver;
% If it is 0, ss output is equal to the final value: this must be the case when gqe is 0 in the long run
steady_state_proof=100*abs(y_clean-oo_.steady_state(8))

if BOND==1
save par_bond bHB bHG
end