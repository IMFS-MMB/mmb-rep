/*
 * This file implements the Baseline New Keynesian DSGE model described in 
 * much detail in Jesús Fernández-Villaverde and Juan F. Rubio-Ramírez (2006): "A Baseline DSGE 
 * Model", available at http://economics.sas.upenn.edu/~jesusfv/benchmark_DSGE.pdf
 *
 * The parametrization is based on the estimated version of this model in 
 * Jesús Fernández-Villaverde (2010): "The econometrics of DSGE models", 
 * SERIEs, Vol. 1, pp. 3-49, DOI 10.1007/s13209-009-0014-7
 *
 * This implementation was written by Benjamin Born and Johannes Pfeifer. 
 * This file is part of Dynare.

 * Please note that the following copyright notice only applies to this Dynare 
 * implementation of the model.
 * Copyright (C) 2013-2016 Dynare Team

 * The implementation by Born and Pfeifer was slightly modified, by including the shock standard errors
 * directly into equations (15) and (24)-(27), instead of specifying them in the shock - block. 
*/

var d       //preference shock
    c       //consumption
    mu_z 	//trend growth rate of the economy (from neutral and investment specific technology)
    mu_I    //growth rate of investment-specific technology growth
    mu_A    //growth rate of neutral technology
    lambda  //Lagrange multiplier
    R       //Nominal Interest rate
    PI      //Inflation
    r       //rental rate of capital
    x       //investment
    u       //capacity utilization
    q       //Tobin's marginal q
    f       //variable for recursive formulation of wage setting
    ld      //aggregate labor demand
    w       //real wage
    wstar   //optimal real wage
    PIstarw //optimal wage inflation
    PIstar  //optimal price inflation
    g1      //variable 1 for recursive formulation of price setting
    g2      //variable 2 for recursive formulation of price setting
    yd      //aggregate output
    mc      //marginal costs
    k       //capital
    vp      //price dispersion term
    vw      //wage dispersion term
    l       //aggregate labor bundle
    phi     //labor disutility shock
    F       //firm profits
    yg      // output growth
;     
    
varexo epsd epsphi epsmu_I epsA epsm;

predetermined_variables k;

parameters h            //consumption habits
           betta        //discount factor
           gammma1      //capital utilization, linear term
           gammma2      //capital utilization, quadratic term
           delta        //depreciation rate
           kappa        //capital adjustment costs parameter
           eta          //elasticity of substitution between labor varieties
           epsilon      //elasticity of substitution between goods varieties
           varpsi       //labor disutility parameter
           gammma       //inverse Frisch elasticity
           chiw         //wage indexation parameter
           chi          //price indexation
           thetap       //Calvo parameter prices
           thetaw       //Calvo parameter wages
           alppha       //capital share
           Rbar         //steady state interest rate
           PIbar        //steady state inflation
           gammmaR      //interest smoothing coefficient Taylor rule
           gammmaPI     //feedback coefficient to inflation monetary policy rule
           gammmay      //feedback coefficient to output growth deviation in monetary policy rule
           Phi          //firms fixed costs
           rhod         //autocorrelation preference shock
           rhophi       //autocorrelation labor disutility shock
           Lambdamu  	//steady state growth rate of investmentment-specific technology
           LambdaA      //steady state neutral technology growth 
           Lambdax      //steady state growth rate of investment
           LambdaYd     //steady state growth rate of output
           sigma_d      //standard deviation preference shock
           sigma_phi    //standard deviation labor disutility shock
           sigma_mu     //standard deviation investment-specific technology
           sigma_A      //standard deviation neutral technology
           sigma_m;      //standard deviation preference shock

//Fixed parameters, taken from FV(2010), Table 2, p. 37
delta       = 0.025;  
epsilon     = 10;   
eta         = 10;       
Phi         = 0; 
gammma2     = 0.001;
//Estimated parameters, taken from FV(2010), Table 3, p. 38, median estimate parameters
betta       = 0.998; 
h           = 0.97; 
varpsi      = 8.92;
gammma      = 1.17;
kappa       = 9.51;
alppha      = 0.21;
thetap      = 0.82;   
chi         = 0.63; 
thetaw      = 0.68;  
chiw        = 0.62; 
gammmaR     = 0.77; 
gammmay     = 0.19; 
gammmaPI    = 1.29; 
PIbar       = 1.01;  
rhod        = 0.12; 
rhophi      = 0.93; 
sigma_A     = exp(-3.97); 
sigma_d     = exp(-1.51); 
sigma_phi   = exp(-2.36);  
sigma_mu    = exp(-5.43); 
sigma_m     = exp(-5.85); 
Lambdamu    = 3.4e-3; 
LambdaA     = 2.8e-3; 

/*
The following parameters are set in the steady state file as they depend on other 
deep parameters (some were estimated in the original study). Setting them in the
steady state file means they are updated for every parameter draw in the MCMC
algorithm, while the parameters initialized here are only set once for the initial
values of the parameters they depend on:
gammma1     = mu_z*mu_I/betta-(1-delta);
Rbar        = 1+(PIbar*mu_z/betta-1);
LambdaYd    = (LambdaA+alppha*Lambdamu)/(1-alppha);
Lambdax     = exp(LambdaYd);
*/

