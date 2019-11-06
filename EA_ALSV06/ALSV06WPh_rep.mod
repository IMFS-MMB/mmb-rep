// Model replication: EA_ALSV06 Working Paper, separable preferences, CRRA specification and habits
// last edited: 08/11/2019
// Authors: Jonas Wendelborn & Sehrish Usman

// Further references: 
// Javier Andrés, J. David López-Salido and Javier Vallés 
// "Money in an estimated business cycle model of the Euro area"
// The Economic Journal, 2006, 116 (April), 457-477.
// and 
// Javier Andrés, J. David López-Salido and Javier Vallés 
// "Money in an estimated business cycle model of the Euro area"
// Working Paper 0121, Banco de España, 2001.

var y m r mu pi mc a e z ;
//output interest inflation moneygrowth;

varexo epsa epse epsz epsr;

parameters rhoa rhor rhoy rhopi rhomu 
           gammaf gammab lambda chi rhoe rhoz beta rss
           sigmaa sigmae sigmaz sigmar phi1 phi2 h sigma delta;


// model with separable preferences and habits
beta = beta_;       //0.9876;

sigma = sigma_;     //1.0573;
h = h_; //0.9025;

phi1 = ((sigma-1)*h)/(1-beta*h);
phi2 = (sigma+(sigma-1)*beta*(h^2)-beta*h)/(1-beta*h);

delta = delta_;     //108.76;
gammaf = gammaf_;   //0.9876;
gammab = gammab_;   //1-gammaf;
chi = chi_;         //0.5432;
lambda = lambda_;   //1.1939;
rhor = rhor_;       //0.5058;
rhoy = rhoy_;       //0.0555;
rhopi = rhopi_;     //1.1796;
rhomu = rhomu_;     //0.6845;
rss = rss_;         //exp(0.0224);
rhoa = rhoa_;       //0.9835;
rhoe = rhoe_;       //0.9625;
rhoz = rhoz_;       //0.9701;
sigmaa = sigmaa_;   //0.0495;
sigmae = sigmae_;   //0.0047;
sigmaz = sigmaz_;   //0.0046;
sigmar = sigmar_;   //0.0018;


model(linear);

y = (phi1/(phi1+phi2)) * y(-1) + ((beta*phi1+phi2)/(phi1+phi2)) * y(+1) - (1/(phi1+phi2)) * (r - pi(+1))
    - ((beta*phi1)/(phi1+phi2)) * y(+2) + ((1-beta*h*rhoa)/(1-beta*h))*((1-rhoa)/(phi1+phi2)) * a;   

m = -(phi1/delta) * y(-1) + (phi2/delta) * y - ((beta*phi1)/delta) * y(+1) - (1/(delta*(rss-1))) * r 
    + ((beta*h*(1-rhoa))/((1-beta*h)*delta)) * a - ((delta-1)/delta) * e;

r = rhor * r(-1) + (1-rhor)*rhoy * y + (1-rhor)*rhopi * pi + (1-rhor)*rhomu * mu + epsr;

mu = m - m(-1) + pi;

pi = gammaf * pi(+1) + gammab * pi(-1) + lambda * mc;

mc = -phi1 * y(-1) + (chi+phi2) * y - beta*phi1 * y(+1) - (1+chi) * z - ((beta*h*(1-rhoa))/(1-beta*h)) * a;

a = rhoa * a(-1) + epsa;

e = rhoe * e(-1) + epse;

z = rhoz * z(-1) - epsz;

end;


