// Title: An Area-Wide Model (AWM) for the Euro Area
// Authors: Gabriel Fagan, Jerome Henry, Ricardo Mestre
// Publication: ECB Working Paper 42. January 2001

// This file simulates the dynamic response of the model to specific shocks

var stn lnn wrn piyfd pipcd itr itd pieen pimtd pcr lsr xtr mtr ltn pixtd
    ywd compr ywr gcr nfn tdn_yen ign piyet urx lprod yett pcd mtd picompr
    ulc ult ksr strq xtd piywdx pipyr piyer scr fdd ywrx ywdx tbr yer pcn
    itn xtn mtn tbn can nfa pyn pyr wln win tdn trn gln_yen gyn gsn gln
    gdn inn lagksr1 lagksr2 lagwrn1 lagwrn2 lagwrn3 
    lagwrn4 lagwrn5 lagpcd1 lagpcd2 lagpcd3 lagpcd4 lagpcd5 laglprod1
    laglprod2 laglprod3 laglprod4 laglprod5 lagpipcd1 lagpipcd2 lagpipcd3   
    lagpipcd4 lagult1 lagult2 lagult3 lagpiyfd1 lagpiyfd2 lagitr1 lagitr2
    lagitd1 lagitd2 lagitd3 lagitd4 lagitd5 lagitd6 lagitd7 lagmtd1 lagmtd2     
    lagmtd3 lagmtd4 lagmtd5 lagmtd6 lagstn1 lagpiyer1 lagpiyer2 laglsr1     
    lagxtr1 lagxtr2 lagxtr3 lagxtr4 lagxtr5 lagxtr6 lagxtr7 lagywrx1 
    lagywrx2 lagywrx3 lagywrx4 lagywrx5 lagywrx6 lagywrx7 lagpixtd1 lagpixtd2    
    lagpiywdx1 lagpiywdx2 lagnfa1 laggln_yen1 laggln_yen2 laggln_yen3 lagltn1     
    lagltn2 lagltn3 lagltn4 lagltn5 lagltn6 lagltn7 lagltn8 lagltn9 lagltn10    
    lagltn11 lagltn12 lagltn13 lagltn14 lagltn15 lagltn16 lagltn17 lagltn18    
    lagltn19 lagltn20 lagltn21 lagltn22 lagltn23 lagltn24 lagltn25 lagltn26    
    lagltn27 lagltn28 lagltn29 lagltn30 lagltn31 lagltn32 lagltn33 lagltn34    
    lagltn35 lagltn36 lagltn37 lagltn38 lagltn39 lagltn40 lagltn41 lagltn42    
    lagltn43 lagltn44 lagltn45 lagltn46 lagltn47 lagywd1 lagywd2 lagywd3 
    lagpieen1 lagpieen2 lagcompr1 lagcompr2 laggcr1 lagywr1 lagywr2 lagpiyet1   
    yet infl dstn
    innoextdend // needed to include a lead shock
    inflationlag1 inflationlag2 inflationlag3
    outputlag1 outputlag2 outputlag3
    interestlag1 interestlag2 interestlag3   // these lags are needed for the policyrule

//**************************************************************************    
        interest inflation inflationq  outputgap // Modelbase Variables  //*
        output;   			          			 //*
//**************************************************************************  


varexo  innoelnn innoewrn innoeyfd innoepcd innoeitr innoeitd   
    	innoextd innoemtd innoepcr innoelsr innoextr innoemtr innoeltn

//**************************************************************************       
        interest_ fiscal_;                         // Modelbase Shocks   //*
//**************************************************************************


parameters BETABIG DELTABIG HICP__CST HICP__D1 HICP__D11 HICP__LHICPMTD HICP__LHICPPCD 
           HICP__LHICPULC ITD__CST ITD__DDLMTD ITD__DDLYFD ITD__DLITDMTD1 
           ITD__DLITDMTD5 ITD__DLITDMTD6 ITD__DLITDYFD1 ITD__DLITDYFD4 
           ITD__DLITDYFD7  ITD__ECM1 ITD__ECM2 ITR__ADJ ITR__D894 ITR__DITY1
           ITR__ECM LNN__D841 LNN__D872 LNN__DLLNT LNN__DLWRRADJ LNN__DLWRRADJ1 
           LNN__DLYERADJ LNN__ECM LSR__CST LSR__DLSR1 LSR__DLSTR LSR__ECM 
           LSR__DYER1 LSR__DYER2 LTN__CST LTN__DDSTN LTN__DLTNSTN1 LTN__LTNSTN1
           MEAN__LSX MTD__CST MTD__DLCOMPR MTD__DLCOMPR1 MTD__DLMTD1 MTD__DLYWDX 
           MTD__ECM MTD__ECM1 MTD__ECM2 MTR__CST MTR__D743 MTR__DLFDD MTR__ECM 
           MTR__ECM__LMTDYED MTR__ECM__TIME NFN__NFA NFN__NFN PCD__CST PCD__DI82Q1 
           PCD__DI92Q4 PCD__DLCOMPREEN PCD__DLMTD PCD__DLMTD1 PCD__DLPCD4 
           PCD__DLYED PCD__DLYED1 PCD__ECM PCD__ECM__LMTD PCD__ECM__LYED 
           PCD__I77Q4I78Q1 PCR__CST PCR__DLPYR PCR__DLSTR PCR__DURX PCR__ECM 
           PCR__ECM__LPYR PCR__ECM__LWLR PCR__I93Q1 PCR__LPYR PCR__LWLR
           TDN__GLN WRN__DDLPCD WRN__DDLPCD1 WRN__DDLPCD2 WRN__DDLPCD3 
           WRN__DDLPROD WRN__DDLPROD1 WRN__DDLPROD2 WRN__DDLPROD3 WRN__DDLPROD4 
           WRN__DLWRCQ4 WRN__ECM WRN__I81Q1 WRN__I84Q2 WRN__I98Q1 WRN__INFT 
           WRN__LURX_GAP1 XTD__CST XTD__DLEEN XTD__DLMTD XTD__DLXTD1 XTD__DLYED 
           XTD__ECM XTD__ECM1 XTD__ECM2 XTD__ECM3 XTR__CST XTR__DLXTDYWDX1 
           XTR__DLXTRYWRX7 XTR__ECM XTR__LXTDYWDX1 XTR__TIME YFD__CST YFD__DLMTD1 
           YFD__DLULT YFD__DLULT1 YFD__DLULT2 YFD__DLYFD1 YFD__ECM YFD__INFT 
           YFD__LYGA URTBAR 
           PIBAR STNBAR STRQBAR LTNRESBAR EXPLTNRESBAR YETGBAR atransfer atdn_yen
           GDN__DIS__YEN GIN__OTHER__YEN GIN__YEN GLN__YEN__TARGET INN__YEN
           PYN__DIS__YEN SSN__YEN TIN__YEN TDN__YEN__DIS TRN__FIRMS__YEN 
           TRN__OTHER__YEN TRN__YEN__DIS OGN__YEN IGN__ADJ XTD__RES MTD__RES
           ITD__RES PCD__RES LSR__RES MTR__RES TRN__YEN__DISBAR GCR__YERBAR 
           YWR__YERBAR YWDEEN__YFDBAR COMPREEN__YFDBAR PCR__YERBAR
           YED__YFDBAR XTD__YFDBAR MTD__YFDBAR ITD__YFDBAR  PCD__YFDBAR
           GCN__YENBAR GLN__YENBAR TRN__YENBAR GDN__YENBAR LTNBAR INN__YENBAR       
           GSN__YENBAR GYN__YENBAR TDN__YENBAR YIN__YENBAR YFN__YENBAR KSR__YERBAR
           ITR__YERBAR LSR__YERBAR SCR__YERBAR MTR__YERBAR XTR__YERBAR GYN__GSNBAR       
           TDN__GYNBAR SSN__GYNBAR TIN__GYNBAR OGN__GYNBAR INN__GYNBAR TRN__GYNBAR        
           TRN__OTHER__GYNBAR GIN__OTHER__GYNBAR GSN__GLNBAR GLN__GDNBAR 
           GDN__DIS__GDNBAR YFN__YINBAR YWDX__YFDBAR TBR__YERBAR YWRX__YERBAR  
           XTR__TBRBAR FDD__YERBAR PCR__FDDBAR GCR__FDDBAR ITR__FDDBAR SCR__FDDBAR       
           XTR__FDDBAR PCN__YENBAR ITN__YENBAR XTN__YENBAR MTN__YENBAR TBN__YENBAR        
           AUXa AUXb AUXc NFN__YENBAR CAN__YENBAR NFA__YENBAR PYN__YENBAR   
           TBN__CANBAR YFN__PYNBAR PYN__DIS__PYNBAR NFN__PYNBAR TIN__PYNBAR
           GYN__PYNBAR WLN__YENBAR NFA__WLNBAR KSRITD__WLNBAR GDN__WLNBAR
           XTN__TBNBAR TBN__CANBAR 
           subtract agcr aywr aywd ayett acompr

