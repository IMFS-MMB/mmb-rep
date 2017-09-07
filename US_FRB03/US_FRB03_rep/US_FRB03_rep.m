clear all
 ...
global scalv_ ex_ ex_det_ recur_ recurs_ ys_ y_ exe_ exe_det_ lgy_ lgx_ lgx_det_ lgr_ dsmpl_ endval_
 ...
global endo_nbr exo_nbr exo_det_nbr iy_  ykmin_  ykmax_  xkmin_  xkmax_ zkmin_ zkmax_ iter_
 ...
global dynatol_ slowc_ maxit_ valf_ ys0_ recurs0_ ex0_ timing_ ct_ gstep_ Sigma_e_ fname_ lgx_orig_ord_ iter_ options_ dr_ oo_ trend_coeff_ eigenvalues_
global M_
M_.ex_det_length = 0;
M_.dname = 'US_FRB03_rep';
endo_nbr=0;exo_nbr=0;exo_det_nbr=0;
dsmpl_=0;
dynatol_=0.00001;
maxit_=10;
slowc_=1;
timing_=0;
ct_=0;
gstep_=1e-2;
endval_=0;rplottype_=0;
valf_=0;
y_=[];
ex_=[];
ex_det_=[];
fname_ = 'US_FRB03_rep';
logname_ = 'US_FRB03_rep.log';
diary off;
warning off;
delete US_FRB03_rep.log;
warning on;
warning backtrace;
diary US_FRB03_rep.log;
options_ = [];
























