%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function defines the final steady-state system

function [ F ]  = find_steady_clean(x,alfa,phi,theta,delta,csi,pI,g,zeta,chi,dC,re_start,bCG_start,nuM,kappaG,kappaB,betta,nuG,nuB,nuE,tau,mu,varsig)
y=x(1);
pB=x(2);
rG=x(3);
rB=x(4);

% y=x1(1);
% pB=x1(2);
% rG=x1(3);
% rB=x1(4);

rkG=rG-(1-delta);             
rkB=rB-(1-delta);   
if csi==1
pG=((1-zeta)^(1-zeta)*zeta^(zeta)*pI*(pB)^(-zeta))^(1/(1-zeta));
else
pG=(1/(1-zeta)*(pI^(1-csi)-zeta*(pB)^(1-csi)))^(1/(1-csi));
end
yB=zeta*((pB/pI)^(-csi)*y);
yG=(1-zeta)*(pG/pI)^(-csi)*y;   
kG=alfa*theta*pG*yG/(rkG);
pBnet=pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi);
kB=alfa*theta*pBnet*yB/(rkB);                       
hB=(yB/((kB/theta)^(alfa)))^(1/(1-alfa));
hG=(yG/((kG/theta)^(alfa)))^(1/(1-alfa));
k=kG+kB;
i=(1-(1-delta)/theta)*k;                           
w=(1-alfa)*pG*yG/hG;
h=hB+hG;
bCB=re_start-dC-bCG_start;
bHG=kG-bCG_start;
bHB=kB-bCB;
c=y-i-g-nuM/(1+chi)*mu^(1+chi)*yB;  
lam=(theta-betta*varsig)/(c*(theta-varsig));

F=[w*hB-(1-alfa)*pBnet*yB
    h^(phi)-w*lam
    nuG*(bHG^(-kappaG))-(1-betta/theta*rG)*lam
    nuB*(bHB^(kappaB))-(betta/theta*rB-1)*lam

    ];

end

