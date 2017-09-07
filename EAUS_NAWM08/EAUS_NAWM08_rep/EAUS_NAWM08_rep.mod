//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: EAUS_NAWM08

// Further references: Coenen, Günter & McAdam, Peter & Straub, Roland, 2008.
// 		       "Tax reform and labour-market performance in the euro 
//		       area: A simulation-based analysis using the New Area-
//     		       Wide Model," Journal of Economic Dynamics and Control,
//		       Elsevier, vol. 32(8), pages 2543-2583, August.
// 

// Last edited: 10/02/11 by M. Burgert

var EAUS_RER EA_B EA_BF EA_BY EA_C EA_CI EA_CJ EA_CY EA_D EA_EPSILONM EA_FH EA_FI 
  EA_FJ EA_FX EA_G EA_GAMMAB EA_GAMMAI EA_GAMMAIDER EA_GAMMAIMC EA_GAMMAIMCDAG 
  EA_GAMMAIMI EA_GAMMAIMIDAG EA_GAMMAU EA_GAMMAUDER EA_GAMMAV EA_GAMMAVI 
  EA_GAMMAVIDER EA_GAMMAVJ EA_GAMMAVJDER EA_GH EA_GI EA_GJ EA_GX EA_GY EA_H 
  EA_HC EA_HI EA_I EA_II EA_IM EA_IMC EA_IMCY EA_IMI EA_IMIY EA_IMY EA_IY EA_K 
  EA_KD EA_KI EA_LAMBDAI EA_LAMBDAJ EA_M EA_MC EA_MI EA_MJ EA_ND EA_NDI EA_NDJ 
  EA_NI EA_NJ EA_PH EA_PHTILDE EA_PI EA_PIC EA_PIC4 EA_PIH EA_PIIM EA_PIM 
  EA_PIMTILDE EA_PY EA_Q EA_QC EA_QI EA_R EA_RER EA_RERDEP EA_RK EA_RP EA_RR 
  EA_RRSTAR EA_SH EA_SI EA_SJ EA_SX EA_T EA_TAUC EA_TAUD EA_TAUK EA_TAUN 
  EA_TAUWF EA_TAUWH EA_TB EA_TI EA_TJ EA_TOT EA_TR EA_TRI EA_TRJ EA_TRY EA_TY 
  EA_U EA_UTILI EA_UTILJ EA_VI EA_VJ EA_W EA_WI EA_WITILDE EA_WJ EA_WJTILDE EA_Y
   EA_YGAP EA_YGROWTH EA_YS EA_YSHARE EA_Z USEA_RER US_B US_BF US_BY US_C US_CI 
  US_CJ US_CY US_D US_EPSILONM US_FH US_FI US_FJ US_FX US_G US_GAMMAI 
  US_GAMMAIDER US_GAMMAIMC US_GAMMAIMCDAG US_GAMMAIMI US_GAMMAIMIDAG US_GAMMAU 
  US_GAMMAUDER US_GAMMAV US_GAMMAVI US_GAMMAVIDER US_GAMMAVJ US_GAMMAVJDER US_GH
   US_GI US_GJ US_GX US_GY US_H US_HC US_HI US_I US_II US_IM US_IMC US_IMCY 
  US_IMI US_IMIY US_IMY US_IY US_K US_KD US_KI US_LAMBDAI US_LAMBDAJ US_M US_MC 
  US_MI US_MJ US_ND US_NDI US_NDJ US_NI US_NJ US_PH US_PHTILDE US_PI US_PIC 
  US_PIC4 US_PIH US_PIIM US_PIM US_PIMTILDE US_PY US_Q US_QC US_QI US_R  
  US_RK US_RR US_RRSTAR US_SH US_SI US_SJ US_SX US_T US_TAUC US_TAUD US_TAUK 
  US_TAUN US_TAUWF US_TAUWH US_TI US_TJ US_TR US_TRI US_TRJ US_TRY US_TY US_U 
  US_UTILI US_UTILJ US_VI US_VJ US_W US_WI US_WITILDE US_WJ US_WJTILDE US_Y 
  US_YGAP US_YGROWTH US_YS US_YSHARE US_Z;


//**************************************************************************
// Modelbase Variables                                                   //*
//        interest
//         inflation inflationq outputgap output fispol;                   //*

//**************************************************************************

 
varexo EA_EPSG EA_EPSR EA_EPSRP EA_EPSTAUC EA_EPSTAUD EA_EPSTAUK EA_EPSTAUN 
  EA_EPSTAUWF EA_EPSTAUWH EA_EPSTR EA_EPSZ  
  US_EPSG US_EPSR US_EPSTAUC US_EPSTAUD US_EPSTAUK 
  US_EPSTAUN US_EPSTAUWF US_EPSTAUWH US_EPSTR US_EPSZ ;

//**************************************************************************
// Modelbase Shocks                                                      //*       
//       interest_ fiscal_;                                              //*
//**************************************************************************



parameters EA_ALPHA EA_BETA EA_BFYTARGET EA_BYTARGET EA_CHIH EA_CHII EA_CHIJ EA_CHIX 
  EA_DELTA EA_ETA EA_ETAI EA_ETAJ EA_GAMMAB1 EA_GAMMAI1 EA_GAMMAIMC1 
  EA_GAMMAIMI1 EA_GAMMAU2 EA_GAMMAV1 EA_GAMMAV2 EA_KAPPA EA_MUC EA_MUI EA_NUC 
  EA_NUI EA_OMEGA EA_PHIRGY EA_PHIRPI EA_PHIRR EA_PHITB EA_PI4TARGET EA_PSI 
  EA_RHOG EA_RHORP EA_RHOTAUC EA_RHOTAUD EA_RHOTAUK EA_RHOTAUN EA_RHOTAUWF 
  EA_RHOTAUWH EA_RHOTR EA_RHOZ EA_SIGMA EA_SIZE EA_THETA EA_XIH EA_XII EA_XIJ 
  EA_XIX EA_ZETA US_ALPHA US_BETA US_BYTARGET US_CHIH US_CHII US_CHIJ US_CHIX 
  US_DELTA US_ETA US_ETAI US_ETAJ US_GAMMAI1 US_GAMMAIMC1 US_GAMMAIMI1 
  US_GAMMAU2 US_GAMMAV1 US_GAMMAV2 US_KAPPA US_MUC US_MUI US_NUC US_NUI US_OMEGA
  US_PHIRGY US_PHIRPI US_PHIRR US_PHITB US_PI4TARGET US_PSI US_RHOG US_RHOTAUC 
  US_RHOTAUD US_RHOTAUK US_RHOTAUN US_RHOTAUWF US_RHOTAUWH US_RHOTR US_RHOZ 
  US_SIGMA US_SIZE US_THETA US_XIH US_XII US_XIJ US_XIX US_ZETA
    
 // exogenous variables in original code transformed into parameters 

  EA_GYBAR EA_PIBAR EA_PSIBAR EA_PYBAR 
  EA_QBAR EA_TAUCBAR EA_TAUDBAR EA_TAUKBAR EA_TAUNBAR EA_TAUWFBAR EA_TAUWHBAR 
  EA_TRYBAR EA_YBAR EA_ZBAR
  US_GYBAR US_PIBAR 
  US_PSIBAR US_PYBAR US_QBAR US_TAUCBAR US_TAUDBAR US_TAUKBAR US_TAUNBAR 
  US_TAUWFBAR US_TAUWHBAR US_TRYBAR US_YBAR US_ZBAR

// parameters to be added compared to original code
  EA_UPSILONT EA_UPSILONTR
  US_UPSILONT US_UPSILONTR US_RER ;

//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
//        cofintintb1 cofintintb2 cofintintb3 cofintintb4                //*
//        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4     //*
//        cofintinff1 cofintinff2 cofintinff3 cofintinff4                //*
//        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4      //*
//        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                //*
//        std_r_ std_r_quart                                             //*
//      coffispol;                                                       //*
                                                                         //*
//**************************************************************************

// --------------------------- //
// PARAMETER VALUES: EURO AREA //
// --------------------------- //

// COUNTRY SIZE (POPULATION)

EA_SIZE        = 0.4194;

// SIZE OF HOUSEHOLD J

EA_OMEGA       = 0.25;

// PREFERENCES

EA_BETA        = 0.992638;

EA_SIGMA       = 2.00;
EA_KAPPA       = 0.60;
EA_ZETA        = 2.00;

// CAPITAL ACCUMULATION

EA_DELTA       = 0.025;

// WAGE SETTING

EA_ETA         = 6.00;
EA_ETAI        = 6.00;
EA_ETAJ        = 6.00;

EA_XII         = 0.75;
EA_XIJ         = 0.75;
EA_CHII        = 0.75;
EA_CHIJ        = 0.75;

// MONEY DEMAND

//EA_VI          = 0.75;
//EA_EPSILONM    =-0.75;

// INTERMEDIATE-GOOD TECHNOLOGY

EA_ALPHA       = 0.30;
EA_PSI         = 0.20;

// PRICE SETTING

EA_THETA       = 6.00;

EA_XIH         = 0.90;
EA_XIX         = 0.30;
EA_CHIH        = 0.50;
EA_CHIX        = 0.50;

// FINAL-GOOD TECHNOLOGIES

EA_NUC         = 0.919622;
EA_MUC         = 1.5;

EA_NUI         = 0.418629;
EA_MUI         = 1.5;

