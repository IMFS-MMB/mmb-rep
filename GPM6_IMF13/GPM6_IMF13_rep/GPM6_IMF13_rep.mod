// Model: GPM6_IMF13
// GPM6 - The Global Projection Model with 6 Regions
// Further references:
// Ioan Carabenciov et. al (2013), IMF Working Paper (WP/13/87)
// The original mod file is provided by the authors of Ioan Carabenciov et. al (2013)
// and modified by Jinhyuk Yoo in order that the mod file can be run under the latest Dynare version.
// This mod file is working under Dynare 4.3 and above.
// Last edited: 15/08/2014 by J. Yoo

// 6 Regions: EA6(Emerging Asia Countries), EU(Euro Area), JA(Japan),   
// LA6(Latin America), RC6(Remaining Countries), US(United States)


var 
BLT_BAR_US BLT_US BLT_BAR_EU BLT_EU BLT_BAR_JA BLT_JA  
DOT_LZ_BAR_EA6 DOT_LZ_BAR_LA6 DOT_LZ_BAR_RC6 
DOT_REER_M_BAR_EA6 DOT_REER_M_BAR_EU DOT_REER_M_BAR_JA DOT_REER_M_BAR_LA6 DOT_REER_M_BAR_RC6 DOT_REER_M_BAR_US 
DRS_EA6 DRS_EU DRS_JA DRS_LA6 DRS_RC6 DRS_US  
E2_EU E_EU E2_JA E_JA E2_US E_US  
FACT_EA6 FACT_EU FACT_JA FACT_LA6 FACT_RC6 FACT_US  
GROWTH4_BAR_EA6 GROWTH4_BAR_EU GROWTH4_BAR_JA GROWTH4_BAR_LA6 GROWTH4_BAR_RC6 GROWTH4_BAR_US 
GROWTH4_EA6 GROWTH4_EU GROWTH4_JA GROWTH4_LA6 GROWTH4_RC6 GROWTH4_US  
GROWTH_BAR_EA6 GROWTH_BAR_EU GROWTH_BAR_JA GROWTH_BAR_LA6 GROWTH_BAR_RC6 GROWTH_BAR_US 
GROWTH_EA6 GROWTH_EU GROWTH_JA GROWTH_LA6 GROWTH_RC6 GROWTH_US  
G_EA6 G_EU G_JA G_LA6 G_RC6 G_US  
LCPI_EA6 LCPI_EU LCPI_JA LCPI_LA6 LCPI_RC6 LCPI_US  
LGDP_BAR_EA6 LGDP_BAR_EU LGDP_BAR_JA LGDP_BAR_LA6 LGDP_BAR_RC6 LGDP_BAR_US  
LGDP_EA6 LGDP_EU LGDP_JA LGDP_LA6 LGDP_RC6 LGDP_US  
LS_EA6 LS_EU LS_JA LS_LA6 LS_RC6 LZ_BAR_EA6 LZ_BAR_EU LZ_BAR_JA LZ_BAR_LA6 LZ_BAR_RC6 
LZ_EA6 LZ_EU LZ_JA LZ_LA6 LZ_RC6 LZ_E_EA6 LZ_E_EU LZ_E_JA LZ_E_LA6 LZ_E_RC6 
LZ_GAP_EA6 LZ_GAP_EU LZ_GAP_JA LZ_GAP_LA6 LZ_GAP_RC6  
PIE4_EA6 PIE4_EU PIE4_JA PIE4_LA6 PIE4_RC6 PIE4_US  
PIETAR_EA6 PIETAR_EU PIETAR_JA PIETAR_LA6 PIETAR_RC6 PIETAR_US 
PIE_EA6 PIE_EU PIE_JA PIE_LA6 PIE_RC6 PIE_US  
REER_M_BAR_EA6 REER_M_BAR_EU REER_M_BAR_JA REER_M_BAR_LA6 REER_M_BAR_RC6 REER_M_BAR_US  
REER_M_EA6 REER_M_EU REER_M_JA REER_M_LA6 REER_M_RC6 REER_M_US  
REER_T_BAR_EA6 REER_T_BAR_EU REER_T_BAR_JA REER_T_BAR_LA6 REER_T_BAR_RC6 REER_T_BAR_US 
REER_T_EA6 REER_T_EU REER_T_JA REER_T_LA6 REER_T_RC6 REER_T_US  
RESN_RS_EA6 RESN_RS_LA6 RESN_RS_RC6 
RR_BAR_EA6 RR_BAR_EU RR_BAR_JA RR_BAR_LA6 RR_BAR_RC6 RR_BAR_US  
RR_EA6 RR_EU RR_JA RR_LA6 RR_RC6 RR_US RS_EA6 RS_EU RS_JA RS_LA6 RS_RC6 RS_US  
UNR_BAR_EU UNR_BAR_JA UNR_BAR_US UNR_EU UNR_GAP_EU UNR_GAP_JA UNR_GAP_US  
UNR_G_EU UNR_G_JA UNR_G_US UNR_JA UNR_US  
Y_EA6 Y_EU Y_JA Y_LA6 Y_RC6 Y_US 
FACT_RES_US FACT_RES_EU FACT_RES_JA FACT_RES_EA6 FACT_RES_LA6 FACT_RES_RC6
RESN_YY_US RESN_YY_EU RESN_YY_JA RESN_YY_EA6 RESN_YY_LA6 RESN_YY_RC6
RESN_Y_US RESN_Y_EU RESN_Y_JA RESN_Y_EA6 RESN_Y_LA6 RESN_Y_RC6
E2_EA6 E2_LA6 E2_RC6
RESN_RR_DIFF_EA6 RESN_RR_DIFF_EU RESN_RR_DIFF_JA RESN_RR_DIFF_LA6 RESN_RR_DIFF_RC6
E1_PIE_EA6 E1_PIE_EU E1_PIE_JA E1_PIE_LA6 E1_PIE_RC6 E1_PIE_US
E1_Y_EA6 E1_Y_EU E1_Y_JA E1_Y_LA6 E1_Y_RC6 E1_Y_US
E4_Y_EA6 E4_Y_EU E4_Y_JA E4_Y_LA6 E4_Y_RC6 E4_Y_US
E8_Y_EA6 E8_Y_EU E8_Y_JA E8_Y_LA6 E8_Y_RC6 E8_Y_US 
E4_PIE4_EA6 E4_PIE4_EU E4_PIE4_JA E4_PIE4_LA6 E4_PIE4_RC6 E4_PIE4_US 
E3_PIE4_EA6 E3_PIE4_EU E3_PIE4_JA E3_PIE4_LA6 E3_PIE4_RC6 E3_PIE4_US
REER_T_GAP_EA6 REER_T_GAP_EU REER_T_GAP_JA REER_T_GAP_LA6 REER_T_GAP_RC6 REER_T_GAP_US
DOT_REER_M_EA6 DOT_REER_M_EU DOT_REER_M_JA DOT_REER_M_LA6 DOT_REER_M_RC6 DOT_REER_M_US
RR4_US RR4_BAR_US RR4_EU RR4_BAR_EU RR4_JA RR4_BAR_JA
RR4_EA6 RR4_BAR_EA6 RR4_LA6 RR4_BAR_LA6 RR4_RC6 RR4_BAR_RC6 
LRR_US LRR_BAR_US LRR_EU LRR_BAR_EU LRR_JA LRR_BAR_JA
LRR_EA6 LRR_BAR_EA6 LRR_LA6 LRR_BAR_LA6 LRR_RC6 LRR_BAR_RC6
LRR_GAP_US LRR_GAP_EU LRR_GAP_JA LRR_GAP_EA6 LRR_GAP_LA6 LRR_GAP_RC6 
;

varexo 
RES_DOT_LZ_BAR_EA6 RES_PIETAR_EA6 RES_G_EA6 RES_LGDP_BAR_EA6 RES_LZ_BAR_EA6 RES_PIE_EA6 
RES_RR_BAR_EA6 RES_RR_DIFF_EA6 RES_RS_EA6 RES_Y_EA6 RES_YY_EA6
RES_BLT_BAR_EU RES_G_EU RES_BLT_EU RES_LGDP_BAR_EU RES_LZ_BAR_EU RES_PIE_EU RES_RR_BAR_EU  
RES_RR_DIFF_EU RES_RS_EU RES_UNR_BAR_EU RES_UNR_G_EU RES_UNR_GAP_EU RES_Y_EU RES_YY_EU
RES_BLT_BAR_JA RES_G_JA RES_BLT_JA RES_LGDP_BAR_JA RES_LZ_BAR_JA RES_PIE_JA RES_RR_BAR_JA  
RES_RR_DIFF_JA RES_RS_JA RES_UNR_BAR_JA RES_UNR_G_JA RES_UNR_GAP_JA RES_Y_JA RES_YY_JA 
RES_DOT_LZ_BAR_LA6 RES_PIETAR_LA6 RES_G_LA6 RES_LGDP_BAR_LA6 RES_LZ_BAR_LA6 RES_PIE_LA6 
RES_RR_BAR_LA6 RES_RR_DIFF_LA6 RES_RS_LA6 RES_Y_LA6 RES_YY_LA6
RES_DOT_LZ_BAR_RC6 RES_PIETAR_RC6 RES_G_RC6 RES_LGDP_BAR_RC6 RES_LZ_BAR_RC6 RES_PIE_RC6 
RES_RR_BAR_RC6 RES_RR_DIFF_RC6 RES_RS_RC6 RES_Y_RC6 RES_YY_RC6
RES_BLT_BAR_US RES_G_US RES_BLT_US RES_LGDP_BAR_US RES_PIE_US RES_RR_BAR_US 
RES_RS_US RES_UNR_BAR_US RES_UNR_G_US RES_UNR_GAP_US RES_Y_US RES_YY_US  
;

parameters 
beta_reergap_EA6 beta_reergap_EU beta_reergap_JA beta_reergap_LA6 beta_reergap_RC6 beta_reergap_US 
alpha1_EU alpha1_JA alpha1_US alpha2_EU alpha2_JA alpha2_US alpha3_EU alpha3_JA alpha3_US  
beta1_EA6 beta1_EU beta1_JA beta1_LA6 beta1_RC6 beta1_US 
beta2_EA6 beta2_EU beta2_JA beta2_LA6 beta2_RC6 beta2_US 
beta3_EA6 beta3_EU beta3_JA beta3_LA6 beta3_RC6 beta3_US
beta4_EA6 beta4_EU beta4_JA beta4_LA6 beta4_RC6 beta4_US 
chi_EA6 chi_LA6 chi_RC6 dot_lz_bar_EA6_ss dot_lz_bar_LA6_ss dot_lz_bar_RC6_ss 
gamma1_EA6 gamma1_EU gamma1_JA gamma1_LA6 gamma1_RC6 gamma1_US  
gamma2_EA6 gamma2_EU gamma2_JA gamma2_LA6 gamma2_RC6 gamma2_US 
gamma4_EA6 gamma4_EU gamma4_JA gamma4_LA6 gamma4_RC6 gamma4_US 
growth_EA6_ss growth_EU_ss growth_JA_ss growth_LA6_ss growth_RC6_ss growth_US_ss 
kappa_EU kappa_JA kappa_US 
lambda1_EA6 lambda1_EU lambda1_JA lambda1_LA6 lambda1_RC6 lambda1_US  
lambda1_RS_EA6 lambda1_RS_LA6 lambda1_RS_RC6  
lambda2_EA6 lambda2_EU lambda2_JA lambda2_LA6 lambda2_RC6 lambda2_US  
lambda3_EA6 lambda3_EU lambda3_JA lambda3_LA6 lambda3_RC6 lambda3_US  
phi_EA6 phi_EU phi_JA phi_LA6 phi_RC6 
pietar_EU_ss pietar_JA_ss pietar_US_ss pietar_LA6_ss pietar_EA6_ss pietar_RC6_ss 
rho_EA6 rho_EU rho_JA rho_LA6 rho_RC6 rho_US 
rr_bar_EA6_ss rr_bar_EU_ss rr_bar_JA_ss rr_bar_LA6_ss rr_bar_RC6_ss rr_bar_US_ss 
tau_EA6 tau_EU tau_JA tau_LA6 tau_RC6 tau_US 
theta_EU theta_JA theta_US
dY_dVA_US  dY_dVA_EU  dY_dVA_JA  dY_dVA_EA6 dY_dVA_LA6 dY_dVA_RC6
dVA_dX_US  dVA_dX_EU  dVA_dX_JA  dVA_dX_EA6 dVA_dX_LA6 dVA_dX_RC6
exp_US_EU   exp_US_JA   exp_US_EA6  exp_US_LA6  exp_US_RC6 
exp_EU_US   exp_EU_JA   exp_EU_EA6  exp_EU_LA6  exp_EU_RC6 
exp_JA_US   exp_JA_EU   exp_JA_EA6  exp_JA_LA6  exp_JA_RC6 
exp_EA6_US  exp_EA6_EU  exp_EA6_JA  exp_EA6_LA6 exp_EA6_RC6 
exp_LA6_US  exp_LA6_EU  exp_LA6_JA  exp_LA6_EA6 exp_LA6_RC6 
exp_RC6_US  exp_RC6_EU  exp_RC6_JA  exp_RC6_EA6 exp_RC6_LA6 
imp_US_EU   imp_US_JA   imp_US_EA6  imp_US_LA6  imp_US_RC6 
imp_EU_US   imp_EU_JA   imp_EU_EA6  imp_EU_LA6  imp_EU_RC6 
imp_JA_US   imp_JA_EU   imp_JA_EA6  imp_JA_LA6  imp_JA_RC6
imp_EA6_US  imp_EA6_EU  imp_EA6_JA  imp_EA6_LA6 imp_EA6_RC6 
imp_LA6_US  imp_LA6_EU  imp_LA6_JA  imp_LA6_EA6 imp_LA6_RC6 
imp_RC6_US  imp_RC6_EU  imp_RC6_JA  imp_RC6_EA6 imp_RC6_LA6 
trade_US_EU   trade_US_JA  trade_US_EA6  trade_US_LA6  trade_US_RC6 
trade_EU_US   trade_EU_JA  trade_EU_EA6  trade_EU_LA6  trade_EU_RC6 
trade_JA_US   trade_JA_EU  trade_JA_EA6  trade_JA_LA6  trade_JA_RC6 
trade_EA6_US  trade_EA6_EU trade_EA6_JA  trade_EA6_LA6 trade_EA6_RC6 
trade_LA6_US  trade_LA6_EU trade_LA6_JA  trade_LA6_EA6 trade_LA6_RC6 
trade_RC6_US  trade_RC6_EU trade_RC6_JA  trade_RC6_EA6 trade_RC6_LA6 
xrat_US xrat_EU xrat_JA xrat_EA6 xrat_LA6 xrat_RC6
mrat_US mrat_EU mrat_JA mrat_EA6 mrat_LA6 mrat_RC6
rsize_US_EU   rsize_US_JA   rsize_US_EA6  rsize_US_LA6  rsize_US_RC6 
rsize_EU_US   rsize_EU_JA   rsize_EU_EA6  rsize_EU_LA6  rsize_EU_RC6 
rsize_JA_US   rsize_JA_EU   rsize_JA_EA6  rsize_JA_LA6  rsize_JA_RC6 
rsize_EA6_US  rsize_EA6_EU  rsize_EA6_JA  rsize_EA6_LA6 rsize_EA6_RC6 
rsize_LA6_US  rsize_LA6_EU  rsize_LA6_JA  rsize_LA6_EA6 rsize_LA6_RC6 
rsize_RC6_US  rsize_RC6_EU  rsize_RC6_JA  rsize_RC6_EA6 rsize_RC6_LA6
spill_US_US   spill_US_EU   spill_US_JA   spill_US_EA6  spill_US_LA6  spill_US_RC6 
spill_EU_US   spill_EU_EU   spill_EU_JA   spill_EU_EA6  spill_EU_LA6  spill_EU_RC6 
spill_JA_US   spill_JA_EU   spill_JA_JA   spill_JA_EA6  spill_JA_LA6  spill_JA_RC6 
spill_EA6_US  spill_EA6_EU  spill_EA6_JA  spill_EA6_EA6 spill_EA6_LA6 spill_EA6_RC6
spill_LA6_US  spill_LA6_EU  spill_LA6_JA  spill_LA6_EA6 spill_LA6_LA6 spill_LA6_RC6 
spill_RC6_US  spill_RC6_EU  spill_RC6_JA  spill_RC6_EA6 spill_RC6_LA6 spill_RC6_RC6 
theta_EA6 theta_LA6 theta_RC6 beta_fact beta_fact_res
lrrw01_US  lrrw04_US  lrrw12_US  lrrw20_US
lrrw01_EU  lrrw04_EU  lrrw12_EU  lrrw20_EU
lrrw01_JA  lrrw04_JA  lrrw12_JA  lrrw20_JA
lrrw01_EA6 lrrw04_EA6 lrrw12_EA6 lrrw20_EA6
lrrw01_LA6 lrrw04_LA6 lrrw12_LA6 lrrw20_LA6
lrrw01_RC6 lrrw04_RC6 lrrw12_RC6 lrrw20_RC6
beta3m_US beta3m_EU beta3m_JA beta3m_EA6 beta3m_LA6 beta3m_RC6
;

