// Title: Trade adjustment and the composition of trade
// Authors: Christopher J. Erceg, Luca Guerrieri and Christopher Gust
// Publication: Journal of Economic Dynamics and Control 

// The SIGMA model is an open economy model used by the Fed for policy simulations
// This file simulates the dynamic response of the model to specific shocks

// Replication of IRF to foreign investment demand shock (via decline in the foreign capital income tax rate)
// Figure 3 in EGG2008
// In the original file the AR parameter of the shock was changed to 0.95 (from 0.9) in line with footnote 11 of EGG2008 

var cc sp2gdp cc2gdp if if2gdp tobq kp kp1 rentks gdp ccd ifd mgsni mgsnic mgsnii rmc 
    rmi rs mcq mpl wmarkup mrs dpq pq dpmf pmf px dw w zetac zetap le rpmpq rpxpq rpmpx 
    rpcpq rpipq dpc pc gdppot gdpgap rs1 rs1f1 rs1f2 rs1f3 rs1f4 rs1f5 rs1f6 rs1f7 rs1f8 
    rs1f9 rs1f10 rs1f11 rs1f12 rs1f13 rs1f14 rs1f15 rs1f16 rs1f17 rs1f18 rs1f19 ronereal 
    r3real rratek nfa er rerpc rerpq dpql1 dpql2 dpql3 dpcl1 dpcl2 dpcl3 dgdp dgdpl1 dgdpl2 
    dgdpl3 prabs prabsdt nshrgdefy nshrgy nshrcy nshriy nshrxy nshrmy ntby dpqyoy dpcyoy 
    dgdpyoy dpqyoya4 dpqyoya4l1 dpqyoya4l2 dpqyoya4l3 dpqyoya4l4 gdpgapa4 gdpgapa4l1 gdpgapa4l2 
    gdpgapa4l3 gdpgapa4l4 pitartl1 pitartl2 pitartl3 pitartl4 glprod ccf cc2gdpf iff if2gdpf 
    tobqf kpf kp1f rentksf gdpf ccdf ifdf mgsnif mgsnicf mgsniif rmcf rmif rsf mcqf mplf wmarkupf 
    mrsf dpqf pqf dpm pm pxf dwf wf zetacf zetapf lef rpmpqf rpxpqf rpmpxf rpcpqf rpipqf dpcf 
    pcf gdppotf gdpgapf rs1f dpql1f dpql2f dpql3f dpcl1f dpcl2f dpcl3f dpqyoyf dpcyoyf dgdpf 
    dgdpl1f dgdpl2f dgdpl3f prabsf prabsdtf dgdpyoyf lamc ccopt cckey taxl debtg lamcf ccoptf cckeyf 
    taxlf debtgf gtech gtechf at gat gatf1 gatf2 gatf3 gatf4 gcx pitar conshk taxk transhk atf gcxf 
    pitarf conshkf taxkf transhkf riskp taxlshkf one gatp gatt gcxp gcxt pitarp pitart conshkp 
    conshkt  taxkp taxkpl1 taxkpl2 taxkt transhkp transhkt gatpf gattf gcxpf gcxtf pitarpf pitartf 
    conshkpf conshktf taxkpf taxkpfl1 taxkpfl2 taxktf transhkpf transhktf riskpp riskpt betashk 
    betashkf impshk impshkf taxlshk taxlshkpf taxlshktf 

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq output outputgap                        //*
//**************************************************************************

// Additional Variables needed for replication
realimp realexp realerpq;


varexo erratp erratt errgcxp errpitarp errpitart errconshkp errconshkt errtaxkp 
       errtaxkt errtranshkp errtranshkt erratpf errattf errgcxpf errgcxtf errpitarpf errpitartf 
       errconshkpf errconshktf errtaxkpf errtaxktf errtranshkpf errtranshktf errriskpp errriskpt 
       errbetashk errbetashkf errimpshk errimpshkf errtaxlshk errtaxlshkpf errtaxlshktf 

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
//**************************************************************************



parameters shrckey shrcy shrgy rbar gzbar popg delta  shriy phik  deltahat phii invfor inddelta tauk defspread cessub shrmy shrmc shrmi etamc          
           phimc forswitch lovparm monlag gampi gamex gamy gamy4 gamgap taul chi shrlab indexp kappap indexm kappax indexw kappaw qcapshr shrlaby rkbar          
           shrckeyf shrcyf shriyf shrgyf shrmyf shrmcf shrmif etamcf etamif phimcf monlagf gamexf gamyf gamy4f gamgapf kappapf kappaxf kappawf sigma phic           
           xsic phid1 phid2 taxlwedgeswitch taxwedgeswitch deltag switchg rho1p  rho1t rho2p rho2t rho3p rho3t rho4p  rho4t rho5p taxkgswitch rho5t rho11p         
           rho11t rho13 rho14 rho15 phid3 phid4 rho15p rho15t cesparm beta thetap thetaw taup phimi prodg etami psip psiw psixf popkey psipf psiwf psix thetapf thetawf
           phimitilde phimctilde phimif phimcf;