//************************************************************************** 
                                                 // Modelbase Parameters //*
									 //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
	cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintpit pitarget cofintrlb rlbar const std_r_ std_r_quart;     //*
									 //*
									 //*
// load Modelbase Monetary Policy Parameters//*
// Policy Rule Gerdesmeier and Roffia (2003)
cofintintb1 =  0.87^3; 
cofintintb2 = 0; 
cofintintb3 = 0; 
cofintintb4 = 0;
cofintinf0 = (1-0.87^3)*1.93; 
cofintinfb1 = 0; 
cofintinfb2 = 0; 
cofintinfb3 = 0; 
cofintinfb4 = 0; 
cofintinff1 = 0; 
cofintinff2 = 0; 
cofintinff3 = 0; 
cofintinff4 = 0;
cofintout = (1-0.87^3)*0.28; 
cofintoutb1 = 0; 
cofintoutb2 = 0; 
cofintoutb3 = 0; 
cofintoutb4 = 0; 
cofintoutf1 = 0; 
cofintoutf2 = 0; 
cofintoutf3 = 0; 
cofintoutf4 = 0;
cofintpit = 0;
pitarget = 0;
cofintrlb = 0;
rlbar = 0;
const = 0;
std_r_ = 1; //1.0124*1.0238;
std_r_quart = 0.0808*.25*4*3.1479; 
//**************************************************************************

