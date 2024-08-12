%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file saves the scenario with the carbon tax only in an alternative scenario


dynare gqe_trans

Tfull=length(y)-1;         % path length
T=200;

% 0 Emission and Green 0
y0b=y(1:T)/y(1)-1;
c0b=(c(1:T))/(c(1))-1;
i0b=(I(1:T))/(I(1))-1;
h0b=(h(1:T))/(h(1))-1;
k0b=(k(1:T))/(k(1))-1;
pi0b=4*((pi(1:T))-(pi(1)));
r0b=4*((r(1:T))-(r(1)));
q0b=q(1:T)/q(1)-1;
x0b=(X(1:T))/(X(1))-1;
x_ea0b=(X_ea(1:T))/(X_ea(1))-1;
e0b=(e(1:T)/e(1))-1;
mu0b=mu(1:T)-mu(1);
tau0b=tt-tt(1);
price0b=(price(1:T)-price(1))/100;
yG0b=(yG(1:T))/(yG(1))-1;
yB0b=(yB(1:T))/(yB(1))-1;
kG0b=(kG(1:T))/(kG(1))-1;
kB0b=(kB(1:T))/(kB(1))-1;
rG0b=4*(rGE(1:T)-rGE(1));
rB0b=4*(rBE(1:T)-rBE(1));
sp0b=4*(sp(1:T)-sp(1));
pG0b=(pG(1:T))/(pG(1))-1;
pB0b=(pB(1:T))/(pB(1))-1;
hG0b=(hG(1:T))/(hG(1))-1;
hB0b=(hB(1:T))/(hB(1))-1;
bHG0b=(bHG(1:T))/(bHG(1))-1;
bHB0b=(bHB(1:T))/(bHB(1))-1;
bCG0b=zeros(T,1);
re0b=zeros(T,1);
bCGk0b=zeros(T,1);
hG_start_no=hG(1);
hB_start_no=hB(1);
hG_end_no=hG(end);
hB_end_no=hB(end);

ab0b=(nuM/(1+chi).*mu.^(1+chi).*yB)./y-(nuM/(1+chi).*mu(1).^(1+chi).*yB(1))./y(1);
save path0b y0b c0b i0b h0b k0b pi0b r0b q0b x0b e0b mu0b tau0b yG0b yB0b kG0b kB0b rG0b rB0b...
     pG0b pB0b bHG0b bHB0b bCG0b re0b sp0b hG0b hB0b ab0b price0b x_ea0b bCGk0b