var
AP ATCU ATCU1 SI SI1 R_K MC UCbis Y Z W I K L 
AW_C AW_D AP_D ATCU_D ATCU1_D SI_D SI1_D 
MC_D XNR X UCbisNR Z_D 
R UC C UC_D D UCNR CNR UC_DNR DNR PSI Debt Q TCU K_C L_C I_C Q_D TCU_D K_D L_D I_D P_L 
Dp PI ZP1 ZP2 Dp_D PI_D ZP1_D ZP2_D 
Dw_C W_C ZW1_C ZW2_C ZWNR1_C ZWNR2_C Dw_D W_D ZW1_D ZW2_D ZWNR1_D ZWNR2_D 
CPI T_D LAND WELFARE

W_C_S N_C_S W_C_NR N_C_NR AW_C_NR Dw_C_NR W_D_S N_D_S W_D_NR N_D_NR AW_D_NR Dw_D_NR
C_E UC_E UCbis_E PSI_E Debt_E EE_LTV_E 
Q_H SI_H SI1_H EE_IH I_H  SI_H_NR SI1_H_NR I_H_NR Q_H_NR

Dp_R_D AR_D EE_R_D R_D Z1_R_D Z2_R_D Depo Dp_R_L AR_L R_L Z1_R_L Z2_R_L 
Dp_R_L_E AR_L_E R_L_E Z1_R_L_E Z2_R_L_E RB_L RB_L_E RB_D
Bankcap Debt_TOT Debt_TOT_W Profit_B LEV SB_L SB_L_E
R_LL R_LL_E

WELFARENR 

E_F

PI_BAR

OMEG EE_SIG H_OMEG G_OMEG EFP_OMEG
OMEG_HH EE_SIG_HH H_OMEG_HH G_OMEG_HH EFP_OMEG_HH

EE_SIG_NEWS1
EE_SIG_NEWS2
EE_SIG_NEWS3
EE_SIG_NEWS4
EE_SIG_NEWS5
EE_SIG_NEWS6
EE_SIG_NEWS7
EE_SIG_NEWS8

EE_SIG_HH_NEWS1
EE_SIG_HH_NEWS2
EE_SIG_HH_NEWS3
EE_SIG_HH_NEWS4
EE_SIG_HH_NEWS5
EE_SIG_HH_NEWS6
EE_SIG_HH_NEWS7
EE_SIG_HH_NEWS8


AR_L_E_R R_L_E_R Z1_R_L_E_R Z2_R_L_E_R S_L_E_Robs 
AR_L_E_R_MU R_L_E_R_MU Z1_R_L_E_R_MU Z2_R_L_E_R_MU S_L_E_R_MUobs 

Robs Yobs Zobs Cobs Iobs Lobs Wobs CPIobs PIobs PIgdpobs Z_Dobs DRobs DNRobs 
PI_Dobs T_Dobs dDebtobs Debtobs CRobs CNRobs L_Cobs L_Dobs W_Cobs W_Dobs 
R_Lobs R_Dobs RB_Lobs RB_L_Eobs R_L_Eobs RB_Dobs Debt_Eobs Debt_TOTobs Bankcapobs LEVobs
SB_Lobs Depoobs R_LLobs R_LL_Eobs S_LLobs S_LL_Eobs 
PD_HHobs PD_Eobs 
S_Lobs S_L_Eobs S_Dobs

EE_R EE_A EE_B EE_G EE_L EE_I EE_P EE_Q EE_W EE_LTV EE_H EE_A_D EE_P_D EE_Bankcap
EE_R_L EE_R_L_E 

;

varexo 
E_A E_I E_B E_G E_P E_W E_R E_A_D E_H 
E_SIG_HH E_SIG
E_R_L E_R_L_E E_R_D E_Bankcap
//E_LTV E_LTV_E 
//E_Q
//F_LTV
//E_L  E_P_D 

// E_IH 
//E_Bankcap

//E_SIG_NEWS1
//E_SIG_NEWS2 E_SIG_NEWS3 E_SIG_NEWS4 E_SIG_NEWS5 E_SIG_NEWS6 E_SIG_NEWS7 E_SIG_NEWS8

//E_SIG_HH_NEWS1
//E_SIG_HH_NEWS2 E_SIG_HH_NEWS3 E_SIG_HH_NEWS4 E_SIG_HH_NEWS5 E_SIG_HH_NEWS6 E_SIG_HH_NEWS7 E_SIG_HH_NEWS8

;  

parameters 

xie mu muw muw_C muw_D subv subvw tauSS tauwSS
alph betta phi_i tau sig_c h  phi_y gamma_p xi_p 
sig_l_C 
r_dpi r_PI r_dy r_y 
rho rho_a rho_b rho_g rho_l rho_i rho_R_D rho_R_L rho_R_L_E rho_LTV_E rho_i_H
LSS GDSS GSS CECSS TCUSS PLSS lambdaR 
tau_D hetha_D omega_D chi_NR omega_NR
phi_y_D alph_D rho_a_D xi_p_D gamma_p_D mu_D subv_D 
rho_LTV rho_P_D rho_H 
xi_w_C xi_w_D gamma_w_C 
alph_LAN diff_betta czcapbis corIC betta_NR betta_NR_E 

PSISS PSIESS

//RSS R_KSS WSS KSS ISS YSS CSS WTILD_CSS WTILD_DSS ZP1SS ZP2SS 
//MCSS ZW1CSS ZW2CSS ZW1DSS ZW2DSS LC_BAR LD_BAR WELFARESS UCbisSS 
//ZSS ZWNR1CSS ZWNR2CSS ZWNR1DSS ZWNR2DSS ZDSS MCDSS TDSS KLDSS KLSS DCNRSS DCSS DCNRFSS ZLDSS ZLSS 
//LCSS KCSS KDSS DSS DNRSS DebtSS TRSS XSS XNRSS UCbisNRSS UC_DSS UCNRSS UC_DNRSS 
//ZP1_DSS ZP2_DSS WELFARENRSS LANDSS LAND_LDSS 
//sig_l_D czcap 
//L_BAR WTSS NCSS NDSS WTILD_CNRSS WTILD_DNRSS LC_NR_BAR LD_NR_BAR WTFSS NCFSS NDFSS WTILD_CNRFSS WTILD_DNRFSS LC_NR_BAR_F LD_NR_BAR_F
//xi_w_C_NR gamma_w_C_NR sig_l_C_NR xi_w_D_NR gamma_w_D_NR sig_l_D_NR gamma_w_D h_NR h_E 
//TRESS CESS UCESS UCbisESS DebtESS 
//DepoSS RBDSS RBLSS
//RDSS RLSS RLESS
//RLLSS RLLESS
//BankcapSS DebtTOTSS ProfitBSS ProfitBFSS tau_B 


r_dtd	
phi_i_h diff_betta_E
sig_c_E chi_NR_E 

mu_R_D subv_R_D xi_R_D mu_R_L subv_R_L xi_R_L mu_R_L_E subv_R_L_E xi_R_L_E 

kappa_b nu_b omega_B 
rho_Bankcap corBCLTV corBVLTVE

mu_NFC 
sigma 
OMEGSS
HOMEGSS GOMEGSS EFPOMEGSS 

OMEGHHSS HOMEGHHSS GOMEGHHSS EFPOMEGHHSS
mu_HH sigma_HH

rho_sig rho_sig_HH
//dsge_prior_weight 
corHC corHSIG

bw //weight of borrowers' debt in adjustment cost function of bank capital accumulation

;

bw=1;

lambdaR = 0; //In welfare function

rho_LTV = 0.8 ;
rho_LTV_E = 0.8;
rho_i_H = 0.3;

corIC = 0;
corHC = 0;
corHSIG = 0;
corHA = 0;
corHAD = 0;
corHL = 0;
corHI = 0;
corHLTV = 0;
corHNEER = 0;
corHG = 0;
corHQ = 0;
corBCLTV = 0*0.5; 
corBVLTVE = 0.5;

// Steady state tax rates

tauSS = 0.0; //not in paper
tauwSS = 0.0; //not in paper

// Steady state markups
mu = 1.3*(1-tauSS);
muw = 1.5*(1-tauwSS);
mu_D = mu;
muw_C = muw;
muw_D = muw;

// If we want to cancel the mean effect in the welfare we have to set:  
//subv = 1-1/mu*(1-tauSS) ;
//subvw = 1-1/ muw*(1-tauwSS);
//subv_D = 1-1/mu_D*(1-tauSS) ;
//else
subv = 0; 
subvw = 0;
subv_D = 0;
subv_R_D = 0; 
subv_R_L = 0; 
subv_R_L_E = 0; 


/////////////
phi_y_D = mu_D*(1-subv_D);
phi_y = mu*(1-subv);
alph=0.3;
alph_LAN = 0.15;
alph_D = 0.3;
hetha_D = 0.999;
omega_D = 0.2;
tau_D =0.005;
tau=0.025;

//Not mentioned in the paper, except LSS
GDSS = 0.18;
GSS = 0.18;
CECSS = 0.01;//0.0005;
TCUSS = 1;
PLSS = 1;
LSS = 1;

