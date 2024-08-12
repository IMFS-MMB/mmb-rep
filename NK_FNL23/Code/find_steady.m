%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function defines the initial steady-state system

function [ F ]  = find_steady(x,phi,theta,delta,csi,pI,G,zeta,chi,dC_Y,re_Y,nuM,mu,rkG,rkB,bCG_Y,I_y,gdpEUR,XGtC,price,S3,RoW,deltax,varsig,betta)
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

F=[w*hB-(1-alfa)*pBnet*yB
    h^(phi)-w*lam
    e-(1-mu)*nuE*yB
    ];

end

