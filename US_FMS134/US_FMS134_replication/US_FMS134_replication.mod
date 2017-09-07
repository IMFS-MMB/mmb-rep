//   Title: A Pitfall with Estimated DSGE-Based Government Spending Multipliers 
//   Authors: Feve, Patrick, Julien Matheron and Jean-Guillaume Sahuc. 2013. 
//   Publication: American Economic Journal: Macroeconomics, 5(4): 141-78.  
//   This file simulates the dynamic response of the model with endogenous government spending 
//   and allowing for Edgeworth Complementarity, to specific shocks

%***************************************************************************
% 1. Variables
%***************************************************************************

var dyobs dcobs dxobs dwobs inflobs robs labobs2 dgobs 
y c x w infl r labor cstar k u kp lambda q rk mc g mrs
yf cf xf wf rf laborf kf uf kpf lambdaf qf rkf gf cstarf
ez eb ex ep eg ew;


varexo zetaz zetab zetax zetap zetaw zetar zetag;

%---------------------------------------------------------------------------
% 2. Defining parameters
%---------------------------------------------------------------------------

parameters 
gammaz psiu etak hab omega thetaw thetap gammaw gammap lambdap 
lambdaw rhoinfl rhoy rhody rhoz rhow rhob rhos rhox rhop rhog 
consteinfl constelabor conster delta alpha gsy beta alphag phig egamma 
rkbar wbar ksl fsl ysl fsy xsl xsy csy ksy kappa 
kappaw etau;

//******************************
// 2.(a) Fixed parameters
//******************************

beta    = 0.99;
delta   = 0.025;
%alpha   = 0.33;
gsy     = 0.20;
lambdaw = 0.15;
%lambdap = 0.15;
%omega   = 2;
phig    = 0.7871;        // endogenous fiscal policy 

//******************************
// 2.(b) Posterior means of Estimated parameters
//******************************

alpha    = 0.2037;
gammaz   = 0.4475;       // q-o-q SS GDP growth rate (drift)
alphag   = -0.6743;      // allowing for Edgeworth complementarity
psiu     = 0.7275;
etak     = 5.1673;
omega    = 2.9482;
hab      = 0.6287;
thetaw   = 0.8824;
thetap   = 0.8635;
gammaw   = 0.7153;
gammap   = 0.0903;
lambdap  = 0.2419;
rhoinfl  = 1.5189;
rhoy     = 0.0075;
rhody    = 0.2394;
rhoz     = 0.1667;
rhos     = 0.7987;      // autocorr. coef. on r
rhob	 = 0.8024;
rhox	 = 0.9498;
rhop     = 0.8669;
rhog     = 0.9724;
rhow	 = 0.2376;
consteinfl  = 0.7341;    // q-o-q SS inflation rate
constelabor = -0.4306;
conster     = 1.2285;

//******************************
// 2.(c) Steady-states
//******************************

egamma = exp(gammaz/100);
rkbar  = egamma/beta - (1-delta);
wbar   = (1/(1+lambdap)*(alpha^alpha)*((1-alpha)^(1-alpha))/(rkbar^alpha))^(1/(1-alpha));
ksl    = wbar/rkbar*alpha/(1-alpha);
fsl    = ksl^alpha - wbar - rkbar*ksl;
ysl    = ksl^alpha-fsl;
fsy    = fsl/ysl;
xsl    = (1-(1-delta)/egamma)*egamma*ksl;
xsy    = xsl/ysl;
csy    = 1 - xsy - gsy;
ksy    = ksl/ysl;
kappa  = (1-beta*thetap)*(1-thetap)/(thetap*(1+beta*gammap));
kappaw = (1-beta*thetaw)*(1-thetaw)/(thetaw*(1+beta)*(1+omega*(1+1/lambdaw)));
etau   = (1-psiu)/psiu;
                                            
//**************************************************************************

%---------------------------------------------------------------------------
% 4. Model
%---------------------------------------------------------------------------

model(linear); 


