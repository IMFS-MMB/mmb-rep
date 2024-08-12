//**************************************************************************
// Oil supply shocks and the U.S. economy: An estimated DSGE model
//
// Balke, N., Brown, S. (2018)
//
// Energy Policy, Volume 116, Pages 357-372
//**************************************************************************

// Model: US_BB18

var 
    l                //1.  total labor supply
    c                //2.  total consumption services
    cn               //3.  nondurable and services
    ksc              //4.  capital services in consumption
    ec               //5.  oil efficiecy/intensity in consumption
    oc               //6.  oil consumption in consumption
    kc               //7.  stock of capital (autos) in consumption
    Ic               //8. investment in consumer durables (autos)
    xec              //9. investment in energy efficiency
    yf               //10. output of the final good
    ym               //11. intermediate good output/input
    zm               //12. intermediate good productivity shock
    lm               //13. labor input in intermediate good
    ksm              //14. capital services input in intermediate good
    km               //15. capital stock input in capital services of intermediate good
    Im               //16. investment in intermediate good capital
    om               //17. oil input in intermediate good
    em               //18. oil efficiency/intensity in intermediate good
    xem              //19. investment in oil efficiency intermediate goods
    transf           //20. transportation output/input in production of final good
    ztransf          //21. transportation productivity shock
    lf               //22. labor input in intermediate good
    ksf              //23. capital services input in intermediate good
    kf               //24. capital stock input in capital services of intermediate good
    If               //25. investment in intermediate good capital
    of               //26. oil input in intermediate good
    ef               //27. oil efficiency/intensity in intermediate good
    xef              //28. investment in oil efficiency intermediate goods
    yo               //29. oil production
    zo               //30. oil productivity shock
    lo               //31. labor input in oil
    ko               //32. capital stock input in capital services of oil
    Io               //33. investment in oil capital
    pif              //34. inflation in price of final good
    pm               //35. price of intermediate good
    po               //36. price of oil
    prow             //37. price of foreign final good (in domestic currency)
    rm               //38. price of capital services in intermediate good
    w                //39. wage rate
    lambdac          //40. shadow price of consumption services
    lambdal          //41. shadow price of labor services
    lambdaksc        //42. shadow price capital services for consumption
    lambdakc         //43. shadow price of capital (durables) for consumption
    lambdaec         //44. shadow price of oil efficiency/intensity in consumption
    lambdam          //45. marginal cost of intermediate goods producers
    lambdakm         //46. shadow price of capital for intermediate goods
    lambdaem         //47. shadow price of oil efficiency/intensity in intermediate goods
    lambdakf         //48. shadow price of capital for transportation
    lambdaef         //49. shadow price of oil efficiency/intensity in transportation
    lambdako         //50. shadow price of capital for oil
    M                //51. stochastic discout factor
    h                //52. external habits 
    netexpf          //53. net exports of domestic final good to ROW
    importo          //54. domestic oil imports
    rowsupply        //55. ROW oil supply
    rowdemand        //56. ROW oil demand
    zoil             //57. ROW oil supply shock
    rowgdp           //58. ROW economic activity6
    zdoil            //59. oil demand shock variable
    zrowgdp          //60. shock to row economic activity
    znetexpf         //61. shock to net exports of final good
    mkshock          //62. shock to price markup
    zc               //63. shock to consumption
    R                //64
    zprow            //65
    wf               //66   
    wm               //67
    wo               //68
    g                //69
    zI               //70
    zpermoil         //71
    zrisk            //72

//auxiliary variables

    yfout            //73
    cout             //74
    Iout             //75
    poout            //76
    lout             //77
    usoilprod        //78
    oilimports       //79
    rer              //80
    worldoil    	 //81
    transinvest 	 //82  
    oil_in_c         //83
    oiltrans 	     //84
    netexports       //85
    ROW_y            //86
    int_rate         //87
    pi               //88
    gout             //89
    oilexpend        //90
    usoilcons        //91