// EXPENDITURE SHARES

//EA_IY          = 0.22;
//EA_IMCY        = 0.13;
//EA_IMIY        = 0.05;

// ADJUSTMENT AND TRANSACTION COST

EA_GAMMAV1     = 0.289073;
EA_GAMMAV2     = 0.150339;

EA_GAMMAI1     = 3.00;

EA_GAMMAU1     = 0.032765;
EA_GAMMAU2     = 0.007;

EA_GAMMAIMC1   = 2.50;
EA_GAMMAIMI1   = 0.00;

EA_GAMMAB1     = 0.01;

// FISCAL POLICY

EA_BYTARGET    = 2.40;

EA_PHITB       = 0.10;

EA_GYBAR       = 0.18;
EA_TRYBAR      = 0.195161;
EA_TAUCBAR     = 0.183;
EA_TAUKBAR     = 0.184123;
EA_TAUNBAR     = 0.122;
EA_TAUWHBAR    = 0.118;
EA_TAUWFBAR    = 0.219;

EA_UPSILONT    = 1.20;
EA_UPSILONTR   = 2/3;

// MONETARY POLICY

EA_PI4TARGET   = 1.02;

EA_PHIRR       = 0.95;
EA_PHIRPI      = 2.00;
EA_PHIRGY      = 0.10;
EA_interest_EXOG=EA_BETA^(-1)*EA_PI4TARGET^(1/4);

// NET FOREIGN ASSET POSITION

EA_BFYTARGET   = 0.00;

// AUTOREGRESSIVE SHOCKS

EA_RHOZ        = 0.90;
EA_RHOR        = 0.90;
EA_RHOG        = 0.90;
EA_RHOTR       = 0.90;
EA_RHOTAUC     = 0.90;
EA_RHOTAUK     = 0.90;
EA_RHOTAUN     = 0.90;
EA_RHOTAUD     = 0.90;
EA_RHOTAUWH    = 0.90;
EA_RHOTAUWF    = 0.90;


EA_PYBAR =1.00645740523434;
EA_YBAR = 3.62698111871356;
EA_RHORP = 0.9;  
EA_PIBAR = 0.961117319822928;    
EA_PSIBAR = 0.725396223742712;
EA_QBAR = 0.961117319822928; 
EA_TAUDBAR = 0; 
EA_ZBAR = 1;


// --------------------------------- //
// PARAMETER VALUES: UNITED STATES   //
// --------------------------------- //

// COUNTRY SIZE (POPULATION)

US_SIZE        = 0.5806;

// SIZE OF HOUSEHOLD J

US_OMEGA       = 0.25;

// PREFERENCES

US_BETA        = 0.992638;

US_SIGMA       = 2.00;
US_KAPPA       = 0.60;
US_ZETA        = 2.00;

// CAPITAL ACCUMULATION

US_DELTA       = 0.025;

// WAGE SETTING

US_ETA         = 6.00;
US_ETAI        = 6.00;
US_ETAJ        = 6.00;

US_XII         = 0.75;
US_XIJ         = 0.75;
US_CHII        = 0.75;
US_CHIJ        = 0.75;

// MONEY DEMAND

//US_VI          = 2.38;
//US_EPSILONM    =-0.75;

// INTERMEDIATE-GOOD TECHNOLOGY

US_ALPHA       = 0.30;
US_PSI         = 0.20;

// PRICE SETTING

US_THETA       = 6.00;

US_XIH         = 0.90;
US_XIX         = 0.30;
US_CHIH        = 0.50;
US_CHIX        = 0.50;

// FINAL-GOOD TECHNOLOGIES

US_NUC         = 0.899734;
US_MUC         = 1.5;

US_NUI         = 0.673228;
US_MUI         = 1.5;

// EXPENDITURE SHARES

//US_IY          = 0.22;
//US_IMCY        = 0.06;
//US_IMIY        = 0.07;

// ADJUSTMENT AND TRANSACTION COST

US_GAMMAV1     = 0.028706;
US_GAMMAV2     = 0.150339;

US_GAMMAI1     = 3.00;

US_GAMMAU1     = 0.034697;
US_GAMMAU2     = 0.007;

US_GAMMAIMC1   = 2.50;
US_GAMMAIMI1   = 0.00;

US_GAMMAB1     = 0.01;

// FISCAL POLICY

US_BYTARGET    = 2.40;

US_PHITB       = 0.10;

US_GYBAR       = 0.16;
US_TRYBAR      = 0.079732;
US_TAUCBAR     = 0.077;
US_TAUKBAR     = 0.184123;
US_TAUNBAR     = 0.154;
US_TAUWHBAR    = 0.071;
US_TAUWFBAR    = 0.071;

US_UPSILONT    = 1.20;
US_UPSILONTR   = 2/3;

// MONETARY POLICY

US_PI4TARGET   = 1.02;

US_PHIRR       = 0.95;
US_PHIRPI      = 2.00;
US_PHIRGY      = 0.10;
US_interest_EXOG=US_BETA^(-1)*US_PI4TARGET^(1/4);

// AUTOREGRESSIVE SHOCKS

US_RHOZ        = 0.90;
US_RHOR        = 0.90;
US_RHOG        = 0.90;
US_RHOTR       = 0.90;
US_RHOTAUC     = 0.90;
US_RHOTAUK     = 0.90;
US_RHOTAUN     = 0.90;
US_RHOTAUD     = 0.90;
US_RHOTAUWH    = 0.90;
US_RHOTAUWF    = 0.90;

US_PYBAR = 0.992282866960427;
US_TAUDBAR = 0;
US_YBAR = 3.92445610588497;

US_PIBAR = 1.01776829477927;
US_PSIBAR = 0.784891221176995;
US_QBAR = 1.01776829477927; 
US_ZBAR = 1;

US_RER=1;


//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
//	thispath = cd;                                                       //*
//	cd('..');                                                            //*
//	load policy_param.mat;                                               //*
//	cd(thispath);                                                     	 //*
// std_r_ = 1;                                                              //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
//coffispol = 1/(EA_PYBAR);                                                //*
//**************************************************************************

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*
//                                                                        //*
//interest   = (EA_R^4-EA_interest_EXOG^4)/EA_interest_EXOG^4;          //*
//inflation  = (EA_PIC4-EA_PI4TARGET)/EA_PI4TARGET;                     //*
//inflationq = (EA_PIC^4-EA_PI4TARGET)/EA_PI4TARGET;                    //*
//outputgap  = EA_YGAP;                                                 //*
//output     = (EA_Y/EA_YBAR);                                          //*
//fispol     = EA_EPSG;                                                     //*
//**************************************************************************



//**************************************************************************                                                                    
// Policy Rule for the euro area                                          //*
                                                                          //*
// Monetary Policy                                                        //*
                                                                          //*
//interest =   cofintintb1*interest(-1)                                     //* 
//           + cofintintb2*interest(-2)                                     //* 
//           + cofintintb3*interest(-3)                                     //* 
//           + cofintintb4*interest(-4)                                     //* 
//           + cofintinf0*inflationq                                        //* 
//           + cofintinfb1*inflationq(-1)                                   //* 
//           + cofintinfb2*inflationq(-2)                                   //* 
//           + cofintinfb3*inflationq(-3)                                   //* 
//           + cofintinfb4*inflationq(-4)                                   //* 
//           + cofintinff1*inflationq(+1)                                   //* 
//           + cofintinff2*inflationq(+2)                                   //* 
//           + cofintinff3*inflationq(+3)                                   //* 
//           + cofintinff4*inflationq(+4)                                   //* 
//           + cofintout*outputgap 	                                        //* 
//           + cofintoutb1*outputgap(-1)                                    //* 
//           + cofintoutb2*outputgap(-2)                                    //* 
//           + cofintoutb3*outputgap(-3)                                    //* 
//           + cofintoutb4*outputgap(-4)                                    //* 
//           + cofintoutf1*outputgap(+1)                                    //* 
//           + cofintoutf2*outputgap(+2)                                    //* 
//           + cofintoutf3*outputgap(+3)                                    //* 
//          + cofintoutf4*outputgap(+4)                                     //* 
//           + std_r_ *interest_;                                           //* 
                                                                          //*
// Discretionary Government Spending                                      //*
                                                                          //*
//fispol = EA_PY*coffispol*fiscal_;                                         //*
//**************************************************************************

//**************************************************************************                                                                    
// Policy Rule for United States                                          //*
                                                                          //*
// Monetary Policy                                                        //*
                                                                          //*
