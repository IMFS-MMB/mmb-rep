//Implementation of Pau Rabanal paper (2007) by Martina Jancokova
//NEW: p eliminated, only left pi=p-p(-1)(hence only 15 endog.var.s and 15 equat.s)
//n=l as additional equation to solve the model (due to inconsistency in notation of labor)

var pi mc rk w r a u n c l q i k y g; //15 endogenous variables (lambda disregarded, not needed for further calculations)
varexo epsp epsz epsa epsg;    //shocks or innovations

parameters gammab gammaf kappap beta omegap thetap lambdaSS alpha gamma psi omegaw kappaw sigma
    b eta phi delta vaphi rhor gammap gammay ISS GSS thetaw rhoa rhog;  //25 parameters 

//*****************************************************************
//figure 4: estimated Baseline model
//*****************************************************************
beta= 0.9926;       //discount factor
omegap=0.99;      //price indexation
thetap=0.83;      //Calvo prob. of not being able to reset the price
//lambda= depends on the markup shock and lambdaSS, time-varying elasticity of subst. between diff. types of goods
lambdaSS=6;       // steady staate elasticity of substitution
alpha=0.36;       //capital share of output
gamma=0.15;       //degree of cost channel
psi=99.03;        //the elasticity of the capital utilization w.r.t. the rental rate 
omegaw=0.07;      //wage indexation
sigma=1.71;       //elasticity of substitution (consumption)
b=0.83;           //habit parameter
eta=1;            //the inverse of elasticity of labor supply
phi=21;           //elasticity of substitution (labor) 
delta=0.025;      //depreciation rate for capital, a quaterly value
vaphi=0.04;       //measures the elasticity of the growth rate of investment to Tobin's Q
rhor=0.94;        //interest rate smoothing parameter
gammap=1.34;      //inflation reaction
gammay=0.53;      //output reaction
GSS=0.2;          //steady state value of the government-output ratio 
thetaw=0.37;      // wage Calvo
rhoa=0.94;        //technology persistence
rhog=0.89;        //government spending persistence
gammab=omegap/(1+beta*omegap);  //backward looking component
gammaf=beta/(1+beta*omegap);    //forward looking component
kappap=(1-thetap*beta)*(1-thetap)/((1+beta*omegap)*thetap);  
kappaw=(1-thetaw*beta)*(1-thetaw)/((1+phi*(eta-1))*thetaw);
ISS=delta*alpha*lambdaSS/((lambdaSS-1)*(1/beta-(1-delta))); //steady state value of investment-output ratio


model(linear);
//*****************************************************************
//Phillips Curve
//*****************************************************************
pi=gammab*pi(-1)+gammaf*pi(+1)+kappap*mc+kappap*epsp;

//*****************************************************************
//Marginal Cost
//*****************************************************************
mc=alpha*rk+(1-alpha)*(w+gamma*r)-a;

//*****************************************************************
//Capital Utilization
//*****************************************************************
u=psi*rk;

//*****************************************************************
//Wage Phillips Curve
//*****************************************************************
(1+beta)*w=w(-1)+beta*w(+1)+omegaw*pi(-1)-(1+beta*omegaw)*pi+beta*pi(+1)
          -kappaw*(w-sigma/(1-b)*(c-b*c(-1))-eta*n);

//*****************************************************************
//Optimal Capital-Labor Ratio
//*****************************************************************
l-u-k(-1)=rk-(w+gamma*r);

//*****************************************************************
//due to Inconsistent Notation of Labor
//*****************************************************************
n=l; 

//*****************************************************************
//Consumption Euler Equation
//*****************************************************************
(1+b)*c=b*c(-1)+c(+1)-(1-b)*1/sigma*(r-pi(+1)); 

//*****************************************************************
//Tobin's Q
//*****************************************************************
q=beta*(1-delta)*q(+1)+(1-beta*(1-delta))*rk(+1)-(r-pi(+1));

//*****************************************************************
//Capital Accumulation
//*****************************************************************
k=(1-delta)*k(-1)+delta*i;

//*****************************************************************
//Investment 
//*****************************************************************
i=1/(1+beta)*(beta*i(+1)+i(-1)+vaphi*q);

//*****************************************************************
//Production Function
//*****************************************************************
y=a+alpha*(u+k(-1))+(1-alpha)*n;