lgy_ = 'cashfl';
lgy_ = str2mat(lgy_,'dlepl1');
lgy_ = str2mat(lgy_,'dlepl3');
lgy_ = str2mat(lgy_,'dlepl5');
lgy_ = str2mat(lgy_,'dlfpc');
lgy_ = str2mat(lgy_,'dlfpcl2');
lgy_ = str2mat(lgy_,'dlfpx');
lgy_ = str2mat(lgy_,'dlfpxl2');
lgy_ = str2mat(lgy_,'dlfpxr');
lgy_ = str2mat(lgy_,'dlpl');
lgy_ = str2mat(lgy_,'dlpll2');
lgy_ = str2mat(lgy_,'dlpxp');
lgy_ = str2mat(lgy_,'dlpxpf2');
lgy_ = str2mat(lgy_,'dlpxpl2');
lgy_ = str2mat(lgy_,'drffe');
lgy_ = str2mat(lgy_,'dxbl1');
lgy_ = str2mat(lgy_,'dxbl3');
lgy_ = str2mat(lgy_,'dxbl5');
lgy_ = str2mat(lgy_,'ec');
lgy_ = str2mat(lgy_,'ecd');
lgy_ = str2mat(lgy_,'ecdo');
lgy_ = str2mat(lgy_,'ecdv');
lgy_ = str2mat(lgy_,'ecnd');
lgy_ = str2mat(lgy_,'ecnia');
lgy_ = str2mat(lgy_,'eg');
lgy_ = str2mat(lgy_,'egf');
lgy_ = str2mat(lgy_,'egfi');
lgy_ = str2mat(lgy_,'egfil2');
lgy_ = str2mat(lgy_,'egfl');
lgy_ = str2mat(lgy_,'egfll2');
lgy_ = str2mat(lgy_,'egfo');
lgy_ = str2mat(lgy_,'egfol2');
lgy_ = str2mat(lgy_,'egfos');
lgy_ = str2mat(lgy_,'egs');
lgy_ = str2mat(lgy_,'egsi');
lgy_ = str2mat(lgy_,'egsil2');
lgy_ = str2mat(lgy_,'egsl');
lgy_ = str2mat(lgy_,'egsll2');
lgy_ = str2mat(lgy_,'egso');
lgy_ = str2mat(lgy_,'egsol2');
lgy_ = str2mat(lgy_,'eh');
lgy_ = str2mat(lgy_,'ei');
lgy_ = str2mat(lgy_,'em');
lgy_ = str2mat(lgy_,'emo');
lgy_ = str2mat(lgy_,'epd');
lgy_ = str2mat(lgy_,'epdl2');
lgy_ = str2mat(lgy_,'eps');
lgy_ = str2mat(lgy_,'epsl2');
lgy_ = str2mat(lgy_,'ex');
lgy_ = str2mat(lgy_,'fcbnr');
lgy_ = str2mat(lgy_,'fgdp');
lgy_ = str2mat(lgy_,'fgdpl2');
lgy_ = str2mat(lgy_,'fgdpl4');
lgy_ = str2mat(lgy_,'fgdpl6');
lgy_ = str2mat(lgy_,'fninr');
lgy_ = str2mat(lgy_,'fpxr');
lgy_ = str2mat(lgy_,'gfdbtnr');
lgy_ = str2mat(lgy_,'gfdbtyl2');
lgy_ = str2mat(lgy_,'gfdbtyl4');
lgy_ = str2mat(lgy_,'gfdefnr');
lgy_ = str2mat(lgy_,'gfintnr');
lgy_ = str2mat(lgy_,'gftrd');
lgy_ = str2mat(lgy_,'gsdbtnr');
lgy_ = str2mat(lgy_,'gsdbtyl2');
lgy_ = str2mat(lgy_,'gsdbtyl4');
lgy_ = str2mat(lgy_,'gsintnr');
lgy_ = str2mat(lgy_,'gssrpnr');
lgy_ = str2mat(lgy_,'gstrd');
lgy_ = str2mat(lgy_,'hgxemo');
lgy_ = str2mat(lgy_,'inflation');
lgy_ = str2mat(lgy_,'inflationq');
lgy_ = str2mat(lgy_,'interest');
lgy_ = str2mat(lgy_,'jccanr');
lgy_ = str2mat(lgy_,'kcd');
lgy_ = str2mat(lgy_,'kh');
lgy_ = str2mat(lgy_,'kimt');
lgy_ = str2mat(lgy_,'kimtl2');
lgy_ = str2mat(lgy_,'kio');
lgy_ = str2mat(lgy_,'kpd');
lgy_ = str2mat(lgy_,'kps');
lgy_ = str2mat(lgy_,'leh');
lgy_ = str2mat(lgy_,'leor');
lgy_ = str2mat(lgy_,'lep');
lgy_ = str2mat(lgy_,'lf');
lgy_ = str2mat(lgy_,'lhp');
lgy_ = str2mat(lgy_,'lprdgt');
lgy_ = str2mat(lgy_,'ltfpt');
lgy_ = str2mat(lgy_,'lur');
lgy_ = str2mat(lgy_,'lurnat');
lgy_ = str2mat(lgy_,'lwps');
lgy_ = str2mat(lgy_,'lwpss');
lgy_ = str2mat(lgy_,'lzdxb');
lgy_ = str2mat(lgy_,'lzec1');
lgy_ = str2mat(lgy_,'lzec2');
lgy_ = str2mat(lgy_,'lzec3');
lgy_ = str2mat(lgy_,'lzec4');
lgy_ = str2mat(lgy_,'lzgapc1');
lgy_ = str2mat(lgy_,'lzgapc2');
lgy_ = str2mat(lgy_,'lzgapc3');
lgy_ = str2mat(lgy_,'lzkimt');
lgy_ = str2mat(lgy_,'lzlhp');
lgy_ = str2mat(lgy_,'lzlur1');
lgy_ = str2mat(lgy_,'lzlur2');
lgy_ = str2mat(lgy_,'lzpib5');
lgy_ = str2mat(lgy_,'lzpl');
lgy_ = str2mat(lgy_,'lzpxp');
lgy_ = str2mat(lgy_,'lzrccdo');
lgy_ = str2mat(lgy_,'lzrccdv');
lgy_ = str2mat(lgy_,'lzrcch');
lgy_ = str2mat(lgy_,'lzsdv');
lgy_ = str2mat(lgy_,'lzvpd');
lgy_ = str2mat(lgy_,'lzxb');
lgy_ = str2mat(lgy_,'lzynid');
lgy_ = str2mat(lgy_,'one');
lgy_ = str2mat(lgy_,'output');
lgy_ = str2mat(lgy_,'outputgap');
lgy_ = str2mat(lgy_,'pcengr');
lgy_ = str2mat(lgy_,'pcengr10');
lgy_ = str2mat(lgy_,'pcengrl2');
lgy_ = str2mat(lgy_,'pcengrl4');
lgy_ = str2mat(lgy_,'pcengrl6');
lgy_ = str2mat(lgy_,'pcengrl8');
lgy_ = str2mat(lgy_,'pcf2');
lgy_ = str2mat(lgy_,'pcl2');
lgy_ = str2mat(lgy_,'pcr');
lgy_ = str2mat(lgy_,'pcrl2');
lgy_ = str2mat(lgy_,'pgasr');
lgy_ = str2mat(lgy_,'pgasrl2');
lgy_ = str2mat(lgy_,'pgdpr');
lgy_ = str2mat(lgy_,'picnia');
lgy_ = str2mat(lgy_,'picnia10');
lgy_ = str2mat(lgy_,'picniaf2');
lgy_ = str2mat(lgy_,'picniaf4');
lgy_ = str2mat(lgy_,'picniaf6');
lgy_ = str2mat(lgy_,'picnial2');
lgy_ = str2mat(lgy_,'picnial4');
lgy_ = str2mat(lgy_,'picnial6');
lgy_ = str2mat(lgy_,'picnial8');
lgy_ = str2mat(lgy_,'pitarg');
lgy_ = str2mat(lgy_,'plminr');
lgy_ = str2mat(lgy_,'plr');
lgy_ = str2mat(lgy_,'pmor');
lgy_ = str2mat(lgy_,'pmorl2');
lgy_ = str2mat(lgy_,'poilr');
lgy_ = str2mat(lgy_,'poilrs');
lgy_ = str2mat(lgy_,'ptr');
lgy_ = str2mat(lgy_,'pxbr');
lgy_ = str2mat(lgy_,'pxbrl2');
lgy_ = str2mat(lgy_,'pxgr');
lgy_ = str2mat(lgy_,'pxp');
lgy_ = str2mat(lgy_,'qec');
lgy_ = str2mat(lgy_,'qecl2');
lgy_ = str2mat(lgy_,'qecl4');
lgy_ = str2mat(lgy_,'qlhp');
lgy_ = str2mat(lgy_,'qplr');
lgy_ = str2mat(lgy_,'qplrf2');
lgy_ = str2mat(lgy_,'qpmor');
lgy_ = str2mat(lgy_,'qpxgr');
lgy_ = str2mat(lgy_,'qpxpr');
lgy_ = str2mat(lgy_,'qsdv');
lgy_ = str2mat(lgy_,'qyhibnr');
lgy_ = str2mat(lgy_,'qynidnr');
lgy_ = str2mat(lgy_,'rcar');
lgy_ = str2mat(lgy_,'rcbe');
lgy_ = str2mat(lgy_,'rcbes');
lgy_ = str2mat(lgy_,'rdp');
lgy_ = str2mat(lgy_,'rffe');
lgy_ = str2mat(lgy_,'rffel2');
lgy_ = str2mat(lgy_,'rfftay');
lgy_ = str2mat(lgy_,'rffvar');
lgy_ = str2mat(lgy_,'rg10e');
lgy_ = str2mat(lgy_,'rg10es');
lgy_ = str2mat(lgy_,'rg5e');
lgy_ = str2mat(lgy_,'rg5es');
lgy_ = str2mat(lgy_,'rgfint');
lgy_ = str2mat(lgy_,'rgsint');
lgy_ = str2mat(lgy_,'rme');
lgy_ = str2mat(lgy_,'rstar');
lgy_ = str2mat(lgy_,'rtbe');
lgy_ = str2mat(lgy_,'rtr');
lgy_ = str2mat(lgy_,'tfpnr');
lgy_ = str2mat(lgy_,'trfci');
lgy_ = str2mat(lgy_,'trfp');
lgy_ = str2mat(lgy_,'trfpt');
lgy_ = str2mat(lgy_,'trsci');
lgy_ = str2mat(lgy_,'trsib');
lgy_ = str2mat(lgy_,'trsp');
lgy_ = str2mat(lgy_,'trspt');
lgy_ = str2mat(lgy_,'trssi');
lgy_ = str2mat(lgy_,'tryh');
lgy_ = str2mat(lgy_,'tspnr');
lgy_ = str2mat(lgy_,'veoa');
lgy_ = str2mat(lgy_,'vpd');
lgy_ = str2mat(lgy_,'vpda');
lgy_ = str2mat(lgy_,'vpdl10');
lgy_ = str2mat(lgy_,'vpdl2');
lgy_ = str2mat(lgy_,'vpdl4');
lgy_ = str2mat(lgy_,'vpdl6');
lgy_ = str2mat(lgy_,'vpdl8');
lgy_ = str2mat(lgy_,'wpo');
lgy_ = str2mat(lgy_,'xb');
lgy_ = str2mat(lgy_,'xbf2');
lgy_ = str2mat(lgy_,'xbnr');
lgy_ = str2mat(lgy_,'xg');
lgy_ = str2mat(lgy_,'xgap');
lgy_ = str2mat(lgy_,'xgap2');
lgy_ = str2mat(lgy_,'xgap2f2');
lgy_ = str2mat(lgy_,'xgap2f4');
lgy_ = str2mat(lgy_,'xgap2f6');
lgy_ = str2mat(lgy_,'xgap2l2');
lgy_ = str2mat(lgy_,'xgapl2');
lgy_ = str2mat(lgy_,'xgdp');
lgy_ = str2mat(lgy_,'xgdpnr');
lgy_ = str2mat(lgy_,'xgdpt');
lgy_ = str2mat(lgy_,'xgnr');
lgy_ = str2mat(lgy_,'xgpot');
lgy_ = str2mat(lgy_,'xothtl10');
lgy_ = str2mat(lgy_,'xothtl2');
lgy_ = str2mat(lgy_,'xothtl4');
lgy_ = str2mat(lgy_,'xothtl6');
lgy_ = str2mat(lgy_,'xothtl8');
lgy_ = str2mat(lgy_,'xp');
lgy_ = str2mat(lgy_,'yh');
lgy_ = str2mat(lgy_,'yhibnr');
lgy_ = str2mat(lgy_,'yhinr');
lgy_ = str2mat(lgy_,'yhl');
lgy_ = str2mat(lgy_,'yhp');
lgy_ = str2mat(lgy_,'yhpntnr');
lgy_ = str2mat(lgy_,'yht');
lgy_ = str2mat(lgy_,'ynicpnr');
lgy_ = str2mat(lgy_,'ynidnr');
lgy_ = str2mat(lgy_,'yniinr');
lgy_ = str2mat(lgy_,'yninr');
lgy_ = str2mat(lgy_,'ypnr');
lgy_ = str2mat(lgy_,'zdivgr');
lgy_ = str2mat(lgy_,'zdxb');
lgy_ = str2mat(lgy_,'zdxbl2');
lgy_ = str2mat(lgy_,'zec1');
lgy_ = str2mat(lgy_,'zec2');
lgy_ = str2mat(lgy_,'zec3');
lgy_ = str2mat(lgy_,'zec4');
lgy_ = str2mat(lgy_,'zertay');
lgy_ = str2mat(lgy_,'zervar');
lgy_ = str2mat(lgy_,'zgap05');
lgy_ = str2mat(lgy_,'zgap10');
lgy_ = str2mat(lgy_,'zgap30');
lgy_ = str2mat(lgy_,'zgapc1');
lgy_ = str2mat(lgy_,'zgapc2');
lgy_ = str2mat(lgy_,'zgapc3');
lgy_ = str2mat(lgy_,'zkimt');
lgy_ = str2mat(lgy_,'zkimtl2');
lgy_ = str2mat(lgy_,'zlhp');
lgy_ = str2mat(lgy_,'zlur1');
lgy_ = str2mat(lgy_,'zlur1l2');
lgy_ = str2mat(lgy_,'zlur2');
lgy_ = str2mat(lgy_,'zlur2l2');
lgy_ = str2mat(lgy_,'zpi05');
lgy_ = str2mat(lgy_,'zpi10');
lgy_ = str2mat(lgy_,'zpi30');
lgy_ = str2mat(lgy_,'zpib5');
lgy_ = str2mat(lgy_,'zpl');
lgy_ = str2mat(lgy_,'zpll2');
lgy_ = str2mat(lgy_,'zpxp');
lgy_ = str2mat(lgy_,'zpxpl2');
lgy_ = str2mat(lgy_,'zrccdo');
lgy_ = str2mat(lgy_,'zrccdv');
lgy_ = str2mat(lgy_,'zrcch');
lgy_ = str2mat(lgy_,'zrff05');
lgy_ = str2mat(lgy_,'zrff10');
lgy_ = str2mat(lgy_,'zrff30');
lgy_ = str2mat(lgy_,'zsdv');
lgy_ = str2mat(lgy_,'zvpd');
lgy_ = str2mat(lgy_,'zvpdl2');
lgy_ = str2mat(lgy_,'zxb');
lgy_ = str2mat(lgy_,'zxbl2');
lgy_ = str2mat(lgy_,'zyh');
lgy_ = str2mat(lgy_,'zyhp');
lgy_ = str2mat(lgy_,'zyht');
lgy_ = str2mat(lgy_,'zynid');
endo_nbr = 279;



