//This model file contains the linearized Version of the FRB-US Model. 
//The model equations and parameters are equal to the ones used in LWW.
// This file simulates the dynamic response of the model to specific shocks


var xgap2 picnia rffe drffe xgap lur fpxr dlfpxr dlfpx	pcr qec ec qsdv ecdv 
    ecdo eh kcd kh epd	kpd vpd	eps kps	kimt kio ex hgxemo emo fninr xgdp xp 
    xb vpda veoa lhp lep lf leor lurnat xgpot xgdpt xgdpnr jccanr yhibnr ynicpnr 
    ynidnr yhpntnr ypnr qpxpr dlpxp qplr plr dlpl pmor pcengr pgasr pxbr plminr 
    pxp gftrd rgfint gfdefnr gfdbtnr gstrd	gsdbtnr trsci trssi trsib trfci 
    rtbe rme rcar rg5es rg10es rcbes rdp lwpss fgdp dlfpc poilr trfpt trfp 
    trspt trsp egfi egfo egfos egfl egsi egso egsl rfftay rffvar rstar rtr 
    pitarg ptr zertay zervar zec1  lzec1 zgapc1 lzgapc1 zec2 lzec2 zgapc2 
    lzgapc2 zsdv lzsdv zrccdv lzrccdv zec3 lzec3 zgapc3	lzgapc3	zrccdo	lzrccdo
    zec4 lzec4 zrcch lzrcch	zvpd lzvpd zvpdl2  zxb lzxb zxbl2 zdxb lzdxb zdxbl2 
    zpib5 lzpib5 zkimt lzkimt zlhp lzlhp zyh zyhp zyht zynid lzynid zpl lzpl 
    zpxp lzpxp zpxpl2 zlur1 lzlur1 zlur1l2	zlur2 lzlur2 zgap05 zgap10 zgap30 
    zpi05 zpi10 zpi30 zrff05 zrff10 zrff30 zdivgr cashfl one qecl2 qecl4 picnial2 
    picnial4 picnial6 picnial8 picnia10 rffel2 pcl2 xgap2l2 epdl2 epsl2 dxbl1 
    dxbl3 dxbl5 kimtl2 vpdl2 vpdl4 vpdl6  vpdl8 vpdl10 pcengrl2 pcengrl4 pcengrl6 
    pcengrl8 pcengr10 dlepl1 dlepl3 dlepl5 dlpll2 dlpxpl2 pmorl2 pxbrl2 dlfpcl2 
    dlfpxl2 egfil2 egfll2 egfol2 egsil2 egsll2 egsol2 xgapl2 fgdpl2 fgdpl4 
    fgdpl6 pgasrl2 pcrl2 gfdbtyl2 gfdbtyl4 gsdbtyl2 gsdbtyl4 xothtl2 xothtl4 
    xothtl6 xothtl8 xothtl10 pcf2 xgap2f2 xgap2f4 xgap2f6 picniaf2 picniaf4 
    picniaf6 qplrf2 dlpxpf2 xbf2 ltfpt poilrs zkimtl2 zpll2 zlur2l2 pxgr yhp 
    gsintnr tfpnr ecnd ei fcbnr leh yht rg5e rg10e rcbe lwps egf egs ecd em
    lprdgt qlhp qyhibnr yniinr qynidnr	qpxgr qpmor rgsint eg xg ecnia xbnr 
    xgnr yninr yhinr tryh yhl yh pgdpr gfintnr tspnr gssrpnr wpo

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq outputgap output;                       //*
//**************************************************************************

varexo ec_ ecdo_ ecdv_ eh_ epd_	eps_ kimt_ kio_	ex_ emo_ lhp_ lep_ lf_ leor_ 
       yhibnr_ ynidnr_ dlpxp_ dlpl_ pmor_	pcr_ pcengr_ pgasr_ gftrd_ rgfint_ 
       trfp_  trfci_ gstrd_ trsp_ trsci_ trsib_ trssi_ rg5e_ rg10e_ rcbe_ rtbe_	
       rme_ rcar_ lwps_ rdp_ dlfgdp_ dlfpc_ poilr_ egfi_ egfl_ fiscal_ egsi_ 
       egsl_ egso_ dlfpxr_ rffvar_ interest_ ptr_ rtr_;	

//**************************************************************************
// Modelbase Shocks                                                      //*       
        // the Modelbase Shocks can be found above for not having to    //*
         // change the order of the variance covariance matrix           //*
//************************************************************************** 

parameters stockoff pcrec pgasrec pwfix	iscurve shortlag xgaprho datet anton 
	   taxon yhpntfix ltfpt1 plminr1 lurnat1 dmptay	dmpvar	qsector	gsector 
       gshock4	egfo1	poilr4	poilr1  rstar1	rstarsh pitarg1	rtr1 dptr ptr1 
       rg5e1 rg10e1	rcbe1	lwps1	trfpt1	trfpt2	trspt1	trspt2 leadpi20 
       leadpi19 leadpi18 leadpi17 leadpi16 leadpi15 leadpi14 leadpi13 leadpi12 
       leadpi11 leadpi10 leadpi9  leadpi8  leadpi7 leadpi6 leadpi5 leadpi4 
       leadpi3 leadpi2 leadpi1 leadpi0 	   lagpi1 lagpi2 lagpi3	 lagpi4 leadpi1l 
       laginfo leadinfo tayr1	tayr2 tayr3 tayr4 taypm20 taypm19 taypm18 taypm17 
       taypm16 taypm15 taypm14 taypm13 taypm12 taypm11 taypm10 taypm9 taypm8 
       taypm7 taypm6 taypm5	taypm4	taypm3 taypm2 taypm1 tayp0 tayp1 tayp2 
       tayp3 tayp4 tayp8 tayp12	tayp16	tayplm4 tayplm3	tayplm2	tayplm1	taypl0
       taypl1 taypl2 taypl3 taypl4 tayxm8 tayxm7 tayxm6 tayxm5 tayxm4 
       tayxm3 tayxm2 tayxm1 tayx0 tayx1 tayx2 tayx3 tayx4 tayu1 tayre0 taymu0
       taymu1 taye0	taysp0	tayg0 tayc0 tayfi0 tayii0 sprule tayul4 tayul3 
       tayul2 tayul1 tayu0 tayrl0 bfi1  bfi2  kcd1 kcd2 ecd1 ecd2 kh1 kh2  
       ecnia1 ecnd1 ecnd2 kpd1 kpd2 kps1 kps2 fcbn1 fcbn2 fcbn3 fcbn4 emn1 
       emn2 emp1 emp2 fynin1 fynin2 fnin1 fnin2 fpxr1 xgdp1 xgdp2 xgdp3 xgdp4 
       xgdp5 xgdp6 xgdp7 xgdp8 xgdp9  xgdp10 ki1  ki2 em1  em2 xp1 xp2 xp3 
       xp4 xp5 xp6 xp7 xp8  xp9 xb1  xb2  xb3 xgv1 xgv2 xg1 xg2 xg3 vpda1  
       vpda2 leh1 leh2 leh3  leh4 lur1  xgpot1  xgpot2 xgpot3  xgpot4 xgdpn1 
       xgdpn2  xgdpn3 xgdpn4 xgdpn5 xgdpn6  xgdpn7 xgdpn8 xbn1  xbn2  xbn3 
       xgn1 xgn2 xgn3  xgn4 xgn5  jccan1  jccan2 jccan3  ynin1  ynin2 ynin3  
       ynin4 ynin5  ynin6 ynin7 qyhibnr1 qyhibnr2  qyhibnr3 yhinr1  yhinr2
	   yhinr3  yhinr4 ynicpn1  ynicpn2  ynicpn3  ynicpn4 qynid1  qynid2  qynid3 
       yhln1  yhln2 yhln3  yniln1 yniln2 yniln3  ypn1  ypn2  ypn3 ypn4 ypn5 
       ypn6 ypn7  ypn8 ypn9  ypn10 gfptn1 gsptn1 yhpntn1 yhpntn2  yhpntn3  
       yhpntn4 yhpntn5 yhpntn6  yhpntn7  yhpntn8  yhpntn9  tryh1 tryh2  tryh3 
       tryh4  yhptn1 yhptn2 yhptn3 yhl1  yhp1 yhp2 yhp3 yh1  yh2  yh3 yhtn1 
       yhtn2 qpxp1  qpxp2 qpxp3 qpxp4 qpxp5  qpxp6  qpxp7 qpxp8  qpxp9 qpxp10 
       dlpxp1 dlpxp2  dlpcr1 xgdpt1  xgdpt2 xotht1 xotht2 xotht3 gfintn1  
       trfp1  tfpn1 tfpn2 tfpn3 tfpn4  gfdefn1 gfdefn2 gfdefn3 gfdefn4 gfdefn5  
       gfdefn6  gfdefn7 gfdefn8 gfdefn9 gfdefn10 gfdefn11 gfdbtn1 gfdbtn2  
       gfdbtn3  gsintn1   gsintn2   trsp1   tspn1 tspn2  tspn3  tspn4  trsib1  
       trsci1 trfci1 trssi1  gssrpn1 gssrpn2 gssrpn3 gssrpn4 gssrpn5 gssrpn6 
       gssrpn7  gssrpn8 gssrpn9 gssrpn10 gssrpn11 gsdbtn1  gsdbtn2  gsdbtn3  
       wpo1 wpo2 wpo3  wpo4 wpo5 wpo6  eg1 eg2 egf1 egf2 egf3 egs1 egs2  egs3 
       profit1 profit2 profit3 profit4  rg51 rtb1

