// Title: Firm-Specific Capital, Nominal Rigidities and the Business Cycle
// Authors: David Altig, Lawrence J. Christiano, Martin Eichenbaum, Jesper Linde

// This file simulates the dynamic response of the model to specific shocks
// This code is an adoption of the code provided by L.J.Christiano on 
// http://faculty.wcas.northwestern.edu/~lchrist/research/ACEL/acelweb.htm


// Replication of IRF to one standard deviation monetary policy shock using the original money growth rule, figure 1 in Altig et. al 2005

//*****************************************************************************
// This version produces the right impulse responses to monetary policy shocks. 
// Timing: Technology shock, agents' decisions, monetary policy shock.
// --> This file produces wrong answers to technlogy shocks as variables are
// predetermined. See ACEL1tech for a appropriate version for technology shocks.

// The model nests a homoegenous and firm-specific capital model. The only difference
// is the mapping between structural parameters and gamma.
//*****************************************************************************

var c_t wtilde_t lambda_zstar_t m_t pi_t x_t s_t i_t h_t kbar_t1 q_t ytilde_t R_t mutilde_t rhotilde_t u_t
    x_M_t eps_M_t mu_z_t eps_muz_t x_z_t mu_ups_t eps_muups_t x_ups_t
    c_tlead c_tpred wtilde_tlead wtilde_tpred u_tlead u_tpred i_tlead i_tpred pi_tlead pi_tpred mutilde_tlead mutilde_tpred
    cf_t wtildef_t lambda_zstarf_t mf_t pif_t xf_t sf_t if_t hf_t kbarf_t1 qf_t ytildef_t Rf_t mutildef_t rhotildef_t uf_t
    cf_tlead cf_tpred wtildef_tlead wtildef_tpred uf_tlead uf_tpred if_tlead if_tpred pif_tlead pif_tpred mutildef_tlead mutildef_tpred
    epsilon_t // the last variable is the additional transitory neutral technology shock not considered in the original code


//**************************************************************************
// Modelbase Variables                                                   //*    
        interest inflation inflationq outputgap output mgrowth;          //*
//**************************************************************************

varexo  epsilon_M_ eps_muz_ eps_muups_ epsilon_t_  // the last shock is the transitory technology shock, not in the original code

//**************************************************************************
// Modelbase Shocks                                                      //*       
        interest_ fiscal_;                                               //*
//**************************************************************************

parameters alpha b beta delta eps eta lambda_f lambda_w mu_ups mu_z nu psi_L 
           sigma_L x xi_w V kappa sigma_a gamma squig vaartheta rho_M theta_M
           rho_muz theta_muz c_z cp_z rho_xz rho_muups theta_muups c_ups
           cp_ups rho_xups
           mu_zstar rhotilde infl R eta_pr s R_nu wtilde h_kbar kbar h c q 
           m ytilde phi sig_eta i
           lambda_zstar
           blewy b_w ETA1 ETA2 ETA3 ETA4 ETA5 ETA6 ETA7 ETA8 ETA9 ETA10
           bf_w xif_w ETA1f ETA2f ETA3f ETA4f ETA5f ETA6f ETA7f ETA8f ETA9f ETA10f xif_p rho_epsilon;

//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
//        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
//        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
//        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
//        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
//        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
//        std_r_ std_r_quart;                                              //*
                                                                         //*
                                                                         //*
// load Modelbase Monetary Policy Parameters                             //*
//	thispath = cd;                                                       //*
//	cd('..');                                                            //*
//	load policy_param.mat;                                               //*
//	cd(thispath);                                                        //*
                                                                         //*
//**************************************************************************

