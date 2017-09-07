//***********************************************************************************************
// Dynare code to replcate Carlstrom, C. T., Fuerst, T. S., Ortiz, A., & Paustian, M. (2014).   *
// Estimating contract indexation in a financial accelerator model.                             *
// Journal of Economic Dynamics and Control, 46, 130-149.                                       *
//                                                                                              *
//                               R_k-INDEXATION PARAMETERS                                      *
//                                                                                              *
// **********************************************************************************************

close all;

var y k L mpk w p s lambda c R u i kbar wgap gdp z g miu lambdap lambdaw b mp ARMAlambdap ARMAlambdaw
    ystar kstar Lstar mpkstar wstar sstar lambdastar cstar Rstar ustar istar kbarstar wgapstar gdpstar
    Rk Rkstar q qstar Rl Rlstar Rd Rdstar Rke Rkestar nw nwstar lamefp
    spr sprstar promz promzstar 
    upsilon lamnw  lambdae lambdaestar
    credit
; 

varexo Rs zs gs mius lambdaps lambdaws bs efps upsilons nws;
//

parameters alpha delta iotap iotaw gamma100 h lambdapss lambdawss Lss pss100 Fbeta gss niu xip xiw chi Sadj fp fy fdy
           rhoR rhoz rhog rhomiu rholambdap rholambdaw rhob rhomp rhoARMAlambdap rhoARMAlambdaw
           cnu cnustar cgamma crp crpstar ckappa ctheta cchi rhoefp rhonw
           rhoupsilon gammamiu100 cb ;

// Non SD parameters 
// ------------------------------------------------------------------------
alpha= 0.16;     // share of capital in the prod. function
delta= 0.025;    // capital depreciation rate
iotap= 0.15;     // price indexation (=0 is static indexation, =1 is dynamic)
iotaw= 0.17;     // wages indexation
gamma100= 0.49;  // steady state growth rate of technology (multiplied by 100)
h= 0.88;         // habit formation 
lambdapss= 0.18; // steady state net price markup
lambdawss= 0.08; // steady state net wage markup
Lss= exp(0.33);       // steady state for log hours
pss100= 1.0072;    // steady state quarterly net inflation (multiplied by 100)
Fbeta= 0.14;     // 100 * ( inv(discount factor) - 1 )
gss = 1/(1-0.22);       // steady state government spending to GDP ratio
niu= 3.39;       // inverse Frisch elasticity
xip= 0.74;       // price stickiness
xiw= 0.66;       // wage stickiness
chi= 5.17;       // elasticity of the capital utilization cost function
Sadj= 2.43;      // investment adjustment cost
fp= 2.11;        // reaction to inflation
fy= 0.11;        // reaction to output gap
fdy= 0.2;       // reaction to output gap growth
rhoR= 0.86;
rhoz= 0.37;
rhog= 0.99;
rhomiu= 0.35;
rholambdap= 0.95;
rholambdaw= 0.96;
rhob= 0.58;
rhomp= 0.05;
rhoARMAlambdap= 0.71;
rhoARMAlambdaw= 0.99;

gammamiu100 = 0.51;
rhoupsilon = 0.89;

cnu =  0.19;   //elasticity of external finance premium with respect to leverage
cnustar = 0;    //version for potential output
cgamma= 0.94;   //entrepreneurial survival rate
crp = 0.02/4;
//crp = 0.239;    //steady-state risk premium based on sample (54Q3-04Q4) average of (BAA-AAA)/4 instead of 0.02/4 used in CFP 
crpstar = 0;    //version for potential output - WHY DO THEY DO THIS???
ckappa = 1.95; //steady-state leverage ratio (K/NW)
ctheta = 0.95;
cchi =  2.42;
rhoefp = 0.87;   //AR(1) efp shock
rhonw = 0.78;    //AR(1) nw shock
cb = 0;


model(linear);
// ------------------------------------------------------------------------
// Computation of the steady state
// ------------------------------------------------------------------------
#gamma=gamma100/100;
#gammamiu=gammamiu100/100;
#beta=100/(Fbeta+100);
#rss=exp(gamma)/beta-1;
#rss100=rss*100;
#pss=pss100/100;
//#gss=1/(1-gss);

#expLss=exp(Lss);
#Rkss=exp(gamma + gammamiu)/beta-1+delta;
#sss=1/(1+lambdapss);
#wss=(sss*((1-alpha)^(1-alpha))/((alpha^(-alpha))*Rkss^alpha))^(1/(1-alpha));
#kLss=(wss/Rkss)*alpha/(1-alpha);
#FLss=(kLss^alpha-Rkss*kLss-wss);
#yLss=kLss^alpha-FLss;
#kss=kLss*expLss;
#iss=(1-(1-delta)*exp(-gamma-gammamiu))*kss*exp(gamma+gammamiu);
#F=FLss*expLss;
#yss=yLss*expLss;
#css=yss/gss-iss;