omega_NR = 0.25;
chi_NR = 0.2;
chi_NR_E = 0.6;

betta=.995;
//betta_NR=.96;
//betta_NR_E=betta_NR;
diff_betta = 2.25;
diff_betta_E = 2.25;
betta_NR  = (1/betta + diff_betta/100)^(-1);
betta_NR_E = (1/betta + diff_betta_E/100)^(-1);

// If we want to cancel the mean effect in the welfare we have to set:  
//subv = 1-1/mu*(1-tauSS) ;
//subvw = 1-1/ muw*(1-tauwSS);
//subv_D = 1-1/mu_D*(1-tauSS) ;
//else
subv = 0; 
subvw = 0;
subv_D = 0;
subv_R_D = 0; 
subv_R_L = 0; 
subv_R_L_E = 0; 

//markup values for interest rates not found in the paper

//mu_R_D = 0.6; 
//mu_R_L = 1.5;
//mu_R_L_E = 1.5;

//mu_R_D = 0.9960;
//mu_R_L = 1.0040; 
//mu_R_L_E = 1.0040;

mu_R_D = 1/(1+0.0025/(1/betta-1)); 
mu_R_L = 1+0.0050/(1/betta-1)*mu_R_D*(1-subv_R_D); 
mu_R_L_E = 1+0.0030/(1/betta-1)*mu_R_D*(1-subv_R_D);

sigma = sqrt(log(1+0.1/1.5)); //variance not mentioned in the paper
mu_NFC = 0.2;
sigma_HH = sqrt(log(1+0.1/10)); //variance not mentioned in the paper
mu_HH = 0.15;


PSISS = 1/betta_NR/(1+((1/betta-1)/(mu_R_D*(1-subv_R_D)))*mu_R_L*(1-subv_R_L));
PSIESS = 1/betta_NR_E/(1+((1/betta-1)/(mu_R_D*(1-subv_R_D)))*mu_R_L_E*(1-subv_R_L_E));

//PSIESS =  1/betta_NR_E/(1/betta/(mu_R_D*(1-subv_R_D))*mu_R_L_E*(1-subv_R_L_E));
//PSISS = betta/betta_NR/mu_R_L/(1-subv_R_L)*(mu_R_D*(1-subv_R_D));

OMEGSS   = MDP_SS_omegss(betta,betta_NR,betta_NR_E,mu_R_D,mu_R_L,mu_R_L_E,sigma,sigma_HH,mu_NFC,mu_HH,subv_R_D,subv_R_L_E,subv_R_L);
OMEGHHSS = MDP_SS_omegssHH(betta,betta_NR,betta_NR_E,mu_R_D,mu_R_L,mu_R_L_E,sigma,sigma_HH,mu_NFC,mu_HH,subv_R_D,subv_R_L_E,subv_R_L);

HOMEGS =  - (normcdf((log(OMEGSS)-0.5*sigma^2)/(sigma)) + OMEGSS*(1-normcdf((log(OMEGSS)+0.5*sigma^2)/(sigma))));
GOMEGS = ((1-mu_NFC)*normcdf((log(OMEGSS)-0.5*sigma^2)/(sigma)) + OMEGSS*(1-normcdf((log(OMEGSS)+0.5*sigma^2)/(sigma))));
EFPOMEGS = (1-normcdf((log(OMEGSS)+0.5*sigma^2)/(sigma)))/(1-normcdf((log(OMEGSS)+0.5*sigma^2)/(sigma)) - mu_NFC*OMEGSS*(1/(OMEGSS*(sigma)*sqrt(2*3.141592653589793)))*exp(-((log(OMEGSS)+ 0.5*sigma^2)^2)/(2*(sigma^2))));
HOMEGSS = HOMEGS;  
GOMEGSS = GOMEGS;
EFPOMEGSS = EFPOMEGS ;

//PSISS - (1-normcdf((log(OMEGHHSS)+0.5*sigma_HH^2)/(sigma_HH)))/(1-normcdf((log(OMEGHHSS)+0.5*sigma_HH^2)/(sigma_HH)) - mu_HH*OMEGHHSS*(1/(OMEGHHSS*(sigma_HH)*sqrt(2*3.141592653589793)))*exp(-((log(OMEGHHSS)+ 0.5*sigma_HH^2)^2)/(2*(sigma_HH^2))));
HOMEGHHS =  - (normcdf((log(OMEGHHSS)-0.5*sigma_HH^2)/(sigma_HH))+ OMEGHHSS*(1-normcdf((log(OMEGHHSS)+0.5*sigma_HH^2)/(sigma_HH))));
GOMEGHHS = ((1-mu_HH)*normcdf((log(OMEGHHSS)-0.5*sigma_HH^2)/(sigma_HH))+ OMEGHHSS*(1-normcdf((log(OMEGHHSS)+0.5*sigma_HH^2)/(sigma_HH))));
EFPOMEGHHS = (1-normcdf((log(OMEGHHSS)+0.5*sigma_HH^2)/(sigma_HH)))/(1-normcdf((log(OMEGHHSS)+0.5*sigma_HH^2)/(sigma_HH)) - mu_HH*OMEGHHSS*(1/(OMEGHHSS*(sigma_HH)*sqrt(2*3.141592653589793)))*exp(-((log(OMEGHHSS)+ 0.5*sigma_HH^2)^2)/(2*(sigma_HH^2))));

HOMEGHHSS = HOMEGHHS;  
GOMEGHHSS = GOMEGHHS;
EFPOMEGHHSS = EFPOMEGHHS ;

 
nu_b = 0.09; 
omega_B = 0.95; //not in paper

sig_c_E = 0.9999;
gamma_p_D = 0.0; //not in paper

////estimated parameters////

rho_a       =   0.92;
rho_b       =   0.95;
rho_g       =   0.91;
rho_l       =   0.85;
rho_i       =   0.68;
rho_a_D     =   0.89;
rho_H       =   0.99;
rho_R_L     =   0.26;
rho_R_L_E   =   0.40;
rho_R_D     =   0.97;
rho_Bankcap =   0.71;
rho_sig     =   0.98;
rho_sig_HH  =   0.98;
phi_i_h     =   0.23;
phi_i       =   7.72;
czcapbis    =   0.75;
sig_c       =   0.63;
h           =   0.59;
sig_l_C     =   1.32;
xi_w_C      =   0.73;
xi_w_D      =   0.87;
gamma_w_C   =   0.24;
xi_p        =   0.83;
gamma_p     =   0.58;
xi_R_L      =   0.92;
xi_R_D      =   0.32;
xi_R_L_E    =   0.76;
xi_p_D      =   0.81;
xie         =   0.65;
rho         =   0.84;
r_PI        =   2.37;
r_dpi       =   0.24;
r_y         =   0.03;
r_dy        =   0.07;
kappa_b     =   18.58;
r_dtd       =   0.03;
corHC       =   0; //0.615841514;
corHSIG     =   0; //1.953579186;