//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        std_r_ std_r_quart;                                              //*
                                                                         //*
// LWW-Rule
cofintintb1 =  0.755226; 
cofintintb2 = 0; 
cofintintb3 = 0; 
cofintintb4 = 0;
cofintinf0 = 0.602691;
cofintinfb1 = 0; 
cofintinfb2 = 0; 
cofintinfb3 = 0; 
cofintinfb4 = 0; 
cofintinff1 = 0; 
cofintinff2 = 0; 
cofintinff3 = 0; 
cofintinff4 = 0;                           
cofintout = 1.17616; 
cofintoutb1 = -0.972390; 
cofintoutb2 = 0; 
cofintoutb3 = 0; 
cofintoutb4 = 0; 
cofintoutf1 = 0; 
cofintoutf2 = 0; 
cofintoutf3 = 0; 
cofintoutf4 = 0;
std_r_ = 1;
std_r_quart = 0.25;                 
//**************************************************************************

stockoff = 0;
pcrec	= 0.1;
pgasrec	= 0.1;
pwfix	=  0;
iscurve =  0;
shortlag = 0;
xgaprho =  0;
datet	=  0; //% datet=1: Model-Consistent solution based on time t expectations; 
              //% datet=0: Same timing as in VAR expectations
//vara	=  0; //% VAR expectations for sector "x"
//varb	=  0;
//vard	=  0;
//varg	=  0;
//varj	=  0;
//vark	=  0;
//varm	=  0;
//varn	=  0;
anton	=  1; //% anton=1: Time-varing risk premium for bond/equity return
taxon	=  1; //% taxon=1: Tax non-neutralities in place; taxon=0: non-neutralities removed (eh,epd)
yhpntfix=  0; //% 
ltfpt1  =  0; //% Autocorrelation coefficient of ltfpt
plminr1	=  0; //% Autocorrelation coefficient of plminr
lurnat1 =  0; //% Autocorrelation coefficient of lurnat
dmptay	=  1; //% Monetary Policy switch: Generalized Taylor reaction function
dmpvar	=  0; //% Monetary Policy switch: 1963-94 reaction function
qsector	=  1; //% Switch for Stochastic Simulations: Ad hoc forecasting equations (usually exog.)
gsector =  1; //% Switch for Stochastic Simualtions: Ad hoc government forecasting equations (usually exog.)
gshock4	=  0; //% 4-qrt Federal Government spending shock (gsector=0, egfo1=1)
egfo1	=  0; //% Autocorrelation coefficient of egfo shock (gsector=0)
poilr4	=  0; //% 4-qrt Oil-price shock (qsector=0, poilr1=1)
poilr1  =  0; //% Autocorrelation coefficient of poilr

rstar1	=  0.95;  
rstarsh =  0; 
pitarg1	=  1;
rtr1	=  rstar1;

dptr    =  1 ;//% Dummy for updating rule for trend inflation (1 use picnia; 0 use rffe surprises)
ptr1	=  0;	
rg5e1	=  0.8370; //% Autocorrelation coefficient of bond/equity residuals
rg10e1	=  0.8552; //% Autocorrelation coefficient of bond/equity residuals
rcbe1	=  0.8930; //% Autocorrelation coefficient of bond/equity residuals
lwps1	=  0.9131;// % Autocorrelation coefficient of bond/equity residuals
trfpt1	=  0.05; //% tax rate reaction functions to debt/GDP
trfpt2	=  0.50; //% tax rate reaction functions to debt/GDP
trspt1	=  0.05;// % tax rate reaction functions to debt/GDP
trspt2	=  0.50; //% tax rate reaction functions to debt/GDP

%tayr1	=  0.620293583474;    // % Coefficient on first lag rffe 
%tayr2	= -0.0578095589655;   // % Coefficient on second lag rffe
%tayr3	=  0.246517098053;    // % Coefficient on third lag rffe
%tayr4	=  0.0672965169207;   // % Coefficient on fourth lag rffe
%tayp0	= -0.0920562089085;  //  % Coefficient on current picnia
%tayp1	=  0.17135465387;    //  % Coefficient on first lag picnia
%tayp2	=  0.0689014399685;   // % Coefficient on second lag picnia
%tayp3	=  0.226770600238;    // % Coefficient on third lag picnia
%tayx0	=  0.840416045966;    // % Coefficient on current xgap2
%tayx1	= -0.206994650785;   //  % Coefficient on first lag xgap2 
%tayx2	= -0.102521604026;   //  % Coefficient on second lag xgap2
%tayx3	= -0.271316618104;   //  % Coefficient on third lag xgap2 

leadpi20 = 0;
leadpi19 = 0;
leadpi18 = 0;
leadpi17 = 0;
leadpi16 = 0;
leadpi15 = 0;
leadpi14 = 0;
leadpi13 = 0;
leadpi12 = 0;
leadpi11 = 0;
leadpi10 = 0;
leadpi9  = 0;
leadpi8  = 0;
leadpi7	 = 0;
leadpi6	 = 0;
leadpi5	 = 0;
leadpi4	 = 0;
leadpi3	 = 0;
leadpi2	 = 0;
leadpi1	 = 0;
leadpi0	 = 0.25;
lagpi1	 = 0.25;
lagpi2	 = 0.25;
lagpi3	 = 0.25;
lagpi4   = 0;
leadpi1l = 0;

laginfo	=	0;
leadinfo=	0;

tayr1	=	0.755226 //0.76;

tayr2	=	0;
tayr3	=	0;
tayr4	=	0;

taypm20 =	0;
taypm19 =	0;
taypm18 =	0;
taypm17 =	0;
taypm16 =	0;
taypm15 =	0;
taypm14 =	0;
taypm13 =	0;
taypm12 =	0;
taypm11 =	0;
taypm10 =	0;
taypm9	=	0;
taypm8	=	0;
taypm7	=	0;
taypm6	=	0;
taypm5	=	0;
taypm4	=	0;
taypm3  =       0;
taypm2	=       0;
taypm1	=       0;
tayp0	=       -.24/4+0.6/4;
tayp1	=       -.24/4+0.6/4;
tayp2   =       -.24/4+0.6/4;
tayp3	=       -.24/4+0.6/4;
tayp4	=       0;
tayp8	=       0;
tayp12	=       0;
tayp16	=       0;
tayplm4 =       0;
tayplm3	=       0;
tayplm2	=       0;
tayplm1	=       0;
taypl0	=       0;
taypl1  =       0;
taypl2	=       0;
taypl3	=       0;
taypl4	=       0;
tayxm8	=       0;
tayxm7  =       0;
tayxm6	=       0;
tayxm5	=       0;
tayxm4	=       0;
tayxm3  =       0;
tayxm2	=       0;
tayxm1	=       0;
tayx0	=       .21+.97;
tayx1	=       -0.97;
tayx2   =       0;
tayx3	=       0;
tayx4	=       0;
tayu1	=       0;
tayre0	=       0;
taymu0  =       0;
taymu1	=       0;
taye0	=       0;
taysp0	=       0;
tayg0	=       0;
tayc0	=	0;
tayfi0	=	0;
tayii0	=	0;

sprule = 0;
tayul4 = 0;
tayul3 = 0;
tayul2 = 0;
tayul1 = 0;
tayu0 =  0;
tayrl0 = 0;

  tayr1=.755226;
  tayx0=1.17616;
  tayx1=-.972390;
  tayp0=(.602691 -(1-tayr1))/4;
  tayp1=tayp0;
  tayp2=tayp0;
  tayp3=tayp0;