//  Xij (export destination) Data not usedAvg. 1998-07 						
//		 US 	 		Eu 	 		JA 	 		EA 	 		LA 	 		RC 
// US 	 0.9992 	 0.1682 	 0.0770 	 0.1902 	 0.1776 	 0.3862 
// Eu 	 0.2021 	 1.0001 	 0.0381 	 0.1330 	 0.0385 	 0.5884 
// JA 	 0.2844 	 0.1312 	 1.0000 	 0.4570 	 0.0210 	 0.1064 
// EA 	 0.3663 	 0.2275 	 0.1963 	 1.0000 	 0.0309 	 0.1790 
// LA 	 0.6868 	 0.1109 	 0.0287 	 0.0619 	 1.0000 	 0.1117 
// RC 	 0.3687 	 0.4524 	 0.0439 	 0.1080 	 0.0270 	 1.0000 

// exp_ii_jj is a trade from ii to jj as a share of total ii exports
exp_US_EU  = 0.16820;
exp_US_JA  = 0.0770;
exp_US_EA6 = 0.1902;
exp_US_LA6 = 0.1776;
exp_US_RC6 = 0.3862;
exp_EU_US  = 0.2021;
exp_EU_JA  = 0.0381;
exp_EU_EA6 = 0.1330;
exp_EU_LA6 = 0.0385;
exp_EU_RC6 = 0.5884;
exp_JA_US  = 0.2844;
exp_JA_EU  = 0.1312;
exp_JA_EA6 = 0.4570;
exp_JA_LA6 = 0.0210;
exp_JA_RC6 = 0.1064;
exp_EA6_US  = 0.3663;
exp_EA6_EU  = 0.2275;
exp_EA6_JA  = 0.1963;
exp_EA6_LA6 = 0.0309;
exp_EA6_RC6 = 0.1790;
exp_LA6_US  = 0.6868;
exp_LA6_EU  = 0.1109;
exp_LA6_JA  = 0.0287;
exp_LA6_EA6 = 0.0619;
exp_LA6_RC6 = 0.1117;
exp_RC6_US  = 0.3687;
exp_RC6_EU  = 0.4524;
exp_RC6_JA  = 0.0439;
exp_RC6_EA6 = 0.1080;
exp_RC6_LA6 = 0.0270;

//	  Mij (Import origin) 2007 Data 						
//	 		US 	 		Eu 	 		JA 	 		EA 	 		LA 	 		RC 
// US 	 1.0000 	 0.1542 	 0.0835 	 0.3147 	 0.1484 	 0.2992 
// Eu 	 0.1132 	 1.0000 	 0.0508 	 0.2589 	 0.0479 	 0.5292 
// JA 	 0.1489 	 0.1059 	 1.0001 	 0.5320 	 0.0406 	 0.1727 
// EA 	 0.2055 	 0.2122 	 0.3074 	 1.0006 	 0.0534 	 0.2221 
// LA 	 0.4221 	 0.1451 	 0.0576 	 0.2432 	 0.9997 	 0.1317 
// RC 	 0.2075 	 0.4890 	 0.0486 	 0.2080 	 0.0469 	 1.0000 

// imp_ii_jj is a trade from jj to ii as a share of total ii imports
imp_US_EU  = 0.154200;
imp_US_JA  = 0.083500;
imp_US_EA6 = 0.314700;
imp_US_LA6 = 0.148400;
imp_US_RC6 = 0.299200;
imp_EU_US  = 0.113200;
imp_EU_JA  = 0.050800;
imp_EU_EA6 = 0.258900;
imp_EU_LA6 = 0.047900;
imp_EU_RC6 = 0.529200;
imp_JA_US  = 0.148900;
imp_JA_EU  = 0.105900;
imp_JA_EA6 = 0.532000;
imp_JA_LA6 = 0.040600;
imp_JA_RC6 = 0.172700;
imp_EA6_US  = 0.205500;
imp_EA6_EU  = 0.212200;
imp_EA6_JA  = 0.307400;
imp_EA6_LA6 = 0.053400;
imp_EA6_RC6 = 0.222100;
imp_LA6_US  = 0.422100;
imp_LA6_EU  = 0.145100;
imp_LA6_JA  = 0.057600;
imp_LA6_EA6 = 0.243200;
imp_LA6_RC6 = 0.131700;
imp_RC6_US  = 0.207500;
imp_RC6_EU  = 0.489000;
imp_RC6_JA  = 0.048600;
imp_RC6_EA6 = 0.208000;
imp_RC6_LA6 = 0.046900;

// trade_ii_jj is defined as (exp_ii_jj+imp_ii_jj)/2
trade_US_EU  = (exp_US_EU+imp_US_EU)/2;
trade_US_JA  = (exp_US_JA+imp_US_JA)/2;
trade_US_EA6 = (exp_US_EA6+imp_US_EA6)/2;
trade_US_LA6 = (exp_US_LA6+imp_US_LA6)/2;
trade_US_RC6 = (exp_US_RC6+imp_US_RC6)/2;
trade_EU_US  = (exp_EU_US+imp_EU_US)/2;
trade_EU_JA  = (exp_EU_JA+imp_EU_JA)/2;
trade_EU_EA6 = (exp_EU_EA6+imp_EU_EA6)/2;
trade_EU_LA6 = (exp_EU_LA6+imp_EU_LA6)/2;
trade_EU_RC6 = (exp_EU_RC6+imp_EU_RC6)/2;
trade_JA_US  = (exp_JA_US+imp_JA_US)/2;
trade_JA_EU  = (exp_JA_EU+imp_JA_EU)/2;
trade_JA_EA6 = (exp_JA_EA6+imp_JA_EA6)/2;
trade_JA_LA6 = (exp_JA_LA6+imp_JA_LA6)/2;
trade_JA_RC6 = (exp_JA_RC6+imp_JA_RC6)/2;
trade_EA6_US  = (exp_EA6_US+imp_EA6_US)/2;
trade_EA6_EU  = (exp_EA6_EU+imp_EA6_EU)/2;
trade_EA6_JA  = (exp_EA6_JA+imp_EA6_JA)/2;
trade_EA6_LA6 = (exp_EA6_LA6+imp_EA6_LA6)/2;
trade_EA6_RC6 = (exp_EA6_RC6+imp_EA6_RC6)/2;
trade_LA6_US  = (exp_LA6_US+imp_LA6_US)/2;
trade_LA6_EU  = (exp_LA6_EU+imp_LA6_EU)/2;
trade_LA6_JA  = (exp_LA6_JA+imp_LA6_JA)/2;
trade_LA6_EA6 = (exp_LA6_EA6+imp_LA6_EA6)/2;
trade_LA6_RC6 = (exp_LA6_RC6+imp_LA6_RC6)/2;
trade_RC6_US  = (exp_RC6_US+imp_RC6_US)/2;
trade_RC6_EU  = (exp_RC6_EU+imp_RC6_EU)/2;
trade_RC6_JA  = (exp_RC6_JA+imp_RC6_JA)/2;
trade_RC6_EA6 = (exp_RC6_EA6+imp_RC6_EA6)/2;
trade_RC6_LA6 = (exp_RC6_LA6+imp_RC6_LA6)/2;

// Export and Import Ratio, 2007 						
//	 US 	 		Eu 	 		JA 	 		EA 	 		LA 	 		RC 
//M	 0.1271 	 0.1291 	 0.1108 	 0.1608 	 0.1608 	 0.1822 
//X	 0.0744 	 0.1244 	 0.1491 	 0.2014 	 0.1648 	 0.1709 

// export to GDP ratio
xrat_US  = 0.01*7.440000;
xrat_EU  = 0.01*12.440000;
xrat_JA  = 0.01*14.910000;
xrat_EA6 = 0.01*20.140000;
xrat_LA6 = 0.01*16.480000;
xrat_RC6 = 0.01*17.090000;

// import to GDP ratio
mrat_US  = 0.01*12.710000;
mrat_EU  = 0.01*12.910000;
mrat_JA  = 0.01*11.080000;
mrat_EA6 = 0.01*16.080000;
mrat_LA6 = 0.01*16.080000;
mrat_RC6 = 0.01*18.220000;

// Relative Country Size (Yj/Yi) (i=row, j=column) Average (2003-07) 						
//		 US 	 Eu 	 JA 	 EA 	 LA 	 RC 
// US 	 1.00 	 1.23 	 2.83 	 2.35 	 6.05 	 1.64 
// Eu 	 0.81 	 1.00 	 2.31 	 1.91 	 4.92 	 1.33 
// JA 	 0.35 	 0.43 	 1.00 	 0.83 	 2.13 	 0.58 
// EA 	 0.43 	 0.52 	 1.21 	 1.00 	 2.57 	 0.70 
// LA 	 0.17 	 0.20 	 0.47 	 0.39 	 1.00 	 0.27 
// RC 	 0.61 	 0.75 	 1.73 	 1.44 	 3.70 	 1.00 

// rsize_ii_jj: relative size of country ii to country jj
rsize_US_EU  = 1.230000;
rsize_US_JA  = 2.830000;
rsize_US_EA6 = 2.350000;
rsize_US_LA6 = 6.050000;
rsize_US_RC6 = 1.640000;
rsize_EU_US  = 0.810000;
rsize_EU_JA  = 2.310000;
rsize_EU_EA6 = 1.910000;
rsize_EU_LA6 = 4.920000;
rsize_EU_RC6 = 1.330000;
rsize_JA_US  = 0.350000;
rsize_JA_EU  = 0.430000;
rsize_JA_EA6 = 0.830000;
rsize_JA_LA6 = 2.130000;
rsize_JA_RC6 = 0.580000;
rsize_EA6_US  = 0.430000;
rsize_EA6_EU  = 0.520000;
rsize_EA6_JA  = 1.210000;
rsize_EA6_LA6 = 2.570000;
rsize_EA6_RC6 = 0.700000;
rsize_LA6_US  = 0.170000;
rsize_LA6_EU  = 0.200000;
rsize_LA6_JA  = 0.470000;
rsize_LA6_EA6 = 0.390000;
rsize_LA6_RC6 = 0.270000;
rsize_RC6_US  = 0.610000;
rsize_RC6_EU  = 0.750000;
rsize_RC6_JA  = 1.730000;
rsize_RC6_EA6 = 1.440000;
rsize_RC6_LA6 = 3.700000;

// dYi/dVAi change in Y relative to Value Added						
//		 US 	 Eu 	 JA 	 EA 	 LA 	 RC 
// US 	 1.50 	 1.50 	 1.50 	 1.50 	 1.50 	 1.50 
// Eu 	 1.40 	 1.40 	 1.40 	 1.40 	 1.40 	 1.40 
// JA 	 1.40 	 1.40 	 1.40 	 1.40 	 1.40 	 1.40 
// EA 	 1.30 	 1.30 	 1.30 	 1.30 	 1.30 	 1.30 
// LA 	 1.20 	 1.20 	 1.20 	 1.20 	 1.20 	 1.20 
// RC 	 1.30 	 1.30 	 1.30 	 1.30 	 1.30 	 1.30 
dY_dVA_US = 1.5;
dY_dVA_EU = 1.4;
dY_dVA_JA = 1.4;
dY_dVA_EA6 = 1.3;
dY_dVA_LA6 = 1.2;
dY_dVA_RC6 = 1.3;