//////////////////////////////////////////////////////////////////////////
model; 
# czcap = czcapbis/(1-czcapbis);
# h_NR = h;
# h_E = h;
# sig_l_D = sig_l_C;
# sig_l_C_NR = sig_l_C;
# sig_l_D_NR = sig_l_D;
# xi_w_C_NR = xi_w_C;
# gamma_w_C_NR = gamma_w_C; 
# gamma_w_D = gamma_w_C; 
# xi_w_D_NR = xi_w_D;
# gamma_w_D_NR = gamma_w_D; 
# MCSS = (1-tauSS)/(mu*(1-subv));
# MCDSS = (1-tauSS)/(mu_D*(1-subv_D));
# RSS = (1/betta-1)/(mu_R_D*(1-subv_R_D));
# RBDSS = RSS; 
# RBLSS = RSS;
# RBLESS = RSS;
# RDSS = (RBDSS)*mu_R_D*(1-subv_R_D); 
# RLSS = (RBLSS)*mu_R_L*(1-subv_R_L);
# RLESS = (RBLESS)*mu_R_L_E*(1-subv_R_L_E);
# RLLSS = (1+RLSS)*OMEGHHSS/GOMEGHHSS -1;
# RLLESS = (1+RLESS)*OMEGSS/GOMEGSS - 1 ;
# R_KSS = 1/betta_NR_E - (1-tau) - (1-tau)*(1-chi_NR_E)*(HOMEGSS + GOMEGSS*EFPOMEGSS);                                            
# ATCUSS = 1/czcap*R_KSS*(exp(czcap*(TCUSS-1))-1);
# ATCU1SS = R_KSS*exp(czcap*(TCUSS-1));
# WSS = (MCSS*R_KSS^(-alph)*alph^alph*(1-alph)^(1-alph))^(1/(1-alph));
# TDSS = mu_D*(1-subv_D)*WSS^(1-alph_D-alph_LAN)*R_KSS^(alph_D)/((alph_D^alph_D)*(1-alph_D-alph_LAN)^(1-alph_D-alph_LAN))*(PLSS/alph_LAN)^alph_LAN;
# KLSS = alph/(1-alph)*WSS/R_KSS;
# KLDSS = alph_D/(1-alph_D-alph_LAN)*WSS/R_KSS;
# DCSS = omega_D/(1-omega_D)*(TDSS*(1-betta*(1-tau_D)))^(-hetha_D)*(1-betta*h)^(-hetha_D)*(1-h);
# DCNRSS = omega_D/(1-omega_D)*(TDSS*(1 - betta_NR*(1-tau_D) - betta_NR*(1-tau_D)*(1-chi_NR)*(HOMEGHHSS + GOMEGHHSS*EFPOMEGHHSS)))^(-hetha_D)*(1-betta_NR*h_NR)^(-hetha_D)*(1-h_NR) ;  
# LAND_LDSS = (WSS/PLSS)*(alph_LAN/(1-alph_D-alph_LAN)); 
# ZLSS = KLSS^alph/ phi_y;
# ZLDSS = (KLDSS^alph_D)*(LAND_LDSS^alph_LAN)/ phi_y_D;
# CSS = -(ZLSS-tau*KLSS-GSS*ZLSS-ZLSS*GDSS+tau*KLSS*GDSS+GSS*ZLSS*GDSS)*ZLDSS/(-ZLDSS-ZLDSS*CECSS+GDSS*ZLDSS+GDSS*ZLDSS*CECSS-tau_D*omega_NR*DCNRSS*ZLSS-tau_D*omega_NR*DCNRSS*tau*KLDSS+tau_D*omega_NR*DCNRSS*GSS*ZLSS+tau_D*omega_NR*DCNRSS*tau*KLSS-tau_D*DCSS*ZLSS-tau_D*DCSS*tau*KLDSS+tau_D*DCSS*GSS*ZLSS+tau_D*DCSS*tau*KLSS+tau_D*DCSS*omega_NR*ZLSS+tau_D*DCSS*omega_NR*tau*KLDSS-tau_D*DCSS*omega_NR*GSS*ZLSS-tau_D*DCSS*omega_NR*tau*KLSS);
# LCSS = -(ZLDSS+ZLDSS*CECSS-GDSS*ZLDSS-GDSS*ZLDSS*CECSS+tau_D*omega_NR*DCNRSS*tau*KLDSS+tau_D*DCSS*tau*KLDSS-tau_D*DCSS*omega_NR*tau*KLDSS)/(-ZLDSS-ZLDSS*CECSS+GDSS*ZLDSS+GDSS*ZLDSS*CECSS-tau_D*omega_NR*DCNRSS*ZLSS-tau_D*omega_NR*DCNRSS*tau*KLDSS+tau_D*omega_NR*DCNRSS*GSS*ZLSS+tau_D*omega_NR*DCNRSS*tau*KLSS-tau_D*DCSS*ZLSS-tau_D*DCSS*tau*KLDSS+tau_D*DCSS*GSS*ZLSS+tau_D*DCSS*tau*KLSS+tau_D*DCSS*omega_NR*ZLSS+tau_D*DCSS*omega_NR*tau*KLDSS-tau_D*DCSS*omega_NR*GSS*ZLSS-tau_D*DCSS*omega_NR*tau*KLSS);
# CESS = CECSS*CSS;
# KCSS = KLSS*LCSS;
# KDSS = KLDSS*(1-LCSS);
# KSS =KCSS + KDSS;
# ISS = tau*(KLSS*LCSS + KLDSS*(1-LCSS));
# LANDSS = LAND_LDSS*(1-LCSS);
# ZSS = KCSS^alph*LCSS^(1-alph) / phi_y;
# ZDSS = KDSS^alph_D*(1-LCSS)^(1-alph_D-alph_LAN)*LANDSS^alph_LAN/ phi_y_D;
# YSS = CSS + CESS+ ISS + GSS*ZSS;
# DSS = DCSS*CSS;
# DNRSS = DCNRSS*CSS;
# DebtSS = (1-tau_D)*(1-chi_NR)*TDSS*DNRSS/(1+RLSS)*GOMEGHHSS;
# TRSS = CSS + TDSS*(DNRSS - (1-tau_D)*DNRSS) - HOMEGHHSS*(1-chi_NR)*(1-tau_D)*TDSS*DNRSS - DebtSS - WSS;
# UCbisESS = (CESS*(1-h_E))^(-sig_c_E);
# UCESS = (1-betta_NR_E*h_E)*UCbisESS;
# DebtESS = GOMEGSS*(1-chi_NR_E)*(1-tau)*(KCSS + KDSS)/(1+RLESS);
# TRESS = CESS + tau*KCSS + tau*KDSS - HOMEGSS*(1-chi_NR_E)*(1-tau)*(KCSS + KDSS) - DebtESS - MCSS*ZSS - MCDSS*ZDSS + WSS ;
# DebtTOTSS = omega_NR*DebtSS + DebtESS;
# DebtTOTWSS = bw*omega_NR*DebtSS + DebtESS;
# BankcapSS = nu_b*DebtTOTWSS; 
# DepoSS = DebtTOTSS - BankcapSS;        
# ProfitBSS = RLSS*omega_NR*DebtSS + RLESS*DebtESS - RDSS*DepoSS;
# tau_B = omega_B*ProfitBSS/BankcapSS;
# XSS = ((1-omega_D)^(1/hetha_D)*(CSS-h*CSS)^((hetha_D-1)/hetha_D)+omega_D^(1/hetha_D)*DSS^((hetha_D-1)/hetha_D))^(hetha_D/(hetha_D-1));
# XNRSS = ((1-omega_D)^(1/hetha_D)*(CSS-h_NR*CSS)^((hetha_D-1)/hetha_D)+omega_D^(1/hetha_D)*DNRSS^((hetha_D-1)/hetha_D))^(hetha_D/(hetha_D-1));
# UCbisSS = XSS^(-sig_c);
# UCbisNRSS = XNRSS^(-sig_c);
# UCSS = (1-betta*h)*UCbisSS*(1-omega_D)^(1/hetha_D)*(CSS/XSS)^(-1/hetha_D)*(1-h)^(-1/hetha_D);
# UC_DSS = (omega_D)^(1/hetha_D)*(DSS/XSS)^(-1/hetha_D)*UCbisSS;                                                                                 
# UCNRSS = (1-betta_NR*h_NR)*(1-omega_D)^(1/hetha_D)*(CSS/XNRSS)^(-1/hetha_D)*(1-h_NR)^(-1/hetha_D)*UCbisNRSS;
# UC_DNRSS = (omega_D)^(1/hetha_D)*(DNRSS/XNRSS)^(-1/hetha_D)*UCbisNRSS;
# ZP1_DSS = UCSS*MCDSS*ZDSS*TDSS/(1-betta*xi_p_D);
# ZP2_DSS = (1-tauSS)*UCSS*ZDSS*TDSS/(1-betta*xi_p_D);
# ZP1SS = UCSS*MCSS*YSS/(1-betta*xi_p);
# ZP2SS = (1-tauSS)*UCSS*YSS/(1-betta*xi_p);
# WTSS = omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR)*WSS;
# NCSS = LCSS/(omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR));
# NDSS = (1-LCSS)/(omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR));
# WTILD_CSS = WTSS; 
# WTILD_DSS = WTSS;
# WTILD_CNRSS = WTSS; 
# WTILD_DNRSS = WTSS;
# LC_BAR = (1-tauwSS)*UCSS*WTILD_CSS/(muw_C*(1-subvw))*(NCSS)^(-sig_l_C);
# LD_BAR = (1-tauwSS)*UCSS*WTILD_DSS/(muw_D*(1-subvw))*(NDSS)^(-sig_l_D);
# LC_NR_BAR = (1-tauwSS)*UCNRSS*WTILD_CNRSS/(muw_C*(1-subvw))*(NCSS)^(-sig_l_C_NR);
# LD_NR_BAR = (1-tauwSS)*UCNRSS*WTILD_DNRSS/(muw_D*(1-subvw))*(NDSS)^(-sig_l_D_NR);
# ZW1CSS = LC_BAR*NCSS^(1+sig_l_C)*WTSS^(muw_C/(muw_C-1))/(1-betta*xi_w_C);
# ZW1DSS = LD_BAR*(NDSS)^(1+sig_l_D)*WTSS^(muw_D/(muw_D-1))/(1-betta*xi_w_D);
# ZW2CSS = (1-tauwSS)*(UCSS)*NCSS*WTSS^(muw_C/(muw_C-1))/(1-betta*xi_w_C);
# ZW2DSS = (1-tauwSS)*(UCSS)*(NDSS)*WTSS^(muw_D/(muw_D-1))/(1-betta*xi_w_D);
# ZWNR1CSS = LC_NR_BAR*NCSS^(1+sig_l_C_NR)*WTSS^(muw_C/(muw_C-1))/(1-betta_NR*xi_w_C_NR);
# ZWNR1DSS = LD_NR_BAR*(NDSS)^(1+sig_l_D_NR)*WTSS^(muw_D/(muw_D-1))/(1-betta_NR*xi_w_D_NR);
# ZWNR2CSS = (1-tauwSS)*(UCNRSS)*NCSS*WTSS^(muw_C/(muw_C-1))/(1-betta_NR*xi_w_C_NR);
# ZWNR2DSS = (1-tauwSS)*(UCNRSS)*(NDSS)*WTSS^(muw_D/(muw_D-1))/(1-betta_NR*xi_w_D_NR);
# WELFARESS = (XSS^(1-sig_c)/(1-sig_c) - LC_BAR*LCSS^(1+sig_l_C)/(1+sig_l_C)- LD_BAR*(1-LCSS)^(1+sig_l_D)/(1+sig_l_D))/(1-betta);
# WELFARENRSS = (XNRSS^(1-sig_c)/(1-sig_c) - LC_NR_BAR*LCSS^(1+sig_l_C_NR)/(1+sig_l_C_NR)- LD_NR_BAR*(1-LCSS)^(1+sig_l_D_NR)/(1+sig_l_D_NR))/(1-betta_NR);



        WELFARE = exp(EE_B)*(X^(1-sig_c)/(1-sig_c) 
                        - LC_BAR*exp(-EE_L)*(L_C)^(1+sig_l_C)/(1+sig_l_C)- LD_BAR*exp(-EE_L)*(L_D)^(1+sig_l_D)/(1+sig_l_D)
                            - 0*lambdaR/2*(R-RSS)^2) + betta * WELFARE(1) ;
        WELFARENR = exp(EE_B)*(XNR^(1-sig_c)/(1-sig_c) 
                        - LC_NR_BAR*exp(-EE_L)*(L_C)^(1+sig_l_C_NR)/(1+sig_l_C_NR)- LD_NR_BAR*exp(-EE_L)*(L_D)^(1+sig_l_D_NR)/(1+sig_l_D_NR)
                            - 0*lambdaR/2*(R-RSS)^2) + betta_NR * WELFARENR(1) ;

        LAND = LANDSS;
        ATCU = 1/czcap*R_KSS*(exp(czcap*(TCU-1))-1);
        ATCU1 = R_KSS*exp(czcap*(TCU-1));
        SI = phi_i/2*(I_C/I_C(-1)*exp(-EE_Q)-1)^2;  
        SI1 = phi_i*(I_C/I_C(-1)*exp(-EE_Q)-1);
        ATCU_D = 1/czcap*R_KSS*(exp(czcap*(TCU_D-1))-1);
        ATCU1_D = R_KSS*exp(czcap*(TCU_D-1));
        SI_D = phi_i/2*(I_D/I_D(-1)*exp(-EE_Q)-1)^2;  
        SI1_D = phi_i*(I_D/I_D(-1)*exp(-EE_Q)-1);
        SI_H = phi_i_h/2*(I_H/I_H(-1)-1)^2;  
        SI1_H = phi_i_h*(I_H/I_H(-1)-1);
        SI_H_NR = phi_i_h/2*(I_H_NR/I_H_NR(-1)-1)^2;  
        SI1_H_NR = phi_i_h*(I_H_NR/I_H_NR(-1)-1);
        AP = (1+PI)*(1+PI(-1))^(-gamma_p) * (1+PI_BAR)^(gamma_p-1);
        AP_D = (1+PI_D)*(1+PI_D(-1))^(-gamma_p_D) * (1+PI_BAR)^(gamma_p_D-1);
        AW_C = (1+CPI)*(1+CPI(-1))^(-gamma_w_C) * (1+PI_BAR)^(gamma_w_C-1);
        AW_D = (1+CPI)*(1+CPI(-1))^(-gamma_w_D) * (1+PI_BAR)^(gamma_w_D-1);
        AW_C_NR = (1+CPI)*(1+CPI(-1))^(-gamma_w_C_NR) * (1+PI_BAR)^(gamma_w_C_NR-1);
        AW_D_NR = (1+CPI)*(1+CPI(-1))^(-gamma_w_D_NR) * (1+PI_BAR)^(gamma_w_D_NR-1);
        R_K = ATCU1;
        MC = (R_K)^alph*W_C^(1-alph)/(alph^alph*(1-alph)^(1-alph))*exp(-EE_A);                                
        MC_D = (ATCU1_D)^alph_D*W_D^(1-alph_D-alph_LAN)/(alph_D^alph_D*(1-alph_D-alph_LAN)^(1-alph_D-alph_LAN))*(P_L/alph_LAN)^alph_LAN*exp(-EE_A_D)/T_D; 
        X = ((1-exp(EE_H)*omega_D)^(1/hetha_D)*(C-h*C(-1))^((hetha_D-1)/hetha_D)+(exp(EE_H)*omega_D)^(1/hetha_D)*D^((hetha_D-1)/hetha_D))^(hetha_D/(hetha_D-1));
        UCbis = exp(EE_B)*X^(-sig_c);
        XNR = ((1-exp(EE_H)*omega_D)^(1/hetha_D)*(CNR-h_NR*CNR(-1))^((hetha_D-1)/hetha_D)+(exp(EE_H)*omega_D)^(1/hetha_D)*DNR^((hetha_D-1)/hetha_D))^(hetha_D/(hetha_D-1));
        UCbisNR = exp(EE_B)*XNR^(-sig_c);
        K = K_C + K_D;
        L = L_C + L_D;
        I = I_C + I_D;                                                                     
        W = (L_C*W_C + L_D*W_D)/L;
        Z = (TCU*K_C(-1))^alph*(L_C)^(1-alph)*exp(EE_A) - (phi_y-1)*ZSS ;                    
        Z_D = ((TCU_D*K_D(-1))^alph_D*(L_D)^(1-alph_D-alph_LAN)*LAND^alph_LAN*exp(EE_A_D) - (phi_y_D-1)*ZDSS)/Dp_D ;              
        Y = C_E + omega_NR*CNR + (1-omega_NR)*C + I + GSS*ZSS*exp(EE_G) + 1/czcap*R_KSS*(exp(czcap*(TCU-1))-1)*K_C(-1) + 1/czcap*R_KSS*(exp(czcap*(TCU_D-1))-1)*K_D(-1); 