//% Generated coefficients (read sequentially)
bfi1      = .68056348     ;
bfi2      = .31943652     ;
kcd1      = .93721434     ;
kcd2      = .06278566     ;
ecd1      = .44077560     ;
ecd2      = .55922440     ;
kh1       = .98978554     ;
kh2       = .01021446     ;
ecnia1    = .12047082     ;
ecnd1     = 1.14359537    ;
ecnd2     =-.14359537     ;
kpd1      = .95985142     ;
kpd2      = .04014858     ;
kps1      = .98838228     ;
kps2      = .01161772     ;
fcbn1     =-2.54512198    ;
fcbn2     = 3.13210071    ;
fcbn3     =-.03289195     ;
fcbn4     = .44591322     ;
emn1      = .92272463     ;
emn2      = .07727537     ;
emp1      = 3.11652818    ;
emp2      =-2.11652818    ;
fynin1    =-.06424199     ;
fynin2    = 1.06424199    ;
fnin1     = .95827950     ;
fnin2     = .04172050     ;
fpxr1     =-.13957302     ;
xgdp1     = .67574562     ;
xgdp2     = .03969842     ;
xgdp3     = .06552009     ;
xgdp4     = .03068730     ;
xgdp5     = .69733377     ;
xgdp6     =-.69399198     ;
xgdp7     = .09208808     ;
xgdp8     =-.10731455     ;
xgdp9     = .08513153     ;
xgdp10    = .11510172     ;
ki1       = .76537201     ;
ki2       = .23462799     ;
em1       = .92174151     ;
em2       = .07825849     ;
xp1       = .64929495     ;
xp2       = .04336245     ;
xp3       = .07144055     ;
xp4       = .03355846     ;
xp5       = .10030112     ;
xp6       = .01322110     ;
xp7       = .04229194     ;
xp8       = .02216026     ;
xp9       = .02436917     ;
xb1       = 1.20104830    ;
xb2       =-.14956883     ;
xb3       =-.05147947     ;
xgv1      = .12036190     ;
xgv2      = .87963810     ;
xg1       = 1.11642814    ;
xg2       =-.12902184     ;
xg3       = .01259370     ;
vpda1     = .95937155     ;
vpda2     = .04062845     ;
leh1      = .77896587     ;
leh2      = .08303344     ;
leh3      = .12140671     ;
leh4      = .01659398     ;
lur1      = 93.71663537   ;
xgpot1    =-.10437654     ;
xgpot2    =-.02110928     ;
xgpot3    =-.15435930     ;
xgpot4    =-.01357415     ;
xgdpn1    = .92258919     ;
xgdpn2    = .72572697     ;
xgdpn3    =-.72228645     ;
xgdpn4    =-.11016519     ;
xgdpn5    = .03356539     ;
xgdpn6    = .07116282     ;
xgdpn7    = .01250851     ;
xgdpn8    = .06689876     ;
xbn1      = 1.19663420    ;
xbn2      =-.14712446     ;
xbn3      =-.04950974     ;
xgn1      = 1.25176939    ;
xgn2      = .01269695     ;
xgn3      =-.14547189     ;
xgn4      =-.01874720     ;
xgn5      =-.10024725     ;
jccan1    = .16863297     ;
jccan2    = .64696038     ;
jccan3    = .18440665     ;
ynin1     = 1.24028914    ;
ynin2     = .00226485     ;
ynin3     =-.14975991     ;
ynin4     =-.01551683     ;
ynin5     =-.08299283     ;
ynin6     = .00724965     ;
ynin7     =-.00153407     ;
qyhibnr1  = .02483786     ;
qyhibnr2  = .96185428     ;
qyhibnr3  = .03814572     ;
yhinr1    = .67550295     ;
yhinr2    = .24428356     ;
yhinr3    =-.06765606     ;
yhinr4    = .14786955     ;
ynicpn1   = 11.78638531   ;
ynicpn2   =-8.59827884    ;
ynicpn3   =-1.25319926    ;
ynicpn4   =-.93490721     ;
qynid1    = 1.60692980    ;
qynid2    =-.50049022     ;
qynid3    =-.10643958     ;
yhln1     = 1.18463378    ;
yhln2     =-.16387838     ;
yhln3     =-.02075540     ;
yniln1    = .82520711     ;
yniln2    = .05599755     ;
yniln3    = .11879534     ;
ypn1      = .96279951     ;
ypn2      =-.08241450     ;
ypn3      = .03241174     ;
ypn4      =-.09711291     ;
ypn5      =-.01230170     ;
ypn6      = .10964748     ;
ypn7      = .03833632     ;
ypn8      = .03660672     ;
ypn9      =-.01020212     ;
ypn10     = .02222946     ;
gfptn1    = 10.96235737   ;
gsptn1    = 32.15919475   ;
yhpntn1   =-5.13752931    ;
yhpntn2   = 5.28141382    ;
yhpntn3   =-20.97886865   ;
yhpntn4   = 6.69974141    ;
yhpntn5   = 1.32262515    ;
yhpntn6   = 8.32253089    ;
yhpntn7   = 4.08378730    ;
yhpntn8   = 1.40629939    ;
yhpntn9   = 180.13123227  ;
tryh1     = .77151586     ;
tryh2     = .22848414     ;
tryh3     = .69705669     ;
tryh4     = .30294331     ;
yhptn1    = .29509558     ;
yhptn2    = .57961134     ;
yhptn3    = .12529308     ;
yhl1      =-.17805219     ;
yhp1      =-.18459693     ;
yhp2      = 1.03689873    ;
yhp3      =-.03689873     ;
yh1       = .58052734     ;
yh2       = .17594725     ;
yh3       = .24352541     ;
yhtn1     = .74280195     ;
yhtn2     = .25719805     ;
qpxp1     = .72119969     ;
qpxp2     = .10620521     ;
qpxp3     = .13447560     ;
qpxp4     = .04524333     ;
qpxp5     =-.00927494     ;
qpxp6     =-.79369681     ;
qpxp7     = .78993185     ;
qpxp8     = .12045892     ;
qpxp9     =-.03671759     ;
qpxp10    =-.07782526     ;
dlpxp1    = 1.06490907    ;
dlpxp2    =-.01860100     ;
dlpcr1    = 1.13468051    ;
xgdpt1    = .73837783     ;
xgdpt2    = .26162217     ;
xotht1    = .47237121     ;
xotht2    = .16264196     ;
xotht3    = .36498683     ;
gfintn1   = .14246434     ;
trfp1     = .11900000     ;
tfpn1     = 1.17342358    ;
tfpn2     =-.12843638     ;
tfpn3     =-.04498720     ;
tfpn4     = 8.63000815    ;
gfdefn1   =-2.92104716    ;
gfdefn2   =-.76359800     ;
gfdefn3   =-.43704329     ;
gfdefn4   =-2.84209034    ;
gfdefn5   = 1.17660030    ;
gfdefn6   = 1.39270375    ;
gfdefn7   = 3.18813572    ;
gfdefn8   = .05449844     ;
gfdefn9   = 1.07197253    ;
gfdefn10  = .20436753     ;
gfdefn11  = .87550052     ;
gfdbtn1   = .97528626     ;
gfdbtn2   = .01733650     ;
gfdbtn3   = .00737724     ;
gsintn1   =-1.39711472    ;
gsintn2   = 2.39711472    ;
trsp1     = .03427548     ;
tspn1     = 1.17342358    ;
tspn2     =-.12843638     ;
tspn3     =-.04498720     ;
tspn4     = 29.17528552   ;
trsib1    = 10.00363071   ;
trsci1    = 15.44372373   ;
trfci1    = 3.23025194    ;
trssi1    = 57.10544790   ;
gssrpn1   = 1.61040014    ;
gssrpn2   = .29136405     ;
gssrpn3   = 4.41655649    ;
gssrpn4   = .67135246     ;
gssrpn5   = 1.67188919    ;
gssrpn6   = .10051193     ;
gssrpn7   =-4.69906077    ;
gssrpn8   =-1.55623497    ;
gssrpn9   =-2.14399529    ;
gssrpn10  = .55323878     ;
gssrpn11  = .08397799     ;
gsdbtn1   = .99209950     ;
gsdbtn2   =-.02336937     ;
gsdbtn3   = .03126987     ;
wpo1      = .16097071     ;
wpo2      = .06118448     ;
wpo3      =-.05092600     ;
wpo4      = .36612090     ;
wpo5      = .12177859     ;
wpo6      = .34087132     ;
eg1       = .42434944     ;
eg2       = .57565056     ;
egf1      = .45591469     ;
egf2      = .14109726     ;
egf3      = .40298805     ;
egs1      = .19372202     ;
egs2      = .17618261     ;
egs3      = .63009537     ;
profit1   = .60628679     ;
profit2   = .63138105     ;
profit3   =-.19621505     ;
profit4   =-.04145279     ;
rg51      = .96505977     ;
rtb1      = .91875477     ;




model(linear);

//**************************************************************************
// Modelbase Variables                                                   //*
                                                                         //*
interest   = rffe;                                                       //*
inflationq  =   picnia;                                                  //*
inflation = (picnia+picnia(-1)+picnia(-2)+picnia(-3))*(1/4);		 //*
outputgap  = xgap2;                                                      //*
output     = 100*xgdp;                                                   //*
                                                                         //*
