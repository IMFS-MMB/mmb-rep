// CODE TO REPLICATE FGKR AER
// NEED DYNARE VERSION 4.4.3

// 0. Set paths
warning off ;

// 1. Define variables, parameters, etc
var         bdt ct dt gt ht
            inflt invt kt kbt lamt mct
            miut miubt proft Rt
            rkt sigct siggt sigkt
            sigwt tauct taukt tauwt utilt
            wt yt gzt gyt gct git gwt ;
 
varexo      ect edt egt ekt emt ewt ezt uct
            ugt ukt uwt;

parameters  alph bds bet cs phisigk
            deductdepr 
            nom_depreciation
            delt eps epsw deltau
            etac etag etak etaw
            gamcb gamcy gamgb gamgy gamkb
            gamky gamwb gamwy gs hs
            infls invs ks kbs lams mcs
            mius miubs mius_lams miubs_lams nomw ome phibd phil
            phiprof phips phiR phiRot
            phiRotw phiu1 phiu2 phiy profs
            rhoc rhod rhog rhogc rhogg
            rhogk rhogw rhok 
            rhow rhoz rks Rs sigcs
            sigd siggs sigks sigms
            sigws sigz taucs tauks tauws
            taxprofits tbd thetp thetw ups
            ws ys habit kappa
            rspnd_y rspnd_b gzs;

// 2. Set Parameters
// Growth rate of the economy
gzs  = 1.005 ; // steady-state TFP growth rate

// parameter values
// Preferences and consumer
ome  = 2 ;      // CRRA
bet  = 0.9945*gzs^ome;  // time-discount factor; adjusted to have real rate of 2% in the presence of growth
ups  = 1 ;      // inverse of Frisch elasticity of labor supply (phil: scaling parameter to disutility of work is determined with ss below)
thetw= 0.75 ;   // Calvo-equivalent of Rotemberg wage stickiness (phiRotw=phiw is determined with ss below)
nomw = 0 ;      
eps     = 21 ;  // price markup from ACEL
habit = 0.75 ;  // From ACEL

// cost of utilization and investment
phiu2  = 0.01 ; // second derivative for capacity utilization cost function (phiu1, the first derivative, is determined with ss below)
kappa  = 0.75 ;

// Firms
alph    = 0.36 ;   // weight on capital in Cobb-Douglas production function
delt    = 0.010 ;  // rate of depreciation of capital
deltau  = 0.010 ;  // depreciation for tax purposes
thetp   = 0.75 ;   // Calvo-equivalent of Rotemberg price stickiness (phiRot=phipt is determined with ss below)
epsw    = 21;      // wage markup from ACEL
phiprof = 0.00;    // fixed cost in production

// Taylor rule
infls= 1.0045 ;  // inflation target (adjusted for mean ergodic inflation rate)
phiR = 0.7 ;     // smoothing coefficient
phips= 1.35 ;    // steady-state response to inflation
phiy = 0.25 ;    // response to output
phisigk = -0.025 ; // response to tax volatility

// lump-sum taxes 
phibd = 0.0005; // response of lump-sum taxes to debt (tbd=Omega, the steady-state level of lump-sum taxes is determined with ss below)
                 // use 0.01 w/o feedback
   
// government spending process
gs    = 0.2 ;       // steady-state level of spending

// feedback rule
rhog  = 0.99 ;    // autocorrelation
gamgy = -0.004 ;   // response to output
gamgb = -0.008 ;   // response to debt
siggs = -6.20 ;   // steady-state vola
rhogg = 0.92 ;    // persistence of vola shock  
etag  = 0.18 ;    // std of inno to vola 

// capital taxes
tauks = 0.38 ;    // steady-state level of tax

// feedback rule 
rhok  = 0.98 ;    // autocorrelation
gamky = 0.040 ;    // response to output
gamkb = 0.003 ;    // response to debt
sigks = -4.90 ;    // steady-state vola
rhogk = 0.65 ;    //  vola shock
//rhogk = 0.39 ;    // low persistence
//rhogk = 0.86 ;  // high persistence
etak  = 0.40 ;    // std of inno to vola 

