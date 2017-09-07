% computes the steady state of ramst.mod analyticaly. 
% [stephane.adjemian@ens.fr 06-21-2006]
function [ys,check] = SWNLRamseyIRest_steadystate(ys,exe)
  global M_ options_ oo_ 
  
  mu = 0;     % These initializations are needed because mu,beta and alpha are fonctions of a
  beta = 0;   % matlab toolbox!
  alpha = 0;  % 
  
  
  %%$$ DON'T CHANGE THIS PART
  NumberOfParameters = M_.param_nbr;
  for i = 1:NumberOfParameters
    paramname = deblank(M_.param_names(i,:)); 
    eval([ paramname ' = M_.params(' int2str(i) ');']);    
  end
  check = 0;
  %%$$END.
  
 
  czcap = czcapbis/(1-czcapbis);
 h_E = h;
 h_NR = h;
 sig_l_D = sig_l_C;
 sig_l_C_NR = sig_l_C;
 sig_l_D_NR = sig_l_D;
 xi_w_C_NR = xi_w_C;
 gamma_w_C_NR = gamma_w_C; 
 gamma_w_D = gamma_w_C; 
 xi_w_D_NR = xi_w_D;
 gamma_w_D_NR = gamma_w_D; 
 MCSS = (1-tauSS)/(mu*(1-subv));
 MCDSS = (1-tauSS)/(mu_D*(1-subv_D));
 RSS = (1/betta-1)/(mu_R_D*(1-subv_R_D));
 RBDSS = RSS; 
 RBLSS = RSS;
 RBLESS = RSS;
 RDSS = (RBDSS)*mu_R_D*(1-subv_R_D); 
 RLSS = (RBLSS)*mu_R_L*(1-subv_R_L);
 RLESS = (RBLESS)*mu_R_L_E*(1-subv_R_L_E);
 RLLSS = (1+RLSS)*OMEGHHSS/GOMEGHHSS -1;
 RLLESS = (1+RLESS)*OMEGSS/GOMEGSS - 1 ;
 R_KSS = 1/betta_NR_E - (1-tau) - (1-tau)*(1-chi_NR_E)*(HOMEGSS + GOMEGSS*EFPOMEGSS);                                            
 ATCUSS = 1/czcap*R_KSS*(exp(czcap*(TCUSS-1))-1);
 ATCU1SS = R_KSS*exp(czcap*(TCUSS-1));
 WSS = (MCSS*R_KSS^(-alph)*alph^alph*(1-alph)^(1-alph))^(1/(1-alph));
 TDSS = mu_D*(1-subv_D)*WSS^(1-alph_D-alph_LAN)*R_KSS^(alph_D)/((alph_D^alph_D)*(1-alph_D-alph_LAN)^(1-alph_D-alph_LAN))*(PLSS/alph_LAN)^alph_LAN;
 KLSS = alph/(1-alph)*WSS/R_KSS;
 KLDSS = alph_D/(1-alph_D-alph_LAN)*WSS/R_KSS;
 DCSS = omega_D/(1-omega_D)*(TDSS*(1-betta*(1-tau_D)))^(-hetha_D)*(1-betta*h)^(-hetha_D)*(1-h);
 DCNRSS = omega_D/(1-omega_D)*(TDSS*(1 - betta_NR*(1-tau_D) - betta_NR*(1-tau_D)*(1-chi_NR)*(HOMEGHHSS + GOMEGHHSS*EFPOMEGHHSS)))^(-hetha_D)*(1-betta_NR*h_NR)^(-hetha_D)*(1-h_NR) ;  
 LAND_LDSS = (WSS/PLSS)*(alph_LAN/(1-alph_D-alph_LAN)); 
 ZLSS = KLSS^alph/ phi_y;
 ZLDSS = (KLDSS^alph_D)*(LAND_LDSS^alph_LAN)/ phi_y_D;

 CSS = -(ZLSS-tau*KLSS-GSS*ZLSS-ZLSS*GDSS+tau*KLSS*GDSS+GSS*ZLSS*GDSS)*ZLDSS/(-ZLDSS-ZLDSS*CECSS+GDSS*ZLDSS+GDSS*ZLDSS*CECSS-tau_D*omega_NR*DCNRSS*ZLSS-tau_D*omega_NR*DCNRSS*tau*KLDSS+tau_D*omega_NR*DCNRSS*GSS*ZLSS+tau_D*omega_NR*DCNRSS*tau*KLSS-tau_D*DCSS*ZLSS-tau_D*DCSS*tau*KLDSS+tau_D*DCSS*GSS*ZLSS+tau_D*DCSS*tau*KLSS+tau_D*DCSS*omega_NR*ZLSS+tau_D*DCSS*omega_NR*tau*KLDSS-tau_D*DCSS*omega_NR*GSS*ZLSS-tau_D*DCSS*omega_NR*tau*KLSS);
 LCSS = -(ZLDSS+ZLDSS*CECSS-GDSS*ZLDSS-GDSS*ZLDSS*CECSS+tau_D*omega_NR*DCNRSS*tau*KLDSS+tau_D*DCSS*tau*KLDSS-tau_D*DCSS*omega_NR*tau*KLDSS)/(-ZLDSS-ZLDSS*CECSS+GDSS*ZLDSS+GDSS*ZLDSS*CECSS-tau_D*omega_NR*DCNRSS*ZLSS-tau_D*omega_NR*DCNRSS*tau*KLDSS+tau_D*omega_NR*DCNRSS*GSS*ZLSS+tau_D*omega_NR*DCNRSS*tau*KLSS-tau_D*DCSS*ZLSS-tau_D*DCSS*tau*KLDSS+tau_D*DCSS*GSS*ZLSS+tau_D*DCSS*tau*KLSS+tau_D*DCSS*omega_NR*ZLSS+tau_D*DCSS*omega_NR*tau*KLDSS-tau_D*DCSS*omega_NR*GSS*ZLSS-tau_D*DCSS*omega_NR*tau*KLSS);
 CESS = CECSS*CSS;
 KCSS = KLSS*LCSS;
 KDSS = KLDSS*(1-LCSS);
 KSS =KCSS + KDSS;
 ISS = tau*(KLSS*LCSS + KLDSS*(1-LCSS));
 LANDSS = LAND_LDSS*(1-LCSS);
 ZSS = KCSS^alph*LCSS^(1-alph) / phi_y;
 ZDSS = KDSS^alph_D*(1-LCSS)^(1-alph_D-alph_LAN)*LANDSS^alph_LAN/ phi_y_D;
 YSS = CSS + CESS+ ISS + GSS*ZSS;
 DSS = DCSS*CSS;
 DNRSS = DCNRSS*CSS;
 DebtSS = (1-chi_NR)*TDSS*(1-tau_D)*DNRSS/(1+RLSS)*GOMEGHHSS;
 TRSS = CSS + TDSS*(DNRSS - (1-tau_D)*DNRSS) - HOMEGHHSS*(1-chi_NR)*(1-tau_D)*TDSS*DNRSS - DebtSS - WSS;