//*****************************************************************
//Monetary Policy Rule (Taylor rule)
//*****************************************************************
r=rhor*r(-1)+(1-rhor)*gammap*pi+(1-rhor)*gammay*y+epsz;

//*****************************************************************
//Resource constraint
//*****************************************************************
y=(1-ISS-GSS)*c+ISS*i+GSS*g+alpha*lambdaSS/(lambdaSS-1)*u;

//*****************************************************************
//Technology Shock
//*****************************************************************
a=rhoa*a(-1)+epsa;

//*****************************************************************
//Fiscal Shock
//*****************************************************************
g=rhog*g(-1)+epsg;

end;


@#for i in 1:5
    // figure 1: Baseline
    @#if i==1
        shocks;
        var epsz;
        stderr 0.25;
        end;
    @#endif

    // figure 1: Flex. Prices
    @#if i==2
        shocks;
        var epsz;
        stderr 0.25;
        end;
    @#endif

    // figure 1: Flex. Wages
    @#if i==3
        shocks;
        var epsz;
        stderr 0.25;
        end;
    @#endif

    // figure 1: No Var. Cap Utilization
    @#if i==4
        shocks;
        var epsz;
        stderr 0.25;
        end;
    @#endif

    //figure 4: Baseline estimation
    @#if i==5
        shocks;
        var epsa;
        stderr 0.01*100;
        var epsg;
        stderr 0.043*100;
        var epsp;
        stderr 0.159*100;
        var epsz;
        stderr 0.0024*100;
        end;
    @#endif


steady;
check;

//*****************************************************************
// figure 1: Baseline
//*****************************************************************
    @#if i==1
        beta= 0.9926;      //discount factor
        omegap=1;          //price indexation
        thetap=0.5;        //Calvo prob. of not being able to reset the price
        //lambda= depends on the markup shock and lambdaSS, time-varying elasticity of subst. between diff. types of goods
        lambdaSS=6;        // steady staate elasticity of substitution KEPT
        alpha=0.36;        //capital share of output (as in CEE)
        gamma=1;           //degree of cost channel
        psi=100;           //capital utilization variability
        omegaw=1;          //wage indexation
        sigma=1;           //elasticity of substitution (consumption)
        b=0.65;            //habit parameter
        eta=1;             //the inverse of elasticity of labor supply
        phi=21;            //elasticity of substitution (labor) 
        delta=0.025;       //depreciation rate for capital, a quaterly value (as in CEE)
        vaphi=1/2.48;      //investment adjustment cost parameter
        rhor=0.8;          //interest rate smoothing parameter
        gammap=1.5;        //inflation reaction
        gammay=0.1;        //output reaction
        GSS=0.2;           //steady state value of the government-output ratio KEPT
        thetaw=0.75;       //wage Calvo (CHANGED!!!; in paper thetaw=0.75)
        rhoa=0.9;          //technology persistence SAME AS FOR rhor (no technology shock in CEE)
        rhog=0.9;          //government spending persistence SAME AS FOR rhor (no government spending shock in CEE)
gammab=omegap/(1+beta*omegap);  //backward looking component
gammaf=beta/(1+beta*omegap);    //forward looking component
kappap=(1-thetap*beta)*(1-thetap)/((1+beta*omegap)*thetap);  
kappaw=(1-thetaw*beta)*(1-thetaw)/((1+phi*(eta-1))*thetaw);
ISS=delta*alpha*lambdaSS/((lambdaSS-1)*(1/beta-(1-delta))); //steady state value of investment-output ratio

    @#endif