// Policy Rule                                                           //*	
interest = (1-tayr1)*rstar 
	       + cofintintb1*interest(-1)                                    //*  
           + cofintintb2*interest(-2)                                    //* 
           + cofintintb3*interest(-3)                                    //*  
           + cofintintb4*interest(-4)                                    //* 
           + cofintinf0*inflation                                        //* 
           + cofintinfb1*inflation(-1)                                   //* 
           + cofintinfb2*inflation(-2)                                   //* 
           + cofintinfb3*inflation(-3)                                   //* 
           + cofintinfb4*inflation(-4)                                   //* 
           + cofintinff1*inflation(+1)                                   //* 	      
           + cofintinff2*inflation(+2)                                   //* 
           + cofintinff3*inflation(+3)                                   //* 
           + cofintinff4*inflation(+4)                                   //* 
           + cofintout*outputgap                                         //* 
           + cofintoutb1*outputgap(-1)                                   //* 
           + cofintoutb2*outputgap(-2)                                   //* 
           + cofintoutb3*outputgap(-3)                                   //* 
           + cofintoutb4*outputgap(-4)                                   //* 
           + cofintoutf1*outputgap(+1)                                   //* 
           + cofintoutf2*outputgap(+2)                                   //* 
           + cofintoutf3*outputgap(+3)                                   //* 
           + cofintoutf4*outputgap(+4)                                   //* 
           + std_r_ * interest_;                                         //*	
//**************************************************************************
// Original Model Code:

drffe   = rffe - rffe(-1);
qec     = zyh +  0.0584068790054*(zyht-zyh) -  0.0655950765465*(zyhp-zyh) +  0.0325302560675*(1+iscurve*.5)*(lwps + pxgr - pcr - zyh) +  0.1440652972670*(wpo-zyh);
ec      = ec(-1) + 0.154173479486*(qec(-1)-ec(-1)) + 0.207837076245*(ec(-1)-ec(-2)) + datet*zec1 + (1-datet)*lzec1(-1) + 0.0080074377742*(datet*zgapc1 + (1-datet)*lzgapc1(-1)) + 0.0995119731721*(yh-yh(-1) -(datet*zec1+ (1-datet)*lzec1(-1))) - 0.0229678540295*(yh(-1)-yh(-2)) + ec_;
qsdv    = -0.263228678243*0.25*(pgasr +pgasr(-1)+pgasr(-2)+pgasrl2(-1)); 
ecdv    = ecdv(-1) +  0.339759596749*(qsdv(-1)+qec(-1)-ecdv(-1)) -  .257457530254*(ecdv(-1)-ecdv(-2)) +  3.03323716171*(datet*zec2 + (1-datet)*lzec2(-1)) +  3.03323716171*(datet*zsdv + (1-datet)*lzsdv(-1)) +  3.03323716171*0.008*(datet*zgapc2 + (1-datet)*lzgapc2(-1)) -  0.029831192544*(1+iscurve/2.67)*(datet*zrccdv + (1-datet)*lzrccdv(-1)) +  1.97908433908*(qec(-1)-qec(-2)) +  4.72167026462*(qec(-2)-qecl2(-1)) +  1.73447532682*(qecl2(-1)-qecl2(-2))  +  2.41236583958*(qecl2(-2)-qecl4(-1)) +  ecdv_;
ecdo    = ecdo(-1) +  0.0978812349793*(qec(-1)-ecdo(-1)) +  0.0762268913328*(ecdo(-1)-ecdo(-2)) +  3.17577973362*(datet*zec3 + (1-datet)*lzec3(-1)) +  3.17577973362*0.008*(datet*zgapc3 + (1-datet)*lzgapc3(-1)) -  0.018364159583*(1+iscurve/3.33)*(datet*zrccdo + (1-datet)*lzrccdo(-1)) +  0.762178056319*(qec(-1)-qec(-2))  +  0.483710408941*(qec(-2)-qecl2(-1))  -  0.257987551449*(qecl2(-1)-qecl2(-2))  +  0.637934053208*(qecl2(-2)-qecl4(-1)) +  ecdo_;
eh      = eh(-1)   +  0.112177343577*(qec(-1)-eh(-1)) +  0.30940588957*(eh(-1)-eh(-2)) +  14.1861305056*(datet*zec4+ (1-datet)*lzec4(-1)) -  0.116556799251*(1+iscurve/2.58)*(datet*zrcch+ (1-datet)*lzrcch(-1)) +  5.33425802988*(qec(-1)-qec(-2)) +  2.61720944263*(qec(-2)-qecl2(-1)) +  1.26676734391*(qecl2(-1)-qecl2(-2))  +  2.37472643623*(qecl2(-2)-qecl4(-1)) +  eh_;
kcd     = kcd1*kcd(-1) + kcd2*(ecd1*ecdv + ecd2*ecdo);
kh      = kh1*kh(-1) + kh2*eh;
epd     = epd(-1) + 0.0654821916769*(xb(-2)+vpd(-2)-epd(-2)) + 0.0077433484769*(epd(-1)-epd(-2)) + 0.254415299022*(epd(-2)-epdl2(-1)) + 0.782307027592*(datet*(zxb+(1+iscurve/13.635)*zvpd) + (1-datet)*(lzxb(-1)+(1+iscurve/13.635)*lzvpd(-1)) ) + 0.151555911273*cashfl + 0.0661370611345*cashfl(-1) + 19.4767730841*(datet*zdxb+ (1-datet)*lzdxb(-1))  + epd_;
kpd     = kpd1*kpd(-1) + kpd2*epd;
vpd     = - 0.05055*(0.8*((1-.35*taxon)*rg5e - (datet*zpib5+(1-datet)*lzpib5(-1)) ) + 0.2*2*rdp ) - 0.00897*(0.8*((1-.35*taxon)*rg5e - (datet*zpib5+(1-datet)*lzpib5(-1)) ) + 0.2*2*rdp  + taxon*(datet*zpib5 + (1-datet)*lzpib5(-1)));
eps     = eps(-1) - 0.0355252237239*(eps(-1)-xb(-1)) + 0.145094529937*(eps(-1)-eps(-2)) + 0.0971793341412*(eps(-2)-epsl2(-1)) + 0.380504419177*dxbl1 + 0.24901951649*dxbl1(-1) + 0.284404961332*dxbl1(-2) + 0.312474129243*dxbl3(-1) + 0.159040395765*dxbl3(-2) - 0.350082863562*dxbl5(-1) + eps_;
kps     = kps1*kps(-1) + kps2*eps;
kimt    = kimt(-1) + .15032750476*(xb(-1)-kimt(-1)) + .23061958751*(kimt(-1)-kimt(-2)) + .118300982384*(kimt(-2)-kimtl2(-1)) + .121631744703*(kimtl2(-1)-kimtl2(-2)) + datet*zkimt+ (1-datet)*lzkimt(-1)+ kimt_ ;
kio     = kio(-1) + .0387389192555*(xb(-1)-kio(-1)) + .507651578953*(kio(-1)-kio(-2)) +  .122173935168*(xb(-1)-xb(-2)) + kio_;
ex      = ex(-1) + 0.143161888685*((fgdp(-1)-fpxr(-1))-ex(-1))- 0.367783875925*(ex(-1)-ex(-2))+ 1.39918761877*(fgdp-fgdp(-1))- 0.1*(fpxr-fpxr(-1)) - 0.05*(fpxr(-1)-fpxr(-2)) + ex_;
hgxemo  = .775*hgxemo(-1) + .225*(xgdp-xgdp(-1));
emo     = emo(-1) - 0.426416797406*(emo(-1)-(xgdp(-1)+pxbr(-1)-pmor(-1)))- 0.156189507787*(emo(-1)-emo(-2))+ 4.25725755003*hgxemo - 0.219943167475*(pmor-pxbr-(pmor(-1)-pxbr(-1)))+  emo_;
fninr   = fnin1*fninr(-1) + fnin2*fcbnr;
fpxr    = 0.04*(rg10e-zpi10) + 0.2*fpxr1*(fninr  - (xgdp + pgdpr)) + dlfpxr_;
dlfpx   = fpxr - fpxr(-1) + dlfpc - dlpxp - (pxbr - pxbr(-1));
dlfpxr  = fpxr - fpxr(-1);
xgdp    = xgdp1*ecnia + xgdp2*eh + xgdp3*epd + xgdp4*eps + xgdp5*(ki1*kimt + ki2*kio) + xgdp6*(ki1*kimt(-1) + ki2*kio(-1)) + xgdp7*ex + xgdp8*(em1*emo  + em2*(emp1*xg + emp2*xgpot)) + xgdp9*(egf1*egfo + egf2*egfi + egf3*egfl) + xgdp10*(egs1*egso + egs2*egsi + egs3*egsl);
xp      = xp1*ecnia + xp2*eh + xp3*epd + xp4*eps  + xp5*ex + xp6*egfi + xp7*egfo+ xp8*egsi+ xp9*egso;
xb      = xb1*xgdp + xb2*(xgv1*egfl + xgv2*egsl) + xb3*xgpot;
xgap    = 100*(xg - xgpot)  ;
xgap2   = 100*(xgdp - xgdpt);
vpda    = vpda1*vpda(-1) + vpda2*(.1*(vpd(-2)+vpdl2(-1)+vpdl2(-2)+vpdl4(-1)+vpdl4(-2)+vpdl6(-1)+vpdl6(-2)+vpdl8(-1)+vpdl8(-2)+vpdl10(-1)) );
veoa    = vpda1*veoa(-1) + vpda2*(-.1*(pcengr(-2)+pcengrl2(-1)+pcengrl2(-2)+pcengrl4(-1)+pcengrl4(-2)+pcengrl6(-1)+pcengrl6(-2)+pcengrl8(-1)+pcengrl8(-2)+pcengr10(-1)) );
ltfpt   = ltfpt1*ltfpt(-1);
lhp     = lhp(-1) + 0.151503615812*(qlhp(-1)-lhp(-1)) + 0.37950418465*(lhp(-1)-lhp(-2)) + 0.689067964742*(datet*zlhp+ (1-datet)*lzlhp(-1)) + 0.310932035258*(qlhp-qlhp(-1)) - 0.118000008522*(qlhp(-1)-qlhp(-2)) + lhp_ ;
lep     = lep(-1) + 0.11414*(lhp(-1)-lep(-1)) + 0.17067*(lep(-1)-lep(-2)) + 0.63607*(lhp-lhp(-1))+ lep_;
lf      = lf(-1) +0.250725221905*(-lf(-1)) + 0.0366539399533*(lep-lep(-1)) + 0.0330173044951*dlepl1 + 0.030274916672*dlepl1(-1) + 0.0284267764838*dlepl1(-2) + 0.0274728839308*dlepl3(-1)  + 0.0274132390127*dlepl3(-2) + 0.0282478417297*dlepl5(-1) + 0.0299766920818*dlepl5(-2) + lf_;
leor    = 0.750172970581*leor(-1)- 0.00035090025639*xgap(-1) + leor_;
lurnat  = lurnat1*lurnat(-1);
xgpot   = lprdgt + xgpot1*leh + xgpot2*egfl + xgpot3*egsl + xgpot4*lurnat;
xgdpt   = xgdpt1*xgpot + (xgdpt2/12)*(xotht1*(xgv1*egfl + xgv2*egsl + xgv1*egfl(-1)+ xgv2*egsl(-1)) + xotht2*(xgpot+xgpot(-1))+ xotht3*(kh+kh(-1)) + xothtl2 + xothtl2(-1) +xothtl2(-2) + xothtl4(-1)+ xothtl4(-2)+ xothtl6(-1) + xothtl6(-2)+ xothtl8(-1) + xothtl8(-2) + xothtl10(-1));
xgdpnr  = xgdpn1*xp + xgdpn2*(pxbr + ki1*kimt + ki2*kio) + xgdpn3*(pxbr + ki1*kimt(-1) + ki2*kio(-1))+ xgdpn4*(em1*(pmor + emo) + em2*(poilr + pxbr + emp1*xg + emp2*xgpot)) + xgdpn5*(plr  + egfl)  + xgdpn6*(plr  + egsl) + xgdpn7*(ecnia + pcr) + xgdpn8*(trsib1*trsib + ecnia + pcr);
jccanr  = pxbr + jccan1*kh(-1) + jccan2*kpd(-1) + jccan3*kps(-1);
yhibnr  = yhibnr(-1) - 0.0569590277246*(yhibnr(-1) - qyhibnr(-1))+ 0.671295777924*(yhibnr(-1) - yhibnr(-2)) + 0.0829844820244*(pcr + dlpxp + ecd1*ecdv + ecd2*ecdo - (pcr(-1)+ecd1*ecdv(-1) + ecd2*ecdo(-1))) + yhibnr_;
ynicpnr = ynicpn1*yninr +  ynicpn2*(plr + yniln1*lhp + yniln2*egfl + yniln3*egsl) +  ynicpn3*yniinr +  ynicpn4*(xb + pxbr);
ynidnr  = ynidnr(-1) + 0.0915371212941*(qynidnr(-1)-ynidnr(-1))+ 0.481011899739*(ynidnr(-1)-ynidnr(-2)- (pxbr(-1) - pxbr(-2)))+ datet*zynid+(1-datet)*lzynid(-1) + pxbr - pxbr(-1)+ ynidnr_ ;
ypnr    = ypn1*yninr + ypn2*ynicpnr+ ypn3*ynidnr + ypn4*(plr + yniln1*lhp + yniln2*egfl + yniln3*egsl)  + ypn5*(plr + trssi1*trssi + yniln1*lhp + yniln2*egfl + yniln3*egsl) + ypn6*(xgdpt + gfptn1*gftrd + pcr)+ ypn7*(xgdpt + gsptn1*gstrd + pcr) + ypn8*gfintnr + ypn9*gsintnr+ ypn10*yhibnr;
yhpntnr = yhpntn1*(pcr + kcd(-1))+ yhpntn2*yhibnr + yhpntn3*ynicpnr+ yhpntn4*(trfci1*trfci + ynicpnr)+ yhpntn5*(trsci1*trsci + ynicpnr) + yhpntn6*ynidnr+ yhpntn7*gfdbtnr + yhpntn8*gsdbtnr + (1-yhpntfix)*yhpntn9*(pcr-pcrl2(-2) +0.25*(dlpxp+dlpxp(-1)+dlpxp(-2)+dlpxpl2(-1)));
qpxpr   = qpxp1*(qpxgr + xg)+ qpxp2*(pxbr + kh)+ qpxp3*(plr + xgv1*egfl + xgv2*egsl) + qpxp4*(pxbr + xgpot) + qpxp5*(emp1*xg + emp2*xgpot + poilr + pxbr) + qpxp6*(pxbr + ki1*kimt + ki2*kio) + qpxp7*(pxbr + ki1*kimt(-1) + ki2*kio(-1))+ qpxp8*(em1*(pmor + emo) + em2*(poilr + pxbr +  emp1*xg + emp2*xgpot)) + qpxp9*(plr + egfl)+ qpxp10*(plr + egsl) - xp;
dlpxp   = 0.101323198072*qpxpr(-1)+ 0.375610047295*dlpxp(-1)+ 0.1906564348288402*dlpxp(-2) + 0.271258122587*dlpxp1*0.0424*(pcengr-pcengr(-1) + dlpxp2*pcengr(-1)) -0.0470874139451*dlpxp1*0.0424*(pcengr(-1)-pcengr(-2) + dlpxp2*pcengr(-2)) + datet*zpxp + (1-datet)*lzpxp(-1)- (1 + pwfix/1.58)*0.00307479678461*(datet*zlur1+ (1-datet)*lzlur1(-1))+ dlpxp_ ;
qplr    = lprdgt + 1.02040816327*(pxgr)- 0.02040816327*(pcengr + pxbr);
plr     = plr(-1) + dlpl - dlpxp ;
dlpl    = 0.0298564306096*(qplr(-1)-plr(-1))+ 0.231414207389*dlpl(-1) + 0.210488499183*dlpl(-2)+ 0.2673366641778989*dlpll2(-1) + datet*zpl+ (1-datet)*lzpl(-1)- (1 + pwfix/1.41)*0.0110869464785*(datet*zlur2+ (1-datet)*lzlur2(-1))+ 0.0226916552639*(plminr - plminr(-1) + pxbr - pxbr(-1) + dlpxp - .25*(dlpl(-1)+dlpl(-2)+dlpll2(-1)+dlpll2(-2)))+ dlpl_;
pmor    = pmor(-1) + pxbr - pxbr(-1) + 0.122770433843*(qpmor(-1) - pmor(-1)) + 0.364224968853*(pmor(-1)-pxbr(-1)-(pmor(-2)-pxbr(-2)))+ 0.152572766338*(pmor(-2)-pxbr(-2)-(pmorl2(-1)-pxbrl2(-1))) + 0.820102224398*(dlfpc -.25*(dlfpc(-1)+dlfpc(-2)+dlfpcl2(-1)+dlfpcl2(-2)))- 0.21894291106*(dlfpx -.25*(dlfpx(-1)+dlfpx(-2)+dlfpxl2(-1)+dlfpxl2(-2)))+ pmor_;
pcr     = pcr(-1) - pcrec*pcr(-1)+ 0.328778501444*(pcr(-1)-pcr(-2))- 0.671221498556*(dlpcr1*(trsib-trsib(-1)))+ pcr_;
picnia  = 400*(pcr - pcr(-1) + dlpxp);
pcengr  = pcengr(-1) - 0.132995794168*(pcengr(-1)-pcengr(-2))- 0.0791398065385*pcengr(-1)+ 0.0709795052728*poilr(-1) + 0.73643556277*(poilr-poilr(-1))+ pcengr_;
pgasr   = pgasr(-1) - pgasrec*pgasr(-1) + 0.104506774375*(pgasr(-1)-pgasr(-2)) + 0.284297987947*(poilr-poilr(-1))+ pgasr_;
pxbr    = xbnr - xb;
plminr  = plminr1*plminr(-1);
pxp     = pxp(-1) + dlpxp ;
gftrd   = 0.590828651494*gftrd(-1) - 0.000220510973853*xgap2   + gftrd_;
rgfint  = .95*(rgfint(-1) + 0.33/100*(rtb1*rtbe-rtb1*rtbe(-1))) + 0.05/100*(0.67*rg51*rg5e + 0.33*rtb1*rtbe)  + rgfint_;                //assumed one lag of rgfint
gfdefnr = gfdefn1*tfpnr + gfdefn2*(trfci1*trfci + ynicpnr)  + gfdefn3*(ecnia + pcr) + gfdefn4*(plr + yniln1*lhp + yniln2*egfl + yniln3*egsl)+ gfdefn5*(plr + egfl) + gfdefn6*(pxbr + egfo)  + gfdefn7*(xgdpt + gfptn1*gftrd + pcr)+ gfdefn8*(pgdpr + xgpot) + gfdefn9*gfintnr + gfdefn10*(pgdpr + xgpot)  + gfdefn11*(pgdpr + xgpot) ;
gfdbtnr = gfdbtn1*gfdbtnr(-1)+ gfdbtn2*gfdefnr + gfdbtn3*(pxbr + egfi);
gstrd   = 0.868665070992*gstrd(-1) - 0.0000208722728777*xgap2   + gstrd_;
gsdbtnr = gsdbtn1*gsdbtnr(-1)+ gsdbtn2*gssrpnr+ gsdbtn3*(pxbr + egsi);
trsci   = 0.689972923252*trsci(-1) - 0.000994932583632*xgap2 + 0.000775585371179*xgap2(-1)+ 0.151968645333*(trfci-trfci(-1)) + trsci_;
trssi   = 1.01974921383*trssi(-1) - 0.258873658191*trssi(-2) - 0.0000175095693154*xgap2+ trssi_;
trsib   = 0.770695168907*trsib(-1) - 0.0000569254831607*xgap2+ trsib_;
trfci   = 0.567384382892*trfci(-1) + 0.00202396979478*xgap2 + 0.00521346564087*picnia +trfci_;
rtbe    = rffe - 0.221154289471*(rffe-rffe(-1))- 0.139857827355*(rtbe(-1)-rtbe(-2))+ 0.86006333688*(rtbe(-1)-rffe(-1)) + rtbe_  ;
rme     = (1 - 0.23624262847)*rme(-1) + 0.23624262847*((1-0.47896)*rg10e(-1) + 0.47896*rtbe(-1) + 0.3262*(lur(-1)-lurnat(-1)))+ (0.737093726763- 0.0870651579706)*(rg10e-rg10e(-1)) + 0.142601547171*(rme(-1)-rme(-2)) + 0.0870651579706*(rtbe-rtbe(-1))+ rme_;
rcar    = (1- 0.354780575489)*rcar(-1) +0.354780575489*rg51*rg5e(-1)+ 0.208176943453*(rg51*rg5e-rg51*rg5e(-1)) + 0.0918891467196*(rcar(-1)-rcar(-2))+ rcar_                ;
rg5es   = rg5e1*rg5es(-1) + rg5e_;
rg10es  = rg10e1*rg10es(-1) + rg10e_;
rcbes   = rcbe1*rcbes(-1) + rcbe_;
rdp     = 0.39008463852*4.01*(ynidnr-(lwps + pxgr)) - 0.259329399006*4.01*(ynidnr(-1)- (lwps(-1)+pxgr(-1))) + 0.869244760486*rdp(-1) + rdp_;
lwpss   = lwps1*lwpss(-1) + lwps_ ;
fgdp    = qsector*(fgdp(-1)- 0.0809494989281*fgdp(-1)+ 0.000970693267156*xgap2 + 0.154305911514*(fgdp(-1)-fgdp(-2))) + dlfgdp_;
dlfpc   = qsector*( 0.25*(dlfpc(-1)+dlfpc(-2)+dlfpcl2(-1)+dlfpcl2(-2)) + 0.333258755084*0.125*(fgdp-fgdpl6(-2))+ 0.0191493302666*(fpxr(-1)-fpxr(-2)) + 0.0117184776036*(poilr-poilr(-1))) + dlfpc_;
poilr   = qsector*(poilr(-1) - 0.255883836726*poilr(-1) + 0.394001699237*(poilr(-1)-poilr(-2))) + (1-qsector)*poilr1*poilr(-1) + poilrs - poilr4*poilrs(-1);
poilrs  = 0*one + poilr_;
trfpt   = trfpt(-1) + trfpt1*(gfdbtnr(-1)-xgdpnr(-1)) + trfpt2*(gfdbtnr(-1)-xgdpnr(-1)- gfdbtyl4(-1));
trfp    = trfp1*trfpt+ 0.531149977846*(trfp(-1)-trfp1*trfpt(-1)) + 0.278195990818*(trfp(-2)-trfp1*trfpt(-2)) + 0.000461604246182*xgap2(-1) + trfp_;
trspt   = trspt(-1) + trspt1*(gsdbtnr(-1)-xgdpnr(-1))+ trspt2*(gsdbtnr(-1)-xgdpnr(-1)- gsdbtyl4(-1));
trsp    = 0.730539188266*trsp(-1)+ 1.01604935879*trsp1*trspt- 0.746588547058*trsp1*trspt(-1)- 0.0000421560050313*xgap2(-1) + 0.0190800121832*(trfp-trfp(-1)) + trsp_;
egfi    = gsector*(egfi(-1) -0.377061398783*egfi(-1) -0.132195649068*(egfi(-1)-egfi(-2)) + 0.0456246902781*(egfi(-2)-egfil2(-1)) + 0.0103283511414*xgap2- 0.00861206503463*xgap2(-1)) + egfi_;
egfo    = gsector*(egfo(-1)- 0.260684258075*egfo(-1) - 0.144159643547*(egfo(-1)-egfo(-2))- 0.220362386808*(egfo(-2)-egfol2(-1))- 0.0019609669422*xgap2+ 0.00326472002188*xgap2(-1))+ (1-gsector)*egfo1*egfo(-1) + egfos - gshock4*egfos(-1);
egfos   = 0*one + fiscal_;
egfl    = gsector*(egfl(-1) - 0.111217107631*egfl(-1) + 0.329389469448*(egfl(-1)-egfl(-2)) - 0.0631534124906*(egfl(-2)-egfll2(-1)) - 0.0003987074422*xgap2 + 0.000639016169256*xgap2(-1)) + egfl_;
egsi    = gsector*(egsi(-1)- 0.308315775954*egsi(-1) + 0.0480696288261*(egsi(-1)-egsi(-2)) - 0.0952812353267*(egsi(-2)-egsil2(-1)) + 0.00982878490768*xgap2 - 0.00651765223808*xgap2(-1)) + egsi_;
egso    = gsector*(egso(-1)- 0.155542033952*egso(-1) + 0.347413651457*(egso(-1)-egso(-2)) + 0.356797187808*(egso(-2)-egsol2(-1)) - 0.00063221659304*xgap2 + 0.000649024461471*xgap2(-1) ) + egso_;
egsl    = gsector*(egsl(-1)- 0.225318312325*egsl(-1) + 0.258184643069*(egsl(-1)-egsl(-2)) - 0.00328948799931*(egsl(-2)-egsll2(-1)) - 0.000441199608342*xgap2 + 0.000764796265076*xgap2(-1)) + egsl_;
rffvar  = 0.141521309909*(picnia(-1)-pitarg(-1))- 0.027351055434*(picnia(-2)-pitarg(-1)) + 0.053734862375*(picnial2(-1)-pitarg(-1)) - 0.137787267452*(picnial2(-2)-pitarg(-1))+ 0.992110641812*(rffe(-1)-rstar(-1)-ptr(-1))- 0.446416858945*(rffe(-2)-rstar(-1)-ptr(-1)) + 0.488158237787*(rffel2(-1)-rstar(-1)-ptr(-1))- 0.0877896495076*(rffel2(-2)-rstar(-1)-ptr(-1)) + rstar(-1)+ptr(-1) + 0.295954271439*xgap(-1) - 0.0837857095338*xgap(-2)- 0.136291571338*xgapl2(-1)+ 0.043304922611*xgapl2(-2) + rffvar_     ;
rffe    = dmptay*rfftay + dmpvar*rffvar ;
rstar   = rstar1*rstar(-1) + (1-rstar1)*(rffe-picnia)+ rstarsh*(rtr-(ptr+ rtr1*(rtr(-1) - ptr(-1)) + (1-rtr1)*(rffe-picnia)));
rtr     = ptr + rtr1*(rtr(-1) - ptr(-1)) + (1-rtr1)*(rffe-picnia) + rtr_;
pitarg  = pitarg1*pitarg(-1) + (1-pitarg1)*ptr;
ptr     = ptr(-1) + dptr*ptr1*(picnia(-1) - ptr(-1))+ ptr_;           		//assumed lag of ptr =1
zertay  = 0*rffe;
zervar  = rffe - (0.141521309909*(picnia(-1)-ptr(-1)) - 0.027351055434*(picnia(-2)-ptr(-1)) + 0.053734862375*(picnial2(-1)-ptr(-1))- 0.137787267452*(picnial2(-2)-ptr(-1)) + 0.992110641812*(rffe(-1)-rstar(-1)-ptr(-1))- 0.446416858945*(rffe(-2)-rstar(-1)-ptr(-1)) + 0.488158237787*(rffel2(-1)-rstar(-1)-ptr(-1))- 0.0877896495076*(rffel2(-2)-rstar(-1)-ptr(-1)) + rstar(-1)+ptr(-1) + 0.295954271439*xgap(-1) - 0.0837857095338*xgap(-2) - 0.136291571338*xgapl2(-1) + 0.043304922611*xgapl2(-2));
zec1    = 0.154173479486*(qec-qec(-1)) - 0.0307740637878*(qec(+1)-qec) + 1.03259032482*zec1(+1)- 0.199606728022*zec1(+2);
lzec1   = zec1(+1);
zgapc1  = 0.0257495000128*xgap2 + 1.03259032482*zgapc1(+1) - 0.199606728026*zgapc1(+2);
lzgapc1 = zgapc1(+1);
zec2    = 0.339759596749*(qec-qec(-1)) + 0.0840097094593*(qec(+1)-qec) + 0.394727215537*zec2(+1) + 0.247262212056*zec2(+2);
lzec2   = zec2(+1);
zgapc2  = 0.121637527713*xgap2 + 0.394727215538*zgapc2(+1) + 0.247262212056*zgapc2(+2);
lzgapc2 = zgapc2(+1);
zsdv    = 0.339759596749*(qsdv-qsdv(-1)) + 0.0840097094593*(qsdv(+1)-qsdv) + 0.394727215537*zsdv(+1)+ 0.247262212056*zsdv(+2);
lzsdv   = zsdv(+1);
zrccdv  = 0.121637527713*(rcar - zpi05) + 0.394727215538*zrccdv(+1)- 0.247262212056*zrccdv(+2);
lzrccdv = zrccdv(+1);
zec3    = 0.178489847984*(qec-qec(-1)) - 0.0167789628047*(qec(+1)-qec) + 0.901003559256*zec3(+1)- 0.0940051380753*zec3(+2);
lzec3   = zec3(+1);
zgapc3  = 0.0344488224641*xgap2+ 0.901003559255*zgapc3(+1)- 0.094005138074*zgapc3(+2);
lzgapc3 = zgapc3(+1);
zrccdo  = 0.0344488224641*(rcar - zpi05) + 0.901003559255*zrccdo(+1)- 0.0940051380741*zrccdo(+2);
lzrccdo = zrccdo(+1);
zec4    = 0.112177343577*(qec-qec(-1)) - 0.0333338808792*(qec(+1)-qec) + 1.17328397508*zec4(+1) - 0.297153416346*zec4(+2);
lzec4   = zec4(+1);
zrcch   = 0.0138953448721*((1-0.3*taxon)*rme - zpi10) + 1.1732839751*zrcch(+1) - 0.297153416367*zrcch(+2);
lzrcch  = zrcch(+1);
zvpd    = 0.0654822044827*(vpd-vpd(-1))- 0.000166173491039*(vpd(+1)-vpd)- 0.0156805900825*(vpd(+2)-vpd(+1)) + 0.923403855288*zvpd(+1) + 0.236924386007*zvpd(+2) - 0.239462516617*zvpdl2(+1);
lzvpd   = zvpd(+1);
zxb     = 0.0654822044827*(xb-xb(-1))- 0.000166173491039*(xb(+1)-xb) - 0.0156805900825*(xb(+2)-xb(+1))+ 0.923403855288*zxb(+1)+ 0.236924386007*zxb(+1)- 0.239462516617*zxbl2(+1);
lzxb    = zxb(+1);
zdxb    = 0.00518186709502*(xb-xb(-1))+ 0.923416081303*zdxb(+1)+ 0.236903312103*zdxb(+2)- 0.239453408793*zdxbl2(+2);
lzdxb   = zdxb(+1);
zpib5   = 0.0588235294118*400*(pxbr - pxbr(-1) + dlpxp) + (1-0.0588235294118)*zpib5(+1);
lzpib5  = zpib5(+1);
zkimt   = 0.15032750476*(xb-xb(-1)) - 0.0326098165361*(xb(+1)-xb)- 0.0163938700686*(xb(+2)-xb(+1))- 0.016865129801*(xbf2(+1)-xb(+2))+ 1.05868624113*zkimt(+1)- 0.107870788459*zkimt(+2)+ 0.00313488692336*zkimtl2(+1)- 0.112189248584*zkimtl2(+2);
lzkimt  = zkimt(+1);
zlhp    = 0.151503615812*(qlhp-qlhp(-1))- 0.0552194044451*(qlhp(+1)-qlhp)+ 1.20344055746*zlhp(+1) - 0.364475818937*zlhp(+2);
lzlhp   = zlhp(+1);
zyh     = (1-0.930604859102)*yh + 0.930604859102*zyh(+1);
zyhp    = (1-0.930604859102)*yhp + 0.930604859102*zyhp(+1);
zyht    = (1-0.930604859102)*yht + 0.930604859102*zyht(+1);
zynid   = 0.0915371212941*(qynidnr-qynidnr(-1)-(pxbr-pxbr(-1)))- 0.0422868390037*(qynidnr(+1)-qynidnr-(pxbr(+1)-pxbr)) + 1.36168528288*zynid(+1)- 0.461963828509*zynid(+2);
lzynid  = zynid(+1);
zpl     = 0.0298563916098*(qplr-qplr(-1)+dlpxp)- 0.00635206734457*(qplr(+1)-qplr+dlpxp(+1)) - 0.00577131624186*(qplr(+2)-qplr(+1)+dlpxp(+2)) - 0.00736492314809*(qplrf2(+2)-qplr(+2)+dlpxpf2(+1))+ 1.17710578781*zpl(+1) - 0.0194638751273*zpl(+2)+ 0.0533774719806*zpll2(+1) - 0.246677874267*zpll2(+2);
lzpl    = zpl(+1);
zpxp    = 0.101323198072*(qpxpr-qpxpr(-1)+dlpxp)- 0.0361798554854*(qpxpr(+1)-qpxpr+dlpxp(+1)) - 0.018181865365*(qpxpr(+2)-qpxpr(+1)+dlpxp(+2))+ 1.2488011121*zpxp(+1) - 0.177629510974*zpxp(+2)  - 0.179444250774*zpxpl2(+1);
lzpxp   = zpxp(+1);
zlur1   = 0.0109705311231*(lur-lurnat) + 1.24880111224*zlur1(+1)- 0.177629511165*zlur1(+2)- 0.179444250696*zlur1l2(+1);
lzlur1  = zlur1(+1);
zlur2   = 0.00106432642675*(lur-lurnat) + 1.17752584206*zlur2(+1) - 0.0200926352835*zlur2(+2)+ 0.0535007491989*zlur2l2(+1) - 0.246582176612*zlur2l2(+2);
lzlur2  = zlur2(+1);
zgap05  = 0.0588235294118*xgap  + (1-0.0588235294118)*zgap05(+1);
zgap10  = 0.0344827586207*xgap  + (1-0.0344827586207)*zgap10(+1);
zgap30  = 0.0243902439024*xgap  + (1-0.0243902439024)*zgap30(+1);
zpi05   = 0.0588235294118*picnia  + (1-0.0588235294118)*zpi05(+1);
zpi10   = 0.0344827586207*picnia + (1-0.0344827586207)*zpi10(+1);
zpi30   = 0.0243902439024*picnia + (1-0.0243902439024)*zpi30(+1);
zrff05  = 0.0588235294118*rffe + (1-0.0588235294118)*zrff05(+1);
zrff10  = 0.0344827586207*rffe  + (1-0.0344827586207)*zrff10(+1);
zrff30  = 0.0243902439024*rffe  + (1-0.0243902439024)*zrff30(+1);
zdivgr  = ynidnr - (pxgr)  - (ynidnr(-1) - pxgr(-1)) + 0.98*zdivgr(+1);
one     = one(-1);
qecl2   = qec(-2);
qecl4   = qecl2(-2);
picniaf2= picnia(+2);
picniaf4= picniaf2(+2);
picniaf6= picniaf4(+2);
picnial2= picnia(-2);
picnial4= picnial2(-2);
picnial6= picnial4(-2);
picnial8= picnial6(-2);
picnia10= picnial8(-2);
rffel2  = rffe(-2);
pcl2    = pcr(-2) + pxp(-2);
xgap2l2 = xgap2(-2);
epdl2   = epd(-2);
epsl2   = eps(-2);
cashfl  = profit1*(jccanr(-1) - jccanr(-2)) - (pxbr(-1)-pxbr(-2))+ profit2*(ynicpnr(-1)-ynicpnr(-2)) + profit3*(trfci1*trfci(-1)+ynicpnr(-1)- (trfci1*trfci(-2)+ynicpnr(-2))) + profit4*(trsci1*trsci(-1)+ynicpnr(-1)- (trsci1*trsci(-2)+ynicpnr(-2)));
dxbl1   = xb(-1) - xb(-2);
dxbl3   = dxbl1(-2);
dxbl5   = dxbl3(-2);
kimtl2  = kimt(-2);
vpdl2   = vpd(-2);
vpdl4   = vpdl2(-2);
vpdl6   = vpdl4(-2);
vpdl8   = vpdl6(-2);
vpdl10  = vpdl8(-2);
pcengrl2= pcengr(-2);
pcengrl4= pcengrl2(-2);
pcengrl6= pcengrl4(-2);
pcengrl8= pcengrl6(-2);
pcengr10= pcengrl8(-2);
dlepl1  = lep(-1) - lep(-2);
dlepl3  = dlepl1(-2);
dlepl5  = dlepl3(-2);
dlpll2  = dlpl(-2);
dlpxpl2 = dlpxp(-2); 
pmorl2  = pmor(-2);
pxbrl2  = pxbr(-2);
dlfpcl2 = dlfpc(-2);
dlfpxl2 = dlfpx(-2);
egfil2  = egfi(-2);
egfll2  = egfl(-2);
egfol2  = egfo(-2);
egsil2  = egsi(-2);
egsll2  = egsl(-2);
egsol2  = egso(-2);
xgapl2  = xgap(-2);
fgdpl2  = fgdp(-2);
fgdpl4  = fgdpl2(-2);
fgdpl6  = fgdpl4(-2);
pgasrl2 = pgasr(-2);
pcrl2   = pcr(-2);
gfdbtyl2= gfdbtnr(-2)-xgdpnr(-2);
gfdbtyl4= gfdbtyl2(-2);
gsdbtyl2= gsdbtnr(-2)-xgdpnr(-2);
gsdbtyl4= gsdbtyl2(-2);
xothtl2 = xotht1*(xgv1*egfl(-2)+ xgv2*egsl(-2)) + xotht2*xgpot(-2)+ xotht3*kh(-2);
xothtl4 = xothtl2(-2);
xothtl6 = xothtl4(-2);
xothtl8 = xothtl6(-2);
xothtl10= xothtl8(-2);
dlpxpf2 = dlpxp(+2);
pcf2    = pcr(+2) + pxp(+2);
xgap2f2 = xgap2(+2);
xgap2f4 = xgap2f2(+2);
xgap2f6 = xgap2f4(+2);
xbf2    = xb(+2);
qplrf2  = qplr(+2);
zkimtl2 = zkimt(+2);
zpll2   = zpl(+2);
zlur2l2 = zlur2(+2);
zvpdl2  = zvpd(+2);
zxbl2   = zxb(+2);
zdxbl2  = zdxb(+2);
zpxpl2  = zpxp(+2);
zlur1l2 = zlur1(+2);
pxgr    = xgnr - xg;
yhp     = yhp1*tryh+ yhp2*(yhptn1*xbnr + yhptn2*yhinr + yhptn3*ynidnr) + yhp3*yhpntnr - pcr;
gsintnr = gsintn1*(gsdbtnr(-1) + gfintn1*rgsint)+ gsintn2*xbnr;
tfpnr   = tfpn4*trfp + tfpn1*ypnr + tfpn2*(xgdpt + gfptn1*gftrd + pcr) + tfpn3*(xgdpt + gsptn1*gstrd + pcr);
ecnd    = ecnd1*ec + ecnd2*kcd(-1);
ei      = xgdp5*(ki1*kimt + ki2*kio) + xgdp6*(ki1*kimt(-1) + ki2*kio(-1));
fcbnr   = fcbn1*(pxbr + ex) + fcbn2*(emn1*(pmor + emo) + emn2*(poilr + pxbr +  emp1*xg+ emp2*xgpot)) + fcbn3*(fynin1*fninr(-1)+ fynin2*(pxgr + xgpot))+ fcbn4*(pxgr + xgpot) ;
leh     = (leh1*lep + leor + leh3*egsl+ leh4*egfl)/(1-leh2);
lur     = lur1*(lf-leh) ;
yht     = xgdpt  + yhtn1*gfptn1*gftrd  + yhtn2*gsptn1*gstrd ;
rg5e    = zrff05 - anton*0.62346*zgap05 + rg5es;
rg10e   = zrff10 - anton*0.78598*zgap10 + rg10es;
rcbe    = zrff30 - anton*1.2078*zgap30 + rcbes;
lwps    = ynidnr(-1) - pxgr(-1)+ zdivgr - (1/(1-0.98))*(rcbe - zpi30)/400  + lwpss;
egf     = egf1*egfo + egf2*egfi + egf3*egfl ;
egs     = egs1*egso + egs2*egsi + egs3*egsl;
ecd     = ecd1*ecdv + ecd2*ecdo;
em      = em1*emo  + em2*(emp1*xg + emp2*xgpot);
lprdgt  = .257*vpda + 0.075*veoa ;
qlhp    = xg - lprdgt;
qyhibnr = qyhibnr1*rcar + qyhibnr2*(pcr+(ecd1*ecdv + ecd2*ecdo)) + qyhibnr3*(ecnia + pcr);
yniinr  = xbnr;
qynidnr = qynid1*ynicpnr +qynid2*(trfci1*trfci + ynicpnr)+ qynid3*(trsci1*trsci + ynicpnr);
qpxgr   = 0.98*(plr - lprdgt) + 0.02*(pcengr + pxbr);
qpmor   = pxbr - .786550*fpxr;
rgsint  = rgfint;
eg      = eg1*egf + eg2*egs;
xg      = xg1*xb + xg2*kh + xg3*(emp1*xg + emp2*xgpot);
ecnia   = 1.00*ec  + ecnia1*(ecd1*ecdv + ecd2*ecdo - kcd(-1));
xbnr    = xbn1*xgdpnr + xbn2*(plr + xgv1*egfl + xgv2*egsl) + xbn3*(pxbr + xgpot);
xgnr    = xgn1*xbnr  + xgn2*(emp1*xg + emp2*xgpot + poilr + pxbr) + xgn3*(pxbr + kh)+ xgn4*(ecnia + pcr)+ xgn5*(trsib1*trsib + ecnia + pcr);
yninr   = ynin1*xgdpnr + ynin2*(fynin1*fninr(-1) + fynin2*(pxgr + xgpot)) + ynin3*jccanr + ynin4*(ecnia + pcr)+ ynin5*(trsib1*trsib + ecnia + pcr)  + ynin6*(pgdpr + xgpot)  + ynin7*(pgdpr + xgpot);
yhinr   = yhinr1*yniinr  + yhinr2*gfintnr + yhinr3*gsintnr + yhinr4*yhibnr;
tryh    = tryh1*tfpnr + tryh2*tspnr - (tryh3*((plr + yniln1*lhp + yniln2*egfl + yniln3*egsl) + yhln3*trssi1*trssi) + tryh4*(yhptn1*xbnr + yhptn2*yhinr + yhptn3*ynidnr)) ;
yhl     = plr - pcr + yniln1*lhp + yniln2*egfl + yniln3*egsl + yhln3*trssi1*trssi + yhl1*tryh;
yh      = yh1*yhl+ yh2*yht + yh3*yhp;
pgdpr   = xgdpnr - xgdp;
gfintnr = gfdbtnr(-1) + gfintn1*rgfint;
tspnr   = tspn4*trsp+ tspn1*ypnr  + tspn2*(xgdpt + gfptn1*gftrd + pcr) + tspn3*(xgdpt + gsptn1*gstrd + pcr);
gssrpnr = gssrpn1*tspnr + gssrpn2*(trsci1*trsci + ynicpnr)  + gssrpn3*(trsib1*trsib + ecnia + pcr) + gssrpn4*(trssi1*trssi + plr + yniln1*lhp + yniln2*egfl + yniln3*egsl)  + gssrpn5*(pgdpr + xgpot)+ gssrpn6*(pgdpr + xgpot)+ gssrpn7*(plr + egsl)+ gssrpn8*(pxbr + egso) + gssrpn9*(xgdpt + gsptn1*gstrd + pcr)+ gssrpn10*gsintnr  + gssrpn11*(pgdpr + xgpot);
wpo     = wpo1*(gfdbtnr - pcr) + wpo2*(gsdbtnr - pcr)+ wpo3*(fninr - pcr)+ wpo4*(kh + pxbr - pcr)+ wpo5*(kcd + pxbr - pcr) + wpo6*xgpot;
end;

shocks;
var interest_ = 1;
end;


stoch_simul (order=1, irf =16, ar=0, periods=8000, nograph, noprint) interest inflationq outputgap;