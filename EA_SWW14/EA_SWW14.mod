//**************************************************************************
// Professional forecasters and real-time forecasting with a DSGE model
//
// Frank Smets, Anders Warne, Rafael Wouters
//
// International Journal of Forecasting 30 (2014) 981–995
//**************************************************************************
// Model: EA_SWW14
// Further references:
// Frank Smets, Anders Warne, Rafael Wouters 2013. "Professional Forecasters and the Real-Time 
// Forecasting Performance of an Estimated New Keynesian Model for the Euro Area"
// ECB Working Paper Series NO 1571 / August 2013
// Last edited: 7/1/19 by N. Telia, A. Dück

var     c    // consumption
        pi   // inflation
        i    // investment
        q    // value of capital stock
        r    // nominal interest rate
        rk   // rental rate on capital
        y    // output
        v    // capital utilization
        k    // captal services to firms
        kbar // capital
        n    // hours worked
        mc   // real marginal cost
        w    // real wage
        u    // unemployment
        un   // natural level of unemployment
        e    // employment
        z    // smoothed trend of consumption
        ygap // output gap
        l    // labor force
// flex price variables
cf yf iflex qf rkf vf kf nf wf zf ef kbarf rrf 
// shocks
epsg epsb epsi epsa epsp ep epsw ew epsr epss
// annualized rates
piyear ryear
// measurement equations
dyobs dcobs diobs piobs dwobs deobs uobs robs
// endogenous definition for MMB
etag    // exogenous spending shock

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************


varexo  etab    // risk premium shock
        etai    // investment-specific technology shock
        etaa    // neutral, factor-augmenting productivity shock (TFP shock)
        etas    // labor supply shock
        etap    // price markup shock
        etaw    // wage markup shock
        etar    // monetary policy shock


//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
//**************************************************************************
  
 
parameters  
//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
        std_r_ std_r_quart coffispol                                     //*
//**************************************************************************

            ch      // external habit parameter
            ctau    // trend growth rate
            cbeta   // discount factor
            cphi    // elasticity of the capital adjustment cost function
            crk     // rental rate on capital (SS)
            cdelta  // depreciation rate
            ccy     // C/Y ratio (SS)
            ciy     // I/Y ratio (SS)
            cvy     // V/Y ratio (SS)
            cgy     // G/Y ratio (SS)
            cky     // K/Y ratio (SS)
            cphip   // reflects fixed costs in production
            calpha  // Cobb-Douglas parameter
            cgammap // degree of price indexation 
            cthetap // degree of price stickiness
            cgammaw // degree of wage indexation
            cthetaw // degree of wage stickiness
            cthetae // fraction of firms able to adjust employment
            comega  // inverse elasticity of labor supply
            cepsp   // curvature of aggregator function prices
            cepsw   // curvature of aggregator function wages
            cv      // captures short run wealth effect on labor supply
            cpsi    // elasticity of capital utilization cost function
            crhointr// interest smoothing parameter
            crpi    // how strong interest rate reacts to inflation
            cry     // how strong interest rate reacts to output gap
            crdeltay// how strong interest rate reacts to changes in output gap
            //measurement equation parameters
            ctaubar cebar cpibar crbar cubar cpi cbetabar
            // helpers
            cw clk cphiw
            // shock parameters
            crhor crhoa crhos crhop crhow crhoq crhog crhob crhoga cp1 cw1
;

// parameter initialization
// not identified
cgy     =   0.18;
cdelta  =   0.025;
cepsp   =   10;
crhos   =   0.999;

// identified, use paper posterior means (based on table 2 on page 986 in the published paper)
// in brackets find the parameter names in the authors' code (if they differ substantially)
// log utility  --> ysigmac =1
ch      =   0.64; //lambda
ctaubar =   0.14; //gammabar
cphi    =   4.79; //varphi
calpha  =   0.22;
cgammap =   0.27; //imathp
cthetap =   0.85; //xip
cgammaw =   0.25; //imathw
cthetaw =   0.72; //xiw
comega  =   5.56; //sigmal
cv      =   0.12; //upsilon
cpsi    =   0.48;
crhointr=   0.86; //rho
crpi    =   1.27;
cry     =   0.19;
crdeltay=   0.02;
cthetae =   0.71; //xie
cphip   =   1.48; 
cphiw   =   1.51;
cebar   =   0.22;
cbetabar=   0.27; //betainv
cpibar  =   0.56;




// measurement equation parameters
ctau    =   ctaubar/100 + 1;
cpi     =   cpibar/100+1;
cbeta   =   1/(cbetabar/100+1);
crbar   =   100*(cpi*ctau/cbeta-1);
cubar   =   100*(cthetaw-1)/comega;

