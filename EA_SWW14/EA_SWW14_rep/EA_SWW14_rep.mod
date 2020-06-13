var     
        c           // consumption
        r           // nominal interest rate
        pi          // inflation rate
        i           // investment
        q           // value of capital stock
        rk          // expected return on holding capital
        y           // output
        v           // capital utilization
        k           // capital used in production
        n           // hours worked
        mc          // marginal cost
        w           // real wage
        z           // smoothed trend of consumption
        u           // unemplayment rate
        e           // employment
        un          // natural rate of unemployment (flex wage)
        l           // labor force
        kbar        // capital stock
        ygap        // output gap

        // flex variables
        cf rf invf qf rkf vf kf nf wf zf ef kbarf yf

        // shocks
        epsilonb epsilonq epsilong epsilona epsilonp epsilons epsilonw epsilonr

        // measurement equations
        dyobs dcobs diobs piobs dwobs deobs uobs robs 

        // annualized rates
        ryear piyear

;
varexo  
        etab        // risk-premium shock
        etaq        // investment-specific technology shock
        etag        // exogenous spending shock
        etaa        // productivity shock
        etap        // price markup shock
        etas        // labor supply shock
        etaw        // wage shock
        etar        // monetary policy shock

;
parameters 
        ch          // habit parameter
        ctau        // trend growth rate
        cbeta       // discount factor
        cphi        // elasticity of the capital adjustment cost function
        cdelta      // depreciation of capital
        cpsip       // reflects fixed costs in production
        calpha      // Cobb-Douglas parameter
        cgammap     // price indexation
        cthetap     // probability of price change
        cepsp       // curvature of the aggregator function
        cgammaw     // wage indexation
        cthetaw     // probability of wage change
        cepsw       // curvature of the aggregator function
        comega      // inverse elasticity of labor supply
        cv          // captures short run wealth effect on labor supply
        cpsi        // elasticity of the capital utilization cost function
        crhointr    // persistence of MP rule
        crpi        // coefficient on inflation
        cry         // coeff on output gap
        crdy        // coeff on change in output gap
        cthetae     // fraction of firms able to adjust employment

        // steady state (SS) parameters
        crk ccy ciy cvy cgy cky ctaubar cpi cpibar crbar cubar cebar cbetabar
        cpsiw       // psiw-1 is ss labor market markup
        // new defined parameters for SS
        clk cw

        // helpers
        c1 c2 i1 i2 q1 pi1 pi2 w1 k1 k2 e1

        // shocks
        crhob crhoq crhog crhoa crhoga crhop cmup crhos crhow cmuw crhor

;
// parameter declaration 
// calibrated
cdelta  = 0.025 ; 
cepsp   = 10    ; // epsilonp
cgy     = 0.18  ;
crhos   = 0.999 ;

// estimated (use posterior modes provided by the author, used for IRF (autors' code))
// authors' parameter names in code commented behind if different to this declaration
// ysigmac=1 (--> log utility)
ch      = 0.635318; //lambda
cphi    = 4.630882; //varphi
cpsip   = 1.490662; //phip
calpha  = 0.226791; 
cgammap = 0.250432; //imathp
cthetap = 0.842802; //xip
cgammaw = 0.251781; //imathw
cthetaw = 0.696311; //xiw
cpsiw   = 1.500236; //phiw
comega  = 5.385964; //sigmal
cv      = 0.085281; //upsilon
cpsi    = 0.472810; //psi
crhointr= 0.856383; //rho
crpi    = 1.287264; 
cry     = 0.192124; 
crdy    = 0.016608; 
cthetae = 0.705567; //xie
cpibar  = 0.561370; 
cbetabar= 0.268560; //betainv
cebar   = 0.226367; 
ctaubar = 0.130848; //gammabar

// ybetabar //= cbeta/ctau

// not estimated, calculated

// formula: ctaubar = 100*(ctau-1);
ctau    = ctaubar/100+1;
// formula: cbetabar=100*(cbeta^(-1)-1);
cbeta   = 1/(cbetabar/100+1);
// formula: cpibar  = 100*(cpi-1);
cpi     = cpibar/100+1;
cubar   = 100*(cpsiw-1)/comega;
crbar   = 100*(cpi*ctau/cbeta-1);

//not in paper, can be seen in code

cepsw   = cpsiw/(cpsiw-1);
crk     = (ctau/cbeta)+cdelta-1;  //yrkstar
cw      = (calpha^calpha*(1-calpha)^(1-calpha)/(cpsip*crk^calpha))^(1/(1-calpha));
clk     = ((1-calpha)/calpha)*(crk/cw);
cky     = cpsip*(clk^(calpha-1));

// shock parameters
crhob   = 0.915697;
crhoq   = 0.345078; //rhoi
crhog   = 0.992875;
crhoa   = 0.982716;
crhoga  = 0.196454;
crhop   = 0.624064;
cmup    = 0.570707;
crhow   = 0.905390;
cmuw    = 0.826670;
crhor   = 0.316487;

// SS parameters
ciy     = (ctau+cdelta-1)*cky;
ccy     = 1-ciy-cgy;
cvy     = crk*cky;