#expg=exp(gamma);
#expgmiu=exp(gamma + gammamiu);
#kappaw=((1-xiw*beta)*(1-xiw))/(xiw*(1+beta)*(1+niu*(1+1/lambdawss)));

// eq 1 and 2, production function (y, ystar)
// ------------------------------------------------------------------------

y = (((yss+F)/yss))*alpha*k + (((yss+F)/yss)*(1-alpha))*L;

ystar = (((yss+F)/yss)*alpha)*kstar + (((yss+F)/yss)*(1-alpha))*Lstar;


// eq 3 and 4, cost minimization (L and Lstar)
// ------------------------------------------------------------------------

mpk - w = L - k;

mpkstar - wstar = Lstar - kstar;


// eq 5 and 6, marginal cost (s and sstar)
// ------------------------------------------------------------------------

s = alpha*mpk + (1-alpha)*w;

sstar = alpha*mpkstar + (1-alpha)*wstar;


// eq 7 and 8, Phillips curve (p and Rstar)
// ------------------------------------------------------------------------

p = (beta/(1+iotap*beta))*p(+1) + (iotap/(1+iotap*beta))*p(-1) + (((1-beta*xip)*(1-xip)/((1+iotap*beta)*xip)))*s + lambdap;

sstar = 0;  


// eq 9 and 10, consumption foc (c and cstar)
// ------------------------------------------------------------------------

((expg-h*beta)*(expg-h))*lambda = ((expg-h*beta*rhob)*(expg-h)/((1-rhob)*(expg-h*beta*rhob)*(expg-h)/(expg*h+expg^2+beta*h^2)))*b + ((beta*h*expg*rhoz-h*expg))*z - ((expg^2+beta*h^2))*c + (beta*h*expg)*c(+1) + (expg*h)*c(-1) + ((beta*h*expg*rhomiu-h*expg)*alpha/(1-alpha))*miu;

((expg-h*beta)*(expg-h))*lambdastar = ((expg-h*beta*rhob)*(expg-h)/((1-rhob)*(expg-h*beta*rhob)*(expg-h)/(expg*h+expg^2+beta*h^2)))*b + ((beta*h*expg*rhoz-h*expg))*z - ((expg^2+beta*h^2))*cstar + (beta*h*expg)*cstar(+1) + (expg*h)*cstar(-1) + ((beta*h*expg*rhomiu-h*expg)*alpha/(1-alpha))*miu; 


// eq 11 and 12, Euler equation (lambda and lambdastar)
// ------------------------------------------------------------------------

lambda = R + lambda(+1) - p(+1) - rhoz*z -(rhomiu*alpha/(1-alpha))*miu;

lambdastar = Rstar + lambdastar(+1) - rhoz*z -(rhomiu*alpha/(1-alpha))*miu;


// eq 13 and 14, capital utilization foc (mpk and mpkstar)
// ------------------------------------------------------------------------

mpk = chi*u;

mpkstar = chi*ustar;


// eq 15 and 16, capital foc (phi and phistar)
// ------------------------------------------------------------------------
// substituted below to include BGG and CFP

//phi = (beta*exp(-gamma)*(1-delta))*phi(+1) - rhoz*z + ((1-beta*exp(-gamma)*(1-delta)))*lambda(+1) + ((1-beta*exp(-gamma)*(1-delta)))*mpk(+1);

//phistar = (beta*exp(-gamma)*(1-delta))*phistar(+1) - rhoz*z + ((1-beta*exp(-gamma)*(1-delta)))*lambdastar(+1) + ((1-beta*exp(-gamma)*(1-delta)))*mpkstar(+1);



// eq 17 and 18, investment foc (i and istar)
// ------------------------------------------------------------------------

0 = (1/(Sadj*expgmiu^2))*q + (1/(Sadj*expgmiu^2))*upsilon - (1+beta)*i - (1-beta*rhoz)*z + beta*i(+1) + i(-1)  - (((1-beta*rhomiu))*(alpha/(1-alpha)+1))*miu;

0 = (1/(Sadj*expgmiu^2))*qstar + (1/(Sadj*expgmiu^2))*upsilon - (1+beta)*istar - (1-beta*rhoz)*z + beta*istar(+1) + istar(-1) - (((1-beta*rhomiu))*(alpha/(1-alpha)+1))*miu;
 

