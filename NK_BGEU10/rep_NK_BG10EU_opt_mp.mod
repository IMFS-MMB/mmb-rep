// Replication of Blanchard/Gali (2010), Optimal Monetary Policy (EU specification)
var pi uhat a eta inflation; 
varexo a_; 

parameters gam alf the bet phi eps lam M gdel ra x u del g B chi bphi alfux gmu xi0 xi1 k0 kl kf rho; 

x  = 0.25;                                                          
u  = 0.1;                                                     
B = 5/42;

gam  = 0.5;         
alf  = 1;           
the  = 1;           
bet  = 0.99;        
phi  = 1;           
eps  = 6;           
lam = 1/12;        
M = eps/(eps-1);    
gdel = 0.01;       

ra = 0.9;

del = u*x/((1-u)*(1-x));
g = B*x^alf;

N      = 1-u;
chi    = ((1/M) -(1-bet*(1-del))*(1+the)*g-bet*(1-del)*the*g*x)/(N^(1+phi)*(1-del*g));
 
bphi = 1-(1-bet*(1-del))*g*M ;
alfux = (lam*(1+phi)*chi*(1-u)^(phi-1))/eps ;
gmu = g*M/(1-u);
xi0 = (1-(1+alf)*g)/(1-del*g) ;
xi1 = g*(1-del)*(1+alf*(1-x))/(1-del*g) ;
k0 = lam*( (alf*gmu/del)*(1+bet*(1-del)^2*(1-x))+  bet*(1-del)*gmu*(xi1-xi0));
kl = lam*((alf/del)*gmu*(1-del)*(1-x) + bet*(1-del)*gmu*xi1 );
kf = lam*bet*(1-del)*gmu*((alf/del)-xi0);
rho = -log(bet);

model(linear); 
pi  =  bet * pi(+1) - k0*uhat + kl*uhat(-1) + kf*uhat(+1) - lam*bphi*gam * a; 
pi + eta - eta(-1);  
alfux*uhat + k0*eta - bet*kl*eta(+1)-1/bet*kf*eta(-1);    
a = ra* a(-1) - a_;  
inflation = pi*4;    
end; 

shocks; 
var a_; 
stderr 1; 
end; 

steady; 
check; 
stoch_simul (irf = 31, ar=100, nograph); 
