// Title: A Small Estimated Euro Area Model with Rational Expectations and Nominal Rigidities 
// Authors: Guenter Coenen and Volker Wieland
// Publication: European Economic Review, Vol. 49 (5), July 2005, pp. 1081-1104.
// Earlier versions: ECB Working Paper 30; CEPR Discussion Paper 3574

// This file simulates the dynamic response of the model to specific shocks
// This version uses relative real wage contracting model proposed by Buiter 
// and Jewitt (1981) and estimated by Furher and Morre (1995). 
// There is another version (EA_CW05ta.mod) which uses the the 
// nominal wage contracting model due to Taylor (1980).

// Replication of IRF in Kuester, Wieland (2005)
 

var q lagq1 cwp ldvindex1 ldvindex2 ldq1 ldq2 vindex lagcwp1 lagcwp2 pi1
    lagpi1 lagpi2 infl is dis il ldis1 ldis2 ldis3 ldis4 ldis5 ldis6  rl
    ldpi1 ldpi2 ldpi3 ldpi4 ldpi5 ldpi6 ldpi7

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation outputgap;                  			             //*
//**************************************************************************


varexo e_cw

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
//**************************************************************************


parameters
s f0 f1 f2 f3 gamma1 sigma_e_cw delta0 delta1 delta2 delta3 sigma_e_d;


s = 0.0742;
f0 = 0.25+(1.5-0)*s;
f1 = 0.25+(1.5-1)*s;
f2 = 0.25+(1.5-2)*s;
f3 = 0.25+(1.5-3)*s;
gamma1 = 0.0212;
delta0 =  0.0027; 
delta1 =  1.1807;
delta2 = -0.2045;
delta3 = -0.0947;

sigma_e_d  = 1.00;
sigma_e_cw = 1.00;


model(linear);

// Modelbase Variables                                                   
interest   = is;                                                         
inflation = infl; 
outputgap  = q;                                                          
                                                                         
// Policy Rule Gerdesmeier and Roffia (2003)
interest = (0.87^3)*interest(-1)+(1-0.87^3)*1.93*inflation+(1-0.87^3)*0.28*outputgap+interest_;

// Original Model Code:

q          = delta1*q(-1) + delta2*lagq1(-1) + delta3*rl(-1) + sigma_e_d*fiscal_;
lagq1      = q(-1);
cwp        = f0*vindex + f1*ldvindex1 + f2*ldvindex2 + f3*ldvindex2(+1) + gamma1*(f0*q
             + f1*ldq1 + f2*ldq2 + f3*ldq2(+1)) + sigma_e_cw*e_cw;
ldvindex1  = vindex(+1);
ldvindex2  = ldvindex1(+1);
ldq1       = q(+1);
ldq2       = ldq1(+1);
vindex     = f0*cwp + f1*lagcwp1 + f2*lagcwp2 + f3*lagcwp2(-1);
lagcwp1    = cwp(-1);
lagcwp2    = lagcwp1(-1);
pi1        =  (f0*cwp + f1*lagcwp1 + f2*lagcwp2 + f3*lagcwp2(-1) - (f2+f3)*lagpi1 - f3*lagpi2)/(f1+f2+f3);
lagpi1     = pi1(-1);
lagpi2     = lagpi1(-1);
infl        = pi1 + lagpi1 + lagpi2 + lagpi2(-1);
dis        = is - is(-1);
il         = (is + ldis1 + ldis2 + ldis3 + ldis4 + ldis5 + ldis6 + ldis6(+1))/8;
ldis1      = is(+1);
ldis2      = ldis1(+1);
ldis3      = ldis2(+1);
ldis4      = ldis3(+1);
ldis5      = ldis4(+1);
ldis6      = ldis5(+1);
rl         = il - (ldpi1 + ldpi2 + ldpi3  + ldpi4 + ldpi5 + ldpi6 + ldpi7 + ldpi7(+1))/2;
ldpi1      = pi1(+1);
ldpi2      = ldpi1(+1);
ldpi3      = ldpi2(+1);
ldpi4      = ldpi3(+1);
ldpi5      = ldpi4(+1);
ldpi6      = ldpi5(+1);
ldpi7      = ldpi6(+1);
end;

shocks;
var fiscal_ = 2.88771222057358e-05; // contract wage shock
var e_cw, fiscal_ =	-3.58636858025215e-06;
var e_cw  = 8.45144083918118e-06; // demand shock
var interest_= 1; // monetary policy shock; SET EQUAL TO ONE FOR IRF
end;


stoch_simul (irf = 41, ar=0, nograph, noprint) inflation outputgap interest;