// consumption taxes
taucs = 0.080 ;    // steady-state level of tax

// feedback rule 
rhoc  = 0.99 ;    // autocorrelation
gamcy = 0.001 ;    // response to output
gamcb = 1e-4 ;    // response to debt
sigcs = -7.12 ;    // steady-state vola
rhogc = 0.73 ;     // persistence of vola shock
etac  = 0.45 ;    // std of inno to vola


// labor taxes
tauws= 0.21 ;     // steady-state level of tax

// feedback rule
rhow = 0.99 ;     // autocorrelation
gamwy= 0.040 ;     // response to output
gamwb= 0.003 ;     // response to debt
sigws= -6.0 ;     // steady-state vola
rhogw= 0.46 ;     // persistence of vola shock
etaw = 0.82 ;     // std of inno to vola

// monetary shock
sigms = exp(-5.5) ;   // steady-state vola

// consumption-preference shock
rhod = 1*0.18;       // autocorrelation
sigd = 1*0.08 ;      // vola
  
// neutral technology shock
rhoz = 0.95 ;  // autocorrelation
sigz = 0.001 ; // vola

// tax system
deductdepr = 1; // depreciation allowance
taxprofits = 0; // tax monopolistic profits of sticky-price firms
nom_depreciation = 0; // depreciation allowances refer to nominal value of investment
rspnd_y    = 1.0;// taxes and spending respond to output
rspnd_b    = 1.0;// taxes and spending respond to debt

// compute steady state

Rs      = gzs^ome*infls/bet ;   
miubs_lams   = bet*deltau*tauks*deductdepr/(infls^nom_depreciation*gzs^ome)/(1-bet*(1-deltau)/infls^nom_depreciation/gzs^ome);
mius_lams    = 1 - miubs_lams;
rks     = ( 1 - bet*(1-delt)/gzs^ome )*mius_lams*gzs^ome/bet /(1-tauks) ;
mcs     = (eps-1)/eps ;
phiRot  = eps*mcs/infls^2*thetp/(1-thetp) /(1-thetp*bet*(gzs^(1-ome)));  
koverls = gzs*(rks/alph/mcs)^(1/(alph-1)); 
ws      = (1-alph)*koverls^alph*mcs/gzs^alph; 
lk      = (1-alph)*rks/alph/ws/gzs ;
hs      = 1/3;
ys      = lk^(-alph)*hs/gzs^alph - phiprof;
ks      = hs/lk ;
invs    = (1-(1-delt)/gzs)*ks ;
kbs     = infls^nom_depreciation/( infls^nom_depreciation - (1-deltau)/gzs )*invs;
cs      = ys - gs*ys  - invs; //adj cost is zero in steady state
lams    = (1/(1-habit/gzs)^ome-bet*habit/(gzs-habit)^ome)/cs^ome/(1+taucs) ;
mius    = mius_lams*lams;
miubs   = miubs_lams*lams;
phil    = ws*(epsw - 1)*lams*(1-tauws)/epsw/hs^ups ;          // scaling parameter to disutility of work
utils   = 1 ;
phiu1   = lams*rks*(1-tauks)/mius ;
bds     = 1.6*ys ; // 
profs   = ys-ws*hs-rks*utils*ks/gzs-phiprof; 
tbd     = gs*ys - (ws*hs*tauws + ks*tauks* (  rks*utils -  deductdepr*deltau/infls^nom_depreciation)/gzs  
                               + tauks*taxprofits*profs  
                               + taucs*cs
                               + bds*(1 - Rs/infls/gzs)) ;
phiRotw = epsw*phil*hs^(1+ups)*thetw*(1+epsw*ups)/ys/lams/(1-bet*thetw*gzs^(1-ome))/(1-thetw)/infls^nomw/gzs^2; 

// 4. Define Model
model ;

