// Replication file NK_GK09

// prepared by Tong Wang and Xiaobei He, Goethe University Frankfurt


// revised according to Karadi's appendix

var 
nu rk r uc eta x z phi n ne nn q k delta u l y i c pmn pi
rn epsilon a pm efp lambda erk psi phic f f1 pistar ym mc d in//s  ia 
;

varexo
e_rn e_a e_epsilon e_n
;

parameters
theta beta divert omega alpha deltac b zeta chi etai vphi rhoa rhoeps rhoi 
kappa_pi kappa_mc gamma gammap PMss veps h
Iss PIss RNss Gss PHIss EFPss Rss ETAss NUss Zss Xss RKss DELTAss YKss
IKss CKss KLss Lss Kss Yss Nss NEss NNss Css PMNss  LAMBDAss 
 PSIss upsilon UCss IYss Dss Fss F1ss
;

beta = 0.99;
alpha = 0.33;
veps = 4.167;
h = 0.815;
zeta = 7.2;
etai = 1.728;
chi = 3.409;
vphi = 0.276;
gamma = 0.779;
gammap = 0.241;
kappa_pi = 2.043;
kappa_mc = 0.5/4;
rhoi = 0;
rhoa = 0.9;
rhoeps = 0.66;
PMss = (veps-1)/veps;
theta = 0.972;
Rss = 1/beta;
EFPss = 0.01/4;
PHIss = 4.08;
omega = (1-theta*(EFPss*PHIss+Rss))*1/PHIss;
Zss = EFPss*PHIss + Rss;
Xss = Zss;
NUss = (1-theta)*beta*EFPss/(1-beta*theta*Xss);
ETAss = (1-theta)*beta*Rss/(1-beta*theta*Zss);
RKss = Rss + EFPss;
DELTAss = 0.025;
YKss = (RKss - (1-DELTAss))/alpha/PMss;
IKss = 0.025;
IYss=IKss/YKss;
KLss = YKss^(1/(alpha-1));
Lss = (((1-alpha)*(1-beta*h)*PMss)/((1-h)*chi*(0.8-IYss)))^(1/(1+vphi));
Kss = KLss*Lss;
b = alpha*YKss;
Yss=Kss^alpha*Lss^(1-alpha);
Gss = 0.2*Yss;
Iss = IYss*Yss;
RNss=log(Rss);                                                 
PIss = 1;
PMNss = PMss;
deltac = DELTAss - b/(1+zeta); 
divert = ETAss/PHIss + NUss;
Nss = Kss/PHIss;
NEss = theta*Zss*Nss;
NNss = omega*Kss;
Css = Yss-Iss-Gss;
Fss = Yss*PMNss/(1-beta*gamma);
F1SS = Yss/(1-beta*gamma*PIss^(gammap-1));
LAMBDAss = 1;
PSIss=1;                          
upsilon=0;                           
UCss=(1-beta*h)/((1-h)*Css); 
Fss = Yss*PMss/(1-beta*gamma);
F1ss = Yss/(1-beta*gamma);
Dss=1;

model(linear);
NUss*nu = (1-theta)*beta*(RKss*rk(1)-Rss*r) + (1-theta)*beta*(RKss-Rss)*lambda(1) + beta*theta*Xss*NUss*(lambda(1)+x(1)+nu(1));
ETAss*eta = (1-theta)*beta*LAMBDAss*Rss*(lambda(+1)+r)+beta*theta*Zss*ETAss*(lambda(1)+z(1)+eta(1));    
divert*PHIss*phi-PHIss*NUss*(phi+nu)=ETAss*eta;
Zss*z = PHIss*(RKss*rk-Rss*r(-1)) + PHIss*(RKss-Rss)*phi(-1) + Rss*r(-1);
x = phi - phi(-1) + z;
n = NEss/Nss*ne + NNss/Nss*nn - e_n;
ne = z + n(-1);
nn = q + k + epsilon;  
RKss*Kss*(rk+q(-1)+k(-1))=alpha*PMss*Yss*(pm+ym)+Kss*(q+epsilon+k(-1))-DELTAss*Kss*(delta+epsilon+k(-1));
ym = a + alpha*u + alpha*epsilon + alpha*k(-1)+(1-alpha)*l;
DELTAss/(DELTAss-deltac)*delta = (1+zeta)*u;    
pm + ym - u = zeta*u + epsilon + k(-1);
in = Iss*i - DELTAss*Kss*(k(-1)+epsilon+delta);
q = etai*(in-in(-1))/Iss - beta*etai*(in(1)-in)/Iss;
Kss*k = Kss*k(-1) + Kss*epsilon + in;
uc = -1/((1-beta*h)*(1-h))*(c-h*c(-1)-beta*h*(c(1)-h*c));
lambda = uc - uc(-1);
lambda(1) + r = 0;
Yss*y = Css*c + Iss*i;
pm + ym - l = -uc + vphi*l;
pm = pmn  - pi;  
mc=-pm; 
y=ym+d;
Dss*d=gamma*Dss*PIss^(veps*(1-gammap))*(-gammap*veps*pi(-1)+veps*pi+d(-1))+veps/(1-gamma)*((1-gamma*PIss^((gamma-1)*(1-gammap)))/(1-gamma))^(-veps/(1-gamma))*gamma*PIss^((gamma-1)*(1-gammap))*((gamma-1)*pi+gammap*(1-gamma)*pi(-1));
Fss*f = Yss*PMss*(y+pm) + beta*gamma*LAMBDAss*Fss*(lambda(1)-gammap*veps*pi+veps*pi(1)+f(1));
F1ss*f1 = Yss*y + beta*gamma*LAMBDAss*PIss^(gammap-1)*F1ss*(lambda(1)+gammap*(1-veps)*pi-(1-veps)*pi(1)+f1(1));
pistar = f - f1 + pi;                
pi = gamma*gammap*pi(-1) + (1-gamma)*pistar;
rn = r + pi(1);
rn = rhoi*rn(-1) + (1-rhoi)*(kappa_pi*pi+kappa_mc*mc) + e_rn;
efp = rk(1)-r;
a = rhoa*a(-1) - e_a;
epsilon = rhoeps*epsilon(-1) - e_epsilon;
erk = rk(+1);
PSIss*psi = -upsilon*EFPss*efp;
q + k = phic + n;
phic + psi = phi;
end;

shocks;
var e_rn; stderr 0.0025;
var e_a; stderr 0.01;
//var e_n; stderr 0.01;
var e_epsilon; stderr 0.05;
end;


steady;

check;

//stoch_simul(order=1,irf=40, nograph, noprint);  
stoch_simul(order=1,irf=40) epsilon r efp phi y c i k l q n pi rn erk rk psi phic; 

//upsilon=1000;
//stoch_simul(order=1,irf=40) epsilon r efp phi y c i k l q n pi rn erk rk psi phic; 

//upsilon=10000; 
//stoch_simul(order=1,irf=40) epsilon r efp phi y c i k l q n pi rn erk rk psi phic; 