//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
//        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
//        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
//        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
//        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
//        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
//        std_r_ std_r_quart;                                              //*
                                                                         //*
// load Modelbase Monetary Policy Parameters                             //*
//	thispath = cd;                                                       //*
//	cd('..');                                                            //*
//	load policy_param.mat;                                               //*
//	cd(thispath);                                                     	 //*
                                                                         //*
//**************************************************************************




forswitch = 0;  //% cost of adjusting imports external if forswitch = 0, internal if forswitch = 1;  (home and foreign) 
switchg = 1;  //% if switchg = 0, govt spending shock is relative to baseline GDP; 
              //% if switchg = 1, govt spending rises with gdp, so shk
              //% is to share (same switch home and foreign)
//labendog = 0;  % if labendog = 1, then distortionary labor tax adjusts to satisfy govt intertemporal budget constraint;
                //% but if labendog = 0, then lump-sum taxes of all agents adjust


taxkgswitch = 1; // % if switch is 1 then errtaxkperr shocks the growth rate of taxkp 
                 //% if switch is 0 then level shock
                 
taxwedgeswitch = 1;  //%if switch = 1, then capital tax shock does not affect gov't revenues
                          //          %if switch = 0, it does
                 
taxlwedgeswitch = 1;// %if switch =1, then labor tax shock does not affect gov't revenues
                        //           % if switch = 0, it does
                                    
invfor = 1;                           
defspread = 0;
lovparm = 0;
popg = 0.0025;
gzbar = 1.0037;             
cesparm = 1;
cessub = -1;
tauk = .3;
taul = .2;
beta = .997;
 //We used NIPA trade data 1995-2004 to estimate the investment and govt
 //spending shares of GDP.  We estimate from NIPA data that about 50 percent of imports consist of consumption
//% goods (assuming durables included in consumption), and 50 percent of
//% investment goods.  We also estimate an average trade share of 12 percent
//% of GDP.  Given implied consumption share of 66 percent (under presumption
//% that trade balance will be achieved solely through a fall in the
//% consumption share), we have
//% .5*shrmy = .5*.12 = .06 = shrmc*shrcy = shrmc*(.66)  IMPLYING shrmc=.09;
//% .5*shrmy = .5*.12 = .06 = shrmi*shriy = shrmi*(.16)  IMPLYING shrmi=.38;
 
shriy = 0.25;
shrgy = .18;
shrmc = 0.052;
shrmi =  0.36;
phic = .8;
xsic = .01;
shrlab = .5;
thetap = .1;
thetaw = .1;
taup  = 0;
sigma = 2;
chi = 10;
delta = .025;
phik = 0;
phii = 3;    //% adjustment costs on investment
phimitilde = 10;
phimctilde = phimitilde;
phimi = phimitilde*(1-shrmi);// % adjustment costs for investment imports
phimc = phimctilde*(1-shrmc);//% adjustment costs for consumption imports
phimif = phimi;
phimcf = phimc;
prodg = 0;
deltag = .025;
etamc = 1.5;   // % elasticity of subst between home consumption goods and imports 
etami = 1.5;
indexp = 1;
indexw = 1;
indexm = 1;
//Calvo parameter
psip = .75;
psiw = .75;
psixf = 0.5;

//% population share of Keynesian agents  = popkey;
popkey = .5;
//% case for which lump-sum taxes on all agents adjust gradually, while labor
//% tax exogenous and follows AR1
//if labendog == 0
phid1 = .0001;
phid2 = .01;
phid3 = 0;
phid4 = 0;
rho15 = .98;
rho15p = .98;
rho15t = 0;
//% case for which labor tax on all agents adjusts gradually, while lump-sum
//% tax exogenous and follows AR1
//if labendog == 1
//phid1 = 0;
//phid2 = 0;
//phid3 = 0;
//phid4 = .02;
//rho15 = 1;
//rho15p = .98;
//rho15t = 0;
monlag = .8;
gampi = .6/(1-.8);
gamex = 0;
gamy = 0;
gamgap = 0;
gamy4 = .28/(1-.8);
rho1p = .975;
rho1t = 0;
rho2p = .975;
//rho2t=0.3;
//Set rho2t=0=> fiscal shock is not autocorrelated
rho2t = 0;
rho3p = .999;
rho3t = 0;
rho4p = .95;
rho4t = .5;
rho5p = .995;
rho5t = 0.95;  //  .9; SEBASTIAN: for replication changed to 0.95 because of footnote 11 in EGG2008
//rho11p = .95;
rho11p = .98;
rho11t = .7;
rho13 = .95;
rho14 = .95;

//parameter aus defver11 Datei