// additional variable for sticky wage/price model

    pim                   //92
    lambdatransf          //93
    zksc                  //94
    zksf                  //95 
    zksm                  //96 
    zkso                  //97 
    zf                    //98
    pifstar               //99

; 		                
varexo vzm vzc vzo vzoil vzrowgdp vznetexpf vmk vzprow vzI vzrisk vzdoil vpifstar vR
;
 
parameters    
   shco 
   shfo 
   shmo 
   shoo 
   shcn 
   shfm 
   shfl 
   shol 
   shml 
   soimport 

   soworld 
   wss 
   poss 
   lambdacss 
   lss 
   rowgdpss 
   zoilss 
   zdoilss 
   yfss 
   zfss 

   css 
   zcss
   yoss 
   zoss 
   cnss
   Ifss
   kfss 
   Imss
   kmss
   Ioss 
 
   koss 
   Icss 
   kcss 
   ocss 
   ofss 
   omss 
   ooss 
   lmss 
   lfss 
   loss 

   transfss 
   ztransfss 
   ymss 
   zmss 
   ksfss 
   zksfss 
   kscss 
   zkscss 
   ksmss 
   zksmss 

   ksoss 
   zksoss
   psico  
   psifo  
   psioo 
   psicn 
   psifm 
   psifl
   psiol 
   psiml

   lambdamss
   pmss 
   rmss
   ecss
   efss 
   emss
   eoss 
   xecss 
   xefss 
   xemss 

   xeoss 
   lambdakfss
   lambdakcss 
   lambdakmss 
   lambdakoss
   lambdaecss 
   lambdaefss  
   lambdaemss  
   lambdaeoss 
   lambdakscss 

   prowss
   netexpfss
   importoss
   psimo
   chi
   gss

   pifss
   gshare
   xc               //1.   weight on habit in utility
   thetah
   delta            //2.   depreciation rates on capital
   beta             //3.   discout factor
   rhoc             //5.   e-1/e e=elasticity of substitution in consumption
   rhoksc           //7.   e-1/e=elasticity of substitution in consumption capital services
   rhof             //9.   e-1/e=elasticity of substitution in final goods (between intermediate and transport)
   rhotrans         //11.  e-1/e=elasticity of subsutution between labor and capital services
   rhoksf           //13.  e-1/e=  elasticity of substition rhom psiml psimo rhoksm psiol rhokso psioo
   rhoksm           //18.  e-1/e e=elasticity of substitution in intermediate captial services
   rhokso             //19.  e-1/e e=elasticity of substitution between labor and capital services in oil production
   rhoo             //20.  e-1/e e=elasticity of sbustitution oil capital services
   rhom
   
   af am ao         //xx-xxx adjustment cost parameters for labor allocatioin
   akc              //xxx  adjustment cost parameters for capital in consumption
   aec              //xxx  adjustment cost parameters for oil efficienc in consumption
   akf              //xxx  adjustment cost parameters for capital in transport
   aef              //xxx  adjustment cost parameters for oil efficiency in transport
   akm              //xxx  adjustment cost parameters for capital in intermediate goods
   aem              //xxx  adjustment cost parameters for oil efficiency in intermediate goods
   ako              //xxx  adjustment cost parameters for capital in oil
   aeo              //xxx  adjustment cost parameters for oil efficiency in oil
   bec              //xxx  adjustment cost parameters for oil efficienc in consumption
   bef              //xxx  adjustment cost parameters for oil efficiency in transport
   bem              //xxx  adjustment cost parameters for oil efficiency in intermediate goods
   beo              //xxx  adjustment cost parameters for oil efficiency in oil

mkshockss
markup 
sigma 
eta 
oilsupplyelasticity 
oildemandelasticity 
oilincomeelasticity 
thetaworld1  
thetaworld2  
thetaworldp0   
thetaworldp1   
thetaworldp2  
thetaworldpoil0  
thetaworldpoil1 
thetaworldpoil2  

thetasupply  
thetademand  

