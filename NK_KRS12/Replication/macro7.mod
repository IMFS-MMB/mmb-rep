//Replication of the result of the paper by Kannan, Rabanal and Scott
//Monetary and Macroprudential Policy Rules in a Model with House Price Booms;
//Qianchao Qu, May 21st, 2012;
//This file is for replicating the impulse responses under the augmented Taylor rule plus macroprudential policy regime; 
var 
   q
   c
   i
   mu
   d
   r
   deltac
   deltap
   deltapC
   b
   p
   pC
   pD
   deltapD
   lC
   lD
   wC
   wD
   cB
   deltacB
   iB
   muB
   dB
   lCB
   lDB
   rL
   bB
   aC
   xiD
   v
   lCtot
   lDtot
   y
   ystar
   yC
   yD
   yCstar
   yDstar
   dstar
   deltabB;
   
varexo eps_A eps_D eps_v;

parameters epsilon eta beta delta lL phi alpha gamma betaB CB IB RL BB W LB kappa kappaC kappaD phiC phiD lambda thetaC thetaD C D DB L gammaR gammapi gammay gammab tau rhoC rhoD rhov;

epsilon = 0.8;
eta = 0.5;
beta = 0.99;
delta = 0.025;
lL = 1;
phi = 1;
alpha = 0.9;
gamma = 0.5378;
betaB = 0.98;

CB = 1.3705;
IB = 0.1323;
RL = 1.0204;
BB = 4.2349;
W = 0.9;
LB = 1.7659;
C = 1.5893;
D = 7.8610;
DB = 5.2936;
L = 1.5228;

kappa = 0.02; //0.05;
kappaC= 0.0858;
kappaD= 0.0858;
phiC = 1;
phiD = 1;
lambda = 0.5;
thetaC = 0.75;
thetaD = 0.75;
//monetary policy and macroprudential policy
gammaR = 0.7;
gammapi = 1.3;
gammay = 0.125;
gammab = 0.3;
tau = 0.3;
rhoC = 0.98;
rhoD = 0.95;
rhov = 0.95;

Model(linear);
// For Savers
q=pD-pC;
deltac=c-c(-1);
deltap=p-p(-1);
deltapC=pC-pC(-1);
deltapD=pD-pD(-1);
q-(c-epsilon*c(-1))/(1-epsilon)+eta*(i-i(-1))=mu+beta*eta*(i(+1)-i);
(1-beta*(1-delta))*(xiD-d)=mu-beta*(1-delta)*mu(+1);
epsilon*deltac=deltac(+1)-(1-epsilon)*(r-deltapC(+1));
(c-epsilon*c(-1))/(1-epsilon)+((phi-lL)*alpha+lL)*lC+(phi-lL)*(1-alpha)*lD=wC;
(c-epsilon*c(-1))/(1-epsilon)+((phi-lL)*(1-alpha)+lL)*lD+(phi-lL)*alpha*lC=wD;

// For Borrowers
deltacB=cB-cB(-1);
q-(cB-epsilon*cB(-1))/(1-epsilon)+eta*(iB-iB(-1))=muB+betaB*eta*(iB(+1)-iB);
(1-betaB*(1-delta))*(xiD-dB)=muB-betaB*(1-delta)*muB(+1);
epsilon*deltacB=deltacB(+1)-(1-epsilon)*(rL-deltapC(+1));
(cB-epsilon*cB(-1))/(1-epsilon)+((phi-lL)*alpha+lL)*lCB+(phi-lL)*(1-alpha)*lDB=wC;
(cB-epsilon*cB(-1))/(1-epsilon)+((phi-lL)*(1-alpha)+lL)*lDB+(phi-lL)*alpha*lCB=wD;

//Budget Constraint
CB*cB+IB*(q+iB)+RL*BB*(rL(-1)+bB(-1)-deltapC)=BB*bB+alpha*W*LB*(wC+lCB)+(1-alpha)*W*LB*(wD+lDB);

//The effective interest rate for borrowers
rL=r+kappa*(bB-dB-q)-v+tau*(bB(-1)-bB(-2)+deltapC(-1));
//the aggregate price index
deltap=gamma*deltapC+(1-gamma)*deltapD;

//the relatvie price of housing
//q=q(-1)+deltapD-deltapC;
//the production functions
yC=aC+lCtot;
yD=lDtot;
//the pricing equations
deltapC-phiC*deltapC(-1)=beta*(deltapC(+1)-phiC*deltapC)+kappaC*(wC-aC);
deltapD-phiD*deltapD(-1)=beta*(deltapD(+1)-phiD*deltapD)+kappaD*(wD-q);
//the market clearing conditons
yC=(lambda*C*c+(1-lambda)*CB*cB)/(lambda*C+(1-lambda)*CB);
yD=(lambda*delta*D*i+(1-lambda)*delta*DB*iB)/(lambda*delta*D+(1-lambda)*delta*DB);

//the law of motion of the two types of housing stocks
d=(1-delta)*d(-1)+delta*i;
dB=(1-delta)*dB(-1)+delta*iB;

//working hours in each sector
lCtot=(lambda*L*lC+(1-lambda)*LB*lCB)/(gamma*L+(1-lambda)*LB);
lDtot=(lambda*L*lD+(1-lambda)*LB*lDB)/(gamma*L+(1-lambda)*LB);

//market clearing conditions
lambda*b+(1-lambda)*bB=0;
deltabB=bB-bB(-1)+deltapC;

//Monetary policy 
r=gammaR*r(-1)+(1-gammaR)*(gammapi*deltapC(-1)+gammay*(y(-1)-ystar(-1))+gammab*(bB(-1)-bB(-2)+deltapC(-1)));
y=alpha*yC+(1-alpha)*yD;
ystar=alpha*yCstar+(1-alpha)*yDstar;
yCstar = (0.326667*aC(-1)+2/3*yCstar(-1)+1/3*eps_A);
yDstar = (-0.344897*dstar(-1)+0.24879*xiD(-1)+0.2653*yDstar(-1)+0.26188*eps_D);
dstar=(1-delta)*dstar(-1)+delta*yDstar;
//shocks
aC=rhoC*aC(-1)+eps_A;
xiD=rhoD*xiD(-1)+eps_D;
v=rhov*v(-1)+eps_v;
end;

shocks;
var eps_A;stderr 1.5;
var eps_D;stderr 2.5;
var eps_v;stderr 0.25;
end;

stoch_simul(order=1, irf=24,nograph);

close all;

prudaugtaylor=oo_.irfs;
save prudaugtaylor.mat prudaugtaylor;