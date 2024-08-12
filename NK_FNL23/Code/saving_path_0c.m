%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file saves the scenario with the carbon tax+Green QE to compute the bond functions in Figure 3

dynare gqe_trans

Tfull=length(y)-1;         % path length
T=200;

% 0 Emission and Green 0
y0c=y(1:T)/y(1)-1;
c0c=(c(1:T))/(c(1))-1;
i0c=(I(1:T))/(I(1))-1;
h0c=(h(1:T))/(h(1))-1;
k0c=(k(1:T))/(k(1))-1;
pi0c=4*((pi(1:T))-(pi(1)));
r0c=4*((r(1:T))-(r(1)));
q0c=q(1:T)/q(1)-1;
x0c=(X(1:T))/(X(1))-1;
x_ea0c=(X_ea(1:T))/(X_ea(1))-1;
e0c=(e(1:T)/e(1))-1;
mu0c=mu(1:T)-mu(1);
tau0c=tt-tt(1);
price0c=(price(1:T)-price(1))/100;
yG0c=(yG(1:T))/(yG(1))-1;
yB0c=(yB(1:T))/(yB(1))-1;
kG0c=(kG(1:T))/(kG(1))-1;
kB0c=(kB(1:T))/(kB(1))-1;
rG0c=4*(rGE(1:T)-rGE(1));
rB0c=4*(rBE(1:T)-rBE(1));
sp0c=4*(sp(1:T)-sp(1));
pG0c=(pG(1:T))/(pG(1))-1;
pB0c=(pB(1:T))/(pB(1))-1;
hG0c=(hG(1:T))/(hG(1))-1;
hB0c=(hB(1:T))/(hB(1))-1;
bHG0c=(bHG(1:T))/(bHG(1))-1;
bHB0c=(bHB(1:T))/(bHB(1))-1;
bCG0c=zeros(T,1);
re0c=zeros(T,1);
bCGk0c=zeros(T,1);
hG_start_no=hG(1);
hB_start_no=hB(1);
hG_end_no=hG(end);
hB_end_no=hB(end);

ab0c=(nuM/(1+chi).*mu.^(1+chi).*yB)./y-(nuM/(1+chi).*mu(1).^(1+chi).*yB(1))./y(1);
save path0c y0c c0c i0c h0c k0c pi0c r0c q0c x0c e0c mu0c tau0c yG0c yB0c kG0c kB0c rG0c rB0c...
     pG0c pB0c bHG0c bHB0c bCG0c re0c sp0c hG0c hB0c ab0c price0c x_ea0c bCGk0c