srnxelasticity  
tp1 
tp2  
tpne1  
tpne2  
srnxrow0
srnxrow1
srnxrow2  

phiBparam  

rhow 

growth_trend

sdzf
zf1
sdzc
zc1
sdzm
zm1
sdzo
zo1
sdztransf 
ztransf1 
sdzoil
zoil1
sdzrowgdp
zrowgdp1
sdznetexpf
znetexpf1
sdmk
mkshock1
sdvR
sdvec 
sdvef 
sdvem 
sdveo 

Rss
arR1
gammapi
gammay

sdzprow
zprow1
arprow1
arprow2
nxprow0
nxprow1
nxprow2

rowsupplyss 
arg1
sdvg

sdzdoil
zdoil1

sdzI
zI1
zIss

rhocmod 
rhokscmod
rhofmod
rhotransmod
rhoksfmod
rhoksmmod
rhoksomod
rhoomod

markupw

sdzpermoil 
zpermoil1 

sdzrisk 
zrisk1 

alphap
alphaw
indexp
indexw

lambdalss

thetaworldus0 
thetaworldus1
thetaworldus2
thetaworldnx1
thetaworldnx2

srnxpoil0
srnxpoil1
srnxpoil2
srnxus0
srnxus1
srnxus2

rowprow0
rowprow1
rowprow2
poilprow0
poilprow1
poilprow2
yusprow0
yusprow1
yusprow2

rowdemandss
pifstar1
sdpifstar
;

// Steady state variables of the model with frictions
shco=0.3220; 
shfo=0.5000; 
shmo=0.0375; 
shoo=0; 
shcn=0.9068; 
shfm=0.9700; 
shfl=0.5000;
shol=0.1500; 
shml=0.6000; 
soimport=2.0000; 
soworld=0.0860; 
wss=1.6728; 
poss=0.0123; 
lambdacss=0.5788; 
lss=0.3000; 
rowgdpss=1; 
zoilss=319.0740; 
zdoilss=1.4086;
yfss=1; 
zfss=0.9336; 
css=1; 
zcss=1.8020;
yoss=1; 
zoss=54.2341; 
cnss=0.5248;
Ifss=0.0053;
kfss=0.2137; 
Imss=0.2217;
kmss=8.8661;
Ioss=0.0075; 
koss=0.2986; 
Icss=0.0260; 
kcss=1.0418; 
ocss=1.4083; 
ofss=0.6083; 
omss=0.9834; 
ooss=0; 
lmss=0.2899; 
lfss=0.0090; 
loss=0.0011; 
transfss=0.2381; 
ztransfss=1; 
ymss=1.0917; 
zmss=1; 
ksfss=0.4757; 
zksfss=1; 
kscss=1.1621; 
zkscss=1; 
ksmss=7.9765; 
zksmss=1; 
ksoss=0.2986; 
zksoss=1;
psico=0.6609; 
psifo=0.9811; 
psioo=0; 
psicn=0.7540; 
psifm=0.9985; 
psifl=0.1398; 
psiol=0.6490; 
psiml=0.6000; 
lambdamss=0.7404;
pmss=0.8885; 
rmss=0.0405;
ecss=1;
efss=1; 
emss=1;
eoss=1; 
xecss=1; 
xefss=1; 
xemss=1; 
xeoss=1; 
lambdakfss=1;
lambdakcss=1; 
lambdakmss=1; 
lambdakoss=1;
lambdaecss=0.4947;
lambdaefss=0.2137; 
lambdaemss=0.3454; 
lambdaeoss=0; 
lambdakscss=0.0464;
prowss=1;
netexpfss=0.0247;
importoss=2.0000;
psimo=0.0264;
chi=5.4907e+04;
gss=0.1900;

mkshockss = 1;
thetah = 0.1;
xc = 0.7;
markup = 1.2;
markupw = 1.2;
delta =.025;
beta = .99;
sigma = 2;
eta = 1/2;
oilsupplyelasticity = .7;
oildemandelasticity = .7;
oilincomeelasticity = .7;
thetaworld1 = 0.01; 
thetaworld2= 0.01; 
thetaworldp0 = 0.00; 
thetaworldp1 = 0.01; 
thetaworldp2 = 0.01;
thetaworldpoil0 = 0.01;
thetaworldpoil1= 0.01;
thetaworldpoil2 = 0.01;

