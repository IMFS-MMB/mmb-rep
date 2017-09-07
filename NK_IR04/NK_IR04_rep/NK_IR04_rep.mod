
// Model: NK_IR04

// Further references:
// Ireland, Peter N. "Money's Role In The Monetary Business Cycle," 
// "Journal of Money, Credit and Banking, 2004, v36(6,Dec), 969-983.


// Last edited: 10/09/07 by S. Schmidt 
// Comment: Due to the real balance effect, we have to make an assumption about the evolution
// of the nominal interest rate under flexible prices in order to calculate the natural rate
// of output and hence the output gap. Following Ravenna & Walsh (2006), we impose
// an interest rate peg for the flexible price equilibrium.


var y m pi r a e z;

varexo epsa_ epse_ epsz_ interest_;

parameters  omega1 omega2 psi gamma1 gamma2 gamma3 rhor 
            rhoy rhopi rhoa rhoe rhoz sigmaa sigmae sigmaz sigmar 
            lny lnm lnpi lnr yss mss piss rss;


// parameters of constrained model
omega1 = 1;
omega2 = 0.25;
psi = 0.1;
gamma1 = 0.0158;
gamma2 = 0.1251;
gamma3 = 0.9977;
rhor = 0.5481;
rhoy = 0.0000;
rhopi = 0.5680;
rhoa = 0.9575;
rhoe = 0.9867;
rhoz = 0.9904;
sigmaa = 0.0187;
sigmae = 0.0088;
sigmaz = 0.0098;
sigmar = 0.0025;
lny = 8.8747;
lnm = 9.7383;
lnpi = 0.0100;
lnr = 0.0186;
yss = 7148.8015;
mss = 16954.6939;
piss = 1.0101;
rss = 1.0188;


model(linear);

// Original Model Code:

r = rhor*r(-1) + rhoy*y(-1) + rhopi*pi(-1) + interest_;  //original interest rate rule

a = rhoa*a(-1) + epsa_;
e = rhoe*e(-1) + epse_;
z = rhoz*z(-1) + epsz_;
y = y(+1) - omega1*(r - pi(+1)) + omega2*((m - e) - (m(+1) - e(+1))) + omega1*(a - a(+1));
m = gamma1*y - gamma2*r + gamma3*e;
pi = (piss/rss)*pi(+1) + psi*((1/omega1)*y - (omega2/omega1)*(m-e)-z);

end;


shocks;
var epsa_ = 10000*sigmaa^2;
var epse_ = 10000*sigmae^2;
var epsz_ = 10000*sigmaz^2;
var interest_ = 10000*sigmar^2;
end;


stoch_simul (irf = 16, nograph, noprint) y m pi r;