//*****************************************************************
// figure 1: Flex. Prices
//*****************************************************************
    @#if i==2
       beta= 0.9926;      //discount factor
       omegap=0;          //price indexation
       thetap=0.0000001;     //Calvo prob. of not being able to reset the price
       //lambda= depends on the markup shock and lambdaSS, time-varying elasticity of subst. between diff. types of goods
       lambdaSS=6;        // steady staate elasticity of substitution KEPT
       alpha=0.36;        //capital share of output (as in CEE)
       gamma=1;           //degree of cost channel
       psi=100;           //capital utilization variability
       omegaw=1;          //wage indexation
       sigma=1;           //elasticity of substitution (consumption)
       b=0.65;            //habit parameter
       eta=1;             //the inverse of elasticity of labor supply
       phi=21;            //elasticity of substitution (labor) 
       delta=0.025;       //depreciation rate for capital, a quaterly value (as in CEE)
       vaphi=1/2.48;      //investment adjustment cost parameter
       rhor=0.8;          //interest rate smoothing parameter
       gammap=1.5;        //inflation reaction
       gammay=0.1;        //output reaction
       GSS=0.2;           //steady state value of the government-output ratio KEPT
       thetaw=0.75;       //wage Calvo (CHANGED!!!; in paper thetaw=0.75)
       rhoa=0.9;          //technology persistence SAME AS FOR rhor (no technology shock in CEE)
       rhog=0.9;          //government spending persistence SAME AS FOR rhor (no government spending shock in CEE)
gammab=omegap/(1+beta*omegap);  //backward looking component
gammaf=beta/(1+beta*omegap);    //forward looking component
kappap=(1-thetap*beta)*(1-thetap)/((1+beta*omegap)*thetap);  
kappaw=(1-thetaw*beta)*(1-thetaw)/((1+phi*(eta-1))*thetaw);
ISS=delta*alpha*lambdaSS/((lambdaSS-1)*(1/beta-(1-delta))); //steady state value of investment-output ratio

    @#endif

//*****************************************************************
// figure 1: Flex. Wages
//*****************************************************************
    @#if i==3
       beta= 0.9926;      //discount factor
       omegap=1;          //price indexation
       thetap=0.5;        //Calvo prob. of not being able to reset the price
       //lambda= depends on the markup shock and lambdaSS, time-varying elasticity of subst. between diff. types of goods
       lambdaSS=6;        // steady staate elasticity of substitution KEPT
       alpha=0.36;        //capital share of output (as in CEE)
       gamma=1;           //degree of cost channel
       psi=100;           //capital utilization variability
       omegaw=0;          //wage indexation
       sigma=1;           //elasticity of substitution (consumption)
       b=0.65;            //habit parameter
       eta=1;             //the inverse of elasticity of labor supply
       phi=21;            //elasticity of substitution (labor) 
       delta=0.025;       //depreciation rate for capital, a quaterly value (as in CEE)
       vaphi=1/2.48;      //investment adjustment cost parameter
       rhor=0.8;          //interest rate smoothing parameter
       gammap=1.5;        //inflation reaction
       gammay=0.1;        //output reaction
       GSS=0.2;           //steady state value of the government-output ratio KEPT
       thetaw=0.0000001;     //wage Calvo
       rhoa=0.9;          //technology persistence SAME AS FOR rhor (no technology shock in CEE)
       rhog=0.9;          //government spending persistence SAME AS FOR rhor (no government spending shock in CEE)
gammab=omegap/(1+beta*omegap);  //backward looking component
gammaf=beta/(1+beta*omegap);    //forward looking component
kappap=(1-thetap*beta)*(1-thetap)/((1+beta*omegap)*thetap);  
kappaw=(1-thetaw*beta)*(1-thetaw)/((1+phi*(eta-1))*thetaw);
ISS=delta*alpha*lambdaSS/((lambdaSS-1)*(1/beta-(1-delta))); //steady state value of investment-output ratio

    @#endif
    
//*****************************************************************
// figure 1: No Var. Cap. Utilization
//*****************************************************************
    @#if i==4
       beta= 0.9926;      //discount factor
       omegap=1;          //price indexation
       thetap=0.5;        //Calvo prob. of not being able to reset the price
       //lambda= depends on the markup shock and lambdaSS, time-varying elasticity of subst. between diff. types of goods
       lambdaSS=6;        // steady staate elasticity of substitution KEPT
       alpha=0.36;        //capital share of output (as in CEE)
       gamma=1;           //degree of cost channel
       psi=0;             //capital utilization variability
       omegaw=1;          //wage indexation
       sigma=1;           //elasticity of substitution (consumption)
       b=0.65;            //habit parameter
       eta=1;             //the inverse of elasticity of labor supply
       phi=21;            //elasticity of substitution (labor) 
       delta=0.025;       //depreciation rate for capital, a quaterly value (as in CEE)
       vaphi=1/2.48;      //investment adjustment cost parameter
       rhor=0.8;          //interest rate smoothing parameter
       gammap=1.5;        //inflation reaction
       gammay=0.1;        //output reaction
       GSS=0.2;           //steady state value of the government-output ratio KEPT
       thetaw=0.75;       //wage Calvo (CHANGED!!!; in paper thetaw=0.75)
       rhoa=0.9;          //technology persistence SAME AS FOR rhor (no technology shock in CEE)
       rhog=0.9;          //government spending persistence SAME AS FOR rhor (no government spending shock in CEE)