BETABIG        =  0.413895;
DELTABIG          =  0.01;
HICP__CST      =  0.366631;
HICP__D1       =  0.003353;
HICP__D11      =  0.000706;
HICP__LHICPMTD = -0.005347;
HICP__LHICPPCD = -0.047578;
HICP__LHICPULC = -0.026598;
ITD__CST       =  0.004648;
ITD__DDLMTD    =  0.111071;
ITD__DDLYFD    = -0.368482;
ITD__DLITDMTD1 = -0.116393;
ITD__DLITDMTD5 =  0.047888;
ITD__DLITDMTD6 =  0.037784;
ITD__DLITDYFD1 =  0.313957;
ITD__DLITDYFD4 =  0.207904;
ITD__DLITDYFD7 =  0.16902;
ITD__ECM1      = -0.052662; 
ITD__ECM2      = -0.012261;
ITR__ADJ       =  0.01231;
ITR__D894      =  0.020823;
ITR__DITY1     =  0;
ITR__ECM       =  1.28;
LNN__D841      = -0.004429;
LNN__D872      =  0.004483;
LNN__DLLNT     =  0.692276;
LNN__DLWRRADJ  = -0.120938;
LNN__DLWRRADJ1 = -0.125018;
LNN__DLYERADJ  =  0.180177;
LNN__ECM       = -0.081495;
LSR__CST       = -0.000243;
LSR__DLSR1     =  0.737271;
LSR__DLSTR     = -0.146929;
LSR__ECM       = -0.03475;
LSR__DYER1     =  0.31435;
LSR__DYER2     =  0;
LTN__CST       =  0.043275;
LTN__DDSTN     = -0.511084;
LTN__DLTNSTN1  =  0.572504;
LTN__LTNSTN1   = -0.062762;
MEAN__LSX      =  0.707177;
MTD__CST       = -0.050886;
MTD__DLCOMPR   =  0.099;
MTD__DLCOMPR1  =  0.036614;
MTD__DLMTD1    =  0.288208;
MTD__DLYWDX    =  0.572207;
MTD__ECM       = -0.044124;
MTD__ECM1      =  0;
MTD__ECM2      =  0;
MTR__CST       = -0.158258;
MTR__D743      =  0.016717;
MTR__DLFDD     =  2.021422;
MTR__ECM       = -0.086131;
MTR__ECM__LMTDYED = -0.285416;
MTR__ECM__TIME =  0.003407;
NFN__NFA       =  0.005;
NFN__NFN       =  0.8;
PCD__CST       =  0.001263;
PCD__DI82Q1    = -0.003529;
PCD__DI92Q4    = -0.002979;
PCD__DLCOMPREEN = 0.004465;
PCD__DLMTD     =  0.071909;
PCD__DLMTD1    =  0.02538;
PCD__DLPCD4    =  0.188246;
PCD__DLYED     =  0.445458;
PCD__DLYED1    =  0.226345;
PCD__ECM       = -0.060559;
PCD__ECM__LMTD =  0.059249;
PCD__ECM__LYED =  0.940751;
PCD__I77Q4I78Q1 = -0.003981;
PCR__CST       = -0.19034;
PCR__DLPYR     =  0.650993;
PCR__DLSTR     = -0.352136;
PCR__DURX      = -0.724807;
PCR__ECM       = -0.066069;
PCR__ECM__LPYR = -0.10402;
PCR__ECM__LWLR = -0.055317;
PCR__I93Q1     = -0.008872;
PCR__LPYR      =  0.801488;
PCR__LWLR      =  0.198512;
TDN__GLN       = -0.2;
WRN__DDLPCD    = -0.919736;
WRN__DDLPCD1   = -0.571055;
WRN__DDLPCD2   = -0.470158;
WRN__DDLPCD3   = -0.334405;
WRN__DDLPROD   = -0.562628;
WRN__DDLPROD1  = -0.456273;
WRN__DDLPROD2  = -0.399817;
WRN__DDLPROD3  = -0.261245;
WRN__DDLPROD4  =  0;
WRN__DLWRCQ4   =  0.273892;
WRN__ECM       =  0.1;
WRN__I81Q1     = -0.004171;
WRN__I84Q2     = -0.012449;
WRN__I98Q1     = -0.009334;
WRN__INFT      =  0.2;
WRN__LURX_GAP1 = -0.014744;
XTD__CST       = -0.004465;
XTD__DLEEN     =  0.119249;
XTD__DLMTD     =  0.21966;
XTD__DLXTD1    =  0.236281;
XTD__DLYED     =  0.72061;
XTD__ECM       = -0.034589;
XTD__ECM1      =  0;
XTD__ECM2      =  0;
XTD__ECM3      =  0;
XTR__CST       =  0.222518;
XTR__DLXTDYWDX1 = -0.377152;
XTR__DLXTRYWRX7 = 0.15641;
XTR__ECM       = -0.121453;
XTR__LXTDYWDX1 = -0.097625;
XTR__TIME      =  0.000989;
YFD__CST       =  0.00392;
YFD__DLMTD1    =  0.031486;
YFD__DLULT     =  0.246086;
YFD__DLULT1    =  0.083541;
YFD__DLULT2    =  0.155765;
YFD__DLYFD1    =  0.229684;
YFD__ECM       = -0.045006;
YFD__INFT      =  0.2;
YFD__LYGA      =  0.03*2;
URTBAR         = 0.09104;
PIBAR           =   0.004939;
STNBAR          =   4.998913;
STRQBAR         =   (1+STNBAR/100)^(.25)-1-PIBAR;
LTNRESBAR       =   0.011645;
EXPLTNRESBAR    =   exp(LTNRESBAR);
YETGBAR         =   0.005723;
atransfer       =   1; //2;
atdn_yen        =   1; //0.95;
GDN__DIS__YEN     =   0.00384;
GIN__OTHER__YEN   =   0.001461;
GIN__YEN          =   0.023805;
GLN__YEN__TARGET  =  -0.01269;
INN__YEN          =   0.045118;
PYN__DIS__YEN     =  -0.118294;
SSN__YEN          =   0.182356;
TIN__YEN          =   0.114078;
TDN__YEN__DIS     =   -0.001829;
TRN__FIRMS__YEN   =   0.021759;
TRN__OTHER__YEN   =   0.014037;
TRN__YEN__DIS     =   0.204491;
OGN__YEN          =   0.033095;
IGN__ADJ          =   -2.065267;
XTD__RES          =   0.0025;
MTD__RES          =   0.0025;
ITD__RES          =   -0.001925;
PCD__RES          =   -0.000492;
LSR__RES          =   0.029983;
MTR__RES          =   0.0025;
TRN__YEN__DISBAR  =   0.204491;
GCR__YERBAR       =   0.138826;
YWR__YERBAR       =   8.52024841e-005;
YWDEEN__YFDBAR    =   0.684308;                     
COMPREEN__YFDBAR  =   55.345606;                   
PCR__YERBAR       =   0.685502;
YED__YFDBAR       =   1/(1-TIN__YEN);
XTD__YFDBAR       =   exp(.7*log(YED__YFDBAR)+.3*log(YWDEEN__YFDBAR)-1/XTD__ECM*( XTD__CST+XTD__RES + PIBAR*(XTD__DLXTD1 - 1 + XTD__DLYED+XTD__DLMTD)));
MTD__YFDBAR       =   exp( .65*log(XTD__YFDBAR)+.25*log(COMPREEN__YFDBAR)+.1*log(YWDEEN__YFDBAR) - 1/MTD__ECM*( MTD__CST+MTD__RES+ ( -1 +MTD__DLMTD1+MTD__DLYWDX+MTD__DLCOMPR+MTD__DLCOMPR1 )*PIBAR ) ) ;
ITD__YFDBAR       =   exp( ITD__ECM2/(ITD__ECM1+ITD__ECM2)*log(MTD__YFDBAR) - (ITD__CST+ITD__RES)/(ITD__ECM1+ITD__ECM2) ) ;
PCD__YFDBAR       =   exp( PCD__ECM__LYED*log(YED__YFDBAR)+PCD__ECM__LMTD*log(MTD__YFDBAR) - 1/PCD__ECM*( PCD__CST+PCD__RES +(PCD__DLPCD4 -1 + PCD__DLYED + PCD__DLYED1 + PCD__DLMTD + PCD__DLMTD1+PCD__DLCOMPREEN)*PIBAR ) ); 
GCN__YENBAR       =   GCR__YERBAR;
GLN__YENBAR       =   -(TDN__YEN__DIS)*2/TDN__GLN+GLN__YEN__TARGET;
TRN__YENBAR       =   0.2*atransfer*URTBAR+TRN__YEN__DIS;                                                       
GDN__YENBAR       =   (1+YETGBAR)*(1+PIBAR)/((1+YETGBAR)*(1+PIBAR)-1)*(-GLN__YENBAR/4+GDN__DIS__YEN);  
LTNBAR            =   EXPLTNRESBAR*(100+STNBAR)-100;                                                  
INN__YENBAR       =   4/100*(1/2*LTNBAR+IGN__ADJ)*GDN__YENBAR*( (1+YETGBAR)*(1+PIBAR) )^(-1);          
GSN__YENBAR       =   GLN__YENBAR+GIN__YEN;                                                          
GYN__YENBAR       =   GSN__YENBAR+GCN__YENBAR;                                                        
TDN__YENBAR       =   GYN__YENBAR-SSN__YEN-TIN__YEN-OGN__YEN+INN__YENBAR+TRN__YENBAR+TRN__OTHER__YEN+GIN__OTHER__YEN; 
YIN__YENBAR       =   1;                                                                          
YFN__YENBAR       =   (1-TIN__YEN);                                                              
KSR__YERBAR       =   ( (STRQBAR+DELTABIG+ITR__ADJ)/BETABIG )^(-1);  
ITR__YERBAR       =   (1-(1-DELTABIG)/(1+YETGBAR))*KSR__YERBAR ;                                       
LSR__YERBAR       =   exp(- ( LSR__CST+YETGBAR*(-1+.5*LSR__DYER1+LSR__DYER2+LSR__DLSR1)+LSR__RES+LSR__ECM*0.2425)/LSR__ECM); 
SCR__YERBAR       =   YETGBAR/(1+YETGBAR)*LSR__YERBAR;                                                
MTR__YERBAR       =   ( exp(1/MTR__ECM*(MTR__CST+MTR__RES-MTR__ECM__TIME*MTR__ECM*112 -MTR__ECM*MTR__ECM__LMTDYED*log(MTD__YFDBAR/YED__YFDBAR) +YETGBAR*(-1+MTR__DLFDD)))-1)^(-1) ;  
XTR__YERBAR       =    1-PCR__YERBAR-GCR__YERBAR-SCR__YERBAR-ITR__YERBAR+MTR__YERBAR;                  
GYN__GSNBAR         =   GYN__YENBAR/GSN__YENBAR; 
TDN__GYNBAR         =   TDN__YENBAR/GYN__YENBAR;  
SSN__GYNBAR         =   SSN__YEN/GYN__YENBAR; 
TIN__GYNBAR         =   TIN__YEN/GYN__YENBAR; 
OGN__GYNBAR         =   OGN__YEN/GYN__YENBAR; 
INN__GYNBAR         =   INN__YENBAR/GYN__YENBAR; 
TRN__GYNBAR         =   TRN__YENBAR/GYN__YENBAR; 
TRN__OTHER__GYNBAR   =  TRN__OTHER__YEN /GYN__YENBAR; 
GIN__OTHER__GYNBAR   =  GIN__OTHER__YEN/GYN__YENBAR; 
GSN__GLNBAR         =   GSN__YENBAR/GLN__YENBAR; 
GLN__GDNBAR         =   GLN__YENBAR/GDN__YENBAR; 
GDN__DIS__GDNBAR    =   GDN__DIS__YEN/GDN__YENBAR; 
YFN__YINBAR         =   YFN__YENBAR/YIN__YENBAR; 
YWDX__YFDBAR        =   YWDEEN__YFDBAR^(.4)*XTD__YFDBAR^(.6);                              
TBR__YERBAR         =   XTR__YERBAR-MTR__YERBAR;                                                  
YWRX__YERBAR        =   YWR__YERBAR^(.4)*(1-TBR__YERBAR)^(0.6);                                   
XTR__TBRBAR         =   XTR__YERBAR/TBR__YERBAR;
FDD__YERBAR         =   1+MTR__YERBAR;                                                       
PCR__FDDBAR         =   PCR__YERBAR/FDD__YERBAR; 
GCR__FDDBAR         =   GCR__YERBAR/FDD__YERBAR; 
ITR__FDDBAR         =   ITR__YERBAR/FDD__YERBAR; 
SCR__FDDBAR         =   SCR__YERBAR/FDD__YERBAR; 
XTR__FDDBAR         =   XTR__YERBAR/FDD__YERBAR; 
PCN__YENBAR         =   PCR__YERBAR*PCD__YFDBAR/YED__YFDBAR;                                           
ITN__YENBAR         =   ITR__YERBAR*ITD__YFDBAR/YED__YFDBAR;                                            
XTN__YENBAR         =   XTR__YERBAR*XTD__YFDBAR/YED__YFDBAR;
MTN__YENBAR         =   MTR__YERBAR*MTD__YFDBAR/YED__YFDBAR; 
TBN__YENBAR         =   XTN__YENBAR-MTN__YENBAR; 
AUXa                =   1-NFN__NFN/(1+PIBAR)/(1+YETGBAR);
AUXb                =   -NFN__NFA*( 1/(1+PIBAR)/(1+YETGBAR)+1/(1+PIBAR)^2/(1+YETGBAR)^2 );
AUXc                =   1-1/(1+YETGBAR)/(1+PIBAR);
NFN__YENBAR         =   (AUXa-AUXb/AUXc)^(-1)*AUXb/AUXc*TBN__YENBAR;
CAN__YENBAR         =   TBN__YENBAR+NFN__YENBAR;  
NFA__YENBAR         =   1/AUXc*CAN__YENBAR; 
PYN__YENBAR         =   (1-TIN__YEN)-GYN__YENBAR+TIN__YEN+NFN__YENBAR+PYN__DIS__YEN; 
TBN__CANBAR         =   TBN__YENBAR/CAN__YENBAR; 
YFN__PYNBAR         =   YFN__YENBAR/PYN__YENBAR; 
PYN__DIS__PYNBAR    =   PYN__DIS__YEN/PYN__YENBAR;  
NFN__PYNBAR         =   NFN__YENBAR/PYN__YENBAR; 
TIN__PYNBAR         =   TIN__YEN/PYN__YENBAR; 
GYN__PYNBAR         =   GYN__YENBAR/PYN__YENBAR; 
WLN__YENBAR         =   NFA__YENBAR+KSR__YERBAR*ITD__YFDBAR/YED__YFDBAR+4*GDN__YENBAR;  
NFA__WLNBAR         =   NFA__YENBAR/WLN__YENBAR; 
KSRITD__WLNBAR      =   KSR__YERBAR*ITD__YFDBAR/YED__YFDBAR / WLN__YENBAR; 
GDN__WLNBAR         =   GDN__YENBAR/WLN__YENBAR; 
XTN__TBNBAR         =   XTN__YENBAR/TBN__YENBAR;
TBN__CANBAR         =   TBN__YENBAR/CAN__YENBAR;
subtract            =   1.e-6;
agcr                = 1-subtract;
aywr                = 1-subtract;
aywd                = 1-subtract;
ayett               = 1-subtract;
acompr              = 1-subtract;