thetasupply = .8;
thetademand = .8;
srnxelasticity = .4;
tp1 = 0.01;
tp2 = 0.01;
tpne1 = 0.01;
tpne2 = 0.01;
srnxrow = 0.00;
srnxrow1 = 0.01;
srnxrow2 = 0.01;

pifss = 1;
growth_trend = 1.00; % growth factor
phiBparam = .001;
Rss = pifss/beta;

% deep parameters set to match shares 
rhocmod = 1/(1+.1);
rhokscmod = 1/(1+10.1);
rhofmod = 1/(1+.1);
rhotransmod = 1/(1+.1);
rhoksfmod = 1/(1+10.1);
rhoksmmod = 1/(1+10.1);
rhoksomod = 1/(1+10.1);
rhoomod = 1/(1+.1);

rhoc = (rhocmod-1)/rhocmod;
rhoksc = (rhokscmod-1)/rhokscmod;
rhof = (rhofmod-1)/rhofmod;
rhotrans = (rhotransmod-1)/rhotransmod;
rhoksf = (rhoksfmod-1)/rhoksfmod;
rhom = 1/markup;
rhoksm = (rhoksmmod-1)/rhoksmmod;
rhokso = (rhoksomod-1)/rhoksomod;
rhoo = (rhoomod-1)/rhoomod;
rhow = 1/markupw;

aec = shco/(1-shco);
aef = shfo/(1-shfo);
aem = shmo/(1-shmo);
aeo = shoo/(1-shoo);
   bec = 30.01;           //xxx  adjustment cost parameters for oil efficienc in consumption
   bef = 30.01;             //xxx  adjustment cost parameters for oil efficiency in transport
   bem = 30.01;             //xxx  adjustment cost parameters for oil efficiency in intermediate goods
   beo = 30.01;             //xxx  adjustment cost parameters for oil efficiency in oil

sdzf = .1;
zf1 = .7;
sdzc = .1;
zc1 = .7;
sdzm = .1;
zm1 = .7;
sdzo = .1;
zo1 = .7;
sdztransf = .1;
ztransf1 = .7;
sdzoil = .1;
zoil1 = .7;
sdzrowgdp = .1;
zrowgdp1 = 0.0;
sdznetexpf = .1;
znetexpf1 = 0.0;
sdmk = .1;
mkshock1 = .7;
sdvR = .1;
arR1 = .7;
sdvec = .0000000000;
sdvef = .0000000000;
sdvem = .0000000000;
sdveo = .0000000000;


gammapi = 1.5;
gammay = .3;


af = 0.01;
am = 0.01;
ao = 0.01;
akc = 100.01;
akf = 100.01;
akm = 100.01;
ako = 100.01;

sdzprow = .1;
zprow1 = 0.00;

rowsupplyss = ((poss)*oilsupplyelasticity+zoilss)       ; //67.  row supply of oil
arg1 = .7;
sdvg = .1;
gshare = gss/yfss;

sdzdoil = .1;
zdoil1 = .7;
sdzI = .1;
zI1 = .7;
zIss = 0;

sdzpermoil = .1;
zpermoil1 = .99;

zrisk1 = .7;
sdzrisk = .1;
alphap = 100.0;
alphaw = .7;
indexp = .1;
indexw = .1;

lambdalss = rhow*wss;

thetaworld1 = .7; 
thetaworld2 = 0;
thetaworldus0 = 0;
thetaworldus1 = 0.01;
thetaworldus2 = 0;
thetaworldpoil0 = 0;
thetaworldpoil1 = 0.01;
thetaworldpoil2 = 0;
thetaworldnx1 = 0.01;
thetaworldnx2 = 0;