//////////////////////////////////////////////////////////////////////////////////////////////////////
        - UC + (1-exp(EE_H)*omega_D)^(1/hetha_D)*X^(1/hetha_D)*(C-h*C(-1))^(-1/hetha_D)*UCbis - betta*h*(1-exp(EE_H(1))*omega_D)^(1/hetha_D)*X(1)^(1/hetha_D)*(C(1)-h*C)^(-1/hetha_D)*UCbis(1);                                                                                
        - UC_D + (exp(EE_H)*omega_D)^(1/hetha_D)*(D/X)^(-1/hetha_D)*UCbis;                                                                                 
        - T_D*UC*Q_H + UC_D + betta*(1-tau_D)*UC(1)*T_D(1)*Q_H(1);  
        - UC + UC(1)*betta*(1+R_D)/(1+CPI(1));                                                                           

        Q_H*(1 - SI_H - I_H/I_H(-1)*SI1_H)*exp(EE_IH) + betta*Q_H(1)*(T_D(1)/T_D)*UC(1)/UC*SI1_H(1)*(I_H(1)/I_H)^2*exp(EE_IH(1)) - 1;                                                  
        - D + (1-tau_D)*D(-1) + (1-SI_H)*I_H*exp(EE_IH);
        Q_H_NR*(1 - SI_H_NR - I_H_NR/I_H_NR(-1)*SI1_H_NR)*exp(EE_IH) + betta_NR*Q_H_NR(1)*(T_D(1)/T_D)*UCNR(1)/UCNR*SI1_H_NR(1)*(I_H_NR(1)/I_H_NR)^2*exp(EE_IH(1)) - 1;                                                  
        - DNR + (1-tau_D)*DNR(-1) + (1-SI_H_NR)*I_H_NR*exp(EE_IH);

        H_OMEG_HH =  - (normcdf((log(OMEG_HH)-0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1)))) 
                + OMEG_HH*(1-normcdf((log(OMEG_HH)+0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1))))));
        G_OMEG_HH = ((1-mu_HH)*normcdf((log(OMEG_HH)-0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1)))) 
                + OMEG_HH*(1-normcdf((log(OMEG_HH)+0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1))))));
        EFP_OMEG_HH = (1-normcdf((log(OMEG_HH)+0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1)))))
                /(1-normcdf((log(OMEG_HH)+0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1)))) 
                    - mu_HH*OMEG_HH*(1/(OMEG_HH*(sigma_HH*exp(EE_SIG_HH(-1)))*sqrt(2*3.141592653589793)))
                    *exp(-((log(OMEG_HH)+ 0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))^2)/(2*(sigma_HH^2*exp(EE_SIG_HH(-1)*2)))));
        PSI = EFP_OMEG_HH;

        ((1-mu_HH)*normcdf((log(OMEG_HH)-0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1)))) 
                + OMEG_HH*(1-normcdf((log(OMEG_HH)+0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1)))))) 
                =  Debt(-1)*(1+R_L(-1))/(1+CPI)/exp(EE_LTV(-1))/(1-chi_NR)/(1-tau_D)/(Q_H_NR*T_D*DNR(-1));

        - CNR - Q_H_NR*T_D*(DNR - (1-tau_D)*DNR(-1)) + H_OMEG_HH*exp(EE_LTV(-1))*(1-chi_NR)*(1-tau_D)*(Q_H_NR*T_D*DNR(-1)) + Debt 