model(linear);
//*****************************************************************************
//Modelbase Variables    						    //*
									    //*
interest   = stn;                                                           //*
inflation  = infl*100;                                                       //*
inflationq = pipcd*400;     //quarterly inflation in annually percentages   //*
outputgap  = (yer-piyet)*100;						    //*
output     = yer*100;							    //*
								      	    //*
// Policy Rule								    //*	
interest = const + cofintintb1*interest(-1) + cofintintb2*interestlag1(-1)  //*
	   + cofintintb3*interestlag2(-1) + cofintintb4*interestlag3(-1)    //*
	   + cofintinf0*inflation + cofintinfb1*inflation(-1) 	    	    //*
	   + cofintinfb2*inflationlag1(-1) + cofintinfb3*inflationlag2(-1)  //* 
	   + cofintinfb4*inflationlag3(-1) + cofintinff1*inflation(+1)      //*
	   + cofintinff2*inflation(+2) + cofintinff3*inflation(+3) 	    //*
	   + cofintinff4*inflation(+4) + cofintout*output 		    //*
	   + cofintoutb1*output(-1) + cofintoutb2*outputlag1(-1) 	    //*
	   + cofintoutb3*outputlag2(-1) + cofintoutb4*outputlag3(-1)  	    //*
	   + cofintoutf1*output(+1) + cofintoutf2*output(+2) 	    	    //*
	   + cofintoutf3*output(+3) + cofintoutf4*output(+4)	    	    //*
	   + cofintpit*pitarget	+ cofintrlb*rlbar +std_r_ * interest_;	    //*
									    //*
							 		    //*
