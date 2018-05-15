//Chen et al (2012)
//The macroeconomic effects of LSAPPs (The Economic Journal)
//linearized model
//27.12.2017
//by Alina Tänzer, March 2018
 

var         marc rk r rL wz Kz Kz_eff L Yz Xpnu Xpnr Xpdu Xpdr Xwnu 
            Xwnr Xwdu Xwdr pi u Iz mu z psi lambda_ms bu br 
            Xiu Xir q Czu Czr zeta_h Bz BzL Gz Tz  
            shock_zeta BLMVz BTotMVz slope rLEH RP rr rLr rLEHr 
            Yz_growth pi_ann r_ann rL_ann dy y infl FFR bondrate riskprem y_level;
            
                   
varexo      eps_z eps_phi eps_lambda eps_mu eps_zeta eps_m eps_bu eps_br eps_Gz eps_T eps_B;     

parameters  alpha betau betar beta_av delta gamma kappa lambdaw lambdaf zeta zetap zetaw chi_pu chi_wu 
            omegau omegar S_dp a_dp zeta_prime RL phi_T phi_pi phi_y qu h sigmau sigmar nu rho_bu rho_br 
            rho_B rho_zeta rho_Gz rho_r rho_z rho_phi rho_mu rk_SS r_SS Bz_SS C_ratio Czu_SS Czr_SS BzL_SS 
            Gz_SS Iz_SS Yz_SS Tz_SS Pi_SS Kz_eff_SS Kz_SS X_ratio sigma_z sigma_lambda sigma_mu sigma_b 
            sigma_phi sigma_B sigma_T sigma_m sigma_zeta sigma_g BLMVB BLB BLMVz_SS kappaEH BondDuration;
            //

//CALIBRATED PARAMETERS
alpha       = 0.33;             //share of capital in production    
lambdaw     = 0.15;                //steady state wage markup 
lambdaf     = 0.15;                //steady state price markup 
delta       = 0.025;            //capital depreciation rate
Gz_SS       = 0.2;


//ESTIMATED PARAMETERS FROM POSTERIOR DISTRIBUTION - TRANSFORMED
gamma       = 0.005;            //check: vorher 0.5
betau       = 0.9988;           //discount factor for unconstrained HH
pi_SS       = 0.0053;             //quarterly SS inflation *100 in percent, annualized about 2%
zeta        = 0.001242;          //transaction costs (SS spread between 10-year treasury yield and federal funds rate) 
zeta_prime  = 0.003274;         //elasticity of risk premium to changes in in market value of long-term debt 
BondDuration = 30;

//ESTIMATED PARAMETERS FROM POSTERIOR DISTRIBUTION
BLMVB       = 0.8533; 
zetap       = 0.9288;            //price rigidity parameter
zetaw       = 0.7342;            //wage rigidity parameter
chi_wu      = 0.5611;            
omegau      = 0.9468;            //fraction of unrestricted agents
omegar      = 1 - omegau;        //fraction of restricted agents
S_dp        = 4.7815;           //investment adjustment cost convexity parameter
a_dp        = 0.2159;           //utilization cost elasticity parameter
phi_T       = 1.2543;           //fiscal rule parameter
phi_pi      = 1.5979;           //monetary policy rule weight on inflation
phi_y       = 0.3251;           //monetary policy rule weight on output growth 
h           = 0.8020;           //habit formation coefficient
sigmau      = 3.3548;           //intertemporal elasticity of substitution of consumption
sigmar      = 2.0825;           //intertemporal elasticity of substitution of consumption
nu          = 1.9295;           //labor supply elasticity

rho_bu      = 0.9614; 
rho_br      = 0.9614;           
rho_B       = 0.9659;
rho_zeta    = 0.9426; 
rho_Gz      = 0.7491;
rho_r       = 0.8565;           //interest rate smoothing in MP rule
rho_z       = 0.1430; 
rho_phi     = 0.5074;
rho_mu      = 0.8489; 
//std deviation of shock innovations:
sigma_z         = 0.7588;
sigma_lambda    = 1.7939; 
sigma_mu        = 2.9725; 
sigma_b         = 3.5860; 
sigma_phi       = 0.7628; 
sigma_B         = 0.3578;
sigma_T         = 0.3457;
sigma_m         = 0.25/4;   //for 25 bp shock (times 4 because goal is 25 bp change in annual rate)  original value:0.1161
sigma_zeta      = 0.2592;
sigma_g         = 0.3429;