//                  + (N_C_NR/Dw_C_NR)*W_C_NR+(N_D_NR/Dw_D_NR)*W_D_NR + TRSS;
//                + W*L + TRSS ;
                + (N_C_NR)^(1+sig_l_C_NR)*exp(-EE_L)*LC_NR_BAR/UCNR + (N_D_NR)^(1+sig_l_D_NR)*exp(-EE_L)*LD_NR_BAR/UCNR 
                - (NCSS)^(1+sig_l_C_NR)*LC_NR_BAR/UCNRSS - (NDSS)^(1+sig_l_D_NR)*LD_NR_BAR/UCNRSS + WSS + TRSS ;


        - UCNR + (1-exp(EE_H)*omega_D)^(1/hetha_D)*XNR^(1/hetha_D)*(CNR-h_NR*CNR(-1))^(-1/hetha_D)*UCbisNR - betta_NR*h_NR*(1-exp(EE_H(1))*omega_D)^(1/hetha_D)*XNR(1)^(1/hetha_D)*(CNR(1)-h_NR*CNR)^(-1/hetha_D)*UCbisNR(1);                                                                                 
        - UC_DNR + (exp(EE_H)*omega_D)^(1/hetha_D)*(DNR/XNR)^(-1/hetha_D)*UCbisNR;                                                                                 
        1 - betta_NR*PSI(1)*UCNR(1)/UCNR*(1+R_L)/(1+CPI(1));

        - T_D*Q_H_NR + UC_DNR/UCNR + betta_NR*(1-tau_D)*UCNR(1)/UCNR*T_D(1)*Q_H_NR(1) 
                + betta_NR*(1-tau_D)*UCNR(1)/UCNR*T_D(1)*Q_H_NR(1)*exp(EE_LTV)*(1-chi_NR)*(H_OMEG_HH(1) + G_OMEG_HH(1)*EFP_OMEG_HH(1)) ;  

        R_LL = (1+R_L(-1))*OMEG_HH/G_OMEG_HH -1;

