//Replication file
//Lubik, T.A. and Schorfheide, F. (2007): Do central banks respond to exchange rate movements?
//        A structural investigation, Journal of Monetary Economics 54. 1069-1087.

//small open economy model; a simplified version of the Gali and Monacelli (2005) model

//implemented by M.Jancokova

//*************************************************************************
//Note: the IRFs in the paper are Bayesian impulse responses, 
//    hence the replicated impulse responses do not match the IRFs in the paper precisely;
//    the impulse responses for monetary, TOT, row output and row inflatuion shock do qualitatively match the
//    IRFs in the paper; we are not able to qualitatively replicate the IRFs
//    for the technology shock (epsz)
//*************************************************************************

var y R pi z deltaq deltay_star y_bar y_star deltae pi_star inflationq interest; //A output;

varexo epsR epsq epsy_star epspi_star epsz;

parameters tau alfa rhoz beta kappa rhoR psi1 psi2 psi3 rhoq rhoy_star rhopi_star rss;


tau=0.31;                           //intertemporal substition elasticity
alfa=0.11;                          //import share
rhoz=0.42;                          //persistence in the technology growth rate
rss=2.52;                             //steady state real interest rate
beta=exp(-rss/400); //beta=0.9937     //discount factor
kappa=0.32;                         //slope coef. of the Phillips curve; function of underlying structural parameters
rhoR=0.69;                          //persistence in nom.int.rate; smoothing term
psi1=1.3;                           //policy coefficient w.r.t. inflation
psi2=0.23;                          //policy coefficient w.r.t. output
psi3=0.14;                          //policy coefficient w.r.t. nom. exch.rate diff.
rhoq=0.31;                          //persistence in TOT growth rate
rhoy_star=0.97;                     //persistence in exogenous world output
rhopi_star=0.46;                    //persistence in world inflation shock


model(linear);

//open economy IS curve
y=y(+1)-(tau+alfa*(2-alfa)*(1-tau))*(R-pi(+1))-rhoz*z-alfa*(tau+alfa*(2-alfa)*(1-tau))*deltaq(+1)+alfa*(2-alfa)*((1-tau)/tau)*deltay_star(+1);

deltay_star=y_star-y_star(-1);

//open economy Phillips curve
pi=beta*pi(+1)+alfa*beta*deltaq(+1)-alfa*deltaq+kappa/(tau+alfa*(2-alfa)*(1-tau))*(y-y_bar);

//potential output in absence of nominal rigidities 
y_bar=-alfa*(2-alfa)*(1-tau)/tau*y_star;

//CPI
pi=deltae+(1-alfa)*deltaq+pi_star;

//MP rule
R=rhoR*R(-1)+(1-rhoR)*(psi1*pi+psi2*y+psi3*deltae)+epsR;

//law of motion for the TOT growth rate
deltaq=rhoq*deltaq(-1)+epsq;

//AR(1) process of the growth rate of an underlying technology process 
z=rhoz*z(-1)+epsz;

//AR(1) processes for y_star and pi_star; introducing TOT shocks
y_star=rhoy_star*y_star(-1)+epsy_star;
pi_star=rhopi_star*pi_star(-1)+epspi_star;

inflationq = 4*pi;
interest = 4*R;
//A = z+A(-1);
//output = y+A;

end;

steady;
check;

shocks;
var epsR=0.36^2;
var epsq=1.25^2;
var epsz=0.84^2;
var epsy_star=1.29^2;
var epspi_star=2.00^2;

end;

stoch_simul(irf=12) y inflationq interest deltae;