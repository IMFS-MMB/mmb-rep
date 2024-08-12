%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file saves the scenario with the carbon tax + GQE

dynare gqe_trans

Tfull=length(y)-1;         % path length
T=200;

% 0 Emission and Green QE
y1=y(1:T)/y(1)-1;
c1=(c(1:T))/(c(1))-1;
i1=(I(1:T))/(I(1))-1;
h1=(h(1:T))/(h(1))-1;
k1=(k(1:T))/(k(1))-1;
pi1=4*((pi(1:T))-(pi(1)));
r1=4*((r(1:T))-(r(1)));
q1=q(1:T)/q(1)-1;
x1=(X(1:T+210))/(X(1))-1;
x_ea1=(X_ea(1:T))/(X_ea(1))-1;
e1=(e/e(1))-1;
mu1=mu(1:T)-mu(1);
tau1=tt-tt(1);
price1=(price(1:T)-price(1))/100;
yG1=(yG(1:T))/(yG(1))-1;
yB1=(yB(1:T))/(yB(1))-1;
kG1=(kG(1:T))/(kG(1))-1;
kB1=(kB(1:T))/(kB(1))-1;
rG1=4*(rGE(1:T)-rGE(1));
rB1=4*(rBE(1:T)-rBE(1));
sp1=4*(sp(1:T)-sp(1));
pG1=(pG(1:T))/(pG(1))-1;
pB1=(pB(1:T))/(pB(1))-1;
hG1=(hG(1:T))/(hG(1))-1;
hB1=(hB(1:T))/(hB(1))-1;
bHG1=(bHG(1:T))/(bHG(1))-1;
bHB1=(bHB(1:T))/(bHB(1))-1;
bCG1=(bbGG(1:T)-bCG_start)/(4*y(1));
bCB1=(bCB(1:T)-bCB_start)/(4*y(1));
bCGk1=(bbGG(1:T))/kG(1);
re1=(rre(1:T))/re_start-1;
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
Welf1=sum(UU);


ab1=(nuM/(1+chi).*mu.^(1+chi).*yB)./y-(nuM/(1+chi).*mu(1).^(1+chi).*yB(1))./y(1);
save path1 y1 c1 i1 h1 k1 pi1 r1 q1 x1 e1 mu1 tau1 yG1 yB1 kG1 kB1 rG1 rB1...
     pG1 pB1 bHG1 bHB1 bCG1 re1 sp1 hG1 hB1 ab1 price1 x_ea1 bCGk1 bCB1 Welf1