// PSIESS - (1-normcdf((log(OMEGSS)+0.5*sigma^2)/(sigma)))/(1-normcdf((log(OMEGSS)+0.5*sigma^2)/(sigma)) - mu_NFC*OMEGSS*(1/(OMEGSS*(sigma)*sqrt(2*3.141592653589793)))*exp(-((log(OMEGSS)+ 0.5*sigma^2)^2)/(2*(sigma^2))));

        H_OMEG =  - (normcdf((log(OMEG)-0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1)))) 
                + OMEG*exp(0*EE_LTV_E(-1))*(1-normcdf((log(OMEG)+0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1))))));
        G_OMEG = ((1-mu_NFC)*normcdf((log(OMEG)-0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1)))) 
                + OMEG*exp(0*EE_LTV_E(-1))*(1-normcdf((log(OMEG)+0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1))))));
        EFP_OMEG = ((1-normcdf((log(OMEG)+0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1)))))*exp(0*EE_LTV_E(-1))
                +(exp(0*EE_LTV_E(-1))-1)*(OMEG*(1/(OMEG*(sigma*exp(EE_SIG(-1)))*sqrt(2*3.141592653589793)))
                    *exp(-((log(OMEG)+ 0.5*sigma^2*(exp(EE_SIG(-1)*2)))^2)/(2*(sigma^2*exp(EE_SIG(-1)*2))))))
                /(1-normcdf((log(OMEG)+0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1)))) 
                    - mu_NFC*OMEG*(1/(OMEG*(sigma*exp(EE_SIG(-1)))*sqrt(2*3.141592653589793)))
                    *exp(-((log(OMEG)+ 0.5*sigma^2*(exp(EE_SIG(-1)*2)))^2)/(2*(sigma^2*exp(EE_SIG(-1)*2)))));
        PSI_E = EFP_OMEG;

        ((1-mu_NFC)*normcdf((log(OMEG)-0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1)))) 
                + OMEG*exp(0*EE_LTV_E(-1))*(1-normcdf((log(OMEG)+0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1)))))) 
                =  Debt_E(-1)*(1+R_L_E(-1))/(1+CPI)/exp(EE_LTV_E(-1))/(1-chi_NR_E)/(1-tau)/(Q*K_C(-1) + Q_D*K_D(-1));

        - C_E - Q*(K_C - (1-tau)*K_C(-1))*exp(-0*EE_Q) - Q_D*(K_D - (1-tau)*K_D(-1))*exp(-0*EE_Q) 
                - 1/czcap*R_KSS*(exp(czcap*(TCU-1))-1)*K_C(-1) - 1/czcap*R_KSS*(exp(czcap*(TCU_D-1))-1)*K_D(-1)
                + Debt_E + MC*Z + MC_D*Z_D - W_C*L_C - W_D*L_D + TRESS 
                - (normcdf((log(OMEG)-0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1)))) 
                + OMEG*exp(0*EE_LTV_E(-1))*(1-normcdf((log(OMEG)+0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1))))))*exp(EE_LTV_E(-1))*(1-chi_NR_E)*(1-tau)*(Q*K_C(-1) + Q_D*K_D(-1)); 

        UCbis_E = exp(EE_B)*(C_E-h_E*C_E(-1))^(-sig_c_E);
        - UC_E + UCbis_E - betta_NR_E*h_E*UCbis_E(1);       
        1 - betta_NR_E*PSI_E(1)*UC_E(1)/UC_E*(1+R_L_E)/(1+CPI(1));
        - Q + betta_NR_E*UC_E(1)/UC_E*(Q(1)*(1-tau) + TCU(1)*ATCU1(1) - ATCU(1))                                            
                + betta_NR_E*UC_E(1)/UC_E*(1-tau)*exp(EE_LTV_E)*(1-chi_NR_E)*Q(1)*(H_OMEG(1) + G_OMEG(1)*EFP_OMEG(1) );                                            
        - Q_D +  betta_NR_E*UC_E(1)/UC_E*(Q_D(1)*(1-tau) + TCU_D(1)*ATCU1_D(1) - ATCU_D(1)) 
                + betta_NR_E*UC_E(1)/UC_E*(1-tau)*exp(EE_LTV_E)*(1-chi_NR_E)*Q_D(1)*(H_OMEG(1) + G_OMEG(1)*EFP_OMEG(1) );                                       
        R_LL_E = (1+R_L_E(-1))*OMEG/G_OMEG - 1 ;
        
        Q*(1 - SI - I_C/I_C(-1)*exp(-EE_Q)*SI1)*exp(EE_I) + betta*Q(1)*UC(1)/UC*SI1(1)*(I_C(1)/I_C*exp(-EE_Q(1)))^2*exp(EE_I(1)) - exp(-0*EE_Q);               
        Q_D*(1 - SI_D - I_D/I_D(-1)*exp(-EE_Q)*SI1_D)*exp(EE_I) + betta*Q_D(1)*UC(1)/UC*SI1_D(1)*(I_D(1)/I_D*exp(-EE_Q(1)))^2*exp(EE_I(1)) - exp(-0*EE_Q);               
        - K_C +  (1-tau)*K_C(-1)+(1 - SI)*I_C*exp(EE_I);                                                                        
        - K_D +  (1-tau)*K_D(-1)+(1 - SI_D)*I_D*exp(EE_I);   
        - L_C*W_C + (1-alph)/alph*(ATCU1*TCU*K_C(-1));                                                                              
        - L_D*W_D + (1-alph_D-alph_LAN)/alph_D*(ATCU1_D*TCU_D*K_D(-1));       
        - Z + Dp*Y ;
        - Z_D + (1-omega_NR)*(I_H) + omega_NR*(I_H_NR) + GDSS*ZDSS*exp(EE_G); 
        - P_L + alph_LAN*T_D*Z_D/LAND; //different in paper

        W_C = W_C_S^(1-omega_NR)*W_C_NR^omega_NR/(omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR));
        W_D = W_D_S^(1-omega_NR)*W_D_NR^omega_NR/(omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR));
        - L_C + omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR)*(N_C_S/Dw_C)^(1-omega_NR)*(N_C_NR/Dw_C_NR)^omega_NR;
        - L_D + omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR)*(N_D_S/Dw_D)^(1-omega_NR)*(N_D_NR/Dw_D_NR)^omega_NR;
        - (N_C_S/Dw_C)*W_C_S + (N_C_NR/Dw_C_NR)*W_C_NR ;                                                                              
        - (N_D_S/Dw_C_NR)*W_D_S + (N_D_NR/Dw_D_NR)*W_D_NR;                                                                              

        - W_C_S^(1/(1-muw_C)) + (1-xi_w_C)*(muw_C*(1-subvw)*ZW1_C/ZW2_C)^(-1/(muw_C-1)) 
                                + xi_w_C*W_C_S(-1)^(1/(1-muw_C))*AW_C^(-1/(1-muw_C));                               
        - ZW1_C + exp(EE_B)*exp(-EE_L)*LC_BAR*N_C_S^(1+sig_l_C)*W_C_S^(muw_C/(muw_C-1))
                                + betta*xi_w_C*AW_C(1)^(muw_C/(muw_C-1))*ZW1_C(1);                                  
        - ZW2_C + (1-tauwSS)*exp(EE_W)*(UC)*N_C_S*W_C_S^(muw_C/(muw_C-1)) + betta*xi_w_C * AW_C(1)^(1/(muw_C-1))*ZW2_C(1) ;                     
        - Dw_C + (1-xi_w_C)*W_C_S^(muw_C/(muw_C-1))*(muw_C*(1-subvw)*(ZW1_C)/(ZW2_C))^(-muw_C/(muw_C-1))
                              + xi_w_C*Dw_C(-1)*(W_C_S/W_C_S(-1))^(muw_C/(muw_C-1))*AW_C^(muw_C/(muw_C-1)) ;        
   
         - W_C_NR^(1/(1-muw_C)) + (1-xi_w_C_NR)*(muw_C*(1-subvw)*ZWNR1_C/ZWNR2_C)^(-1/(muw_C-1)) 
                                + xi_w_C_NR*W_C_NR(-1)^(1/(1-muw_C))*AW_C_NR^(-1/(1-muw_C));                               
        - ZWNR1_C + exp(EE_B)*exp(-EE_L)*LC_NR_BAR*N_C_NR^(1+sig_l_C_NR)*W_C_NR^(muw_C/(muw_C-1))
                             + betta_NR*xi_w_C_NR*AW_C_NR(1)^(muw_C/(muw_C-1))*ZWNR1_C(1);                                  
        - ZWNR2_C + (1-tauwSS)*exp(EE_W)*(UCNR)*N_C_NR*W_C_NR^(muw_C/(muw_C-1)) + betta_NR*xi_w_C_NR * AW_C_NR(1)^(1/(muw_C-1))*ZWNR2_C(1) ;                     
        - Dw_C_NR + (1-xi_w_C_NR)*W_C_NR^(muw_C/(muw_C-1))*(muw_C*(1-subvw)*(ZWNR1_C)/(ZWNR2_C))^(-muw_C/(muw_C-1))
                              + xi_w_C_NR*Dw_C_NR(-1)*(W_C_NR/W_C_NR(-1))^(muw_C/(muw_C-1))*AW_C_NR^(muw_C/(muw_C-1)) ;        
 
        - W_D_S^(1/(1-muw_D)) + (1-xi_w_D)*(muw_D*(1-subvw)*ZW1_D/ZW2_D)^(-1/(muw_D-1)) 
                              + xi_w_D*W_D_S(-1)^(1/(1-muw_D))*AW_D^(-1/(1-muw_D));                               
        - ZW1_D + exp(EE_B)*exp(-EE_L)*LD_BAR*N_D_S^(1+sig_l_D)*W_D_S^(muw_D/(muw_D-1))
                              + betta*xi_w_D*AW_D(1)^(muw_D/(muw_D-1))*ZW1_D(1);                                  
        - ZW2_D + (1-tauwSS)*exp(EE_W)*(UC)*N_D_S*W_D_S^(muw_D/(muw_D-1)) + betta*xi_w_D * AW_D(1)^(1/(muw_D-1))*ZW2_D(1) ;                     
        - Dw_D + (1-xi_w_D)*W_D_S^(muw_D/(muw_D-1))*(muw_D*(1-subvw)*(ZW1_D)/(ZW2_D))^(-muw_D/(muw_D-1))
                            + xi_w_D*Dw_D(-1)*(W_D_S/W_D_S(-1))^(muw_D/(muw_D-1))*AW_D^(muw_D/(muw_D-1)) ;        

        - W_D_NR^(1/(1-muw_D)) + (1-xi_w_D_NR)*(muw_D*(1-subvw)*ZWNR1_D/ZWNR2_D)^(-1/(muw_D-1)) 
                              + xi_w_D_NR*W_D_NR(-1)^(1/(1-muw_D))*AW_D_NR^(-1/(1-muw_D));                               
        - ZWNR1_D + exp(EE_B)*exp(-EE_L)*LD_NR_BAR*N_D_NR^(1+sig_l_D_NR)*W_D_NR^(muw_D/(muw_D-1))
                              + betta_NR*xi_w_D_NR*AW_D_NR(1)^(muw_D/(muw_D-1))*ZWNR1_D(1);                                  
        - ZWNR2_D + (1-tauwSS)*exp(EE_W)*(UCNR)*N_D_NR*W_D_NR^(muw_D/(muw_D-1)) + betta_NR*xi_w_D_NR * AW_D_NR(1)^(1/(muw_D-1))*ZWNR2_D(1) ;                     
        - Dw_D_NR + (1-xi_w_D_NR)*W_D_NR^(muw_D/(muw_D-1))*(muw_D*(1-subvw)*(ZWNR1_D)/(ZWNR2_D))^(-muw_D/(muw_D-1))
                              + xi_w_D_NR*Dw_D_NR(-1)*(W_D_NR/W_D_NR(-1))^(muw_D/(muw_D-1))*AW_D_NR^(muw_D/(muw_D-1)) ;        
    
        - Dp_D + (1-xi_p_D)*(mu_D*(1-subv_D)*ZP1_D/ZP2_D)^(-mu_D/(mu_D-1)) + xi_p_D*Dp_D(-1)*AP_D^(mu_D/(mu_D-1));                         
        - (mu_D*(1-subv_D)*ZP1_D/ZP2_D)^(1/(1-mu_D))*(1 - xi_p_D) + 1 - xi_p_D *AP_D^(1/(mu_D-1));                                      
        - ZP1_D + UC*MC_D*Z_D*T_D + betta*xi_p_D * AP_D(1)^(mu_D/(mu_D-1))*ZP1_D(1);                                                             
        - ZP2_D + (1-tauSS)*exp(EE_P_D)*UC*Z_D*T_D + betta*xi_p_D * AP_D(1)^(1/(mu_D-1))*ZP2_D(1);                                             

        - Dp + (1-xi_p)*(mu*(1-subv)*ZP1/ZP2)^(-mu/(mu-1)) + xi_p*Dp(-1)*AP^(mu/(mu-1));                         
        - (mu*(1-subv)*ZP1/ZP2)^(1/(1-mu))*(1 - xi_p) + 1 - xi_p *AP^(1/(mu-1));                                      
        - ZP1 + UC*MC*Y + betta*xi_p * AP(1)^(mu/(mu-1))*ZP1(1);                                                             
        - ZP2 + (1-tauSS)*exp(EE_P)*UC*Y + betta*xi_p * AP(1)^(1/(mu-1))*ZP2(1);                                             

        - CPI + PI;
        - T_D + T_D(-1)*(1+PI_D)/(1+CPI);

        (1+PI)*Bankcap = exp(-EE_Bankcap)*(1-tau_B)*Bankcap(-1) + omega_B*Profit_B(-1);
        Profit_B = R_L*omega_NR*Debt + R_L_E*Debt_E - R_D*Depo  - kappa_b/2*(Bankcap/Debt_TOT_W - nu_b)^2;
        Debt_TOT = omega_NR*Debt*Dp_R_L + Debt_E*Dp_R_L_E;
        Debt_TOT_W = bw*omega_NR*Debt*Dp_R_L + Debt_E*Dp_R_L_E;
        Depo*Dp_R_D + Bankcap = omega_NR*Debt*Dp_R_L + Debt_E*Dp_R_L_E;
        RB_D = R;
        RB_L = R - bw*kappa_b*(Bankcap/Debt_TOT_W - nu_b)*(Bankcap/Debt_TOT_W)^2;
        RB_L_E = R - kappa_b*(Bankcap/Debt_TOT_W - nu_b)*(Bankcap/Debt_TOT_W)^2;
        LEV = Debt_TOT/Bankcap;
        SB_L = RB_L - R;
        SB_L_E = RB_L_E - R;
 
//         AR_D = (1+R_D)/(1+R_D(-1));
//       - Dp_R_D + (1-xi_R_D)*(mu_R_D*(1-subv_R_D)*Z1_R_D/Z2_R_D)^(-mu_R_D/(mu_R_D-1)) + xi_R_D*Dp_R_D(-1)*AR_D^(mu_R_D/(mu_R_D-1));                         
//        - (mu_R_D*(1-subv_R_D)*Z1_R_D/Z2_R_D)^(1/(1-mu_R_D))*(1 - xi_R_D) + 1 - xi_R_D *AR_D^(1/(mu_R_D-1));                                      
//        - Z1_R_D + (1+RB_D)/(1+R_D)*UC*Depo + betta*xi_R_D * AR_D(1)^(mu_R_D/(mu_R_D-1))*Z1_R_D(1);                                                             
//        - Z2_R_D + exp(EE_R_D)*UC*Depo + betta*xi_R_D * AR_D(1)^(1/(mu_R_D-1))*Z2_R_D(1);                                             

