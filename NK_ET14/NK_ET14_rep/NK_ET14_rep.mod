// Ellison, M. and Tischbirek, A.: ``Unconventional government debt 
//        purchases as a supplement to conventional monetary policy''
// In: Journal of Economic Dynamics and Control (2014), no. 43, pp. 199–217.

// Model replication coded by: Elisabeth Falck,     
//                             e_mail: elisa.falck@gmail.com
//                             Philipp Lieberknecht, 
//                             e_mail: philipp.lieberknecht@gmail.com

%----------------------------------------------------------------
% 0. Housekeeping 
%----------------------------------------------------------------

close all;
clc;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var Y C s G Pi L ChiC Ps PQ PB w ChiL F K A b q qbar qCB i iQ D theta nu ksi Pss; // Ps*s included, thus 26 var
varexo epsC epsL epsA epsthet epsG epsnu epsksi; // 7 shocks
parameters beta delta psi SStheta phi alpha SSPi tau gbar trho f a1 a2 
            gB gQ rhonu rhoksi rhoC rhoL rhoG rhoA rhotheta gampi gamY gampiQE 
            gamYQE SSY SSG SSC SSD SSL SSw SSs SSqbar SSPB SSPQ SSi;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

beta = 0.99;
delta = 2;
psi = 0.5;
SStheta = 6;
phi = 1.1;
alpha = 0.85;
SSPi = 1.005;
tau = 20;
gbar = 0.4;
trho = 0.5;
f = 0.66;
a1 = 0.95;
a2 = 0;
gB = 10.21;
gQ = 0.59;
rhonu = 0.1;
rhoksi = 0.1;
rhoC = 0.1;
rhoL = 0.7;
rhoG = 0.1;
rhoA = 0.7;
rhotheta = 0.95;
gampi = 1.01; 
gamY = 0.3;
gampiQE = 0;
gamYQE = 60;

%----------------------------------------------------------------
% 3. Steady State Values
%----------------------------------------------------------------

SSA = 1; //(B.26)
SSChiC = 1; //(B.26)
SSChiL = 1; //(B.26)
SSnu = 1;  //(B.26)
SSksi = 1; //(B.26)
SSD = (1-alpha)/(1-alpha*SSPi^(SStheta*phi))*((1-alpha*SSPi^(SStheta-1))/(1-alpha))^(SStheta*phi/(SStheta-1)); //(B.27)
SSY = ((1-alpha*beta*SSPi^(SStheta-1))/(1-alpha*beta*SSPi^(SStheta*phi))*SStheta*phi/(SStheta-1)*SSD^(psi)*(1-gbar)^(delta)*((1-alpha*SSPi^(SStheta-1))/(1-alpha))^((SStheta*(phi-1)+1)/(SStheta-1)))^(1/(1-delta-phi*(psi+1))); //(B.28)
SSG = gbar*SSY; //(B.29)
SSC = SSY-SSG; //(B.30)
SSF = SSY*SSC^(-delta)/(1-alpha*beta*SSPi^(SStheta-1)); //(B.31)
SSK = 1/(1-alpha*beta*SSPi^(SStheta*phi))*SStheta*phi/(SStheta-1)*SSD^(psi)*SSY^(phi*(psi+1)); //(B.32)
SSL = SSD*SSY^(phi); //(B.33)
SSw = SSL^(psi)*SSC^(delta); //(B.34)
SSPs = beta/SSPi;  //(B.35)
SSqCB = 0; //(B.36)
SSqbar = f*SSY; //(B.37)
SSq = SSqbar;  //(B.38)
SSs = SSPi/(1-beta)*(SSC + SSG - trho*SSw*SSL - (1-trho)*SSY);  //(B.39)
SSb = SSs - SSqbar/tau*(1-1/(SSPi^(tau)))*SSPi/(SSPi-1); //(B.40)
SSPss = SSPs*SSs;
SSPB = 0.9878; //(B.41)
SSPQ = 0.8927; //(B.42)
SSi = (1/SSPB)-1; //(B.43)
SSiQ = 0.011058944907359073835186213923637; // (B.44)
%----------------------------------------------------------------
% 4. Model
%----------------------------------------------------------------