//(US_R^4-US_interest_EXOG^4)/US_interest_EXOG^4 =                      //*
//             cofintintb1*((US_R(-1))^4-US_interest_EXOG^4)/US_interest_EXOG^4  //* 
//           + cofintintb2*((US_R(-2))^4-US_interest_EXOG^4)/US_interest_EXOG^4  //* 
//           + cofintintb3*((US_R(-3))^4-US_interest_EXOG^4)/US_interest_EXOG^4  //* 
//           + cofintintb4*((US_R(-4))^4-US_interest_EXOG^4)/US_interest_EXOG^4  //* 
//           + cofintinf0*(US_PIC^4-US_PI4TARGET)/US_PI4TARGET          //* 
//           + cofintinfb1*((US_PIC(-1))^4-US_PI4TARGET)/US_PI4TARGET   //* 
//           + cofintinfb2*((US_PIC(-2))^4-US_PI4TARGET)/US_PI4TARGET   //* 
//           + cofintinfb3*((US_PIC(-3))^4-US_PI4TARGET)/US_PI4TARGET   //* 
//           + cofintinfb4*((US_PIC(-4))^4-US_PI4TARGET)/US_PI4TARGET   //* 
//           + cofintinff1*((US_PIC(+1))^4-US_PI4TARGET)/US_PI4TARGET   //* 
//           + cofintinff2*((US_PIC(+2))^4-US_PI4TARGET)/US_PI4TARGET   //* 
//           + cofintinff3*((US_PIC(+3))^4-US_PI4TARGET)/US_PI4TARGET   //* 
//           + cofintinff4*((US_PIC(+4))^4-US_PI4TARGET)/US_PI4TARGET   //* 
//           + cofintout*US_YGAP                                            //* 
//           + cofintoutb1*US_YGAP(-1)                                      //* 
//           + cofintoutb2*US_YGAP(-2)                                      //* 
//           + cofintoutb3*US_YGAP(-3)                                      //* 
//           + cofintoutb4*US_YGAP(-4)                                      //* 
//           + cofintoutf1*US_YGAP(+1)                                      //* 
//           + cofintoutf2*US_YGAP(+2)                                      //* 
//           + cofintoutf3*US_YGAP(+3)                                      //* 
//          + cofintoutf4*US_YGAP(+4);                                      //*           
                                                                          //*
//**************************************************************************


// Original Model Code:
// Original monetary policy rule for EA and US (Coenen, McAdams and Straub (2008)) 
EA_R^4-1 = EA_PHIRR*(EA_R(-1)^4-1)+(1-EA_PHIRR)*(EA_RRSTAR^4*EA_PI4TARGET-1+EA_PHIRPI*(EA_PIC4-EA_PI4TARGET))+EA_PHIRGY*(EA_Y/EA_Y(-1)-1)+EA_EPSR ;
US_R^4-1 = US_PHIRR*(US_R(-1)^4-1)+(1-US_PHIRR)*(US_RRSTAR^4*US_PI4TARGET-1+US_PHIRPI*(US_PIC4-US_PI4TARGET))+US_PHIRGY*(US_Y/US_Y(-1)-1)+US_EPSR ; //Taylor rule

// Model equations Euro area

//Households
//Household I

EA_UTILI = (1/(1-EA_SIGMA)*(EA_CI-EA_KAPPA*EA_CI(-1))^(1-EA_SIGMA)-1/(1+EA_ZETA)*EA_NI^(1+EA_ZETA)+EA_BETA*EA_UTILI(+1)) ;      // Value function of HH I (Bellman)
EA_LAMBDAI*(1+EA_TAUC+EA_GAMMAVI+EA_VI*EA_GAMMAVIDER) = (EA_CI-EA_KAPPA*EA_CI(-1))^(-EA_SIGMA) ;                                // equation (4), FOC with respect to consumption
EA_R = EA_BETA^(-1)*EA_LAMBDAI/EA_LAMBDAI(+1)*EA_PIC(+1) ;                                                                      // equation (8), FOC with respect to bonds
EA_VI^2*EA_GAMMAVIDER = 1-EA_BETA*EA_LAMBDAI(+1)/(EA_LAMBDAI*EA_PIC(+1)) ;                                                      // equation (10), FOC with respect to money
EA_VI = (1+EA_TAUC)*EA_CI/EA_MI ;                                                                                               // consumption based velocity 
EA_GAMMAVI = EA_GAMMAV1*EA_VI+EA_GAMMAV2/EA_VI-2*(EA_GAMMAV1*EA_GAMMAV2)^(1/2) ;                                                // transaction cost
EA_GAMMAVIDER = EA_GAMMAV1-EA_GAMMAV2*EA_VI^(-2) ;                                                                              // derivative of transaction cost
EA_KI = (1-EA_DELTA)*EA_KI(-1)+(1-EA_GAMMAI(-1))*EA_II(-1) ;                                                                    // capital accumulation 
EA_GAMMAI = EA_GAMMAI1/2*(EA_II/EA_II(-1)-1)^2 ;                                                                                // investment adjustment cost
EA_GAMMAIDER = EA_GAMMAI1*(EA_II/EA_II(-1)-1)/EA_II(-1) ;                                                                       // derivative of investment adjustment cost
EA_GAMMAU = ((EA_BETA^(-1)-1+EA_DELTA)*EA_QBAR-EA_DELTA*EA_TAUKBAR*EA_PIBAR)/((1-EA_TAUKBAR)*EA_PIBAR)*(EA_U-1)+EA_GAMMAU2/2*(EA_U-1)^2 ; //capital utilisation cost
EA_GAMMAUDER = ((EA_BETA^(-1)-1+EA_DELTA)*EA_QBAR-EA_DELTA*EA_TAUKBAR*EA_PIBAR)/((1-EA_TAUKBAR)*EA_PIBAR)+EA_GAMMAU2*(EA_U-1) ; //derivative capital utilisation cost
EA_RK = EA_GAMMAUDER*EA_PI ;                                                                                                    //equation (7), FOC with respect to utilization rate
EA_PI = EA_Q*(1-EA_GAMMAI-EA_GAMMAIDER*EA_II)+EA_BETA*EA_LAMBDAI(+1)/EA_LAMBDAI*EA_Q(+1)*EA_GAMMAIDER(+1)*EA_II(+1)^2/EA_II ;   //equation (5), FOC with respect to investment
EA_Q = EA_BETA*EA_LAMBDAI(+1)/EA_LAMBDAI*((1-EA_TAUK(+1))*(EA_RK(+1)*EA_U(+1)-EA_GAMMAU(+1)*EA_PI(+1))+EA_TAUK(+1)*EA_DELTA*EA_PI(+1)+(1-EA_DELTA)*EA_Q(+1)) ; //equation (6), FOC with respect to capital
EA_WITILDE^(1+EA_ETAI*EA_ZETA) = EA_ETAI/(EA_ETAI-1)*EA_FI/EA_GI ;
EA_FI = EA_WI^(EA_ETAI*(1+EA_ZETA))*EA_NDI^(1+EA_ZETA)+EA_XII*EA_BETA*(EA_PIC(+1)/(EA_PIC^EA_CHII*EA_PI4TARGET^(1/4*(1-EA_CHII))))^(EA_ETAI*(1+EA_ZETA))*EA_FI(+1) ;
EA_GI = EA_LAMBDAI*(1-EA_TAUN-EA_TAUWH)*EA_WI^EA_ETAI*EA_NDI+EA_XII*EA_BETA*(EA_PIC(+1)/(EA_PIC^EA_CHII*EA_PI4TARGET^(1/4*(1-EA_CHII))))^(EA_ETAI-1)*EA_GI(+1) ;
EA_WI^(1-EA_ETAI) = (1-EA_XII)*EA_WITILDE^(1-EA_ETAI)+EA_XII*EA_WI(-1)^(1-EA_ETAI)*(EA_PIC(-1)^EA_CHII*EA_PI4TARGET^(1/4*(1-EA_CHII))/EA_PIC)^(1-EA_ETAI) ;

//Household J

EA_UTILJ = (1/(1-EA_SIGMA)*(EA_CJ-EA_KAPPA*EA_CJ(-1))^(1-EA_SIGMA)-1/(1+EA_ZETA)*EA_NJ^(1+EA_ZETA)+EA_BETA*EA_UTILJ(+1)) ;      // Value function of HH J (Bellman)
(1+EA_TAUC+EA_GAMMAVJ)*EA_CJ+EA_MJ = (1-EA_TAUN-EA_TAUWH)*EA_WJ*EA_NJ+EA_TRJ-EA_TJ+EA_MJ(-1)*EA_PIC^(-1) ;                      // budget constraint for household J, eq. 14
EA_LAMBDAJ*(1+EA_TAUC+EA_GAMMAVJ+EA_VJ*EA_GAMMAVJDER) = (EA_CJ-EA_KAPPA*EA_CJ(-1))^(-EA_SIGMA) ;                                // FOC with respect to consumption
EA_VJ^2*EA_GAMMAVJDER = 1-EA_BETA*EA_LAMBDAJ(+1)/(EA_LAMBDAJ*EA_PIC(+1)) ;                                                      // FOC with respect to money
EA_VJ = (1+EA_TAUC)*EA_CJ/EA_MJ ;                                                                                               // consumption based velocity
EA_GAMMAVJ = EA_GAMMAV1*EA_VJ+EA_GAMMAV2/EA_VJ-2*(EA_GAMMAV1*EA_GAMMAV2)^(1/2) ;                                                // transaction cost
EA_GAMMAVJDER = EA_GAMMAV1-EA_GAMMAV2*EA_VJ^(-2) ;                                                                              // derivation of transaction cost
EA_WJTILDE^(1+EA_ETAJ*EA_ZETA) = EA_ETAJ/(EA_ETAJ-1)*EA_FJ/EA_GJ ;
EA_FJ = EA_WJ^(EA_ETAJ*(1+EA_ZETA))*EA_NDJ^(1+EA_ZETA)+EA_XIJ*EA_BETA*(EA_PIC(+1)/(EA_PIC^EA_CHIJ*EA_PI4TARGET^(1/4*(1-EA_CHIJ))))^(EA_ETAJ*(1+EA_ZETA))*EA_FJ(+1) ;
EA_GJ = EA_LAMBDAJ*(1-EA_TAUN-EA_TAUWH)*EA_WJ^EA_ETAJ*EA_NDJ+EA_XIJ*EA_BETA*(EA_PIC(+1)/(EA_PIC^EA_CHIJ*EA_PI4TARGET^(1/4*(1-EA_CHIJ))))^(EA_ETAJ-1)*EA_GJ(+1) ;
EA_WJ^(1-EA_ETAJ) = (1-EA_XIJ)*EA_WJTILDE^(1-EA_ETAJ)+EA_XIJ*EA_WJ(-1)^(1-EA_ETAJ)*(EA_PIC(-1)^EA_CHIJ*EA_PI4TARGET^(1/4*(1-EA_CHIJ))/EA_PIC)^(1-EA_ETAJ) ;