//Parameters derived from SS:

C_ratio     = 0.9760;             //Ratio of consumption of unconstrained and constrained HH
Yz_SS       = 1; 
X_ratio     = 1.7030;             //ratio of unconstrained and constrained marginal utility

betar       = betau/(1+zeta);                                       //discount factor for constrained HH
Pi_SS       = 1+pi_SS;                                              //aus Text
r_SS        = 1/betau*exp(gamma)*Pi_SS;                             //from C.1
RL          = r_SS*(1+zeta);                                        //from C.2
kappa       = RL*(1-1/BondDuration);                                //coupon of long-term bonds, duration 30 quarters
kappaEH     = r_SS*(1-1/BondDuration);
BLB         =(RL-kappa)*BLMVB;
Bz_SS       = 0.25*4/(1+BLB);
BzL_SS      = BLB*Bz_SS;
BLMVz_SS    = BLMVB*Bz_SS;
beta_av     = (omegau*betau*(X_ratio)+omegar*betar)/(omegau*(X_ratio)+omegar);
rk_SS       = beta_av^(-1)*exp(gamma)-(1-delta);                    //from C.8
qu          = (beta_av/betar -1)*zeta^(-1);
chi_pu      = omegau/(omegau + omegar*((1-betau*zetap)/(1-betar*zetap))*(X_ratio));
Kz_eff_SS   = alpha/(1+lambdaf)*1/rk_SS;                            //from C.11
Kz_SS       = exp(gamma)*alpha/(1+lambdaf)*1/rk_SS;                 //from C.13
Iz_SS       = (exp(gamma)-(1-delta))*alpha/(1+lambdaf)*1/rk_SS;      //from C.14
Tz_SS       = Gz_SS - (1-1/betau + (1-1/betar)/(RL-kappa)*BLB)*Bz_SS;             
Czr_SS      = (1-Iz_SS-Gz_SS)/(omegau*C_ratio+omegar);              //from C.16
Czu_SS      = C_ratio*Czr_SS;                                       //from C.17



model(linear);
 
//INTERMEDIATE GOODS PRODUCERS:

//real marginal costs (D.1)
marc = alpha*rk + (1-alpha)*wz;               

//capital demand (D.2)
Kz_eff = wz - rk + L; 

//Technology (D.3)
Yz = alpha*Kz_eff + (1-alpha)*L;

//Price Setting unconstrained (u) and restricted (r) (D.4, D.5)
Xpnu = (1-betau*zetap)*(Xiu + Yz + lambda_ms + marc) + betau*zetap*((1+lambdaf)/lambdaf*pi(+1) + Xpnu(+1)); 
Xpnr = (1-betar*zetap)*(Xir + Yz + lambda_ms + marc) + betar*zetap*((1+lambdaf)/lambdaf*pi(+1) + Xpnr(+1)); 

Xpdu = (1-betau*zetap)*(Xiu + Yz) + betau*zetap*(-1/lambdaf*pi(+1) + Xpdu(+1));                                 
Xpdr = (1-betar*zetap)*(Xir + Yz) + betar*zetap*(-1/lambdaf*pi(+1) + Xpdr(+1));                                 

//Law of motion of prices (D.6)
pi = (1-zetap)/zetap*(chi_pu*Xpnu + (1-chi_pu)*Xpnr - chi_pu*Xpdu -(1-chi_pu)*Xpdr);

//CAPITAL PRODUCERS:

//Effective Capital (D.7)
Kz_eff = -z + u + Kz(-1);   

//Law of motion of capital (D.8)
Kz = (1-delta)*exp(-gamma)*(Kz(-1)-z)+ (1-(1-delta)*exp(-gamma))*(mu+Iz);