etamcf = etamc;
etamif = etami;
shrcy = 1-shriy - shrgy;  
shrmy = shrmc*shrcy + shrmi*shriy;
deltahat = gzbar*(1+popg) - (1 - delta); 
inddelta = delta;
rbar =  gzbar^sigma/beta -1;
rkbar = (rbar + delta - tauk*inddelta)/(1-tauk);
qcapshr = (1/beta-1+delta)*shriy/delta; //% MODIFY TO ACCOUNT FOR GROWTH
shrlaby = ((1+taup)/(1+thetap)) - qcapshr;
shrckey =  popkey*(1/shrcy)*(shrlaby + tauk*qcapshr*(1-inddelta/rkbar)-shrgy);  //gampif% consumption share of Keynesian agents in total consumption
monlagf = monlag;
gamexf = gamex;
gamyf = gamy;
gamgapf = gamgap;
gamy4f = gamy4;
shriyf = shriy;
shrgyf = shrgy;
shrcyf = 1-shriyf - shrgyf;
shrmcf = shrmc/3;
shrmif =  shrmi/3;
shrmyf = shrmcf*shrcyf + shrmif*shriyf;
psipf = psip;
psiwf = psiw;
psix = psixf;
thetapf = thetap;
thetawf = thetaw;
phimcf = phimc;
shrckeyf = shrckey;
kappap = (1-psip)*(1-psip*beta)/psip;
kappaw = (1-psiw)*(1-psiw*beta)/(psiw*(1+chi*shrlab*(1+thetaw)/thetaw));
kappax = (1-psix)*(1-psix*beta)/psix;
kappapf = (1-psipf)*(1-psipf*beta)/psipf;
kappaxf =  (1-psixf)*(1-psixf*beta)/psixf;
kappawf =  (1-psiwf)*(1-psiwf*beta)/(psiwf*(1+chi*shrlab*(1+thetawf)/thetawf));

model(linear);

// Original Model Code:
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest  = rs*4;                                                        //*
inflation  = dpqyoy;                                                     //*
inflationq = dpq*4;                                                      //*
outputgap  = gdpgap;                                                     //*         
output     = gdp;                                                        //*

//**************************************************************************


// Additional Variables needed for Replication

realimp    = 4*mgsni;                                                    
realexp    = 4*mgsnif;
realerpq   = 4*rerpq;

//**************************************************************************                                                                    
// Policy Rule                                                           //*

//interest =   cofintintb1*interest(-1)                                    //* 
//           + cofintintb2*interest(-2)                                    //* 
//           + cofintintb3*interest(-3)                                    //* 
//           + cofintintb4*interest(-4)                                    //* 
//           + cofintinf0*inflationq                                       //* 
//           + cofintinfb1*inflationq(-1)                                  //* 
//           + cofintinfb2*inflationq(-2)                                  //* 
//           + cofintinfb3*inflationq(-3)                                  //* 
//           + cofintinfb4*inflationq(-4)                                  //* 
//           + cofintinff1*inflationq(+1)                                  //* 
//           + cofintinff2*inflationq(+2)                                  //* 
//           + cofintinff3*inflationq(+3)                                  //* 
//           + cofintinff4*inflationq(+4)                                  //* 
//           + cofintout*outputgap 	                                     //* 
//           + cofintoutb1*outputgap(-1)                                   //* 
//           + cofintoutb2*outputgap(-2)                                   //* 
//           + cofintoutb3*outputgap(-3)                                   //* 
//           + cofintoutb4*outputgap(-4)                                   //* 
//           + cofintoutf1*outputgap(+1)                                   //* 
//           + cofintoutf2*outputgap(+2)                                   //* 
//           + cofintoutf3*outputgap(+3)                                   //* 
//           + cofintoutf4*outputgap(+4)                                   //* 
//           + std_r_ *interest_;                                          //*
                                                                         //*
// Policy Rule (foreign)  
// Note, dpqf is quarterly inflation, not annualized                     //*
//rsf =        cofintintb1*rsf(-1)                                         //*
//           + cofintintb2*rsf(-2)                                         //*
//           + cofintintb3*rsf(-3)                                         //*
//           + cofintintb4*rsf(-4)                                         //*
//           + cofintinf0*dpqf*4                                           //*
//           + cofintinfb1*dpqf(-1)*4                                      //*
//     	   + cofintinfb2*dpqf(-2)*4                                      //*
//           + cofintinfb3*dpqf(-3)*4                                      //*
//           + cofintinfb4*dpqf(-4)*4                                      //*
//           + cofintinff1*dpqf(+1)*4                                      //*
//           + cofintinff2*dpqf(+2)*4                                      //*
//           + cofintinff3*dpqf(+3)*4                                      //*
//     	   + cofintinff4*dpqf(+4)*4                                      //*
//           + cofintout*gdpgapf                                           //*
//     	   + cofintoutb1*gdpgapf(-1)                                     //*
//           + cofintoutb2*gdpgapf(-2)                                     //*
//           + cofintoutb3*gdpgapf(-3)                                     //*
//           + cofintoutb4*gdpgapf(-4)                              	     //*
//           + cofintoutf1*gdpgapf(+1)                                     //*
//           + cofintoutf2*gdpgapf(+2)                               	     //*
//           + cofintoutf3*gdpgapf(+3)                                     //*
//           + cofintoutf4*gdpgapf(+4);                             	     //*
//**************************************************************************