//Firms
//Intermediate-good firms

EA_YS = EA_Z*EA_KD^EA_ALPHA*EA_ND^(1-EA_ALPHA)-EA_PSIBAR ;                                                                      // production function, eq.17
EA_RK = EA_ALPHA*(EA_YS+EA_PSIBAR)/EA_KD*EA_MC ;                                                                                // FOC with respect to capital 
EA_MC = 1/(EA_Z*EA_ALPHA^EA_ALPHA*(1-EA_ALPHA)^(1-EA_ALPHA))*EA_RK^EA_ALPHA*((1+EA_TAUWF)*EA_W)^(1-EA_ALPHA) ;                  // eq.18, marginal cost
EA_NDI = ((1-EA_OMEGA)*(EA_WI/EA_W)^(-EA_ETA)*EA_ND) ;                                                                          // demand function for labor I, eq. 22
EA_NDJ = (EA_OMEGA*(EA_WJ/EA_W)^(-EA_ETA)*EA_ND) ;                                                                              // demand function for labor J, eq. 22
EA_ND^(1-1/EA_ETA) =((1-EA_OMEGA)^(1/EA_ETA)*EA_NDI^(1-1/EA_ETA)+EA_OMEGA^(1/EA_ETA)*EA_NDJ^(1-1/EA_ETA)) ;                     // combination of differentiated labour, eq.19
EA_D = EA_PY*EA_Y-EA_RK*EA_KD-(1+EA_TAUWF)*EA_W*EA_ND ;                                                                         // definition of dividends, used later in the budget constraint of the government to compute tax income from dividends
EA_PHTILDE/EA_PH = EA_THETA/(EA_THETA-1)*EA_FH/EA_GH ;
EA_FH = EA_MC*EA_H+EA_XIH*EA_BETA*EA_LAMBDAI(+1)/EA_LAMBDAI*(EA_PIH(+1)/(EA_PIH^EA_CHIH*EA_PI4TARGET^(1/4*(1-EA_CHIH))))^EA_THETA*EA_FH(+1) ;
EA_GH = EA_PH*EA_H+EA_XIH*EA_BETA*EA_LAMBDAI(+1)/EA_LAMBDAI*(EA_PIH(+1)/(EA_PIH^EA_CHIH*EA_PI4TARGET^(1/4*(1-EA_CHIH))))^(EA_THETA-1)*EA_GH(+1) ;
EA_PH^(1-EA_THETA) = (1-EA_XIH)*EA_PHTILDE^(1-EA_THETA)+EA_XIH*(EA_PH(-1)/EA_PIC)^(1-EA_THETA)*(EA_PIH(-1)^EA_CHIH*EA_PI4TARGET^(1/4*(1-EA_CHIH)))^(1-EA_THETA) ;
EA_PIH = EA_PH/EA_PH(-1)*EA_PIC ;
US_PIMTILDE/US_PIM = EA_THETA/(EA_THETA-1)*EA_FX/EA_GX ;
EA_FX = US_SIZE/EA_SIZE*US_IM*EA_MC+EA_XIX*EA_BETA*EA_LAMBDAI(+1)/EA_LAMBDAI*(US_PIIM(+1)/(US_PIIM^EA_CHIX*EA_PI4TARGET^(1/4*(1-EA_CHIX))))^EA_THETA*EA_FX(+1) ;
EA_GX = EAUS_RER*US_PIM*US_SIZE/EA_SIZE*US_IM+EA_XIX*EA_BETA*EA_LAMBDAI(+1)/EA_LAMBDAI*(US_PIIM(+1)/(US_PIIM^EA_CHIX*EA_PI4TARGET^(1/4*(1-EA_CHIX))))^(EA_THETA-1)*EA_GX(+1) ;
US_PIM^(1-EA_THETA) = (1-EA_XIX)*US_PIMTILDE^(1-EA_THETA)+EA_XIX*(US_PIM(-1)/US_PIC)^(1-EA_THETA)*(US_PIIM(-1)^EA_CHIX*US_PI4TARGET^(1/4*(1-EA_CHIH)))^(1-EA_THETA) ;
US_PIIM = US_PIM/US_PIM(-1)*US_PIC ;
EAUS_RER = EA_RER/US_RER ;

//Final-good firms

EA_QC^((EA_MUC-1)/EA_MUC) = EA_NUC^(1/EA_MUC)*EA_HC^(1-1/EA_MUC)+(1-EA_NUC)^(1/EA_MUC)*((1-EA_GAMMAIMC)*EA_IMC)^(1-1/EA_MUC) ;  // eq. 27
1^(1-EA_MUC) = EA_NUC*EA_PH^(1-EA_MUC)+(1-EA_NUC)*(EA_PIM/EA_GAMMAIMCDAG)^(1-EA_MUC) ;                                          // equation for the price of a unit of private consumption good
EA_HC = EA_NUC*EA_PH^(-EA_MUC)*EA_QC ;                                                                                          // eq. 30, demand function for domestic intermediate good
EA_GAMMAIMC = EA_GAMMAIMC1/2*(EA_IMC/EA_QC/(EA_IMC(-1)/EA_QC(-1))-1)^2 ;                                                        // adjumstment cost of imported intermediate good used for final consumption good
EA_GAMMAIMCDAG = 1-EA_GAMMAIMC-EA_GAMMAIMC1*(EA_IMC/EA_QC/(EA_IMC(-1)/EA_QC(-1))-1)*EA_IMC/EA_QC/(EA_IMC(-1)/EA_QC(-1)) ;       // second equation, page 2560
EA_QI^((EA_MUI-1)/EA_MUI) = EA_NUI^(1/EA_MUI)*EA_HI^(1-1/EA_MUI)+(1-EA_NUI)^(1/EA_MUI)*((1-EA_GAMMAIMI)*EA_IMI)^(1-1/EA_MUI) ;  // eq. 31, non-tradable final private investment good
EA_PI^(1-EA_MUI) = EA_NUI*EA_PH^(1-EA_MUI)+(1-EA_NUI)*(EA_PIM/EA_GAMMAIMIDAG)^(1-EA_MUI) ;                                      // equation for the price of a unit of private investment good
EA_HI = EA_NUI*(EA_PH/EA_PI)^(-EA_MUI)*EA_QI ;                                                                                  // demand function for domestic intermediate investment good bundle
EA_GAMMAIMI = EA_GAMMAIMI1/2*(EA_IMI/EA_QI/(EA_IMI(-1)/EA_QI(-1))-1)^2 ;                                                        // adjumstment cost of imported intermediate good used for final investment good
EA_GAMMAIMIDAG = 1-EA_GAMMAIMI-EA_GAMMAIMI1*(EA_IMI/EA_QI/(EA_IMI(-1)/EA_QI)-1)*EA_IMI/EA_QI/(EA_IMI(-1)/EA_QI(-1)) ;           // second equation, page 2560

//Fiscal authority

EA_PH(-1)*EA_G(-1)+EA_TR(-1)+EA_B(-1)*EA_PIC(-1)^(-1)+EA_M(-2)*EA_PIC(-1)^(-1) = EA_TAUC(-1)*EA_C(-1)+(EA_TAUN(-1)+EA_TAUWH(-1))*(EA_WI(-1)*EA_NDI(-1)+EA_WJ(-1)*EA_NDJ(-1))+EA_TAUWF(-1)*EA_W(-1)*EA_ND(-1)+EA_TAUK(-1)*(EA_RK(-1)*EA_U(-1)-(EA_GAMMAU(-1)+EA_DELTA)*EA_PI(-1))*EA_K(-1)+EA_TAUD(-1)*EA_D(-1)+EA_T(-1)+EA_R(-1)^(-1)*EA_B+EA_M(-1) ; // budget constraint, eq. 33
EA_PH*EA_G = EA_GY*EA_PYBAR*EA_YBAR ;                                                                                           //government purchases of the final public consumption good as a fraction of steady state nominal output
EA_TR = EA_TRY*EA_PYBAR*EA_YBAR ;                                                                                               //government transfers as a fraction of steady state nominal output
EA_T/(EA_PYBAR*EA_YBAR) = EA_PHITB*(EA_B/(EA_PYBAR*EA_YBAR)-EA_BYTARGET) ;                                                      // eq. 34, lump-sum taxes as fraction of steady state nominal output 
EA_TI = EA_UPSILONT*EA_T ;
EA_TRI = EA_UPSILONTR*EA_TR ;

//Monetary authority 