interestlag1   = interest(-1);						    //*
interestlag2   = interestlag1(-1);					    //*
interestlag3   = interestlag2(-1);					    //*
inflationlag1  = inflation(-1);					     	    //*
inflationlag2  = inflationlag1(-1);					    //*
inflationlag3  = inflationlag2(-1);					    //*
outputlag1     = output(-1);						    //*
outputlag2     = outputlag1(-1);					    //*
outputlag3     = outputlag2(-1);					    //*
//**************************************************************************
// Original Model Code:

lnn     = lnn(-1)+LNN__DLYERADJ * (yer - yer(-1)+piyet) 
          + (1-LNN__DLLNT-LNN__DLYERADJ)* (yer(-1)-yer(-2)+piyet(-1))
          + LNN__DLWRRADJ*(wrn-lagwrn1) + LNN__DLWRRADJ1*(lagwrn1-lagwrn2)
          + LNN__ECM*(lnn(-1)-1/(1-BETABIG)*yer(-1))+innoelnn;
wrn     = wrn(-1) + (lprod - laglprod1) + (pcd - pcd(-1)) - WRN__INFT*pipcd(-1)
          + WRN__DLWRCQ4*((lagwrn4-lagwrn5) - (lagpcd4-lagpcd5) - (laglprod4-laglprod5))
          + WRN__DDLPCD*(pipcd-lagpipcd1) + WRN__DDLPCD1*(lagpipcd1-lagpipcd2)
          + WRN__DDLPCD2*(lagpipcd2-lagpipcd3) + WRN__DDLPCD3*(lagpipcd3-lagpipcd4)
          + WRN__DDLPROD*((lprod - laglprod1) - (laglprod1 - laglprod2)) 
          + WRN__DDLPROD1*((laglprod1 - laglprod2)-(laglprod2 - laglprod3))
          + WRN__DDLPROD2*((laglprod2 - laglprod3)-(laglprod3 - laglprod4))
          + WRN__DDLPROD3*((laglprod3 - laglprod4)-(laglprod4 - laglprod5))
          + .5*WRN__LURX_GAP1*urx(-1) - WRN__ECM*ult(-1)+innoewrn;
piyfd   = YFD__LYGA*yer(-1) - YFD__INFT*lagpiyfd1 + 1.0*YFD__DLYFD1*lagpiyfd1
          + (YFD__DLULT*(ult-lagult1+piyfd) + YFD__DLULT1*(lagult1-lagult2+lagpiyfd1)
          + YFD__DLULT2*(lagult2-lagult3+lagpiyfd2)) + YFD__DLMTD1*(pimtd(-1))
          - YFD__ECM*ult(-1)*1+1*innoeyfd;
pipcd   = PCD__DLPCD4*lagpipcd4 + PCD__DLYED*piyfd + PCD__DLYED1*piyfd(-1)
          + PCD__DLMTD*pimtd + PCD__DLMTD1*pimtd(-1) + PCD__DLCOMPREEN*picompr
          + PCD__ECM*(pcd(-1)-PCD__ECM__LMTD*mtd(-1))+ innoepcd;
itr     = 1*itr(-1)+(yer-yer(-1)) + ITR__DITY1*((lagitr1-lagitr2)-(yer(-1)-yer(-2)))
          + ITR__ECM*( - (STRQBAR+DELTABIG+ITR__ADJ)*itr(-1) - strq(-1)) + innoeitr;
itd     = itd(-1)+ITD__DDLYFD*(piyfd-piyfd(-1)) + ITD__DDLMTD*(pimtd-pimtd(-1))
          + ITD__DLITDYFD1*(lagitd1-lagitd2) + ITD__DLITDYFD4*(lagitd4-lagitd5)
          + ITD__DLITDYFD7*(lagitd7-lagitd7(-1)) + ITD__DLITDMTD1*( (lagitd1-lagitd2) 
          - (lagmtd1-lagmtd2)) + ITD__DLITDMTD5*( (lagitd5-lagitd6) - (lagmtd5-lagmtd6))
          + ITD__DLITDMTD6*( (lagitd6-lagitd7) - (lagmtd6-lagmtd6(-1)))
          + ITD__ECM1*itd(-1) + ITD__ECM2*(itd(-1)-mtd(-1)) + innoeitd;
pixtd   = XTD__DLXTD1*pixtd(-1) + XTD__DLYED*piyfd + XTD__DLEEN*pieen + XTD__DLMTD*pimtd(-1)
          + XTD__ECM*(xtd(-1) - 0.3*ywd(-1)) + innoextd;
pimtd   = MTD__DLMTD1 * pimtd(-1) + MTD__DLYWDX * piywdx + MTD__DLCOMPR * picompr
          + MTD__DLCOMPR1 *picompr(-1) + MTD__ECM*(.65*(mtd(-1)-xtd(-1))
          + .25*(mtd(-1)-compr(-1)) + .1*(mtd(-1)-ywd(-1))) + innoemtd;
pcr     = pcr(-1) - piyet + PCR__DURX*URTBAR*(urx - urx(-1))
          + PCR__DLSTR*(.25*(1/(1+STNBAR/100) )*1/100 * (lagstn1 - lagstn1(-1))
          - (pipcd(-1) - lagpipcd2)) + PCR__DLPYR/2*(pipyr+pipyr(-1))
          + PCR__ECM__LPYR*(pcr(-1)-pyr(-1)) + PCR__ECM__LWLR*(pcr(-1)-wln(-1)+pcd(-1))
          + innoepcr;
lsr     = lsr(-1)- piyet + LSR__DYER1*(piyer+lagpiyer1+lagpiyer2+lagpiyer2(-1))/8
          + LSR__DYER2*lagpiyer2 + LSR__DLSTR*(.25*( 1/(1+STNBAR/100) )*1/100*(stn-stn(-1))
          - (pipcd-lagpipcd1)) + LSR__DLSR1*(laglsr1 - laglsr1(-1)+ piyet(-1))
          + LSR__ECM*(lsr(-1)-yer(-1)) + innoelsr;
xtr     = xtr(-1)+ywrx-ywrx(-1) + XTR__DLXTRYWRX7*((lagxtr7-lagxtr7(-1)) - (lagywrx7-lagywrx7(-1)))
          + XTR__DLXTDYWDX1*(pixtd(-1)-piywdx(-1)) + XTR__DLXTDYWDX1*(lagpixtd2(-1)-lagpiywdx2(-1))
          + XTR__ECM*(lagxtr1-ywrx(-1)) + XTR__LXTDYWDX1*(xtd(-1)-ywdx(-1)) + innoextr;