//////////////////////////////////////////////
// PARAMETERS AND MODEL FOR REPLICATION USING THE IMPLEMENTED MMB CODE,
// which corresponds to the more general version of the model in the published paper
//
// parameters of constrained model with habits (see Table 1 (3), p. 31):
//
//  beta = 0.9876;
//  psi1 = 1/1.0573;
//  psi2 = 0.0000;
//  h = 0.9025;
//
//  phi1 = ((psi1^(-1) - 1) * h) / (1 - beta * h);
//  phi2 = (psi1^(-1) + (psi1^(-1) - 1) * beta * h^2 - beta * h) / (1 - beta * h);
//
//  rss = exp(0.0224);
//  gamma1 = phi2/108.76;
//  gamma2 = 1/((rss-1)*108.76) ;
//  gammaf = 0.9876;
//  gammab = 0; //1 - gammaf;
//  chi = 0.5432;
//  lambda = 1.1939;
//  rhor = 0.5058;
//  rhoy = 0.0555;
//  rhopi = 1.1796;
//  rhomu = 0.6845;
//  rhoa = 0.9835;
//  rhoe = 0.9625;
//  rhoz = 0.9701;
//  sigmaa = 0.0495;
//  sigmae = 0.0047;
//  sigmaz = 0.0046;
//  sigmar = 0.0018;
//  
//
// MODEL
//
//  model(linear);
//
//  y = (phi1/(phi1+phi2)) * y(-1) + ((beta*phi1+phi2)/(phi1+phi2)) * y(+1) - (1/(phi1+phi2)) * (r - pi(+1))
//    - ((beta*phi1)/(phi1+phi2)) * y(+2) + (psi2/psi1)*(1/(1-beta*h))*(1/(phi1+phi2)) * (m - e)
//    - (psi2/psi1)*(1/(1-beta*h))*((1+beta*h)/(phi1+phi2)) * (m(+1) - e(+1))
//    + (psi2/psi1)*(1/(1-beta*h))*((beta*h)/(phi1+phi2)) * (m(+2) - e(+2))
//    + ((1-beta*h*rhoa)/(1-beta*h))*((1-rhoa)/(phi1+phi2)) * a;                // IS-curve, eq. (5)
//
//  m = gamma1 * y - gamma2 * r + (gamma2*(rss-1)*(h*phi2-phi1)-h*gamma1) * y(-1)
//    - (gamma2*(rss-1)*beta*phi1) * y(+1) + (psi2/psi1)*(((rss-1)*beta*h*gamma2)/(1-beta*h)) * m(+1)
//    + (((rss-1)*beta*h*(1-rhoa))/(1-beta*h))*gamma2 * a
//    - (1-((rss-1)*gamma2*((psi2/psi1)*((beta*h*rhoe)/(1-beta*h))+1))) * e;              // money demand equation, eq. (6)
//
//  r = rhor * r(-1) + (1-rhor)*rhoy * y + (1-rhor)*rhopi * pi + (1-rhor)*rhomu * mu + epsr;        // original interest rate rule, eq. (7)
//
//  mu = m - m(-1) + pi;                // money growth equation, eq. (8)
//
//  pi = gammaf * pi(+1) + gammab * pi(-1) + lambda * mc;           // Phillips-curve, eq. (9(
//
//  mc = (chi+phi2) * y - phi1 * y(-1) - beta*phi1 * y(+1) - (psi2/psi1)*(1/(1-beta*h)) * (m - e)
//    + (psi2/psi1)*(beta*h/(1-beta*h)) * (m(+1) - e(+1)) - ((beta*h*(1-rhoa))/(1-beta*h)) * a - (1+chi) * z;          // marginal costs, eq. (10)
//
//  a = rhoa * a(-1) + epsa; //AR(1) demand shock, eq. (11)
//  e = rhoe * e(-1) + epse; //AR(1) money demand shock, eq. (12)
//  z = rhoz * z(-1) - epsz; //AR(1) supply shock, eq. (13)
//
//  end;
//////////////////////////////////////////////




shocks;
var epsa; stderr 100*sigmaa;
//var epse; stderr 100*sigmae;
var epsz; stderr 100*sigmaz;
//var epsr; stderr 100*sigmar;
end;


stoch_simul(order=1, irf=20, nograph, noprint) y r pi mu;




