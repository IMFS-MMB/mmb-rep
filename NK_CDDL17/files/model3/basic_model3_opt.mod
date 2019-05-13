//DECLARATIONS. 
 
//Endogenous variables 
var cnk,ynk,ink,knk,hnk,lnk,psink,pnnk,pdnk,dpnk,dynk,enk,dnk,Rsnk,Rdnk,Rrnk,lbnk,Util,Welf,lsnk,lrnk; 

var lmult1,  lmult2,  lmult3,  lmult4,  lmult5,  lmult6,  lmult7,   
    lmult8,  lmult9,  lmult10,  lmult11,  lmult12,  lmult13,  lmult14,   
    lmult15,  lmult16,  lmult17,  lmult18,kap,qnk; 
 
//Exogenous variables 
var z,etar,psil; 
 
varexo ez,et,eps; 
 
parameters  nbeta,chi,thh,nu,delta,sigma,mup,xi,dpss,
            tau,gammass,phiss,psilss,kpss,etss,rz,rt,rp; 
year    = 2007;%12; 
parcal  = calib(year);
nbeta   = parcal(1);
chi     = parcal(2);
thh     = parcal(3);
nu      = parcal(4);
delta   = parcal(5);
sigma   = parcal(6);
mup     = parcal(7);
xi      = parcal(8);
psiss   = parcal(9);
dpss    = parcal(10);
tau     = parcal(11);
etss    = parcal(12);
kpss    = parcal(13);
psilss  = parcal(14);
phiss   = parcal(15);
gammass = parcal(16);
oms     = parcal(17);
omr     = parcal(18);
rz      = parcal(19);
rt      = parcal(20);
rp      = parcal(21);
sez     = parcal(22);
set     = parcal(23);
sep     = parcal(24); 
%
% Actual Calibration
%
KP      = 0.1;
for iexp=1:length(KP)
kpss    = KP(iexp);  

Rdss    = dpss/nbeta;
Rsss    = Rdss*(1+gammass)*(1+tau*kpss/(1-tau)+phiss*kpss/((1-tau)*(1-phiss))+psilss/((1+gammass)*(1-phiss)))/(1+gammass*exp(etss));
Rrss    = omr*Rsss;
ksy     = nu/(mup*(Rsss-(1-delta)));
lssy    = ksy/(1+gammass*exp(etss)*(1-phiss));
lrsy    = gammass*lssy;
lsy     = (1+gammass)*lssy;
isy     = lsy-(1-delta)*ksy; 
csy     = 1-isy-psilss*lssy; 
hss     = ((1-nu)/(mup*csy*thh))^(1/(1+chi));
yss     = ksy^(nu/(1-nu))*hss; 
css     = csy*yss; 
lbss    = 1/css; 
lbkss   = lbss; 
qxss    = 1; 
iss     = isy*yss; 
lsss    = lssy*yss;
lrss    = lrsy*yss;
lss     = lsss+lrss; 
kss     = ksy*yss;
pnss    = lbss*yss/(1-nbeta*xi); 
pdss    = pnss; 
dyss    = 1;
ess     = kpss*lss; 
dss     = lss-ess; 
qss     = nu/(mup*ksy)+1-delta;
wss     = (sigma-1)*(1-nu)*yss/(sigma*hss);
zss     = nu*wss*hss/((1-nu)*kss);
xss     = lss;

// Ramsey multipliers 

xx              = log([css yss iss kss hss psiss pnss pdss dpss dyss Rsss Rdss lbss ess dss lss psilss etss lsss lrss]);
[er,lmk]        = comp_lambda_model3(xx);
lmult1_SS    = lmk(1);
lmult2_SS    = lmk(2);
lmult3_SS    = lmk(3);
lmult4_SS    = lmk(4);
lmult5_SS    = lmk(5);
lmult6_SS    = lmk(6);
lmult7_SS    = lmk(7);
lmult8_SS    = lmk(8);
lmult9_SS    = lmk(9);
lmult10_SS   = lmk(10);
lmult11_SS   = lmk(11);
lmult12_SS   = lmk(12);
lmult13_SS   = lmk(13);
lmult14_SS   = lmk(14);
lmult15_SS   = lmk(15);
lmult16_SS   = lmk(16); 
lmult17_SS   = lmk(17); 
lmult18_SS   = lmk(18); 
  