UCbisESS = (CESS*(1-h_E))^(-sig_c_E);
 UCESS = (1-betta_NR_E*h_E)*UCbisESS;
 DebtESS = GOMEGSS*(1-chi_NR_E)*(1-tau)*(KCSS + KDSS)/(1+RLESS);
 TRESS = CESS + tau*KCSS + tau*KDSS - HOMEGSS*(1-chi_NR_E)*(1-tau)*(KCSS + KDSS) - DebtESS - MCSS*ZSS - MCDSS*ZDSS + WSS ;
 DebtTOTSS = omega_NR*DebtSS + DebtESS;
 DebtTOTWSS = bw*omega_NR*DebtSS + DebtESS;
 BankcapSS = nu_b*DebtTOTWSS; 
 DepoSS = DebtTOTSS - BankcapSS;        
 ProfitBSS = RLSS*omega_NR*DebtSS + RLESS*DebtESS - RDSS*DepoSS;
 tau_B = omega_B*ProfitBSS/BankcapSS;
 XSS = ((1-omega_D)^(1/hetha_D)*(CSS-h*CSS)^((hetha_D-1)/hetha_D)+omega_D^(1/hetha_D)*DSS^((hetha_D-1)/hetha_D))^(hetha_D/(hetha_D-1));
 XNRSS = ((1-omega_D)^(1/hetha_D)*(CSS-h_NR*CSS)^((hetha_D-1)/hetha_D)+omega_D^(1/hetha_D)*DNRSS^((hetha_D-1)/hetha_D))^(hetha_D/(hetha_D-1));
 UCbisSS = XSS^(-sig_c);
 UCbisNRSS = XNRSS^(-sig_c);
 UCSS = (1-betta*h)*UCbisSS*(1-omega_D)^(1/hetha_D)*(CSS/XSS)^(-1/hetha_D)*(1-h)^(-1/hetha_D);
 UC_DSS = (omega_D)^(1/hetha_D)*(DSS/XSS)^(-1/hetha_D)*UCbisSS;                                                                                 
 UCNRSS = (1-betta_NR*h_NR)*(1-omega_D)^(1/hetha_D)*(CSS/XNRSS)^(-1/hetha_D)*(1-h_NR)^(-1/hetha_D)*UCbisNRSS;
 UC_DNRSS = (omega_D)^(1/hetha_D)*(DNRSS/XNRSS)^(-1/hetha_D)*UCbisNRSS;
 ZP1_DSS = UCSS*MCDSS*ZDSS*TDSS/(1-betta*xi_p_D);
 ZP2_DSS = (1-tauSS)*UCSS*ZDSS*TDSS/(1-betta*xi_p_D);
 ZP1SS = UCSS*MCSS*YSS/(1-betta*xi_p);
 ZP2SS = (1-tauSS)*UCSS*YSS/(1-betta*xi_p);
 WTSS = omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR)*WSS;
 NCSS = LCSS/(omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR));
 NDSS = (1-LCSS)/(omega_NR^omega_NR*(1-omega_NR)^(1-omega_NR));
 WTILD_CSS = WTSS; 
 WTILD_DSS = WTSS;
 WTILD_CNRSS = WTSS; 
 WTILD_DNRSS = WTSS;
 LC_BAR = (1-tauwSS)*UCSS*WTILD_CSS/(muw_C*(1-subvw))*(NCSS)^(-sig_l_C);
 LD_BAR = (1-tauwSS)*UCSS*WTILD_DSS/(muw_D*(1-subvw))*(NDSS)^(-sig_l_D);
 LC_NR_BAR = (1-tauwSS)*UCNRSS*WTILD_CNRSS/(muw_C*(1-subvw))*(NCSS)^(-sig_l_C_NR);
 LD_NR_BAR = (1-tauwSS)*UCNRSS*WTILD_DNRSS/(muw_D*(1-subvw))*(NDSS)^(-sig_l_D_NR);
 ZW1CSS = LC_BAR*NCSS^(1+sig_l_C)*WTSS^(muw_C/(muw_C-1))/(1-betta*xi_w_C);
 ZW1DSS = LD_BAR*(NDSS)^(1+sig_l_D)*WTSS^(muw_D/(muw_D-1))/(1-betta*xi_w_D);
 ZW2CSS = (1-tauwSS)*(UCSS)*NCSS*WTSS^(muw_C/(muw_C-1))/(1-betta*xi_w_C);
 ZW2DSS = (1-tauwSS)*(UCSS)*(NDSS)*WTSS^(muw_D/(muw_D-1))/(1-betta*xi_w_D);
 ZWNR1CSS = LC_NR_BAR*NCSS^(1+sig_l_C_NR)*WTSS^(muw_C/(muw_C-1))/(1-betta_NR*xi_w_C_NR);
 ZWNR1DSS = LD_NR_BAR*(NDSS)^(1+sig_l_D_NR)*WTSS^(muw_D/(muw_D-1))/(1-betta_NR*xi_w_D_NR);
 ZWNR2CSS = (1-tauwSS)*(UCNRSS)*NCSS*WTSS^(muw_C/(muw_C-1))/(1-betta_NR*xi_w_C_NR);
 ZWNR2DSS = (1-tauwSS)*(UCNRSS)*(NDSS)*WTSS^(muw_D/(muw_D-1))/(1-betta_NR*xi_w_D_NR);
 WELFARESS = (XSS^(1-sig_c)/(1-sig_c) - LC_BAR*LCSS^(1+sig_l_C)/(1+sig_l_C)- LD_BAR*(1-LCSS)^(1+sig_l_D)/(1+sig_l_D))/(1-betta);
 WELFARENRSS = (XNRSS^(1-sig_c)/(1-sig_c) - LC_NR_BAR*LCSS^(1+sig_l_C_NR)/(1+sig_l_C_NR)- LD_NR_BAR*(1-LCSS)^(1+sig_l_D_NR)/(1+sig_l_D_NR))/(1-betta_NR);