// eq 19 and 20, capital input (k and kstar)
// ------------------------------------------------------------------------

k = u - z + kbar(-1) -(alpha/(1-alpha)+1)*miu; 

kstar = ustar - z + kbarstar(-1) -(alpha/(1-alpha)+1)*miu;


// eq 21 and 22, capital accumulation (kbar and kbarstar)
// ------------------------------------------------------------------------

kbar = ((1-(1-delta)*exp(-gamma-gammamiu)))*upsilon + ((1-(1-delta)*exp(-gamma-gammamiu)))*i + ((1-delta)*exp(-gamma-gammamiu))*kbar(-1) - ((1-delta)*exp(-gamma-gammamiu))*z - (((1-delta)*exp(-gamma-gammamiu))*(alpha/(1-alpha)+1))*miu; 

kbarstar = ((1-(1-delta)*exp(-gamma-gammamiu)))*upsilon + ((1-(1-delta)*exp(-gamma-gammamiu)))*istar + ((1-delta)*exp(-gamma-gammamiu))*kbarstar(-1) - ((1-delta)*exp(-gamma-gammamiu))*z - (((1-delta)*exp(-gamma-gammamiu))*(alpha/(1-alpha)+1))*miu;


// eq 23 and 24, wage Phillips curve (w and wstar)
// ------------------------------------------------------------------------

w = (beta/(1+beta))*w(+1) - (kappaw)*wgap - ((1+beta*iotaw)/(1+beta))*p + (beta/(1+beta))*p(+1) - ((1+beta*iotaw-beta*rhoz)/(1+beta))*z + lambdaw + (1/(1+beta))*w(-1) + (iotaw/(1+beta))*p(-1) + (iotaw/(1+beta))*z(-1) - ((1+beta*iotaw-beta*rhomiu)/(1+beta))*(alpha/(1-alpha))*miu + (iotaw/(1+beta))*(alpha/(1-alpha))*miu(-1);

wgapstar = 0;


// eq 25 and 26, wage gap (wgap and wgapstar)
// ------------------------------------------------------------------------

wgap = w -(1/((1-rhob)*(expg-h*beta*rhob)*(expg-h)/(expg*h+expg^2+beta*h^2)))*b - niu*L + lambda; 

wgapstar = wstar - (1/((1-rhob)*(expg-h*beta*rhob)*(expg-h)/(expg*h+expg^2+beta*h^2)))*b - niu*Lstar + lambdastar;


// eq 27, monetary policy rule (R)
// ----------------------------------------

R =rhoR*R(-1) + ((1-rhoR)*fp)*p + ((1-rhoR)*fy + fdy)*gdp - ((1-rhoR)*fy+fdy)*gdpstar - (fdy)*gdp(-1) + (fdy)*gdpstar(-1) + mp;


// eq 28 and 29,definition of gdp (gdp and gdpstar)
// ------------------------------------------------------------------------

gdp = y - (kss*Rkss/yss)*u;

gdpstar = ystar - (kss*Rkss/yss)*ustar;


// eq 30 and 31, market clearing (u and ustar)
// ------------------------------------------------------------------------

(css/yss)*c + (iss/yss)*i + (kss*Rkss/yss)*u = (1/gss)*y - (1/gss)*g;

(css/yss)*cstar + (iss/yss)*istar + (kss*Rkss/yss)*ustar = (1/gss)*ystar - (1/gss)*g;


// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// NEW EQUATIONS TO AUGMENT JPT with BGG and CFP
// ------------------------------------------------------------------------
// ------------------------------------------------------------------------

// Intertemporal choice
// ------------------------------------------------------------------------

Rk(+1) = lambda - lambda(+1) + rhoz*z + cnu*(q + kbar - nw) + lamefp +(rhomiu*alpha/(1-alpha))*miu;

Rkstar(+1) = lambdastar - lambdastar(+1) - rhoz*z + cnustar*(qstar + kbarstar - nwstar) + lamefp + (rhomiu*alpha/(1-alpha))*miu; 

// Definition of realized return 
// ------------------------------------------------------------------------

Rk = (beta*exp(-gamma-gammamiu)*(1-delta))*q + ((1-beta*exp(-gamma-gammamiu)*(1-delta)))*mpk - q(-1);

Rkstar = (beta*exp(-gamma-gammamiu)*(1-delta))*qstar + ((1-beta*exp(-gamma-gammamiu)*(1-delta)))*mpkstar - qstar(-1);

////Rk(+1) - Rd(+1) = cnu*(q + kbar - nw) + lamefp;
////Rkstar(+1) - Rdstar(+1) = cnustar*(qstar + kbarstar - nwstar) + lamefp;

