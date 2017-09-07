//**************************************************************************
// Model replication coded by: Rasa Pusinskaite, e_mail: pusinskaite@wiwi.uni-frankfurt.de

//**************************************************************************

// Further references:
// Bernanke, Ben S., Mark Gertler, and Simon Gilchrist (1999) ``The Financial Accelerator 
//in a Quantitative Business Cycle Framework''
// In: Handbook of Macroeconomics. North Holland, Amsterdam.
//**************************************************************************

var cH              //Consumption
    hH              //Household labor
    piH             //Inflation
    rH              //Gross real risk-free intrest rate
    r_nH            //Gross nominal risk-free intrest rate
    qH              //Price of capital
    kH              //Capital
    nH              //Net worth    
    r_kH            //Return on capital
    yH              //Output
    xH              //Markup
    iH              //Investment
    aH              //Aggregate technology level  
    c_eH            //Entrepreneurial consumption        
    gH              //Government expenditures
    pi_t1H //pipH sH //One period forward inflation
    premiumH        //External finance premium
;

varexo e_a e_g e_rn;    //Technology, demand and monetary shocks

parameters 
    X               //Steady state gross markup
    R               //Steady state gross real risk-free interest rate
    H               //Steady state of household labor
    R_K             //Steady state return on capital
    s               //Steady state external finnace premium
    KN              //Steady state capital to net worth ratio
    CY              //Steady state consumption to output ratio
    GY              //Steady state govern. expenditures to output ratio
    C_EY            //Steady state entrepreneurial consumption to output ratio
    IY              //Steady state investment to output ratio
    YK              //Steady state output to capital ratio
    WY              //Steady state wage to output ratio
    GAMMA_WBAR      //Steady state share of profits that is used to repay debt
    NY              //Steady state net worth to output ratio
    DY              //Steady state deposit to output ratio
    YN              //Steady state output to net worth ratio
    niv             //Elasticity of external finance premium wrt a change in leverage

    omegav                  //Entrepreneurial labor share in labor
    alphav                  //Capital share
    betav                   //Discount factor
    sigmav                  //Standard deviation of log normally distribution of idiosyncratic shocks (not use in this computation)
    gammav                  //Death rate
    muv                     //Auditig costs
    deltav                  //Depreciation rate
    phiv                    //Elasticity of price of capital wrt investment capital ratio
    kappav                  //Parameter in Phillips curve
    thetav                  //Probability that a firm does not change price (Calvo)
    epsilonv                //Parameter
    etav                    //Labor supply elasticity
    zetav                   //Coefficient on inflation in MP rule
    rhov rhov_a rhov_g      //Serial correlation coefficients    
; 

alphav = 0.35;
omegav = 0.64/(1-alphav);  
betav = 0.99;
sigmav = 0.28;
gammav = 1-0.0272;               
muv = 0.12;
deltav = 0.025;
rhov = 0.9;
rhov_a =1;   
rhov_g = 0.95;

s = 1.005;
KN = 2;
GY = 0.2;
X = 1.1;
H = 0.25;
R = 1/betav;
R_K = s*R;
YK = X/alphav*(R_K - (1 - deltav));                                         // From (4.4) Equation
WY = (1-alphav)*omegav/(H*X);                                               // From (4.11) Equation
GAMMA_WBAR = 1-1/(gammav*s)*(betav/KN - (1-alphav)*(1-omegav)/alphav *(s-(1-deltav*betav)));   // From GNN (2003)
NY = gammav*(1-GAMMA_WBAR)*R_K/YK + (1-alphav)*(1-omegav)/X;                // From (4.13) Equation
DY = 1/YK - NY;                                                             // From (3.2) Equation
CY = WY*H - GY + (X-1)/X + (R-1)*DY;                                        // From (B.2) Equation
IY = 1/YK *deltav;                                                          // From I/K = deltav
C_EY = 1 - CY - IY - GY;                                                    // From (B.8) Equation
YN = 1/NY;
niv = 0.05;                                  
epsilonv = (1 - deltav)/((1 - deltav) + alphav*YK / X);     
phiv = 0.25;      
etav = 3;
thetav = 0.75;
kappav = (1-thetav)/thetav*(1-thetav*betav);
zetav = 0.11;

model(linear);
yH = CY*cH + C_EY*c_eH + IY*iH+GY*gH;
cH = cH(+1) - rH; 
c_eH = nH;

r_kH(+1)-rH = -niv*(nH -(qH+kH));
r_kH = (1-epsilonv)*(yH - xH - kH(-1))+epsilonv*qH -qH(-1);
qH = phiv*(iH - kH(-1));                                             
yH = aH + alphav*kH(-1)+(1-alphav)*omegav*hH;
yH - hH -xH - cH = etav^(-1)*hH;

pi_t1H = kappav*(-1)*xH(+1)+betav *piH(+2);                                            
piH = pi_t1H(-1);

//pipH = kappav*(-1)*xH+betav *piH(+1);                                            
//sH = pipH(+1);
//piH = sH(-1); 
kH = deltav*iH + (1-deltav)*kH(-1);

nH = gammav*R_K*KN*r_kH - gammav*R*KN*rH(-1)+ gammav*(R_K - R)*KN*(qH(-1) + kH(-1)) + gammav*R*(rH(-1)+nH(-1))+(1-alphav)*(1-omegav)*(YN/X)*(yH - xH);
aH = rhov_a*aH(-1)+e_a;                                                     
gH = rhov_g*gH(-1)+e_g;
r_nH = rhov*r_nH(-1)+zetav*piH - e_rn;         

r_nH = rH+ piH(+1); 
premiumH = r_kH(+1) - rH;
end;

steady;
check;

shocks;
var e_a; stderr 0.0065;           
var e_g; stderr 0.01;              
var e_rn; stderr 0.0025/4;       
end;

stoch_simul(IRF=30, nograph);