R=RSS; R_K = R_KSS; C = CSS ; K = KSS; I = ISS ; Y = YSS ; Z = ZSS ;  Z_D = ZDSS; MC_D = MCDSS; 
L = LSS ; W = WSS ; MC = MCSS; ATCU1 = R_KSS ; UCbis = UCbisSS ; UC = UCSS;
ZP1 = ZP1SS ; ZP2 = ZP2SS ; 
PI_D = 0; Dp_D = 1; AP_D = 1; ZP1_D = ZP1_DSS; ZP2_D = ZP2_DSS; 
WELFARE = WELFARESS ;

Q_D= 1; TCU_D = 1; ATCU_D= 0; ATCU1_D= R_KSS; SI_D= 0; SI1_D= 0; I_D = tau*KDSS; I_C=tau*KCSS; 
Q_H = 1; SI_H = 0; SI1_H = 0; EE_IH = 0; I_H = tau_D*DSS;  SI_H_NR = 0; SI1_H_NR = 0; I_H_NR = tau_D*DNRSS; Q_H_NR = 1; 
C_E = CESS; UC_E = UCESS; UCbis_E = UCbisESS; PSI_E = PSIESS; EE_LTV_E = 0; Debt_E = DebtESS;

UC_D = UC_DSS; WELFARENR = WELFARENRSS; X = XSS; D = DSS; T_D = TDSS; UCbisNR = UCbisNRSS; 
XNR = XNRSS; DNR = DNRSS; UC_DNR = UC_DNRSS; UCNR = UCNRSS; CNR = CSS; PSI = PSISS; Debt = DebtSS; 
K_C = KCSS; K_D = KDSS; L_C = LCSS; L_D = 1-LCSS; 