// original monetary policy rule at the beginning of the original model code
EA_PIC4 = EA_PIC*EA_PIC(-1)*EA_PIC(-2)*EA_PIC(-3) ;                                                                             // annual inflation
EA_RR-1 = EA_R/EA_PIC(+1)-1 ;                                                                                                   // real interest rate
EA_RRSTAR-1 = 1/EA_BETA-1 ;                                                                                                     // equilibrium nominal interest rate

//Aggregation

EA_C = (1-EA_OMEGA)*EA_CI+EA_OMEGA*EA_CJ ;                                                                                      // consumption
EA_M = (1-EA_OMEGA)*EA_MI+EA_OMEGA*EA_MJ ;                                                                                      // money
EA_K = (1-EA_OMEGA)*EA_KI ;                                                                                                     // capital
EA_I = (1-EA_OMEGA)*EA_II ;                                                                                                     // investment
EA_TRJ = (1/EA_OMEGA*EA_TR-(1-EA_OMEGA)/EA_OMEGA*EA_TRI) ;                                                                      // transfers to HH J                                                            
EA_TJ = (1/EA_OMEGA*EA_T-(1-EA_OMEGA)/EA_OMEGA*EA_TI) ;                                                                         // taxes HH J  
EA_GAMMAV = (1-EA_OMEGA)*EA_CI*EA_GAMMAVI+EA_OMEGA*EA_CJ*EA_GAMMAVJ ;                                                           // total transaction costs
EA_NI = EA_SI*EA_NDI ;
EA_SI = (1-EA_XII)*(EA_WITILDE/EA_WI)^(-EA_ETAI)+EA_XII*(EA_WI(-1)/EA_WI)^(-EA_ETAI)*(EA_PIC/(EA_PIC(-1)^EA_CHII*EA_PI4TARGET^(1/4*(1-EA_CHII))))^EA_ETAI*EA_SI(-1) ;
EA_NJ = EA_SJ*EA_NDJ ;
EA_SJ = (1-EA_XIJ)*(EA_WJTILDE/EA_WJ)^(-EA_ETAJ)+EA_XIJ*(EA_WJ(-1)/EA_WJ)^(-EA_ETAJ)*(EA_PIC/(EA_PIC(-1)^EA_CHIJ*EA_PI4TARGET^(1/4*(1-EA_CHIJ))))^EA_ETAJ*EA_SJ(-1) ;
EA_U*EA_K = EA_KD ;
EA_YS = EA_SH*EA_H+EA_SX*US_SIZE/EA_SIZE*US_IM ;
EA_H = EA_HC+EA_HI+EA_G ;                                                                                                       // eq. 32
EA_IM = EA_IMI+EA_IMC ;                                                                                                         // eq. 32
EA_SH = (1-EA_XIH)*(EA_PHTILDE/EA_PH)^(-EA_THETA)+EA_XIH*(EA_PIH/(EA_PIH(-1)^EA_CHIH*EA_PI4TARGET^(1/4*(1-EA_CHIH))))^EA_THETA*EA_SH(-1) ;
EA_SX = (1-EA_XIX)*(US_PIMTILDE/US_PIM)^(-EA_THETA)+EA_XIX*(US_PIIM/(US_PIIM(-1)^EA_CHIX*EA_PI4TARGET^(1/4*(1-EA_CHIH))))^EA_THETA*EA_SX(-1) ;
EA_QC = EA_C+EA_GAMMAV ;
EA_QI = EA_I+EA_K*EA_GAMMAU ;
EA_PY*EA_Y = EA_QC+EA_PI*EA_QI+EA_PH*EA_G+EAUS_RER*US_PIM*US_SIZE/EA_SIZE*US_IM-EA_PIM*(EA_IMC*(1-EA_GAMMAIMC)/EA_GAMMAIMCDAG+EA_IMI*(1-EA_GAMMAIMI)/EA_GAMMAIMIDAG) ;
EA_Y = EA_YS ;
log(EA_Z) = (1-EA_RHOZ)*log(EA_ZBAR)+EA_RHOZ*log(EA_Z(-1))+EA_EPSZ ;
EA_GY = (1-EA_RHOG)*EA_GYBAR+EA_RHOG*EA_GY(-1)+EA_EPSG ;
EA_TRY = (1-EA_RHOTR)*EA_TRYBAR+EA_RHOTR*EA_TRY(-1)+EA_EPSTR ;
EA_TAUC = (1-EA_RHOTAUC)*EA_TAUCBAR+EA_RHOTAUC*EA_TAUC(-1)+EA_EPSTAUC ;
EA_TAUD = (1-EA_RHOTAUD)*EA_TAUDBAR+EA_RHOTAUD*EA_TAUD(-1)+EA_EPSTAUD ;
EA_TAUK = (1-EA_RHOTAUK)*EA_TAUKBAR+EA_RHOTAUK*EA_TAUK(-1)+EA_EPSTAUK ;
EA_TAUN = (1-EA_RHOTAUN)*EA_TAUNBAR+EA_RHOTAUN*EA_TAUN(-1)+EA_EPSTAUN ;
EA_TAUWH = (1-EA_RHOTAUWH)*EA_TAUWHBAR+EA_RHOTAUWH*EA_TAUWH(-1)+EA_EPSTAUWH ;
EA_TAUWF = (1-EA_RHOTAUWF)*EA_TAUWFBAR+EA_RHOTAUWF*EA_TAUWF(-1)+EA_EPSTAUWF ;
EA_CY = EA_C/(EA_PY*EA_Y) ;
EA_IY = EA_PI*EA_I/(EA_PY*EA_Y) ;
EA_IMY = EA_PIM*EA_IM/(EA_PY*EA_Y) ;
EA_IMCY = EA_PIM*EA_IMC/(EA_PY*EA_Y) ;
EA_IMIY = EA_PIM*EA_IMI/(EA_PY*EA_Y) ;
EA_BY = EA_B/(EA_PYBAR*EA_YBAR) ;
EA_TY = EA_T/(EA_PYBAR*EA_YBAR) ;
EA_YGAP = EA_Y/EA_YBAR-1 ;
EA_YGROWTH = EA_Y/EA_Y(-1) ;
EA_YSHARE = EA_SIZE*EA_PY*EA_Y/EA_RER/(EA_SIZE*EA_PY*EA_Y/EA_RER+US_SIZE*US_PY*US_Y/US_RER) ;
EA_EPSILONM = -1/8*1/(EA_R*(EA_GAMMAV2*EA_R+EA_R-1)) ;

// Model equations US

//Households
//Household I

US_UTILI = (1/(1-US_SIGMA)*(US_CI-US_KAPPA*US_CI(-1))^(1-US_SIGMA)-1/(1+US_ZETA)*US_NI^(1+US_ZETA)+US_BETA*US_UTILI(+1)) ;      //Value function of HH I (Bellman)
US_LAMBDAI*(1+US_TAUC+US_GAMMAVI+US_VI*US_GAMMAVIDER) = (US_CI-US_KAPPA*US_CI(-1))^(-US_SIGMA) ;                                //equation (4), FOC with respect to consumption
US_R = US_BETA^(-1)*US_LAMBDAI/US_LAMBDAI(+1)*US_PIC(+1) ;                                                                      //equation (8), FOC with respect to bonds
US_VI^2*US_GAMMAVIDER = 1-US_BETA*US_LAMBDAI(+1)/(US_LAMBDAI*US_PIC(+1)) ;                                                      //equation (10), FOC with respect to money
US_VI = (1+US_TAUC)*US_CI/US_MI ;                                                                                               // consumption based velocity 
US_GAMMAVI = US_GAMMAV1*US_VI+US_GAMMAV2/US_VI-2*(US_GAMMAV1*US_GAMMAV2)^(1/2) ;                                                //transaction cost 
US_GAMMAVIDER = US_GAMMAV1-US_GAMMAV2*US_VI^(-2) ;                                                                              // derivative of transaction cost
US_KI = (1-US_DELTA)*US_KI(-1)+(1-US_GAMMAI(-1))*US_II(-1) ;                                                                    // capital accumulation 
US_GAMMAI = US_GAMMAI1/2*(US_II/US_II(-1)-1)^2 ;                                                                                //investment adjustment cost
US_GAMMAIDER = US_GAMMAI1*(US_II/US_II(-1)-1)/US_II(-1) ;                                                                       // derivative of investment adjustment cost
US_GAMMAU = ((US_BETA^(-1)-1+US_DELTA)*US_QBAR-US_DELTA*US_TAUKBAR*US_PIBAR)/((1-US_TAUKBAR)*US_PIBAR)*(US_U-1)+US_GAMMAU2/2*(US_U-1)^2 ; //capital utilisation cost
US_GAMMAUDER = ((US_BETA^(-1)-1+US_DELTA)*US_QBAR-US_DELTA*US_TAUKBAR*US_PIBAR)/((1-US_TAUKBAR)*US_PIBAR)+US_GAMMAU2*(US_U-1) ; //derivative capital utilisation cost
US_RK = US_GAMMAUDER*US_PI ;                                                                                                    //equation (7), FOC with respect to utilization rate
US_PI = US_Q*(1-US_GAMMAI-US_GAMMAIDER*US_II)+US_BETA*US_LAMBDAI(+1)/US_LAMBDAI*US_Q(+1)*US_GAMMAIDER(+1)*US_II(+1)^2/US_II ;   //equation (5), FOC with respect to investment
US_Q = US_BETA*US_LAMBDAI(+1)/US_LAMBDAI*((1-US_TAUK(+1))*(US_RK(+1)*US_U(+1)-US_GAMMAU(+1)*US_PI(+1))+US_TAUK(+1)*US_DELTA*US_PI(+1)+(1-US_DELTA)*US_Q(+1)) ; //equation (6), FOC with respect to capital
US_WITILDE^(1+US_ETAI*US_ZETA) = US_ETAI/(US_ETAI-1)*US_FI/US_GI ;                                                               
US_FI = US_WI^(US_ETAI*(1+US_ZETA))*US_NDI^(1+US_ZETA)+US_XII*US_BETA*(US_PIC(+1)/(US_PIC^US_CHII*US_PI4TARGET^(1/4*(1-US_CHII))))^(US_ETAI*(1+US_ZETA))*US_FI(+1) ;
US_GI = US_LAMBDAI*(1-US_TAUN-US_TAUWH)*US_WI^US_ETAI*US_NDI+US_XII*US_BETA*(US_PIC(+1)/(US_PIC^US_CHII*US_PI4TARGET^(1/4*(1-US_CHII))))^(US_ETAI-1)*US_GI(+1) ;
US_WI^(1-US_ETAI) = (1-US_XII)*US_WITILDE^(1-US_ETAI)+US_XII*US_WI(-1)^(1-US_ETAI)*(US_PIC(-1)^US_CHII*US_PI4TARGET^(1/4*(1-US_CHII))/US_PIC)^(1-US_ETAI) ;