//Home economy

//Government

// Monetary policy rule
rs      =  monlag*rs(-1) + (1-monlag)*(.25*dpqyoy + (gampi-1)*(.25*dpqyoy-pitar) + gamex*(er-er(-1)) + gamy*.25*dgdp  + gamy4*.25*dgdpyoy + gamgap*.25*gdpgap);
//Labor income tax
taxl = taxl(-1) + phid1*debtg + phid2*(debtg - debtg(-1));
//Government budget constraint
debtg = ((1+rbar)/(gzbar*(1+popg)))*debtg(-1) + shrgy*(gcx - gdp) + transhk -  taxl - taul*shrlaby*(zetap + le - gdp) - (1-taxlwedgeswitch) * shrlaby*taxlshk - tauk*qcapshr*(kp(-1) + rentks - gdp - (inddelta/rkbar)*rpipq) - (1-taxwedgeswitch)*qcapshr*taxk;

//Final good producers

//final good aggregator (consumption + investment)
(1-shrmc)*ccd = cc - shrmc*mgsnic;
(1-shrmi)*ifd = if - shrmi*mgsnii;

//imports of consumption goods
mgsnic = rmc + cc;
//imports of investment goods
mgsnii = rmi + if;

// total import composition
shrmy*mgsni   = shrmc*shrcy*mgsnic + shrmi*shriy*mgsnii;



//Intermediate goods firms

//production function (home)
(1-qcapshr)*(le + at) = gdp-qcapshr*kp(-1);
// Flexible price output
gdppot = qcapshr*kp(-1) + (1-qcapshr)*at;
//outputgap
gdpgap = gdp - gdppot;
//Technological progress (home)
at = at(-1) + gatp + gatt;
gat = gatp + gatt;
//permanent and transitory technology shock
gatp = rho1p*gatp(-1) + erratp;
gatt = rho1t*gatt(-1) + erratt ;
gatf1 = gat(+1);
gatf2 = gatf1(+1);
gatf3 = gatf2(+1);
gatf4 = gatf3(+1);

//Phillipscurves
//Domestic price by domestic firm
dpq     = indexp*dpq(-1) + ((1+popg)*gzbar/(1+rbar))*(dpq(+1)-indexp*dpq) + kappap*mcq;
//Foreign price by domestic firm
dpmf =  indexm*dpmf(-1) + ((1+popg)*gzbar/(1+rbar))*(dpmf(+1)-indexm*dpmf) +  kappax*(mcq - rpxpq);


//Households

//total consumption (hand-to-mouth consumers + forward-looking (FL) households)
cc      = (1-shrckey)*ccopt + shrckey*cckey;

//consumption euler equation (FL)
lamc = lamc(+1) + (rs - dpc(+1)) + betashk ;
lamc = -1*sigma*(1/(1-(phic/gzbar)-xsic))*(ccopt - (phic/gzbar)*ccopt(-1) - xsic*(conshk+at));
//hand-to-mouth consumers
cckey =  -rpcpq  + (((1-taul)*shrlaby)/(shrlaby + tauk*qcapshr*(1-inddelta/rkbar)-shrgy))*(zetap + le - (1/(1-taul))*taxlshk  - gdp) + gdp +  (1/(shrlaby + tauk*qcapshr*(1-inddelta/rkbar)-shrgy))*(transhk - taxl);


//Verwendung GDP
gdp     = shrcy*cc + shriy*if + shrgy*gcx + shrmy*(mgsnif -mgsni); 

sp2gdp  = -shrcy*(cc-gdp+rpcpq) - shrgy*(gcx-gdp) + debtg - ((1+rbar)/(gzbar*(1+popg)))*debtg(-1);
cc2gdp  = shrcy * (cc-gdp);
(1- ((1-delta)/(gzbar*(1+popg))))*if = kp - ((1-delta)/(gzbar*(1+popg)))*kp1;
if2gdp  = shriy*(if-gdp+rpipq);
tobq    = rpipq + phik*(deltahat/(1+popg))*(if-kp1) + phii*gzbar*(if-if(-1)) - (1/(1+rbar))*gzbar^2*(1+popg)*invfor*phii*(if(+1)-if); 
tobq    = (1/(1+rbar))*(1-delta)*tobq(+1) - (1/(1+rbar))*(rs - dpq(+1)) + (1/(1+rbar))*(rbar+delta-inddelta*tauk+defspread)*rentks(+1)- (1/(1+rbar))*((rbar+delta-inddelta)/(1-tauk))*taxk(+1) + tauk*inddelta*rpipq(+1) + (1/(1+rbar))*(phik*deltahat^2/(1+popg))*(if(+1) - kp);
kp1     = kp(-1);
rentks  =  zetap - at + (1-cessub)*(le + at - kp(-1));