// household sector
// consumption; 
exp(dt)/(exp(ct)-habit*exp(ct(-1))/exp(gzt))^ome - exp(dt(1))*habit*bet/(exp(ct(1))*exp(gzt(1))-habit*exp(ct))^ome= exp(lamt)*(1+tauct) ; 

// labor; 
0 = epsw*phil*exp(dt)*(exp(ht))^(1+ups) - (epsw-1)*exp(lamt)*(1-tauwt)*exp(ht)*exp(wt) 
    - phiRotw*exp(yt)*(exp(inflt))^nomw*exp(lamt)*exp(gzt)*exp(wt)/exp(wt(-1))*((exp(inflt))^nomw*exp(gzt)*exp(wt)/exp(wt(-1))-gzs*infls^nomw) 
        + bet*phiRotw*(exp(inflt(1)))^nomw*exp(lamt(1))*exp(-ome*gzt(1))*exp(yt(1))*exp(gzt(1))*exp(wt(1))/exp(wt)*exp(gzt(1))*((exp(inflt(1)))^nomw*exp(gzt(1))*exp(wt(1))/exp(wt)-gzs*infls^nomw) ;    
    
// bonds; 
exp(lamt) = bet*exp(lamt(1))*exp(Rt)/exp(inflt(1))/exp(gzt(1))^ome ; 

// utilization; 
exp(lamt)*exp(rkt)*(1-taukt) = exp(miut)*( phiu1 + phiu2*(exp(utilt)-1) ) ; 

// capital; 
exp(miut) = bet*(    (1 - delt - phiu1*( exp(utilt(1)) -1 ) - phiu2/2*( exp(utilt(1))-1 )^2 )*exp(miut(1)) 
                  +  (1-taukt(1))*exp(rkt(1))*exp(utilt(1))*exp(lamt(1)))/exp(gzt(1))^ome ; 

// investment; 
exp(lamt) = exp(miut)*(1 - exp(gzt)*exp(invt)/exp(invt(-1))*kappa*(exp(gzt)*exp(invt)/exp(invt(-1)) - gzs) - kappa*(exp(gzt)*exp(invt)/exp(invt(-1)) - gzs)^2/2) 
                   + bet*(exp(gzt(1))^2*exp(invt(1))/exp(invt))^2*kappa*(exp(gzt(1))*exp(invt(1))/exp(invt) - gzs)*exp(miut(1))/exp(gzt(1))^ome + miubt ; 

// tax capital stock; 
miubt =   bet*miubt(1)*(1-deltau)/exp(inflt(1))^nom_depreciation/exp(gzt(1))^ome 
        + bet*exp(lamt(1))*deltau*taukt(1)/exp(inflt(1))^nom_depreciation*deductdepr/exp(gzt(1))^ome ;

// firm sector; 
0 = (1-taxprofits*taukt)*((1-eps) + eps*exp(mct) - phiRot*exp(inflt)*(exp(inflt) - infls) + phiRot*eps*(exp(inflt) - infls)^2/2) 
      + bet*phiRot*(exp(lamt(1))/exp(lamt)/exp(gzt(1))^ome)*(1-taxprofits*taukt(1))*(exp(gzt(1))*exp(yt(1))/exp(yt))*exp(inflt(1))*(exp(inflt(1))-infls);

// with linear Phillips curve: 
// modified budget constraint below!!!
//exp(inflt) - infls = bet*gzs^(1-ome)*(exp(inflt(1))-infls) + eps*(exp(mct)-mcs)/(infls*phiRot) ;

// marginal cost; checked: ok
exp(mct) = (exp(wt)/(1-alph))^(1-alph)*(exp(rkt)/alph)^alph ;

// FOC factors inputs firm; 
exp(utilt)*exp(kt(-1))/exp(ht) = alph*exp(gzt)*exp(wt)/(1-alph)/exp(rkt) ;

// Profits of Calvo firms;
proft = exp(yt) - exp(wt)*exp(ht) - exp(rkt)*exp(utilt)*exp(kt(-1))/exp(gzt) - phiprof - phiRot/2*exp(yt)*(exp(inflt)-infls)^2; 