//Household J

US_UTILJ = (1/(1-US_SIGMA)*(US_CJ-US_KAPPA*US_CJ(-1))^(1-US_SIGMA)-1/(1+US_ZETA)*US_NJ^(1+US_ZETA)+US_BETA*US_UTILJ(+1)) ;      //Value function of HH J (Bellman)
(1+US_TAUC+US_GAMMAVJ)*US_CJ+US_MJ = (1-US_TAUN-US_TAUWH)*US_WJ*US_NJ+US_TRJ-US_TJ+US_MJ(-1)*US_PIC^(-1) ;                      // budget constraint for household J, eq. 14
US_LAMBDAJ*(1+US_TAUC+US_GAMMAVJ+US_VJ*US_GAMMAVJDER) = (US_CJ-US_KAPPA*US_CJ(-1))^(-US_SIGMA) ;                                //FOC with respect to consumption
US_VJ^2*US_GAMMAVJDER = 1-US_BETA*US_LAMBDAJ(+1)/(US_LAMBDAJ*US_PIC(+1)) ;                                                      //FOC with respect to money
US_VJ = (1+US_TAUC)*US_CJ/US_MJ ;                                                                                               // consumption based velocity
US_GAMMAVJ = US_GAMMAV1*US_VJ+US_GAMMAV2/US_VJ-2*(US_GAMMAV1*US_GAMMAV2)^(1/2) ;                                                //transaction cost
US_GAMMAVJDER = US_GAMMAV1-US_GAMMAV2*US_VJ^(-2) ;                                                                              //derivation of transaction cost
US_WJTILDE^(1+US_ETAJ*US_ZETA) = US_ETAJ/(US_ETAJ-1)*US_FJ/US_GJ ;
US_FJ = US_WJ^(US_ETAJ*(1+US_ZETA))*US_NDJ^(1+US_ZETA)+US_XIJ*US_BETA*(US_PIC(+1)/(US_PIC^US_CHIJ*US_PI4TARGET^(1/4*(1-US_CHIJ))))^(US_ETAJ*(1+US_ZETA))*US_FJ(+1) ;
US_GJ = US_LAMBDAJ*(1-US_TAUN-US_TAUWH)*US_WJ^US_ETAJ*US_NDJ+US_XIJ*US_BETA*(US_PIC(+1)/(US_PIC^US_CHIJ*US_PI4TARGET^(1/4*(1-US_CHIJ))))^(US_ETAJ-1)*US_GJ(+1) ;
US_WJ^(1-US_ETAJ) = (1-US_XIJ)*US_WJTILDE^(1-US_ETAJ)+US_XIJ*US_WJ(-1)^(1-US_ETAJ)*(US_PIC(-1)^US_CHIJ*US_PI4TARGET^(1/4*(1-US_CHIJ))/US_PIC)^(1-US_ETAJ) ;

//Firms
//Intermediate-good firms

US_YS = US_Z*US_KD^US_ALPHA*US_ND^(1-US_ALPHA)-US_PSIBAR ;                                                                      // production function, eq.17
US_RK = US_ALPHA*(US_YS+US_PSIBAR)/US_KD*US_MC ;                                                                                // FOC with respect to capital 
US_MC = 1/(US_Z*US_ALPHA^US_ALPHA*(1-US_ALPHA)^(1-US_ALPHA))*US_RK^US_ALPHA*((1+US_TAUWF)*US_W)^(1-US_ALPHA) ;                  // eq.18, marginal cost
US_NDI = ((1-US_OMEGA)*(US_WI/US_W)^(-US_ETA)*US_ND) ;                                                                          // demand function for labor I, eq. 22
US_NDJ = (US_OMEGA*(US_WJ/US_W)^(-US_ETA)*US_ND) ;                                                                              // demand function for labor J, eq. 22
US_ND^(1-1/US_ETA) = ((1-US_OMEGA)^(1/US_ETA)*US_NDI^(1-1/US_ETA)+US_OMEGA^(1/US_ETA)*US_NDJ^(1-1/US_ETA)) ;                    // combination of differentiated labour, eq.19
US_D = US_PY*US_Y-US_RK*US_KD-(1+US_TAUWF)*US_W*US_ND ;                                                                         // definition of dividends, used later in the budget constraint of the government to compute tax income from dividends
US_PHTILDE/US_PH = US_THETA/(US_THETA-1)*US_FH/US_GH ;
US_FH = US_MC*US_H+US_XIH*US_BETA*US_LAMBDAI(+1)/US_LAMBDAI*(US_PIH(+1)/(US_PIH^US_CHIH*US_PI4TARGET^(1/4*(1-US_CHIH))))^US_THETA*US_FH(+1) ;
US_GH = US_PH*US_H+US_XIH*US_BETA*US_LAMBDAI(+1)/US_LAMBDAI*(US_PIH(+1)/(US_PIH^US_CHIH*US_PI4TARGET^(1/4*(1-US_CHIH))))^(US_THETA-1)*US_GH(+1) ;
US_PH^(1-US_THETA) = (1-US_XIH)*US_PHTILDE^(1-US_THETA)+US_XIH*(US_PH(-1)/US_PIC)^(1-US_THETA)*(US_PIH(-1)^US_CHIH*US_PI4TARGET^(1/4*(1-US_CHIH)))^(1-US_THETA) ;
US_PIH = US_PH/US_PH(-1)*US_PIC ;
EA_PIMTILDE/EA_PIM = US_THETA/(US_THETA-1)*US_FX/US_GX ;
US_FX = EA_SIZE/US_SIZE*EA_IM*US_MC+US_XIX*US_BETA*US_LAMBDAI(+1)/US_LAMBDAI*(EA_PIIM(+1)/(EA_PIIM^US_CHIX*US_PI4TARGET^(1/4*(1-US_CHIX))))^US_THETA*US_FX(+1) ;
US_GX = USEA_RER*EA_PIM*EA_SIZE/US_SIZE*EA_IM+US_XIX*US_BETA*US_LAMBDAI(+1)/US_LAMBDAI*(EA_PIIM(+1)/(EA_PIIM^US_CHIX*US_PI4TARGET^(1/4*(1-US_CHIX))))^(US_THETA-1)*US_GX(+1) ;
EA_PIM^(1-US_THETA) = (1-US_XIX)*EA_PIMTILDE^(1-US_THETA)+US_XIX*(EA_PIM(-1)/EA_PIC)^(1-US_THETA)*(EA_PIIM(-1)^US_CHIX*EA_PI4TARGET^(1/4*(1-US_CHIH)))^(1-US_THETA) ;
EA_PIIM = EA_PIM/EA_PIM(-1)*EA_PIC ;
USEA_RER = US_RER/EA_RER ;

//Final-good firms

US_QC^((US_MUC-1)/US_MUC) = US_NUC^(1/US_MUC)*US_HC^(1-1/US_MUC)+(1-US_NUC)^(1/US_MUC)*((1-US_GAMMAIMC)*US_IMC)^(1-1/US_MUC) ;  // eq. 27
1^(1-US_MUC) = US_NUC*US_PH^(1-US_MUC)+(1-US_NUC)*(US_PIM/US_GAMMAIMCDAG)^(1-US_MUC) ;                                          // equation for the price of a unit of private consumption good
US_HC = US_NUC*US_PH^(-US_MUC)*US_QC ;                                                                                          // eq. 30, demand function for domestic intermediate good
US_GAMMAIMC = US_GAMMAIMC1/2*(US_IMC/US_QC/(US_IMC(-1)/US_QC(-1))-1)^2 ;                                                        // adjumstment cost of imported intermediate good used for final consumption good
US_GAMMAIMCDAG = 1-US_GAMMAIMC-US_GAMMAIMC1*(US_IMC/US_QC/(US_IMC(-1)/US_QC(-1))-1)*US_IMC/US_QC/(US_IMC(-1)/US_QC(-1)) ;       // second equation, page 2560
US_QI^((US_MUI-1)/US_MUI) = US_NUI^(1/US_MUI)*US_HI^(1-1/US_MUI)+(1-US_NUI)^(1/US_MUI)*((1-US_GAMMAIMI)*US_IMI)^(1-1/US_MUI) ;  // eq. 31, non-tradable final private investment good
US_PI^(1-US_MUI) = US_NUI*US_PH^(1-US_MUI)+(1-US_NUI)*(US_PIM/US_GAMMAIMIDAG)^(1-US_MUI) ;                                      // equation for the price of a unit of private investment good
US_HI = US_NUI*(US_PH/US_PI)^(-US_MUI)*US_QI ;                                                                                  // demand function for domestic intermediate investment good bundle
US_GAMMAIMI = US_GAMMAIMI1/2*(US_IMI/US_QI/(US_IMI(-1)/US_QI(-1))-1)^2 ;                                                        // adjumstment cost of imported intermediate good used for final investment good
US_GAMMAIMIDAG = 1-US_GAMMAIMI-US_GAMMAIMI1*(US_IMI/US_QI/(US_IMI(-1)/US_QI)-1)*US_IMI/US_QI/(US_IMI(-1)/US_QI(-1)) ;           // second equation, page 2560

