// Model: NK_GM16

// Further references:
// Galí, Jordi, and Tommaso Monacelli (2016) “Understanding the Gains from Wage Flexibility: The Exchange Rate Connection"
// AMERICAN ECONOMIC REVIEW VOL. 106, NO. 12, (pp. 3829-68)

// The code has been provided by the authors.
// Edited by Lazar Milivojevic 11/02/2019

// Policy regime: Domestic inflation targeting

// World economy exogenous

// variables are in log deviations from respective steady states
var 
y         // output
c         // consumtion
s         // terms of trade (TOT) in SOE  
z         // exogenous preference shifter
zx1 
zx2    //  Exogenous shocks that are defined by the differential monetary policy responses they elicit from the (foreign) central bank
i         // nominal interest rate in SOE
dpc        // CPI inflation in SOE
e         // nominal exchange rate in SOE
p        // domestic price level
n         // labor
a         // productivity in SOE 
dp       // domestic inflation in SOE
t       // labor tax
wp     // real wage
dw       // wage inflation
w         // nominal wages
pc         // price level in SOE
r       // real interest rate                                
de
ygap // gaps
wgap
sgap
cgap
ngap
ngapx
yn   //flexible price counterparts
sn
cn
nn
ne
wpn
ngraph // adjustments for the graphs 
igraph 
rgraph 
sgraph ;


                                        
// exogenous variables
varexo ez ea ezx1 ezx2 et ;
                                     
                                   
parameters bet phi epsp alf epsw thep thew phiy nu lamw lamp  rhoa rhoz rhot rhozx1 rhozx2;

thep = 0.8 ;       % constant price calvo parameter
thew = 0.8;
phiy = 0 ;
//phie = 0.999 ;
//phip =0 ;
//phie = 0 ;
//phip =1 ;
//game = 1 ;
phi = 2.22 ;
alf = 0.26 ;   
bet = 0.99 ; 
nu = 0.3 ;               % openness
epsw = 1/(1-exp(-phi*0.118)) ;        % labor demand elasticity (consistent with u = 11.8%;  phi=2,epsw=2.24 )
                     
epsp = 3.85 ;           % goods demand elasticity

lamp   =   ((1-bet*thep)*(1-thep)/thep)*((1-alf)/(1-alf+alf*epsp)) ;
lamw   =   (1-bet*thew)*(1-thew)/(thew*(1+epsw*phi)) ;

rhoz =  0.9 ;   
rhoa =  0.9 ;       
rhozx1 =  0.9 ;      
rhozx2 =  0.9 ;      
rhot =  0.9 ;   


model(linear);

z   = rhoz*z(-1) + ez;                  % domestic demand shock
a   = rhoa*a(-1) + ea;                  % technology shock
zx1   = rhozx1*zx1(-1) + ezx1 ;         % export shock
zx2   = rhozx2*zx2(-1) + ezx2 ;         % world interest rate shock
t   = rhot*t(-1) - et;                  % payroll tax shock (sign modified for irfs)

y  = (1-nu)*c + nu*(2-nu)*s + nu*zx1 ;
c = (1-nu)*s + z - zx2 ;
c = c(+1) - (i - dpc(+1)) + (1-rhoz)*z ;
s  = e - p ;
pc = p + nu*s ;
r = i - dp(+1);
n   =  (y - a)/(1-alf) ;

dp  = bet*dp(+1) + (lamp*alf/(1-alf))*ygap + lamp*wgap + lamp*nu*sgap ;
dw  = bet*dw(+1) + (lamw*phi/(1-alf))*ygap - lamw*wgap + lamw*cgap ;

dp = p - p(-1);                         % domestic price inflation
dpc = pc - pc(-1);
dw = w - w(-1);
de = e - e(-1);
wp = w - pc ;     % consumption wage

//i = (1-phie)*(phip*dp+phiy*y) + game*(phie/(1-phie))*e ;             % interest rate rule
//e=0;  // currency union
dp=0; // domestic inflation targeting

ygap = y - yn;
ngap = n - nn;
ngapx = n - ne; 
sgap = s - sn;
cgap = c - cn;
wgap = wp - wpn;

nn  =  - (nu/(1+phi))*(z-zx1-zx2) - (1/(1+phi))*t ;
ne  =   - (nu/(1+phi))*(z-zx1-zx2) ;
yn  =  a + (1-alf)*nn ;
sn  =  a - (z-zx2) - t - (alf+phi)*nn ;
cn  = (z-zx2) + (1-nu)*sn ;
wpn = a - alf*nn - t - nu*sn ;

ngraph=n*100;
igraph =i*400;
rgraph=r*400; 
sgraph=s*100;

end;

initval;
ngap = 0; ngapx =  0; ygap = 0; sgap = 0; cgap = 0; wgap = 0; dp = 0 ; dpc = 0 ; dw = 0; i = 0; r = 0;
e = 0; de = 0; y = 0; n = 0; s = 0; c = 0; wpn = 0; yn = 0; nn = 0; ne = 0; sn = 0; cn = 0; a = 0; z = 0;
t = 0; zx1 = 0; zx2 = 0; ngraph=0; igraph=0; rgraph=0; sgraph=0;
end;

options_.noprint = 1;
steady;

shocks;
//var ea = (0.01)^2;
//var ez = (0.01)^2;
//var ezx1 = (0.01)^2;
//var ezx2 = (0.01)^2;  
var et = (0.01)^2;
end;

stoch_simul(irf=25, nograph) ngraph igraph rgraph sgraph ;
