//***********************************************************************************************
// Dynare code to replcate Justiniano, A., Primiceri, G. E., & Tambalotti, A. (2011).           *
// Investment shocks and the relative price of investment. Review of Economic                   *
// Dynamics, 14(1), 102-121.                                                                    *
//                                                                                              *
// **********************************************************************************************

close all;

var y k L mpk w p s lambda c R u i kbar wgap gdp z g miu lambdap lambdaw b mp ARMAlambdap ARMAlambdaw
    ystar kstar Lstar mpkstar wstar sstar lambdastar cstar Rstar ustar istar kbarstar wgapstar gdpstar
    Rk Rkstar q qstar Rd Rdstar
    upsilon 
; 

varexo Rs zs gs mius lambdaps lambdaws bs upsilons;
//

parameters alpha delta iotap iotaw gamma100 h lambdapss lambdawss Lss pss100 Fbeta gss niu xip xiw chi Sadj fp fy fdy
           rhoR rhoz rhog rhomiu rholambdap rholambdaw rhob rhoARMAlambdap rhoARMAlambdaw
           rhoupsilon gammamiu100 gammastar100
;

// Non SD parameters 
// ------------------------------------------------------------------------
alpha= 0.167;     // share of capital in the prod. function
delta= 0.025;    // capital depreciation rate
iotap= 0.131;     // price indexation (=0 is static indexation, =1 is dynamic)
iotaw= 0.092;     // wages indexation

gammastar100 = 0.3 ;                                                // steady state growth rate of composite trend (multiplied by 100)
gammamiu100 = 0.596 ;                                               // steady state growth rate of investment-specific technology (multiplied by 100)
gamma100 = gammastar100 - (alpha/(1-alpha))*gammamiu100 ;           // steady state growth rate of technology (multiplied by 100)

h= 0.858;         // habit formation 
lambdapss= 0.18; // steady state net price markup
lambdawss= 0.144; // steady state net wage markup
Lss= exp(0.194);       // steady state for log hours
pss100= 1.00701;    // steady state quarterly net inflation (multiplied by 100)
Fbeta= 0.149;     // 100 * ( inv(discount factor) - 1 )
gss = 1/(1-0.22);       // steady state government spending to GDP ratio
niu= 4.492;       // inverse Frisch elasticity
xip= 0.787;       // price stickiness
xiw= 0.777;       // wage stickiness
chi= 5.672;       // elasticity of the capital utilization cost function
Sadj= 3.142;      // investment adjustment cost
fp= 1.688;        // reaction to inflation
fy= 0.046;        // reaction to output gap
fdy= 0.211;       // reaction to output gap growth
rhoR= 0.86;
rhoz= 0.287;
rhog= 0.989;
rhomiu= 0.163;
rholambdap= 0.975;
rholambdaw= 0.962;
rhob= 0.614;
rhoARMAlambdap= 0.984;
rhoARMAlambdaw= 0.827;
rhoupsilon = 0.813;


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

Rk(+1) = lambda - lambda(+1) + rhoz*z +(rhomiu*alpha/(1-alpha))*miu;

Rkstar(+1) = lambdastar - lambdastar(+1) - rhoz*z + (rhomiu*alpha/(1-alpha))*miu; 

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

//Definition of risk-free rate from Fisher equation
// ------------------------------------------------------------------------

Rd = R - p(+1);

Rdstar = Rstar;


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
mp = Rs;

//NEW EQUATIONS RPI
//_________________________________________________________________________
//_________________________________________________________________________
upsilon = rhoupsilon*upsilon(-1) + upsilons;

end;


steady;
check;

shocks;

var upsilons    =	5.786^2	;
var Rs          =	0.21^2	;
var zs          =	0.943^2	;
var gs          =	0.369^2	;
var lambdaws    =	0.316^2	;
var lambdaps    =	0.222^2	;
var bs          =	0.034^2	;
var mius        =	0.629^2	;

end;

options_.nograph   = 1;
stoch_simul(irf=15, ar=10); 