mtr     = mtr(-1)- piyet + MTR__DLFDD*( fdd-fdd(-1)+ piyet) + MTR__ECM*(mtr(-1)-fdd(-1)
          - MTR__ECM__LMTDYED*(mtd(-1))) + innoemtr;
ltn     = EXPLTNRESBAR *1/20 * (stn+stn(+1)+stn(+2)+stn(+3)+stn(+4) + stn(+5)+stn(+6)+stn(+7)+stn(+8)
          +stn(+9)+stn(+10)+stn(+11)+stn(+12)+stn(+13)+stn(+14)+stn(+15)+stn(+16)+stn(+17)+stn(+18)
          +stn(+19))+1*innoeltn;
1/XTD__DLEEN*(pixtd(+1) - XTD__DLXTD1*pixtd - XTD__DLYED*piyfd(+1) - XTD__DLMTD*pimtd
- XTD__ECM*(xtd - 0.3*ywd) - innoextdend(+1)) = .25*(1/(1+STNBAR/100))*1/100*stn;
(ywd-aywd*lagywd1+piyfd-pieen) = (1.406622+0*1.777736)*(ywd(-1)-aywd*lagywd1(-1)-lagpieen1+lagpiyfd1)
                                 +(0.059834-0*.784159)*(lagywd1(-1)-aywd*lagywd2(-1)-lagpieen1(-1)+lagpiyfd2)
                                 -0.475129*(lagywd2(-1)-aywd*lagywd3(-1)-lagpieen2(-1)+lagpiyfd2(-1));
(compr-lagcompr1+piyfd-pieen)  = 1.200419*(compr(-1)-lagcompr1(-1)-lagpieen1+lagpiyfd1)
                                 -.291067*(lagcompr1(-1)-lagcompr2(-1)-lagpieen1(-1)+lagpiyfd2);
(ywr-aywr*lagywr1+piyet)  =  1.127551*(ywr(-1)-aywr*lagywr1(-1)+lagpiyet1) -0.194380*(lagywr1(-1)
                             -aywr*lagywr2(-1)+lagpiyet1(-1));


//multiply with 0.01 because AW output is times 100

(gcr-agcr*laggcr1+piyet)  =  0.970768*(gcr(-1)-agcr*laggcr1(-1)+lagpiyet1)+.01/GCR__YERBAR*fiscal_;  //original fiscal rule --> permanent shock
//gcr  =  0.970768*gcr(-1)+.01/GCR__YERBAR*fiscal_; 

nfn     = NFN__NFN*1/((1+PIBAR)*(1+YETGBAR))*(nfn(-1) - piyet - piyfd) + ((1+YETGBAR)*(1+PIBAR)-NFN__NFN)/
         ((1+YETGBAR)*(1+PIBAR)+1)*((nfa(-1)-piyet-piyfd) + 1/(1+YETGBAR)*1/(1+PIBAR)*(lagnfa1(-1)-piyet-piyet(-1)
         -piyfd-piyfd(-1)));
tdn_yen = tdn_yen(-1)+atdn_yen*TDN__GLN/2*(laggln_yen3(-1));
ign     = 1/96*1/2*(ltn+lagltn1+lagltn2+lagltn3+lagltn4+lagltn5+lagltn6+lagltn7+lagltn8
            +lagltn9+lagltn10+lagltn11+lagltn12+lagltn13+lagltn14+lagltn15
            +lagltn16+lagltn17+lagltn18+lagltn19+lagltn20+lagltn21+lagltn22
            +lagltn23+lagltn24+lagltn25+lagltn26+lagltn27+lagltn28+lagltn29
            +lagltn30+lagltn31+lagltn32+lagltn33+lagltn34+lagltn35+lagltn36
            +lagltn37+lagltn38+lagltn39+lagltn40+lagltn41+lagltn42+lagltn43
            +lagltn44+lagltn45+lagltn46+lagltn47);
piyet   = BETABIG*piyet(-1) + BETABIG*(lagksr1-lagksr2);
urx     = -(1-URTBAR)/(URTBAR)*lnn;			
lprod   = yer + yett - lnn;
yett    = ayett*yett(-1)+piyet;  // WHAT IS YETT?????????????
pipcd   = (pcd - pcd(-1)) + piyfd;
pimtd   = (mtd - mtd(-1)) + piyfd;
picompr = compr-compr(-1)+piyfd;
ulc     = win - yett - yer;
ult     = wrn  - yett;
ksr     = (1-DELTABIG)/(1+YETGBAR)*ksr(-1) - (1-DELTABIG)/(1+YETGBAR)*piyet
          + (YETGBAR+DELTABIG)/(1+YETGBAR)*itr;
strq    = .25/100*(1/(1+STNBAR/100))^(.75) *stn - .25 * (piyfd+lagpiyfd1+lagpiyfd2+lagpiyfd2(-1));
pixtd   = xtd - xtd(-1) + piyfd;
piywdx  = (ywdx - ywdx(-1)) + piyfd;
pipyr   = pyr - pyr(-1) + piyet;
piyer   = yer - yer(-1) + piyet;
scr     = (1+YETGBAR)/(YETGBAR)*(lsr - 1/(1+YETGBAR)*lsr(-1) + 1/(1+YETGBAR)*piyet);
fdd     = PCR__FDDBAR*pcr+GCR__FDDBAR*gcr+ITR__FDDBAR*itr+XTR__FDDBAR*xtr
          + (1-PCR__FDDBAR-GCR__FDDBAR-ITR__FDDBAR-XTR__FDDBAR)*scr;
ywrx    = .4* ywr + .6*((1-XTR__FDDBAR)^(-1)*fdd+ (1-(1-XTR__FDDBAR)^(-1))*xtr);
ywdx    = .4*ywd+.6*xtd;
tbr     = XTR__TBRBAR*xtr+(1-XTR__TBRBAR)*mtr;
yer     = PCR__YERBAR*pcr+GCR__YERBAR*gcr+ITR__YERBAR*itr+TBR__YERBAR*tbr
          + (1-PCR__YERBAR-GCR__YERBAR-ITR__YERBAR-TBR__YERBAR)*scr;       // equation D.1 --> yer: real GDP
pcn     = pcr+pcd;
itn     = itr+itd;
xtn     = xtr+xtd;
mtn     = mtr+mtd;
tbn     = XTN__TBNBAR*xtn+(1-XTN__TBNBAR)*mtn;
can     = TBN__CANBAR*tbn+(1-TBN__CANBAR)*nfn;
nfa     = 1/((1+YETGBAR)*(1+PIBAR))*(nfa(-1)-piyet-piyfd) + CAN__YENBAR/NFA__YENBAR*can;
pyn     = YFN__PYNBAR*yer + (1-YFN__PYNBAR-TIN__PYNBAR-NFN__PYNBAR-PYN__DIS__PYNBAR)*gyn
          + TIN__PYNBAR*yer + NFN__PYNBAR*nfn + PYN__DIS__PYNBAR*yer;