tpne1 = .7;
tpne2 = 0;
srnxrow0 = 0;
srnxrow1 =0.01 ;
srnxrow2 = 0;
srnxpoil0 = 0;
srnxpoil1 = 0.01;
srnxpoil2 = 0;
srnxus0 = 0;
srnxus1 = 0.01;
srnxus2 = 0;

thetaworldp1 = 0.01;
thetaworldp2 = 0;
tp1 = 0.01;
tp2 = 0;

arprow1 = .7;
arprow2 = 0;
nxprow0 = 0;
nxprow1 = 0.01;
nxprow2 = 0;
rowprow0 = 0;
rowprow1 = 0.01;
rowprow2 = 0;
poilprow0 = 0;
poilprow1 = 0.01;
poilprow2 = 0;
yusprow0 = 0;
yusprow1 = 0.01;
yusprow2 = 0;

sdzrowgdp = .1;
sdznetexpf=.1;
sdzprow=.1;

rowsupplyss = (poss/prowss)^oilsupplyelasticity*zoilss; // 
rowdemandss = (poss/prowss)^(-oildemandelasticity)*zdoilss; // 

pifstar1 = .7;
sdpifstar = .1;

model(linear);

// household utility


l = lfss/lss*lf + lmss/lss*lm + loss/lss*lo; //(1)

c-zc-(shcn*cn+(1-shcn)*ksc)=0; //(2)

ksc-zksc - (shco*(ec(-1)+oc)+(1-shco)*kc(-1)) = 0 ; //(3)

h = thetah*h(-1)+(1-thetah)*c(-1); //(4) external habit


//  focs
-(eta*l+lambdac)+(lambdal+(-sigma/(1-xc)*c-(-sigma*xc/(1-xc))*h)) = 0; //(5) foc wrt to l

lambdac+(1-rhoc)*(c-cn)+rhoc*zc = 0; //(6) foc wrt to nondurables

lambdac+(1-rhoc)*(c-ksc)+rhoc*zc-lambdaksc = 0; //(7) foc wrt durable services

lambdaksc + (1-rhoksc)*(ksc-(ec(-1)+oc)) + rhoksc*zksc + ec(-1) - po  = 0; //(8) foc wrt oil

-lambdakc + M(+1) + (1-beta*(1-delta))*(lambdac(+1)+(1-rhoc)*(c(+1)-ksc(+1))+rhoc*zc(+1)+(1-rhoksc)*(ksc(+1)-kc)+rhoksc*zksc(+1)) + beta*(1-delta)*lambdakc(+1) + beta*akc*delta^2*(Ic(+1)-kc)=0; // (9)  foc wrt capital

zI + lambdakc - aec*xecss*xec - akc*delta^2*(Ic -kc(-1)) = 0; // (10) foc wrt to investment

lambdaecss*delta*ecss/xecss*(lambdaec+ec-xec) - aec*Icss*Ic - bec*xecss*Icss*xec = 0; // (11) foc wrt to new efficiency

-(lambdaec+ec) + M(+1) + (1-beta*(1-delta))*(po(+1)+oc(+1)) + beta*(1-delta)*(lambdaec(+1)+ec(+1)) = 0; // (12) foc wrt to total efficiency

kc = delta*(zI+Ic)+(1-delta)*kc(-1); // (13) capital accumulation equation

ec = delta*xec+(1-delta)*ec(-1); //(14) efficiency evolution equation

M(+1)+R-zrisk-pif(+1) = 0; //(15) euler equation domestic bonds

M = zrisk(-1)+(-sigma/(1-xc))*(c-c(-1))-(-sigma*xc/(1-xc))*(h-h(-1))+lambdac(-1)-lambdac ; // (16)

R = (gammapi*(pi)+gammay*yfout)*(1-arR1)+arR1*R(-1)+sdvR*vR; // (17)

w=alphaw*w(-1)+(1-alphaw)*lambdal; // (18) Blanchard and Gali real wage rigidities 