////Rd = lambda - lambda(+1) + rhoz*z;
////Rdstar = lambdastar - lambdastar(+1) + rhoz*z; 


// Definition of price of capital Tobin's q
// ------------------------------------------------------------------------

//q = phi - lambda;

//qstar = phistar - lambdastar;

// Evolution of Net worth
// ------------------------------------------------------------------------

nw = ckappa*(cgamma/beta)*(Rk - Rl) + (cgamma/beta)*(Rl + nw(-1)) + cgamma*ckappa*(crp/beta)*(kbar(-1) + q(-1) + Rk) - z -(alpha/(1-alpha)+1)*miu + lamnw;
//

nwstar = ckappa*(cgamma/beta)*(Rkstar - Rlstar) + (cgamma/beta)*(Rlstar + nwstar(-1)) + cgamma*ckappa*(crpstar/beta)*(kbarstar(-1) + qstar(-1) + Rkstar) - z -(alpha/(1-alpha)+1)*miu + lamnw;
//

//lender's return: In BGG Rl(-1) = Rd(-1)
// ------------------------------------------------------------------------

Rl = Rd(-1) + (1 + ctheta*(cchi - 1))*(Rk - Rke(-1)) + cb*(lambda - lambdae(-1));

Rlstar = Rdstar(-1) + (1 + ctheta*(cchi - 1))*(Rkstar - Rkestar(-1)) + cb*(lambdastar - lambdaestar(-1));

//Auxiliary: definition of the expected return to capital
// ------------------------------------------------------------------------

Rke = Rk(+1); 

Rkestar = Rkstar(+1);

lambdae = lambda(+1);

lambdaestar = lambdastar(+1);

//Definition of risk-free rate from Fisher equation
// ------------------------------------------------------------------------

Rd = R - p(+1);

Rdstar = Rstar;


//promised repayment
// ------------------------------------------------------------------------
promz = ((1 - cnu*(ckappa - 1) - ctheta)/(ctheta*(ckappa - 1)))*(q(-1) + kbar(-1) - nw(-1)) + Rke(-1) + cchi*(Rk - Rke(-1)) + cb*(lambda - lambdae(-1));
promzstar = ((1 - cnu*(ckappa - 1) - ctheta)/(ctheta*(ckappa - 1)))*(qstar(-1) + kbarstar(-1) - nwstar(-1)) + Rkestar(-1) + cchi*(Rkstar - Rkestar(-1)) + cb*(lambdastar - lambdaestar(-1));


// definition of the spread
// ------------------------------------------------------------------------
spr = Rk(+1) - Rd;
sprstar = Rkstar(+1) - Rdstar;

credit = (ckappa/(ckappa-1))*q + (ckappa/(ckappa-1))*kbar - (1/(ckappa-1))*nw ;

//2 new shock processes:
// ------------------------------------------------------------------------

lamefp = rhoefp*lamefp(-1) + efps;

lamnw = rhonw*lamnw(-1) + nws;

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// END OF NEW EQUATIONS ---------------------------------------------------
// ------------------------------------------------------------------------

// eq 32 - 40, exogenous shocks 
// ------------------------------------------------------------------------

z = rhoz*z(-1) + zs;
g = rhog*g(-1) + gs;

lambdaw = rholambdaw*lambdaw(-1) + ARMAlambdaw - rhoARMAlambdaw*ARMAlambdaw(-1);
ARMAlambdaw = lambdaws;

miu = rhomiu*miu(-1) + mius;

lambdap = rholambdap*lambdap(-1) + ARMAlambdap - rhoARMAlambdap*ARMAlambdap(-1);
ARMAlambdap = lambdaps;   

b = rhob*b(-1) + bs;
mp = rhomp*mp(-1) + Rs;

//NEW EQUATIONS RPI
//_________________________________________________________________________
//_________________________________________________________________________
upsilon = rhoupsilon*upsilon(-1) + upsilons;

end;


// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// IRF COMPARISSON BLOCK --------------------------------------------------
// ------------------------------------------------------------------------

steady;
check;

shocks;

var upsilons    =	2.39^2	;
var nws         =	0.87^2	;
var efps        =	0.08^2	;
var Rs          =	0.25^2	;

/*
var zs          =	0.89^2	;
var gs          =	0.36^2	;
var lambdaws    =	0.31^2	;
var lambdaps    =	0.27^2	;
var bs          =	0.03^2	;
var mius        =	0.59^2	;
*/
end;

options_.nograph   = 1;
stoch_simul(irf=20, ar=10); 

