// Model replication: EA_ALSV06 Working Paper, separable preferences and no habits

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

varexo epsa epse epsz epsr;

parameters psi1 psi2  rhoa gamma1 gamma2 gamma3 rhor rhoy rhopi rhomu 
           gammaf gammab lambda chi rhoe rhoz beta 
           sigmaa sigmae sigmaz sigmar;




// model with separable preferences and no habits
beta = beta_;       //0.9878;
psi1 = psi1_;       //0.9931;
psi2 = psi2_;       //0.0000;
gamma1 = gamma1_;   //0.0083;
gamma2 = gamma2_;   //0.3130;
gamma3 = gamma3_;   //0.8323;
gammaf = gammaf_;   //0.6685;
gammab = gammab_;   //1-gammaf;
chi = chi_;         //10.6670;
lambda = lambda_;   //0.2505;
rhor = rhor_;       //0.2523;
rhoy = rhoy_;       //0.0000;
rhopi = rhopi_;     //1.0487;
rhomu = rhomu_;     //0.5491;
rhoa = rhoa_;       //0.9906;
rhoe = rhoe_;       //0.9638;
rhoz = rhoz_;       //0.9977;
sigmaa = sigmaa_;   //0.0558;
sigmae = sigmae_;   //0.0046;
sigmaz = sigmaz_;   //0.0052;
sigmar = sigmar_;   //0.0023;


model(linear);

y = y(+1) - psi1 * (r - pi(+1)) + psi2 * ((m - e) - (m(+1) -e(+1))) + psi1*(1-rhoa) * a;

m = gamma1 * y - gamma2 * r + gamma3 * e;

r = rhor * r(-1) + (1-rhor)*rhoy * y + (1-rhor)*rhopi * pi + (1-rhor)*rhomu * mu + epsr;

mu = m - m(-1) + pi;

pi = gammaf * pi(+1) + gammab * pi(-1) + lambda * mc;

mc = (chi+(1/psi1)) * y - (psi2/psi1) * (m - e) - chi * z; // from the published paper we have that actually (chi+1) * z is correct

a = rhoa * a(-1) + epsa;

e = rhoe * e(-1) + epse;

z = rhoz * z(-1) - epsz;

end;


//////////////////////////////////////////////
// PARAMETERS AND MODEL FOR REPLICATION USING THE IMPLEMENTED MMB CODE,
// which corresponds to the more general version of the model in the published paper
//
//
// parameters psi1 psi2  rhoa gamma1 gamma2 gamma3 rhor rhoy rhopi rhomu 
//           gammaf gammab lambda chi rhoe rhoz beta 
//           sigmaa sigmae sigmaz sigmar rss;
//
// parameters of constrained model without habits (see Table 1 (2), p. 31):
//
//  beta = 0.9878;
//  psi1 = 0.9931;
//  psi2 = 0.0000;
//  h = 0.000;
//
//  phi1 = ((psi1^(-1) - 1) * h) / (1 - beta * h);
//  phi2 = (psi1^(-1) + (psi1^(-1) - 1) * beta * h^2 - beta * h) / (1 - beta * h);
//
//  gamma1 = 0.0083;
//  gamma2 = 0.3130;
//  gammaf = 0.6685;
//  gammab = 0; //1 - gammaf;
//  chi = 10.667;
//  lambda = 0.2505; 
//  rhor = 0.2523;
//  rhoy = 0.000;
//  rhopi = 1.0487;
//  rhomu = 0.5491;
//  rhoa = 0.9906;
//  rhoe = 0.9638;
//  rhoz = 0.9977;
//  sigmaa = 0.0558;
//  sigmae = 0.0046;
//  sigmaz = 0.0052;
//  sigmar = 0.0023;
//  rss= exp(0.4290); // adjusted such that 1-((rss-1)*gamma2=gamma3=0.8323 as defined in the WP //exp(0.0219);
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
//    - (((rss-1)*beta*h*(1-rhoa))/(1-beta*h))*gamma2 * a
//    + (1-((rss-1)*gamma2*((psi2/psi1)*((beta*h*rhoe)/(1-beta*h))+1))) * e;              // money demand equation, eq. (6)
//
//  r = rhor * r(-1) + (1-rhor)*rhoy * y + (1-rhor)*rhopi * pi + (1-rhor)*rhomu * mu + epsr;        // original interest rate rule, eq. (7)
//
//  mu = m - m(-1) + pi;                // money growth equation, eq. (8)
//
//  pi = gammaf * pi(+1) + gammab * pi(-1) + lambda * mc;           // Phillips-curve, eq. (9(
//
//  mc = (chi+phi2) * y - phi1 * y(-1) - beta*phi1 * y(+1) - (psi2/psi1)*(1/(1-beta*h)) * (m - e)
//    + (psi2/psi1)*(beta*h/(1-beta*h)) * (m(+1) - e(+1)) - (beta*h*(1-rhoa)/(1-beta*h)) * a - (1+chi) * z;          // marginal costs, eq. (10)
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