rho_epsilon =   0.9767 ;     // coefficient for the transitory technology shock, not in the original code
alpha       =   0.3600 ;
b           =   0.7048 ;
beta        =   0.9926 ;
delta       =   0.0250 ;
epsilon     =   0.8004 ;
eta         =   0.0360 ;
lambda_f    =   1.0100 ;
lambda_w    =   1.0500 ;
mu_ups      =   1.0042 ;
mu_z        =   1.0001 ;
nu          =   1.0000 ;
psi_L       =   1.0000 ;
sigma_L     =   1.0000 ;
x           =   1.0170 ;
xi_w        =   0.7234 ;
xif_w       =   0      ;  //wage calvo parameter is zero in flexible price allocation
xif_p       =   0.0001 ;  //price calvo parameter is zero in flexible price allocation; 0.0001 avoids indeterminacy
V           =   0.4500 ;

kappa       =   3.2756 ;
sigma_a     =   2.0183 ;
gamma       =   0.0401 ;  //homogeneous capital model
squig       =   1.0000 ;
vaartheta    =   0.0000 ;

rho_M       =   -0.0335 ;
theta_M     =   0.0000 ;
rho_muz     =   0.9041 ;
theta_muz   =   0.0000 ;
c_z         =   2.9973 ;
cp_z        =   1.4211 ;
rho_xz      =   0.3276 ;
rho_muups   =   0.2414 ;
theta_muups =   0.0000 ;
c_ups       =   0.2461 ;
cp_ups      =   0.1342 ;
rho_xups    =   0.8217 ;

// steady state
mu_zstar    =   mu_ups^(alpha/(1-alpha))*mu_z;
rhotilde    =   mu_ups*mu_zstar/beta-(1-delta);
infl        =   x/mu_zstar;
R           =   infl*mu_zstar/beta;
eta_pr      =   (R-1)/V^2;
sig_eta     =   1/((R-1)*4*epsilon)-2;
s           =   1/lambda_f;
R_nu        =   nu*R+1-nu;
wtilde      =   ((1-alpha)/R_nu)*s*(rhotilde/(alpha*s))^(alpha/(alpha-1));
h_kbar      =   (rhotilde/(alpha*s*(mu_zstar*mu_ups)^(1-alpha)))^(1/(1-alpha));
kbar        =   ( ( (1+eta)*wtilde/(psi_L*(h_kbar^sigma_L)) ) * (mu_zstar-b*beta)/(lambda_w*(mu_zstar-b)*(1+eta+eta_pr*V))/((1/lambda_f)*(1/((mu_zstar*mu_ups))^alpha)*(h_kbar^(1-alpha))-(1-(1-delta)/(mu_ups*mu_zstar))))^(1/(1+sigma_L));
h           =   h_kbar*kbar;
c           =   kbar^(-sigma_L)*wtilde/(psi_L*h_kbar^sigma_L)*(mu_zstar-beta*b)/(lambda_w*(mu_zstar-b)*(1+eta+eta_pr*V));
q           =   c/V;
m           =   (nu*wtilde*h+q)/x;
ytilde      =   rhotilde*kbar/(mu_ups*mu_zstar)+wtilde*R_nu*h;
phi         =   ytilde*(lambda_f-1);

i           =   (1-(1-delta)/(mu_ups*mu_zstar))*kbar;
lambda_zstar =   (mu_zstar-b*beta)/(mu_zstar*c-b*c)/(1+eta+eta_pr*V);
// mutilde      =   rhotilde/(mu_ups*mu_zstar/beta-(1-delta));

blewy=0; //if 0, then index wage to steady state productivity growth
b_w     =   (lambda_w*sigma_L-(1-lambda_w))/((1-xi_w)*(1-beta*xi_w));
bf_w     =   (lambda_w*sigma_L-(1-lambda_w))/((1-xif_w)*(1-beta*xif_w));

