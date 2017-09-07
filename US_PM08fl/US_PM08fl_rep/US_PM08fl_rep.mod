//Replication file US_PM08fl_rep.mod

// Model: US_PM08fl stationary version (with financial-real linkages)

// Further references:
// Carabenciov, Ioan, Igor Ermolaev, Charles Freedman, Michel Juillard, 
// Ondra Kamenik, Dmitry Korshunov, and Douglas Laxton (2008).
// “A Small Quarterly Projection Model of the US Economy” 
// IMF Working Paper 08/278.

// Last edited: March 16, 2010 by E. Afanasyeva

var RR_USh RR_US_BARh
    UNR_US_GAP 
    PIE_USh PIE_US4h Y_US RS_USh  
    E4_PIE_US4h E1_Y_USh E1_PIE_USh 
    E E2 
    //eg
    ;
 
varexo RES_RR_US_BAR RES_UNR_US_GAP 
        RES_Y_US  RES_PIE_US      
        RES_BLT_US RES_RS_US
        ;
  
parameters rho_us rr_us_bar_ss alpha_us1 alpha_us2
           tau_us growth_us_ss beta_us1 beta_us2 beta_us3 lambda_us1 
           lambda_us2 gamma_us1 gamma_us2 gamma_us4 pietar_us_ss alpha_us3
           kappa_us theta 
           ;

// estimated and fixed parameters, set at mode value (table 4, p. 38)
alpha_us1    = 0.8710;
alpha_us2    = 0.1688;
alpha_us3    = 0.5175;
rho_us       = 0.9240;
rr_us_bar_ss = 1.8121;
tau_us      = 0.0813;
growth_us_ss= 2.6227;
beta_us1    = 0.6840;
beta_us2    = 0.0495;
beta_us3    = 0.1360;
lambda_us1  = 0.7091;
lambda_us2  = 0.2224;
gamma_us1   = 0.7762;
gamma_us2   = 1.2993;
gamma_us4   = 0.2102;
pietar_us_ss= 2.5;
kappa_us    = 19.9943;
theta       = 1.2824;


model(linear); // original model has been stationarized

// Model Code (stationarized):
UNR_US_GAP = alpha_us1*UNR_US_GAP(-1) + alpha_us2*Y_US + RES_UNR_US_GAP;

Y_US = beta_us1*Y_US(-1) + beta_us2*Y_US(+1) - beta_us3*(RR_USh(-1) - RR_US_BARh(-1)) - 
theta*(0.04*(E(-1)+E(-9))+0.08*(E(-2)+E(-8))+0.12*(E(-3)+E(-7))+0.16*(E(-4)+E(-6))+0.2*E(-5)) + RES_Y_US; 

E = RES_BLT_US;

PIE_USh = lambda_us1*PIE_US4h(+4) + (1-lambda_us1)*PIE_US4h(-1) + lambda_us2*Y_US(-1) - RES_PIE_US;

RR_USh = RS_USh - PIE_USh(+1);

RR_US_BARh =(1-rho_us)*RR_US_BARh(-1) + RES_RR_US_BAR;

PIE_US4h = (PIE_USh + PIE_USh(-1) + PIE_USh(-2) + PIE_USh(-3))/4;

// reporting expectations

E4_PIE_US4h = PIE_US4h(+4);
E1_PIE_USh = PIE_USh(+1);
E1_Y_USh = Y_US(+1);
E2 = theta*(0.04*(E(-1)+E(-9))+0.08*(E(-2)+E(-8))+0.12*(E(-3)+E(-7))+0.16*(E(-4)+E(-6))+0.2*E(-5));

//MP rule

RS_USh = gamma_us1*RS_USh(-1) + (1-gamma_us1)*(RR_US_BARh + PIE_US4h(+3) + 
gamma_us2*(PIE_US4h(+3)-pietar_us_ss) + gamma_us4*Y_US) + RES_RS_US;

end;

steady;
check;

shocks; 
var RES_RR_US_BAR; stderr 0.0934;  // replaced with estimated values (table 5, p. 39)
var RES_UNR_US_GAP; stderr 0.0989;
var RES_Y_US; stderr 0.3490;
var RES_PIE_US; stderr 1.2353; 
var RES_BLT_US; stderr 0.8082;
var RES_RS_US; stderr 0.4712;
end;


stoch_simul(irf=40, nograph, noprint) Y_US PIE_US4h RS_USh ; 