gammab=omegap/(1+beta*omegap);  //backward looking component
gammaf=beta/(1+beta*omegap);    //forward looking component
kappap=(1-thetap*beta)*(1-thetap)/((1+beta*omegap)*thetap);  
kappaw=(1-thetaw*beta)*(1-thetaw)/((1+phi*(eta-1))*thetaw);
ISS=delta*alpha*lambdaSS/((lambdaSS-1)*(1/beta-(1-delta))); //steady state value of investment-output ratio

    @#endif

//figure 4: Baseline estimation
    @#if i==5  
beta= 0.9926;       //discount factor
omegap=0.99;      //price indexation
thetap=0.83;      //Calvo prob. of not being able to reset the price
//lambda= depends on the markup shock and lambdaSS, time-varying elasticity of subst. between diff. types of goods
lambdaSS=6;       // steady staate elasticity of substitution
alpha=0.36;       //capital share of output
gamma=0.15;       //degree of cost channel
psi=99.03;        //the elasticity of the capital utilization w.r.t. the rental rate 
omegaw=0.07;      //wage indexation
sigma=1.71;       //elasticity of substitution (consumption)
b=0.83;           //habit parameter
eta=1;            //the inverse of elasticity of labor supply
phi=21;           //elasticity of substitution (labor) 
delta=0.025;      //depreciation rate for capital, a quaterly value
vaphi=0.04;       //measures the elasticity of the growth rate of investment to Tobin's Q
rhor=0.94;        //interest rate smoothing parameter
gammap=1.34;      //inflation reaction
gammay=0.53;      //output reaction
GSS=0.2;          //steady state value of the government-output ratio 
thetaw=0.37;      // wage Calvo
rhoa=0.94;        //technology persistence
rhog=0.89;        //government spending persistence
gammab=omegap/(1+beta*omegap);  //backward looking component
gammaf=beta/(1+beta*omegap);    //forward looking component
kappap=(1-thetap*beta)*(1-thetap)/((1+beta*omegap)*thetap);  
kappaw=(1-thetaw*beta)*(1-thetaw)/((1+phi*(eta-1))*thetaw);
ISS=delta*alpha*lambdaSS/((lambdaSS-1)*(1/beta-(1-delta))); //steady state value of investment-output ratio


    @#endif
    


    stoch_simul(irf = 25,nograph);

    // figure 1: Baseline
    @#if i==1
         pi_epsz_baseline = pi_epsz;
         y_epsz_baseline  = y_epsz;
         r_epsz_baseline  = r_epsz;
    @#endif

    // figure 1: Flex. Prices
    @#if i==2
         pi_epsz_flexprice = pi_epsz
         y_epsz_flexprice  = y_epsz;
         r_epsz_flexprice  = r_epsz;
    @#endif

    // figure 1: Flex. Wages
    @#if i==3
         pi_epsz_flexwage  = pi_epsz;
         y_epsz_flexwage   = y_epsz;
         r_epsz_flexwage   = r_epsz;
    @#endif

    // figure 1: No Var. Cap. Utilization
    @#if i==4
         pi_epsz_novarcaputil = pi_epsz;
         y_epsz_novarcaputil  = y_epsz;
         r_epsz_novarcaputil  = r_epsz;
    @#endif

    //figure 4: Baseline estimation
    @#if i==5
         pi_epsz_baselineestimation = pi_epsz;
         y_epsz_baselineestimation  = y_epsz;
         r_epsz_baselineestimation  = r_epsz;

         pi_epsp_baselineestimation = pi_epsp;
         y_epsp_baselineestimation  = y_epsp;
         r_epsp_baselineestimation  = r_epsp;

         pi_epsa_baselineestimation = pi_epsa;
         y_epsa_baselineestimation  = y_epsa;
         r_epsa_baselineestimation  = r_epsa;

         pi_epsg_baselineestimation = pi_epsg;
         y_epsg_baselineestimation  = y_epsg;
         r_epsg_baselineestimation  = r_epsg;
    @#endif