// Government: Taylor rule; 
exp(Rt) = Rs*(exp(Rt(-1))/Rs)^phiR*(exp(inflt)/infls)^(phips*(1-phiR))*(exp(yt)/ys)^(phiy*(1-phiR))*exp(emt) ; 
// This second Taylor rule is for the extended model
//exp(Rt) = Rs*(exp(Rt(-1))/Rs)^phiR*(exp(inflt)/infls)^(phips*(1-phiR))*(exp(yt)/ys)^(phiy*(1-phiR))*(exp(sigkt)/exp(sigks))^(0.005*(1-phiR))*exp(emt) ; //*****

// inflation targeting
// exp(inflt)  = infls ;

// government debt: 
bdt     =    bdt(-1)*exp(Rt(-1))/exp(inflt)/exp(gzt) + gt*exp(yt) 
            - (     tauwt*exp(wt)*exp(ht)
                  + taukt*exp(kt(-1))*( exp(rkt)*exp(utilt) )/exp(gzt)
                  + taukt*exp(kbt(-1))*(  - deductdepr*deltau/exp(inflt)^nom_depreciation )/exp(gzt)
                  + tauct*exp(ct) 
                  + proft*taxprofits*taukt
                  + phibd*(bdt(-1)/ys - bds/ys)     
                  + tbd ) ; 

// resource constraint: production;
exp(yt) = (exp(utilt)*exp(kt(-1))/exp(gzt))^alph*(exp(ht))^(1-alph) - phiprof ;

// resource constraint: demand; 
exp(yt) = exp(ct) + exp(invt) + gt*exp(yt) + phiRot/2*exp(yt)*(exp(inflt) - infls)^2 
         + phiRotw*exp(yt)*((exp(inflt))^nomw*exp(gzt)*exp(wt)/exp(wt(-1))-gzs*infls^nomw)^2/2 ;

// This version w/o price adjustment cost for linear PC; 
//exp(yt) = exp(ct) + exp(invt) + gt*exp(yt) + phiRotw*exp(yt)*((exp(inflt))^nomw*exp(gzt)*exp(wt)/exp(wt(-1))-gzs*infls^nomw)^2/2 ; 

// Laws of motion capital
exp(kt) =     (1 - delt - phiu1*(exp(utilt) - 1) - phiu2/2*(exp(utilt)-1)^2 )*exp(kt(-1))/exp(gzt) 
            + (1 - kappa/2*(exp(gzt)*exp(invt)/exp(invt(-1))-gzs)^2)*exp(invt) ; 
exp(kbt)= (1-deltau)*exp(kbt(-1))/(exp(inflt)^nom_depreciation*exp(gzt)) + exp(invt) ; 


// structural shocks
gzt = log(gzs) + ezt ;
dt = rhod*dt(-1) + edt ;

gt    = (1-rhog)*gs    + rhog*gt(-1)    + rspnd_y*gamgy*((yt(-1))-log(ys)) + rspnd_b*gamgb*(bdt(-1)/exp(yt(-1))-bds/ys) + exp(siggt)*egt ;
taukt = (1-rhok)*tauks + rhok*taukt(-1) + rspnd_y*gamky*((yt(-1))-log(ys)) + rspnd_b*gamkb*(bdt(-1)/exp(yt(-1))-bds/ys) + exp(sigkt)*ekt  ;
tauct = (1-rhoc)*taucs + rhoc*tauct(-1) + rspnd_y*gamcy*((yt(-1))-log(ys)) + rspnd_b*gamcb*(bdt(-1)/exp(yt(-1))-bds/ys) + exp(sigct)*ect ;
tauwt = (1-rhow)*tauws + rhow*tauwt(-1) + rspnd_y*gamwy*((yt(-1))-log(ys)) + rspnd_b*gamwb*(bdt(-1)/exp(yt(-1))-bds/ys) + exp(sigwt)*ewt ;