rmc     = -etamc*rpmpq - (etamc/(1-shrmc))*phimc*(rmc-rmc(-1))+ forswitch*((gzbar*(1+popg))/(1+rbar))*(etamc/(1-shrmc))*phimc*(rmc(+1)-rmc) + (1/(1-shrmc))*impshk  + (lovparm/etamc)*(atf - at);
rmi = -etami*rpmpq - (etami/(1-shrmi))*phimi*(rmi-rmi(-1))+ forswitch*((gzbar*(1+popg))/(1+rbar))*(etami/(1-shrmi))*phimi*(rmi(+1)-rmi) + (1/(1-shrmi))*impshk  +  (lovparm/etami)*(atf - at);

//Marginal cost
mcq     = zetap - mpl;
mpl     =  at + (1-cessub)*(gdp - at- le);
wmarkup =  mrs - zetac + (1/(1-taul))*taxlshk;
mrs     = chi*shrlab*le - lamc;

//domestic price index
pq      =  dpq + pq(-1);

pmf =  dpmf + pmf(-1);

//Prise of domestic exporting firm in domestic currency
px =  pmf + er ;
dw =  indexw*dw(-1) + ((1+popg)*gzbar/(1+rbar))*(dw(+1)-indexw*dw) +  kappaw*wmarkup;
w =  dw + w(-1);
zetac = zetac(-1) + dw - dpc;
zetap = zetap(-1) + dw - dpq;



rpmpq =  pm - pq;

//real exchange rate for domestically produced goods 
rpxpq = px - pq;

rpmpx =  pm - px;
rpcpq = shrmc*rpmpq;
rpipq = shrmi*rpmpq;
dpc = dpq + rpcpq - rpcpq(-1);
pc = dpc + pc(-1);

//outputgap (foreign)
gdpgapf = gdpf - gdppotf;

//quarterly real interest rate (Fisher equation)
rs1 = rs - dpq(+1);
rs1f1 = rs1(+1);
rs1f2 = rs1f1(+1);
rs1f3 = rs1f2(+1);
rs1f4 = rs1f3(+1);
rs1f5 = rs1f4(+1);
rs1f6 = rs1f5(+1);
rs1f7 = rs1f6(+1);
rs1f8 = rs1f7(+1);
rs1f9 = rs1f8(+1);
rs1f10 = rs1f9(+1);
rs1f11 = rs1f10(+1);
rs1f12 = rs1f11(+1);
rs1f13 = rs1f12(+1);
rs1f14 = rs1f13(+1);
rs1f15 = rs1f14(+1);
rs1f16 = rs1f15(+1);
rs1f17 = rs1f16(+1);
rs1f18 = rs1f17(+1);
rs1f19 = rs1f18(+1);

//annual real interest rate
ronereal = (1/4)*(rs1 + rs1f1 + rs1f2 + rs1f3);
//5 year real interest rate
r3real = (1/20)*(rs1 + rs1f1 + rs1f2 + rs1f3 + rs1f4 + rs1f5 + rs1f6 + rs1f7  + rs1f8 + rs1f9 + rs1f10 + rs1f11 + rs1f12 + rs1f13 + rs1f14 + rs1f15+ rs1f16 + rs1f17 + rs1f18 + rs1f19);
rratek = rs - dpq(+1)-shrmi*(rpmpq(+1)-rpmpq);
nfa = ((1+rbar)/(gzbar*(1+popg)))*(nfa(-1) + .25*shrmy*(rpxpq + mgsnif - (pm-pq) - mgsni));

//UIP condition to determine exchange rate
er = er(+1) + rsf - rs  + riskp - .0001*nfa;

//real exchange rate with consumption price index
rerpc = er + pcf - pc;
//real exchange rate with domestic production price index
rerpq = er + pqf - pq;


dpql1 = dpq(-1);
dpql2 = dpql1(-1);
dpql3 = dpql2(-1);
dpcl1 = dpc(-1);
dpcl2 = dpcl1(-1);
dpcl3 = dpcl2(-1);

//growth rate of output
dgdp = gdp - gdp(-1);
dgdpl1 = dgdp(-1);
dgdpl2 = dgdpl1(-1);
dgdpl3 = dgdpl2(-1);

