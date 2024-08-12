%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file saves the scenario with the carbon tax + GQE
dynare gqe_trans

Tfull=length(y)-1;         % path length
T=200;

% 0 Emission and Green QE
y4=y(1:T)/y(1)-1;
c4=(c(1:T))/(c(1))-1;
i4=(I(1:T))/(I(1))-1;
h4=(h(1:T))/(h(1))-1;
k4=(k(1:T))/(k(1))-1;
pi4=4*((pi(1:T))-(pi(1)));
r4=4*((r(1:T))-(r(1)));
q4=q(1:T)/q(1)-1;
x4=(X(1:T+210))/(X(1))-1;
e4=(e/e(1))-1;
mu4=mu(1:T)-mu(1);
tau4=tt-tt(1);
price4=(price(1:T)-price(1))/100;
yG4=(yG(1:T))/(yG(1))-1;
yB4=(yB(1:T))/(yB(1))-1;
kG4=(kG(1:T))/(kG(1))-1;
kB4=(kB(1:T))/(kB(1))-1;
rG4=4*(rGE(1:T)-rGE(1));
rB4=4*(rBE(1:T)-rBE(1));
sp4=4*(sp(1:T)-sp(1));
pG4=(pG(1:T))/(pG(1))-1;
pB4=(pB(1:T))/(pB(1))-1;
hG4=(hG(1:T))/(hG(1))-1;
hB4=(hB(1:T))/(hB(1))-1;
bHG4=(bHG(1:T)-bCG_start)/(bHG(1))-1;
bHB4=(bHB(1:T)-bCB_start)/(bHB(1))-1;
bCG4=zeros(T,1);
re4=zeros(T,1);
x_ea4=(X_ea(1:T))/(X_ea(1))-1;

ab4=(nuM/(1+chi).*mu.^(1+chi).*yB)./y-(nuM/(1+chi).*mu(1).^(1+chi).*yB(1))./y(1);
save path4 y4 c4 i4 h4 k4 pi4 r4 q4 x4 e4 mu4 tau4 yG4 yB4 kG4 kB4 rG4 rB4...
     pG4 pB4 bHG4 bHB4 bCG4 re4 sp4 hG4 hB4 ab4 price4 x_ea4