//helpers
c1      =1/(1+ch/ctau);
c2      =(1-ch/ctau)/(1+ch/ctau);
i1      = 1/(1+cbeta);
i2      = i1/(ctau^2*cphi);
q1      = crk/(crk+1-cdelta);
pi1     = cbeta;
pi2     = ((1-cthetap*cbeta)*(1-cthetap))/(cthetap*(1+(cpsip-1)*cepsp));
w1      = ((1-cthetaw*cbeta)*(1-cthetaw))/(cthetaw*(1+comega*cepsw));
k1      =(1-cdelta)/ctau;
k2      =(ctau+cdelta-1)*(1+cbeta)*ctau*cphi;
e1      = ((1-cthetae*cbeta)*(1-cthetae))/cthetae;

model(linear);

// sticky model

// 1 consumption euler equation
c=c1*c(+1)+(1-c1)*c(-1)-c2*(r-pi(+1)-epsilonb);
// 2 investment euler equation
i=i1*i(-1)+(1-i1)*i(+1)+i2*q+epsilonq;
// 3 value of capital stock
q=-(r-pi(+1)-epsilonb)+q1*rk(+1)+(1-q1)*q(+1);
// 4 aggregate resource constraint 
y=ccy*c+ciy*i+cvy*v+epsilong;
// 5 cobb-douglas production function
y=cpsip*(calpha*k+(1-calpha)*n+epsilona);
// 6 Calvo pricing
pi-cgammap*pi(-1)=pi1*(pi(+1)-cgammap*pi)-pi2*(-mc+100*epsilonp);
// 7 marginal cost
mc=(1-calpha)*w+calpha*rk-epsilona;
// 8 Calvo wage setting
w-w(-1)+pi=cgammaw*pi(-1)+cbeta*(w(+1)-w+pi(+1)-cgammaw*pi)-w1*(comega*u-100*epsilonw);
// 9 average wage markup und unemployment
comega*u= w-(z+epsilons+comega*e);
// 10 natural unemployment
comega*un=100*epsilonw;
// 11 labor force
l=u+e;
// 12 smoothed trend of consumption
z=(1-cv)*z(-1)+cv/(1-ch/ctau)*(c-ch/ctau*c(-1));
// 13 capital stock
kbar=k1*kbar(-1)+(1-k1)*i+k2*epsilonq;
// 14 capital services production
k=v+kbar(-1);
// 15 optimal capital utilization condition
v=(1-cpsi)/cpsi*rk;
// 16 optimal capital labor condition
k=w-rk+n;
// 17 monetary policy rule
r=crhointr*r(-1)+(1-crhointr)*(crpi*pi+cry*ygap+crdy*(ygap-ygap(-1)))-epsilonr;
// 18 employment/productivity
e-e(-1)=cbeta*(e(+1)-e)+e1*(n-e);


//flex model

cf=c1*cf(+1)+(1-c1)*cf(-1)-c2*(rf-epsilonb);
invf=i1*invf(-1)+(1-i1)*invf(+1)+i2*qf+epsilonq;
qf=-(rf-epsilonb)+q1*rkf(+1)+(1-q1)*qf(+1);
yf=ccy*cf+ciy*invf+cvy*vf+epsilong;
yf=cpsip*(calpha*kf+(1-calpha)*nf+epsilona);
0=(1-calpha)*wf+calpha*rkf-epsilona;
//comega*un= wf-(zf+epsilons+comega*ef); // flex version of sticky equation
wf=zf+epsilons+comega*nf; // flex version used by authors' in code
zf=(1-cv)*zf(-1)+cv/(1-ch/ctau)*(cf-ch/ctau*cf(-1));
kbarf=k1*kbarf(-1)+(1-k1)*invf+k2*epsilonq;
kf=vf+kbarf(-1);
vf=(1-cpsi)/cpsi*rkf;
kf=wf-rkf+nf;
ef-ef(-1)=cbeta*(ef(+1)-ef)+e1*(nf-ef);

// output gap
ygap=y-yf;

// shock processes
epsilonb=crhob*epsilonb(-1)+etab;
epsilonq=crhoq*epsilonq(-1)+etaq;
epsilong=crhog*epsilong(-1)+etag+crhoga*etaa;
epsilona=crhoa*epsilona(-1)+etaa;
epsilonp=crhop*epsilonp(-1)+etap-cmup*etap(-1);
epsilonr=crhor*epsilonr(-1)+etar;
epsilons=crhos*epsilons(-1)+etas;
epsilonw=crhow*epsilonw(-1)+etaw-cmuw*etaw(-1);

// measurement equations
dyobs=ctaubar+cebar+y-y(-1);
dcobs=ctaubar+cebar+c-c(-1);
diobs=ctaubar+cebar+i-i(-1);
piobs=cpibar+pi;
dwobs-piobs=ctaubar+w-w(-1)-(pi-pi(-1));
deobs=cebar+e-e(-1);
uobs=cubar+u;
robs=4*crbar+4*r;

// annualzied rates
ryear=4*r;
piyear=pi+pi(-1)+pi(-2)+pi(-3);

end; 


//resid(1);
steady;
check;

shocks;
//productivity shock
var etaa;
stderr 0.570053 ; 
//wedge between FFR  and return on assets
var etab;
stderr 0.254028 ; 
var etag;  
stderr 0.305013 ; 
//investment specific technology
var etaq;
stderr 0.485825 ;
var etar;
stderr 0.111101 ; 
var etap;
stderr 0.379025 ; 
var etaw;
stderr 0.354961 ; 
var etas;
stderr 1.012299 ; 
end;

stoch_simul(periods = 1000, irf = 21) y piyear ryear e u ygap;