Dw_D = 1; Dw_C = 1; W_C = WSS; W_D = WSS; 
ZW1_C = ZW1CSS ;  ZW1_D = ZW1DSS ; ZW2_C = ZW2CSS ;  ZW2_D = ZW2DSS ; 
ZWNR1_C = ZWNR1CSS; ZWNR2_C = ZWNR2CSS; ZWNR1_D = ZWNR1DSS; ZWNR2_D = ZWNR2DSS;
W_C_S = WTSS; N_C_S = NCSS; W_C_NR = WTSS; N_C_NR = NCSS; AW_C_NR = 1; Dw_C_NR = 1; 
W_D_S = WTSS; N_D_S = NDSS; W_D_NR = WTSS; N_D_NR = NDSS; AW_D_NR = 1; Dw_D_NR = 1;


Dp = 1; AW_C = 1; AW_D = 1; AP = 1; 
TCU = 1; Q = 1; 

EE_A_D = 0; EE_P_D = 0; 
EE_A 	=	0	; EE_B 	=	0	; EE_G 	=	0	; EE_L 	=	0	; EE_I 	=	0	; EE_P 	=	0	; EE_Q 	=	0	;
EE_W 	=	0	; EE_LTV = 0; EE_H = 0; PI_BAR 	=	0	; 
Robs 	=	0	; Yobs 	=	0	; Zobs 	=	0	; Cobs 	=	0	; Iobs 	=	0	; Lobs 	=	0	;
CPIobs 	=	0	; Wobs 	=	0	; PIobs 	=	0	; PIgdpobs 	=	0	; Z_Dobs      =   0   ; T_Dobs      =   0   ;
dDebtobs    =   0   ; Debtobs    =   0   ; 
E_F	=	0	; 
SI	=	0	; SI1	=	0	; CPI =	0	; PI =	0	; ATCU = 0; EE_R = 0; 


Z_Dobs = 0; PI_Dobs = 0; T_Dobs = 0; dDebtobs = 0; LAND = LANDSS; P_L = PLSS; 

CRobs = 0; CNRobs = 0; L_Cobs = 0; L_Dobs = 0; W_Cobs = 0; W_Dobs = 0; 
DRobs =0; DNRobs =0; 