//Fiscal authority

US_PH(-1)*US_G(-1)+US_TR(-1)+US_B(-1)*US_PIC(-1)^(-1)+US_M(-2)*US_PIC(-1)^(-1) = US_TAUC(-1)*US_C(-1)+(US_TAUN(-1)+US_TAUWH(-1))*(US_WI(-1)*US_NDI(-1)+US_WJ(-1)*US_NDJ(-1))+US_TAUWF(-1)*US_W(-1)*US_ND(-1)+US_TAUK(-1)*(US_RK(-1)*US_U(-1)-(US_GAMMAU(-1)+US_DELTA)*US_PI(-1))*US_K(-1)+US_TAUD(-1)*US_D(-1)+US_T(-1)+US_R(-1)^(-1)*US_B+US_M(-1) ;  // budget constraint, eq. 33
US_PH*US_G = US_GY*US_PYBAR*US_YBAR ;                                                                                           //government purchases of the final public consumption good as a fraction of steady state nominal output
US_TR = US_TRY*US_PYBAR*US_YBAR ;                                                                                               //government transfers as a fraction of steady state nominal output
US_T/(US_PYBAR*US_YBAR) = US_PHITB*(US_B/(US_PYBAR*US_YBAR)-US_BYTARGET) ;                                                      // eq. 34, lump-sum taxes as fraction of steady state nominal output 
US_TI = US_UPSILONT*US_T ;
US_TRI = US_UPSILONTR*US_TR ;

//Monetary authority 

// original monetary policy rule at the beginning of the original model code
US_PIC4 = US_PIC*US_PIC(-1)*US_PIC(-2)*US_PIC(-3) ;                                                                             // annual inflation
US_RR-1 = US_R/US_PIC(+1)-1 ;                                                                                                   // real interest rate
US_RRSTAR-1 = 1/US_BETA-1 ;                                                                                                     // equilibrium nominal interest rate

//Aggregation

US_C = (1-US_OMEGA)*US_CI+US_OMEGA*US_CJ ;                                                                                      // consumption
US_M = (1-US_OMEGA)*US_MI+US_OMEGA*US_MJ ;                                                                                      // money
US_K = (1-US_OMEGA)*US_KI ;                                                                                                     // capital
US_I = (1-US_OMEGA)*US_II ;                                                                                                     // investment
US_TRJ = (1/US_OMEGA*US_TR-(1-US_OMEGA)/US_OMEGA*US_TRI) ;                                                                      // transfers to HH J
US_TJ =  (1/US_OMEGA*US_T-(1-US_OMEGA)/US_OMEGA*US_TI) ;                                                                        // taxes HH J    
US_GAMMAV = (1-US_OMEGA)*US_CI*US_GAMMAVI+US_OMEGA*US_CJ*US_GAMMAVJ ;                                                           // total transaction costs
US_NI = US_SI*US_NDI ;
US_SI = (1-US_XII)*(US_WITILDE/US_WI)^(-US_ETAI)+US_XII*(US_WI(-1)/US_WI)^(-US_ETAI)*(US_PIC/(US_PIC(-1)^US_CHII*US_PI4TARGET^(1/4*(1-US_CHII))))^US_ETAI*US_SI(-1) ;
US_NJ = US_SJ*US_NDJ ;
US_SJ = (1-US_XIJ)*(US_WJTILDE/US_WJ)^(-US_ETAJ)+US_XIJ*(US_WJ(-1)/US_WJ)^(-US_ETAJ)*(US_PIC/(US_PIC(-1)^US_CHIJ*US_PI4TARGET^(1/4*(1-US_CHIJ))))^US_ETAJ*US_SJ(-1) ;
US_U*US_K = US_KD ;
US_YS = US_SH*US_H+US_SX*EA_SIZE/US_SIZE*EA_IM ;
US_H = US_HC+US_HI+US_G ;                                                                                                       // eq. 32
US_IM = US_IMI+US_IMC ;                                                                                                         // eq. 32
US_SH = (1-US_XIH)*(US_PHTILDE/US_PH)^(-US_THETA)+US_XIH*(US_PIH/(US_PIH(-1)^US_CHIH*US_PI4TARGET^(1/4*(1-US_CHIH))))^US_THETA*US_SH(-1) ;
US_SX = (1-US_XIX)*(EA_PIMTILDE/EA_PIM)^(-US_THETA)+US_XIX*(EA_PIIM/(EA_PIIM(-1)^US_CHIX*US_PI4TARGET^(1/4*(1-US_CHIH))))^US_THETA*US_SX(-1) ;
US_QC = US_C+US_GAMMAV ;
US_QI = US_I+US_K*US_GAMMAU ;
US_PY*US_Y = US_QC+US_PI*US_QI+US_PH*US_G+USEA_RER*EA_PIM*EA_SIZE/US_SIZE*EA_IM-US_PIM*(US_IMC*(1-US_GAMMAIMC)/US_GAMMAIMCDAG+US_IMI*(1-US_GAMMAIMI)/US_GAMMAIMIDAG) ;
US_Y = US_YS ;
log(US_Z) = (1-US_RHOZ)*log(US_ZBAR)+US_RHOZ*log(US_Z(-1))+US_EPSZ ;
US_GY = (1-US_RHOG)*US_GYBAR+US_RHOG*US_GY(-1)+US_EPSG ;
US_TRY = (1-US_RHOTR)*US_TRYBAR+US_RHOTR*US_TRY(-1)+US_EPSTR ;
US_TAUC = (1-US_RHOTAUC)*US_TAUCBAR+US_RHOTAUC*US_TAUC(-1)+US_EPSTAUC ;
US_TAUD = (1-US_RHOTAUD)*US_TAUDBAR+US_RHOTAUD*US_TAUD(-1)+US_EPSTAUD ;
US_TAUK = (1-US_RHOTAUK)*US_TAUKBAR+US_RHOTAUK*US_TAUK(-1)+US_EPSTAUK ;
US_TAUN = (1-US_RHOTAUN)*US_TAUNBAR+US_RHOTAUN*US_TAUN(-1)+US_EPSTAUN ;
US_TAUWH = (1-US_RHOTAUWH)*US_TAUWHBAR+US_RHOTAUWH*US_TAUWH(-1)+US_EPSTAUWH ;
US_TAUWF = (1-US_RHOTAUWF)*US_TAUWFBAR+US_RHOTAUWF*US_TAUWF(-1)+US_EPSTAUWF ;
US_CY = US_C/(US_PY*US_Y) ;
US_IY = US_PI*US_I/(US_PY*US_Y) ;
US_IMY = US_PIM*US_IM/(US_PY*US_Y) ;
US_IMCY = US_PIM*US_IMC/(US_PY*US_Y) ;
US_IMIY = US_PIM*US_IMI/(US_PY*US_Y) ;
US_BY = US_B/(US_PYBAR*US_YBAR) ;
US_TY = US_T/(US_PYBAR*US_YBAR) ;
US_YGAP = US_Y/US_YBAR-1 ;
US_YGROWTH = US_Y/US_Y(-1) ;
US_YSHARE = US_SIZE*US_PY*US_Y/US_RER/(US_SIZE*US_PY*US_Y/US_RER+EA_SIZE*EA_PY*EA_Y/EA_RER) ;
US_EPSILONM = -1/8*1/(US_R*(US_GAMMAV2*US_R+US_R-1)) ;
1 = US_R*(1-EA_GAMMAB)*EA_BETA*EA_LAMBDAI(+1)/EA_LAMBDAI*EA_RERDEP(+1)/US_PIC(+1) ;
EA_GAMMAB = EA_GAMMAB1*(exp(EA_RER*EA_BF/US_PIC/(EA_PY*EA_Y)-EA_BFYTARGET)-1)-EA_RP ;
EA_RP = EA_RHORP*EA_RP(-1)+EA_EPSRP ;
EA_RERDEP = EA_RER/EA_RER(-1) ;
EA_TOT = EA_PIM/(EA_RER*US_PIM) ;
EA_TB = EA_RER*US_PIM*US_SIZE/EA_SIZE*US_IM-EA_PIM*EA_IM ;
EA_BF/US_R(-1) = EA_BF(-1)+EA_TB(-1)/EA_RER(-1) ;
EA_SIZE*EA_BF+US_SIZE*US_BF = 0 ;