//Capital Utilization (D.9)
rk = a_dp/rk_SS*u;    

//Law of motion of Q (D.10)
q = beta_av*exp(-gamma)*(rk_SS*rk(+1)+(1-delta)*q(+1))-z(+1)+ qu*((1+zeta)
    /(1+qu*zeta)*Xiu(+1)-Xiu)+(1-qu)*(1/(1+qu*zeta)*Xir(+1)-Xir);

//Investment decision (D.11)
0 = q + mu - exp(2*gamma)*S_dp*(z + Iz - Iz(-1))+ beta_av*exp(2*gamma)*S_dp*(z(+1) + Iz(+1)-Iz);

//HOUSEHOLDS:

//Marginal utilities each type (u,r) (D.12)
Xiu = 1/(1-betau*h)*((bu - betau*h*bu(+1))-sigmau/(1-h)*((1+betau*h^2)*Czu-betau*h*Czu(+1)-h*Czu(-1)));
Xir = 1/(1-betar*h)*((br - betar*h*br(+1))-sigmar/(1-h)*((1+betar*h^2)*Czr-betar*h*Czr(+1)-h*Czr(-1)));  

//EE unconstrained, short (D.13); Fisher equation 
Xiu = r + Xiu(+1)-z(+1)-pi(+1);

//EE unconstrained, long (D.14); 
zeta_h + Xiu = RL/(RL-kappa)*rL + Xiu(+1) -z(+1) -pi(+1) -kappa/(RL-kappa)*rL(+1);

//EE constrained, long (D.15); 
Xir = RL/(RL-kappa)*rL + Xir(+1) -z(+1) -pi(+1) -kappa/(RL-kappa)*rL(+1);

//Wage setting (D.16)
Xwnu = (1-zetaw*betau)*(bu + psi + (1+nu)*L + (1+lambdaw)/lambdaw*(1+nu)*wz) 
        + zetaw*betau*((1+lambdaw)/lambdaw*(1+nu)*(pi(+1)+z(+1))+Xwnu(+1));       
Xwnr = (1-zetaw*betar)*(br + psi + (1+nu)*L + (1+lambdaw)/lambdaw*(1+nu)*wz) 
        + zetaw*betar*((1+lambdaw)/lambdaw*(1+nu)*(pi(+1)+z(+1))+Xwnr(+1));       

//Wage setting (D.17)
Xwdu = (1-zetaw*betau)*(Xiu+L+(1+lambdaw)/lambdaw*wz) + zetaw*betau*(1/lambdaw*(-pi(+1)+z(+1))+Xwdu(+1)); 
Xwdr = (1-zetaw*betar)*(Xir+L+(1+lambdaw)/lambdaw*wz) + zetaw*betar*(1/lambdaw*(-pi(+1)+z(+1))+Xwdr(+1)); 

//Law of motion of real wages (D.18)
wz=(1-zetaw)/(1+(1+lambdaw)/lambdaw*nu)*(chi_wu*(Xwnu-Xwdu)+(1-chi_wu)*(Xwnr-Xwdr))+ zetaw*(wz(-1)-pi-z); 

//GOVERNMENT DEBT:

//Budget constraint (D.19)
Bz+(BzL_SS/Bz_SS)/(RL-kappa)*BzL = betau^(-1)*(Bz(-1)+r(-1))+(BzL_SS/Bz_SS)/(RL-kappa)*betar^(-1)*BzL(-1)
                         +(1-exp(-gamma)*Pi_SS^(-1)*kappa)*RL/(RL-kappa)*(BzL_SS/Bz_SS)/(RL-kappa)*rL
                         +Gz_SS/Bz_SS*Gz - Yz_SS/Bz_SS*Tz -(betau^(-1)+(BzL_SS/Bz_SS)/(RL-kappa)*betar^(-1))*(z+pi);

