//Replication file
//Ireland, Peter N. (2011): A New Keynesian Perspective on the Great Recession,
//      Journal of Money, Credit and Banking, Vol.43, No.1, 31-54.

//small-scale New Keynesian model

//implemented by M.Jancokova

var a lambda y z r pi e g q x inflationq interest output Z_au;

varexo epsa epse epsz epsr;

parameters gamma alfa rhopi rhog rhoa rhoe zeta beta psi; 

//Note: the cost-push shock and some related parameters are renormalized to make the 
//          innovation normally distributed with mean zero (see page 40 in the paper)

//estimated parameters (maximum likelihood estimates)
gamma=0.3904;       //habit formation parameter
alfa=0;             //indexation parameter, for alfa=0 the price setting is purely forward looking
rhopi=0.4153;       //response coefficient of the Taylor rule
rhog=0.1270;        //response coefficient of the Taylor rule
rhoa=0.9797;        //persistence in the preference shock
rhoe=0;             //persistence in the renormalized cost-push shock

//calibrated parameters
zeta=1.0046;        //drift of the AR(1) technology process
beta=0.9987;        //discount factor
psi=0.10;           //Phillips Curve parameter; equals the original model parameters (theta-1)/phi

model (linear);

//c=y;

//law of motion for the preference shock
a=rhoa*a(-1)+epsa;

//marginal utility of consumption in terms of past, present and expected future output with habit formation in preferences
(zeta-beta*gamma)*(zeta-gamma)*lambda=gamma*zeta*y(-1)-(zeta^2+beta*gamma^2)*y+ beta*gamma*zeta*y(+1)+(zeta-beta*gamma*rhoa)*(zeta-gamma)*a-gamma*zeta*z;

//IS curve
lambda=r+lambda(+1)-pi(+1);

//law of motion for the renormalized cost-push shock 
e=rhoe*e(-1)+epse;

//law of motion for the technology shock
z=epsz;

//New Keynesian Phillips Curve
(1+beta*alfa)*pi=alfa*pi(-1)+beta*pi(+1)-psi*lambda+psi*a+e;

//monetary policy rule
r-r(-1)=rhopi*pi+rhog*g+epsr;

//growth rate of output
g=y-y(-1)+z;

//efficient level of output
0=gamma*zeta*q(-1)-(zeta^2+beta*gamma^2)*q+beta*gamma*zeta*q(+1)+beta*gamma*(zeta-gamma)*(1-rhoa)*a-gamma*zeta*z;

//output gap 
x=y-q;

//annualized inflation and interest rate
inflationq=pi*4;
interest=r*4;

//output and outputgap in levels
Z_au=z+Z_au(-1);
output=y+Z_au;


end;

steady;
check;

shocks;
var epsa=(0.0868*100)^2;      //preference shock
var epse=(0.0017*100)^2;      //renormalized cost-push shock
var epsz=(0.0095*100)^2;      //technology shock
var epsr=(0.0014*100)^2;      //monetary policy shock

end;

stoch_simul(irf=20, nograph, noprint) output inflationq interest x;