// Volatility shocks
sigkt = (1-rhogk)*sigks + rhogk*sigkt(-1) + (1-rhogk^2)^(1/2)*etak*ukt ;
sigwt = (1-rhogw)*sigws + rhogw*sigwt(-1) + (1-rhogw^2)^(1/2)*etaw*uwt ;
sigct = (1-rhogc)*sigcs + rhogc*sigct(-1) + (1-rhogc^2)^(1/2)*etac*uct ;
siggt = (1-rhogg)*siggs + rhogg*siggt(-1) + (1-rhogg^2)^(1/2)*etag*ugt ;

// Growth variables
gyt   = yt - yt(-1) + gzt ;
gct   = ct - ct(-1) + gzt ;
git   = invt - invt(-1) + gzt ;
gwt   = wt - wt(-1) + gzt ;

end ;

initval ;
ct   = log(cs) ;
yt   = log(ys) ;
rkt  = log(rks) ;
gt   = gs ;
kt   = log(ks) ;
kbt  = log(kbs) ;
ht   = log(hs) ;
mct  = log(mcs) ;
wt   = log(ws) ;
inflt= log(infls) ;
Rt   = log(Rs) ;
taukt= tauks ;
tauwt= tauws ;
tauct= taucs ;
lamt = log(lams) ;
miut = log(mius) ;
miubt= miubs ;
invt= log(invs) ;
utilt= 0 ;
sigkt= sigks ;
sigwt= sigws ;
sigct= sigcs ;
siggt= siggs ;
proft= profs;
bdt  = bds ;
gzt  = log(gzs) ;
dt   = 0 ;
gyt  = log(gzs) ;
gct  = log(gzs) ;
git  = log(gzs) ;
gwt  = log(gzs) ;
end ;

shocks ;
var ezt = sigz^2 ;
var edt = sigd^2 ;
var emt = sigms^2;
var ekt = 1 ;
var ect = 1 ;
var egt = 1 ; 
var ewt = 1 ;
var ukt = 1 ;
var uct = 1 ;
var ugt = 1 ;
var uwt = 1 ;
end;

// resid(1) ;

// steady ;

//---------------------------------------------------------------------
// 5. Run Dynare with pruning
//---------------------------------------------------------------------
// Default step: a first-order approximation needed for RunDynarePruning
stoch_simul(order = 1, noprint, nomoments, irf = 0) ;
f_11 = [oo_.dr.ghx oo_.dr.ghu];

// The standard Dynare command for your model
stoch_simul(order = 3, noprint, nomoments, irf = 0);

// Options for running the pruning codes
optPruning.numSim         = 1;                    
optPruning.seedNum        = 1;  
optPruning.IRFlength      = 21;
optPruning.computeIRF     = 0;
optPruning.computeMoments = 0;
optPruning.orderApp       = options_.order;   
tic                                   
outDynare = RunDynarePruning(optPruning,oo_,M_,f_11);
toc
// To see the applied options
outDynare.opt

//---------------------------------------------------------------------

nx      = size(outDynare.hv,1);
ny      = size(outDynare.gv,1);       
ne      = size(outDynare.eta,2);      

HHxxtil  = 1/2*reshape(outDynare.hvv,nx,nx^2);
HHxxxtil = 1/6*reshape(outDynare.hvvv,nx,nx^3);
GGxxtil  = 1/2*reshape(outDynare.gvv,ny,nx^2);
GGxxxtil = 1/6*reshape(outDynare.gvvv,ny,nx^3);

numSimirfs = 2000 ;
optPruning.numSim = 1000 ;

xfpath=zeros(nx,optPruning.numSim+numSimirfs);
xspath=zeros(nx,optPruning.numSim+numSimirfs);
xrdpath=zeros(nx,optPruning.numSim+numSimirfs);

