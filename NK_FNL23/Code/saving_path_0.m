%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file saves the scenario with the carbon tax only
dynare gqe_trans

Tfull=length(y)-1;         % path length
T=400;

y0=y(1:T)/y(1)-1;
c0=(c(1:T))/(c(1))-1;
i0=(I(1:T))/(I(1))-1;
h0=(h(1:T))/(h(1))-1;
k0=(k(1:T))/(k(1))-1;
pi0=4*((pi(1:T))-(pi(1)));
r0=4*((r(1:T))-(r(1)));
q0=q(1:T)/q(1)-1;
x0=(X(1:T))/(X(1))-1;
x_ea0=(X_ea(1:T))/(X_ea(1))-1;
e0=(e(1:T)/e(1))-1;
mu0=mu(1:T)-mu(1);
tau0=tt-tt(1);
price0=(price(1:T)-price(1))/100;
yG0=(yG(1:T))/(yG(1))-1;
yB0=(yB(1:T))/(yB(1))-1;
kG0=(kG(1:T))/(kG(1))-1;
kB0=(kB(1:T))/(kB(1))-1;
rG0=4*(rGE(1:T)-rGE(1));
rB0=4*(rBE(1:T)-rBE(1));
sp0=4*(sp(1:T)-sp(1));
pG0=(pG(1:T))/(pG(1))-1;
pB0=(pB(1:T))/(pB(1))-1;
hG0=(hG(1:T))/(hG(1))-1;
hB0=(hB(1:T))/(hB(1))-1;
bHG0=(bHG(1:T))/(bHG(1))-1;
bHB0=(bHB(1:T))/(bHB(1))-1;
bCG0=zeros(T,1);
bCB0=zeros(T,1);
re0=zeros(T,1);
hG_start_no=hG(1);
hB_start_no=hB(1);
hG_end_no=hG(end);
hB_end_no=hB(end);
bCGk0=zeros(T,1);
ab0=(nuM/(1+chi).*mu.^(1+chi).*yB)./y-(nuM/(1+chi).*mu(1).^(1+chi).*yB(1))./y(1);
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
Welf0=sum(UU);

save path0 y0 c0 i0 h0 k0 pi0 r0 q0 x0 e0 mu0 tau0 yG0 yB0 kG0 kB0 rG0 rB0...
     pG0 pB0 bHG0 bHB0 bCG0 re0 sp0 hG0 hB0 ab0 price0 x_ea0 bCGk0 bCB0 Welf0