lgx_ = 'dlfgdp_';
lgx_ = str2mat(lgx_,'dlfpc_');
lgx_ = str2mat(lgx_,'dlfpxr_');
lgx_ = str2mat(lgx_,'dlpl_');
lgx_ = str2mat(lgx_,'dlpxp_');
lgx_ = str2mat(lgx_,'ec_');
lgx_ = str2mat(lgx_,'ecdo_');
lgx_ = str2mat(lgx_,'ecdv_');
lgx_ = str2mat(lgx_,'egfi_');
lgx_ = str2mat(lgx_,'egfl_');
lgx_ = str2mat(lgx_,'egsi_');
lgx_ = str2mat(lgx_,'egsl_');
lgx_ = str2mat(lgx_,'egso_');
lgx_ = str2mat(lgx_,'eh_');
lgx_ = str2mat(lgx_,'emo_');
lgx_ = str2mat(lgx_,'epd_');
lgx_ = str2mat(lgx_,'eps_');
lgx_ = str2mat(lgx_,'ex_');
lgx_ = str2mat(lgx_,'fiscal_');
lgx_ = str2mat(lgx_,'gftrd_');
lgx_ = str2mat(lgx_,'gstrd_');
lgx_ = str2mat(lgx_,'interest_');
lgx_ = str2mat(lgx_,'kimt_');
lgx_ = str2mat(lgx_,'kio_');
lgx_ = str2mat(lgx_,'leor_');
lgx_ = str2mat(lgx_,'lep_');
lgx_ = str2mat(lgx_,'lf_');
lgx_ = str2mat(lgx_,'lhp_');
lgx_ = str2mat(lgx_,'lwps_');
lgx_ = str2mat(lgx_,'pcengr_');
lgx_ = str2mat(lgx_,'pcr_');
lgx_ = str2mat(lgx_,'pgasr_');
lgx_ = str2mat(lgx_,'pmor_');
lgx_ = str2mat(lgx_,'poilr_');
lgx_ = str2mat(lgx_,'ptr_');
lgx_ = str2mat(lgx_,'rcar_');
lgx_ = str2mat(lgx_,'rcbe_');
lgx_ = str2mat(lgx_,'rdp_');
lgx_ = str2mat(lgx_,'rffvar_');
lgx_ = str2mat(lgx_,'rg10e_');
lgx_ = str2mat(lgx_,'rg5e_');
lgx_ = str2mat(lgx_,'rgfint_');
lgx_ = str2mat(lgx_,'rme_');
lgx_ = str2mat(lgx_,'rtbe_');
lgx_ = str2mat(lgx_,'rtr_');
lgx_ = str2mat(lgx_,'trfci_');
lgx_ = str2mat(lgx_,'trfp_');
lgx_ = str2mat(lgx_,'trsci_');
lgx_ = str2mat(lgx_,'trsib_');
lgx_ = str2mat(lgx_,'trsp_');
lgx_ = str2mat(lgx_,'trssi_');
lgx_ = str2mat(lgx_,'yhibnr_');
lgx_ = str2mat(lgx_,'ynidnr_');
lgx_orig_ord_ = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 ...
 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 ...
 48 49 50 51 52 53];