// coefficients in the wage equation
ETA1  =   b_w*xi_w; //eta0
ETA2  =   -b_w*(1+beta*xi_w^2)+sigma_L*lambda_w; //eta1
ETA3  =   beta*xi_w*b_w; //eta2
ETA4  =   b_w*xi_w; //eta3-bar
ETA5  =   -xi_w*b_w*(1+beta); //eta3   
ETA6  =   b_w*beta*xi_w; //eta4
ETA7  =   -sigma_L*(1-lambda_w); //eta5
ETA8  =   1-lambda_w; //eta6
ETA9  =   -b_w*xi_w*(1-blewy); //eta7
ETA10  =  beta*b_w*xi_w*(1-blewy); //eta8

// coefficients in the wage equation (flex price version)
ETA1f  =   bf_w*xif_w; //eta0
ETA2f  =   -bf_w*(1+beta*xif_w^2)+sigma_L*lambda_w; //eta1
ETA3f  =   beta*xif_w*bf_w; //eta2
ETA4f  =   bf_w*xif_w; //eta3-bar
ETA5f  =   -xif_w*bf_w*(1+beta); //eta3   
ETA6f  =   bf_w*beta*xif_w; //eta4
ETA7f  =   -sigma_L*(1-lambda_w); //eta5
ETA8f  =   1-lambda_w; //eta6
ETA9f  =   -bf_w*xif_w*(1-blewy); //eta7
ETA10f  =  beta*bf_w*xif_w*(1-blewy); //eta8


model(linear);
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*R_t;      
inflation  = pi_tpred + pi_tpred(-1) + pi_tpred(-2) + pi_tpred(-3);      //*
inflationq = pi_tpred*4;                                                 //*
outputgap  = ytilde_t-ytildef_t;                                         //*
output     = ytilde_t;                                                   //*
//**************************************************************************

// Additional variable definitions needed for replication:

mgrowth = 4*x_t;


//**************************************************************************                                                                    
// Policy Rule                                                           //*

//interest =   cofintintb1*interest(-1)                                    //* 
//           + cofintintb2*interest(-2)                                    //* 
//           + cofintintb3*interest(-3)                                    //* 
//           + cofintintb4*interest(-4)                                    //* 
//           + cofintinf0*inflationq                                       //* 
//           + cofintinfb1*inflationq(-1)                                  //* 
//           + cofintinfb2*inflationq(-2)                                  //* 
//           + cofintinfb3*inflationq(-3)                                  //* 
//           + cofintinfb4*inflationq(-4)                                  //* 
//           + cofintinff1*inflationq(+1)                                  //* 
//           + cofintinff2*inflationq(+2)                                  //* 
//           + cofintinff3*inflationq(+3)                                  //* 
//           + cofintinff4*inflationq(+4)                                  //* 
//           + cofintout*outputgap 	                                     //* 
//           + cofintoutb1*outputgap(-1)                                   //* 
//           + cofintoutb2*outputgap(-2)                                   //* 
//           + cofintoutb3*outputgap(-3)                                   //* 
//           + cofintoutb4*outputgap(-4)                                   //* 
//           + cofintoutf1*outputgap(+1)                                   //* 
//           + cofintoutf2*outputgap(+2)                                   //* 
//           + cofintoutf3*outputgap(+3)                                   //* 
//           + cofintoutf4*outputgap(+4)                                   //* 
//           + std_r_ *interest_;                                          //* 
//**************************************************************************


// Original Model Code:


// STICKY PRICE MODEL ///////////////////////////
// THE FIRM SECTOR
//Capital Euler Equation: eq. (1) in technical appendix
lambda_zstar_t(+1) + (1-delta)/(rhotilde+1-delta) * mutilde_t(+1) + rhotilde/(rhotilde+1-delta)*rhotilde_t(+1) 
- lambda_zstar_t - mutilde_t 
= mu_z_t(+1) + 1/(1-alpha)*mu_ups_t(+1);
  