pyr     = pyn-pcd;
wln     = NFA__WLNBAR*nfa+KSRITD__WLNBAR*(ksr+itd)+(1-NFA__WLNBAR-KSRITD__WLNBAR)*gdn;
win     = wrn+lnn;
tdn_yen = TDN__YENBAR*(tdn-yer);
atransfer*(.2*URTBAR)*urx = (.2*URTBAR+TRN__YEN__DISBAR)*(trn-yer);
gln_yen = GLN__YENBAR*(gln-yer);
gyn     = TDN__GYNBAR*tdn+SSN__GYNBAR*yer+TIN__GYNBAR*yer+OGN__GYNBAR*yer-INN__GYNBAR*inn-TRN__GYNBAR*trn
          - TRN__OTHER__GYNBAR*yer + (1-TDN__GYNBAR-SSN__GYNBAR-TIN__GYNBAR-OGN__GYNBAR+INN__GYNBAR+TRN__GYNBAR+TRN__OTHER__GYNBAR)*yer;
gsn     = GYN__GSNBAR*gyn+(1-GYN__GSNBAR)*gcr;
gln     = GSN__GLNBAR*gsn+(1-GSN__GLNBAR)*yer;
gdn     = 1/((1+YETGBAR)*(1+PIBAR))*(gdn(-1)-piyet-piyfd) - .25*GLN__GDNBAR *gln+GDN__DIS__GDNBAR*yer;
inn     = 1/(((100+STNBAR)*EXPLTNRESBAR -100)/2+IGN__ADJ)*ign+gdn(-1)-piyfd-piyet;
dstn     = stn-stn(-1);
lagstn1  = stn(-1);
lagksr1 = ksr(-1);
lagksr2 = lagksr1(-1);
lagwrn1 = wrn(-1);
lagwrn2 = lagwrn1(-1);
lagwrn3 = lagwrn2(-1);
lagwrn4 = lagwrn3(-1);
lagwrn5 = lagwrn4(-1);
lagpcd1 = pcd(-1);
lagpcd2 = lagpcd1(-1);
lagpcd3 = lagpcd2(-1);
lagpcd4 = lagpcd3(-1);
lagpcd5 = lagpcd4(-1);
laglprod1 = lprod(-1);
laglprod2 = laglprod1(-1);
laglprod3 = laglprod2(-1);
laglprod4 = laglprod3(-1);
laglprod5 = laglprod4(-1);
lagpipcd1 = pipcd(-1);
lagpipcd2 = lagpipcd1(-1);
lagpipcd3 = lagpipcd2(-1);
lagpipcd4 = lagpipcd3(-1);
lagult1   = ult(-1);
lagult2   = lagult1(-1);
lagult3   = lagult2(-1);
lagpiyfd1 = piyfd(-1);
lagpiyfd2 = lagpiyfd1(-1);
lagitr1   = itr(-1);
lagitr2   = lagitr1(-1);
lagitd1   = itd(-1);
lagitd2   = lagitd1(-1);
lagitd3   = lagitd2(-1);
lagitd4   = lagitd3(-1);
lagitd5   = lagitd4(-1);
lagitd6   = lagitd5(-1);
lagitd7   = lagitd6(-1);
lagmtd1   = mtd(-1);
lagmtd2   = lagmtd1(-1);
lagmtd3   = lagmtd2(-1);
lagmtd4   = lagmtd3(-1);
lagmtd5   = lagmtd4(-1);
lagmtd6   = lagmtd5(-1);
lagpiyer1 = piyer(-1);
lagpiyer2 = lagpiyer1(-1);
laglsr1   = lsr(-1);
lagxtr1   = xtr(-1);
lagxtr2   = lagxtr1(-1);
lagxtr3   = lagxtr2(-1);
lagxtr4   = lagxtr3(-1);
lagxtr5   = lagxtr4(-1);
lagxtr6   = lagxtr5(-1);
lagxtr7   = lagxtr6(-1);
lagywrx1  = ywrx(-1);
lagywrx2  = lagywrx1(-1);
lagywrx3  = lagywrx2(-1);
lagywrx4  = lagywrx3(-1);
lagywrx5  = lagywrx4(-1);
lagywrx6  = lagywrx5(-1);
lagywrx7  = lagywrx6(-1);
lagpixtd1 = pixtd(-1);
lagpixtd2 = lagpixtd1(-1);
lagpiywdx1 = piywdx(-1);
lagpiywdx2 = lagpiywdx1(-1);
lagnfa1   = nfa(-1);
laggln_yen1 = gln_yen(-1);
laggln_yen2 = laggln_yen1(-1);
laggln_yen3 = laggln_yen2(-1);
lagltn1   = ltn(-1);
lagltn2   = lagltn1(-1);
lagltn3   = lagltn2(-1);
lagltn4   = lagltn3(-1);
lagltn5   = lagltn4(-1);
lagltn6   = lagltn5(-1);
lagltn7   = lagltn6(-1);
lagltn8   = lagltn7(-1);
lagltn9   = lagltn8(-1);
lagltn10  = lagltn9(-1);
lagltn11  = lagltn10(-1);
lagltn12  = lagltn11(-1);
lagltn13  = lagltn12(-1);
lagltn14  = lagltn13(-1);
lagltn15  = lagltn14(-1);
lagltn16  = lagltn15(-1);
lagltn17  = lagltn16(-1);
lagltn18  = lagltn17(-1);
lagltn19  = lagltn18(-1);
lagltn20  = lagltn19(-1);
lagltn21  = lagltn20(-1);
lagltn22  = lagltn21(-1);
lagltn23  = lagltn22(-1);
lagltn24  = lagltn23(-1);
lagltn25  = lagltn24(-1);
lagltn26  = lagltn25(-1);
lagltn27  = lagltn26(-1);
lagltn28  = lagltn27(-1);
lagltn29  = lagltn28(-1);
lagltn30  = lagltn29(-1);
lagltn31  = lagltn30(-1);
lagltn32  = lagltn31(-1);
lagltn33  = lagltn32(-1);
lagltn34  = lagltn33(-1);
lagltn35  = lagltn34(-1);
lagltn36  = lagltn35(-1);
lagltn37  = lagltn36(-1);
lagltn38  = lagltn37(-1);
lagltn39  = lagltn38(-1);
lagltn40  = lagltn39(-1);
lagltn41  = lagltn40(-1);
lagltn42  = lagltn41(-1);
lagltn43  = lagltn42(-1);
lagltn44  = lagltn43(-1);
lagltn45  = lagltn44(-1);
lagltn46  = lagltn45(-1);
lagltn47  = lagltn46(-1);
lagywd1   = ywd(-1);
lagywd2   = lagywd1(-1);
lagywd3   = lagywd2(-1);
lagpieen1 = pieen(-1);
lagpieen2 = lagpieen1(-1);
lagcompr1 = compr(-1);
lagcompr2 = lagcompr1(-1);
laggcr1   = gcr(-1);
lagywr1   = ywr(-1);
lagywr2   = lagywr1(-1);
lagpiyet1 = piyet(-1);
yet       = yet(-1) + piyet;
infl    = pipcd+lagpipcd1+lagpipcd2+lagpipcd2(-1);
innoextdend  = innoextd;//THE LINE IS NECCESSARY TO INCLUDE A SHOCK IN PERIOD t+1
end;