-w - af*(lf-lf(-1)) + beta*af*(lf(+1)-lf) + wf = 0; // (19)

-w - am*(lm-lm(-1)) + beta*am*(lm(+1)-lm) + wm = 0; // (20)

-w - ao*(lo-lo(-1)) + beta*ao*(lo(+1)-lo) + wo = 0; // (21)


// final goods producer

yf-zf-(shfm*ym+(1-shfm)*transf)=0; //(22) final goods

transf-ztransf - (shfl*lf+(1-shfl)*ksf) = 0 ; //(23) transport

ksf-zksf - (shfo*(ef(-1)+of)+(1-shfo)*kf(-1)) = 0 ; //(24) transport capital servies


(1-rhof)*(yf-transf)+rhof*zf-lambdatransf = 0; //(25) demand for transport

(1-rhof)*(yf-ym)+rhof*zf-pm = 0; //(26) demand for intermediate goods

lambdatransf+(1-rhotrans)*(transf-lf)+rhotrans*ztransf-wf = 0; //(27) demand for labor

lambdatransf + (1-rhotrans)*(transf-ksf)+rhotrans*ztransf+(1-rhoksf)*(ksf-(ef(-1)+of)) + rhoksf*zksf + ef(-1) - po = 0; //(28) foc wrt oil

-lambdakf + M(+1) + (1-beta*(1-delta))*(lambdatransf(+1)+(1-rhotrans)*(transf(+1)-ksf(+1))+rhotrans*ztransf(+1)+(1-rhoksf)*(ksf(+1)-kf)+rhoksf*zksf(+1)) + beta*(1-delta)*lambdakf(+1) + beta*akf*delta^2*(If(+1)-kf)=0; // (29)  foc wrt capital

zI + lambdakf - aef*xefss*xef - akf*delta^2*(If-kf(-1)) = 0; // (30) foc wrt to investment

lambdaefss*delta*efss/xefss*(lambdaef+ef-xef) - aef*Ifss*If - bef*xefss*Ifss*xef = 0; //(31) foc wrt to new efficiency

-(lambdaef+ef) + M(+1) + (1-beta*(1-delta))*(po(+1)+of(+1)) + beta*(1-delta)*(lambdaef(+1)+ef(+1)) = 0; // (32) foc wrt to total efficiency

kf = delta*(zI+If)+(1-delta)*kf(-1); // (33) capital accumulation equation

ef = delta*xef+(1-delta)*ef(-1); // (34) efficiency evolution equation

//  intermediate goods producers

ym = zm+psiml*lm+(1-psiml)*ksm ; // (35)
lm = lambdam-wm+ym; //(36)
ksm = (lambdam-rm+ym) ; //(37)

-alphap*pifss^((1-indexp)*2)*(pim-indexp*pim(-1)) + beta*alphap*pifss^((1-indexp)*2)*(pim(+1)-pim) + (lambdam+mkshock-pm)/(1-rhom) = 0 ; // (38)
pim = (pm-pm(-1))+pif; //(39)

//  capital services producer

ksm-zksm - (shmo*(em(-1)+om)+(1-shmo)*km(-1)) = 0 ; //(40) intermediate capital servies

rm + (1-rhoksm)*(ksm-(em(-1)+om)) + rhoksm*zksm + em(-1) - po = 0; //(41) foc wrt oil

-lambdakm + M(+1) + (1-beta*(1-delta))*(rm(+1)+(1-rhoksm)*(ksm(+1)-km)+rhoksm*zksm(+1)) + beta*(1-delta)*lambdakm(+1) + beta*akm*delta^2*(Im(+1)-km)=0; // (42)  foc wrt capital

zI + lambdakm - aem*xemss*xem - akm*delta^2*(Im -km(-1)) = 0; // (43) foc wrt to investment

lambdaemss*delta*emss/xemss*(lambdaem+em-xem) - aem*Imss*Im - bem*xemss*Imss*xem = 0; // (44) foc wrt to new efficiency