//Investment Euler Equation: eq. (2) in technical appendix
-beta*kappa*(mu_zstar*mu_ups)^2 * i_t(+1) - mutilde_tpred 
+ kappa*(mu_zstar*mu_ups)^2*(1+beta) * i_t 
- kappa*(mu_zstar*mu_ups)^2 * i_tpred(-1) 
= beta*kappa*(mu_zstar*mu_ups)^2 * mu_z_t(+1) + beta*kappa*(mu_zstar*mu_ups)^2/(1-alpha) * mu_ups_t(+1) 
- kappa*(mu_zstar*mu_ups)^2 * mu_z_t -  kappa*(mu_zstar*mu_ups)^2/(1-alpha) * mu_ups_t;

//Shadow rental rate on capital: eq. (3) in technical appendix
wtilde_tpred + 1/(1-alpha)*ytilde/(ytilde+phi)*ytilde_t + nu*R/(nu*R+1-nu) * R_t - rhotilde_t - 1/(1-alpha) * u_tpred 
-1/(1-alpha) * kbar_t1(-1) = - 1/(1-alpha) * mu_z_t - 1/(1-alpha)^2 * mu_ups_t + 1/(1-alpha) * epsilon_t;

//Capital evolution: eq. (4) in technical appendix
(mu_zstar*mu_ups-(1-delta)) * i_tpred - mu_ups*mu_zstar * kbar_t1 
+ (1-delta) * kbar_t1(-1)
= (1-delta) * mu_z_t + (1-delta)/(1-alpha) * mu_ups_t;

//Inflation equation: eq. (5) in technical appendix
beta * pi_t(+1) 
- (1+beta*squig) * pi_t + gamma*s_t 
= - squig * pi_tpred(-1);

//Marginal Cost Equation: eq. (6) in technical appendix
wtilde_tpred - s_t + alpha/(1-alpha)*ytilde/(ytilde+phi)*ytilde_t + nu*R/(nu*R+1-nu) * R_t - alpha/(1-alpha) * u_tpred 
- alpha/(1-alpha) * kbar_t1(-1) 
= - alpha/(1-alpha) * mu_z_t - alpha/(1-alpha)^2 * mu_ups_t + 1/(1-alpha)*epsilon_t;

// THE HOUSEHOLD SECTOR
// Money demand: eq. (7) in technical appendix
c_tpred - q_t = R/(R-1)/(2+sig_eta) * R_t;

//Consumption Euler Equation: eq. (8) in technical appendix
- beta*b*(1/(mu_zstar*c-b*c))^2*mu_zstar*c * c_t(+1) 
+ (1/(c*(1-b/mu_zstar))^2*c+beta*b*(1/(mu_zstar*c-b*c))^2*b*c+lambda_zstar*(2+sig_eta)*eta_pr*V) * c_t + (lambda_zstar*(1+eta+eta_pr*V))* lambda_zstar_t
- lambda_zstar*(2+sig_eta)*eta_pr*V * q_t 
- 1/(c*(1-b/mu_zstar))^2*b*c/mu_zstar * c_tpred(-1)
= beta*b*(1/(mu_zstar*c-b*c))^2*mu_zstar*c * mu_z_t(+1) + beta*b*(1/(mu_zstar*c-b*c))^2*mu_zstar*c*alpha/(1-alpha) * mu_ups_t(+1)  
- 1/(c*(1-b/mu_zstar))^2*b*c/mu_zstar * mu_z_t - 1/(c*(1-b/mu_zstar))^2*b*c/mu_zstar*alpha/(1-alpha) * mu_ups_t;

//Monetary Base First Order Condition: eq. (9) in technical appendix
lambda_zstar_t(+1) - pi_t(+1) + R_t(+1)
- lambda_zstar_t = mu_z_t(+1) + alpha/(1-alpha) * mu_ups_t(+1);

// Wage First Order Condition: eq. (10) in technical appendix
ETA3 * wtilde_t(+1) +  ETA6 * pi_t(+1) 
+ ETA2 * wtilde_t + ETA5 * pi_tpred + ETA7 * h_t + ETA8 * lambda_zstar_t 
+ ETA1 * wtilde_tpred(-1) + ETA4 * pi_tpred(-1) 
= - ETA10*alpha/(1-alpha) * mu_ups_t(+1) - ETA10 * mu_z_t(+1)
 - ETA9*alpha/(1-alpha) * mu_ups_t - ETA9 * mu_z_t;