//steady;
//check;


shocks;
var interest_          =  0.1104      ;
var interest_,innoelnn =  2.5189e-005 ;
var interest_,innoewrn = -1.8121e-004 ;
var interest_,innoeyfd =  8.5389e-005 ;
var interest_,innoepcd = -1.6549e-004 ;
var interest_,innoeitr =  1.7409e-004 ;
var interest_,innoeitd = -2.0011e-004 ;
var interest_,innoextd =  2.3580e-004 ;
var interest_,innoemtd =  4.7219e-004 ;
var interest_,innoepcr = -2.9591e-004 ;
var interest_,innoelsr = -1.0045e-004 ;
var interest_,innoextr =  9.7685e-004 ;
var interest_,innoemtr =  4.3029e-004 ;
var interest_,innoeltn =  0.1301      ;
var innoelnn          =  3.3857e-006 ;
var innoelnn,innoewrn =  3.0411e-006 ;
var innoelnn,innoeyfd =  2.3488e-008 ;
var innoelnn,innoepcd = -4.7942e-007 ;
var innoelnn,innoeitr =  4.1316e-006 ;
var innoelnn,innoeitd =  5.2484e-007 ;
var innoelnn,innoextd =  2.1928e-006 ;
var innoelnn,innoemtd =  5.5601e-006 ;
var innoelnn,innoepcr =  1.9613e-006 ;
var innoelnn,innoelsr = -9.4847e-007 ;
var innoelnn,innoextr =  6.9542e-006 ;
var innoelnn,innoemtr =  6.5457e-006 ;
var innoelnn,innoeltn = -0.0010      ;
var innoewrn          =  1.8155e-005 ;
var innoewrn,innoeyfd =  3.1880e-007 ;
var innoewrn,innoepcd = -1.6235e-006 ;
var innoewrn,innoeitr =  4.0746e-006 ;
var innoewrn,innoeitd = -6.2874e-007 ;
var innoewrn,innoextd =  9.2444e-007 ;
var innoewrn,innoemtd =  4.1603e-006 ;
var innoewrn,innoepcr =  6.4213e-006 ;
var innoewrn,innoelsr = -7.5253e-006 ;
var innoewrn,innoextr =  1.3941e-005 ;
var innoewrn,innoemtr =  1.7726e-005 ;
var innoewrn,innoeltn =  3.8174e-004 ;
var innoeyfd          =  3.0850e-006 ;
var innoeyfd,innoepcd =  2.0690e-007 ;
var innoeyfd,innoeitr =  2.1424e-006 ;
var innoeyfd,innoeitd = -1.1015e-006 ;
var innoeyfd,innoextd = -1.6976e-006 ;
var innoeyfd,innoemtd = -2.2303e-006 ;
var innoeyfd,innoepcr = -2.2539e-006 ;
var innoeyfd,innoelsr =  1.6888e-007 ;
var innoeyfd,innoextr = -3.6066e-006 ;
var innoeyfd,innoemtr =  1.1866e-006 ;
var innoeyfd,innoeltn = -3.2343e-005 ;
var innoepcd          =  2.2940e-006 ;
var innoepcd,innoeitr = -8.9364e-007 ;
var innoepcd,innoeitd = -4.5344e-007 ;
var innoepcd,innoextd = -1.0266e-006 ;
var innoepcd,innoemtd =  8.2137e-007 ;
var innoepcd,innoepcr = -2.9159e-006 ;
var innoepcd,innoelsr = -8.2238e-007 ;
var innoepcd,innoextr =  3.8836e-006 ;
var innoepcd,innoemtr = -1.6479e-006 ;
var innoepcd,innoeltn = -2.8753e-004 ;
var innoeitr          =  8.0046e-005 ;
var innoeitr,innoeitd =  6.9988e-007 ;
var innoeitr,innoextd =  1.1048e-005 ;
var innoeitr,innoemtd =  2.6808e-005 ;
var innoeitr,innoepcr = -4.8993e-006 ;
var innoeitr,innoelsr = -1.3007e-005 ;
var innoeitr,innoextr =  2.9465e-005 ;
var innoeitr,innoemtr =  2.7305e-005 ;
var innoeitr,innoeltn =  5.9147e-005 ;
var innoeitd          =  3.6251e-006 ;
var innoeitd,innoextd =  1.6205e-006 ;
var innoeitd,innoemtd =  2.7158e-006 ;
var innoeitd,innoepcr =  1.3300e-006 ;
var innoeitd,innoelsr =  2.5659e-006 ;
var innoeitd,innoextr =  3.7073e-006 ;
var innoeitd,innoemtr =  2.5356e-006 ;
var innoeitd,innoeltn = -9.6262e-004 ;
var innoextd          =  1.7120e-005 ;
var innoextd,innoemtd =  2.3783e-005 ;
var innoextd,innoepcr = -2.9917e-006 ;
var innoextd,innoelsr = -6.3440e-007 ;
var innoextd,innoextr =  2.3819e-005 ;
var innoextd,innoemtr =  1.0356e-005 ;
var innoextd,innoeltn = -1.0892e-004 ;
var innoemtd          =  6.4909e-005 ;
var innoemtd,innoepcr = -1.2799e-005 ;
var innoemtd,innoelsr = -8.0486e-006 ;
var innoemtd,innoextr =  1.0254e-004 ;
var innoemtd,innoemtr =  3.3022e-005 ;
var innoemtd,innoeltn = -3.4138e-004 ;
var innoepcr          =  2.5499e-005 ;
var innoepcr,innoelsr = -2.1900e-006 ;
var innoepcr,innoextr = -1.0070e-005 ;
var innoepcr,innoemtr =  5.0019e-006 ;
var innoepcr,innoeltn = -1.7181e-004 ;
var innoelsr          =  1.4944e-005 ;
var innoelsr,innoextr = -2.7941e-005 ;
var innoelsr,innoemtr = -1.8559e-005 ;
var innoelsr,innoeltn = -8.6732e-004 ;
var innoextr          =  3.5676e-004 ;
var innoextr,innoemtr =  1.0748e-004 ;
var innoextr,innoeltn = -0.0030      ;
var innoemtr          =  6.5833e-005 ;
var innoemtr,innoeltn = -0.0018      ;
var innoeltn          =  1.1741      ;
end;

stoch_simul (irf = 0, ar=16) yer inflation output dstn; 