model;
C + Ps*s + G = s(-1)*Pi^(-1) + trho*w*L + (1-trho)*Y; //(B.1)
1 = beta*ChiC(+1)/ChiC*((C(+1)/C)^(-delta))*(Ps*Pi(+1))^(-1); //(B.2)
w = ChiL/ChiC*L^(psi)*C^(delta); //(B.3)
(1-alpha*Pi^(theta-1))/(1-alpha) = (F/K)^((theta-1)/(theta*(phi-1)+1)); //(B.4)
F = ChiC*C^(-delta)*Y + alpha*beta*(Pi(+1))^(theta-1)*F(+1); //(B.5)
K = theta*phi/(theta-1)*ChiL*L^(psi)*(Y/A)^(phi) + alpha*beta*(Pi(+1))^(theta*phi)*K(+1); //(B.6)
s = b + 1/tau*(q + q(-1)/Pi + q(-2)/(Pi*Pi(-1)) + q(-3)/(Pi*Pi(-1)*Pi(-2)) + q(-4)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)) + q(-5)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)) + q(-6)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)) + q(-7)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)) + q(-8)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)) + q(-9)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)) + q(-10)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)) + q(-11)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)*Pi(-10)) + q(-12)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)*Pi(-10)*Pi(-11)) + q(-13)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)*Pi(-10)*Pi(-11)*Pi(-12)) + q(-14)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)*Pi(-10)*Pi(-11)*Pi(-12)*Pi(-13)) + q(-15)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)*Pi(-10)*Pi(-11)*Pi(-12)*Pi(-13)*Pi(-14)) + q(-16)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)*Pi(-10)*Pi(-11)*Pi(-12)*Pi(-13)*Pi(-14)*Pi(-15)) + q(-17)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)*Pi(-10)*Pi(-11)*Pi(-12)*Pi(-13)*Pi(-14)*Pi(-15)*Pi(-16)) + q(-18)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8)*Pi(-9)*Pi(-10)*Pi(-11)*Pi(-12)*Pi(-13)*Pi(-14)*Pi(-15)*Pi(-16)*Pi(-17)) + q(-19)/(Pi*Pi(-1)*Pi(-2)*Pi(-3)*Pi(-4)*Pi(-5)*Pi(-6)*Pi(-7)*Pi(-8))*Pi(-9)*Pi(-10)*Pi(-11)*Pi(-12)*Pi(-13)*Pi(-14)*Pi(-15)*Pi(-16)*Pi(-17)*Pi(-18)); //(B.7)
1 + i = 1/PB; //(B.8)
PQ = 1/(tau*(1+iQ))*(1-(1/(1+iQ))^(tau))/(1-1/(1+iQ)); // (B.9)
Pss = Ps*s; // inserted additionally
b = gB + (Ps*s - PB*gB - PQ*gQ)/PB*(a1 + a2*log(PB/PQ)); //(B.10)
q = gQ + (Ps*s - PB*gB - PQ*gQ)/PQ*(1 - a1 - a2*log(PB/PQ)); //(B.11)
qbar = f*SSY; //(B.12)
(1+i)/(1+SSi) = (Pi/SSPi)^(gampi)*(Y/SSY)^(gamY)*nu; //(B.13)
(qbar - qCB)/qbar = (Pi/SSPi)^(gampiQE)*(Y/SSY)^(gamYQE)*ksi; //(B.14)
qbar = q + qCB; //(B.15)
Y = C + G; //(B.16)
Y = A*(L/D)^(1/phi); //(B.17)
D = (1-alpha)*((1-alpha*Pi^(theta-1))/(1-alpha))^(theta*phi/(theta-1))+alpha*Pi^(theta*phi)*D(-1); //(B.18)
log(ChiC) = rhoC*log(ChiC(-1))+epsC; //(B.19)
log(ChiL) = rhoL*log(ChiL(-1))+epsL; //(B.20)
log(A) = rhoA*log(A(-1))+epsA; //(B.21)
log(theta/SStheta) = rhotheta * log(theta(-1)/SStheta)+epsthet; //(B.22)
log(G/SSG) = rhoG*log(G(-1)/SSG) + epsG; //(B.23)
log(nu) = rhonu*log(nu(-1)) - epsnu; //(B.24) The minus sign is to get expansionary shock
log(ksi) = rhoksi*log(ksi(-1))-epsksi; //(B.25) The minus sign is to get expansionary shock
end;

%----------------------------------------------------------------
% 5. Steady State Initialization
%----------------------------------------------------------------

initval;
A = SSA;
ChiC = SSChiC;
ChiL = SSChiL; 
nu = SSnu;  
ksi = SSksi; 
Pi = SSPi;
theta = SStheta;
D = SSD;
Y = SSY;
G = SSG;
C = SSC;
F = SSF;
K = SSK;
L = SSL;
w = SSw;
Ps = SSPs;
Pss = SSPss;
qCB = SSqCB;
qbar = SSqbar;
q = SSq;
s = SSs;
b = SSb;
PQ = SSPQ; 
PB = SSPB;
i = SSi;
iQ = SSiQ;
end;

%----------------------------------------------------------------
% 6. Computation
%----------------------------------------------------------------

shocks;
var epsnu; stderr 0.0025;
var epsksi; stderr 0.0025;
%var epsC; stderr 0.0025;
%var epsL; stderr 0.0025;
%var epsG; stderr 0.005;
%var epsA; stderr 0.01;
%var epsthet; stderr 0.06;
end;

%----------------------------------------------------------------
% 6. Run Program
%----------------------------------------------------------------

stoch_simul(order=1, irf=21, nocorr, nofunctions,nomoments,noprint, nograph); 
%irf1 = oo_.irfs
%save ET2014_rep_irf
