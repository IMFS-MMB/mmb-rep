// BRA_SAMBA08 replication

var co crot c no nrot n q wr k u fii qi i x m rk mc pi bystar nxy r gy syhat 
bby g y yva piva pibar sgbar zc zn zi zfiistar zfii a zr zg  mstar pistar rstar; //endogenous variables

varexo pibar_ gbar_ c_ n_ i_ fiistar_ fii_ a_ r_ g_ mstar_ pistar_ rstar_; //exogenous variables (innovations)

parameters beta alpha sigma pessi kappa h omegabarb tet nuu kuu vi del dela 
dels sc si sg sm sx sva sd omegabarc omegabarn iok fiistar rstarC bystarC rC 
byC gamar gamapi gamay gamag gamas gamab rhoa rhoc rhoi rhon rhoq rhor rhog 
rhosbar rhopi rhofii rhofiistar rhomstar rhorstar rhopistar;

beta = 0.98;
alpha = 0.4;
sigma = 0.823;
pessi=0.04;
kappa = 1.014;
h = 0.218;
omegabarb=0.239;
tet=0.906;
nuu=0.338;
kuu=1.406;
vi=0.672;
del=0.025;
dela=1;
dels=3.997;
sc=0.555;
si=0.147;
sg=0.176;
sm=0.109;
sx=0.121;
sva=0.891;
sd=0.891;
omegabarc=0.4;
omegabarn=0.8;
iok=0.03;
fiistar=1.016;
rstarC=1.009;
bystarC=0.033;
rC=1.042;
byC=1.028;

gamar=0.682;
gamapi=1.523;
gamay=0.839;
gamag=0.695;
gamas=0.465;
gamab=0.17;

rhoa = 0.985;
rhoc = 0.7;
rhoi = 0.28;
rhon = 0.74;
rhoq = 0.0;
rhor = 0.0;
rhog = 0.0;
rhosbar = 0.915;
rhopi = 0.937;
rhofii = 0.867;
rhofiistar = 0.64;
rhomstar = 0.257;
rhorstar = 0.848;
rhopistar = -0.139;

model(linear);
co = (1/(1+h))*co(+1)+(h/(1+h))*co(-1)-sigma^(-1)*((1-h)/(1+h))*(r-pi(+1))+sigma^(-1)*((1-h)/(1+h))*(1-rhoc)*zc;
crot = wr+nrot;
c = (1-omegabarc)*co + omegabarc*crot;
no = nuu^(-1)*(wr-(sigma/(1-h))*(co-h*co(-1))-zn);
nrot = nuu^(-1)*(wr-(sigma/(1-h))*(crot-h*crot(-1))-zn);
n = (1-omegabarn)*no + omegabarn*nrot;
q = q(+1)-((r-pi(+1))-(rstar+fii-pistar(+1)));                              
n = y-(1-kuu)*a-(kuu+alpha*(1-kuu))*wr+alpha*(1-kuu)*rk+kuu*mc;
k(-1) + u = y-(1-kuu)*a-(1-alpha*(1-kuu))*rk+(1-kuu)*(1-alpha)*wr+kuu*mc;   
fii = -pessi*bystar+vi*zfiistar+zfii;                                       
qi = beta*(1-del)*qi(+1)+(1-beta*(1-del))*rk(+1)-(r-pi(+1));             
i = (1/(dels*(1+beta)))*qi+(beta/(1+beta))*i(+1)+(1/(1+beta))*i(-1)+((1-rhoi*beta)/(1+beta))*zi;   
k = (1-del)*k(-1)+iok*i;
x = mstar+kappa*q;
m = y-kuu*(q-mc);
rk = dela*u;
mc = sd*(alpha*rk+(1-alpha)*wr-a)+(1-sd)*q;
pi = ((1-tet*beta)*(1-omegabarb)*(1-tet)/(tet+omegabarb*(1-tet*(1-beta))))*mc+(omegabarb/(tet+omegabarb*(1-tet*(1-beta))))*pi(-1)+(tet*beta/(tet+omegabarb*(1-tet*(1-beta))))*pi(+1);
bystar = fiistar*rstarC*(bystar(-1)+nxy+bystarC*(yva(-1)-yva+(1/sva)*(q-q(-1))-pistar))+bystarC*(fii+rstar);  
nxy = (sx/sva)*x-(sm/sva)*m-((sx-sm)/sva)*yva-(sm/sva)*((1-sx)/sva)*q;
r = gamar*r(-1)+(1-gamar)*(gamapi*(pi(+1)-pibar(+1))+pibar+gamay*yva)+zr;

gy = gamag*gy(-1)+(1-gamag)*(gamas*syhat(-1)- gamab*bby(-1)) + zg;           
syhat + sgbar = -gy;
bby = rC*(bby(-1)+gy-byC*(yva-yva(-1)+piva))+byC*r;                           
g = yva+(sva/sg)*gy-(sm/sva)*q;
y = sc*c+si*i+sg*g+sx*x;
yva = (1/sva)*y-(sm/sva)*m;
piva = pi-(sm/sva)*(q-q(-1));
pibar = rhopi*pibar(-1)+pibar_;
sgbar = rhosbar*sgbar(-1)+gbar_;
zc = rhoc*zc(-1) + c_;
zn = rhon*zn(-1) + n_;
zi = rhoi*zi(-1) + i_;
zfiistar = rhofiistar*zfiistar(-1) + fiistar_;
zfii = rhofii*zfii(-1) + fii_;
a = rhoa*a(-1) + a_;
zr = rhor*zr(-1) + r_;
zg = rhog*zg(-1) + g_;
mstar = rhomstar*mstar(-1) + mstar_;
pistar = rhopistar*pistar(-1) + pistar_;
rstar = rhorstar*rstar(-1) + rstar_;
end;

shocks;
var c_ = 1;    //0.081^2;
var r_ = 1; // 0.25^2;    //0.003^2;
var mstar_ = 1;    //0.013^2;
var pibar_=0;
var  gbar_=0; 
var n_ =0;
var i_ =0;
var fiistar_ =0;
var fii_ =0;
var a_ =0;
var g_ =0;
var  pistar_ =0;
var rstar_ =0;
var c_, r_ =0;
var c_, mstar_ =0;
var r_, mstar_ =0;
end;

stoch_simul(irf = 21, ar=100, nograph);