exo_nbr = 53;




global anton bfi1 bfi2 datet dlpcr1 dlpxp1 dlpxp2 dmptay dmpvar dptr 
global ecd1 ecd2 ecnd1 ecnd2 ecnia1 eg1 eg2 egf1 egf2 egf3 
global egfo1 egs1 egs2 egs3 em1 em2 emn1 emn2 emp1 emp2 
global fcbn1 fcbn2 fcbn3 fcbn4 fnin1 fnin2 fpxr1 fynin1 fynin2 gfdbtn1 
global gfdbtn2 gfdbtn3 gfdefn1 gfdefn10 gfdefn11 gfdefn2 gfdefn3 gfdefn4  ...
gfdefn5 gfdefn6 
global gfdefn7 gfdefn8 gfdefn9 gfintn1 gfptn1 gsdbtn1 gsdbtn2 gsdbtn3  ...
gsector gshock4 
global gsintn1 gsintn2 gsptn1 gssrpn1 gssrpn10 gssrpn11 gssrpn2 gssrpn3  ...
gssrpn4 gssrpn5 
global gssrpn6 gssrpn7 gssrpn8 gssrpn9 iscurve jccan1 jccan2 jccan3 kcd1  ...
kcd2 
global kh1 kh2 ki1 ki2 kpd1 kpd2 kps1 kps2 laginfo lagpi1 
global lagpi2 lagpi3 lagpi4 leadinfo leadpi0 leadpi1 leadpi10 leadpi11  ...
leadpi12 leadpi13 
global leadpi14 leadpi15 leadpi16 leadpi17 leadpi18 leadpi19 leadpi1l  ...
leadpi2 leadpi20 leadpi3 
global leadpi4 leadpi5 leadpi6 leadpi7 leadpi8 leadpi9 leh1 leh2 leh3 leh4 
global ltfpt1 lur1 lurnat1 lwps1 pcrec pgasrec pitarg1 plminr1 poilr1  ...
poilr4 
global profit1 profit2 profit3 profit4 ptr1 pwfix qpxp1 qpxp10 qpxp2 qpxp3 
global qpxp4 qpxp5 qpxp6 qpxp7 qpxp8 qpxp9 qsector qyhibnr1 qyhibnr2  ...
qyhibnr3 
global qynid1 qynid2 qynid3 rcbe1 rg10e1 rg51 rg5e1 rstar1 rstarsh rtb1 
global rtr1 shortlag sprule stockoff taxon tayc0 taye0 tayfi0 tayg0 tayii0 
global taymu0 taymu1 tayp0 tayp1 tayp12 tayp16 tayp2 tayp3 tayp4 tayp8 
global taypl0 taypl1 taypl2 taypl3 taypl4 tayplm1 tayplm2 tayplm3 tayplm4  ...
taypm1 
global taypm10 taypm11 taypm12 taypm13 taypm14 taypm15 taypm16 taypm17  ...
taypm18 taypm19 
global taypm2 taypm20 taypm3 taypm4 taypm5 taypm6 taypm7 taypm8 taypm9  ...
tayr1 
global tayr2 tayr3 tayr4 tayre0 tayrl0 taysp0 tayu0 tayu1 tayul1 tayul2 
global tayul3 tayul4 tayx0 tayx1 tayx2 tayx3 tayx4 tayxm1 tayxm2 tayxm3 
global tayxm4 tayxm5 tayxm6 tayxm7 tayxm8 tfpn1 tfpn2 tfpn3 tfpn4 trfci1 
global trfp1 trfpt1 trfpt2 trsci1 trsib1 trsp1 trspt1 trspt2 trssi1 tryh1 
global tryh2 tryh3 tryh4 tspn1 tspn2 tspn3 tspn4 vpda1 vpda2 wpo1 
global wpo2 wpo3 wpo4 wpo5 wpo6 xb1 xb2 xb3 xbn1 xbn2 
global xbn3 xg1 xg2 xg3 xgaprho xgdp1 xgdp10 xgdp2 xgdp3 xgdp4 
global xgdp5 xgdp6 xgdp7 xgdp8 xgdp9 xgdpn1 xgdpn2 xgdpn3 xgdpn4 xgdpn5 
global xgdpn6 xgdpn7 xgdpn8 xgdpt1 xgdpt2 xgn1 xgn2 xgn3 xgn4 xgn5 
global xgpot1 xgpot2 xgpot3 xgpot4 xgv1 xgv2 xotht1 xotht2 xotht3 xp1 
global xp2 xp3 xp4 xp5 xp6 xp7 xp8 xp9 yh1 yh2 
global yh3 yhinr1 yhinr2 yhinr3 yhinr4 yhl1 yhln1 yhln2 yhln3 yhp1 
global yhp2 yhp3 yhpntfix yhpntn1 yhpntn2 yhpntn3 yhpntn4 yhpntn5 yhpntn6  ...
yhpntn7 
global yhpntn8 yhpntn9 yhptn1 yhptn2 yhptn3 yhtn1 yhtn2 ynicpn1 ynicpn2  ...
ynicpn3 
global ynicpn4 yniln1 yniln2 yniln3 ynin1 ynin2 ynin3 ynin4 ynin5 ynin6 
global ynin7 ypn1 ypn10 ypn2 ypn3 ypn4 ypn5 ypn6 ypn7 ypn8 
global ypn9 



