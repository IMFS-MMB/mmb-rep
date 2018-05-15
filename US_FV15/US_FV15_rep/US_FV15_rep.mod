/*
 * This file replicates the New Keynesian DSGE model with Time-Varying Volatility by Fernández-Villaverde (2015).
 * 
 * It is based on the implementation of Fernández-Villaverde (2010) by Benjamin Born and Johannes Pfeifer 
 * available as part of Dynare. Please note that the following copyright notice applies to the Dynare 
 * implementation of the Fernández-Villaverde (2010) model.
 * Copyright (C) 2013-2016 Dynare Team
 *
 * The replication was written by Philipp Lieberknecht, philipp.lieberknecht@gmail.com
*/

var d           //preference shock
    c           //consumption
    mu_z        //trend growth rate of the economy (from neutral and investment specific technology)
    mu_I        //growth rate of investment-specific technology growth
    mu_A        //growth rate of neutral technology
    lambda      //Lagrange multiplier
    R           //Nominal Interest rate
    PI          //Inflation
    r           //rental rate of capital
    x           //investment
    u           //capacity utilization
    q           //Tobin's marginal q
    f           //variable for recursive formulation of wage setting
    ld          //aggregate labor demand
    w           //real wage
    wstar       //optimal real wage
    PIstarw     //optimal wage inflation
    PIstar      //optimal price inflation
    g1          //variable 1 for recursive formulation of price setting
    g2          //variable 2 for recursive formulation of price setting
    yd          //aggregate output
    mc          //marginal costs
    k           //capital
    vp          //price dispersion term
    vw          //wage dispersion term
    l           //aggregate labor bundle
    phi         //labor disutility shock
    F           //firm profits
    sigma_dt    //preference shock volatility
    sigma_phit  //labor disutility shock volatility
    sigma_mut   //growth rate of investment-specific technology growth shock volatility
    sigma_At    //growth rate of neutral technology shock volatility
    sigma_mt    //monetary policy shock volatility
    gammaPIt    //drift of feedback coefficient to inflation monetary policy rule 
    gammayt     //drift of feedback coefficient to output growth deviation in monetary policy rule
    yg          // output growth
;     
    
varexo epsd epsphi epsmu_I epsA epsm ud uphi umu uA um epspi epsy;

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
           sigma_m      //standard deviation preference shock

           rhosigd      //autocorrelation preference shock volatility
           rhosigphi    //autocorrelation labor disutility shock volatility
           rhosigmu     //autocorrelation investment-specific technology growth shock volatility
           rhosigA      //autocorrelation neutral technology growth shock volatility
           rhosigm      //autocorrelation monetary policy shock volatility
           rhogammaPI   //autocorrelation inflation response drift
           rhogammay    //autocorrelation output response drift
           eta_d        //standard deviation preference shock volatility shock
           eta_phi      //standard deviation labor disutility shock volatility shock
           eta_mu       //standard deviation investment-specific technology growth shock volatility shock
           eta_A        //standard deviation neutral technology growth shock volatility shock
           eta_m        //standard deviation preference shock volatility shock shocks
           sigma_pi     //standard deviation inflation response drift shock
           sigma_y      //standard deviation output response drift shock
;     

//Fixed parameters, taken from FV(2015), Table 5.1, p. 225
delta       = 0.025;  
epsilon     = 10;   
eta         = 10;       
Phi         = 0; 
gammma2     = 0.001;
betta       = 0.99; 
h           = 0.9; 
varpsi      = 8;
gammma      = 1.17;
kappa       = 9.5;
alppha      = 0.21;
rhogammaPI  = 0.95;
rhogammay   = 0;
sigma_y     = 0;
//Estimated parameters, taken from FV(2015), Table 5.2-5.4, p. 225-226
thetap      = 0.8139;   
chi         = 0.6186; 
thetaw      = 0.6869;  
chiw        = 0.6340; 
gammmaR     = 0.7855; 
gammmay     = exp(-1.4034); 
gammmaPI    = exp(0.0441); 
PIbar       = 1.0005;  
rhod        = 0.1182; 
rhophi      = 0.9331; 
sigma_A     = exp(-3.9013); 
sigma_d     = exp(-1.9834); 
sigma_phi   = exp(-2.4983);  
sigma_mu    = exp(-6.0283); 
sigma_m     = exp(-6.000); 
Lambdamu    = 3.4e-3; 
LambdaA     = 2.8e-3; 

