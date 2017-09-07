// Title: Shocks and Frictions in US Business Cycles: A Bayesian DSGE-Approach
// Authors: Smets, Frank and Raf Wouters
// Publication: The American Economic Review, June 2007, 97(3), 586-606.


// This file simulates the dynamic response of the model to specific shocks

// Replication of IRF to monetary policy shock (one standard deviation)

var labobs robs pinfobs dy dc dinve dw ewma epinfma zcapf rkf kf pkf cf invef 
    yf labf wf rrf mc zcap rk k pk c inve y lab pinf w r a  b g qs  ms  spinf 
    sw kpf kp pinf4;
 
varexo ea eb eqs eg em epinf ew;
  
 
parameters curvw cgy curvp constelab constepinf constebeta cmaw cmap calfa 
           czcap cbeta csadjcost ctou csigma chabb ccs cinvs cfc cindw cprobw 
           cindp cprobp csigl clandaw crdpi crpi crdy cry crr crhoa crhob 
           crhog crhoqs crhoms crhopinf crhow ctrend cg cgamma clandap cbetabar 
           cr cpie crk cw cikbar cik clk cky ciy ccy crkky cwhlc cwly; 



// fixed parameters
ctou=.025; //depreciation rate
clandaw=1.5; // SS markup labor market
cg=0.18; //exogenous spending GDP-ratio
curvp=10; //curvature Kimball aggregator goods market
curvw=10; //curvature Kimball aggregator labor market

// estimated parameters initialisation
ctrend=0.4312; //quarterly trend growth rate to GDP
cgamma=ctrend/100+1;
constebeta=0.1657;
cbeta=100/(constebeta+100); //discount factor
constepinf=0.7869; //quarterly SS inflation rate
cpie=constepinf/100+1;
constelab=0.5509;

calfa=0.1901; //labor share in production

csigma=1.3808;//intertemporal elasticity of substitution
cfc=1.6064; 
cgy=0.5187;

csadjcost= 5.7606; //investment adjustment cost
chabb=    0.7133;  // habit persistence 
cprobw=   0.7061;  //calvo parameter labor market
csigl=    1.8383; 
cprobp=   0.6523; //calvo parameter goods market
cindw=    0.5845; //indexation labor market
cindp=    0.2432; //indexation goods market
czcap=    0.5462;//capital utilization
crpi=     2.0443; //Taylor rule reaction to inflation
crr=      0.8103;//Taylor rule interest rate smoothing
cry=      0.0882;//Taylor rule long run reaction to output gap
crdy=     0.2247;//Taylor rule short run reaction to output gap

crhoa=    0.9577;
crhob=    0.2194;
crhog=    0.9767;
crhoqs=   0.7113;
crhoms=0.1479; 
crhopinf=0.8895;
crhow=0.9688;
cmap = 0.7010;
cmaw  = 0.8503;

// derived from steady state
clandap=cfc;
cbetabar=cbeta*cgamma^(-csigma);
cr=cpie/(cbeta*cgamma^(-csigma));
crk=(cbeta^(-1))*(cgamma^csigma) - (1-ctou);
cw = (calfa^calfa*(1-calfa)^(1-calfa)/(clandap*crk^calfa))^(1/(1-calfa));
cikbar=(1-(1-ctou)/cgamma);
cik=(1-(1-ctou)/cgamma)*cgamma;
clk=((1-calfa)/calfa)*(crk/cw);
cky=cfc*(clk)^(calfa-1);
ciy=cik*cky;
ccy=1-cg-cik*cky;
crkky=crk*cky;
cwhlc=(1/clandaw)*(1-calfa)/calfa*crk*cky/ccy;
cwly=1-crk*cky;


model(linear); 

// Original Model Code:


// flexible economy

	      0*(1-calfa)*a + 1*a =  calfa*rkf+(1-calfa)*(wf)  ;
	      zcapf =  (1/(czcap/(1-czcap)))* rkf  ;
	      rkf =  (wf)+labf-kf ;
	      kf =  kpf(-1)+zcapf ;
          //investment Euler equation
	      invef = (1/(1+cbetabar*cgamma))* (  invef(-1) + cbetabar*cgamma*invef(1)+(1/(cgamma^2*csadjcost))*pkf ) +qs ;
          pkf = -rrf-0*b+(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b +(crk/(crk+(1-ctou)))*rkf(1) +  ((1-ctou)/(crk+(1-ctou)))*pkf(1) ;
          //consumption Euler equation
	      cf = (chabb/cgamma)/(1+chabb/cgamma)*cf(-1) + (1/(1+chabb/cgamma))*cf(+1) +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(labf-labf(+1)) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(rrf+0*b) + b ;
          //aggregate resource constraint
	      yf = ccy*cf+ciy*invef+g  +  crkky*zcapf ;
          // aggregate production function
	      yf = cfc*( calfa*kf+(1-calfa)*labf +a );
	      wf = csigl*labf 	+(1/(1-chabb/cgamma))*cf - (chabb/cgamma)/(1-chabb/cgamma)*cf(-1) ;
        //accumulation of installed capital
	      kpf =  (1-cikbar)*kpf(-1)+(cikbar)*invef + (cikbar)*(cgamma^2*csadjcost)*qs ;

// sticky price - wage economy
          //marginal cost
	      mc =  calfa*rk+(1-calfa)*(w) - 1*a - 0*(1-calfa)*a ;
          // capital utilization 
	      zcap =  (1/(czcap/(1-czcap)))* rk ;
          //rental rate of capital
	      rk =  w+lab-k ;
          // Capital installed used one period later in production 
	      k =  kp(-1)+zcap ;
          //investment Euler equation
	      inve = (1/(1+cbetabar*cgamma))* (  inve(-1) + cbetabar*cgamma*inve(1)+(1/(cgamma^2*csadjcost))*pk ) +qs ;
          //arbitrage equation for value of capital
          pk = -r+pinf(1)-0*b +(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b + (crk/(crk+(1-ctou)))*rk(1) +  ((1-ctou)/(crk+(1-ctou)))*pk(1) ;
          //consumption Euler equation
	      c = (chabb/cgamma)/(1+chabb/cgamma)*c(-1) + (1/(1+chabb/cgamma))*c(+1) +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(lab-lab(+1)) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(r-pinf(+1) + 0*b) +b ;
          //aggregate resource constraint
	      y = ccy*c+ciy*inve+g  +  1*crkky*zcap ;
          // aggregate production function
	      y = cfc*( calfa*k+(1-calfa)*lab +a );
          //Phillips Curve
	      pinf =  (1/(1+cbetabar*cgamma*cindp)) * ( cbetabar*cgamma*pinf(1) +cindp*pinf(-1) 
               +((1-cprobp)*(1-cbetabar*cgamma*cprobp)/cprobp)/((cfc-1)*curvp+1)*(mc)  )  + spinf ; 
	      w =  (1/(1+cbetabar*cgamma))*w(-1)
               +(cbetabar*cgamma/(1+cbetabar*cgamma))*w(1)
               +(cindw/(1+cbetabar*cgamma))*pinf(-1)
               -(1+cbetabar*cgamma*cindw)/(1+cbetabar*cgamma)*pinf
               +(cbetabar*cgamma)/(1+cbetabar*cgamma)*pinf(1)
               +(1-cprobw)*(1-cbetabar*cgamma*cprobw)/((1+cbetabar*cgamma)*cprobw)*(1/((clandaw-1)*curvw+1))*
               (csigl*lab + (1/(1-chabb/cgamma))*c - ((chabb/cgamma)/(1-chabb/cgamma))*c(-1) -w) 
               + 1*sw ;

          //Monetary Policy Rule
	      r =  crpi*(1-crr)*pinf +cry*(1-crr)*(y-yf) +crdy*(y-yf-y(-1)+yf(-1))+crr*r(-1) +ms  ;

	      a = crhoa*a(-1)  + ea;
	      b = crhob*b(-1) + eb;
          // exogenous spending (also including net exports)
	      g = crhog*(g(-1)) + eg + cgy*ea;
	      qs = crhoqs*qs(-1) + eqs;
	      ms = crhoms*ms(-1) + em;
          //cost push shock
	      spinf = crhopinf*spinf(-1) + epinfma - cmap*epinfma(-1);
	          epinfma=epinf;
	      sw = crhow*sw(-1) + ewma - cmaw*ewma(-1) ;
	          ewma=ew; 
          //accumulation of installed capital
	      kp =  (1-cikbar)*kp(-1)+cikbar*inve + cikbar*cgamma^2*csadjcost*qs ;

// measurement equations

dy=y-y(-1)+ctrend;
dc=c-c(-1)+ctrend;
dinve=inve-inve(-1)+ctrend;
dw=w-w(-1)+ctrend;
pinfobs = 1*(pinf) + constepinf;
pinf4= pinf + pinf(-1) + pinf(-2) + pinf(-3);
robs =    1*(r) + constebeta;
labobs = lab + constelab;

end; 

shocks;
//productivity shock
var ea;
stderr 0.4582;
//wedge between FFR  and return on assets
var eb;
stderr 0.2400;
var eg;
stderr 0.5291;
//investment specific technology
var eqs;
stderr 0.4526;
var em; // monetary policy shock
stderr 0.2449;
var epinf;
stderr 0.1410;
var ew;
stderr 0.2446;
end;

stoch_simul(irf=20, noprint, nograph) r pinf lab y;