//EQUATIONS WHICH ARE NEW AS IN OFFICIAL CODE:
//******************************************************************
//Long-term bond policy (D.20)
      
    //defining the LHS of bond equation D.20
    BLMVz = BzL - RL/(RL-kappa)*rL;
    BLMVz = rho_B*BLMVz(-1)+eps_B;

    //Transfers reedback rule
    (Tz-Gz_SS*Gz)/(Tz_SS-Gz_SS)= phi_T*BLMVz(-1)+eps_T;
    //definition of RHS bracket
    Bz+(BzL_SS/Bz_SS)/(RL-kappa)*BzL-(BzL_SS/Bz_SS)*RL/((RL-kappa)^2)*rL -(1+ (BzL_SS/Bz_SS)/(RL-kappa))*BTotMVz;
    
//Term premium (D.23)/ risk premium

    zeta_h = zeta_prime*(BLMVz - Bz) + shock_zeta;
    shock_zeta = rho_zeta*shock_zeta(-1)+eps_zeta; 
//************************************************************************


//Monetary policy (D.22)
r = rho_r*r(-1) + (1-rho_r)*(phi_pi*pi + phi_y*(Yz - Yz(-4) + z + z(-1) + z(-2) + z(-3))) + eps_m; 

//Aggregate Resource constraint (D.24)
Yz*Yz_SS = omegau*Czu_SS*Czu + omegar*Czr_SS*Czr + Iz_SS*Iz + Gz_SS*Gz + exp(-gamma)*rk_SS*Kz_SS*u;

//ADDITIONAL EXOGENOUS PROCESSES:

//technology process
z = rho_z*z(-1) + eps_z;

//Preference for Leisure
psi=rho_phi*psi(-1) + eps_phi;

//price markup shock
lambda_ms=eps_lambda;                   

//Capital adjustment cost process
mu=rho_mu*mu(-1)+eps_mu;

//intertemporal preference shifter
bu=rho_bu*bu(-1)+eps_bu;
br=rho_br*br(-1)+eps_br;

//government spending process
Gz = rho_Gz*Gz(-1) + eps_Gz;


//ADDITIONAL DEFINITIONS REQUIRED FOR PLOTTING:

    slope = rL - r;
    //EE unconstrained, under expectation hypothesis (EH)
    Xiu = r_SS/(r_SS-kappaEH)*rLEH + Xiu(+1)-z(+1)-pi(+1)-kappaEH/(r_SS-kappaEH)*rLEH(+1);
    //risk premium definition
    RP = rL - rLEH;
    rr = r - pi(+1);
    rLr = rL - pi(+1);
    rLEHr = rLEH - pi(+1);

//DEFINE ANNUAL RATES

Yz_growth        = 4*(Yz - Yz(-1));                     //annualized percentage rate
y_level          = Yz;                                //percentage deviation from trend, not annualized
pi_ann           = pi; //(pi + pi(-1) + pi(-2) + pi(-3));   //annualized percentage rate
r_ann            = 4*r;                                 //annualized percentage rate
rL_ann           = 4*rL;                                //annualized percentage rate
riskprem         = RP;                      

//REDEFINE VARIABLED FOR IRF GRAPHS

dy      = Yz_growth;
y       = Yz;
infl    = pi_ann;
FFR     = r_ann;
bondrate    = rL_ann;


end;

shocks;

//technology shock
 %       var eps_z = sigma_z^2; 
//intratemporal preference shock
 %       var eps_phi = sigma_phi^2;
//price markup shock
  %      var eps_lambda = sigma_lambda^2;
//adjustment cost shock
   %     var eps_mu = sigma_mu^2;
//intertemporal preference shock
   %     var eps_bu = sigma_b^2;
    %    var eps_br = sigma_b^2;         
//government spending shock
//   %     var eps_Gz = sigma_g^2;
//risk premium shock
      %  var eps_zeta = sigma_zeta^2;
//monetary policy shock
        var eps_m = sigma_m^2;
//fiscal tax shock
       % var eps_T = sigma_T^2;
//long-term bond supply shock
        %var eps_B = sigma_B^2;

end;



//not the correct variables to be plotted, just a try
stoch_simul(linear,  irf=24, nograph)    dy y infl FFR bondrate riskprem; 