/*
gammma1     = mu_z*mu_I/betta-(1-delta);
Rbar        = 1+(PIbar*mu_z/betta-1);
LambdaYd    = (LambdaA+alppha*Lambdamu)/(1-alppha);
Lambdax     = exp(LambdaYd);
*/

rhosigd     = 0.9506;
rhosigphi   = 0.1275;
rhosigmu    = 0.7508;
rhosigA     = 0.2411;
rhosigm     = 0.8550;
eta_d       = 0.1007;
eta_phi     = 2.8316;
eta_mu      = 0.3115;
eta_A       = 0.7720;
eta_m       = 0.5732;
sigma_pi    = 0.145;

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
R/Rbar=(R(-1)/Rbar)^gammmaR*((PI/PIbar)^(gammmaPI*gammaPIt)*((yd/yd(-1)*mu_z)/exp(LambdaYd))^(gammmay*gammayt))^(1-gammmaR)*exp(epsm)^(sigma_m*sigma_mt);
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
//24. Preference shock
log(d)=rhod*log(d(-1))+sigma_d*sigma_dt*epsd;
//25. Labor disutility shock
log(phi)=rhophi*log(phi(-1))+sigma_phi*sigma_phit*epsphi;
//26. Investment specific technology shock
log(mu_I)=Lambdamu+sigma_mu*sigma_mut*epsmu_I;
//27. Neutral technology shock
log(mu_A)=LambdaA+sigma_A*sigma_At*epsA; 
//28. Defininition composite technology
mu_z=mu_A^(1/(1-alppha))*mu_I^(alppha/(1-alppha));

//volatility shocks
//29. Preference volatility shock
log(sigma_dt)   = rhosigd*log(sigma_dt(-1)) + (1-rhosigd^2)^(1/2)*eta_d*ud;
//30. Labor disutility volatility shock
log(sigma_phit) = rhosigphi*log(sigma_phit(-1)) + (1-rhosigphi^2)^(1/2)*eta_phi*uphi;
//31. Investment specific technology volatility shock
log(sigma_mut)  = rhosigmu*log(sigma_mut(-1)) + (1-rhosigmu^2)^(1/2)*eta_mu*umu;
//32. Neutral technology volatility shock
log(sigma_At)   = rhosigA*log(sigma_At(-1)) + (1-rhosigA^2)^(1/2)*eta_A*uA;
//33. Monetary policy volatility shock
log(sigma_mt)   = rhosigm*log(sigma_mt(-1)) + (1-rhosigm^2)^(1/2)*eta_m*um;
//34. Inflation response drift
log(gammaPIt)   = rhogammaPI*log(gammaPIt(-1)) + (1-rhogammaPI^2)^(1/2)*sigma_pi*epspi;
//35. Monetary policy volatility shock
log(gammayt)    = rhogammay*log(gammayt(-1)) + (1-rhogammay^2)^(1/2)*sigma_y*epsy;

//36. Output growth
yg = (yd/yd(-1)*mu_z)/exp(LambdaYd);
end;

shocks;
var epsd;       stderr 1;
var epsphi;     stderr 1;
var epsmu_I;    stderr 1;
var epsA;       stderr 1;
var epsm;       stderr 1;
var ud;         stderr 1;
var uphi;       stderr 1;
var umu;        stderr 1;
var uA;         stderr 1;
var um;         stderr 1;
var epspi;      stderr 1;
var epsy;       stderr 1;
end;

steady;
check;
stoch_simul(order=1,irf=21, noprint, nograph) yd yg c R PI;