prabs = (shrcy/(shrcy+shriy))*cc + (shriy/(shrcy+shriy))*if;
prabsdt = shrmc*shrcy/shrmy*cc + shrmi*shriy/shrmy*if;
nshrgdefy  = shrgy*(gcx - gdp) + transhk - taxl - taul*shrlaby*(zetap + le - gdp) - shrlaby*taxlshk - tauk*qcapshr*(kp(-1) + rentks - gdp - (inddelta/rkbar)*rpipq)- qcapshr*taxk*(1-taxwedgeswitch);
nshrgy = shrgy*(gcx - gdp);
nshrcy = shrcy*(rpcpq + cc - gdp);
nshriy = shriy*(rpipq + if - gdp);
nshrxy = shrmy*(rpxpq + mgsnif - gdp);
nshrmy = shrmy*(rpmpq + mgsni - gdp);
ntby = shrmy*(rpxpq + mgsnif - mgsni - rpmpq);

//four quarter inflation rate of the GDP-Deflator
dpqyoy = dpq + dpql1 + dpql2 + dpql3;

dpcyoy = dpc + dpcl1 + dpcl2 + dpcl3;

//four quarter growth rate of output
dgdpyoy = dgdp + dgdpl1 + dgdpl2 + dgdpl3 ;
dpqyoya4 = dpqyoy(+4);
dpqyoya4l1 = dpqyoya4(-1);
dpqyoya4l2 = dpqyoya4l1(-1);
dpqyoya4l3 = dpqyoya4l2(-1);
dpqyoya4l4 = dpqyoya4l3(-1);
gdpgapa4 = gdpgap(+4);
gdpgapa4l1 = gdpgapa4(-1);
gdpgapa4l2 = gdpgapa4l1(-1);
gdpgapa4l3 = gdpgapa4l2(-1);
gdpgapa4l4 = gdpgapa4l3(-1);
pitartl1 = pitart(-1);
pitartl2 = pitartl1(-1);
pitartl3 = pitartl2(-1);
pitartl4 = pitartl3(-1);
glprod = gdp - gdp(-1) - (le - le(-1));




//foreign economy
//Government
//Monetary policy rule (foreign)
rsf =  monlagf*rsf(-1)+ (1-monlagf)*(.25*dpqyoyf + (gampi-1)*(.25*dpqyoyf - pitarf)  - gamexf*(er-er(-1)) + gamyf*.25*dgdpf + gamy4f*.25*dgdpyoyf + gamgapf*.25*gdpgapf);


//Final good producers

//final good aggregator (consumption + investment)
(1-shrmcf)*ccdf = ccf - shrmcf*mgsnicf;
(1-shrmif)*ifdf = iff - shrmif*mgsniif;
// total import composition
shrmyf*mgsnif = shrmcf*shrcyf*mgsnicf + shrmif*shriyf*mgsniif ;
//imports of consumption goods
mgsnicf = rmcf + ccf ;
//imports of investment goods
mgsniif = rmif + iff ;



//Intermediate goods firms
//production function
(1-qcapshr)*(lef + atf) = gdpf-qcapshr*kpf(-1);
gdppotf = qcapshr*kpf(-1) + (1-qcapshr)*atf ;
//technological progress (foreign)
atf = atf(-1) + gatpf + gattf;
gatpf = rho1p*gatpf(-1) + erratpf;
gattf = rho1t*gattf(-1) + errattf ;

//foreign phillipscurves
dpqf = indexp*dpqf(-1) + ((1+popg)*gzbar/(1+rbar))*(dpqf(+1)-indexp*dpqf) +  kappapf*mcqf ;
dpm = indexm*dpm(-1) + ((1+popg)*gzbar/(1+rbar))*(dpm(+1)-indexm*dpm) +  kappaxf*(mcqf - rpxpqf) ;


//Households
//total consumption
ccf = (1-shrckeyf)*ccoptf +  shrckeyf*cckeyf;
//consumption euler equation 
lamcf = lamcf(+1) + (rsf - dpcf(+1)) + betashkf;
lamcf = -1*sigma*(1/(1-(phic/gzbar)-xsic))*(ccoptf - (phic/gzbar)*ccoptf(-1) - xsic*(conshkf+atf)) ;
//hand-to-mouth consumers
cckeyf =  -rpcpqf  + (((1-taul)*shrlaby)/(shrlaby + tauk*qcapshr*(1-inddelta/rkbar)-shrgy))*(zetapf + lef - (1/(1-taul))*taxlshkf - gdpf) + gdpf +  (1/(shrlaby + tauk*qcapshr*(1-inddelta/rkbar)-shrgy))*(transhkf - taxlf);