// dVAi/dVXij (1-import content of exports) 						
//		 US 	 Eu 	 JA 	 EA 	 LA 	 RC 
// US 	 0.88 	 0.88 	 0.88 	 0.88 	 0.88 	 0.88 
// Eu 	 0.89 	 0.89 	 0.89 	 0.89 	 0.89 	 0.89 
// JA 	 0.89 	 0.89 	 0.89 	 0.89 	 0.89 	 0.89 
// EA 	 0.79 	 0.79 	 0.79 	 0.79 	 0.79 	 0.79 
// LA 	 0.69 	 0.69 	 0.69 	 0.69 	 0.69 	 0.69 
// RC 	 0.80 	 0.80 	 0.80 	 0.80 	 0.80 	 0.80 
dVA_dX_US = 0.88;
dVA_dX_EU = 0.89;
dVA_dX_JA = 0.89;
dVA_dX_EA6 = 0.79;
dVA_dX_LA6 = 0.69;
dVA_dX_RC6 = 0.80;

// definitions of spillover effects: spill_ii_jj is an impact of shock in ii to country jj
// model 1
spill_US_US  = 1;
spill_US_EU  = dY_dVA_EU*dVA_dX_EU*imp_US_EU*mrat_US*rsize_US_EU ;
spill_US_JA  = dY_dVA_JA*dVA_dX_JA*imp_US_JA*mrat_US*rsize_US_JA ;
spill_US_EA6 = dY_dVA_EA6*dVA_dX_EA6*imp_US_EA6*mrat_US*rsize_US_EA6;
spill_US_LA6 = dY_dVA_LA6*dVA_dX_LA6*imp_US_LA6*mrat_US*rsize_US_LA6;
spill_US_RC6 = dY_dVA_RC6*dVA_dX_RC6*imp_US_RC6*mrat_US*rsize_US_RC6;
spill_EU_US  = dY_dVA_US*dVA_dX_US*imp_EU_US*mrat_EU*rsize_EU_US ;
spill_EU_EU  = 1;
spill_EU_JA  = dY_dVA_JA*dVA_dX_JA*imp_EU_JA *mrat_EU*rsize_EU_JA ;
spill_EU_EA6 = dY_dVA_EA6*dVA_dX_EA6*imp_EU_EA6*mrat_EU*rsize_EU_EA6;
spill_EU_LA6 = dY_dVA_LA6*dVA_dX_LA6*imp_EU_LA6*mrat_EU*rsize_EU_LA6;
spill_EU_RC6 = dY_dVA_RC6*dVA_dX_RC6*imp_EU_RC6*mrat_EU*rsize_EU_RC6;
spill_JA_US  = dY_dVA_US*dVA_dX_US*imp_JA_US *mrat_JA *rsize_JA_US ;
spill_JA_EU  = dY_dVA_EU*dVA_dX_EU*imp_JA_EU *mrat_JA *rsize_JA_EU ;
spill_JA_JA  = 1;
spill_JA_EA6 = dY_dVA_EA6*dVA_dX_EA6*imp_JA_EA6*mrat_JA*rsize_JA_EA6;
spill_JA_LA6 = dY_dVA_LA6*dVA_dX_LA6*imp_JA_LA6*mrat_JA*rsize_JA_LA6;
spill_JA_RC6 = dY_dVA_RC6*dVA_dX_RC6*imp_JA_RC6*mrat_JA*rsize_JA_RC6;
spill_EA6_US  = dY_dVA_US*dVA_dX_US*imp_EA6_US *mrat_EA6*rsize_EA6_US ;
spill_EA6_EU  = dY_dVA_EU*dVA_dX_EU*imp_EA6_EU *mrat_EA6*rsize_EA6_EU ;
spill_EA6_JA  = dY_dVA_JA*dVA_dX_JA*imp_EA6_JA *mrat_EA6*rsize_EA6_JA ;
spill_EA6_EA6 = 1;
spill_EA6_LA6 = dY_dVA_LA6*dVA_dX_LA6*imp_EA6_LA6*mrat_EA6*rsize_EA6_LA6;
spill_EA6_RC6 = dY_dVA_RC6*dVA_dX_RC6*imp_EA6_RC6*mrat_EA6*rsize_EA6_RC6;
spill_LA6_US  = dY_dVA_US*dVA_dX_US*imp_LA6_US *mrat_LA6*rsize_LA6_US ;
spill_LA6_EU  = dY_dVA_EU*dVA_dX_EU*imp_LA6_EU *mrat_LA6*rsize_LA6_EU ;
spill_LA6_JA  = dY_dVA_JA*dVA_dX_JA*imp_LA6_JA *mrat_LA6*rsize_LA6_JA ;
spill_LA6_EA6 = dY_dVA_EA6*dVA_dX_EA6*imp_LA6_EA6*mrat_LA6*rsize_LA6_EA6;
spill_LA6_LA6 = 1;
spill_LA6_RC6 = dY_dVA_RC6*dVA_dX_RC6*imp_LA6_RC6*mrat_LA6*rsize_LA6_RC6;
spill_RC6_US  = dY_dVA_US*dVA_dX_US*imp_RC6_US *mrat_RC6*rsize_RC6_US ;
spill_RC6_EU  = dY_dVA_EU*dVA_dX_EU*imp_RC6_EU *mrat_RC6*rsize_RC6_EU ;
spill_RC6_JA  = dY_dVA_JA*dVA_dX_JA*imp_RC6_JA *mrat_RC6*rsize_RC6_JA ;
spill_RC6_EA6 = dY_dVA_EA6*dVA_dX_EA6*imp_RC6_EA6*mrat_RC6*rsize_RC6_EA6;
spill_RC6_LA6 = dY_dVA_LA6*dVA_dX_LA6*imp_RC6_LA6*mrat_RC6*rsize_RC6_LA6;
spill_RC6_RC6 = 1;

//beta_reergap_XX is to be interpreted as long-run elasticity
beta_reergap_EA6=0.324;
beta_reergap_EU =0.273;
beta_reergap_JA =0.16425;
beta_reergap_LA6=0.324;
beta_reergap_RC6=0.12465;
beta_reergap_US =0.1179;

// The init values below are from the estimation Nov 18, 2010
beta_fact=  0.89111689;
beta_fact_res=       1;
alpha1_EU=       0.717;
alpha1_JA=      0.7589;
alpha1_US=      0.8235;
alpha2_EU=      0.1401;
alpha2_JA=      0.0599;
alpha2_US=      0.1823;
alpha3_EU=       0.101;
alpha3_JA=      0.2214;
alpha3_US=      0.3649;
beta1_EA6=      0.4707;
beta1_EU=    0.7563491;
beta1_JA=   0.77917613;
beta1_LA6=       0.544;
beta1_RC6=       0.441;
beta1_US=   0.56878783;
beta2_EA6=      0.2146;
beta2_EU=  0.043650904;
beta2_JA=  0.020823872;
beta2_LA6=      0.1782;
beta2_RC6=      0.4085;
beta2_US=   0.23121217;
beta4_EA6=   0.1714932; // (1-beta1_EA6)*beta_reergap_EA6; // The way how it is computed.
beta4_EU=  0.066516696; // (1-beta1_EU) *beta_reergap_EU; 
beta4_JA=  0.036270321; // (1-beta1_JA) *beta_reergap_JA;
beta4_LA6=    0.147744; // (1-beta1_LA6)*beta_reergap_LA6;
beta4_RC6=  0.06967935; // (1-beta1_RC6)*beta_reergap_RC6;
beta4_US=  0.050839915; // (1-beta1_US) *beta_reergap_US;
beta3_EA6=         0.2;
beta3_EU=       0.2009;
beta3_JA=       0.1478;
beta3_LA6=         0.2;
beta3_RC6=         0.2;
beta3_US=       0.1866;
chi_EA6=          0.05;
chi_LA6=          0.05;
chi_RC6=          0.05;
dot_lz_bar_EA6_ss=   0;
dot_lz_bar_LA6_ss=   0;
dot_lz_bar_RC6_ss=   0;
gamma1_EA6=     0.6666;
gamma1_EU=      0.6859;
gamma1_JA=      0.7497;
gamma1_LA6=     0.6448;
gamma1_RC6=      0.725;
gamma1_US=      0.7107;
gamma2_EA6=      1.114;
gamma2_EU=      1.3061;
gamma2_JA=      1.0579;
gamma2_LA6=      0.911;
gamma2_RC6=     0.8983;
gamma2_US=      0.9104;
gamma4_EA6=     0.1691;
gamma4_EU=      0.2012;
gamma4_JA=      0.1693;
gamma4_LA6=     0.2023;
gamma4_RC6=     0.1621;
gamma4_US=      0.2052;
growth_EA6_ss=       6;
growth_EU_ss=   2.2614;
growth_JA_ss=   1.4444;
growth_LA6_ss=       6;
growth_RC6_ss=       6;
growth_US_ss=   2.2729;
kappa_EU=      20.0773;
kappa_JA=      20.0773;
kappa_US=      20.0773;
lambda1_EA6=    0.7199;
lambda1_EU=        0.7;
lambda1_JA=       0.75;
lambda1_LA6=    0.5935;
lambda1_RC6=    0.5452;
lambda1_RS_EA6=      0;
lambda1_RS_LA6=      0;
lambda1_RS_RC6=      0;
lambda1_US=       0.75;
lambda2_EA6=    0.1967;
lambda2_EU=     0.2223;
lambda2_JA=     0.1836;
lambda2_LA6=     0.228;
lambda2_RC6=    0.1491;
lambda2_US=     0.1801;
lambda3_EA6=0.081206475;
lambda3_EU=  0.24622977;
lambda3_JA=  0.15164018;
lambda3_LA6=  0.1612529;
lambda3_RC6=0.098080652;
lambda3_US= 0.099648427;
phi_EA6=            0.8;
phi_EU=          0.8342;
phi_JA=          0.8562;
phi_LA6=            0.8;
phi_RC6=            0.8;
pietar_EU_ss=      1.9;
pietar_JA_ss=        1;
pietar_US_ss=      2.5;
pietar_LA6_ss=      3.5;
pietar_EA6_ss=        4;
pietar_RC6_ss=      4.5;
rho_EA6=            0.2;
rho_EU=          0.4673;
rho_JA=            0.03;
rho_LA6=            0.2;
rho_RC6=            0.2;
rho_US=          0.2901;
rr_bar_EA6_ss=        2;
rr_bar_EU_ss=   1.9837;
rr_bar_JA_ss=   1.3791;
rr_bar_LA6_ss=        2;
rr_bar_RC6_ss=        2;
rr_bar_US_ss=   1.7285;
tau_EA6=           0.03;
tau_EU=          0.0289;
tau_JA=          0.0375;
tau_LA6=           0.03;
tau_RC6=           0.03;
tau_US=          0.0274;
theta_EU=           0.3;
theta_JA=           0.3;
theta_US=        1.0708;
theta_EA6=   0.99637665;
theta_LA6=   0.99214079;
theta_RC6=   0.99605992;
lrrw01_US =0.10;
lrrw04_US =0.35;
lrrw12_US =0.35;
lrrw20_US =0.20;
lrrw01_EU =0.10; 
lrrw04_EU =0.35; 
lrrw12_EU =0.35; 
lrrw20_EU =0.20;
lrrw01_JA =0.10; 
lrrw04_JA =0.35; 
lrrw12_JA =0.35; 
lrrw20_JA =0.20;
lrrw01_EA6=0.10; 
lrrw04_EA6=0.35; 
lrrw12_EA6=0.35; 
lrrw20_EA6=0.20;
lrrw01_LA6=0.10; 
lrrw04_LA6=0.35; 
lrrw12_LA6=0.35; 
lrrw20_LA6=0.20;
lrrw01_RC6=0.10; 
lrrw04_RC6=0.35; 
lrrw12_RC6=0.35; 
lrrw20_RC6=0.20;
beta3m_US =1*beta3_US ;
beta3m_EU =1*beta3_EU ;
beta3m_JA =1*beta3_JA ;
beta3m_EA6=1*beta3_EA6;
beta3m_LA6=1*beta3_LA6;
beta3m_RC6=1*beta3_RC6;