// Resource Constraint: eq. (11) in technical appendix
((1+eta)*c+eta_pr*c^2/q) * c_tpred +  (1-(1-delta)/(mu_ups*mu_zstar))*kbar * i_tpred -(ytilde+phi)*(1-alpha) * h_t - eta_pr*c^2/q * q_t 
+ (rhotilde*kbar/(mu_zstar*mu_ups)-(ytilde+phi)*alpha) * u_tpred 
- (ytilde+phi)*alpha * kbar_t1(-1) 
+ (ytilde+phi)*alpha * mu_z_t + (ytilde+phi)*alpha/(1-alpha) * mu_ups_t -(ytilde+phi) * epsilon_t  + fiscal_ = 0;

// Money market clearing condition: eq. (12) in technical appendix
wtilde_tpred - x*m/(x*m-q) * m_t +  h_t + q/(x*m-q) * q_t = x*m/(x*m-q) * x_t;

// Monetary Policy: eq. (13) in technical appendix
x_t =  x_M_t + x_z_t + x_ups_t;   

// Linking base growth to the base: eq. (14) in technical appendix
-  m_t  - pi_tpred 
+  m_t(-1) + x_t(-1) 
=  mu_z_t  + alpha/(1-alpha)* mu_ups_t;

// Production Function: eq. (15) in technical appendix
(ytilde+phi)*(1-alpha) * h_t - ytilde * ytilde_t + ((ytilde+phi)*alpha-rhotilde*kbar/(mu_zstar*mu_ups)) * u_tpred 
+ (ytilde+phi)*alpha * kbar_t1(-1)
= (ytilde+phi)*alpha * mu_z_t + (ytilde+phi)*alpha/(1-alpha) * mu_ups_t- (ytilde+phi)*epsilon_t;

// Capital Utilization: eq. (16) in technical appendix
1/sigma_a * rhotilde_t = u_t;

c_tlead = c_t(+1);
c_tpred = c_tlead(-1);
wtilde_tlead = wtilde_t(+1);
wtilde_tpred = wtilde_tlead(-1);
u_tlead = u_t(+1);
u_tpred = u_tlead(-1);
i_tlead = i_t(+1);
i_tpred = i_tlead(-1);
pi_tlead = pi_t(+1);
pi_tpred = pi_tlead(-1);
mutilde_tlead = mutilde_t(+1);
mutilde_tpred = mutilde_tlead(-1);


// FLEXIBLE PRICE MODEL ///////////////////////////
// THE FIRM SECTOR
//Capital Euler Equation: eq. (1) in technical appendix
lambda_zstarf_t(+1) + (1-delta)/(rhotilde+1-delta) * mutildef_t(+1) + rhotilde/(rhotilde+1-delta)*rhotildef_t(+1) 
- lambda_zstarf_t - mutildef_t 
= mu_z_t(+1) + 1/(1-alpha)*mu_ups_t(+1);
  
//Investment Euler Equation: eq. (2) in technical appendix
-beta*kappa*(mu_zstar*mu_ups)^2 * if_t(+1) - mutildef_tpred 
+ kappa*(mu_zstar*mu_ups)^2*(1+beta) * if_t 
- kappa*(mu_zstar*mu_ups)^2 * if_tpred(-1) 
= beta*kappa*(mu_zstar*mu_ups)^2 * mu_z_t(+1) + beta*kappa*(mu_zstar*mu_ups)^2/(1-alpha) * mu_ups_t(+1) 
- kappa*(mu_zstar*mu_ups)^2 * mu_z_t -  kappa*(mu_zstar*mu_ups)^2/(1-alpha) * mu_ups_t;