cc2gdpf = shrcyf*(ccf  - gdpf + rpcpqf);
(1- ((1-delta)/(gzbar*(1+popg))))*iff = kpf - ((1-delta)/(gzbar*(1+popg)))*kp1f;
if2gdpf = shriyf*(iff-gdpf+rpipqf);
tobqf = rpipqf + phik*(deltahat/(1+popg))*(iff-kp1f) + phii*gzbar*(iff-iff(-1))- (1/(1+rbar))*gzbar^2*(1+popg)*invfor*phii*(iff(+1)-iff) ;
tobqf = (1/(1+rbar))*(1-delta)*tobqf(+1) - (1/(1+rbar))*(rsf - dpqf(+1))  + (1/(1+rbar))*(rbar+delta-inddelta*tauk+defspread)*rentksf(+1) - (1/(1+rbar))*((rbar+delta-inddelta)/(1-tauk))*taxkf(+1) + tauk*inddelta*rpipqf(+1) + (1/(1+rbar))*(phik*deltahat^2/(1+popg))*(iff(+1) - kpf);
kp1f = kpf(-1);
rentksf =  zetapf - atf + (1-cessub)*(lef + atf - kpf(-1));

//Verwendung GDP
gdpf = shrcyf*ccf + shriyf*iff + shrgyf*gcxf +  shrmyf*(mgsni -mgsnif);

rmcf = -etamcf*rpmpqf - (etamcf/(1-shrmcf))*phimcf*(rmcf-rmcf(-1)) + forswitch*((gzbar*(1+popg))/(1+rbar))*(etamcf/(1-shrmcf))*phimcf*(rmcf(+1)-rmcf) + (1/(1-shrmcf))*impshkf  + (lovparm/etamcf)*(at - atf);
rmif = -etamif*rpmpqf - (etamif/(1-shrmif))*phimif*(rmif-rmif(-1)) + forswitch*((gzbar*(1+popg))/(1+rbar))*(etamif/(1-shrmif))*phimif*(rmif(+1)-rmif) + (1/(1-shrmif))*impshkf  + (lovparm/etamif)*(at - atf);
mcqf = zetapf - mplf;
mplf =  atf + (1-cessub)*(gdpf - atf- lef);
wmarkupf =  mrsf - zetacf +  (1/(1-taul))*taxlshkf;
mrsf  = chi*shrlab*lef - lamcf ;


pqf =  dpqf + pqf(-1) ;
pm =  dpm + pm(-1) ;
pxf =  pm - er ;
dwf = indexw*dwf(-1) + ((1+popg)*gzbar/(1+rbar))*(dwf(+1)-indexw*dwf) +  kappawf*wmarkupf ;
wf =  dwf + wf(-1) ;
zetacf = zetacf(-1) + dwf - dpcf;
zetapf = zetapf(-1) + dwf - dpqf;

rpmpqf =  pmf - pqf ;
rpxpqf = pm - er - pqf;
rpmpxf =  pmf - pm + er; 
rpcpqf = shrmcf*rpmpqf;
rpipqf = shrmif*rpmpqf;
dpcf = dpqf + rpcpqf - rpcpqf(-1);
pcf =  dpcf + pcf(-1) ;

rs1f = rsf - dpqf(+1);
dpql1f = dpqf(-1);
dpql2f = dpql1f(-1);
dpql3f = dpql2f(-1);
dpcl1f = dpcf(-1);
dpcl2f = dpcl1f(-1);
dpcl3f = dpcl2f(-1);
dpqyoyf = dpqf + dpql1f+ dpql2f + dpql3f;
dpcyoyf = dpcf + dpcl1f+ dpcl2f + dpcl3f;
dgdpf = gdpf - gdpf(-1);
dgdpl1f = dgdpf(-1);
dgdpl2f = dgdpl1f(-1);
dgdpl3f = dgdpl2f(-1);
prabsf = (shrcyf/(shrcyf+shriyf))*ccf + (shriyf/(shrcyf+shriyf))*iff;
prabsdtf = shrmcf*shrcyf/shrmyf*ccf + shrmif*shriyf/shrmyf*iff;
dgdpyoyf = dgdpf + dgdpl1f + dgdpl2f + dgdpl3f ;






taxlf = taxlf(-1) + phid1*debtgf + phid2*(debtgf - debtgf(-1));
debtgf = ((1+rbar)/(gzbar*(1+popg)))*debtgf(-1) + shrgyf*(gcxf - gdpf) + transhkf -  taxlf- taul*shrlaby*(zetapf + lef - gdpf) - (1-taxlwedgeswitch) * shrlaby*taxlshkf - tauk*qcapshr*(kpf(-1) + rentksf - gdpf - (inddelta/rkbar)*rpipqf)- (1-taxwedgeswitch)*qcapshr*taxkf;
gtech = (1-deltag)*gtech(-1) + deltag*gcx;
gtechf = (1-deltag)*gtechf(-1) + deltag*gcxf;





//government spending (home)
gcx = switchg*gdp + gcxp + gcxt;
//Fiscal shock (temporary and permanent)
gcxp = rho2p*gcxp(-1) + (1/shrgy)*errgcxp ;
gcxt = rho2t*gcxt(-1) + (1/shrgy)*fiscal_;
//gcxt = rho2t*gcxt(-1) + (1/shrgy)*errgcxt;