model;
          // EA

          GROWTH_EA6 = 4*(LGDP_EA6-LGDP_EA6(-1)) ;
          GROWTH4_EA6 = LGDP_EA6-LGDP_EA6(-4) ;
          GROWTH_BAR_EA6 = 4*(LGDP_BAR_EA6-LGDP_BAR_EA6(-1)) ;
          GROWTH4_BAR_EA6 = LGDP_BAR_EA6-LGDP_BAR_EA6(-4) ;

          RS_EA6 = gamma1_EA6*RS_EA6(-1)+(1-gamma1_EA6)*(RR_BAR_EA6+PIE4_EA6(+3)+gamma2_EA6*(PIE4_EA6(+3)-PIETAR_EA6)+0+gamma4_EA6*Y_EA6+0)+RESN_RS_EA6;
		  RESN_RS_EA6 = lambda1_RS_EA6*RESN_RS_EA6(-1)+RES_PIETAR_EA6+RES_RS_EA6 ;
          PIETAR_EA6 = PIETAR_EA6(-1)-RES_PIETAR_EA6 ;
          PIE_EA6 = lambda1_EA6*PIE4_EA6(+4)+(1-lambda1_EA6)*PIE4_EA6(-1)+lambda2_EA6*Y_EA6(-1)
                    +lambda3_EA6*(REER_M_EA6-REER_M_EA6(-4)-(REER_M_BAR_EA6-REER_M_BAR_EA6(-4)))/4-RES_PIE_EA6 ;
          DRS_EA6 = RS_EA6-RS_EA6(-1) ;
          RR_EA6 = RS_EA6-PIE_EA6(+1) ;
          RR_BAR_EA6 = rho_EA6*rr_bar_EA6_ss+(1-rho_EA6)*RR_BAR_EA6(-1)+RES_RR_BAR_EA6 ;
          PIE4_EA6 = (PIE_EA6+PIE_EA6(-1)+PIE_EA6(-2)+PIE_EA6(-3))/4 ;
          LGDP_BAR_EA6 = LGDP_BAR_EA6(-1)+G_EA6/4+RES_LGDP_BAR_EA6 ;
          G_EA6 = tau_EA6*growth_EA6_ss+(1-tau_EA6)*G_EA6(-1)+RES_G_EA6 ;
          LCPI_EA6 = LCPI_EA6(-1)+PIE_EA6/4 ;
          E4_PIE4_EA6 = PIE4_EA6(+4) ;
          E3_PIE4_EA6 = PIE4_EA6(+3) ;
          E1_PIE_EA6 = PIE_EA6(+1) ;
          E1_Y_EA6 = Y_EA6(+1) ;
          E4_Y_EA6 = Y_EA6(+4) ;
		  E8_Y_EA6 = Y_EA6(+8) ;
		  REER_T_GAP_EA6 = REER_T_EA6 - REER_T_BAR_EA6;
		  DOT_REER_M_EA6 = 4*(REER_M_EA6-REER_M_EA6(-1));
		  
          REER_M_EA6 = +imp_EA6_EU *(LZ_EA6-LZ_EU )+imp_EA6_JA *(LZ_EA6-LZ_JA )+imp_EA6_LA6*(LZ_EA6-LZ_LA6)+imp_EA6_RC6*(LZ_EA6-LZ_RC6)+imp_EA6_US *LZ_EA6 ;
          REER_M_BAR_EA6 = +imp_EA6_EU *(LZ_BAR_EA6-LZ_BAR_EU )+imp_EA6_JA *(LZ_BAR_EA6-LZ_BAR_JA )+imp_EA6_LA6*(LZ_BAR_EA6-LZ_BAR_LA6)+imp_EA6_RC6*(LZ_BAR_EA6-LZ_BAR_RC6)+imp_EA6_US *LZ_BAR_EA6 ;
          DOT_REER_M_BAR_EA6 = 4*(REER_M_BAR_EA6-REER_M_BAR_EA6(-1)) ;
          REER_T_EA6 = +trade_EA6_EU *(LZ_EA6-LZ_EU )+trade_EA6_JA *(LZ_EA6-LZ_JA )+trade_EA6_LA6*(LZ_EA6-LZ_LA6)+trade_EA6_RC6*(LZ_EA6-LZ_RC6)+trade_EA6_US *LZ_EA6 ;
          REER_T_BAR_EA6 = +trade_EA6_EU *(LZ_BAR_EA6-LZ_BAR_EU )+trade_EA6_JA *(LZ_BAR_EA6-LZ_BAR_JA )+trade_EA6_LA6*(LZ_BAR_EA6-LZ_BAR_LA6)+trade_EA6_RC6*(LZ_BAR_EA6-LZ_BAR_RC6)+trade_EA6_US *LZ_BAR_EA6 ;
          FACT_EA6 = + spill_US_EA6*Y_US (-1) + spill_EU_EA6*Y_EU (-1) + spill_JA_EA6*Y_JA (-1) + spill_LA6_EA6*Y_LA6(-1) + spill_RC6_EA6*Y_RC6(-1);
          FACT_RES_EA6 = spill_EA6_EA6*RESN_YY_EA6 + spill_US_EA6*RESN_YY_US  + spill_EU_EA6*RESN_YY_EU  + spill_JA_EA6*RESN_YY_JA  + spill_LA6_EA6*RESN_YY_LA6 + spill_RC6_EA6*RESN_YY_RC6;
          RESN_YY_EA6 = 0.5*RESN_YY_EA6(-1) + RES_YY_EA6;

          Y_EA6 = LGDP_EA6-LGDP_BAR_EA6 ;
          RR_EA6-RR_US  = 4*(LZ_E_EA6-LZ_EA6)+RR_BAR_EA6-RR_BAR_US -DOT_LZ_BAR_EA6+RESN_RR_DIFF_EA6 ;
		  RESN_RR_DIFF_EA6 = 0.8*RESN_RR_DIFF_EA6(-1) + RES_RR_DIFF_EA6;
          LZ_BAR_EA6 = LZ_BAR_EA6(-1)+DOT_LZ_BAR_EA6/4+RES_LZ_BAR_EA6 ;
          DOT_LZ_BAR_EA6 = chi_EA6*dot_lz_bar_EA6_ss+(1-chi_EA6)*DOT_LZ_BAR_EA6(-1)+RES_DOT_LZ_BAR_EA6 ;
          LZ_E_EA6 = phi_EA6*LZ_EA6(+1)+(1-phi_EA6)*(LZ_EA6(-1)+2*DOT_LZ_BAR_EA6/4) ;
          Y_EA6 = beta1_EA6*Y_EA6(-1)+beta2_EA6*Y_EA6(+1)-beta3m_EA6*(LRR_EA6(-1)-LRR_BAR_EA6(-1))+beta_fact*FACT_EA6
                 +beta_fact_res*FACT_RES_EA6+beta4_EA6*(REER_T_EA6(-1)-REER_T_BAR_EA6(-1)+REER_T_EA6(-2)-REER_T_BAR_EA6(-2)
                 +REER_T_EA6(-3)-REER_T_BAR_EA6(-3)+REER_T_EA6(-4)-REER_T_BAR_EA6(-4))/4-E2_EA6+RESN_Y_EA6;
          RESN_Y_EA6  = 0.5*RESN_Y_EA6(-1) + RES_Y_EA6 ;
          E2_EA6 = theta_EA6*(spill_US_EA6*E2_US+spill_EU_EA6*E2_EU+spill_JA_EA6*E2_JA);
          LZ_GAP_EA6 = LZ_EA6-LZ_BAR_EA6 ;
          LS_EA6 = LZ_EA6+LCPI_EA6-LCPI_US;
          RR4_EA6 = (RR_EA6+RR_EA6(+1)+RR_EA6(+2)+RR_EA6(+3))/4;
          RR4_BAR_EA6 = (RR_BAR_EA6+RR_BAR_EA6(+1)+RR_BAR_EA6(+2)+RR_BAR_EA6(+3))/4;
          LRR_EA6 = lrrw01_EA6*RR_EA6 + lrrw04_EA6*RR4_EA6 + 
                    lrrw12_EA6*(RR4_EA6+RR4_EA6(+4)+RR4_EA6(+8))/3 +
                    lrrw20_EA6*(RR4_EA6+RR4_EA6(+4)+RR4_EA6(+8)+RR4_EA6(12)+RR4_EA6(16))/5;
          LRR_BAR_EA6 = lrrw01_EA6*RR_BAR_EA6 + lrrw04_EA6*RR4_BAR_EA6 + 
                    lrrw12_EA6*(RR4_BAR_EA6+RR4_BAR_EA6(+4)+RR4_BAR_EA6(+8))/3 +
                    lrrw20_EA6*(RR4_BAR_EA6+RR4_BAR_EA6(+4)+RR4_BAR_EA6(+8)+RR4_BAR_EA6(12)+RR4_BAR_EA6(16))/5;
          LRR_GAP_EA6 = LRR_EA6 - LRR_BAR_EA6;					


          // EU

          GROWTH_EU  = 4*(LGDP_EU -LGDP_EU(-1) ) ;
          GROWTH4_EU  = LGDP_EU -LGDP_EU(-4)  ;
          GROWTH_BAR_EU  = 4*(LGDP_BAR_EU -LGDP_BAR_EU(-1) ) ;
          GROWTH4_BAR_EU  = LGDP_BAR_EU -LGDP_BAR_EU(-4)  ;

          RS_EU   = gamma1_EU *RS_EU(-1) +(1-gamma1_EU )*(RR_BAR_EU +PIE4_EU(+3) +gamma2_EU *(PIE4_EU(+3) -PIETAR_EU )+0 +gamma4_EU *Y_EU +0 )+RES_RS_EU  ;
		  PIETAR_EU  = pietar_EU_ss ;
          UNR_GAP_EU  = alpha1_EU *UNR_GAP_EU(-1) +alpha2_EU *Y_EU +RES_UNR_GAP_EU  ;
          UNR_GAP_EU  = UNR_BAR_EU -UNR_EU  ;
          UNR_BAR_EU  = UNR_BAR_EU(-1) +UNR_G_EU +RES_UNR_BAR_EU  ;
          UNR_G_EU  = (1-alpha3_EU )*UNR_G_EU(-1) +RES_UNR_G_EU  ;
          PIE_EU  = lambda1_EU *PIE4_EU(+4)  +(1-lambda1_EU )*PIE4_EU(-1) +lambda2_EU *Y_EU(-1)  
                   +lambda3_EU *(REER_M_EU -REER_M_EU(-4) -(REER_M_BAR_EU -REER_M_BAR_EU(-4)) )/4-RES_PIE_EU  ;
          DRS_EU  = RS_EU -RS_EU(-1)  ;
          RR_EU  = RS_EU -PIE_EU(+1)  ;
          RR_BAR_EU  = rho_EU *rr_bar_EU_ss+(1-rho_EU )*RR_BAR_EU(-1) +RES_RR_BAR_EU  ;
          PIE4_EU  = (PIE_EU +PIE_EU(-1) +PIE_EU(-2) +PIE_EU(-3) )/4 ;
          LGDP_BAR_EU  = LGDP_BAR_EU(-1) +G_EU /4+RES_LGDP_BAR_EU  ;
          G_EU  = tau_EU *growth_EU_ss+(1-tau_EU )*G_EU(-1) +RES_G_EU  ;
          LCPI_EU  = LCPI_EU(-1) +PIE_EU /4 ;
          E4_PIE4_EU  = PIE4_EU(+4)  ;
          E3_PIE4_EU  = PIE4_EU(+3)  ;
          E1_PIE_EU  = PIE_EU(+1)  ;
          E1_Y_EU  = Y_EU(+1)  ;
          E4_Y_EU  = Y_EU(+4)  ;
		  E8_Y_EU  = Y_EU(+8)  ;
		  REER_T_GAP_EU = REER_T_EU - REER_T_BAR_EU;
		  DOT_REER_M_EU = 4*(REER_M_EU-REER_M_EU(-1));
		  
          REER_M_EU  = +imp_EU_EA6*(LZ_EU -LZ_EA6)+imp_EU_JA *(LZ_EU -LZ_JA )+imp_EU_LA6*(LZ_EU -LZ_LA6)+imp_EU_RC6*(LZ_EU -LZ_RC6)+imp_EU_US *LZ_EU  ;
          REER_M_BAR_EU  = +imp_EU_EA6*(LZ_BAR_EU -LZ_BAR_EA6)+imp_EU_JA *(LZ_BAR_EU -LZ_BAR_JA )+imp_EU_LA6*(LZ_BAR_EU -LZ_BAR_LA6)+imp_EU_RC6*(LZ_BAR_EU -LZ_BAR_RC6)+imp_EU_US *LZ_BAR_EU  ;
          DOT_REER_M_BAR_EU  = 4*(REER_M_BAR_EU -REER_M_BAR_EU(-1) ) ;
          REER_T_EU  = +trade_EU_EA6*(LZ_EU -LZ_EA6)+trade_EU_JA *(LZ_EU -LZ_JA )+trade_EU_LA6*(LZ_EU -LZ_LA6)+trade_EU_RC6*(LZ_EU -LZ_RC6)+trade_EU_US *LZ_EU  ;
          REER_T_BAR_EU  = +trade_EU_EA6*(LZ_BAR_EU -LZ_BAR_EA6)+trade_EU_JA *(LZ_BAR_EU -LZ_BAR_JA )+trade_EU_LA6*(LZ_BAR_EU -LZ_BAR_LA6)+trade_EU_RC6*(LZ_BAR_EU -LZ_BAR_RC6)+trade_EU_US *LZ_BAR_EU  ;
          FACT_EU  = + spill_US_EU *Y_US (-1) + spill_JA_EU *Y_JA (-1) + spill_EA6_EU *Y_EA6(-1) + spill_LA6_EU *Y_LA6(-1) + spill_RC6_EU *Y_RC6(-1);
          FACT_RES_EU  = spill_EU_EU *RESN_YY_EU  + spill_US_EU *RESN_YY_US  + spill_JA_EU *RESN_YY_JA  + spill_EA6_EU *RESN_YY_EA6 + spill_LA6_EU *RESN_YY_LA6 + spill_RC6_EU *RESN_YY_RC6;
          RESN_YY_EU  = 0.5*RESN_YY_EU(-1) + RES_YY_EU ;

          Y_EU  = LGDP_EU -LGDP_BAR_EU  ;
          RR_EU -RR_US  = 4*(LZ_E_EU -LZ_EU )+RR_BAR_EU -RR_BAR_US +RESN_RR_DIFF_EU  ;
		  RESN_RR_DIFF_EU = 0.8*RESN_RR_DIFF_EU(-1) + RES_RR_DIFF_EU;
          LZ_BAR_EU  = LZ_BAR_EU(-1) +RES_LZ_BAR_EU  ;
          LZ_E_EU  = phi_EU *LZ_EU(+1) +(1-phi_EU )*LZ_EU(-1)  ;
          Y_EU  = beta1_EU *Y_EU(-1) +beta2_EU*Y_EU(+1) -beta3m_EU *(LRR_EU(-1) -LRR_BAR_EU(-1) ) +beta_fact*FACT_EU +beta_fact_res*FACT_RES_EU +beta4_EU*(REER_T_EU(-1) -REER_T_BAR_EU(-1)+REER_T_EU(-2)-REER_T_BAR_EU(-2)+REER_T_EU(-3)-REER_T_BAR_EU(-3)+REER_T_EU(-4)-REER_T_BAR_EU(-4))/4-E2_EU+RESN_Y_EU ;
          RESN_Y_EU  = 0.5*RESN_Y_EU(-1) + RES_Y_EU ;
          E_EU  = -RES_BLT_EU  ;
          BLT_EU  = BLT_BAR_EU -kappa_EU *Y_EU(+4) -RES_BLT_EU  ;
          BLT_BAR_EU  = BLT_BAR_EU(-1) +RES_BLT_BAR_EU  ;
          E2_EU  = theta_EU *(0.04*(E_EU(-1) +E_EU(-9) )+0.08*(E_EU(-2) +E_EU(-8) )+0.12*(E_EU(-3) +E_EU(-7) )+0.16*(E_EU(-4) +E_EU(-6) )+0.2*E_EU(-5) ) ;
          LZ_GAP_EU  = LZ_EU -LZ_BAR_EU  ;
          LS_EU  = LZ_EU +LCPI_EU -LCPI_US  ;
          RR4_EU  = (RR_EU +RR_EU(+1) +RR_EU(+2) +RR_EU(+3) )/4;
          RR4_BAR_EU  = (RR_BAR_EU +RR_BAR_EU(+1) +RR_BAR_EU(+2) +RR_BAR_EU(+3) )/4;
          LRR_GAP_EU = LRR_EU - LRR_BAR_EU;
          LRR_EU      = lrrw01_EU *RR_EU
		              + lrrw04_EU *RR4_EU
					  + lrrw12_EU *(RR4_EU +RR4_EU(+4) +RR4_EU(+8) )/3
					  + lrrw20_EU *(RR4_EU +RR4_EU(+4) +RR4_EU(+8) +RR4_EU(12) +RR4_EU(16) )/5;
          LRR_BAR_EU  = lrrw01_EU *RR_BAR_EU
		              + lrrw04_EU *RR4_BAR_EU
					  + lrrw12_EU *(RR4_BAR_EU +RR4_BAR_EU(+4) +RR4_BAR_EU(+8) )/3
					  + lrrw20_EU *(RR4_BAR_EU +RR4_BAR_EU(+4) +RR4_BAR_EU(+8) +RR4_BAR_EU(12) +RR4_BAR_EU(16) )/5;		  


          // JA

          GROWTH_JA  = 4*(LGDP_JA -LGDP_JA(-1) ) ;
          GROWTH4_JA  = LGDP_JA -LGDP_JA(-4)  ;
          GROWTH_BAR_JA  = 4*(LGDP_BAR_JA -LGDP_BAR_JA(-1) ) ;
          GROWTH4_BAR_JA  = LGDP_BAR_JA -LGDP_BAR_JA(-4)  ;

          RS_JA   = gamma1_JA *RS_JA(-1) +(1-gamma1_JA )*(RR_BAR_JA +PIE4_JA(+3) +gamma2_JA *(PIE4_JA(+3) -PIETAR_JA )+0 +gamma4_JA *Y_JA +0 )+RES_RS_JA  ;
		  PIETAR_JA  = pietar_JA_ss ;
          UNR_GAP_JA  = alpha1_JA *UNR_GAP_JA(-1) +alpha2_JA *Y_JA +RES_UNR_GAP_JA  ;
          UNR_GAP_JA  = UNR_BAR_JA -UNR_JA  ;
          UNR_BAR_JA  = UNR_BAR_JA(-1) +UNR_G_JA +RES_UNR_BAR_JA  ;
          UNR_G_JA  = (1-alpha3_JA )*UNR_G_JA(-1) +RES_UNR_G_JA  ;
          PIE_JA  = lambda1_JA *PIE4_JA(+4)  +(1-lambda1_JA )*PIE4_JA(-1) +lambda2_JA *Y_JA(-1)  
                   +lambda3_JA *(REER_M_JA -REER_M_JA(-4) -(REER_M_BAR_JA -REER_M_BAR_JA(-4) ))/4-RES_PIE_JA  ;
          DRS_JA  = RS_JA -RS_JA(-1)  ;
          RR_JA  = RS_JA -PIE_JA(+1)  ;
          RR_BAR_JA  = rho_JA *rr_bar_JA_ss+(1-rho_JA )*RR_BAR_JA(-1) +RES_RR_BAR_JA  ;
          PIE4_JA  = (PIE_JA +PIE_JA(-1) +PIE_JA(-2) +PIE_JA(-3) )/4 ;
          LGDP_BAR_JA  = LGDP_BAR_JA(-1) +G_JA /4+RES_LGDP_BAR_JA  ;
          G_JA  = tau_JA *growth_JA_ss+(1-tau_JA )*G_JA(-1) +RES_G_JA  ;
          LCPI_JA  = LCPI_JA(-1) +PIE_JA /4 ;
          E4_PIE4_JA  = PIE4_JA(+4)  ;
          E3_PIE4_JA  = PIE4_JA(+3)  ;
          E1_PIE_JA  = PIE_JA(+1)  ;
          E1_Y_JA  = Y_JA(+1)  ;
          E4_Y_JA  = Y_JA(+4)  ;
		  E8_Y_JA  = Y_JA(+8)  ;
	      REER_T_GAP_JA = REER_T_JA - REER_T_BAR_JA;
		  DOT_REER_M_JA = 4*(REER_M_JA-REER_M_JA(-1));
          REER_M_JA  = +imp_JA_EA6*(LZ_JA -LZ_EA6)+imp_JA_EU *(LZ_JA -LZ_EU )+imp_JA_LA6*(LZ_JA -LZ_LA6)+imp_JA_RC6*(LZ_JA -LZ_RC6)+imp_JA_US *LZ_JA  ;
          REER_M_BAR_JA  = +imp_JA_EA6*(LZ_BAR_JA -LZ_BAR_EA6)+imp_JA_EU *(LZ_BAR_JA -LZ_BAR_EU )+imp_JA_LA6*(LZ_BAR_JA -LZ_BAR_LA6)+imp_JA_RC6*(LZ_BAR_JA -LZ_BAR_RC6)+imp_JA_US *LZ_BAR_JA  ;
          DOT_REER_M_BAR_JA  = 4*(REER_M_BAR_JA -REER_M_BAR_JA(-1) ) ;
          REER_T_JA  = +trade_JA_EA6*(LZ_JA -LZ_EA6)+trade_JA_EU *(LZ_JA -LZ_EU )+trade_JA_LA6*(LZ_JA -LZ_LA6)+trade_JA_RC6*(LZ_JA -LZ_RC6)+trade_JA_US *LZ_JA  ;
          REER_T_BAR_JA  = +trade_JA_EA6*(LZ_BAR_JA -LZ_BAR_EA6)+trade_JA_EU *(LZ_BAR_JA -LZ_BAR_EU )+trade_JA_LA6*(LZ_BAR_JA -LZ_BAR_LA6)+trade_JA_RC6*(LZ_BAR_JA -LZ_BAR_RC6)+trade_JA_US *LZ_BAR_JA  ;
          FACT_JA  = + spill_US_JA *Y_US (-1) + spill_EU_JA *Y_EU (-1) + spill_EA6_JA *Y_EA6(-1) + spill_LA6_JA *Y_LA6(-1) + spill_RC6_JA *Y_RC6(-1);
          FACT_RES_JA  = spill_JA_JA *RESN_YY_JA  + spill_US_JA *RESN_YY_US  + spill_EU_JA *RESN_YY_EU  + spill_EA6_JA *RESN_YY_EA6 + spill_LA6_JA *RESN_YY_LA6 + spill_RC6_JA *RESN_YY_RC6;
          RESN_YY_JA  = 0.5*RESN_YY_JA(-1) + RES_YY_JA ;

          Y_JA  = LGDP_JA -LGDP_BAR_JA  ;
          RR_JA -RR_US  = 4*(LZ_E_JA -LZ_JA )+RR_BAR_JA -RR_BAR_US +RESN_RR_DIFF_JA  ;
		  RESN_RR_DIFF_JA = 0.8*RESN_RR_DIFF_JA(-1) + RES_RR_DIFF_JA;
          LZ_BAR_JA  = LZ_BAR_JA(-1) +RES_LZ_BAR_JA  ;
          LZ_E_JA  = phi_JA *LZ_JA(+1) +(1-phi_JA )*LZ_JA(-1)  ;
          Y_JA  = beta1_JA *Y_JA(-1) + beta2_JA *Y_JA(+1) -beta3m_JA *(LRR_JA(-1) -LRR_BAR_JA(-1) ) +beta_fact*FACT_JA +beta_fact_res*FACT_RES_JA + beta4_JA *(REER_T_JA(-1) -REER_T_BAR_JA(-1)+REER_T_JA(-2) -REER_T_BAR_JA(-2)+REER_T_JA(-3)-REER_T_BAR_JA(-3)+REER_T_JA(-4) -REER_T_BAR_JA(-4))/4-E2_JA+RESN_Y_JA ;
          RESN_Y_JA  = 0.5*RESN_Y_JA(-1) + RES_Y_JA ;
          E_JA  = -RES_BLT_JA  ;
          BLT_JA  = BLT_BAR_JA -kappa_JA *Y_JA(+4) -RES_BLT_JA  ;
          BLT_BAR_JA  = BLT_BAR_JA(-1) +RES_BLT_BAR_JA  ;
          E2_JA  = theta_JA *(0.04*(E_JA(-1) +E_JA(-9) )+0.08*(E_JA(-2) +E_JA(-8) )+0.12*(E_JA(-3) +E_JA(-7) )+0.16*(E_JA(-4) +E_JA(-6) )+0.2*E_JA(-5) ) ;
          LZ_GAP_JA  = LZ_JA -LZ_BAR_JA  ;
          LS_JA  = LZ_JA +LCPI_JA -LCPI_US  ;
          RR4_JA  = (RR_JA +RR_JA(+1) +RR_JA(+2) +RR_JA(+3) )/4;
          RR4_BAR_JA  = (RR_BAR_JA +RR_BAR_JA(+1) +RR_BAR_JA(+2) +RR_BAR_JA(+3) )/4;
          LRR_GAP_JA = LRR_JA - LRR_BAR_JA;
          LRR_JA      = lrrw01_JA *RR_JA
		              + lrrw04_JA *RR4_JA
					  + lrrw12_JA *(RR4_JA +RR4_JA(+4) +RR4_JA(+8) )/3
					  + lrrw20_JA *(RR4_JA +RR4_JA(+4) +RR4_JA(+8) +RR4_JA(12) +RR4_JA(16) )/5;
          LRR_BAR_JA  = lrrw01_JA *RR_BAR_JA
		              + lrrw04_JA *RR4_BAR_JA
					  + lrrw12_JA *(RR4_BAR_JA +RR4_BAR_JA(+4) +RR4_BAR_JA(+8) )/3
					  + lrrw20_JA *(RR4_BAR_JA +RR4_BAR_JA(+4) +RR4_BAR_JA(+8) +RR4_BAR_JA(12) +RR4_BAR_JA(16) )/5;

          
          // LA6

          GROWTH_LA6 = 4*(LGDP_LA6-LGDP_LA6(-1)) ;
          GROWTH4_LA6 = LGDP_LA6-LGDP_LA6(-4) ;
          GROWTH_BAR_LA6 = 4*(LGDP_BAR_LA6-LGDP_BAR_LA6(-1)) ;
          GROWTH4_BAR_LA6 = LGDP_BAR_LA6-LGDP_BAR_LA6(-4) ;


          RS_LA6 = gamma1_LA6*RS_LA6(-1)+(1-gamma1_LA6)*(RR_BAR_LA6+PIE4_LA6(+3)+gamma2_LA6*(PIE4_LA6(+3)-PIETAR_LA6)+0+gamma4_LA6*Y_LA6+0)+RESN_RS_LA6;
		  RESN_RS_LA6 = lambda1_RS_LA6*RESN_RS_LA6(-1)+RES_PIETAR_LA6+RES_RS_LA6 ;
          PIETAR_LA6 = PIETAR_LA6(-1)-RES_PIETAR_LA6 ;
          PIE_LA6 = lambda1_LA6*PIE4_LA6(+4)+(1-lambda1_LA6)*PIE4_LA6(-1)+lambda2_LA6*Y_LA6(-1)+lambda3_LA6*(REER_M_LA6-REER_M_LA6(-4)-(REER_M_BAR_LA6-REER_M_BAR_LA6(-4)))/4-RES_PIE_LA6 ;
          DRS_LA6 = RS_LA6-RS_LA6(-1) ;
          RR_LA6 = RS_LA6-PIE_LA6(+1) ;
          RR_BAR_LA6 = rho_LA6*rr_bar_LA6_ss+(1-rho_LA6)*RR_BAR_LA6(-1)+RES_RR_BAR_LA6 ;
          PIE4_LA6 = (PIE_LA6+PIE_LA6(-1)+PIE_LA6(-2)+PIE_LA6(-3))/4 ;
          LGDP_BAR_LA6 = LGDP_BAR_LA6(-1)+G_LA6/4+RES_LGDP_BAR_LA6 ;
          G_LA6 = tau_LA6*growth_LA6_ss+(1-tau_LA6)*G_LA6(-1)+RES_G_LA6 ;
          LCPI_LA6 = LCPI_LA6(-1)+PIE_LA6/4 ;
          E4_PIE4_LA6 = PIE4_LA6(+4) ;
          E3_PIE4_LA6 = PIE4_LA6(+3) ;
          E1_PIE_LA6 = PIE_LA6(+1) ;
          E1_Y_LA6 = Y_LA6(+1) ;
          E4_Y_LA6 = Y_LA6(+4) ;
		  E8_Y_LA6 = Y_LA6(+8) ;
	      REER_T_GAP_LA6 = REER_T_LA6 - REER_T_BAR_LA6;
		  DOT_REER_M_LA6 = 4*(REER_M_LA6-REER_M_LA6(-1));
          REER_M_LA6 = +imp_LA6_EA6*(LZ_LA6-LZ_EA6)+imp_LA6_EU *(LZ_LA6-LZ_EU )+imp_LA6_JA *(LZ_LA6-LZ_JA )+imp_LA6_RC6*(LZ_LA6-LZ_RC6)+imp_LA6_US *LZ_LA6 ;
          REER_M_BAR_LA6 = +imp_LA6_EA6*(LZ_BAR_LA6-LZ_BAR_EA6)+imp_LA6_EU *(LZ_BAR_LA6-LZ_BAR_EU )+imp_LA6_JA *(LZ_BAR_LA6-LZ_BAR_JA )+imp_LA6_RC6*(LZ_BAR_LA6-LZ_BAR_RC6)+imp_LA6_US *LZ_BAR_LA6 ;
          DOT_REER_M_BAR_LA6 = 4*(REER_M_BAR_LA6-REER_M_BAR_LA6(-1)) ;
          REER_T_LA6 = +trade_LA6_EA6*(LZ_LA6-LZ_EA6)+trade_LA6_EU *(LZ_LA6-LZ_EU )+trade_LA6_JA *(LZ_LA6-LZ_JA )+trade_LA6_RC6*(LZ_LA6-LZ_RC6)+trade_LA6_US *LZ_LA6 ;
          REER_T_BAR_LA6 = +trade_LA6_EA6*(LZ_BAR_LA6-LZ_BAR_EA6)+trade_LA6_EU *(LZ_BAR_LA6-LZ_BAR_EU )+trade_LA6_JA *(LZ_BAR_LA6-LZ_BAR_JA )+trade_LA6_RC6*(LZ_BAR_LA6-LZ_BAR_RC6)+trade_LA6_US *LZ_BAR_LA6 ;
          FACT_LA6 = + spill_US_LA6*Y_US (-1) + spill_EU_LA6*Y_EU (-1) + spill_JA_LA6*Y_JA (-1) + spill_EA6_LA6*Y_EA6(-1) + spill_RC6_LA6*Y_RC6(-1);
          FACT_RES_LA6 = spill_LA6_LA6*RESN_YY_LA6 + spill_US_LA6*RESN_YY_US  + spill_EU_LA6*RESN_YY_EU  + spill_JA_LA6*RESN_YY_JA  + spill_EA6_LA6*RESN_YY_EA6 + spill_RC6_LA6*RESN_YY_RC6;
          RESN_YY_LA6 = 0.5*RESN_YY_LA6(-1) + RES_YY_LA6;

          Y_LA6 = LGDP_LA6-LGDP_BAR_LA6 ;
          RR_LA6-RR_US  = 4*(LZ_E_LA6-LZ_LA6)+RR_BAR_LA6-RR_BAR_US -DOT_LZ_BAR_LA6+RESN_RR_DIFF_LA6 ;
		  RESN_RR_DIFF_LA6 = 0.8*RESN_RR_DIFF_LA6(-1) + RES_RR_DIFF_LA6;
          LZ_BAR_LA6 = LZ_BAR_LA6(-1)+DOT_LZ_BAR_LA6/4+RES_LZ_BAR_LA6 ;
          DOT_LZ_BAR_LA6 = chi_LA6*dot_lz_bar_LA6_ss+(1-chi_LA6)*DOT_LZ_BAR_LA6(-1)+RES_DOT_LZ_BAR_LA6 ;
          LZ_E_LA6 = phi_LA6*LZ_LA6(+1)+(1-phi_LA6)*(LZ_LA6(-1)+2*DOT_LZ_BAR_LA6/4) ;
          Y_LA6 = beta1_LA6*Y_LA6(-1)+beta2_LA6*Y_LA6(+1)-beta3m_LA6*(LRR_LA6(-1)-LRR_BAR_LA6(-1))+beta_fact*FACT_LA6+beta_fact_res*FACT_RES_LA6+beta4_LA6*(REER_T_LA6(-1)-REER_T_BAR_LA6(-1)+REER_T_LA6(-2)-REER_T_BAR_LA6(-2)+REER_T_LA6(-3)-REER_T_BAR_LA6(-3)+REER_T_LA6(-4)-REER_T_BAR_LA6(-4))/4-E2_LA6+RESN_Y_LA6;
          RESN_Y_LA6  = 0.5*RESN_Y_LA6(-1) + RES_Y_LA6 ;
          E2_LA6 = theta_LA6*(spill_US_LA6*E2_US+spill_EU_LA6*E2_EU+spill_JA_LA6*E2_JA);
          LZ_GAP_LA6 = LZ_LA6-LZ_BAR_LA6 ;
          LS_LA6 = LZ_LA6+LCPI_LA6-LCPI_US  ;
          RR4_LA6 = (RR_LA6+RR_LA6(+1)+RR_LA6(+2)+RR_LA6(+3))/4;
          RR4_BAR_LA6 = (RR_BAR_LA6+RR_BAR_LA6(+1)+RR_BAR_LA6(+2)+RR_BAR_LA6(+3))/4;
          LRR_LA6 = lrrw01_LA6*RR_LA6 + lrrw04_LA6*RR4_LA6 + 
                    lrrw12_LA6*(RR4_LA6+RR4_LA6(+4)+RR4_LA6(+8))/3 +
                    lrrw20_LA6*(RR4_LA6+RR4_LA6(+4)+RR4_LA6(+8)+RR4_LA6(12)+RR4_LA6(16))/5;
          LRR_BAR_LA6 = lrrw01_LA6*RR_BAR_LA6 + lrrw04_LA6*RR4_BAR_LA6 + 
                    lrrw12_LA6*(RR4_BAR_LA6+RR4_BAR_LA6(+4)+RR4_BAR_LA6(+8))/3 +
                    lrrw20_LA6*(RR4_BAR_LA6+RR4_BAR_LA6(+4)+RR4_BAR_LA6(+8)+RR4_BAR_LA6(12)+RR4_BAR_LA6(16))/5;
          LRR_GAP_LA6 = LRR_LA6 - LRR_BAR_LA6;

          
          // RC6

		  GROWTH_RC6 = 4*(LGDP_RC6-LGDP_RC6(-1)) ;
          GROWTH4_RC6 = LGDP_RC6-LGDP_RC6(-4) ;
          GROWTH_BAR_RC6 = 4*(LGDP_BAR_RC6-LGDP_BAR_RC6(-1)) ;
          GROWTH4_BAR_RC6 = LGDP_BAR_RC6-LGDP_BAR_RC6(-4) ;

          RS_RC6 = gamma1_RC6*RS_RC6(-1)+(1-gamma1_RC6)*(RR_BAR_RC6+PIE4_RC6(+3)+gamma2_RC6*(PIE4_RC6(+3)-PIETAR_RC6)+0+gamma4_RC6*Y_RC6+0)+RESN_RS_RC6;
		  RESN_RS_RC6 = lambda1_RS_RC6*RESN_RS_RC6(-1)+RES_PIETAR_RC6+RES_RS_RC6 ;
          PIETAR_RC6 = PIETAR_RC6(-1)-RES_PIETAR_RC6 ;
          PIE_RC6 = lambda1_RC6*PIE4_RC6(+4)+(1-lambda1_RC6)*PIE4_RC6(-1)+lambda2_RC6*Y_RC6(-1)+lambda3_RC6*(REER_M_RC6-REER_M_RC6(-4)-(REER_M_BAR_RC6-REER_M_BAR_RC6(-4)))/4-RES_PIE_RC6 ;
          DRS_RC6 = RS_RC6-RS_RC6(-1) ;
          RR_RC6 = RS_RC6-PIE_RC6(+1) ;
          RR_BAR_RC6 = rho_RC6*rr_bar_RC6_ss+(1-rho_RC6)*RR_BAR_RC6(-1)+RES_RR_BAR_RC6 ;
          PIE4_RC6 = (PIE_RC6+PIE_RC6(-1)+PIE_RC6(-2)+PIE_RC6(-3))/4 ;
          LGDP_BAR_RC6 = LGDP_BAR_RC6(-1)+G_RC6/4+RES_LGDP_BAR_RC6 ;
          G_RC6 = tau_RC6*growth_RC6_ss+(1-tau_RC6)*G_RC6(-1)+RES_G_RC6 ;
          LCPI_RC6 = LCPI_RC6(-1)+PIE_RC6/4 ;
          E4_PIE4_RC6 = PIE4_RC6(+4) ;
          E3_PIE4_RC6 = PIE4_RC6(+3) ;
          E1_PIE_RC6 = PIE_RC6(+1) ;
          E1_Y_RC6 = Y_RC6(+1) ;
          E4_Y_RC6 = Y_RC6(+4) ;
		  E8_Y_RC6 = Y_RC6(+8) ;
		  REER_T_GAP_RC6 = REER_T_RC6 - REER_T_BAR_RC6;
		  DOT_REER_M_RC6 = 4*(REER_M_RC6-REER_M_RC6(-1));
          REER_M_RC6 = +imp_RC6_EA6*(LZ_RC6-LZ_EA6)+imp_RC6_EU *(LZ_RC6-LZ_EU )+imp_RC6_JA *(LZ_RC6-LZ_JA )+imp_RC6_LA6*(LZ_RC6-LZ_LA6)+imp_RC6_US *LZ_RC6 ;
          REER_M_BAR_RC6 = +imp_RC6_EA6*(LZ_BAR_RC6-LZ_BAR_EA6)+imp_RC6_EU *(LZ_BAR_RC6-LZ_BAR_EU )+imp_RC6_JA *(LZ_BAR_RC6-LZ_BAR_JA )+imp_RC6_LA6*(LZ_BAR_RC6-LZ_BAR_LA6)+imp_RC6_US *LZ_BAR_RC6 ;
          DOT_REER_M_BAR_RC6 = 4*(REER_M_BAR_RC6-REER_M_BAR_RC6(-1)) ;
          REER_T_RC6 = +trade_RC6_EA6*(LZ_RC6-LZ_EA6)+trade_RC6_EU *(LZ_RC6-LZ_EU )+trade_RC6_JA *(LZ_RC6-LZ_JA )+trade_RC6_LA6*(LZ_RC6-LZ_LA6)+trade_RC6_US *LZ_RC6 ;
          REER_T_BAR_RC6 = +trade_RC6_EA6*(LZ_BAR_RC6-LZ_BAR_EA6)+trade_RC6_EU *(LZ_BAR_RC6-LZ_BAR_EU )+trade_RC6_JA *(LZ_BAR_RC6-LZ_BAR_JA )+trade_RC6_LA6*(LZ_BAR_RC6-LZ_BAR_LA6)+trade_RC6_US *LZ_BAR_RC6 ;
          FACT_RC6 = + spill_US_RC6*Y_US (-1) + spill_EU_RC6*Y_EU (-1) + spill_JA_RC6*Y_JA (-1) + spill_EA6_RC6*Y_EA6(-1) + spill_LA6_RC6*Y_LA6(-1);
          FACT_RES_RC6 = spill_RC6_RC6*RESN_YY_RC6 + spill_US_RC6*RESN_YY_US  + spill_EU_RC6*RESN_YY_EU  + spill_JA_RC6*RESN_YY_JA  + spill_EA6_RC6*RESN_YY_EA6 + spill_LA6_RC6*RESN_YY_LA6;
          RESN_YY_RC6 = 0.5*RESN_YY_RC6(-1) + RES_YY_RC6;

          Y_RC6 = LGDP_RC6-LGDP_BAR_RC6 ;
          RR_RC6-RR_US  = 4*(LZ_E_RC6-LZ_RC6)+RR_BAR_RC6-RR_BAR_US -DOT_LZ_BAR_RC6+RESN_RR_DIFF_RC6 ;
		  RESN_RR_DIFF_RC6 = 0.8*RESN_RR_DIFF_RC6(-1) + RES_RR_DIFF_RC6;
          LZ_BAR_RC6 = LZ_BAR_RC6(-1)+DOT_LZ_BAR_RC6/4+RES_LZ_BAR_RC6 ;
          DOT_LZ_BAR_RC6 = chi_RC6*dot_lz_bar_RC6_ss+(1-chi_RC6)*DOT_LZ_BAR_RC6(-1)+RES_DOT_LZ_BAR_RC6 ;
          LZ_E_RC6 = phi_RC6*LZ_RC6(+1)+(1-phi_RC6)*(LZ_RC6(-1)+2*DOT_LZ_BAR_RC6/4) ;
          Y_RC6 = beta1_RC6*Y_RC6(-1)+ beta2_RC6*Y_RC6(+1)-beta3m_RC6*(LRR_RC6(-1)-LRR_BAR_RC6(-1))+beta_fact*FACT_RC6+beta_fact_res*FACT_RES_RC6+beta4_RC6*(REER_T_RC6(-1)-REER_T_BAR_RC6(-1)+REER_T_RC6(-2)-REER_T_BAR_RC6(-2)+REER_T_RC6(-3)-REER_T_BAR_RC6(-3)+REER_T_RC6(-4)-REER_T_BAR_RC6(-4))/4-E2_RC6+RESN_Y_RC6;
          RESN_Y_RC6  = 0.5*RESN_Y_RC6(-1) + RES_Y_RC6 ;
          E2_RC6 = theta_RC6*(spill_US_RC6*E2_US+spill_EU_RC6*E2_EU+spill_JA_RC6*E2_JA);
          LZ_GAP_RC6 = LZ_RC6-LZ_BAR_RC6 ;
          LS_RC6 = LZ_RC6+LCPI_RC6-LCPI_US  ;
          RR4_RC6 = (RR_RC6+RR_RC6(+1)+RR_RC6(+2)+RR_RC6(+3))/4;
          RR4_BAR_RC6 = (RR_BAR_RC6+RR_BAR_RC6(+1)+RR_BAR_RC6(+2)+RR_BAR_RC6(+3))/4;
          LRR_RC6 = lrrw01_RC6*RR_RC6 + lrrw04_RC6*RR4_RC6 + 
                    lrrw12_RC6*(RR4_RC6+RR4_RC6(+4)+RR4_RC6(+8))/3 +
                    lrrw20_RC6*(RR4_RC6+RR4_RC6(+4)+RR4_RC6(+8)+RR4_RC6(12)+RR4_RC6(16))/5;
          LRR_BAR_RC6 = lrrw01_RC6*RR_BAR_RC6 + lrrw04_RC6*RR4_BAR_RC6 + 
                    lrrw12_RC6*(RR4_BAR_RC6+RR4_BAR_RC6(+4)+RR4_BAR_RC6(+8))/3 +
                    lrrw20_RC6*(RR4_BAR_RC6+RR4_BAR_RC6(+4)+RR4_BAR_RC6(+8)+RR4_BAR_RC6(12)+RR4_BAR_RC6(16))/5;
          LRR_GAP_RC6 = LRR_RC6 - LRR_BAR_RC6;


          // US

          GROWTH_US  = 4*(LGDP_US -LGDP_US(-1) ) ;
          GROWTH4_US  = LGDP_US -LGDP_US(-4)  ;
          GROWTH_BAR_US  = 4*(LGDP_BAR_US -LGDP_BAR_US(-1) ) ;
          GROWTH4_BAR_US  = LGDP_BAR_US -LGDP_BAR_US(-4)  ;

          RS_US   = gamma1_US *RS_US(-1) +(1-gamma1_US )*(RR_BAR_US +PIE4_US(+3) +gamma2_US *(PIE4_US(+3) -PIETAR_US )+0 +gamma4_US *Y_US )+RES_RS_US  ;
		  PIETAR_US  = pietar_US_ss ;
          UNR_GAP_US  = alpha1_US *UNR_GAP_US(-1) +alpha2_US *Y_US +RES_UNR_GAP_US  ;
          UNR_GAP_US  = UNR_BAR_US -UNR_US  ;
          UNR_BAR_US  = UNR_BAR_US(-1) +UNR_G_US +RES_UNR_BAR_US  ;
          UNR_G_US  = (1-alpha3_US )*UNR_G_US(-1) +RES_UNR_G_US  ;
          PIE_US  = lambda1_US *PIE4_US(+4)  +(1-lambda1_US )*PIE4_US(-1) +lambda2_US *Y_US(-1)  +lambda3_US *(REER_M_US -REER_M_US(-4)-(REER_M_BAR_US -REER_M_BAR_US(-4)))/4-RES_PIE_US  ;
          DRS_US  = RS_US -RS_US(-1)  ;
          RR_US  = RS_US -PIE_US(+1)  ;
          RR_BAR_US  = rho_US *rr_bar_US_ss+(1-rho_US )*RR_BAR_US(-1) +RES_RR_BAR_US  ;
          PIE4_US  = (PIE_US +PIE_US(-1) +PIE_US(-2) +PIE_US(-3) )/4 ;
          LGDP_BAR_US  = LGDP_BAR_US(-1) +G_US /4+RES_LGDP_BAR_US  ;
          G_US  = tau_US *growth_US_ss+(1-tau_US )*G_US(-1) +RES_G_US  ;
          LCPI_US  = LCPI_US(-1) +PIE_US /4 ;
          E4_PIE4_US  = PIE4_US(+4)  ;
          E3_PIE4_US  = PIE4_US(+3)  ;
          E1_PIE_US  = PIE_US(+1)  ;
          E1_Y_US  = Y_US(+1)  ;
          E4_Y_US  = Y_US(+4)  ;
		  E8_Y_US  = Y_US(+8)  ;
		  REER_T_GAP_US = REER_T_US - REER_T_BAR_US;
		  DOT_REER_M_US = 4*(REER_M_US-REER_M_US(-1));
          REER_M_US  = +imp_US_EA6*(-LZ_EA6)+imp_US_EU *(-LZ_EU )+imp_US_JA *(-LZ_JA )+imp_US_LA6*(-LZ_LA6)+imp_US_RC6*(-LZ_RC6) ;
          REER_M_BAR_US  = +imp_US_EA6*(-LZ_BAR_EA6)+imp_US_EU *(-LZ_BAR_EU )+imp_US_JA *(-LZ_BAR_JA )+imp_US_LA6*(-LZ_BAR_LA6)+imp_US_RC6*(-LZ_BAR_RC6) ;
          DOT_REER_M_BAR_US  = 4*(REER_M_BAR_US -REER_M_BAR_US(-1) ) ;
          REER_T_US  = +trade_US_EA6*(-LZ_EA6)+trade_US_EU *(-LZ_EU )+trade_US_JA *(-LZ_JA )+trade_US_LA6*(-LZ_LA6)+trade_US_RC6*(-LZ_RC6) ;
          REER_T_BAR_US  = +trade_US_EA6*(-LZ_BAR_EA6)+trade_US_EU *(-LZ_BAR_EU )+trade_US_JA *(-LZ_BAR_JA )+trade_US_LA6*(-LZ_BAR_LA6)+trade_US_RC6*(-LZ_BAR_RC6) ;
          FACT_US  = + spill_EU_US *Y_EU (-1) + spill_JA_US *Y_JA (-1) + spill_EA6_US *Y_EA6(-1) + spill_LA6_US *Y_LA6(-1) + spill_RC6_US *Y_RC6(-1);
          FACT_RES_US  = spill_US_US *RESN_YY_US  + spill_EU_US *RESN_YY_EU  + spill_JA_US *RESN_YY_JA  + spill_EA6_US *RESN_YY_EA6 + spill_LA6_US *RESN_YY_LA6 + spill_RC6_US *RESN_YY_RC6;
          RESN_YY_US  = 0.5*RESN_YY_US(-1) + RES_YY_US ;

          Y_US  = LGDP_US -LGDP_BAR_US  ;
          Y_US  = beta1_US *Y_US(-1) + beta2_US *Y_US(+1) -beta3m_US *(LRR_US(-1) -LRR_BAR_US(-1) ) +beta_fact*FACT_US +beta_fact_res*FACT_RES_US +beta4_US *(REER_T_US(-1) -REER_T_BAR_US(-1) + REER_T_US(-2) -REER_T_BAR_US(-2) + REER_T_US(-3) -REER_T_BAR_US(-3) + REER_T_US(-4) -REER_T_BAR_US(-4))/4-E2_US+RESN_Y_US;
          RESN_Y_US  = 0.5*RESN_Y_US(-1) + RES_Y_US ;
          E_US  = -RES_BLT_US  ;
          BLT_US  = BLT_BAR_US -kappa_US *Y_US(+4) -RES_BLT_US  ;
          BLT_BAR_US  = BLT_BAR_US(-1) +RES_BLT_BAR_US  ;
          E2_US  = theta_US *(0.04*(E_US(-1) +E_US(-9) )+0.08*(E_US(-2) +E_US(-8) )+0.12*(E_US(-3) +E_US(-7) )+0.16*(E_US(-4) +E_US(-6) )+0.2*E_US(-5) ) ;
          RR4_US  = (RR_US +RR_US(+1) +RR_US(+2) +RR_US(+3) )/4;
          RR4_BAR_US  = (RR_BAR_US +RR_BAR_US(+1) +RR_BAR_US(+2) +RR_BAR_US(+3) )/4;
          LRR_GAP_US = LRR_US - LRR_BAR_US;
          LRR_US      = lrrw01_US *RR_US
		              + lrrw04_US *RR4_US
					  + lrrw12_US *(RR4_US +RR4_US(+4) +RR4_US(+8) )/3
					  + lrrw20_US *(RR4_US +RR4_US(+4) +RR4_US(+8) +RR4_US(12) +RR4_US(16) )/5;
          LRR_BAR_US  = lrrw01_US *RR_BAR_US
		              + lrrw04_US *RR4_BAR_US
					  + lrrw12_US *(RR4_BAR_US +RR4_BAR_US(+4) +RR4_BAR_US(+8) )/3
					  + lrrw20_US *(RR4_BAR_US +RR4_BAR_US(+4) +RR4_BAR_US(+8) +RR4_BAR_US(12) +RR4_BAR_US(16) )/5;		  