//***********************
// 5.(a) Flexible block 
//***********************
// Effective capital
kf  = uf + kpf(-1) - ez;
// Physical capital accumulation
kpf = ((1-delta)/egamma)*(kpf(-1)-ez) + (1-(1-delta)/egamma)*( xf + (etak*egamma^2*(1+beta))*ex);

// Marginal utility of consumption
lambdaf = hab*beta*egamma/((egamma-hab*beta)*(egamma-hab))*cstarf(+1) - (egamma^2+hab^2*beta)/((egamma-hab*beta)*(egamma-hab))*cstarf
+ hab*egamma/((egamma-hab*beta)*(egamma-hab))*cstarf(-1) + (hab*beta*egamma*rhoz-hab*egamma)/((egamma-hab*beta)*(egamma-hab))*ez+ (((egamma^2+beta*hab^2+egamma*hab))/((egamma-hab)*(egamma-beta*hab)*(1-rhob)))*eb ;

// Consumption euler equation
cstarf=(hab*beta*egamma+(egamma^2+hab^2*beta))/(egamma^2+hab^2*beta+hab*egamma)*cstarf(+1) 
-(hab*beta*egamma)/(egamma^2+hab^2*beta+hab*egamma)*cstarf(+2) 
+ (hab*egamma)/(egamma^2+hab^2*beta+hab*egamma)*cstarf(-1) 
+ ((egamma-hab)*(egamma-beta*hab)*rhoz-(beta*hab*egamma*rhoz-egamma*hab)*(rhoz-1))/(egamma^2+hab^2*beta+hab*egamma)*ez
-((egamma-hab*beta)*(egamma-hab))/(egamma^2+hab^2*beta+hab*egamma)*(rf)
+eb;


// Consumption services
cstarf = (csy/(csy+alphag*gsy))*cf + (alphag*gsy/(csy+alphag*gsy))*gf;

// Investment
xf = 1/(1+beta)*(xf(-1)-ez) + 1/(etak*egamma^2*(1+beta))*qf + beta/(1+beta)*(xf(+1)+ez(+1)) + ex;

// Tobin's Q
qf = beta*(1-delta)/egamma*qf(+1) + (1-beta*(1-delta)/egamma)*rkf(+1) - (rf);

// Capital utilization
uf = etau*rkf;

// Production function
yf = (1+fsy)*(alpha*kf + (1-alpha)*laborf);

// Labor demand
wf = alpha*kf-alpha*laborf;

// Capital renting
rkf = (1-alpha)*laborf - (1-alpha)*kf;

// Wage curve
wf = omega*laborf+((egamma^2+hab^2*beta+hab*egamma)/((1-rhob)*(egamma-hab*beta*rhob)*(egamma-hab)))*eb-lambdaf;

// Government spending
gf = -phig*(yf-yf(-1)+ez) + eg;

//Resource constraint
yf = csy*cf + xsy*xf + gf*gsy + rkbar*ksy*uf;

//*************************************
// 5.(b) Sticky price/sticky wage block
//*************************************

// Effective capital
k  = u + kp(-1) - ez;

// Physical capital accumulation
kp = ((1-delta)/egamma)*(kp(-1)-ez) + (1-(1-delta)/egamma)*( x + (etak*egamma^2*(1+beta))*ex);

// Marginal utility of consumption
lambda = hab*beta*egamma/((egamma-hab*beta)*(egamma-hab))*cstar(+1) - (egamma^2+hab^2*beta)/((egamma-hab*beta)*(egamma-hab))*cstar
+ hab*egamma/((egamma-hab*beta)*(egamma-hab))*cstar(-1) + (hab*beta*egamma*rhoz-hab*egamma)/((egamma-hab*beta)*(egamma-hab))*ez
+ (((egamma^2+beta*hab^2+egamma*hab))/((egamma-hab)*(egamma-beta*hab)*(1-rhob)))*eb ;