for jx=2:optPruning.numSim+numSimirfs ;
    jx;
	AA          =   kron(xfpath(:,jx-1),xfpath(:,jx-1)) ;
	xfpath(:,jx)=   outDynare.hv*xfpath(:,jx-1) ;
	xspath(:,jx)=   outDynare.hv*xspath(:,jx-1) + HHxxtil*AA + 0.5*outDynare.hss;
	xrdpath(:,jx)=  outDynare.hv*xrdpath(:,jx-1)+ 2*HHxxtil*(kron(xfpath(:,jx-1),xspath(:,jx-1)))+HHxxxtil*(kron(AA,xfpath(:,jx-1))) + 3/6*outDynare.hssv*xfpath(:,jx-1) + 1/6*outDynare.hsss;
end

xfpath(:,1)=xfpath(:,optPruning.numSim+numSimirfs);
xspath(:,1)=xspath(:,optPruning.numSim+numSimirfs);
xrdpath(:,1)=xrdpath(:,optPruning.numSim+numSimirfs);

% randn('seed',optPruning.seedNum);
randn('seed',123430);

xfpath(:,2:optPruning.numSim+numSimirfs)=zeros(nx,optPruning.numSim+numSimirfs-1);
xspath(:,2:optPruning.numSim+numSimirfs)=zeros(nx,optPruning.numSim+numSimirfs-1);
xrdpath(:,2:optPruning.numSim+numSimirfs)=zeros(nx,optPruning.numSim+numSimirfs-1);
y3rdpath(:,2:optPruning.numSim+numSimirfs)=zeros(ny,optPruning.numSim+numSimirfs-1);

epsilons       = randn(ne,optPruning.numSim+numSimirfs);

for jx=2:optPruning.numSim+numSimirfs ;
    jx;
    innovacion  =   epsilons(:,jx) ;
	AA          =   kron(xfpath(:,jx-1),xfpath(:,jx-1)) ;
    AAsf         =   kron(xfpath(:,jx-1),xspath(:,jx-1)) ;
    AAA          =   kron(AA,xfpath(:,jx-1)) ;
	xfpath(:,jx)=   outDynare.hv*xfpath(:,jx-1) + outDynare.eta*innovacion;
	xspath(:,jx)=   outDynare.hv*xspath(:,jx-1) + HHxxtil*AA + 0.5*outDynare.hss;
	xrdpath(:,jx)=  outDynare.hv*xrdpath(:,jx-1)+ 2*HHxxtil*(kron(xfpath(:,jx-1),xspath(:,jx-1)))+HHxxxtil*(kron(AA,xfpath(:,jx-1))) + 3/6*outDynare.hssv*xfpath(:,jx-1) + 1/6*outDynare.hsss;
    y3rdpath(:,jx) = outDynare.gv*(xfpath(:,jx-1)+xspath(:,jx-1)+xrdpath(:,jx-1)) + GGxxtil*(AA+2*AAsf) + GGxxxtil*AAA + 0.5*outDynare.gss + 3/6*outDynare.gssv*xfpath(:,jx-1) + 1/6*outDynare.gsss ;
end

x3formoments = xfpath + xspath + xrdpath ;