end;

steady_state_model;
// Note that the model has unit roots in PIETAR and the
// steady state for pie is not determined.
BLT_BAR_US=         10.65;
BLT_US=             10.65;
BLT_BAR_EU=             3;
BLT_EU=                 3;
BLT_BAR_JA=             4;
BLT_JA=                 4;
LCPI_EA6=     58.19478381;
LCPI_EU=      29.01755959;
LCPI_JA=      -1.10100714;
LCPI_LA6=    119.54175735;
LCPI_RC6=    132.45203912;
LCPI_US=      36.64229893;
LGDP_BAR_EA6=  92.8659522;
LGDP_BAR_EU=  753.7285114;
LGDP_BAR_JA=1319.88943261;
LGDP_BAR_LA6= 48.63118002;
LGDP_BAR_RC6= 11.93027692;
LGDP_BAR_US= 948.33249637;
LGDP_EA6=      92.8659522;
LGDP_EU=      753.7285114;
LGDP_JA=    1319.88943261;
LGDP_LA6=     48.63118002;
LGDP_RC6=     11.93027692;
LGDP_US=     948.33249637;
LS_EA6=      139.63325594;
LS_EU=       -32.56204508;
LS_JA=       450.70437743;
LS_LA6=     1761.99044765;
LS_RC6=       94.51281089;
LZ_BAR_EA6=  118.08077106;
LZ_BAR_EU=   -24.93730574;
LZ_BAR_JA=    488.4476835;
LZ_BAR_LA6= 1679.09098923;
LZ_BAR_RC6=    -1.2969293;
LZ_EA6=      118.08077106;
LZ_EU=       -24.93730574;
LZ_JA=        488.4476835;
LZ_LA6=     1679.09098923;
LZ_RC6=        -1.2969293;
LZ_E_EA6=    118.08077106;
LZ_E_EU=     -24.93730574;
LZ_E_JA=      488.4476835;
LZ_E_LA6=   1679.09098923;
LZ_E_RC6=      -1.2969293;
REER_M_BAR_EA6=  -116.080912935;
REER_M_BAR_EU=   -160.063683088;
REER_M_BAR_JA=     360.37130427;
REER_M_BAR_LA6=   1625.52464049;
REER_M_BAR_RC6=  -116.151311987;
REER_M_BAR_US=   -322.889129235;
REER_M_EA6=      -116.080912935;
REER_M_EU=       -160.063683088;
REER_M_JA=         360.37130427;
REER_M_LA6=       1625.52464049;
REER_M_RC6=      -116.151311987;
REER_M_US=       -322.889129235;
REER_T_BAR_EA6=  -69.9304731561;
REER_T_BAR_EU=   -141.599985868;
REER_T_BAR_JA=    381.502466206;
REER_T_BAR_LA6=   1643.09919784;
REER_T_BAR_RC6=  -92.8488187296;
REER_T_BAR_US=   -338.234897143;
REER_T_EA6=      -69.9304731561;
REER_T_EU=       -141.599985868;
REER_T_JA=        381.502466206;
REER_T_LA6=       1643.09919784;
REER_T_RC6=      -92.8488187296;
REER_T_US=       -338.234897143;
DOT_LZ_BAR_EA6=       0;
DOT_LZ_BAR_LA6=       0;
DOT_LZ_BAR_RC6=       0;
DOT_REER_M_BAR_EA6=   0;
DOT_REER_M_BAR_EU=    0;
DOT_REER_M_BAR_JA=    0;
DOT_REER_M_BAR_LA6=   0;
DOT_REER_M_BAR_RC6=   0;
DOT_REER_M_BAR_US=    0;
DRS_EA6=              0;
DRS_EU=               0;
DRS_JA=               0;
DRS_LA6=              0;
DRS_RC6=              0;
DRS_US=               0;
E2_EU=                0;
E_EU=                 0;
E2_JA=                0;
E_JA=                 0;
E2_US=                0;
E_US=                 0;
FACT_EA6=             0;
FACT_EU=              0;
FACT_JA=              0;
FACT_LA6=             0;
FACT_RC6=             0;
FACT_US=              0;
GROWTH4_BAR_EA6=  growth_EA6_ss;
GROWTH4_BAR_EU=    growth_EU_ss;
GROWTH4_BAR_JA=    growth_JA_ss;
GROWTH4_BAR_LA6=  growth_LA6_ss;
GROWTH4_BAR_RC6=  growth_RC6_ss;
GROWTH4_BAR_US=    growth_US_ss;
GROWTH4_EA6=      growth_EA6_ss;
GROWTH4_EU=        growth_EU_ss;
GROWTH4_JA=        growth_JA_ss;
GROWTH4_LA6=      growth_LA6_ss;
GROWTH4_RC6=      growth_RC6_ss;
GROWTH4_US=        growth_US_ss;
GROWTH_BAR_EA6=   growth_EA6_ss;
GROWTH_BAR_EU=     growth_EU_ss;
GROWTH_BAR_JA=     growth_JA_ss;
GROWTH_BAR_LA6=   growth_LA6_ss;
GROWTH_BAR_RC6=   growth_RC6_ss;
GROWTH_BAR_US=     growth_US_ss;
GROWTH_EA6=       growth_EA6_ss;
GROWTH_EU=         growth_EU_ss;
GROWTH_JA=         growth_JA_ss;
GROWTH_LA6=       growth_LA6_ss;
GROWTH_RC6=       growth_RC6_ss;
GROWTH_US=         growth_US_ss;
G_EA6=            growth_EA6_ss;
G_EU=              growth_EU_ss;
G_JA=              growth_JA_ss;
G_LA6=            growth_LA6_ss;
G_RC6=            growth_RC6_ss;    
G_US=              growth_US_ss;
LZ_GAP_EA6=                   0;
LZ_GAP_EU=                    0;
LZ_GAP_JA=                    0;
LZ_GAP_LA6=                   0;
LZ_GAP_RC6=                   0;
PIE4_EA6=         pietar_EA6_ss;
PIE4_EU=           pietar_EU_ss;
PIE4_JA=           pietar_JA_ss;
PIE4_LA6=         pietar_LA6_ss;
PIE4_RC6=         pietar_RC6_ss;
PIE4_US=           pietar_US_ss;
PIETAR_EA6=       pietar_EA6_ss;
PIETAR_EU=         pietar_EU_ss;
PIETAR_JA=         pietar_JA_ss;
PIETAR_LA6=       pietar_LA6_ss;
PIETAR_RC6=       pietar_RC6_ss;
PIETAR_US=         pietar_US_ss;
PIE_EA6=          pietar_EA6_ss;
PIE_EU=            pietar_EU_ss;
PIE_JA=            pietar_JA_ss;
PIE_LA6=          pietar_LA6_ss;
PIE_RC6=          pietar_RC6_ss;
PIE_US=            pietar_US_ss;
RESN_RS_EA6=                  0;
RESN_RS_LA6=                  0;
RESN_RS_RC6=                  0;     
RR_BAR_EA6=       rr_bar_EA6_ss;
RR_BAR_EU=         rr_bar_EU_ss;
RR_BAR_JA=         rr_bar_JA_ss;
RR_BAR_LA6=       rr_bar_LA6_ss;
RR_BAR_RC6=       rr_bar_RC6_ss;
RR_BAR_US=         rr_bar_US_ss;
RR_EA6=           rr_bar_EA6_ss;
RR_EU=             rr_bar_EU_ss;
RR_JA=             rr_bar_JA_ss;
RR_LA6=           rr_bar_LA6_ss;
RR_RC6=           rr_bar_RC6_ss;
RR_US=             rr_bar_US_ss;
RR4_US=            rr_bar_US_ss;
RR4_BAR_US=        rr_bar_US_ss;
RR4_EU=            rr_bar_EU_ss;
RR4_BAR_EU=        rr_bar_EU_ss;
RR4_JA=            rr_bar_JA_ss;
RR4_BAR_JA=        rr_bar_JA_ss;
RR4_EA6=          rr_bar_EA6_ss;
RR4_BAR_EA6=      rr_bar_EA6_ss;
RR4_LA6=          rr_bar_LA6_ss;
RR4_BAR_LA6=      rr_bar_LA6_ss;
RR4_RC6=          rr_bar_RC6_ss;
RR4_BAR_RC6=      rr_bar_RC6_ss;
LRR_US=            rr_bar_US_ss;
LRR_BAR_US=        rr_bar_US_ss;
LRR_EU=            rr_bar_EU_ss;
LRR_BAR_EU=        rr_bar_EU_ss;
LRR_JA=            rr_bar_JA_ss;
LRR_BAR_JA=        rr_bar_JA_ss;
LRR_EA6=          rr_bar_EA6_ss;
LRR_BAR_EA6=      rr_bar_EA6_ss;
LRR_LA6=          rr_bar_LA6_ss;
LRR_BAR_LA6=      rr_bar_LA6_ss;
LRR_RC6=          rr_bar_RC6_ss;
LRR_BAR_RC6=      rr_bar_RC6_ss;
LRR_GAP_US=                   0;
LRR_GAP_EU=                   0;
LRR_GAP_JA=                   0;
LRR_GAP_EA6=                  0;
LRR_GAP_LA6=                  0;
LRR_GAP_RC6=                  0;
RS_EA6=pietar_EA6_ss+rr_bar_EA6_ss;
RS_EU=   pietar_EU_ss+rr_bar_EU_ss;
RS_JA=   pietar_JA_ss+rr_bar_JA_ss;
RS_LA6=pietar_LA6_ss+rr_bar_LA6_ss;
RS_RC6=pietar_RC6_ss+rr_bar_RC6_ss;
RS_US=   pietar_US_ss+rr_bar_US_ss;
UNR_BAR_EU=             9.9;
UNR_BAR_JA=      4.93444444;
UNR_BAR_US=             9.7;
UNR_EU=                 9.9;
UNR_JA=          4.93444444;
UNR_US=                 9.7;
UNR_GAP_EU=               0;
UNR_GAP_JA=               0;
UNR_GAP_US=               0;
UNR_G_EU=                 0;
UNR_G_JA=                 0;
UNR_G_US=                 0;
Y_EA6=                    0;
Y_EU=                     0;
Y_JA=                     0;
Y_LA6=                    0;
Y_RC6=                    0;
Y_US=                     0;
FACT_RES_US=              0;
FACT_RES_EU=              0;
FACT_RES_JA=              0;
FACT_RES_EA6=             0;
FACT_RES_LA6=             0;
FACT_RES_RC6=             0;
RESN_YY_US=               0;
RESN_YY_EU=               0;
RESN_YY_JA=               0;
RESN_YY_EA6=              0;
RESN_YY_LA6=              0;
RESN_YY_RC6=              0;
RESN_Y_US=                0;
RESN_Y_EU=                0;
RESN_Y_JA=                0;
RESN_Y_EA6=               0;
RESN_Y_LA6=               0;
RESN_Y_RC6=               0;
E2_EA6=                   0;
E2_LA6=                   0;
E2_RC6=                   0;
RESN_RR_DIFF_EA6=         0;
RESN_RR_DIFF_EU=          0;
RESN_RR_DIFF_JA=          0;
RESN_RR_DIFF_LA6=         0;
RESN_RR_DIFF_RC6=         0;
E1_PIE_EA6=   pietar_EA6_ss;
E1_PIE_EU=     pietar_EU_ss;
E1_PIE_JA=     pietar_JA_ss;
E1_PIE_LA6=   pietar_LA6_ss;
E1_PIE_RC6=   pietar_RC6_ss;
E1_PIE_US=     pietar_US_ss;
E4_PIE4_EA6=   pietar_EA6_ss;
E4_PIE4_EU=     pietar_EU_ss;
E4_PIE4_JA=     pietar_JA_ss;
E4_PIE4_LA6=   pietar_LA6_ss;
E4_PIE4_RC6=   pietar_RC6_ss;
E4_PIE4_US=     pietar_US_ss;
E3_PIE4_EA6=   pietar_EA6_ss;
E3_PIE4_EU=     pietar_EU_ss;
E3_PIE4_JA=     pietar_JA_ss;
E3_PIE4_LA6=   pietar_LA6_ss;
E3_PIE4_RC6=   pietar_RC6_ss;
E3_PIE4_US=     pietar_US_ss;
E1_Y_EA6=                 0;
E1_Y_EU=                  0;
E1_Y_JA=                  0;
E1_Y_LA6=                 0;
E1_Y_RC6=                 0;
E1_Y_US=                  0;
E4_Y_EA6=                 0;
E4_Y_EU=                  0;
E4_Y_JA=                  0;
E4_Y_LA6=                 0;
E4_Y_RC6=                 0;
E4_Y_US=                  0;
E8_Y_EA6=                 0;
E8_Y_EU=                  0;
E8_Y_JA=                  0;
E8_Y_LA6=                 0;
E8_Y_RC6=                 0;
E8_Y_US=                  0;
REER_T_GAP_EA6=           0;
REER_T_GAP_EU=            0;
REER_T_GAP_JA=            0;
REER_T_GAP_LA6=           0;
REER_T_GAP_RC6=           0;
REER_T_GAP_US=            0;
DOT_REER_M_EA6=           0;
DOT_REER_M_EU=            0;
DOT_REER_M_JA=            0;
DOT_REER_M_LA6=           0;
DOT_REER_M_RC6=           0;
DOT_REER_M_US=            0;