-(lambdaem+em) + M(+1) + (1-beta*(1-delta))*(po(+1)+om(+1)) + beta*(1-delta)*(lambdaem(+1)+em(+1)) = 0; // (45) foc wrt to total efficiency

km = delta*(zI+Im)+(1-delta)*km(-1); // (46) capital accumulation equation

em = delta*xem+(1-delta)*em(-1); // (47) efficiency evolution equation



// domestimc oil producers


yo-zo - (shol*lo+(1-shol)*ko(-1)) = 0 ; //(48) CES for oil production

po+(1-rhoo)*(yo-lo)+rhoo*zo-wo = 0; //(49) demand for labor

-lambdako + M(+1) + (1-beta*(1-delta))*(po(+1)+(1-rhoo)*(yo(+1)-ko)+rhoo*zo(+1)) + beta*(1-delta)*lambdako(+1) + beta*ako*delta^2*(Io(+1)-ko)=0; // (50)  foc wrt capital

zI + lambdako - ako*delta^2*(Io -ko(-1)) = 0; // (51) foc wrt to investment

ko = delta*(zI+Io)+(1-delta)*ko(-1); // (52) capital accumulation equation


//market clearing

yf - cnss/yfss*cn - aec*xecss*Icss/yfss*xec - Icss/yfss*Ic - aef*xefss*Ifss/yfss*xef - Ifss/yfss*If - aem*xemss*Imss/yfss*xem - Imss/yfss*Im - Ioss/yfss*Io - (netexpfss/yfss)*netexpf -  gss/yfss*g = 0;  // (53) final goods

yo - ocss/yoss*oc - ofss/yoss*of - omss/yoss*om + importoss/yoss*importo = 0; // (54) domestic oil

importoss*importo - rowsupplyss*rowsupply + rowdemandss*rowdemand = 0; // (55)

rowsupply = thetasupply*rowsupply(-1)+((oilsupplyelasticity*(po-prow))+zoil+zpermoil)*(1-thetasupply); // (56) row supply of oil
rowdemand = thetademand*rowdemand(-1)+(-oildemandelasticity*(po-prow)+zdoil+rowgdp*oilincomeelasticity)*(1-thetademand); // (57) row demand for oil

rowgdp= thetaworld1*rowgdp(-1) + thetaworldnx1*(netexpf(-1) - po(-1)-importo(-1)) + thetaworldp1*prow(-1) + thetaworldpoil0*po+ thetaworldpoil1*po(-1) + thetaworldus0*yf + thetaworldus1*yf(-1) +  zrowgdp ; %// (58) world gdp
netexpf = po+importo+tpne1*(netexpf(-1) - po(-1)-importo(-1)) + srnxrow0*rowgdp + srnxrow1*rowgdp(-1) + tp1*prow(-1)  + srnxpoil0*po + srnxpoil1*po(-1) + srnxus0*yf + srnxus1*yf(-1) + znetexpf ; %// (59);
prow=rowprow0*rowgdp + rowprow1*rowgdp(-1)  + nxprow0*(netexpf - po-importo)  + nxprow1*(netexpf(-1) - po(-1)-importo(-1)) + arprow1*prow(-1) + poilprow0*po + poilprow1*po(-1) + yusprow0*yf + yusprow1*yf(-1) + zprow  ; %// (60) world gdp

// exogenous shock processes

//g = (sdvg*vg)+g(-1)*arg1; // (61)
g = 0;
zc = (sdzc*vzc)+(zc(-1))*zc1; //(62)
zm = (sdzm*vzm)+(zm(-1))*zm1; //(63)
zo = (sdzo*vzo)+(zo(-1))*zo1; //(64)
//ztransf = (sdztransf*vztransf)+(ztransf(-1))*ztransf1; //(65)
ztransf = 0;
zoil = (sdzoil*vzoil)+(zoil(-1))*zoil1; //(66)
zrowgdp = sdzrowgdp*vzrowgdp; //(67)
znetexpf = sdznetexpf*vznetexpf; //(68)
mkshock = (sdmk*vmk)+(mkshock(-1))*mkshock1; //(69)
zdoil = (sdzdoil*vzdoil)+(zdoil(-1))*zdoil1; //(70)
zprow = sdzprow*vzprow;       //(71)
zI = (sdzI*vzI)+(zI(-1))*zI1; //(72)
//zpermoil = (sdzpermoil*vzpermoil)+(zpermoil(-1))*zpermoil1; //(73)
zpermoil = 0; // (73)
zrisk = (sdzrisk*vzrisk)+(zrisk(-1))*zrisk1; // (74)