// Updating coefficients. Some equations are not given in the paper
// But are provided by the author of the paper, in the software package YADA
cepsw   = cphiw/(cphiw-1); 
crk     = (ctau/cbeta)+cdelta-1; //yrkstar
cw      = (calpha^calpha*(1-calpha)^(1-calpha)/(cphip*crk^calpha))^(1/(1-calpha));
clk     = ((1-calpha)/calpha)*(crk/cw);
cky     = cphip*(clk^(calpha-1));
ciy     = (ctau+cdelta-1)*cky;
ccy     = 1-ciy-cgy;
cvy     = crk*cky; 

// shock equation parameters
crhoa   =   0.98;
crhob   =   0.91;
crhog   =   0.99;
crhoq   =   0.35;
crhor   =   0.3;
crhop   =   0.53;
crhow   =   0.89;
cp1     =   0.47;
cw1     =   0.8;


// crhos calibrated and set to 0.999
// g is AR(1) shock, but also depends on exogenous TFP shock (a)
crhoga  =   0.19 ; //measures the effect of TFP innovations on exogenous spending

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
    deep_parameter_name = M_.param_names(i,:);                           
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);                                                            
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************


model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = ryear;                                                        //*
inflation  = piyear;                                                 	 //*
inflationq = 4*pi;                                                  	 //*
outputgap  = y-yf;                                                       //*
output     = y;                                                          //*
fispol     = etag;                                                         //*
//**************************************************************************

//**************************************************************************                                                                    
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy                                                       //*
                                                                         //*
interest =   cofintintb1*interest(-1)                                    //* 
           + cofintintb2*interest(-2)                                    //* 
           + cofintintb3*interest(-3)                                    //* 
           + cofintintb4*interest(-4)                                    //* 
           + cofintinf0*inflationq                                       //* 
           + cofintinfb1*inflationq(-1)                                  //* 
           + cofintinfb2*inflationq(-2)                                  //* 
           + cofintinfb3*inflationq(-3)                                  //* 
           + cofintinfb4*inflationq(-4)                                  //* 
           + cofintinff1*inflationq(+1)                                  //* 
           + cofintinff2*inflationq(+2)                                  //* 
           + cofintinff3*inflationq(+3)                                  //* 
           + cofintinff4*inflationq(+4)                                  //* 
           + cofintout*outputgap 	                                     //* 
           + cofintoutb1*outputgap(-1)                                   //* 
           + cofintoutb2*outputgap(-2)                                   //* 
           + cofintoutb3*outputgap(-3)                                   //* 
           + cofintoutb4*outputgap(-4)                                   //* 
           + cofintoutf1*outputgap(+1)                                   //* 
           + cofintoutf2*outputgap(+2)                                   //* 
           + cofintoutf3*outputgap(+3)                                   //* 
           + cofintoutf4*outputgap(+4)                                   //* 
           + cofintoutp*output 	                                         //* 
           + cofintoutpb1*output(-1)                                     //* 
           + cofintoutpb2*output(-2)                                     //* 
           + cofintoutpb3*output(-3)                                     //* 
           + cofintoutpb4*output(-4)                                     //* 
           + cofintoutpf1*output(+1)                                     //* 
           + cofintoutpf2*output(+2)                                     //* 
           + cofintoutpf3*output(+3)                                     //* 
           + cofintoutpf4*output(+4)                                     //* 
           + std_r_ *interest_;                                          //* 
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