//        AR_L = (1+R_L)/(1+R_L(-1));
//        - Dp_R_L + (1-xi_R_L)*(mu_R_L*(1-subv_R_L)*Z1_R_L/Z2_R_L)^(-mu_R_L/(mu_R_L-1)) + xi_R_L*Dp_R_L(-1)*AR_L^(mu_R_L/(mu_R_L-1));                         
//        - (mu_R_L*(1-subv_R_L)*Z1_R_L/Z2_R_L)^(1/(1-mu_R_L))*(1 - xi_R_L) + 1 - xi_R_L *AR_L^(1/(mu_R_L-1));                                      
//        - Z1_R_L + (1+RB_L)/(1+R_L)*UC*Debt + betta*xi_R_L * AR_L(1)^(mu_R_L/(mu_R_L-1))*Z1_R_L(1);                                                             
//        - Z2_R_L + exp(EE_R_L)*UC*Debt + betta*xi_R_L * AR_L(1)^(1/(mu_R_L-1))*Z2_R_L(1);                                             

//        AR_L_E = (1+R_L_E)/(1+R_L_E(-1));
//        - Dp_R_L_E + (1-xi_R_L_E)*(mu_R_L_E*(1-subv_R_L_E)*Z1_R_L_E/Z2_R_L_E)^(-mu_R_L_E/(mu_R_L_E-1)) + xi_R_L_E*Dp_R_L_E(-1)*AR_L_E^(mu_R_L_E/(mu_R_L_E-1));                         
//        - (mu_R_L_E*(1-subv_R_L_E)*Z1_R_L_E/Z2_R_L_E)^(1/(1-mu_R_L_E))*(1 - xi_R_L_E) + 1 - xi_R_L_E*AR_L_E^(1/(mu_R_L_E-1));                                      
//        - Z1_R_L_E + (1+RB_L)/(1+R_L_E)*UC*Debt_E + betta*xi_R_L_E*AR_L_E(1)^(mu_R_L_E/(mu_R_L_E-1))*Z1_R_L_E(1);                                                             
//        - Z2_R_L_E + exp(EE_R_L_E)*UC*Debt_E + betta*xi_R_L_E*AR_L_E(1)^(1/(mu_R_L_E-1))*Z2_R_L_E(1);                                             

         AR_D = (R_D)/(R_D(-1));
       - Dp_R_D + (1-xi_R_D)*(mu_R_D*(1-subv_R_D)*Z1_R_D/Z2_R_D)^(-mu_R_D/(mu_R_D-1)) + xi_R_D*Dp_R_D(-1)*AR_D^(mu_R_D/(mu_R_D-1));                         
        - (mu_R_D*(1-subv_R_D)*Z1_R_D/Z2_R_D)^(1/(1-mu_R_D))*(1 - xi_R_D) + 1 - xi_R_D *AR_D^(1/(mu_R_D-1));                                      
        - Z1_R_D + (RB_D)/(R_D)*UC*Depo + betta*xi_R_D * AR_D(1)^(mu_R_D/(mu_R_D-1))*Z1_R_D(1);                                                             
        - Z2_R_D + exp(EE_R_D)*UC*Depo + betta*xi_R_D * AR_D(1)^(mu_R_D/(mu_R_D-1)-1)*Z2_R_D(1);                                             

        AR_L = (R_L)/(R_L(-1));
        - Dp_R_L + (1-xi_R_L)*(mu_R_L*(1-subv_R_L)*Z1_R_L/Z2_R_L)^(-mu_R_L/(mu_R_L-1)) + xi_R_L*Dp_R_L(-1)*AR_L^(mu_R_L/(mu_R_L-1));                         
        - (mu_R_L*(1-subv_R_L)*Z1_R_L/Z2_R_L)^(1/(1-mu_R_L))*(1 - xi_R_L) + 1 - xi_R_L *AR_L^(1/(mu_R_L-1));                                      
        - Z1_R_L + (RB_L)/(R_L)*UC*Debt + betta*xi_R_L * AR_L(1)^(mu_R_L/(mu_R_L-1))*Z1_R_L(1);                                                             
        - Z2_R_L + exp(EE_R_L)*UC*Debt + betta*xi_R_L * AR_L(1)^(mu_R_L/(mu_R_L-1)-1)*Z2_R_L(1);                                             

        AR_L_E = (R_L_E)/(R_L_E(-1));
        - Dp_R_L_E + (1-xi_R_L_E)*(mu_R_L_E*(1-subv_R_L_E)*Z1_R_L_E/Z2_R_L_E)^(-mu_R_L_E/(mu_R_L_E-1)) + xi_R_L_E*Dp_R_L_E(-1)*AR_L_E^(mu_R_L_E/(mu_R_L_E-1));                         
        - (mu_R_L_E*(1-subv_R_L_E)*Z1_R_L_E/Z2_R_L_E)^(1/(1-mu_R_L_E))*(1 - xi_R_L_E) + 1 - xi_R_L_E*AR_L_E^(1/(mu_R_L_E-1));                                      
        - Z1_R_L_E + (RB_L_E)/(R_L_E)*UC*Debt_E + betta*xi_R_L_E*AR_L_E(1)^(mu_R_L_E/(mu_R_L_E-1))*Z1_R_L_E(1);                                                             
        - Z2_R_L_E + exp(EE_R_L_E)*UC*Debt_E + betta*xi_R_L_E*AR_L_E(1)^(mu_R_L_E/(mu_R_L_E-1)-1)*Z2_R_L_E(1);                                             


        AR_L_E_R = (R_L_E_R)/(R_L_E_R(-1));
        - (mu_R_L_E*(1-subv_R_L_E)*Z1_R_L_E_R/Z2_R_L_E_R)^(1/(1-mu_R_L_E))*(1 - xi_R_L_E) + 1 - xi_R_L_E*AR_L_E_R^(1/(mu_R_L_E-1));                                      
        - Z1_R_L_E_R + (R)/(R_L_E_R)*UC*Debt_E + betta*xi_R_L_E*AR_L_E_R(1)^(mu_R_L_E/(mu_R_L_E-1))*Z1_R_L_E_R(1);                                                             
        - Z2_R_L_E_R + exp(0*EE_R_L_E)*UC*Debt_E + betta*xi_R_L_E*AR_L_E_R(1)^(mu_R_L_E/(mu_R_L_E-1)-1)*Z2_R_L_E_R(1);                                             

        AR_L_E_R_MU = (R_L_E_R_MU)/(R_L_E_R_MU(-1));
        - (mu_R_L_E*(1-subv_R_L_E)*Z1_R_L_E_R_MU/Z2_R_L_E_R_MU)^(1/(1-mu_R_L_E))*(1 - xi_R_L_E) + 1 - xi_R_L_E*AR_L_E_R_MU^(1/(mu_R_L_E-1));                                      
        - Z1_R_L_E_R_MU + (R)/(R_L_E_R_MU)*UC*Debt_E + betta*xi_R_L_E*AR_L_E_R_MU(1)^(mu_R_L_E/(mu_R_L_E-1))*Z1_R_L_E_R_MU(1);                                                             
        - Z2_R_L_E_R_MU + exp(EE_R_L_E)*UC*Debt_E + betta*xi_R_L_E*AR_L_E_R_MU(1)^(mu_R_L_E/(mu_R_L_E-1)-1)*Z2_R_L_E_R_MU(1);                                             



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

       Robs = r_dpi*((CPIobs)-CPIobs(-1))
              +(1-rho)*(r_PI*(CPIobs(-1))+r_y*(Zobs(-1)))
              +r_dy*(Zobs-Zobs(-1))
              +rho*(Robs(-1))
              + r_dtd*(T_Dobs - T_Dobs(-1))
              +E_R;
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        E_F = 0.5*E_F(-1) + 0.5*E_F(1)
                + (1-xie)*(1-betta*xie)/(xie)*(100*log(L/LSS) - E_F);
        Robs = 100*((1+R)/(1+RSS)-1);
        Yobs = 100*log(Y/YSS);
        Zobs = 100*(ZSS/(ZSS + ZDSS*TDSS)*log(Z/ZSS) + ZDSS*TDSS/(ZSS + ZDSS*TDSS)*log(Z_D/ZDSS));
