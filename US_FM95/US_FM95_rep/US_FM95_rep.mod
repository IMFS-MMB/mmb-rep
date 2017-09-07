// Title: Inflation Persistence
// Authors: Jeffrey C. Fuhrer and George R. Moore
// Publication: Quaterly Journal of Economics, Vol. 110 (1), Feb. 1995, pp. 127-159.
//
// and
//
// Title: Monetary Policy Trade-offs and the Correlation between Nominal Interest Rates and Real Output
// Authors: Jeffrey C. Fuhrer and George R. Moore
// Publication: American Economic Review, Vol. 85 (1), Mar. 1995, pp. 219-239.
//
//
// This version of the Fuhrer Moore model is described in // Levin, Wieland and Williams (1998). 
// "Robustness of Simple Monetary Policy Rules under Uncertainty" FEDS Working Paper, on pages 4-7 
// and in Levin, Wieland and Williams (2001). "The Performance of Forecast-Based Monetary Policy 
// Rules under Model Uncertainty", ECB Working Paper 68, on pages 36-39.
// Accordingly the parametrization is taken from: Jeffrey C. FUhrer (1997). 
// "Inflation/Output Variance Trade-Offs and Optimal Monetary Policy," Journal of Money, Credit
// and Banking, 29: 214-234.
 
// Replication of IRF to a monetary policy shock using LWW-Rule.


var p x ytilde ypsilon f infl rho

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq outputgap output;                       //*
//**************************************************************************

varexo epsilon_p epsilon_y

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_;                                                        //*
//**************************************************************************

parameters s f0 f1 f2 f3 D a0 a1 a2 arho gamma;



s    =  0.113;
gamma = 0.002; 


f0   =  0.25+(1.5-0)*s;
f1   =  0.25+(1.5-1)*s;
f2   =  0.25+(1.5-2)*s;
f3   =  0.25+(1.5-3)*s;
D    =  40; //120

a0   =  0.012;
a1   =  1.447;
a2   = -0.468;
arho = -0.335;


model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = (f+a0/arho);                                            //*
inflation  = (1/4)*(infl+ infl(-1)+ infl(-2)+ infl(-3));                 //*
inflationq = infl;                                                    //*
outputgap  = ytilde;                                                 //*
output     = ytilde;                                                 //*
//**************************************************************************

// Policy rule
interest = 0.755226*interest(-1)+0.602691*inflation+1.17616*outputgap-0.972390*outputgap(-1)+interest_;

// Original Model Code:

p       = f0 * x + f1 * x(-1) + f2 * x(-2) + f3 * x(-3); 				    
x - p   = f0 * (ypsilon  + gamma*ytilde) + f1 * (ypsilon(+1) + gamma*ytilde(+1)) + 
	  f2 * (ypsilon(+2) + gamma*ytilde(+2)) + f3 * (ypsilon(+3) + gamma*ytilde(+3)) + epsilon_p;     
ypsilon = f0 * (x-p) + f1 * (x(-1) - p(-1)) + f2 * (x(-2) - p(-2)) + f3 * (x(-3) - p(-3));  
ytilde  = a0 + a1 * ytilde(-1) + a2 * ytilde(-2) + arho * rho(-1) +epsilon_y;
rho - D*(rho(+1) -rho) = f - infl(+1);	
infl      = 4*(p-p(-1));
end;

initval;
ytilde = 0;
ypsilon = 0;
f = -a0/arho;
infl = 0;
rho = -a0/arho;
inflation = 0;
inflationq = 0;
interest = 0;
output = 0;
outputgap = 0;
end;

shocks;
var epsilon_p            =  2.78656791760000e-06;
var epsilon_p, interest_ =  0                   ;
var epsilon_p, epsilon_y   = -2.67932176090000e-06;
var interest_          =  1                   ;  // set equal to 1 for IRF
var interest_, epsilon_y =  0		      ;
var epsilon_y            =  3.63551004125000e-05;
end;


stoch_simul (irf = 17, noprint, nograph) inflationq interest outputgap;