end;

shocks;  // posterior mode of SD
var RES_DOT_LZ_BAR_EA6; stderr  0.099353643;
var RES_PIETAR_EA6;     stderr    0.2396159;
var RES_G_EA6;          stderr   0.34791934;
var RES_LGDP_BAR_EA6;   stderr  0.089731653;
var RES_LZ_BAR_EA6;     stderr    1.4595744;
var RES_PIE_EA6;        stderr    1.0600479;
var RES_RR_BAR_EA6;     stderr   0.18400587;
var RES_RR_DIFF_EA6;    stderr    0.3974929;
var RES_RS_EA6;         stderr   0.44653574;
var RES_Y_EA6;          stderr   0.42707092;
var RES_BLT_BAR_EU;     stderr       0.0921;
var RES_G_EU;           stderr  0.077146847;
var RES_BLT_EU;         stderr       0.8582;
var RES_LGDP_BAR_EU;    stderr   0.19801062;
var RES_LZ_BAR_EU;      stderr     5.912451;
var RES_PIE_EU;         stderr    1.2677701;
var RES_RR_BAR_EU;      stderr   0.18906575;
var RES_RR_DIFF_EU;     stderr    2.6939031;
var RES_RS_EU;          stderr   0.24256049;
var RES_UNR_BAR_EU;     stderr  0.034568337;
var RES_UNR_G_EU;       stderr  0.031454555;
var RES_UNR_GAP_EU;     stderr  0.050564811;
var RES_Y_EU;           stderr   0.40701937;
var RES_BLT_BAR_JA;     stderr       0.0921;
var RES_G_JA;           stderr  0.070374038;
var RES_BLT_JA;         stderr       0.8582;
var RES_LGDP_BAR_JA;    stderr   0.55722796;
var RES_LZ_BAR_JA;      stderr    4.2366707;
var RES_PIE_JA;         stderr   0.87417705;
var RES_RR_BAR_JA;      stderr   0.17081903;
var RES_RR_DIFF_JA;     stderr   0.23611706;
var RES_RS_JA;          stderr   0.15852118;
var RES_UNR_BAR_JA;     stderr  0.047943025;
var RES_UNR_G_JA;       stderr  0.045203192;
var RES_UNR_GAP_JA;     stderr  0.089843055;
var RES_Y_JA;           stderr    0.3696468;
var RES_DOT_LZ_BAR_LA6; stderr  0.099273291;
var RES_PIETAR_LA6;     stderr   0.77354787;
var RES_G_LA6;          stderr   0.20339845;
var RES_LGDP_BAR_LA6;   stderr  0.096131329;
var RES_LZ_BAR_LA6;     stderr    3.7339192;
var RES_PIE_LA6;        stderr    2.0863281;
var RES_RR_BAR_LA6;     stderr    0.5051091;
var RES_RR_DIFF_LA6;    stderr    1.6574864;
var RES_RS_LA6;         stderr   0.38073661;
var RES_Y_LA6;          stderr   0.44125989;
var RES_DOT_LZ_BAR_RC6; stderr  0.099196996;
var RES_PIETAR_RC6;     stderr   0.41540098;
var RES_G_RC6;          stderr  0.048505686;
var RES_LGDP_BAR_RC6;   stderr  0.094672238;
var RES_LZ_BAR_RC6;     stderr    2.6651443;
var RES_PIE_RC6;        stderr    1.3712129;
var RES_RR_BAR_RC6;     stderr   0.18099423;
var RES_RR_DIFF_RC6;    stderr   0.67695256;
var RES_RS_RC6;         stderr   0.44647719;
var RES_Y_RC6;          stderr   0.48555677;
var RES_BLT_BAR_US;     stderr       0.0922;
var RES_G_US;           stderr       0.2931;
var RES_BLT_US;         stderr       0.9487;
var RES_LGDP_BAR_US;    stderr       0.0291;
var RES_PIE_US;         stderr    1.3831225;
var RES_RR_BAR_US;      stderr    1.1771827;
var RES_RS_US;          stderr   0.25384285;
var RES_UNR_BAR_US;     stderr   0.04628641;
var RES_UNR_G_US;       stderr  0.043001755;
var RES_UNR_GAP_US;     stderr   0.09887428;
var RES_Y_US;           stderr   0.41456413;
var RES_YY_US;          stderr   0.28915748;
var RES_YY_EU;          stderr   0.28264302;
var RES_YY_JA;          stderr   0.26178082;
var RES_YY_EA6;         stderr   0.29690676;
var RES_YY_LA6;         stderr   0.30749163;
var RES_YY_RC6;         stderr   0.32534853;
corr RES_G_US,RES_BLT_US =           0.8759;
corr RES_LGDP_BAR_US,RES_PIE_US =    0.0915;  
corr RES_LGDP_BAR_JA,RES_PIE_JA =    0.0917; 
corr RES_LGDP_BAR_EU,RES_PIE_EU =    0.0961;
corr RES_LGDP_BAR_EA6,RES_PIE_EA6 =     0.1;
corr RES_LGDP_BAR_LA6,RES_PIE_LA6 =     0.1;
corr RES_LGDP_BAR_RC6,RES_PIE_RC6 =     0.1;
corr RES_Y_JA,RES_G_JA =             0.2156;  
corr RES_Y_EU,RES_G_EU =             0.2476;
corr RES_Y_EA6,RES_G_EA6 =             0.25;
corr RES_Y_LA6,RES_G_LA6 =             0.25;
corr RES_Y_RC6,RES_G_RC6 =             0.25;
end;