//288
        Z_Dobs = 100*log(Z_D/ZDSS);
        Cobs = 100*log((omega_NR*CNR + (1-omega_NR)*C)/CSS);
        Iobs = 100*log(I/ISS);
        Lobs = 100*log(L/LSS);         
        Wobs = 100*log(W/WSS);// + 100*(1-nn)*(log(TOT)-log(RER_H));         
        CPIobs = 100*CPI;
        PIobs = 100*PI ;
        PI_Dobs = 100*PI_D ;
        PIgdpobs = PIobs;
        T_Dobs = 100*log(T_D/TDSS);
        dDebtobs=100*log(Debt/Debt(-1)); 
        Debtobs = 100*log(Debt/DebtSS); 
        CRobs=100*log(C/CSS); 
        CNRobs=100*log(CNR/CSS); 
        DRobs =100*log(D/DSS); 
        DNRobs =100*log(DNR/DNRSS); 
        L_Cobs=100*log(L_C/LCSS); 
        L_Dobs=100*log(L_D/(1-LCSS)); 
        W_Cobs=100*log(W_C/WSS); 
        W_Dobs=100*log(W_D/WSS); 

        R_LLobs = 100*((1+R_LL)/(1+RLLSS)-1);
        R_LL_Eobs = 100*((1+R_LL_E)/(1+RLLESS)-1);
        R_Lobs = 100*((1+R_L)/(1+RLSS)-1);
        R_Dobs = 100*((1+R_D)/(1+RDSS)-1);
        RB_Lobs = 100*((1+RB_L)/(1+RBLSS)-1);
        RB_L_Eobs = 100*((1+RB_L_E)/(1+RBLESS)-1);
        R_L_Eobs = 100*((1+R_L_E)/(1+RLESS)-1);
        RB_Dobs = 100*((1+RB_D)/(1+RBDSS)-1);
        Debt_Eobs = 100*log(Debt_E/DebtESS); 
        Debt_TOTobs = 100*log(Debt_TOT/DebtTOTSS); 
        Depoobs = 100*log(Depo/DepoSS);
        Bankcapobs = 100*log(Bankcap/BankcapSS);
        LEVobs = 100*log(LEV/DebtTOTSS*BankcapSS);
        SB_Lobs = 100*(RB_L - R - (RBLSS - RSS));
        S_Dobs = 100*(R_D - R - (RDSS - RSS));
        S_Lobs = 100*(R_L - R - (RLSS - RSS));
        S_LLobs = 100*(R_LL - R_L(-1) - (RLLSS - RLSS));
        S_L_E_Robs = 100*(R_L_E_R - R - (RLESS - RSS));
        S_L_E_R_MUobs = 100*(R_L_E_R_MU - R_L_E_R - (RLESS - RLESS));
        S_L_Eobs = 100*(R_L_E - R_L_E_R_MU - (RLESS - RLESS));
        S_LL_Eobs = 100*(R_LL_E - R_L_E(-1) - (RLLESS - RLESS));
        PD_HHobs = 100*( normcdf((log(OMEG_HH)+0.5*sigma_HH^2*(exp(EE_SIG_HH(-1)*2)))/(sigma_HH*exp(EE_SIG_HH(-1)))) - normcdf((log(OMEGHHSS)+0.5*sigma_HH^2)/(sigma_HH)));
        PD_Eobs = 100*( normcdf((log(OMEG)+0.5*sigma^2*(exp(EE_SIG(-1)*2)))/(sigma*exp(EE_SIG(-1)))) - normcdf((log(OMEGSS)+0.5*sigma^2)/(sigma)));

        EE_A = rho_a*EE_A(-1) + E_A/100 ;
        EE_A_D = rho_a_D*EE_A_D(-1) + E_A/100 + E_A_D/100 ;
        EE_B = rho_b*EE_B(-1) + E_B/100;// + corHC*E_H/100 ;
        EE_G = rho_g*EE_G(-1) + E_G/100 ;
        EE_L = 0;
        EE_I = rho_i*EE_I(-1);// + E_I/10 ;
        EE_P = 0*EE_P(-1) - E_P/100/(((1-xi_p)*(1-betta*xi_p)/(xi_p))) ;
        EE_P_D =0*EE_P_D(-1)- 0*E_P/100/(((1-xi_p_D)*(1-betta*xi_p_D)/(xi_p_D))) ;// + E_P_D/100;
        EE_Q = rho_i*EE_Q(-1) + E_I/10  + corIC*EE_B ;//+ E_Q/100 
        EE_W = rho_l*EE_W(-1) + E_W/100/((1/(1+betta))*(1-betta*xi_w_C)*(1-xi_w_C)/xi_w_C);
        EE_LTV = rho_LTV*EE_LTV(-1);// + E_LTV/100 - 0*corBCLTV*EE_Bankcap/10;// + F_LTV/100/(1-chi_NR); 
        EE_H = rho_H*EE_H(-1) + E_H/100 + corHC*E_B/100 ;
        EE_R = 0*EE_R(-1) + E_R ; 
        EE_R_D = rho_R_D*EE_R_D(-1) + E_R_D/RDSS/100/(((1-xi_R_D)*(1-betta*xi_R_D)/(xi_R_D)));
        EE_R_L = rho_R_L*EE_R_L(-1) + E_R_L/RLSS/100/(((1-xi_R_L)*(1-betta*xi_R_L)/(xi_R_L)));
        EE_R_L_E = rho_R_L_E*EE_R_L_E(-1) + E_R_L_E/RLESS/100/(((1-xi_R_L_E)*(1-betta*xi_R_L_E)/(xi_R_L_E))) ;
        EE_LTV_E = rho_LTV_E*EE_LTV_E(-1);// + E_LTV_E/10 - 0*corBVLTVE*EE_Bankcap/10;// + F_LTV/100/(1-chi_NR_E);
        EE_IH = rho_i_H*EE_IH(-1);// + E_IH; 
        EE_Bankcap = (rho_Bankcap)*EE_Bankcap(-1) + E_Bankcap/50;

        EE_SIG = rho_sig*EE_SIG(-1)+E_SIG ;// + E_SIG_NEWS1 + EE_SIG_NEWS1(-1);

EE_SIG_NEWS1 = EE_SIG_NEWS2(-1);// + E_SIG_NEWS1; 
EE_SIG_NEWS2 = EE_SIG_NEWS3(-1);// + E_SIG_NEWS1;
EE_SIG_NEWS3 = EE_SIG_NEWS4(-1);// + E_SIG_NEWS1;
EE_SIG_NEWS4 = EE_SIG_NEWS5(-1);// + E_SIG_NEWS1;
EE_SIG_NEWS5 = EE_SIG_NEWS6(-1);// + E_SIG_NEWS1;
EE_SIG_NEWS6 = EE_SIG_NEWS7(-1);// + E_SIG_NEWS1;
EE_SIG_NEWS7 = EE_SIG_NEWS8(-1);// + E_SIG_NEWS1;
EE_SIG_NEWS8 = 0;//E_SIG_NEWS1;

        EE_SIG_HH = rho_sig_HH*EE_SIG_HH(-1)+E_SIG_HH + corHSIG*E_H/100 ;// + E_SIG_HH_NEWS1 + EE_SIG_HH_NEWS1(-1);

EE_SIG_HH_NEWS1 = EE_SIG_HH_NEWS2(-1);// + E_SIG_HH_NEWS1; 
EE_SIG_HH_NEWS2 = EE_SIG_HH_NEWS3(-1);// + E_SIG_HH_NEWS1;
EE_SIG_HH_NEWS3 = EE_SIG_HH_NEWS4(-1);// + E_SIG_HH_NEWS1;
EE_SIG_HH_NEWS4 = EE_SIG_HH_NEWS5(-1);// + E_SIG_HH_NEWS1;
EE_SIG_HH_NEWS5 = EE_SIG_HH_NEWS6(-1);// + E_SIG_HH_NEWS1;
EE_SIG_HH_NEWS6 = EE_SIG_HH_NEWS7(-1);// + E_SIG_HH_NEWS1;
EE_SIG_HH_NEWS7 = EE_SIG_HH_NEWS8(-1);// + E_SIG_HH_NEWS1;
EE_SIG_HH_NEWS8 = 0;//E_SIG_HH_NEWS1;


PI_BAR = 0;

end;

shocks; //estimated
var	E_A	;	stderr	0.49	;
var	E_B	;	stderr	1.44	;
var	E_G	;	stderr	1.85	;
var	E_W	;	stderr	0.17	;
var	E_I	;	stderr	0.26	;
var	E_R	;	stderr	0.10	;
var	E_R_L	;	stderr	0.06	;
var	E_R_L_E	;	stderr	0.12	;
var	E_R_D	;	stderr	0.06	;
var	E_P	;	stderr	0.28	;
var	E_A_D	;	stderr	2.09	;
var	E_H	;	stderr	2.04	;
var	E_Bankcap	;	stderr	2.32	;
var	E_SIG	;	stderr	0.06	;
var	E_SIG_HH	;	stderr	0.08	;

end;

//resid(1);
steady;
check;

//stoch_simul(order=1,irf=20) Robs Yobs Zobs Cobs Iobs Lobs Wobs CPIobs PIobs PIgdpobs Z_Dobs DRobs DNRobs 
//    PI_Dobs T_Dobs dDebtobs Debtobs CRobs CNRobs L_Cobs L_Dobs W_Cobs W_Dobs 
//    R_Lobs R_Dobs RB_Lobs R_L_Eobs RB_Dobs Debt_Eobs Debt_TOTobs Bankcapobs LEVobs
//    SB_Lobs Depoobs R_LLobs R_LL_Eobs S_LLobs S_LL_Eobs ;

//stoch_simul(order=1,irf=20,irf_shocks=(E_Bankcap,E_R_L,E_R)) Zobs Cobs Iobs Z_Dobs Lobs Wobs T_Dobs CPIobs Debtobs Debt_Eobs LEVobs 
//    Bankcapobs Depoobs R_Dobs SB_Lobs Robs S_LLobs R_Lobs S_LL_Eobs R_L_Eobs;

stoch_simul(order=1,irf=20, noprint, nograph) Zobs Iobs Cobs Robs;