//Shadow rental rate on capital: eq. (3) in technical appendix
wtildef_tpred + 1/(1-alpha)*ytilde/(ytilde+phi)*ytildef_t + nu*R/(nu*R+1-nu) * Rf_t - rhotildef_t - 1/(1-alpha) * uf_tpred 
-1/(1-alpha) * kbarf_t1(-1) = - 1/(1-alpha) * mu_z_t - 1/(1-alpha)^2 * mu_ups_t + 1/(1-alpha) * epsilon_t;

//Capital evolution: eq. (4) in technical appendix
(mu_zstar*mu_ups-(1-delta)) * if_tpred - mu_ups*mu_zstar * kbarf_t1 
+ (1-delta) * kbarf_t1(-1)
=  (1-delta) * mu_z_t + (1-delta)/(1-alpha) * mu_ups_t;

//Inflation equation: eq. (5) in technical appendix
//sf_t = 0;  //not solvable with this exact version
beta * pif_t(+1) 
- (1+beta*squig) * pif_t + (1-xif_p)*(1-beta*xif_p)/xif_p *sf_t 
= - squig * pif_tpred(-1);

//Marginal Cost Equation: eq. (6) in technical appendix
wtildef_tpred - sf_t + alpha/(1-alpha)*ytilde/(ytilde+phi)*ytildef_t + nu*R/(nu*R+1-nu) * Rf_t - alpha/(1-alpha) * uf_tpred 
- alpha/(1-alpha) * kbarf_t1(-1) 
= - alpha/(1-alpha) * mu_z_t - alpha/(1-alpha)^2 * mu_ups_t + 1/(1-alpha)*epsilon_t;

// THE HOUSEHOLD SECTOR
// Money demand: eq. (7) in technical appendix
cf_tpred - qf_t = R/(R-1)/(2+sig_eta) * Rf_t;

//Consumption Euler Equation: eq. (8) in technical appendix
- beta*b*(1/(mu_zstar*c-b*c))^2*mu_zstar*c * cf_t(+1) 
+ (1/(c*(1-b/mu_zstar))^2*c+beta*b*(1/(mu_zstar*c-b*c))^2*b*c+lambda_zstar*(2+sig_eta)*eta_pr*V) * cf_t + (lambda_zstar*(1+eta+eta_pr*V))* lambda_zstarf_t
- lambda_zstar*(2+sig_eta)*eta_pr*V * qf_t 
- 1/(c*(1-b/mu_zstar))^2*b*c/mu_zstar * cf_tpred(-1)
= beta*b*(1/(mu_zstar*c-b*c))^2*mu_zstar*c * mu_z_t(+1) + beta*b*(1/(mu_zstar*c-b*c))^2*mu_zstar*c*alpha/(1-alpha) * mu_ups_t(+1)  
- 1/(c*(1-b/mu_zstar))^2*b*c/mu_zstar * mu_z_t - 1/(c*(1-b/mu_zstar))^2*b*c/mu_zstar*alpha/(1-alpha) * mu_ups_t;

//Monetary Base First Order Condition: eq. (9) in technical appendix
lambda_zstarf_t(+1) - pif_t(+1) + Rf_t(+1)
- lambda_zstarf_t = mu_z_t(+1) + alpha/(1-alpha) * mu_ups_t(+1);

// Wage First Order Condition: eq. (10) in technical appendix
ETA3f * wtildef_t(+1) +  ETA6f * pif_t(+1) 
+ ETA2f * wtildef_t + ETA5f * pif_tpred + ETA7f * hf_t + ETA8f * lambda_zstarf_t 
+ ETA1f * wtildef_tpred(-1) + ETA4f * pif_tpred(-1) 
= - ETA10f*alpha/(1-alpha) * mu_ups_t(+1) - ETA10f * mu_z_t(+1)
 - ETA9f*alpha/(1-alpha) * mu_ups_t - ETA9f * mu_z_t;