model;     
    // Standard block 
    cnk+lbnk    = 0; 
    log(thh)+(1+chi)*hnk   = log(1-nu)+lbnk+psink+ynk; 
    dynk+ynk    = z+nu*knk(-1)+(1-nu)*hnk; 
    exp(lnk)    = exp(ink)+(1-delta)*exp(knk(-1)); 
    exp(knk)    = (1-phiss)*exp(etar)*exp(lrnk)+exp(lsnk); 
    exp(ynk)    = exp(cnk)+exp(ink)+exp(psil+lsnk); 
    lbnk        = log(nbeta)+lbnk(+1)+Rdnk-dpnk(+1); 
    exp(lbnk(+1)-dpnk(+1)+Rsnk)=(nu*exp(lbnk(+1)+psink(+1)+ynk(+1)-knk)+exp(lbnk(+1))*(1-delta)); 
 
    // Nominal aspects 
    exp(pnnk)   = mup*exp(lbnk+ynk+psink)+nbeta*xi*dpss^(-sigma)*exp(pnnk(+1)+sigma*dpnk(+1)); 
    exp(pdnk)   = exp(lbnk+ynk)+nbeta*xi*dpss^(1-sigma)*exp(pdnk(+1)+(sigma-1)*dpnk(+1)); 
    1           = xi*dpss^(1-sigma)*exp((sigma-1)*dpnk)+(1-xi)*exp((1-sigma)*(pnnk-pdnk)); 
    exp(dynk)   = xi*dpss^(-sigma)*exp(dynk(-1)+sigma*dpnk)+(1-xi)*exp(-sigma*(pnnk-pdnk)); 
 
    // Banking aspects 
    enk         = log(kpss)+lnk; 
    exp(lnk)    = exp(dnk)+exp(enk);   
    exp(lnk)    = exp(lsnk)+exp(lrnk); 
    exp(lrnk)   = gammass*exp(lsnk); 
    //(1-tau)*exp(psil)= (1-tau)*(exp(Rsnk-Rdnk)-1)-tau*kpss; 
    exp(Rsnk-Rdnk)*(1+gammass*exp(etar))=(1+gammass)*(1+tau*kpss/(1-tau)+phiss*kpss/((1-tau)*(1-phiss))+psilss/((1+gammass)*(1-phiss))); 
    Rrnk        = Rsnk+etar; 
 
    // Welfare 
    Util    = cnk-thh*exp((1+chi)*hnk)/(1+chi); 
    Welf    = Util+nbeta*Welf(+1); 
 