// sticky price and wage
y = ccy*c+ ciy*i+ cvy*v+ epsg;
i = (1/(1+(cbeta)))*i(-1)+ ((cbeta)/(1+(cbeta)))*i(+1)+ (1/((1+(cbeta))*(ctau^2)*cphi))*q + epsi;
q = ((1-cdelta)/(crk+1-cdelta))*q(+1) + (crk/(crk+1-cdelta))*rk(+1) - r + pi(+1) + epsb;
y = cphip*calpha*k+ cphip*(1-calpha)*n + cphip*epsa;
k = kbar(-1) + v;
v = ((1-cpsi)/cpsi)*rk;
kbar = ((1-cdelta)/ctau)*kbar(-1)+ ((ctau+cdelta-1)/ctau)*i+ ((ctau+cdelta-1)*(1+(cbeta))*ctau*cphi)*epsi;
mc = calpha*rk+ (1-calpha)*w- epsa;
pi = (cgammap/(1+(cbeta*cgammap)))*pi(-1) + ((cbeta)/(1+(cbeta*cgammap)))*pi(+1)+ (((1-cthetap)*(1-(cbeta*cthetap)))/((1+(cbeta*cgammap))*cthetap*( ((cphip-1)*cepsp)+1) ))*(mc - 100*epsp);
rk = w+ n - k;
w - w(-1)+ pi = (cbeta)*(w(+1) - w + pi(+1))- (cbeta*cgammaw)*pi+ cgammaw*pi(-1) - (((1-cthetaw)*(1-(cbeta*cthetaw)))/(cthetaw*(1+cepsw*comega)))*(comega*u - 100*epsw);
//r = crhointr*r(-1)+ (1-crhointr)*crpi*pi+ (1-crhointr)*cry*ygap+ crdeltay*(y-y(-1) - (yf-yf(-1))) + epsr;
z = (1-cv)*z(-1)+ (cv/(1-(ch/ctau)))*(c - (ch/ctau)*c(-1));
comega*u = w-(z+epss+comega*e);
c = (1/(1+ch/ctau))*c(+1)+(1- 1/(1+ch/ctau) )*c(-1) - ((1-ch/ctau)/(1+ch/ctau))*(r-pi(+1)-epsb);
u = l - e;
un = (100/comega)*epsw;
e = ((e(+1) - e)) + e(-1) + (((1-(cbeta*cthetae))*(1-cthetae))/cthetae)*(n-e);

// flex price and wage
yf = ccy*cf + ciy*iflex + cvy*vf+ epsg;
cf = (1/(1+ch/ctau))*cf(+1)+(1- 1/(1+ch/ctau) )*cf(-1) - ((1-ch/ctau)/(1+ch/ctau))*(rrf-epsb);
iflex = (1/(1+(cbeta)))*iflex(-1)+ ((cbeta)/(1+(cbeta)))*iflex(+1) + (1/((1+(cbeta))*(ctau^2)*cphi))*qf+ epsi;
qf = ((1-cdelta)/(crk+1-cdelta))*qf(+1)+ (crk/(crk+1-cdelta))*rkf(+1)- rrf+ epsb;
yf = cphip*calpha*kf+ cphip*(1-calpha)*nf+ cphip*epsa;
kf = kbarf(-1) + vf;
vf = ((1-cpsi)/cpsi)*rkf;
kbarf = ((1-cdelta)/ctau)*kbarf(-1) + ((ctau+cdelta-1)/ctau)*iflex+ ((ctau+cdelta-1)*(1+(cbeta))*ctau*cphi)*epsi;
epsa = calpha*rkf+ (1-calpha)*wf;
rkf = wf + nf- kf;
zf = (1-cv)*zf(-1)  + (cv/(1-(ch/ctau)))*(cf - (ch/ctau)*cf(-1));
//comega*un= wf-(zf+epsilons+comega*ef); // flex version of sticky equation
wf = comega*nf + zf + epss; // flex version used by authors' in code (needs to be used)
ef = ((ef(+1) - ef)) + ef(-1)+ (((1-(cbeta*cthetae))*(1-cthetae))/cthetae)*(nf-ef);

// additional equations
ygap = y - yf;

// shock equations
epsg = crhog*epsg(-1) + etag + crhoga*etaa;
epsb = crhob*epsb(-1) + etab;
epsi = crhoq*epsi(-1) + etai;
epsa = crhoa*epsa(-1) + etaa;
epsp = crhop*epsp(-1) + ep - cp1*ep(-1);
ep = etap;
epsw = crhow*epsw(-1) + ew - cw1*ew(-1);
ew = etaw;
epsr = crhor*epsr(-1) - etar;
epss = 0.999*epss(-1) + etas;

// annualized rates
piyear=pi+pi(-1)+pi(-2)+pi(-3);
ryear=r*4;

// measurement equations
dyobs=ctaubar+cebar+y-y(-1);
dcobs=ctaubar+cebar+c-c(-1);
diobs=ctaubar+cebar+i-i(-1);
piobs=cpibar+pi;
dwobs-piobs=ctaubar+w-w(-1)-(pi-pi(-1));
deobs=cebar+e-e(-1);
uobs=cubar+u;
robs=4*crbar+4*r;
end;

//resid(1);
steady;
check;

shocks;
//productivity shock
var etaa;
stderr 0.6 ; 
//wedge between FFR  and return on assets
var etab;
stderr 0.28 ; 
var fiscal_;  
stderr 0.31 ; 
//investment specific technology
var etai;
stderr 0.49 ;
var etar;
stderr 0.11; 
var etap;
stderr 0.49; 
var etaw;
stderr 0.76; 
var etas;
stderr 1.07; 
end;

//stoch_simul(periods = 1000, irf = 20, irf_shocks = (etaw)) y piyear ryear e u ygap;