/*
The following model equations are the stationary model equations, taken from
FV(2006), p. 20, section 3.2.
*/

model; 
//1. FOC consumption
d*(c-h*c(-1)*mu_z^(-1))^(-1)-h*betta*d(+1)*(c(+1)*mu_z(+1)-h*c)^(-1)=lambda;
//2. Euler equation
lambda=betta*lambda(+1)*mu_z(+1)^(-1)/PI(+1)*R;
//3. FOC capital utilization
r=gammma1+gammma2*(u-1);
//4. FOC capital
q=betta*lambda(+1)/lambda*mu_z(+1)^(-1)*mu_I(+1)^(-1)*((1-delta)*q(+1)+r(+1)*u(+1)-(gammma1*(u(+1)-1)+gammma2/2*(u(+1)-1)^2));
//5. FOC investment
1=q*(1-(kappa/2*(x/x(-1)*mu_z-Lambdax)^2)-(kappa*(x/x(-1)*mu_z-Lambdax)*x/x(-1)*mu_z))
  +betta*q(+1)*lambda(+1)/lambda*mu_z(+1)^(-1)*kappa*(x(+1)/x*mu_z(+1)-Lambdax)*(x(+1)/x*mu_z(+1))^2;
//6-7. Wage setting
f=(eta-1)/eta*wstar^(1-eta)*lambda*w^eta*ld+betta*thetaw*(PI^chiw/PI(+1))^(1-eta)*(wstar(+1)/wstar*mu_z(+1))^(eta-1)*f(+1);
f=varpsi*d*phi*PIstarw^(-eta*(1+gammma))*ld^(1+gammma)+betta*thetaw*(PI^chiw/PI(+1))^(-eta*(1+gammma))*(wstar(+1)/wstar*mu_z(+1))^(eta*(1+gammma))*f(+1);
//8-10. firm's price setting
g1=lambda*mc*yd+betta*thetap*(PI^chi/PI(+1))^(-epsilon)*g1(+1);
g2=lambda*PIstar*yd+betta*thetap*(PI^chi/PI(+1))^(1-epsilon)*PIstar/PIstar(+1)*g2(+1);
epsilon*g1=(epsilon-1)*g2;
//11-12. optimal inputs
u*k/ld=alppha/(1-alppha)*w/r*mu_z*mu_I;
mc=(1/(1-alppha))^(1-alppha)*(1/alppha)^alppha*w^(1-alppha)*r^alppha;
//13. law of motion wages
1=thetaw*(PI(-1)^chiw/PI)^(1-eta)*(w(-1)/w*mu_z^(-1))^(1-eta)+(1-thetaw)*PIstarw^(1-eta);
//14. law of motion prices
1=thetap*(PI(-1)^chi/PI)^(1-epsilon)+(1-thetap)*PIstar^(1-epsilon);
//15. Taylor Rule
R/Rbar=(R(-1)/Rbar)^gammmaR*((PI/PIbar)^gammmaPI*((yd/yd(-1)*mu_z)/exp(LambdaYd))^gammmay)^(1-gammmaR)*exp(epsm)^sigma_m;
//16-17. Market clearing
yd=c+x+mu_z^(-1)*mu_I^(-1)*(gammma1*(u-1)+gammma2/2*(u-1)^2)*k;
yd=(mu_A*mu_z^(-1)*(u*k)^alppha*ld^(1-alppha)-Phi)/vp;
//18-20. Price and wage dispersion terms
l=vw*ld; 
vp=thetap*(PI(-1)^chi/PI)^(-epsilon)*vp(-1)+(1-thetap)*PIstar^(-epsilon);
vw=thetaw*(w(-1)/w*mu_z^(-1)*PI(-1)^chiw/PI)^(-eta)*vw(-1)+(1-thetaw)*(PIstarw)^(-eta);
//21. Law of motion for capital
k(+1)*mu_z*mu_I-(1-delta)*k-mu_z*mu_I*(1-kappa/2*(x/x(-1)*mu_z-Lambdax)^2)*x=0;
//22. Profits
F=yd-1/(1-alppha)*w*ld;
//23. definition optimal wage inflation
PIstarw=wstar/w;

//exogenous processes
//24. Preference Shock
log(d)=rhod*log(d(-1))+sigma_d*epsd;
//25. Labor disutility Shock
log(phi)=rhophi*log(phi(-1))+sigma_phi*epsphi;
//26. Investment specific technology
log(mu_I)=Lambdamu+sigma_mu*epsmu_I;
//27. Neutral technology
log(mu_A)=LambdaA+sigma_A*epsA; 
//28. Defininition composite technology
mu_z=mu_A^(1/(1-alppha))*mu_I^(alppha/(1-alppha));

//29. Output growth
yg = (yd/yd(-1)*mu_z)/exp(LambdaYd);

end;

shocks;
var epsd;       stderr 1;
var epsphi;     stderr 1;
var epsmu_I;    stderr 1;
var epsA;       stderr 1;
var epsm;       stderr 1;
end;

steady;
check;
stoch_simul(order=1,irf=21, nograph, noprint) yd yg c R PI;