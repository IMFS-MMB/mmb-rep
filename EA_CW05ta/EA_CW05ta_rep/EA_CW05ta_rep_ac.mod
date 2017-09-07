// Title: A Small Estimated Euro Area Model with Rational Expectations and Nominal Rigidities 
// Authors: Guenter Coenen and Volker Wieland
// Publication: European Economic Review, Vol. 49 (5), July 2005, pp. 1081-1104.
// Earlier versions: ECB Working Paper 30; CEPR Discussion Paper 3574

// This file simulates the dynamic response of the model to specific shocks
// This version uses the nominal wage contracting model due to Taylor (1980)
// There is another version (CoenenWieland_FuhrerMoore.mod) which uses the 
// relative real wage contracting model proposed by Buiter and Jewitt (1981) 
// and estimated by Furher and Moore (1995)

// Replication of ACFs in Kuester, Wieland (2005).

var q lagq1 cwp lagcwp1 lagcwp2 pi1 lagpi11 lagpi12 infl is lagis1 dis il rl 

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation outputgap;                         	         //*
//**************************************************************************


varexo e_cw

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
//**************************************************************************


parameters s f0 f1 f2 f3 gamma1 sigma_e_cw delta0 delta1 delta2 delta3 sigma_e_d sigma_e_cw;

s = 0.0456;
f0 = 0.25+(1.5-0)*s;
f1 = 0.25+(1.5-1)*s;
f2 = 0.25+(1.5-2)*s;
f3 = 0.25+(1.5-3)*s;
gamma1 = 0.0115;
delta0 =  0.0027; 
delta1 =  1.1807;
delta2 = -0.2045;
delta3 = -0.0947;
sigma_e_d  = 1.00;
sigma_e_cw = 1.00;


model(linear);

//**************************************************************************
// Modelbase Variables                                                   //*
interest   = is;                                                         //*
inflation  = infl;                                                        //*
outputgap  = q;                                                          //*	
//**************************************************************************

// Policy Rule Gerdesmeier and Roffia (2003)
interest = (0.87^3)*interest(-1)+(1-0.87^3)*1.93*inflation+(1-0.87^3)*0.28*outputgap+interest_;

// Original Model Code:

q         = delta1*q(-1) + delta2*lagq1(-1) + delta3*rl(-1) + sigma_e_d*fiscal_;
lagq1     = q(-1);
cwp       = (f1+f2+f3)*pi1(+1) + (f2+f3)*pi1(+2) + f3*pi1(+3) + gamma1*(f0*q + f1*q(+1) + f2*q(+2) + f3*q(+3)) + sigma_e_cw*e_cw;
lagcwp1   = cwp(-1);
lagcwp2   = lagcwp1(-1);
pi1       = (f0*cwp + f1*cwp(-1) + f2*lagcwp1(-1) + f3*lagcwp2(-1) - (f2+f3)*pi1(-1) - f3*lagpi11(-1))/(f1+f2+f3);
lagpi11   = pi1(-1);
lagpi12   = lagpi11(-1);
infl       = pi1 + pi1(-1) + lagpi11(-1) + lagpi12(-1);
lagis1    = is(-1);
dis       = is - is(-1);
il        = (is + is(+1) + is(+2) + is(+3) + is(+4) + is(+5) + is(+6) + is(+7))/8;
rl        = il - (pi1(+8) + pi1(+7) + pi1(+6) + pi1(+5) + pi1(+4) + pi1(+3) + pi1(+2) + pi1(+1))/2;
end;

shocks;
var fiscal_ = 2.94329732052579e-05;  	// contract wage shock
var e_cw, fiscal_ = -6.44793273694892e-06;
var e_cw = 2.36391556785721e-05; 	// demand shock
var interest_ = 0; 
end;

stoch_simul (irf = 0, ar=16) inflation outputgap interest dis;