// Policymaker's First-Order Conditions 
lmult1 - lmult6*exp(cnk) + 1; 
-lmult14*exp(dnk); 
lmult7(-1)/nbeta - (lmult8(-1)*exp(Rsnk(-1) - dpnk + lbnk))/nbeta - dpss^(1 - sigma)*lmult11*xi*exp(dpnk*(sigma - 1))*(sigma - 1) - (lmult12*sigma*xi*exp(dynk(-1) + dpnk*sigma))/dpss^sigma - (lmult9(-1)*sigma*xi*exp(pnnk + dpnk*sigma))/dpss^sigma - dpss^(1 - sigma)*lmult10(-1)*xi*exp(pdnk + dpnk*(sigma - 1))*(sigma - 1); 
lmult3 + lmult12*exp(dynk) - (lmult12(+1)*nbeta*xi*exp(dynk + dpnk(+1)*sigma))/dpss^sigma; 
lmult13 - lmult14*exp(enk); 
lmult2*(chi + 1) + lmult3*(nu - 1) - thh*exp(hnk*(chi + 1)); 
- lmult4*exp(ink) - lmult6*exp(ink); 
lmult5*exp(knk) + lmult8*nu*exp(lbnk(+1) - knk + psink(+1) + ynk(+1)) - lmult3(+1)*nbeta*nu + lmult4(+1)*nbeta*exp(knk)*(delta - 1); 
lmult1 - lmult2 + lmult7 - lmult10*exp(lbnk + ynk) - lmult7(-1)/nbeta - lmult9*mup*exp(lbnk + psink + ynk) + (lmult8(-1)*(exp(Rsnk(-1) - dpnk + lbnk) - nu*exp(lbnk - knk(-1) + psink + ynk) + exp(lbnk)*(delta - 1)))/nbeta; 
lmult4*exp(lnk) - lmult13 + lmult14*exp(lnk) + lmult15*exp(lnk); 
lmult16*exp(lrnk) - lmult15*exp(lrnk) + lmult5*exp(etar)*exp(lrnk)*(phiss - 1); 
- lmult6*exp(lsnk + psil) - lmult5*exp(lsnk) - lmult15*exp(lsnk) - gammass*lmult16*exp(lsnk); 
lmult10*exp(pdnk) - dpss^(1 - sigma)*lmult10(-1)*xi*exp(pdnk + dpnk*(sigma - 1)) + lmult11*exp((pdnk - pnnk)*(sigma - 1))*(sigma - 1)*(xi - 1) + lmult12*sigma*exp(sigma*(pdnk - pnnk))*(xi - 1); 
lmult9*exp(pnnk) - (lmult9(-1)*xi*exp(pnnk + dpnk*sigma))/dpss^sigma - lmult11*exp((pdnk - pnnk)*(sigma - 1))*(sigma - 1)*(xi - 1) - lmult12*sigma*exp(sigma*(pdnk - pnnk))*(xi - 1); 
- lmult2 - lmult9*mup*exp(lbnk + psink + ynk) - (lmult8(-1)*nu*exp(lbnk - knk(-1) + psink + ynk))/nbeta; 
- lmult7 - lmult17*exp(Rsnk - Rdnk)*(gammass*exp(etar) + 1); 
lmult18; 
lmult8*exp(Rsnk - dpnk(+1) + lbnk(+1)) - lmult18 + lmult17*exp(Rsnk - Rdnk)*(gammass*exp(etar) + 1); 
lmult3 - lmult2 - lmult10*exp(lbnk + ynk) + lmult6*exp(ynk) - lmult9*mup*exp(lbnk + psink + ynk) - (lmult8(-1)*nu*exp(lbnk - knk(-1) + psink + ynk))/nbeta; 
 
    // Shocks 
    z   = rz*z(-1)+ez; 
    etar= rt*etar(-1)+(1-rt)*etss+et; 
    psil=rp*psil(-1)+(1-rp)*log(psilss)+eps; 
   kap=kpss;

exp(qnk)  = nu*exp(psink+ynk-knk(-1))+1-delta;end; 
 
initval; 
    ez      = 0; 
    et      = 0; 
    eps     = 0; 
    z       = 0;     
    etar    = etss; 
    psil    = log(psilss); 
    // Endogenous Variables 
    ynk     = log(yss); 
    hnk     = log(hss); 
    cnk     = log(css); 
    ink     = log(iss); 
    knk     = log(kss); 
    lbnk    = log(lbss); 
    lnk     = log(lss); 
    lsnk    = log(lsss); 
    lrnk    = log(lrss); 
    Rdnk    = log(Rdss); 
    Rsnk    = log(Rsss); 
    Rrnk    = log(Rrss); 
    psink   =-log(mup); 
    pnnk    = log(pnss); 
    pdnk    = log(pdss); 
    dpnk    = log(dpss); 
    dynk    = log(dyss); 
    enk     = log(ess); 
    dnk     = log(dss); 
    qnk     = log(qss);
    // Welfare 
    Util    = cnk-thh*exp((1+chi)*hnk)/(1+chi); 
    Welf    = Util/(1-nbeta);     
lmult1 = lmult1_SS; 
lmult2 = lmult2_SS; 
lmult3 = lmult3_SS; 
lmult4 = lmult4_SS; 
lmult5 = lmult5_SS; 
lmult6 = lmult6_SS; 
lmult7 = lmult7_SS; 
lmult8 = lmult8_SS; 
lmult9 = lmult9_SS; 
lmult10 = lmult10_SS; 
lmult11 = lmult11_SS; 
lmult12 = lmult12_SS; 
lmult13 = lmult13_SS; 
lmult14 = lmult14_SS; 
lmult15 = lmult15_SS; 
lmult16 = lmult16_SS; 
lmult17 = lmult17_SS; 
lmult18 = lmult18_SS; 
   kap=kpss;
end; 
 
resid; 
steady; 
check; 
shocks; 
var ez;stderr sez; 
var et;stderr set; 
var eps;stderr sep; 
end; 
stoch_simul(order=1,irf=20,nograph); 
%
//save(sprintf('results/results_m3_kp%03d_%d',round(100*kpss),year),'M_','oo_')
end