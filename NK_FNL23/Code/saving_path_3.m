%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file saves the scenario with the carbon tax + GQE
dynare gqe_trans

Tfull=length(y)-1;         % path length
T=200;

% 0 Emission and Green QE
y3=y(1:T)/y(1)-1;
c3=(c(1:T))/(c(1))-1;
i3=(I(1:T))/(I(1))-1;
h3=(h(1:T))/(h(1))-1;
k3=(k(1:T))/(k(1))-1;
pi3=4*((pi(1:T))-(pi(1)));
r3=4*((r(1:T))-(r(1)));
q3=q(1:T)/q(1)-1;
x3=(X(1:T+210))/(X(1))-1;
e3=(e/e(1))-1;
mu3=mu(1:T)-mu(1);
tau3=tt-tt(1);
price3=(price(1:T)-price(1))/100;
yG3=(yG(1:T))/(yG(1))-1;
yB3=(yB(1:T))/(yB(1))-1;
kG3=(kG(1:T))/(kG(1))-1;
kB3=(kB(1:T))/(kB(1))-1;
rG3=4*(rGE(1:T)-rGE(1));
rB3=4*(rBE(1:T)-rBE(1));
sp3=4*(sp(1:T)-sp(1));
pG3=(pG(1:T))/(pG(1))-1;
pB3=(pB(1:T))/(pB(1))-1;
hG3=(hG(1:T))/(hG(1))-1;
hB3=(hB(1:T))/(hB(1))-1;
bHG3=(bHG(1:T))/(bHG(1))-1;
bHB3=(bHB(1:T))/(bHB(1))-1;
bCG3=(bbGG(1:T)-bCG_start)/(4*y(1));
bCB3=(bCB(1:T)-bCB_start)/(4*y(1));
re3=(rre(1:T))/re_start-1;
x_ea3=(X_ea(1:T))/(X_ea(1))-1;


ab3=(nuM/(1+chi).*mu.^(1+chi).*yB)./y-(nuM/(1+chi).*mu(1).^(1+chi).*yB(1))./y(1);

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
Welf3=sum(UU);
save path3 y3 c3 i3 h3 k3 pi3 r3 q3 x3 e3 mu3 tau3 yG3 yB3 kG3 kB3 rG3 rB3...
     pG3 pB3 bHG3 bHB3 bCG3 re3 sp3 hG3 hB3 ab3 price3 x_ea3 bCB3 Welf3