@#endfor

//*****************************************************************
//figure 1
//*****************************************************************

figure
subplot(3,1,1);
plot(0:16,[NaN pi_epsz_baseline(1:16)']','k','LineWidth',1.5);       hold on
plot(0:16,[NaN pi_epsz_flexprice(1:16)']','-.k','LineWidth',1.5);    hold on
plot(0:16,[NaN pi_epsz_flexwage(1:16)']','--k','LineWidth',1.5);     hold on
plot(0:16,[NaN pi_epsz_novarcaputil(1:16)']','o-k','LineWidth',1.5); hold on
plot(0:16,[NaN zeros(16,1)']','k','LineWidth',0.5);
axis([0 16 -0.4 0.4]);
title('Response of Inflation');
legend('Baseline','Flex.Prices','Flex.Wages','No Var.Cap.Utilization');

subplot(3,1,2);
plot(0:16,[NaN y_epsz_baseline(1:16)']','k','LineWidth',1.5);       hold on
plot(0:16,[NaN y_epsz_flexprice(1:16)']','-.k','LineWidth',1.5);    hold on
plot(0:16,[NaN y_epsz_flexwage(1:16)']','--k','LineWidth',1.5);     hold on
plot(0:16,[NaN y_epsz_novarcaputil(1:16)']','o-k','LineWidth',1.5); hold on
plot(0:16,[NaN zeros(16,1)']','k','LineWidth',0.5);
axis([0 16 -2 1]);
title('Response of Output');
legend('Baseline','Flex.Prices','Flex.Wages','No Var.Cap.Utilization');

subplot(3,1,3);
plot(0:16,[NaN r_epsz_baseline(1:16)']','k','LineWidth',1.5);       hold on
plot(0:16,[NaN r_epsz_flexprice(1:16)']','-.k','LineWidth',1.5);    hold on
plot(0:16,[NaN r_epsz_flexwage(1:16)']','--k','LineWidth',1.5);     hold on
plot(0:16,[NaN r_epsz_novarcaputil(1:16)']','o-k','LineWidth',1.5); hold on
plot(0:16,[NaN zeros(16,1)']','k','LineWidth',0.5);
axis([0 16 -0.2 0.6]);
title('Response of Nominal Interest Rate');
legend('Baseline','Flex.Prices','Flex.Wages','No Var.Cap.Utilization');


//*****************************************************************
//figure 4: Baseline Estimation
//*****************************************************************
figure
subplot(4,3,1)
plot(0:25,[NaN pi_epsz_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -0.2 0.2]);
title('Inflation to MP shock');

subplot(4,3,2)
plot(0:25,[NaN y_epsz_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -1 0.5]);
title('Output to MP shock');

subplot(4,3,3)
plot(0:25,[NaN r_epsz_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -0.5 0.5]);
title('Interest to MP shock');

subplot(4,3,4)
plot(0:25,[NaN pi_epsp_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -0.5 1]);
title('Inflation to markup shock');

subplot(4,3,5)
plot(0:25,[NaN y_epsp_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -0.5 0.5]);
title('Output to markup shock');

subplot(4,3,6)
plot(0:25,[NaN r_epsp_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -0.5 0.5]);
title('Interest to markup shock');

subplot(4,3,7)
plot(0:25,[NaN pi_epsa_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -1 0.5]);
title('Inflation to technology shock');

subplot(4,3,8)
plot(0:25,[NaN y_epsa_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -2 2]);
title('Output to technology shock');

subplot(4,3,9)
plot(0:25,[NaN r_epsa_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -1 0.5]);
title('Interest to technology shock');

subplot(4,3,10)
plot(0:25,[NaN pi_epsg_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -0.5 0.5]);
title('Inflation to fiscal shock');

subplot(4,3,11)
plot(0:25,[NaN y_epsg_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -1 2]);
title('Output to fiscal shock');

subplot(4,3,12)
plot(0:25,[NaN r_epsg_baselineestimation']','k','LineWidth',1.5); hold on
plot(0:25,zeros(26,1),'k','LineWidth',0.5);
axis([0 25 -0.2 0.2]);
title('Interest to fiscal shock');