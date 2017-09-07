// Model: NK_GM05

// Further references:
// Galí, Jordi, and Tommaso Monacelli (2005) “Monetary Policy and Exchange Rate
// Volatility in a Small Open Economy” Review of Economic Studies 72, 707-734.

// Created: 2010/02/07 by Likun Wang

// Policy regime: DIT


//for IRF figures, the following parameter setting should be used:
//rhoa = 0.9;                                                                  //parameter of AR(1) for a, 
//rhoy = 0.9;                                                                  //parameter of AR(1) for y_star
//var a_ = 1^2;                                                                //the SD of productivity in SOE, it is 1 here, coz IRF in the paper is shocked by 1 (other than a Standard Deviation)
//var ystar_ = 1^2;                                                            //the SD of world output, it is 1 here,

//for the SD in table 1, the following parameter setting should be used:(as in this code)
//rhoa = 0.66;                                                                  //parameter of AR(1) for a, 
//rhoy = 0.86;                                                                  //parameter of AR(1) for y_star
//var a_ = 0.0071^2;                                                            //the SD of productivity in SOE, it is 1 here, coz IRF in the paper is shocked by 1 (other than a Standard Deviation)
//var ystar_ = 0.0078^2;                                                        //the SD of world output, it is 1 here,

 
//world economy exogenous(output is exogenous, and world monetary policy is setting world interest rate to 0,)
//but in the Gali (2002) NBER working paper, they also modeled the dynamics of world economy, i.e. 
//looking into the world IS curve, world Phillips curve, and exogenous dynamics of world productivity


//this model includes (1) Philips Curve of SOE                           (2) def. of nature level of output of SOE
//                    (3) New IS Curve of SOE                            (4) def. of nature rate of interest rate of SOE
//                    (5) def. of outout gap of SOE                      (6) monetary policy rule in SOE, (only DITR is possible here, coz CITR need CPI inflation, PEG need nominal exchange rate
//                    (7) exogenous process of productivity              (8) exogenous process of world output
// above equations are all the same with my first try, treat it as the conterparts of closed economy
//                    (9) wedge between deomestic and world output       (10)wedge (gap) between demestic and CPI inflation
//                    (11)def. of CPI inflation                          (12)def. of domestic inflation (PPI)
//                    (13)def. of Terms of Trade                         (14)Uncovered Interest rate Parity
//                    (15)foreign inflation



var pih x y ynat rnat r s pi p ph e ystar a pistar;
                                      // endogenous variables, 
                                      // r = interst rate / policy rule ((DITR / CITR / PEG))
                                      // pih = domestic inflation in SOE,        x = output gap,        y = output, 
                                      // ynat = natural level of output in SOE,  rnat = natural rate of interest rate in SOE,
                                      // s = term of trade (TOT) in SOE          e = nominal exchange rate for home country
                                      // pi = CPI inflation                      p = price level in SOE
                                      // ph = domestic price level (PPI)         rstar = world interest rate
                                      // ystar  = world output,                  a = productivity in SOE         
                                      // pi_stsr= world inflation,


varexo ystar_ a_;                     // exogenous variables (innovations)
                                      // a_ = shocks in productivity in SOE
                                      // ystar_ = shocks in world output

parameters sigma rho tau alpha theta xi beta kappa omega phipi rhoa rhoy;


sigma = 1;
rho  = 0.0101;
tau   = 1;
alpha = 0.4;
theta = 0;
beta  = 0.99;
kappa = 0.3433;
omega = -0.1277;
xi    = 0;
phipi = 1.5;
rhoa = 0.66;                                                                  //parameter of AR(1) for a, 
rhoy = 0.86;                                                                  //parameter of AR(1) for y_star


model(linear);

x    = x(+1) - sigma^(-1)*( r - pih(+1) - rnat) ;                              //1  New IS Curve of SOE, equ. (37) in the paper
rnat = -sigma*tau*(1-rhoa)*a + alpha*sigma*(theta+xi)*(rhoy-1)*ystar;          //2  def. of nature rate of interest rate of SOE, the last term of pluged E[d_ystar(t+1)]=(rhoy-1)*ystar in the equ below (37)   
pih  = beta * pih(+1)+ kappa*x;                                                //3  Philips Curve of the SOE, equ. (36) in the paper
ynat = tau*a + alpha*xi*ystar;                                                 //4  def. of nature level of output of SOE, equ. (35) in the paper
x    = y - ynat;                                                               //5  def. of outout gap of SOE  

pih  = 0;              //DIT optimal rule                                                 
//r    = phipi*pih;      //DITR                                                //6* monetary policy rule in SOE, (DITR / CITR / PEG)
//r    = phipi*pi;       //CITR
//e    = 0;              //PEG
//pi   = 0;              //CIR in NBER 2002 paper

y    = ystar + sigma^(-1)*s;                                                   //9  wedge between deomestic and world output, equ (29)
pi   = pih + alpha*(s-s(-1));                                                  //10 wedge (gap) between demestic and CPI inflation, equ (14)
pi   = p - p(-1);                                                              //11 def. of CPI inflation 
pih  = ph - ph(-1);                                                            //12 def. of domestic inflation (PPI)
s    = s(-1) + e - e(-1) + pistar - pih;                                       //13 from def. of TOT, first difference of equ (15), pi_star=0
pistar = 0;                                                                    //15 foreign inflation is set to be zero
//r    = e(+1) - e;                                                              //14?Uncovered Interest rate Parity, set world interest rate to zero(see p724), equ (19)
a    = rhoa*a(-1) + a_;                                                        //7  exogenous process of productivity in SOE,
ystar= rhoy*ystar(-1) + ystar_;                                                //8  exogenous process of world output,
end;


shocks;
var a_ = 0.0071^2;                                                                  //the SD of productivity 
var ystar_ = 0.0078^2;                                                              //the SD of world output
var a_, ystar_ = 0.3*0.0071*0.0078;                                                 
end;



stoch_simul(noprint, nograph) y pih pi r s ;