//government spending (foreign)
gcxf = switchg*gdpf + gcxpf + gcxtf;
//Fiscal shock (temporary and permanent)
gcxpf = rho2p*gcxpf(-1) + (1/shrgyf)*errgcxpf ;
gcxtf = rho2t*gcxtf(-1) + (1/shrgyf)*errgcxtf;

//inflation target
pitar = pitarp + pitart;
pitarp = rho3p*pitarp(-1) + errpitarp;
pitart = rho3t*pitart(-1) + errpitart;

//inflation target foreign
pitarf = pitarpf + pitartf;
pitarpf = rho3p*pitarpf(-1) + errpitarpf;
pitartf = rho3t*pitartf(-1) +  errpitartf;


conshk = conshkp + conshkt;
taxk = taxkp + taxkt;
transhk = transhkp + transhkt;
conshkf = conshkpf + conshktf;
taxkf = taxkpf + taxktf;
transhkf = transhkpf + transhktf;
riskp = riskpp + riskpt;
taxlshkf = taxlshkpf + taxlshktf;
one = one(-1);
conshkp = rho4p*conshkp(-1) + (1/xsic)*errconshkp;
conshkt = rho4t*conshkt(-1) + (1/xsic)*errconshkt;
taxkp = (rho5p+taxkgswitch) * taxkp(-1) - (rho5p*taxkgswitch)*taxkpl2  - 5.5*errtaxkp;
taxkpl1 = taxkp(-1);
taxkpl2 = taxkpl1(-1);
taxkt = rho5t*taxkt(-1) - 5.5*errtaxkt;
transhkp = rho4p*transhkp(-1) + errtranshkp;
transhkt = rho4t*transhkt(-1) + errtranshkt;
conshkpf = rho4p*conshkpf(-1) + (1/xsic)*errconshkpf;
conshktf = rho4t*conshktf(-1) + (1/xsic)*errconshktf;
taxkpf = (rho5p+taxkgswitch) * taxkpf(-1) - (rho5p*taxkgswitch)*taxkpfl2  - 5.5*errtaxkpf;
taxkpfl1 = taxkpf(-1);
taxkpfl2 = taxkpfl1(-1);
taxktf = rho5t*taxktf(-1) - 5.5*errtaxktf;
transhkpf = rho4p*transhkpf(-1) + (1/shrgyf)*errtranshkpf;
transhktf = rho4t*transhktf(-1) + (1/shrgyf)*errtranshktf;
riskpp = rho11p*riskpp(-1) +  (1-rho11p)*(10/6)*14.5*errriskpp;
riskpt = rho11t*riskpt(-1) +  errriskpt;
betashk = rho13*betashk(-1) -  errbetashk;
betashkf = rho13*betashkf(-1) -  errbetashkf;
impshk = rho14*impshk(-1) +  errimpshk;
impshkf = rho14*impshkf(-1) +  errimpshkf;
taxlshk = taxlshk(-1) +  (rho15-1)*taxlshk(-1) +  phid3*debtg + phid4*(debtg - debtg(-1)) - (1/shrlaby)*errtaxlshk;
taxlshkpf = taxlshkpf(-1) +  (rho15p-1)*taxlshkpf(-1) +  phid3*debtgf + phid4*(debtgf - debtgf(-1)) - (1/shrlaby)*errtaxlshkpf;
taxlshktf = rho15t*taxlshktf(-1) - (1/shrlaby)*errtaxlshktf;
end;

shocks;
//shocks to home economy

//permanent technology shock
var erratp        =1;
//transitory technology shock
var erratt        =1;
//Fiscal shock permanent
var errgcxp       =1;
//Fiscal shock transitory
var fiscal_       =1;
//permanent shock to the inflation target
var errpitarp     =1;
//transitory shock to the inflation target
var errpitart     =1;
var errconshkp    =1;
var errconshkt    =1;
var errtaxkp      =1;
var errtaxkt      =1;
var errtranshkp   =1;
var errtranshkt   =1;
var errriskpp     =1;
var errriskpt     =1;
var errbetashk    =1;
var errimpshk     =1;
var errtaxlshk    =1;
var interest_     =1;

//shocks to foreign economy

//permanent technology shock
var erratpf       =1;
//transitory technology shock
var errattf       =1;
//Fiscal shock permanent
var errgcxpf      =1;
//Fiscal shock transitory
var errgcxtf      =1;
//permanent shock to the inflation target
var errpitarpf    =1;
//transitory shock to the inflation target
var errpitartf    =1;
var errconshkpf   =1;
var errconshktf   =1;
var errtaxkpf     =1;
var errtaxktf     =1;
var errtranshkpf  =1;
var errtranshktf  =1;
var errbetashkf   =1;
var errimpshkf    =1;
var errtaxlshkpf  =1;
var errtaxlshktf  =1;
end;

stoch_simul(irf = 30, nograph, noprint) realimp realexp realerpq ntby;