// The Dynare is asked not to check the steady state values because this model
// contains nonstationary variables.
steady(nocheck);

/*
stoch_simul(order=1,irf=40,nodisplay,nograph)
 Y_EU Y_JA Y_US Y_EA6 Y_LA6 Y_RC6
 PIE_EU PIE_JA PIE_US PIE_EA6 PIE_LA6 PIE_RC6
 PIE4_EU PIE4_JA PIE4_US PIE4_EA6 PIE4_LA6 PIE4_RC6
 DRS_EU DRS_JA DRS_US DRS_EA6 DRS_LA6 DRS_RC6
 DEL_PIE4_EA6
*/

//stoch_simul(order=1,irf=40,irf_shocks=(RES_Y_US,RES_BLT_US,RES_YY_US,RES_PIE_US,RES_RS_US))
//Y_US PIE_US RS_US RR_US LRR_US FACT_US REER_T_US BLT_US
//Y_US Y_EU Y_JA Y_LA6 Y_EA6 Y_RC6 

//stoch_simul(order=1,irf=40,irf_shocks=(RES_Y_EA6, RES_PIE_EA6,RES_RS_EA6,RES_YY_EA6))
//Y_EA6 PIE_EA6 RS_EA6 RR_EA6 LRR_EA6 FACT_EA6 REER_T_EA6 REER_T_GAP_EA6 
//Y_US Y_EU Y_JA Y_LA6 Y_EA6 Y_RC6 

stoch_simul(order=1,irf=40,irf_shocks=(RES_Y_US,RES_Y_EU,RES_Y_JA,RES_Y_LA6,RES_Y_RC6), nograph)
//Y_US Y_EU Y_JA Y_LA6 Y_EA6 Y_RC6 

;