Dp_R_D = 1; AR_D = 1; EE_R_D = 0; Depo = DepoSS; 
Z1_R_D = UCSS*DepoSS/mu_R_D/(1-subv_R_D)/(1-betta*xi_R_D); Z2_R_D = UCSS*DepoSS/(1-betta*xi_R_D);
Dp_R_L = 1; AR_L = 1; EE_R_L = 0;   
Z1_R_L = UCSS*DebtSS/mu_R_L/(1-subv_R_L)/(1-betta*xi_R_L); Z2_R_L = UCSS*DebtSS/(1-betta*xi_R_L);
Dp_R_L_E = 1; AR_L_E = 1; EE_R_L_E = 0 ; 
Z1_R_L_E = UCSS*DebtESS/mu_R_L_E/(1-subv_R_L_E)/(1-betta*xi_R_L_E); Z2_R_L_E = UCSS*DebtESS/(1-betta*xi_R_L_E); 
RB_D = RBDSS; RB_L = RBLSS; RB_L_E = RBLESS;

R_D = (RBDSS)*mu_R_D*(1-subv_R_D); 
R_L = (RBLSS)*mu_R_L*(1-subv_R_L);  
R_L_E = (RBLSS)*mu_R_L_E*(1-subv_R_L_E); 


R_LL = (1+RLSS)*OMEGHHSS/GOMEGHHSS -1;
R_LL_E = (1+RLESS)*OMEGSS/GOMEGSS - 1 ;

Bankcap = BankcapSS; Debt_TOT = DebtTOTSS; Debt_TOT_W = DebtTOTWSS; Profit_B = ProfitBSS; 
R_Lobs = 0; R_Dobs = 0; RB_Lobs = 0; RB_L_Eobs = 0; R_L_Eobs = 0; RB_Dobs = 0; Debt_Eobs = 0; Debt_TOTobs = 0; Bankcapobs = 0; 
LEV = DebtTOTSS/BankcapSS;
LEVobs = 0;
EE_Bankcap = 0;
SB_L = RBLSS - RSS;
SB_L_E = RBLESS - RSS;
SB_Lobs = 0; 
Depoobs = 0;

EE_SIG = 0; H_OMEG = HOMEGSS; G_OMEG = GOMEGSS; EFP_OMEG = EFPOMEGSS; OMEG = OMEGSS;
EE_SIG_NEWS1 = 0;
EE_SIG_NEWS2 = 0;
EE_SIG_NEWS3 = 0;
EE_SIG_NEWS4 = 0;
EE_SIG_NEWS5 = 0;
EE_SIG_NEWS6 = 0;
EE_SIG_NEWS7 = 0;
EE_SIG_NEWS8 = 0;

OMEG_HH = OMEGHHSS; EE_SIG_HH = 0; H_OMEG_HH = HOMEGHHSS; G_OMEG_HH = GOMEGHHSS; EFP_OMEG_HH = EFPOMEGHHSS;

EE_SIG_HH = 0; 
EE_SIG_HH_NEWS1 = 0;
EE_SIG_HH_NEWS2 = 0;
EE_SIG_HH_NEWS3 = 0;
EE_SIG_HH_NEWS4 = 0;
EE_SIG_HH_NEWS5 = 0;
EE_SIG_HH_NEWS6 = 0;
EE_SIG_HH_NEWS7 = 0;
EE_SIG_HH_NEWS8 = 0;

R_LLobs = 0;
R_LL_Eobs = 0;
S_LLobs = 0;
S_LL_Eobs = 0;
S_Lobs = 0;
S_L_Eobs = 0;
S_Dobs = 0;
PD_HHobs = 0;
PD_Eobs = 0;


AR_L_E_R = 1;
R_L_E_R = RLESS;
Z1_R_L_E_R = UCSS*DebtESS/mu_R_L_E/(1-subv_R_L_E)/(1-betta*xi_R_L_E); Z2_R_L_E_R = UCSS*DebtESS/(1-betta*xi_R_L_E); 
S_L_E_Robs = 0;

AR_L_E_R_MU = 1;
R_L_E_R_MU = RLESS;
Z1_R_L_E_R_MU = UCSS*DebtESS/mu_R_L_E/(1-subv_R_L_E)/(1-betta*xi_R_L_E); Z2_R_L_E_R_MU = UCSS*DebtESS/(1-betta*xi_R_L_E); 
S_L_E_R_MUobs = 0;


NumberOfEndogenousVariables = M_.endo_nbr;
  ys = zeros(NumberOfEndogenousVariables,1);
  for i = 1:NumberOfEndogenousVariables
    varname = deblank(M_.endo_names(i,:));
    eval(['ys(' int2str(i) ') = ' varname ';']);
  end

  