// Consumption euler equation
cstar = (hab*beta*egamma+(egamma^2+hab^2*beta))/(egamma^2+hab^2*beta+hab*egamma)*cstar(+1) 
-(hab*beta*egamma)/(egamma^2+hab^2*beta+hab*egamma)*cstar(+2) 
+ (hab*egamma)/(egamma^2+hab^2*beta+hab*egamma)*cstar(-1) 
+ ((egamma-hab)*(egamma-beta*hab)*rhoz-(beta*hab*egamma*rhoz-egamma*hab)*(rhoz-1))/(egamma^2+hab^2*beta+hab*egamma)*ez
-((egamma-hab*beta)*(egamma-hab))/(egamma^2+hab^2*beta+hab*egamma)*(r-infl(+1))
+eb;

// consumption services
cstar = (csy/(csy+alphag*gsy))*c + (alphag*gsy/(csy+alphag*gsy))*g;

// Investment
x = 1/(1+beta)*(x(-1)-ez) + 1/(etak*egamma^2*(1+beta))*q + beta/(1+beta)*(x(+1)+ez(+1)) + ex;

// Tobin's Q
q = beta*(1-delta)/egamma*q(+1) + (1-beta*(1-delta)/egamma)*rk(+1) - (r - infl(+1));

// Capital utilization
u = etau*rk;

// Production function
y = (1+fsy)*(alpha*k + (1-alpha)*labor);

// Labor demand
w = mc + alpha*k - alpha*labor;

// Capital renting
rk = mc - (1-alpha)*k + (1-alpha)*labor;

// Phillips curve
infl = beta/(1+gammap*beta)*infl(+1) + gammap/(1+gammap*beta)*infl(-1) + kappa*mc + ep;

// Wage curve
w = ( 1/(1+beta)*w(-1) + beta/(1+beta)*w(+1)+kappaw*mrs + gammaw/(1+beta)*infl(-1) - (1+beta*gammaw)/(1+beta)*infl + beta/(1+beta)*infl(+1)
- (1-rhoz*beta)/(1+beta)*ez )/(1+kappaw) + ew ;

// MRS
mrs = (omega*labor+((egamma^2+hab^2*beta+hab*egamma)/((1-rhob)*(egamma-hab*beta*rhob)*(egamma-hab)))*eb-lambda );

// Government spending
g = -phig*(y-y(-1)+ez) + eg;

// Monetary policy
r = rhos*r(-1) + (1-rhos)*(rhoinfl*(infl)+rhoy*(y-yf)) + rhody*((y-y(-1))+(yf(-1)-yf)) + zetar ;

//Resource constraint
y = csy*c + xsy*x + gsy*g + rkbar*ksy*u;


//************************
// 5.(c) Shocks processes 
//************************

ez    = rhoz*ez(-1) + zetaz;
eb    = rhob*eb(-1) + zetab;
ex    = rhox*ex(-1) + zetax;
eg    = rhog*eg(-1) + zetag;
ep    = rhop*ep(-1) + zetap;
ew    = rhow*ew(-1) + zetaw;


//****************************
// 5.(d) Measurement equations 
//****************************

dyobs   = y-y(-1) + gammaz + ez;
dcobs   = c-c(-1) + gammaz + ez;
dxobs   = x-x(-1) + gammaz + ez;
dgobs   = g-g(-1) + gammaz + ez;
dwobs   = w-w(-1) + gammaz + ez;
inflobs = infl + consteinfl;
robs    = r + conster;
labobs2 = labor + constelabor;

end; 


%---------------------------------------------------------------------------
% 6. Shocks - estimated standard errors
%---------------------------------------------------------------------------

shocks;
var zetaz;
stderr 0.9400;
var zetab;
stderr 0.0389;
var zetax;
stderr 0.4370;
var zetap;
stderr 0.0589;
var zetag; 
stderr 1.2199;
var zetar;
stderr 0.2226;
var zetaw;
stderr 0.2431;
end;

//rhog=0.999999;

stoch_simul(irf=20, noprint, nograph) y c g x; 

// multy = y_zetag(20)/g_zetag(20)/gsy
