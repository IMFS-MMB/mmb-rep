//% The calibrated parameters below match the impulse responses of the estimated full model
//% of Iacoviello (AER, 2005)

//% We replicate the IRF to a monetary policy shock

//% Declaration of endogenous variable
Var 
//% basic endogeneous variables
Yhat, 
chat,
c1hat,
c2hat,
Ihat,
Khat,
Xhat,
qhat,
bhat,
b2hat,
hhat,
h2hat,
pihat,
Rhat,

//% Defined variable(s)
rrhat,

//% Endogenous variables with exogenous dynamics

jhat,
Ahat,
uhat;


//% Declaration of exogeneous variables (shocks)
Varexo
ejhat,
euhat,
eAhat,
eRhat;


parameters
//% deep parameters
beta,
beta2,
gamma,
j,
eta,
my,
ypsilon,
psi,
delta,
fie,
fih,
X,
theta,
alfa,
m,
m2,
rhou,
rhoj,
rhoA,
sigmau,
sigmaj,
sigmaA,
sigmaR,
rR,
rpi,
rY,
h1ss,                      //% h1ss is steady state stock of houses owned by
                           //% patient hoeseholds
gammae,
gammah,
omega,
kappa,
s1,
s2,
qhtoY,
btoY,
c1toY,
qh1toY,
qh2toY,
htoh1,
h2toh1,
b2toY,
c2toY,
ctoY,
ItoY,
jota,
jota2,
R;


//% Setting of numerical values for parameters
beta = 0.99;
beta2 = 0.95;
gamma = 0.98;
j = 0.1;
eta = 1.01;
my = 0.3;
ypsilon = 0.03;
psi = 2;
delta = 0.03;
fie = 0;
fih = 0;
X = 1.05;
theta = 0.75;
alfa = 0.64;
m = 0.89;
m2 = 0.55;
rhou = 0.59;
rhoj = 0.85;
rhoA = 0.03;
sigmau = 0.17;
sigmaj = 24.89;
sigmaA = 2.24;
sigmaR = 0.29;
rR = 0.73;
rpi = 0.27;
rY = 0.13;

//%rY=0;
//%alfa=0.99999;
//%my=0;


//% Defined parameters
gammae = (1-m)*gamma + m*beta;
gammah = beta2+m2*(beta-beta2);
omega = (beta2-m2*beta2)/(1-m2*beta);
kappa = (1-theta)*(1-beta*theta)/theta;
s1 = (alfa*(1-my-ypsilon)+X-1)/X;
s2 = (1-alfa)*(1-my-ypsilon)/X;
qhtoY = gamma*ypsilon/(X*(1-gammae));
btoY = beta*m*qhtoY;


qh1toY = j*s1/(1-beta)+j*m*qhtoY+j*m2*s2/(1-beta2-m2*(beta-beta2-j*(1-beta)));
qh2toY = j*s2/(1-beta2-m2*(beta-beta2-j*(1-beta)));

c1toY = s1+(1-beta)*(m*qhtoY+m2*qh2toY) ;

htoh1 = qhtoY/qh1toY;
h2toh1 = qh2toY/qh1toY;

b2toY = j*beta*m2/(1-beta2-m2*(beta-beta2)+j*m2*(1-beta))*s2 ;

c2toY = s2*(1-beta2-m2*(beta-beta2))/(1-beta2-m2*(beta-beta2)+j*m2*(1-beta));

ctoY = (my+ypsilon-delta*gamma*my/(1-gamma*(1-delta))-(1-beta)*m*X*qhtoY)/X;
ItoY = 1-ctoY-c1toY-c2toY;
jota = (1-beta)*htoh1;
jota2 = (1-beta)*h2toh1;
R = 1/beta;



//% Model equations
model;
Yhat = ctoY*chat+c1toY*c1hat+c2toY*c2hat+ItoY*Ihat;

c1hat = c1hat(+1)-rrhat;

Ihat = Khat(-1)+gamma*(Ihat(+1)-Khat)+(1-gamma*(1-delta))*(Yhat(+1)-Xhat(+1)-Khat)/(psi)
     +(chat-chat(+1))/(psi);

qhat = gammae*qhat(+1)+(1-gammae)*(Yhat(+1)-Xhat(+1)-hhat)-m*beta*rrhat
     -(1-m*beta)*(chat(+1)-chat)-fie*(hhat-hhat(-1)-gamma*(hhat(+1)-hhat));

qhat = gammah*qhat(+1)+(1-gammah)*(jhat-h2hat)-m2*beta*rrhat+(1-m2*beta)*(c2hat-omega*c2hat(+1))
     -fih*(h2hat-h2hat(-1)-beta2*(h2hat(+1)-h2hat));

qhat = beta*qhat(+1)+(1-beta)*jhat+jota*hhat+jota2*h2hat+c1hat-beta*c1hat(+1)
     +fih*(htoh1*(hhat-hhat(-1))+h2toh1*(h2hat-h2hat(-1))-beta*htoh1*(hhat(+1)-hhat)-beta*h2toh1*(h2hat(+1)-h2hat));

bhat = qhat(+1)+hhat-rrhat;

b2hat = qhat(+1)+h2hat-rrhat;

Yhat = eta*(Ahat+ypsilon*hhat(-1)+my*Khat(-1))/(eta-(1-ypsilon-my))
     -(1-ypsilon-my)*(Xhat+alfa*c1hat+(1-alfa)*c2hat)/(eta-(1-ypsilon-my));

pihat = beta*pihat(+1)-kappa*Xhat+uhat;

Khat = delta*Ihat+(1-delta)*Khat(-1);

btoY*bhat = ctoY*chat+qhtoY*(hhat-hhat(-1))+ItoY*Ihat+R*btoY*(Rhat(-1)+bhat(-1)-pihat)
          -(1-s1-s2)*(Yhat-Xhat);

b2toY*b2hat = c2toY*c2hat+qh2toY*(h2hat-h2hat(-1))+R*b2toY*(b2hat(-1)+Rhat(-1)-pihat)-s2*(Yhat-Xhat);

Rhat = (1-rR)*(1+rpi)*pihat(-1)+rY*(1-rR)*Yhat(-1)+rR*Rhat(-1)+eRhat;

//% Defined variable(s)
rrhat = Rhat-pihat(+1);

//% equations for variables with exogenous AR(1)-dynamics
jhat = rhoj*jhat(-1)+ejhat;
uhat = rhou*uhat(-1)+euhat;
Ahat = rhoA*Ahat(-1)+eAhat;
end;                        
//% End of model block


//% calculation of steady state


//steady;

//check;


shocks;
var eRhat;
stderr sigmaR;
var euhat;
stderr sigmau;
var ejhat;
stderr sigmaj;
var eAhat;
stderr sigmaA;
end;

stoch_simul(irf=20, nograph, noprint) Rhat pihat qhat Yhat;


