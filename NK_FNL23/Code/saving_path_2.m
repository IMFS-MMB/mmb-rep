%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file saves the scenario with the carbon tax + GQE
dynare gqe_trans

Tfull=length(y)-1;         % path length
T=200;

% 0 Emission and Green QE
y2=y(1:T)/y(1)-1;
c2=(c(1:T))/(c(1))-1;
i2=(I(1:T))/(I(1))-1;
h2=(h(1:T))/(h(1))-1;
k2=(k(1:T))/(k(1))-1;
pi2=4*((pi(1:T))-(pi(1)));
r2=4*((r(1:T))-(r(1)));
q2=q(1:T)/q(1)-1;
x2=(X(1:T+210))/(X(1))-1;
x_ea2=(X_ea(1:T))/(X_ea(1))-1;
e2=(e/e(1))-1;
mu2=mu(1:T)-mu(1);
tau2=tt-tt(1);
price2=(price(1:T)-price(1))/100;
yG2=(yG(1:T))/(yG(1))-1;
yB2=(yB(1:T))/(yB(1))-1;
kG2=(kG(1:T))/(kG(1))-1;
kB2=(kB(1:T))/(kB(1))-1;
rG2=4*(rGE(1:T)-rGE(1));
rB2=4*(rBE(1:T)-rBE(1));
sp2=4*(sp(1:T)-sp(1));
pG2=(pG(1:T))/(pG(1))-1;
pB2=(pB(1:T))/(pB(1))-1;
hG2=(hG(1:T))/(hG(1))-1;
hB2=(hB(1:T))/(hB(1))-1;
bHG2=(bHG(1:T))/(bHG(1))-1;
bHB2=(bHB(1:T))/(bHB(1))-1;
bCG2=(bbGG(1:T)-bCG_start)/(4*y(1));
bCB2=(bCB(1:T)-bCB_start)/(4*y(1));
bCGk2=(bbGG(1:T))/kG(1);
re2=(rre(1:T))/re_start-1;
%% Welfare
% TFP
zz=zeros(T+1,1);
zz(1)=1;
for j=2:T+1
zz(j)=zz(j-1)*theta;
end
% Utilities
UU=zeros(T,1);
for j=1:T
UU(j)=betta^(j-1)*(log(c(j)*zz(j+1)-varsig*zz(j))-1/(1+phi)*h(j)^(1+phi)+nuG/(1-kappaG)*bHG(j)^(1-kappaG)-nuB/(1+kappaB)*bHB(j)^(1+kappaB));    
end
% Welfare
Welf2=sum(UU);

ab2=(nuM/(1+chi).*mu.^(1+chi).*yB)./y-(nuM/(1+chi).*mu(1).^(1+chi).*yB(1))./y(1);
save path2 y2 c2 i2 h2 k2 pi2 r2 q2 x2 e2 mu2 tau2 yG2 yB2 kG2 kB2 rG2 rB2...
     pG2 pB2 bHG2 bHB2 bCG2 re2 sp2 hG2 hB2 ab2 price2 x_ea2 bCGk2 bCB2 Welf2