stockoff = 0;
pcrec	= 0.1;
pgasrec	= 0.1;
pwfix	=  0;
iscurve =  0;
shortlag = 0;
xgaprho =  0;
datet	=  0;









anton	=  1;
taxon	=  1;
yhpntfix=  0;
ltfpt1  =  0;
plminr1	=  0;
lurnat1 =  0;
dmptay	=  1;
dmpvar	=  0;
qsector	=  1;
gsector =  1;
gshock4	=  0;
egfo1	=  0;
poilr4	=  0;
poilr1  =  0;

rstar1	=  0.95;
rstarsh =  0;
pitarg1	=  1;
rtr1	=  rstar1;

dptr    =  1 ;
ptr1	=  0;
rg5e1	=  0.8370;
rg10e1	=  0.8552;
rcbe1	=  0.8930;
lwps1	=  0.9131;
trfpt1	=  0.05;
trfpt2	=  0.50;
trspt1	=  0.05;
trspt2	=  0.50;

%tayr1	=  0.620293583474;
%tayr2	= -0.0578095589655;
%tayr3	=  0.246517098053;
%tayr4	=  0.0672965169207;
%tayp0	= -0.0920562089085;
%tayp1	=  0.17135465387;
%tayp2	=  0.0689014399685;
%tayp3	=  0.226770600238;
%tayx0	=  0.840416045966;
%tayx1	= -0.206994650785;
%tayx2	= -0.102521604026;
%tayx3	= -0.271316618104;

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