//auxiliary variables

yfout = (yf*yfss/(yfss-poss*importoss+poss*ocss)) - importo*poss*importoss/(yfss-poss*importoss+poss*ocss) + oc*poss*ocss/(yfss-poss*importoss+poss*ocss); // (75) GDP

cout = cnss/(cnss+Icss+poss*ocss)*cn+aec*xecss*Icss/(cnss+Icss+poss*ocss)*xec+Icss/(cnss+Icss+poss*ocss)*Ic+poss*ocss/(cnss+Icss+poss*ocss)*(po+oc) - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); // (76)

Iout = aef*xefss*Ifss/(Ifss+Imss+Ioss)*xef+Ifss/(Ifss+Imss+Ioss)*If + aem*xemss*Imss/(Ifss+Imss+Ioss)*xem+Imss/(Ifss+Imss+Ioss)*Im + Ioss/(Ifss+Imss+Ioss)*Io - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(77)

poout = (1+poss*(importoss-ocss))/(yfss-poss*(importoss-ocss))*po; //(78)

lout = lmss/lss*lm + lfss/lss*lf + loss/lss*lo;  //(79)

usoilprod = yo; //(80)

oilimports = (po+importo) - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(81)

rer = prow; //(82)

worldoil = rowsupply; //(83)

transinvest = aef*xefss*Ifss/(Ifss)*xef+If - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(84)

oil_in_c = (po+oc)  - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(85)

oiltrans = ocss/(ocss+ofss)*oc + ofss/(ocss+ofss)*of - (ocss/(ocss+ofss+omss)*oc + ofss/(ocss+ofss+omss)*of + omss/(ocss+ofss+omss)*om); //(86)

netexports = netexpfss/(yfss-poss*(importoss-ocss))*netexpf - netexpfss/(yfss-poss*(importoss-ocss))*(po+importo) - netexpfss/(yfss-poss*(importoss-ocss))*(yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(87)

ROW_y = rowgdp; //(88)

int_rate = (R-(pifstar+pif - (po-po(-1))*poss*importoss/(yfss-poss*(importoss-ocss)) + (po-po(-1))*poss*ocss/(yfss-poss*(importoss-ocss)))); // (89);

pi = pifstar+(pif- (po-po(-1))*poss*importoss/(yfss-poss*importoss+poss*ocss) + (po-po(-1))*poss*ocss/(yfss-poss*(importoss-ocss))); // (90);

gout = g - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(91)

oilexpend = (po+(ocss*oc+ofss*of+omss*om)/(ocss+ofss+omss)) - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(92)

usoilcons = (ocss*oc+ofss*of+omss*om)/(ocss+ofss+omss); //(93)

zksc = 0; //(94)
zksf = 0; //(95)
zksm = 0; //(96)
zkso = 0; //(97)
zf = 0;  //(98)
pifstar = pifstar1*pifstar(-1)+sdpifstar*vpifstar; //(99)

end;

shocks;
var vzc = 1;
var vzm = 1;
var vzo = 1;
var vzoil = 1;
var vzrowgdp = 1;
var vznetexpf = 1;
var vmk = 1;
var vR = 1;
var vzprow = 1;
var vzdoil = 1;
var vzI = 1;
var vzrisk = 1;
var vpifstar = 1;
end;


//stoch_simul(order = 1,k_order_solver,print,nograph,irf=0);

stoch_simul(order = 1,irf_shocks=(vR),irf=50) yf R pi;