end;


initval;
EAUS_RER=0.937575549426388;
EA_B=8.76096481337854;
EA_BF=0;
EA_BY=2.4;
EA_C=2.18953931985619;
EA_CI=2.30653728902394;
EA_CJ=1.83854541235293;
EA_CY=0.599807724330806;
EA_D=8.130685761198e-016;
EA_FH =23.3942599750924;
EA_FI =130.027056955912;
EA_FJ =4.81581692429301;
EA_FX =0.779768566246692;
EA_G =0.652856601368441;
EA_GAMMAB =0;
EA_GAMMAI =0;
EA_GAMMAIDER =0;
EA_GAMMAIMC =0;
EA_GAMMAIMCDAG =1;
EA_GAMMAIMI =0;
EA_GAMMAIMIDAG =1;
EA_GAMMAU =0;
EA_GAMMAUDER =0.0340909090909092;
EA_GAMMAV =0.00070188348844825;
EA_GAMMAVI =0.000320562175834483;
EA_GAMMAVIDER =0.0218035974789136;
EA_GAMMAVJ =0.000320562175834478;
EA_GAMMAVJDER =0.0218035974789136;
EA_GH =28.0731119701109; 
EA_GI =9.36344272645511;
EA_GJ =4.91231876574661;
EA_GX =0.935722279496031;
EA_GY =0.18;
EA_H =2.97412451734512;
EA_HC =1.99483961529246;
EA_HI =0.326428300684219;
EA_I =0.835577951476644;
EA_II =1.11410393530219;
EA_IM =0.706271096709553;
EA_IMC =0.196186415752654;
EA_IMCY =0.0500000000000002;
EA_IMI =0.510084680956899;
EA_IMIY =0.13;
EA_IMY =0.18;
EA_IY =0.22;
EA_K =33.4231180590658;
EA_KD =33.4231180590658;
EA_KI =44.5641574120877;
EA_LAMBDAI =0.97925563259573;
EA_LAMBDAJ =1.54123305743258;
EA_M =3.45363335385316;
EA_MC =0.838714504361949;
EA_MI =3.63817815055376;
EA_MJ =2.89999896375135;
EA_ND =1.81678486262395;
EA_NDI =0.877517383251523;
EA_NDJ =0.994178476830804;
EA_NI =0.877517383251523;
EA_NJ =0.994178476830804;
EA_PH =1.00645740523434;
EA_PHTILDE =1.00645740523434;
EA_PI =0.961117319822928;
EA_PIC =1.0049629315732;
EA_PIC4 =1.02;
EA_PIH =1.0049629315732;
EA_PIIM =1.0049629315732;
EA_PIM =0.930340154176811;
EA_PIMTILDE =0.930340154176811;
EA_PY =1.00645740523434;
EA_Q =0.961117319822928;
EA_QC =2.19024120334464;
EA_QI =0.835577951476644;
EA_R =1.01241680983897;
EA_RER =0.937575549426388;
EA_RERDEP =1;
EA_RK =0.0327653631757817;
EA_RP =0;
EA_RR =1.00741706786548;
EA_SH =1;
EA_SI =1;
EA_SJ =1;
EA_SX =1;
EA_T =0;
EA_TAUC =0.183;
EA_TAUD =0;
EA_TAUK =0.184122534797561;
EA_TAUN =0.122;
EA_TAUWF =0.219;
EA_TAUWH =0.118;
EA_TB =0;
EA_TI =0;
EA_TJ =0;
EA_TOT =0.924371115298412;
EA_TR =0.712415745652017;
EA_TRI =0.47494382568524;
EA_TRJ =1.42483150555235;
EA_TRY =0.195160901337473;
EA_TY =0;
EA_U =1;
EA_UTILI =-177.80959564505;
EA_UTILJ =-229.178322918907;
EA_VJ =0.75;
EA_W =1.153802633989;
EA_WI =1.2416037978402;
EA_WITILDE =1.2416037978402;
EA_WJ =1.01257698454711;
EA_WJTILDE =1.01257698454711;
EA_Y =3.62698111871356;
EA_YGAP =0;
EA_YGROWTH =1;
EA_YS =3.62698111871356;
EA_YSHARE =0.419354838709677;
EA_Z =1;
EA_EPSILONM=-0.75;
EA_RRSTAR =1.00741706786548;
EA_VI=0.75;



USEA_RER = 1.06658071513469;
US_B = 9.34600933441895;
US_BF = 0;
US_BY = 2.4;
US_C = 2.41414187416651;
US_CI = 2.69734517849423;
US_CJ = 1.56453196118335;
US_CY = 0.619937375480895;
US_D = 1.01192186569047e-014;
US_FH = 26.4782322019398;
US_FI = 828.361762914362;
US_FJ = 30.6800652931245;
US_FX = 0.600773607720124;
US_G = 0.627912976941598;
US_GAMMAI = 0;
US_GAMMAIDER = 0;
US_GAMMAIMC = 0;
US_GAMMAIMCDAG = 1;
US_GAMMAIMI = 0;
US_GAMMAIMIDAG = 1;
US_GAMMAU = 0;
US_GAMMAUDER = 0.0340909090909093;
US_GAMMAV = 0.000243870558389395;
US_GAMMAVI = 0.000101017492384781;
US_GAMMAVIDER = 0.00216519376842896;
US_GAMMAVJ = 0.000101017492384779;
US_GAMMAVJDER = 0.00216519376842894;
US_GH = 31.7738786423278;
US_GI = 14.3472077461836;
US_GJ = 14.2151126631918;
US_GX = 0.720928329264149;
US_GY = 0.16;
US_H = 3.41427681211994;
US_HC = 2.1976954192956;
US_HI = 0.588668415882739;
US_I = 0.841760867101418;
US_II = 1.12234782280189;
US_IM = 0.471595002779754;
US_IMC = 0.217659232052194;
US_IMCY = 0.0599999999999999;
US_IMI = 0.25393577072756;
US_IMIY = 0.0700000000000001;
US_IMY = 0.13;
US_IY = 0.219999999999998;
US_K = 33.6704346840567; 
US_KD = 33.6704346840567;
US_KI = 44.8939129120756; 
US_LAMBDAI = 0.793738951061822;
US_LAMBDAJ = 2.35929293297691;
US_M = 1.09244991532661;
US_MC = 0.826902389133687;
US_MI = 1.22060536018415;
US_MJ = 0.707983580753977;
US_ND = 2.02692319692714;
US_NDI = 0.842738211796422;
US_NDJ = 1.28040341539794;
US_NI = 0.842738211796422;
US_NJ = 1.28040341539794;
US_PH = 0.992282866960424;
US_PHTILDE = 0.992282866960425;
US_PI = 1.01776829477927;
US_PIC = 1.0049629315732;
US_PIC4 = 1.02;
US_PIH = 1.0049629315732;
US_PIIM = 1.0049629315732;
US_PIM = 1.07346805902745;
US_PIMTILDE = 1.07346805902745;
US_PY = 0.992282866960427;
US_Q = 1.01776829477927;
US_QC = 2.4143857447249;
US_QI = 0.841760867101418;
US_R = 1.01241680983897;
US_RK = 0.0346966464129299;
US_RR = 1.00741706786548;
US_SH = 0.999999999999997;
US_SI = 1;
US_SJ = 1;
US_SX = 1;
US_T = 0;
US_TAUC = 0.077;
US_TAUD = 0;
US_TAUK = 0.184122534797571;
US_TAUN = 0.154;
US_TAUWF = 0.071;
US_TAUWH = 0.071;
US_TI = 0;
US_TJ = 0;
US_TR = 0.310489186066476;
US_TRI = 0.206992788641056;
US_TRJ = 0.620978378342736;
US_TRY = 0.0797317892477657;
US_TY = 0;
US_U = 1;
US_UTILI = -152.9846874364;
US_UTILJ = -312.074198693985;
US_VJ = 2.38;
US_W = 1.25570101402423;
US_WI =1.38543840813496;
US_WITILDE = 1.38543840813496;
US_WJ = 1.0759481039628;
US_WJTILDE = 1.0759481039628;
US_Y = 3.92445610588497;
US_YGAP = 0;
US_YGROWTH = 1;
US_YS = 3.92445610588497;
US_YSHARE = 0.580645161290323;
US_Z = 1;
US_VI = 2.38;
US_EPSILONM=-0.75;

US_RRSTAR =1.00741706786548;


end;

shocks;
var	EA_EPSG=1;
var	EA_EPSR=1;
var	EA_EPSRP=1;
var	EA_EPSTAUC=1;
var	EA_EPSTAUD=1;
var	EA_EPSTAUK=1;
var	EA_EPSTAUN=1;
var	EA_EPSTAUWF=1;
var	EA_EPSTAUWH=1;
var	EA_EPSTR=1;
var	EA_EPSZ=1;
var	US_EPSG=1;
var	US_EPSR=1;
var	US_EPSTAUC=1;
var	US_EPSTAUD=1;
var	US_EPSTAUK=1;
var	US_EPSTAUN=1;
var	US_EPSTAUWF=1;
var	US_EPSTAUWH=1;
var	US_EPSTR=1;
var	US_EPSZ=1;
end;



stoch_simul (order=1, irf = 20, ar=100, nograph, noprint);