tayr1	=	0.76;

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



options_.linear=1;
iy_ = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
temp = [ 0 3 4 5 6 7 8 9 0 10 11 12 0 0 0 13 14 0 15 0 16 17 0 0 0 0 18 0  ...
19 0 20 0 0 0 21 0 22 0 23 0 24 0 0 25 26 0 27 0 28 0 29 30 31 32 0 33 34 35 ...
 0 0 0 0 36 37 0 0 0 0 0 0 38 0 39 0 40 41 42 43 0 0 0 0 44 0 45 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 46 0 47 48 49 50 0 0 51  ...
52 53 0 0 54 0 0 0 0 55 56 57 58 0 0 0 59 0 60 0 0 61 0 0 62 63 64 0 65 0 0 ...
 0 0 0 0 0 0 66 0 0 0 67 68 0 0 0 0 0 0 0 0 69 0 70 0 0 71 72 73 74 0 0 0 75 ...
 0 0 0 76 0 0 77 78 79 80 0 81 0 0 0 82 83 0 0 0 0 84 0 85 0 0 86 0 87 88 89 ...
 90 0 91 92 0 0 0 0 0 93 94 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
iy_ = [ iy_ ; temp ];
temp = [ 95 96 97 98 99 100 101 102 0 103 104 105 0 106 0 107 108 109 110 0 ...
 111 112 0 0 0 0 113 114 115 116 117 118 119 0 120 121 122 123 124 125 126 0 ...
 0 127 128 129 130 131 132 0 133 0 0 0 134 135 136 0 137 0 0 138 139 0 140 0 ...
 0 141 142 0 143 144 145 146 147 148 149 150 151 152 0 153 154 155 156 0 157 ...
 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 ...
 177 178 179 180 181 182 183 184 0 185 186 187 188 189 190 191 0 0 192 0 193 ...
 194 0 195 0 0 0 0 196 0 0 0 197 198 199 200 201 202 203 204 205 206 207 208 ...
 209 210 211 212 213 0 214 0 215 216 217 218 219 0 220 221 222 223 0 0 224  ...
225 226 227 228 0 229 230 231 232 0 233 234 235 236 237 238 239 240 0 0 241  ...
242 243 244 245 246 247 248 0 249 0 0 0 250 251 0 0 0 0 252 253 254 0 0 255  ...
256 257 258 259 260 0 261 262 0 0 0 0 0 263 264 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
iy_ = [ iy_ ; temp ];
temp = [ 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280  ...
281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299  ...
300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318  ...
319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337  ...
338 339 340 341 342 343 344 345 346 347 348 349 350 351 352 353 354 355 356  ...
357 358 359 360 361 362 363 364 365 366 367 368 369 370 371 372 373 374 375  ...
376 377 378 379 380 381 382 383 384 385 386 387 388 389 390 391 392 393 394  ...
395 396 397 398 399 400 401 402 403 404 405 406 407 408 409 410 411 412 413  ...
414 415 416 417 418 419 420 421 422 423 424 425 426 427 428 429 430 431 432  ...
433 434 435 436 437 438 439 440 441 442 443 444 445 446 447 448 449 450 451  ...
452 453 454 455 456 457 458 459 460 461 462 463 464 465 466 467 468 469 470  ...
471 472 473 474 475 476 477 478 479 480 481 482 483 484 485 486 487 488 489  ...
490 491 492 493 494 495 496 497 498 499 500 501 502 503 504 505 506 507 508  ...
509 510 511 512 513 514 515 516 517 518 519 520 521 522 523 524 525 526 527  ...
528 529 530 531 532 533 534 535 536 537 538 539 540 541 542 543];
iy_ = [ iy_ ; temp ];
temp = [ 0 0 0 0 0 0 0 0 0 0 0 544 545 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 546 0 0 0 547 0 0 548 549 0 0 0 550 551 0 552 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 553 0 0 0 0 0 0 0 554 555 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 556 557 0 558 559 560 561 0 0 ...
 562 563 564 565 566 567 568 569 570 571 572 573 574 575 576 577 578 579 580 ...
 581 582 583 584 585 586 587 588 589 590 591 592 593 594 595 596 597];
iy_ = [ iy_ ; temp ];
temp = [ 0 0 0 0 0 0 0 0 0 0 0 598 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 599 0 0 0 0 600 0 601 602 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 603 0 0 0 0 604 605 0 0 606 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 607 0 0 0 0 0 0 0 608 0 0 0 0 609 610 611 0 ...
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 612 613 614 615 616 617 ...
 0 0 0 0 0 618 619 620 621 622 623 624 0 625 626 0 0 0 0 627 628 629 0 630  ...
631 632 0 0 0 633 634 0 635 0 0 0 0 636];
iy_ = [ iy_ ; temp ];
ykmin_ = 3;
ykmax_ = 2;
xkmin_ = 0;
xkmax_ = 0;
zkmin_ = 0;
zkmax_ = 0;
ys_ = zeros(279,1);
exe_ = zeros(53,1);


% (M)SHOCKS 
make_ex_;
shocks_file(0);
Sigma_e_ = zeros(53,53);
Sigma_e_(22,22) = 1;



options_.irf=16;
options_.nograph=1;
options_.noprint=1;
var_list_ = 'interest';
var_list_ = str2mat(var_list_,'inflationq');
var_list_ = str2mat(var_list_,'outputgap');
info=stoch_simul(var_list_);


save('US_FRB03_rep_results','oo_','dr_');
diary off