% locx is the position of the Interest rate in x3formoments
locx = 5 ;
x3formomentsshort = x3formoments(:,optPruning.numSim+numSimirfs-numSimirfs+1:optPruning.numSim+numSimirfs) ;
hpx = x3formomentsshort;
hpx(locx(1),:) = Rs*exp(hpx(locx(1),:));
disp(sprintf('std:        %6.5f ',100*std(hpx(locx,:)')))

% Controls
y3rdpathformoments = y3rdpath(:,optPruning.numSim+numSimirfs-numSimirfs+1:optPruning.numSim+numSimirfs) ;
% locy is the position of the variables of interest in y3rdpathformoments
locy = [4 5 6 7 1 13 2 8];
% the first 4 variables are in growth rates 'gyt'    'gct'    'git'    'gwt'
varinlevels         = zeros(4,size(y3rdpathformoments,2)) ;
varinlevels(:,1)    = 1 ;

for tmx = 2:size(y3rdpathformoments,2) ;
    varinlevels(:,tmx) = varinlevels(:,tmx-1) + y3rdpathformoments(locy(1:4),tmx) ;
end 
hpy = varinlevels - hpf(varinlevels',1600)';

% the second 4 variables are NOT in growth rates 'ht'    'utilt'    'mct'    'inflt'
varalrlevels        = y3rdpathformoments(locy(5:8),:) ;
hpy = [hpy;varalrlevels(1:3,:) - hpf(varalrlevels(1:3,:)',1600)'];
% the last variable is 'inflt' and we do not HP fileter
hpy = [hpy;varalrlevels(4,:)];
hpy(8,:) = infls*exp(hpy(8,:));
outDynare.label_y(locy)'
disp(sprintf('std:        %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f', 100*std(hpy(:,:)')))

basu = [] ;
for jk = 1:length(locy)
    basi = corrcoef(hpy(jk,1:end-1)',hpy(jk,2:end)') ;
    basu(jk) = basi(2,1) ;
end

disp(sprintf('AR:         %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f', basu))
tema = corrcoef([hpy(:,:)']);
disp(sprintf('corr coeff: %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f', tema(2:end,1)'))

basur = corrcoef(hpy(1,:)',hpx(locx,:)') ;
disp(sprintf('Corr R with output:  %6.5f ',basur(2,1))) ;

// We compute the GIRF at the mean values
numperiodsrfs=optPruning.IRFlength+1;

xfirf=zeros(nx,numSimirfs,numperiodsrfs);
xsirf=zeros(nx,numSimirfs,numperiodsrfs);
xrdirf=zeros(nx,numSimirfs,numperiodsrfs);

xfirfref=zeros(nx,numSimirfs,numperiodsrfs);
xsirfref=zeros(nx,numSimirfs,numperiodsrfs);
xrdirfref=zeros(nx,numSimirfs,numperiodsrfs);

y3rdirf=zeros(ny,numSimirfs,numperiodsrfs);
y3rdirfref=zeros(ny,numSimirfs,numperiodsrfs);

xfirf(:,:,1)    = xfpath(:,optPruning.numSim+1:optPruning.numSim+numSimirfs);
xfirfref(:,:,1) = xfpath(:,optPruning.numSim+1:optPruning.numSim+numSimirfs);
xsirf(:,:,1)    = xspath(:,optPruning.numSim+1:optPruning.numSim+numSimirfs);
xsirfref(:,:,1) = xspath(:,optPruning.numSim+1:optPruning.numSim+numSimirfs);
xrdirf(:,:,1)   = xrdpath(:,optPruning.numSim+1:optPruning.numSim+numSimirfs);
xrdirfref(:,:,1)= xrdpath(:,optPruning.numSim+1:optPruning.numSim+numSimirfs);

epsValues       = randn(ne,numSimirfs,numperiodsrfs);

locsigma =  10 ;

for j=2:numperiodsrfs;
    j
    for i=1:numSimirfs;
        innovacionref   =   epsValues(:,i,j);
        innovacion      =   innovacionref;
        if j == 2  
            innovacion(locsigma,1) = 2 ;
         end

        AA           =   kron(xfirf(:,i,j-1),xfirf(:,i,j-1));
        AAsf         =   kron(xfirf(:,i,j-1),xsirf(:,i,j-1)) ;
        AAA          =   kron(AA,xfirf(:,i,j-1)) ;
        xfirf(:,i,j) =   outDynare.hv*xfirf(:,i,j-1) + outDynare.eta*innovacion;
        xsirf(:,i,j) =   outDynare.hv*xsirf(:,i,j-1) + HHxxtil*AA+0.5*outDynare.hss;
        xrdirf(:,i,j)=   outDynare.hv*xrdirf(:,i,j-1) + 2*HHxxtil*AAsf + HHxxxtil*AAA + 3/6*outDynare.hssv*xfirf(:,i,j-1) + 1/6*outDynare.hsss;
        y3rdirf(:,i,j) = outDynare.gv*(xfirf(:,i,j-1)+xsirf(:,i,j-1)+xrdirf(:,i,j-1)) + GGxxtil*(AA+2*AAsf) + GGxxxtil*AAA + 0.5*outDynare.gss + 3/6*outDynare.gssv*xfirf(:,i,j-1) + 1/6*outDynare.gsss ;

        AAref             =   kron(xfirfref(:,i,j-1),xfirfref(:,i,j-1));
        AAsfref           =   kron(xfirfref(:,i,j-1),xsirfref(:,i,j-1)) ;
        AAAref            =   kron(AAref,xfirfref(:,i,j-1)) ;
    	xfirfref(:,i,j)   =   outDynare.hv*xfirfref(:,i,j-1) + outDynare.eta*innovacionref;
    	xsirfref(:,i,j)   =   outDynare.hv*xsirfref(:,i,j-1) + HHxxtil*AAref + 0.5*outDynare.hss;
    	xrdirfref(:,i,j)  =   outDynare.hv*xrdirfref(:,i,j-1) + 2*HHxxtil*AAsfref + HHxxxtil*AAAref + 3/6*outDynare.hssv*xfirfref(:,i,j-1) + 1/6*outDynare.hsss;
        y3rdirfref(:,i,j) =   outDynare.gv*(xfirfref(:,i,j-1)+xsirfref(:,i,j-1)+xrdirfref(:,i,j-1)) + GGxxtil*(AAref+2*AAsfref) + GGxxxtil*AAAref + 0.5*outDynare.gss + 3/6*outDynare.gssv*xfirfref(:,i,j-1) + 1/6*outDynare.gsss ;

    end
end

irfxf=zeros(nx,numperiodsrfs);
irfxs=zeros(nx,numperiodsrfs);
irfxrd=zeros(nx,numperiodsrfs);

for j=1:numperiodsrfs;
    irfxf(:,j)   = mean(xfirf(:,:,j),2)-mean(xfirfref(:,:,j),2);
    irfxs(:,j)   = mean(xsirf(:,:,j),2)-mean(xsirfref(:,:,j),2);
    irfxrd(:,j)  = mean(xrdirf(:,:,j),2)-mean(xrdirfref(:,:,j),2);
    irfy3rd(:,j) = mean(y3rdirf(:,:,j),2)-mean(y3rdirfref(:,:,j),2);
end


for j=1:numperiodsrfs;
    irfxf(locx,j)   = mean(exp(xfirf(locx,:,j)),2)-mean(exp(xfirfref(locx,:,j)),2);
    irfxs(locx,j)   = mean(exp(xsirf(locx,:,j)),2)-mean(exp(xsirfref(locx,:,j)),2);
    irfxrd(locx,j)  = mean(exp(xrdirf(locx,:,j)),2)-mean(exp(xrdirfref(locx,:,j)),2);
    irfy3rd(8,j) = mean(exp(y3rdirf(8,:,j)),2)-mean(exp(y3rdirfref(8,:,j)),2);
end

irf3rd=irfxf+irfxs+irfxrd;
irf2nd=irfxf+irfxs;
irf1st=irfxf;

// Plot some results

for ix = 1:size(locy,2);
    irf3rds=smooth(irfy3rd(locy(ix),:)) ;   
    if locy(ix) == 8
        irf3rds = 400*(irf3rds)*infls;
        inflat  = irf3rds ;
    end
    if ix <= 4
        yirf(ix,:) = 100*cumsum(irf3rds(2:end)) ;
    else
        yirf(ix,:) = 100*irf3rds(2:end) ;
    end
end

for ix = 1:4 ;
    irf3rds=smooth(irfy3rd(locy(ix),:)) ;   
end

yirf = [yirf(1:3,:);yirf(5,:);yirf(7,:);yirf(8,:);400*100*Rs*smooth(irf3rd(locx,2:end))';yirf(4,:)];
yirf = yirf(:,1:end) ;
which_ = strvcat('Output','Consumption','Investment','Hours','Marginal Cost','Inflation (BPS)','Nominal Rate (BPS)','Wages') ;
endogz_ = which_ ;
fignum = 2 ;
print_name_= ['taxkcapvola_2std'] ;
make_irfs(yirf, which_, endogz_, fignum, print_name_)