// Resource Constraint: eq. (11) in technical appendix
((1+eta)*c+eta_pr*c^2/q) * cf_tpred +  (1-(1-delta)/(mu_ups*mu_zstar))*kbar * if_tpred -(ytilde+phi)*(1-alpha) * hf_t - eta_pr*c^2/q * qf_t 
+ (rhotilde*kbar/(mu_zstar*mu_ups)-(ytilde+phi)*alpha) * uf_tpred 
- (ytilde+phi)*alpha * kbarf_t1(-1)  
+ (ytilde+phi)*alpha * mu_z_t + (ytilde+phi)*alpha/(1-alpha) * mu_ups_t -(ytilde+phi) * epsilon_t + fiscal_ = 0;

// Money market clearing condition: eq. (12) in technical appendix
wtildef_tpred - x*m/(x*m-q) * mf_t +  hf_t + q/(x*m-q) * qf_t = x*m/(x*m-q) * xf_t;

// Monetary Policy: eq. (13) in technical appendix
xf_t =  0;// x_M_t + 0*x_z_t + 0*x_ups_t;  //We assume a constant money growth rate for the flex price equilibrium


// Linking base growth to the base: eq. (14) in technical appendix
-  mf_t  - pif_tpred  
+  mf_t(-1) + xf_t(-1) 
=  mu_z_t  + alpha/(1-alpha)* mu_ups_t;

// Production Function: eq. (15) in technical appendix
(ytilde+phi)*(1-alpha) * hf_t - ytilde * ytildef_t + ((ytilde+phi)*alpha-rhotilde*kbar/(mu_zstar*mu_ups)) * uf_tpred 
+ (ytilde+phi)*alpha * kbarf_t1(-1)
=  (ytilde+phi)*alpha * mu_z_t + (ytilde+phi)*alpha/(1-alpha) * mu_ups_t- (ytilde+phi)*epsilon_t;

// Capital Utilization: eq. (16) in technical appendix
1/sigma_a * rhotildef_t = uf_t;

cf_tlead = cf_t(+1);
cf_tpred = cf_tlead(-1);
wtildef_tlead = wtildef_t(+1);
wtildef_tpred = wtildef_tlead(-1);
uf_tlead = uf_t(+1);
uf_tpred = uf_tlead(-1);
if_tlead = if_t(+1);
if_tpred = if_tlead(-1);
pif_tlead = pif_t(+1);
pif_tpred = pif_tlead(-1);
mutildef_tlead = mutildef_t(+1);
mutildef_tpred = mutildef_tlead(-1);




// Shock processes:
x_M_t       = rho_M * x_M_t(-1) + theta_M* eps_M_t(-1) + epsilon_M_;
eps_M_t     = epsilon_M_;
mu_z_t      = rho_muz * mu_z_t(-1) + theta_muz * eps_muz_t(-1) + eps_muz_;
eps_muz_t   = eps_muz_;
x_z_t       = cp_z * eps_muz_t(-1) + rho_xz * x_z_t(-1) + c_z * eps_muz_;
mu_ups_t    = rho_muups * mu_ups_t(-1) + theta_muups * eps_muups_t(-1) + eps_muups_;
eps_muups_t = eps_muups_;
x_ups_t     = cp_ups * eps_muups_t(-1) + rho_xups *x_ups_t(-1) +  c_ups * eps_muups_;
epsilon_t   = rho_epsilon * epsilon_t(-1) + 0.5187*epsilon_t_;
end;


//steady;
//check;
   
shocks;
var epsilon_M_;
stderr .3285; // sig_M
var eps_muz_;  
stderr .0673; // sig_muz
var eps_muups_; 
stderr .3027; //sig_muups
end;

stoch_simul(irf = 20, noprint, nograph) mgrowth interest ytilde_t inflationq h_t i_t c_tpred wtilde_tpred; 