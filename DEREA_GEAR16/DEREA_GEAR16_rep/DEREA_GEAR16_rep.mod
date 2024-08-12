var              
  i_a_t            i_b_t            i_c_t                             // Interest Rate
  i_Ga_t           i_Gb_t                                             // Government bond rate
  i_ac_t           i_ba_t           i_bc_t                            // Interest Rate Foreign Bonds
  i_policy_t                                                          // Policy Rate EMU
  y_a_t            y_b_t            y_c_t                             // Output
  c_a_t            c_b_t                                              // Total Consumption
  c_o_tild_a_t     c_o_tild_b_t                                       // Complementarity b/w optimizers' consumption and gov consumption
  c_r_tild_a_t     c_r_tild_b_t                                       // Complementarity b/w RoTs' consumption and gov consumption
  c_o_a_t          c_o_b_t                                            // Consumption Optimizers 
  c_r_a_t          c_r_b_t                                            // Consumption Rule-of-Thumbers (RoT)
  in_a_t           in_b_t                                             // Total Investment
  in_o_a_t         in_o_b_t                                           // Investment Optimizers
  lambda_o_a_t     lambda_o_b_t                                       // Margin_a_tsl Utility Consumption Optimizers
  lambda_r_a_t     lambda_r_b_t                                       // Margin_a_tsl Utility Consumption RoT
  n_a_t            n_b_t                                              // Total Employment
  nP_a_t           nP_b_t                                             // Private Employment
  nG_a_t           nG_b_t                                             // Public Employment
  wr_a_t           wr_b_t                                             // Real Wage
  wrG_a_t          wrG_b_t                                            // Public wages
  mg_a_t           mg_b_t                                             // Public wage markup (time-varying)
  k_a_t            k_b_t                                              // Total Capital
  k_o_a_t          k_o_b_t                                            // Capital Optimizers
  mcr_a_t          mcr_b_t                                            // Marginal Cost
  rk_a_t           rk_b_t                                             // Rental Rate of Capital
  q_a_t            q_b_t                                              // Price of Capital
  Rk_a_t           Rk_b_t                                             // Effective Rate of Return of Capital
  l_a_t            l_b_t                                              // Total Labor Force
  l_o_a_t          l_o_b_t                                            // Labor Force Optimizers
  l_r_a_t          l_r_b_t                                            // Labor Force RoTs
  ur_a_t           ur_b_t                                             // Total Unemployment Rate
  cG_a_t           cG_b_t                                             // Public consumtpion
  tauw_a_t         tauw_b_t                                           // Income taxes (includes social security contribution of employees)
  tausc_a_t        tausc_b_t                                          // Social security contribution (of employers)
  tauk_a_t         tauk_b_t                                           // Capital tax (depreciation deductable)
  tauc_a_t         tauc_b_t                                           // Consumption tax (paid by consumers)
  TR_r_a_t         TR_r_b_t                                           // Transfers (RoTs)
  TR_o_a_t         TR_o_b_t                                           // Transfers (Optimizers)
  TR_a_t           TR_b_t                                             // Total Transfers
  T_a_t            T_b_t                                              // Lump Sum Transfers (Optimizers only)   
  UB_a_t           UB_b_t                                             // Unemployment benefit shock
  BG_a_t           BG_b_t                                             // Real government debt
  kG_a_t           kG_b_t                                             // Public capital stock
  inG_a_t          inG_b_t                                            // Public cap investment
  yG_a_t           yG_b_t                                             // "Public good" 
  omega_o_a_t      omega_o_b_t                                        // Union Bargaining Lagrange Multiplicator Optimizers
  omega_r_a_t      omega_r_b_t                                        // Union Bargaining Lagrange Multiplicator RoTs
  pi_w_a_t         pi_w_b_t                                           // Wage Inflation
  kappaw_a_t       kappaw_b_t                                         // Scaling parameter labor supply (not constant)
  pr_aa_t          pr_ba_t          pr_ca_t                           // relative prices
  pr_bb_t          pr_ab_t          pr_cb_t                           // relative prices
  pr_ac_t          pr_bc_t                                            // relative prices
  pi_a_t           pi_b_t           pi_c_t                            // CPI inflation
  pi_aa_t          pi_bb_t                                            // product-specific inflation 
  pi_ab_t          pi_bc_t                                            // product-specific inflation 
  pi_ac_t          pi_ba_t                                            // product-specific inflation 
  c_aa_t           c_ba_t                                             // Total consumption of products from Country A in i
  c_bb_t           c_ab_t                                             // Total consumption of products from Country B in i
  c_ac_t           c_bc_t                                             // Total consumption of products from Country C in i
  in_aa_t          in_ba_t                                            // Total investment of products from Country A in i
  in_bb_t          in_ab_t                                            // Total investment of products from Country B in i
  in_ac_t          in_bc_t                                            // Total investment of products from Country C in i
  Del_S_bc_t       Del_S_ac_t                                         // Change nomin_a_tsl Exchange Rate
  rer_ba_t         rer_ca_t         rer_bc_t         rer_ac_t         // real Exchange Rate
  B_c_t                                                               // c lending to a and b 
  B_a_t                                                               // a lending to b
  B_ac_t           B_bc_t           B_ba_t                            // Total Real Bond Holdings
  nfa_a_t          nfa_b_t          nfa_c_t                           // Net Foreign Asset Position
  ca_a_t           ca_b_t           ca_c_t                            // Current Account
  a_a_t            a_b_t            z_g_t                             // Technology shock
  theta_a_t        theta_b_t                                          // Price markup shock
  thetaw_a_t       thetaw_b_t                                         // Price markup shock
  e_b_a_t          e_b_b_t                                            // Preference shock
  e_n_a_t          e_n_b_t                                            // Labor supply shock
  e_in_a_t         e_in_b_t                                           // Investment shock
  e_rp_a_t         e_rp_b_t                                           // Risk premium shock
  e_tau_a_t        e_tau_b_t                                          // Value-Added Tax shock
  e_RoW_a_t        e_RoW_b_t                                          // Country-specific demand shocks from RoW
  e_RoE_a_t        e_RoE_b_t                                          // Country-specific demand shocks from RoE
  pi_c_var_t       i_c_var_t        y_c_var_t        y_c_aux_t        // Variables of VAR for country c
  shock_einG_a_t   shock_einG_b_t                                     // Government investment shock
  shock_eTR_a_t    shock_eTR_b_t                                      // Transfer shock
  shock_eT_a_t     shock_eT_b_t                                       // Lump-sum taxes shocks
  shock_etauw_a_t  shock_etauw_b_t                                    // Income taxes shock
  shock_etausc_a_t shock_etausc_b_t                                   // Social security contribution (of employers) shock
  shock_etauc_a_t  shock_etauc_b_t                                    // Consumption tax (paid by consumers) shock
  shock_etauk_a_t  shock_etauk_b_t                                    // Capital tax shock
  shock_enG_a_t    shock_enG_b_t                                      // Public Employment shock
  shock_eCG_a_t    shock_eCG_b_t                                      // Public consumption shock
  shock_emg_a_t    shock_emg_b_t                                      // Public wage markup shock
  epsilon_enG_a_t  epsilon_enG_b_t                                    // Public Employment shock (AR(1) process assumed)
  
;

varexo  
  nua_a       nub_a                // Technology shock
  nua_etheta  nub_etheta           // Price markup shock
  nua_ethetaw nub_ethetaw          // Wage markup shock
  nua_eb      nub_eb               // Preference shock
  nua_en      nub_en               // Labor supply shock
  nua_ein     nub_ein              // Investment shock
  nua_erp     nub_erp              // Risk premium shock               
  nua_ecG     nub_ecG              // Public consumption spending
  nua_etau    nub_etau             // Value-Added Tax shock
  nua_etauw   nub_etauw            // Labor Tax shock
  nua_etausc  nub_etausc           // Social contribution shock
  nua_etauk   nub_etauk            // Capital Tax shock
  nua_etauc   nub_etauc            // Consumption Tax shock
  nua_einG    nub_einG             // Public Investment shock
  nua_enG     nub_enG              // Public Employment shock
  nua_eTR     nub_eTR              // Transfer shock (excluding unemployment benefits)
  nua_eT      nub_eT               // Lump-sum tax shock
  nua_emg     nub_emg              // Public wage shock
  nua_RoW     nub_RoW              // Country-specific demand shocks from RoW
  nua_RoE     nub_RoE              // Country-specific demand shocks from RoE
  eps_y_c     eps_i_c    eps_pi_c  // Shocks foreign VAR 
  eps_z_g                          // Global technology shock
  nua_eM                           // Monetary policy shock
;

parameters  
  //***************************************************************************************
  // Defin_a_tstion of deep model parameters
  //***************************************************************************************
  mu_a              mu_b                      // share of RoT-households
  mu_bar_a          mu_bar_b                  // Transfers distribution parameter
  betta_a           betta_b                   // discount factor
  delta_a           delta_b                   // depreciation rate
  sigma_a           sigma_b                   // consumption elasticity
  hab_a             hab_b                     // habit formation
  alpha_G_a         alpha_G_b                 // Measures how valuable gov spending is for consumer
  psi_a             psi_b                     // inverse Frisch elasticity (only if rrs=0, otherwise more complicated...)
  psi_l_a           psi_l_b                   // scaling parameter to create slugish adjustment of labor force (in kappa_w_a)
  kappaw_a_ts       kappaw_b_ts               // Scaling parameter labor supply (in the ss)
  rho_a             rho_b                     // capital share
  upsilon_a         upsilon_b                 // investment adjustment cost
  theta_a           theta_b                   // Price elasticity
  thetaw_a          thetaw_b                  // Wage elasticity 
  xip_a             xip_b                     // price indexation
  xiw_a             xiw_b                     // wage indexation
  rho_a_i                                     // Taylor Rule - Interest smoothing 
  phi_a_pi                                    // Taylor Rule - Inflation gap target
  phi_a_y                                     // Taylor Rule - Output gap target
  phi                                         // risk premium parameter
  gamma_a           gamma_b                   // Trend growth of reals variables
  eta_a             eta_b             eta_c   // determines elasticity of substitution between home and foreign traded goods
  n_aa              n_ab              n_ac    // share of goods from i used in country A
  n_bb              n_ba              n_bc    // share of goods from i used in country B
  n_cc              n_ca              n_cb    // share of goods from i used in country C
  pop_a             pop_b             pop_c   // population Size
  rho_eg_a          rho_eg_b                  // AR coefficient Gov. Spending
  rho_eTR_a         rho_eTR_b                 // AR coefficient Transfers
  rho_eT_a          rho_eT_b                  // AR coefficient Lump-sum taxes
  rho_emg_a         rho_emg_b                 // AR coefficient public wage markup
  rho_a_a           rho_a_b                   // AR coefficient Technology
  rho_etheta_a      rho_etheta_b              // AR coefficient price markup shock
  rho_ethetaw_a     rho_ethetaw_b             // AR coefficient wage markup shock
  rho_eb_a          rho_eb_b                  // AR coefficient Preference
  rho_en_a          rho_en_b                  // AR coefficient Labor Supply
  rho_ein_a         rho_ein_b                 // AR coefficient Investment
  rho_erp_a         rho_erp_b                 // AR coefficient Risk Premium
  rho_eRoW_a        rho_eRoW_b                // AR coefficient country-specific demand shock (RoW)
  rho_eRoE_a        rho_eRoE_b                // AR coefficient country-specific demand shock (RoW)
  rho_etau_a        rho_etau_b                // AR coefficient value-added tax
  rho_etauw_a       rho_etauw_b               // AR coefficient labor tax
  rho_etausc_a      rho_etausc_b              // AR coefficient labor tax
  rho_etauk_a       rho_etauk_b               // AR coefficient capital tax
  rho_etauc_a       rho_etauc_b               // AR coefficient consumption tax
  rho_einG_a        rho_einG_b                // AR coefficient Public Investment
  rho_epsilon_enG_a rho_epsilon_enG_b         // AR coefficient Public Employment
  rho_UB_a          rho_UB_b                  // AR coefficient Unemployment Benefits
  FC_a              FC_b                      // Fixed Costs
  UB_a              UB_b                      // Unemployment benefits in the steady state
  rrs_a             rrs_b                     // Replacement ratio
  upsilon_p_a       upsilon_p_b               // price adjustment cost
  upsilon_w_a       upsilon_w_b               // wage adjustment cost
  upsilon_n_a       upsilon_n_b               // employment adjustment cost
  A_a               A_b                       // Total factor productivity shifter (to ensure GDP_a_ts=1)
  z_a               z_b                       // Public total factor productivity shifter (to ensure yG_i_ts=1)
  mg_a              mg_b                      // markup of public over private wages 
  eta_kG_a          eta_kG_b                  // "Importance" of public capital for private production
  eta_nG_a          eta_nG_b                  // "Importance" of public employment for private production
  xi_b_etau_a       xi_b_etau_b               // Feedback of debt on value added tax
  xi_b_etauw_a      xi_b_etauw_b              // Feedback of debt on labor tax
  xi_y_etauw_a      xi_y_etauw_b              // Feedback of output on labor tax
  xi_b_etausc_a     xi_b_etausc_b             // Feedback of debt on social contribution rate
  xi_y_etausc_a     xi_y_etausc_b             // Feedback of debt on social contribution rate
  xi_b_etauk_a      xi_b_etauk_b              // Feedback of debt on capital tax
  xi_y_etauk_a      xi_y_etauk_b              // Feedback of debt on capital tax
  xi_b_etauc_a      xi_b_etauc_b              // Feedback of debt on consumption tax
  xi_y_etauc_a      xi_y_etauc_b              // Feedback of debt on consumption tax
  xi_b_eg_a         xi_b_eg_b                 // Feedback of debt on government spending
  xi_y_eg_a         xi_y_eg_b                 // Feedback of output on government spending
  xi_b_eTR_a        xi_b_eTR_b                // Feedback of debt on transfers
  xi_y_eTR_a        xi_y_eTR_b                // Feedback of output on transfers
  xi_b_eT_a         xi_b_eT_b                 // Feedback of debt on lump-sum taxes
  xi_y_eT_a         xi_y_eT_b                 // Feedback of output on lump-sum taxes
  xi_b_emg_a        xi_b_emg_b                // Feedback of debt on public wage markup
  xi_b_ein_a        xi_b_ein_b                // Feedback of debt on government investment
  xi_y_ein_a        xi_y_ein_b                // Feedback of output on government investment
  xi_b_enG_a        xi_b_enG_b                // Feedback of debt on government employment
  xi_y_enG_a        xi_y_enG_b                // Feedback of output on government emplyoment
  xi_y_emg_a        xi_y_emg_b                // Feedback of of output on public wage markup
  nu_etauw_a        nu_etauw_b                // Feedback of output on labor tax
  nu_eg_a           nu_eg_b                   // Feedback of debt on government spending
  nu_eT_r_a         nu_eT_r_b                 // Feedback of output on lump-sum taxes (RoTs)
  nu_ein_a          nu_ein_b                  // Feedback of debt on government investment
  psi_cG_a          psi_cG_b                  // Pre-announcement parameter
  psi_inG_a         psi_inG_b                 // Pre-announcement parameter
  psi_TR_a          psi_TR_b                  // Pre-announcement parameter
  psi_T_a           psi_T_b                   // Pre-announcement parameter
  psi_tauw_a        psi_tauw_b                // Pre-announcement parameter
  psi_tausc_a       psi_tausc_b               // Pre-announcement parameter
  psi_tauc_a        psi_tauc_b                // Pre-announcement parameter
  psi_tauk_a        psi_tauk_b                // Pre-announcement parameter
  psi_nG_a          psi_nG_b                  // Pre-announcement parameter
  psi_mg_a          psi_mg_b                  // Pre-announcement parameter
  a11  a12  a13  c11                          // Coefficients of foreign VAR
  a21  a22  a23  a24  c21  c22  c24           // Coefficients of foreign VAR
  a31  a32  a33  a34  c31  c32  c33  c34      // Coefficients of foreign VAR
  a44  c44                                    // Coefficients of foreign VAR
  tau_a   tau_b                               // Value-added tax rate target (in fiscal rule)
  tauw_a  tauw_b                              // Wage income tax rate target (in fiscal rule)
  tausc_a  tausc_b                            // Social security contribution rate target (in fiscal rule)
  tauk_a  tauk_b                              // Capital tax rate target (in fiscal rule)
  tauc_a  tauc_b                              // Consumption tax rate target (in fiscal rule)
  gc_a  gc_b  gc_c                            // Public consumption as share of GDP
  gin_a  gin_b  gin_c                         // Public investment as share of GDP
  gTR_a  gTR_b                                // Public transfers as share of GDP (including unemployment benefits)
  gn_a  gn_b                                  // Share of public employment of total employment
  c_c  in_c                                   // Consumption and investment share for RoW
  //***************************************************************************************
  // Definition of steady state model parameters
  //***************************************************************************************
  i_a_ts        i_b_ts        i_c_ts    // Interest Rate
  i_Ga_ts       i_Gb_ts                 // Government bond rate
  i_policy_ts                           // Policy Rate EMU
  y_a_ts        y_b_ts        y_c_ts    // Output
  c_a_ts        c_b_ts                  // Total Consumption
  c_o_a_ts      c_o_b_ts                // Consumption Optimizers 
  c_r_a_ts      c_r_b_ts                // Consumption Rule-of-Thumbers (RoT)
  c_tild_a_ts   c_tild_b_ts             // Complementarity b/w private consumption and gov consumption
  in_a_ts       in_b_ts                 // Total Investment
  in_o_a_ts     in_o_b_ts               // Investment Optimizers
  lambda_o_a_ts lambda_o_b_ts           // Margin_a_tssl Utility Consumption Optimizers
  n_a_ts        n_b_ts                  // Total Employment
  nP_a_ts       nP_b_ts                 // Private Employment
  nG_a_ts       nG_b_ts                 // Public Employment
  wr_a_ts       wr_b_ts                 // Real Wage
  wrG_a_ts      wrG_b_ts                // Public wages
  k_a_ts        k_b_ts                  // Total Capital
  k_o_a_ts      k_o_b_ts                // Capital Optimizers
  mcr_a_ts      mcr_b_ts                // Margin_a_tssl Cost
  rk_a_ts       rk_b_ts                 // Rental Rate of Capital
  q_a_ts        q_b_ts                  // Price of Capital
  ex_a_ts       ex_b_ts                 // Exports
  im_a_ts       im_b_ts                 // Imports
  Rk_a_ts       Rk_b_ts                 // Effective Rate of Return of Capital
  l_a_ts        l_b_ts                  // Total Labor Force
  l_o_a_ts      l_o_b_ts                // Labor Force Optimizers
  l_r_a_ts      l_r_b_ts                // Labor Force RoTs
  ur_a_ts       ur_b_ts                 // Total Unemployment Rate
  cG_a_ts       cG_b_ts       cG_c_ts   // Public consumtpion
  TR_r_a_ts     TR_r_b_ts               // Transfers (RoTs)
  TR_o_a_ts     TR_o_b_ts               // Transfers (Optimizers)
  TR_a_ts       TR_b_ts                 // Total Transfers
  T_a_ts        T_b_ts                  // Lump-Sum-Taxes (Optimizers only)
  BG_a_ts       BG_b_ts                 // Real government debt
  kG_a_ts       kG_b_ts                 // Public capital stock
  inG_a_ts      inG_b_ts                // Public cap investment
  yG_a_ts       yG_b_ts                 // "Public good" 
  GDP_a_ts      GDP_b_ts                // (Total) GDP including wage bill for public employment (as in national accounts)   
  omega_o_a_ts  omega_o_b_ts            // Union Bargaining Lagrange Multiplicator Optimizers
  omega_r_a_ts  omega_r_b_ts            // Union Bargaining Lagrange Multiplicator RoTs
  pr_ts                                 // relative prices
  pi_ts                                 // CPI and PPI inflation
  B_c_ts        B_a_ts                  // x
  B_ac_ts       B_bc_ts       B_ba_ts   // Total Real Bond Holdings
  nfa_a_ts      nfa_b_ts      nfa_c_ts  // Net Foreign Asset Position
;

set_params_31_08_aw1;

model;
//*************************************************************************
// equations relevant for country A (monetary union member)
//*************************************************************************
// Equation 1
lambda_o_a_t*pi_a_t(+1) = betta_a*exp(e_rp_a_t)*(1+i_a_t)*lambda_o_a_t(+1);
lambda_o_a_t*pi_a_t(+1) = betta_a*(1+i_Ga_t)*lambda_o_a_t(+1);

// Equation 2
c_o_tild_a_t = c_o_a_t ;

c_r_tild_a_t = c_r_a_t ;

lambda_o_a_t=exp(e_b_a_t)*(c_o_tild_a_t-hab_a*c_o_tild_a_t(-1))^(-sigma_a)/(1+tauc_a_t);

lambda_r_a_t=exp(e_b_a_t)*(c_r_tild_a_t-hab_a*c_r_tild_a_t(-1))^(-sigma_a)/(1+tauc_a_t);


//*************************************************************************
// Introduction of labor force and unemployment rate
//*************************************************************************

// Labor force particpation constraint
lambda_o_a_t*((1-tauw_a_t)*(wr_a_t*nP_a_t+wrG_a_t*nG_a_t)+UB_a_t*(l_o_a_t-n_a_t)) = kappaw_a_t*exp(e_n_a_t)*l_o_a_t^(psi_a)*n_a_t;
lambda_r_a_t*((1-tauw_a_t)*(wr_a_t*nP_a_t+wrG_a_t*nG_a_t)+UB_a_t*(l_r_a_t-n_a_t)) = kappaw_a_t*exp(e_n_a_t)*l_r_a_t^(psi_a)*n_a_t;
l_a_t = mu_a*l_r_a_t + (1-mu_a)*l_o_a_t;
kappaw_a_t = kappaw_a_ts*(l_a_t/l_a_ts)^psi_l_a;

// Unemployment Rate
ur_a_t = (l_a_t-n_a_t)/l_a_t;

// Total Employment
n_a_t = nP_a_t + nG_a_t;

// Rotemberg pricing on labor market
// Wage inflation
pi_w_a_t = wr_a_t/wr_a_t(-1)*pi_a_t;

// Union bargaining solution
(mu_a*lambda_r_a_t + (1-mu_a)*lambda_o_a_t)*((1-tauw_a_t)*(thetaw_a_t*nP_a_t-nP_a_t) - UB_a_t*thetaw_a_t*nP_a_t/wr_a_t + upsilon_w_a*(pi_w_a_t/(pi_w_a_t(-1)^xiw_a*pi_ts^(1-xiw_a))-1)*pi_w_a_t/(pi_w_a_t(-1)^xiw_a*pi_ts^(1-xiw_a))) - (lambda_o_a_t*omega_o_a_t+lambda_r_a_t*omega_r_a_t)*((1-tauw_a_t)*(thetaw_a_t*nP_a_t-nP_a_t) - UB_a_t*thetaw_a_t*nP_a_t/wr_a_t) + omega_r_a_t*l_r_a_t^psi_a*nP_a_t*thetaw_a_t*kappaw_a_t/wr_a_t*exp(e_n_a_t)*exp(e_b_a_t) + omega_o_a_t*l_o_a_t^psi_a*nP_a_t*thetaw_a_t*kappaw_a_t/wr_a_t*exp(e_n_a_t)*exp(e_b_a_t) = n_a_t^psi_a*thetaw_a_t*kappaw_a_t*nP_a_t/wr_a_t*exp(e_n_a_t)*exp(e_b_a_t) + betta_a*(mu_a*lambda_r_a_t(+1)+(1-mu_a)*lambda_o_a_t(+1))*upsilon_w_a*(pi_w_a_t(+1)/(pi_w_a_t^xiw_a*pi_ts^(1-xiw_a))-1)*pi_w_a_t(+1)^2*1/(pi_a_t(+1)*(pi_w_a_t(-1)^xiw_a*pi_ts^(1-xiw_a)));

mu_a*lambda_r_a_t*UB_a_t = omega_r_a_t*(lambda_r_a_t*UB_a_t-psi_a*l_r_a_t^(psi_a-1)*n_a_t*kappaw_a_t);
(1-mu_a)*lambda_o_a_t*UB_a_t = omega_o_a_t*(lambda_o_a_t*UB_a_t-psi_a*l_o_a_t^(psi_a-1)*n_a_t*kappaw_a_t);


//*************************************************************************
// Government
//*************************************************************************

// government spending shock country A

log(cG_a_t/cG_a_ts) = rho_eg_a*log(cG_a_t(-1)/cG_a_ts) - xi_b_eg_a*log(BG_a_t(-1)/BG_a_ts) - xi_y_eg_a*log(y_a_t(-1)/y_a_ts) + psi_cG_a*shock_eCG_a_t + (1-psi_cG_a)*shock_eCG_a_t(-1);
log(inG_a_t/inG_a_ts) = rho_einG_a*log(inG_a_t(-1)/inG_a_ts) - xi_b_ein_a*log(BG_a_t(-1)/BG_a_ts) - xi_y_ein_a*log(y_a_t(-1)/y_a_ts) + psi_inG_a*shock_einG_a_t + (1-psi_inG_a)*shock_einG_a_t(-1);
log(TR_a_t/TR_a_ts) = rho_eTR_a*log(TR_a_t(-1)/TR_a_ts) - xi_b_eTR_a*log(BG_a_t(-1)/BG_a_ts) - xi_y_eTR_a*log(y_a_t(-1)/y_a_ts) + psi_TR_a*shock_eTR_a_t + (1-psi_TR_a)*shock_eTR_a_t(-1);
(T_a_t-T_a_ts)/y_a_ts = rho_eT_a*(T_a_t(-1)-T_a_ts)/y_a_ts + xi_b_eT_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_eT_a*log(y_a_t(-1)/y_a_ts) + psi_T_a*shock_eT_a_t + (1-psi_T_a)*shock_eT_a_t(-1); 
tauw_a_t-tauw_a = rho_etauw_a*(tauw_a_t(-1)-tauw_a) + xi_b_etauw_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_etauw_a*log(y_a_t(-1)/y_a_ts) + psi_tauw_a*shock_etauw_a_t + (1-psi_tauw_a)*shock_etauw_a_t(-1);
tausc_a_t - tausc_a = rho_etausc_a*(tausc_a_t(-1)-tausc_a) + xi_b_etausc_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_etausc_a*log(y_a_t(-1)/y_a_ts) + psi_tausc_a*shock_etausc_a_t + (1-psi_tausc_a)*shock_etausc_a_t(-1);
tauk_a_t = tauk_a;
tauc_a_t = tauc_a + rho_etauc_a*(tauc_a_t(-1)-tauc_a) + xi_b_etauc_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_etauc_a*log(y_a_t(-1)/y_a_ts) + psi_tauc_a*shock_etauc_a_t + (1-psi_tauc_a)*shock_etauc_a_t(-1);
nG_a_t = nG_a_ts + rho_epsilon_enG_a*(nG_a_t(-1)-nG_a_ts) - xi_b_enG_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_enG_a*log(y_a_t(-1)/y_a_ts) + psi_nG_a*shock_enG_a_t + (1-psi_nG_a)*shock_enG_a_t(-1);
UB_a_t = UB_a;
TR_a_t = mu_a*TR_r_a_t + (1-mu_a)*TR_o_a_t;
mu_bar_a*(TR_o_a_t/TR_o_a_ts-1) = (1-mu_bar_a)*(TR_r_a_t/TR_r_a_ts-1);
cG_a_t*pr_aa_t + TR_a_t + UB_a_t*(mu_a*(l_r_a_t-n_a_t)+(1-mu_a)*(l_o_a_t-n_a_t)) + inG_a_t*pr_aa_t + (1+tausc_a_t)*wrG_a_t*nG_a_t +(1+i_Ga_t(-1))*BG_a_t(-1)/pi_a_t = BG_a_t + (tauw_a_t+tausc_a_t)*(wr_a_t*nP_a_t+wrG_a_t*nG_a_t) + tauk_a_t*(rk_a_t-delta_a)*k_a_t(-1) + tau_a*exp(e_tau_a_t)*y_a_t*pr_aa_t + tauc_a_t*c_a_t + (1-mu_a)*T_a_t;
kG_a_t = (1-delta_a)*kG_a_t(-1) + inG_a_t;
yG_a_t = z_a*kG_a_t^eta_kG_a*nG_a_t^eta_nG_a;
mg_a_t = mg_a;
log(wrG_a_t/wrG_a_ts) = rho_emg_a*log(wrG_a_t(-1)/wrG_a_ts) - xi_b_emg_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_emg_a*log(y_a_t(-1)/y_a_ts) + psi_mg_a*shock_emg_a_t + (1-psi_mg_a)*shock_emg_a_t(-1);

shock_eCG_a_t   = nua_ecG;
shock_einG_a_t  = nua_einG;
shock_eTR_a_t   = nua_eTR;
shock_eT_a_t    = nua_eT;
shock_etauw_a_t = nua_etauw;
shock_etausc_a_t= nua_etausc;
shock_etauc_a_t = nua_etauc;
shock_etauk_a_t = nua_etauk;
shock_enG_a_t  = nua_enG;
shock_emg_a_t = nua_emg;


// Equation 10
y_a_t=(exp(a_a_t)*A_a*exp(z_g_t))*yG_a_t*(k_a_t(-1))^(rho_a)*(nP_a_t)^(1-rho_a)-FC_a;

// Equation 11
rk_a_t = mcr_a_t*exp(a_a_t)*A_a*exp(z_g_t)*rho_a*((k_a_t(-1))/nP_a_t)^(rho_a-1)*yG_a_t;

// Equation 12
wr_a_t*(1+tausc_a_t) = mcr_a_t*exp(a_a_t)*A_a*exp(z_g_t)*(1-rho_a)*((k_a_t(-1))/nP_a_t)^(rho_a)*yG_a_t - wr_a_t*(1+tausc_a_t)*upsilon_n_a*(nP_a_t-nP_a_t(-1)) + betta_a*upsilon_n_a*(lambda_r_a_t(+1)/lambda_r_a_t*wr_a_t(+1)*(1+tausc_a_t(+1))*(nP_a_t(+1)-nP_a_t));


// Equation 13
k_o_a_t=(1-delta_a)*k_o_a_t(-1)+(in_o_a_t-in_o_a_t*((upsilon_a/2)*((in_o_a_t/in_o_a_t(-1))-1)^2))*(exp(e_in_a_t));

// Equation 14
1=betta_a*(lambda_o_a_t(+1)/lambda_o_a_t)/pi_a_t(+1)*(1+Rk_a_t(+1));

// Equation 15
Rk_a_t=pi_a_t*(q_a_t*(1-delta_a)+(1-tauk_a_t)*(rk_a_t)+tauk_a_t*delta_a)/q_a_t(-1)-1;

// Equation 16
1=q_a_t*(1-((upsilon_a/2)*((in_o_a_t/in_o_a_t(-1))-1)^2)-upsilon_a*(in_o_a_t/in_o_a_t(-1))*((in_o_a_t/in_o_a_t(-1))-1))*exp(e_in_a_t)+
betta_a*(lambda_o_a_t(+1)/lambda_o_a_t)*q_a_t(+1)*(upsilon_a*((in_o_a_t(+1)/in_o_a_t)^2)*((in_o_a_t(+1)/in_o_a_t)-1))*(exp(e_in_a_t(+1)));


// Equation 22
(1-theta_a_t) + theta_a_t*mcr_a_t*pr_aa_t^(-1) + betta_a*(lambda_o_a_t(+1)/lambda_o_a_t*upsilon_p_a*(pi_aa_t(+1)/(pi_aa_t^xip_a*pi_ts^(1-xip_a))-1)*pi_aa_t(+1)^2/pi_a_t(+1)*y_a_t(+1)/y_a_t*1/(pi_aa_t^xip_a*pi_ts^(1-xip_a))) = upsilon_p_a*(pi_aa_t/(pi_aa_t(-1)^xip_a*pi_ts^(1-xip_a))-1)*pi_aa_t/(pi_aa_t(-1)^xip_a*pi_ts^(1-xip_a));

// Equation 23
pr_ba_t=rer_ba_t*pr_aa_t;

// Equation 24
pr_ca_t=rer_ca_t*pr_aa_t;

// Equation 25
1=n_aa*(pr_aa_t)^(1-eta_a)+n_ab*(pr_ab_t)^(1-eta_a)+n_ac*(pr_ac_t)^(1-eta_a);

// Equation 26
pi_a_t=(n_aa*(pi_aa_t*pr_aa_t(-1))^(1-eta_a) + n_ab*(pi_ab_t*pr_ab_t(-1))^(1-eta_a)+ n_ac*(pi_ac_t*pr_ac_t(-1))^(1-eta_a))^(1/(1-eta_a));

// Equation 27
c_aa_t = mu_a*(n_aa*(pr_aa_t)^(-eta_a)*c_r_a_t) + (1-mu_a)*(n_aa*(pr_aa_t)^(-eta_a)*c_o_a_t);

// Equation 28
in_aa_t = (1-mu_a)*n_aa*(pr_aa_t)^(-eta_a)*in_o_a_t;

// Equation 64
c_ab_t = (mu_a*n_ab*(pr_ab_t)^(-eta_a)*c_r_a_t + (1-mu_a)*n_ab*(pr_ab_t)^(-eta_a)*c_o_a_t)*exp(e_RoE_a_t);

// Equation 65
in_ab_t = (1-mu_a)*n_ab*(pr_ab_t)^(-eta_a)*in_o_a_t*exp(e_RoE_a_t);

// Equation 99
c_ac_t = mu_a*n_ac*(pr_ac_t)^(-eta_a)*c_r_a_t + (1-mu_a)*n_ac*(pr_ac_t)^(-eta_a)*c_o_a_t;

// Equation 100
in_ac_t = (1-mu_a)*n_ac*(pr_ac_t)^(-eta_a)*in_o_a_t;


(1+tauc_a_t)*c_r_a_t = (1-tauw_a_t)*(nP_a_t*wr_a_t+nG_a_t*wrG_a_t) + UB_a_t*(l_r_a_t-n_a_t) + TR_r_a_t;

c_a_t = mu_a*c_r_a_t + (1-mu_a)*c_o_a_t;
k_a_t = (1-mu_a)*k_o_a_t;
in_a_t = (1-mu_a)*in_o_a_t;

y_a_t = c_aa_t+in_aa_t+pop_b/pop_a*(c_ba_t+in_ba_t)+pop_c/pop_a*exp(e_RoW_a_t)*((n_ca*(pr_ca_t)^(-eta_c)*c_c*y_c_t)+(n_ca*(pr_ca_t)^(-eta_c)*in_c*y_c_t))+cG_a_t + inG_a_t ;


// Equation 33

// Equation 36
log((1+i_policy_t)/(1+i_policy_ts)) = rho_a_i*log((1+i_policy_t(-1))/(1+i_policy_ts))   
                                      + (1-rho_a_i)*phi_a_pi*(pop_a/(pop_b+pop_a)*log(pi_a_t/pi_ts)
                                        +(pop_b/(pop_b+pop_a)*log(pi_b_t/pi_ts))) + (1-rho_a_i)*phi_a_y*(pop_a/(pop_b+pop_a)*log(y_a_t/y_a_ts)
                                        +(pop_b/(pop_b+pop_a)*log(y_b_t/y_b_ts)))
                                      + nua_eM;                                      
// Possible modification: Use GDP_i_t instead of y_i_t

// Equation 37
// Maybe it makes sense to use GDP instead of y_a_t and y_b_t
log((1+i_policy_t)/(1+i_policy_ts))  = pop_a/(pop_b+pop_a)*log((1+i_a_t)/(1+i_a_ts)) + pop_b/(pop_b+pop_a)*log((1+i_b_t)/(1+i_b_ts));


//*************************************************************************
// equations relevant for country B (monetary union member)
//*************************************************************************

// Equation 38
lambda_o_b_t*pi_b_t(+1) = betta_b*(1+i_b_t)*exp(e_rp_a_t)*lambda_o_b_t(+1);
lambda_o_b_t*pi_b_t(+1) = betta_b*(1+i_Gb_t)*lambda_o_b_t(+1);

// Equation 39
c_o_tild_b_t = c_o_b_t ;

c_r_tild_b_t = c_r_b_t ;

lambda_o_b_t=exp(e_b_b_t)*(c_o_tild_b_t-hab_b*c_o_tild_b_t(-1))^(-sigma_b)/(1+tauc_b_t);

lambda_r_b_t=exp(e_b_b_t)*(c_r_tild_b_t-hab_b*c_r_tild_b_t(-1))^(-sigma_b)/(1+tauc_b_t);

//*************************************************************************
// Introduction of labor force and unemployment rate
//*************************************************************************

// Labor force particpation constraint
lambda_o_b_t*((1-tauw_b_t)*(wr_b_t*nP_b_t+wrG_b_t*nG_b_t)+UB_b_t*(l_o_b_t-n_b_t)) = kappaw_b_t*exp(e_n_b_t)*l_o_b_t^(psi_b)*n_b_t;
lambda_r_b_t*((1-tauw_b_t)*(wr_b_t*nP_b_t+wrG_b_t*nG_b_t)+UB_b_t*(l_r_b_t-n_b_t)) = kappaw_b_t*exp(e_n_b_t)*l_r_b_t^(psi_b)*n_b_t;
l_b_t = mu_b*l_r_b_t + (1-mu_b)*l_o_b_t;
kappaw_b_t = kappaw_b_ts*(l_b_t/l_b_ts)^psi_l_b;


// Unemployment Rate
ur_b_t = (l_b_t-n_b_t)/l_b_t;

// Total Employment
n_b_t = nP_b_t + nG_b_t;

// Rotemberg pricing on labor market
// Wage inflation
pi_w_b_t = wr_b_t/wr_b_t(-1)*pi_b_t;

// Union bargaining solution
(mu_b*lambda_r_b_t + (1-mu_b)*lambda_o_b_t)*((1-tauw_b_t)*(thetaw_b_t*nP_b_t-nP_b_t) - UB_b_t*thetaw_b_t*nP_b_t/wr_b_t + upsilon_w_b*(pi_w_b_t/(pi_w_b_t(-1)^xiw_b*pi_ts^(1-xiw_b))-1)*pi_w_b_t/(pi_w_b_t(-1)^xiw_b*pi_ts^(1-xiw_b))) - (lambda_o_b_t*omega_o_b_t+lambda_r_b_t*omega_r_b_t)*((1-tauw_b_t)*(thetaw_b_t*nP_b_t-nP_b_t) - UB_b_t*thetaw_b_t*nP_b_t/wr_b_t) + omega_r_b_t*l_r_b_t^psi_b*nP_b_t*thetaw_b_t*kappaw_b_t/wr_b_t*exp(e_n_b_t)*exp(e_b_b_t) + omega_o_b_t*l_o_b_t^psi_b*nP_b_t*thetaw_b_t*kappaw_b_t/wr_b_t*exp(e_n_b_t)*exp(e_b_b_t) = n_b_t^psi_b*thetaw_b_t*kappaw_b_t*nP_b_t/wr_b_t*exp(e_n_b_t)*exp(e_b_b_t) + betta_b*(mu_b*lambda_r_b_t(+1)+(1-mu_b)*lambda_o_b_t(+1))*upsilon_w_b*(pi_w_b_t(+1)/(pi_w_b_t^xiw_b*pi_ts^(1-xiw_b))-1)*pi_w_b_t(+1)^2*1/(pi_b_t(+1)*(pi_w_b_t^xiw_b*pi_ts^(1-xiw_b)));

mu_b*lambda_r_b_t*UB_b_t = omega_r_b_t*(lambda_r_b_t*UB_b_t-psi_b*l_r_b_t^(psi_b-1)*n_b_t*kappaw_b_t);
(1-mu_b)*lambda_o_b_t*UB_b_t = omega_o_b_t*(lambda_o_b_t*UB_b_t-psi_b*l_o_b_t^(psi_b-1)*n_b_t*kappaw_b_t);

// Government

log(cG_b_t/cG_b_ts) = rho_eg_b*log(cG_b_t(-1)/cG_b_ts) - xi_b_eg_b*log(BG_b_t(-1)/BG_b_ts) - xi_y_eg_b*log(y_b_t(-1)/y_b_ts) + psi_cG_b*shock_eCG_b_t + (1-psi_cG_b)*shock_eCG_b_t(-1);
log(inG_b_t/inG_b_ts) = rho_einG_b*log(inG_b_t(-1)/inG_b_ts) - xi_b_ein_b*log(BG_b_t(-1)/BG_b_ts) - xi_y_ein_b*log(y_b_t(-1)/y_b_ts)  + psi_inG_b*shock_einG_b_t + (1-psi_inG_b)*shock_einG_b_t(-1);
log(TR_b_t/TR_b_ts) = rho_eTR_b*log(TR_b_t(-1)/TR_b_ts) - xi_b_eTR_b*log(BG_b_t(-1)/BG_b_ts) - xi_y_eTR_b*log(y_b_t(-1)/y_b_ts) + psi_TR_b*shock_eTR_b_t + (1-psi_TR_b)*shock_eTR_b_t(-1);
(T_b_t-T_b_ts)/y_b_ts = rho_eT_b*(T_b_t(-1)-T_b_ts)/y_b_ts + xi_b_eT_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_eT_b*log(y_b_t(-1)/y_b_ts) + psi_T_b*shock_eT_b_t + (1-psi_T_b)*shock_eT_b_t(-1); 
tauw_b_t-tauw_b = rho_etauw_b*(tauw_b_t(-1)-tauw_b) + xi_b_etauw_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_etauw_b*log(y_b_t(-1)/y_b_ts) + psi_tauw_b*shock_etauw_b_t + (1-psi_tauw_b)*shock_etauw_b_t(-1);
tausc_b_t = tausc_b + rho_etausc_b*(tausc_b_t(-1)-tausc_b) + xi_b_etausc_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_etausc_b*log(y_b_t(-1)/y_b_ts) + psi_tausc_b*shock_etausc_b_t + (1-psi_tausc_b)*shock_etausc_b_t(-1);
tauk_b_t = tauk_b;
tauc_b_t = tauc_b + rho_etauc_b*(tauc_b_t(-1)-tauc_b) + xi_b_etauc_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_etauc_b*log(y_b_t(-1)/y_b_ts) + psi_tauc_b*shock_etauc_b_t + (1-psi_tauc_b)*shock_etauc_b_t(-1);
nG_b_t = nG_b_ts + rho_epsilon_enG_b*(nG_b_t(-1)-nG_b_ts) - xi_b_enG_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_enG_b*log(y_b_t(-1)/y_b_ts) + psi_nG_b*shock_enG_b_t + (1-psi_nG_b)*shock_enG_b_t(-1);
UB_b_t = UB_b;
TR_b_t = (1-mu_b)*TR_o_b_t + mu_b*TR_r_b_t;
mu_bar_b*(TR_o_b_t/TR_o_b_ts-1) = (1-mu_bar_b)*(TR_r_b_t/TR_r_b_ts-1);
cG_b_t*pr_bb_t + TR_b_t + UB_b_t*(mu_b*(l_r_b_t-n_b_t)+(1-mu_b)*(l_o_b_t-n_b_t)) + inG_b_t*pr_bb_t + (1+tausc_b_t)*wrG_b_t*nG_b_t +(1+i_Gb_t(-1))*BG_b_t(-1)/pi_b_t = BG_b_t + (tauw_b_t+tausc_b_t)*(wr_b_t*nP_b_t+wrG_b_t*nG_b_t) + tauk_b_t*(rk_b_t-delta_b)*k_b_t(-1) + tau_b*exp(e_tau_b_t)*y_b_t*pr_bb_t + tauc_b_t*c_b_t + (1-mu_b)*T_b_t;
kG_b_t = (1-delta_b)*kG_b_t(-1) + inG_b_t;
yG_b_t = z_b*kG_b_t^eta_kG_b*nG_b_t^eta_nG_b;
mg_b_t = mg_b;

log(wrG_b_t/wrG_b_ts) = rho_emg_b*log(wrG_b_t(-1)/wrG_b_ts) - xi_b_emg_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_emg_b*log(y_b_t(-1)/y_b_ts) + psi_mg_b*shock_emg_b_t + (1-psi_mg_b)*shock_emg_b_t(-1);

shock_eCG_b_t   = nub_ecG;
shock_einG_b_t  = nub_einG;
shock_eTR_b_t   = nub_eTR;
shock_eT_b_t    = nub_eT;
shock_etauw_b_t = nub_etauw;
shock_etausc_b_t= nub_etausc;
shock_etauc_b_t = nub_etauc;
shock_etauk_b_t = nub_etauk;
shock_enG_b_t  = nub_enG;
shock_emg_b_t = nub_emg;

// Equation 47
y_b_t=(exp(a_b_t)*A_b*exp(z_g_t))*yG_b_t*(k_b_t(-1))^(rho_b)*(nP_b_t)^(1-rho_b)-FC_b;

// Equation 48
rk_b_t = mcr_b_t*exp(a_b_t)*A_b*exp(z_g_t)*rho_b*((k_b_t(-1))/nP_b_t)^(rho_b-1)*yG_b_t;

// Equation 49
wr_b_t*(1+tausc_b_t) = mcr_b_t*exp(a_b_t)*A_b*exp(z_g_t)*(1-rho_b)*((k_b_t(-1))/nP_b_t)^(rho_b)*yG_b_t - wr_b_t*(1+tausc_b_t)*upsilon_n_b*(nP_b_t-nP_b_t(-1)) + betta_b*upsilon_n_b*(lambda_r_b_t(+1)/lambda_r_b_t*wr_b_t(+1)*(1+tausc_b_t(+1))*(nP_b_t(+1)-nP_b_t));

// Equation 50
k_o_b_t=(1-delta_b)*k_o_b_t(-1)+(in_o_b_t-in_o_b_t*((upsilon_b/2)*((in_o_b_t/in_o_b_t(-1))-1)^2))*(exp(e_in_b_t));

// Equation 51
1=betta_b*(lambda_o_b_t(+1)/lambda_o_b_t)/pi_b_t(+1)*(1+Rk_b_t(+1));

// Equation 52
Rk_b_t=pi_b_t*(q_b_t*(1-delta_b)+(1-tauk_b_t)*(rk_b_t)+tauk_b_t*delta_b)/q_b_t(-1)-1;

// Equation 53
1=q_b_t*(1-((upsilon_b/2)*((in_o_b_t/in_o_b_t(-1))-1)^2)-upsilon_b*(in_o_b_t/in_o_b_t(-1))*((in_o_b_t/in_o_b_t(-1))-1))*exp(e_in_b_t)+
betta_b*(lambda_o_b_t(+1)/lambda_o_b_t)*q_b_t(+1)*(upsilon_b*((in_o_b_t(+1)/in_o_b_t)^2)*((in_o_b_t(+1)/in_o_b_t)-1))*(exp(e_in_b_t(+1)));

// Equation 59
(1-theta_b_t) + theta_b_t*mcr_b_t*pr_bb_t^(-1) + betta_b*(lambda_o_b_t(+1)/lambda_o_b_t*upsilon_p_b*(pi_bb_t(+1)/(pi_bb_t^xip_b*pi_ts^(1-xip_b))-1)*pi_bb_t(+1)^2/pi_b_t(+1)*y_b_t(+1)/y_b_t*1/(pi_bb_t^xip_b*pi_ts^(1-xip_b))) = upsilon_p_b*(pi_bb_t/(pi_bb_t(-1)^xip_b*pi_ts^(1-xip_b))-1)*pi_bb_t/(pi_bb_t(-1)^xip_b*pi_ts^(1-xip_b));


// Equation 60
pr_ab_t=pr_bb_t*(1/rer_ba_t);

// Equation 61
pr_cb_t=(rer_ca_t/rer_ba_t)*pr_bb_t;

// Equation 62
1=n_bb*(pr_bb_t)^(1-eta_b)+n_ba*(pr_ba_t)^(1-eta_b)+n_bc*(pr_bc_t)^(1-eta_b);

// Equation 63
pi_b_t=(n_bb*(pi_bb_t*pr_bb_t(-1))^(1-eta_b) + n_ba*(pi_ba_t*pr_ba_t(-1))^(1-eta_b)+ n_bc*(pi_bc_t*pr_bc_t(-1))^(1-eta_b))^(1/(1-eta_b));

// Equation 29
c_ba_t = (mu_b*n_ba*(pr_ba_t)^(-eta_b)*c_r_b_t + (1-mu_b)*n_ba*(pr_ba_t)^(-eta_b)*c_o_b_t)*exp(e_RoE_b_t);

// Equation 30
in_ba_t = (1-mu_b)*n_ba*(pr_ba_t)^(-eta_b)*in_o_b_t*exp(e_RoE_b_t);

// Equation 66
c_bb_t = mu_b*(n_bb*(pr_bb_t)^(-eta_b)*c_r_b_t) + (1-mu_b)*(n_bb*(pr_bb_t)^(-eta_b)*c_o_b_t);

// Equation 67
in_bb_t = (1-mu_b)*(n_bb*(pr_bb_t)^(-eta_b)*in_o_b_t);

// Equation 101
c_bc_t = mu_b*n_bc*(pr_bc_t)^(-eta_b)*c_r_b_t + (1-mu_b)*n_bc*(pr_bc_t)^(-eta_b)*c_o_b_t;

// Equation 102
in_bc_t = (1-mu_b)*n_bc*(pr_bc_t)^(-eta_b)*in_o_b_t;

(1+tauc_b_t)*c_r_b_t = (1-tauw_b_t)*(nP_b_t*wr_b_t+nG_b_t*wrG_b_t) + UB_b_t*(l_r_b_t-n_b_t) + TR_r_b_t;

c_b_t = mu_b*c_r_b_t + (1-mu_b)*c_o_b_t;
k_b_t = (1-mu_b)*k_o_b_t;
in_b_t = (1-mu_b)*in_o_b_t;

// Equation 70
y_b_t=pop_a/pop_b*(c_ab_t+in_ab_t)+(c_bb_t+in_bb_t)+pop_c/pop_b*exp(e_RoW_b_t)*((n_cb*(pr_cb_t)^(-eta_c)*c_c*y_c_t)+(n_cb*(pr_cb_t)^(-eta_c)*in_c*y_c_t))+cG_b_t + inG_b_t ;



//*************************************************************************
// equations relevant for country C (outside monetary union)
//*************************************************************************

y_c_t = exp(z_g_t)*y_c_aux_t;

y_c_var_t = log(y_c_aux_t/y_c_ts);
pi_c_var_t = pi_c_t-pi_ts;          
i_c_var_t = i_c_t-i_c_ts;

y_c_var_t  = a11*y_c_var_t(-1) + a12*pi_c_var_t(-1) + a13*i_c_var_t(-1) + c11*eps_y_c;

pi_c_var_t = a21*y_c_var_t(-1) + a22*pi_c_var_t(-1) + a23*i_c_var_t(-1) + a24*z_g_t(-1) + c21*eps_y_c + c22*eps_pi_c + c24*eps_z_g;

i_c_var_t  = a31*y_c_var_t(-1) + a32*pi_c_var_t(-1) + a33*i_c_var_t(-1) + a34*z_g_t(-1) + c31*eps_y_c + c32*eps_pi_c + c33*eps_i_c + c34*eps_z_g;

z_g_t = a44*z_g_t(-1) + c44*eps_z_g;

pr_ac_t=(1/rer_ca_t)*1;
pr_bc_t=(rer_ba_t/rer_ca_t)*1;

//*************************************************************************
// equations determining international relationship
//*************************************************************************

// Equation
// B's holdings of A's bonds
lambda_o_b_t = betta_b*exp(e_rp_a_t)*(1+i_ba_t)*lambda_o_b_t(+1)/pi_b_t(+1);
// Equation
// A's holdings of C's bonds
lambda_o_a_t = betta_a*exp(e_rp_b_t)*(1+i_ac_t)*lambda_o_a_t(+1)*Del_S_ac_t(+1)/pi_a_t(+1);     
// Equation
// new Euler for B's holdings of C's bonds
lambda_o_b_t = betta_b*exp(e_rp_b_t)*(1+i_bc_t)*lambda_o_b_t(+1)*Del_S_bc_t(+1)/pi_b_t(+1);

// Equation
(rer_ac_t*B_ac_t + B_a_t)  = (1 + i_ac_t(-1))*rer_ac_t*B_ac_t(-1)/pi_c_t + (1 + i_ba_t(-1))*B_a_t(-1)/pi_a_t + pr_aa_t*y_a_t - c_a_t - in_a_t - pr_aa_t*cG_a_t - pr_aa_t*inG_a_t;
// Equation
(rer_bc_t*B_bc_t + rer_ba_t*B_ba_t)  = (1 + i_bc_t(-1))*rer_bc_t*B_bc_t(-1)/pi_c_t + (1 + i_ba_t(-1))*rer_ba_t*B_ba_t(-1)/pi_a_t + pr_bb_t*y_b_t - c_b_t - in_b_t - pr_bb_t*cG_b_t - pr_bb_t*inG_b_t;

// Equation
B_c_t = - (pop_a/pop_c*B_ac_t + pop_b/pop_c*B_bc_t);
// Equation
B_a_t = - pop_b/pop_a*B_ba_t;

// Equation
nfa_a_t = (rer_ac_t*B_ac_t - pop_b/pop_a*B_ba_t);
// Equation
nfa_b_t = (rer_bc_t*B_bc_t + rer_ba_t*B_ba_t);
// Equation
nfa_c_t = B_c_t;

// Equation
ca_a_t=nfa_a_t-nfa_a_t(-1);
// Equation
ca_b_t=nfa_b_t-nfa_b_t(-1);
// Equation
ca_c_t=nfa_c_t-nfa_c_t(-1);

// Equation
(1+i_bc_t)=(1+i_c_t)*(1-phi*(exp(((rer_bc_t*B_bc_t)/(pr_bb_t*y_b_t)-(B_bc_ts)/y_b_ts))-1));         // B^(bc)
// Equation
(1+i_ac_t)=(1+i_c_t)*(1-phi*(exp(((rer_ac_t*B_ac_t)/(pr_aa_t*y_a_t)-(B_ac_ts)/y_a_ts))-1));         // B^(ac)
// Equation
(1+i_ba_t)=(1+i_a_t)*(1-phi*(exp(((rer_ba_t*B_ba_t)/(pr_bb_t*y_b_t)-(B_ba_ts)/y_b_ts))-1));         // B^(ba)

// Equation
rer_bc_t = rer_ba_t/rer_ca_t;
// Equation
rer_ac_t = 1/rer_ca_t;

// Equation
1 = (rer_ba_t/rer_ba_t(-1))*pi_b_t/pi_a_t;
// Equation
Del_S_bc_t = (rer_bc_t/rer_bc_t(-1))*pi_b_t/pi_c_t;
// Equation
Del_S_ac_t = (rer_ac_t/rer_ac_t(-1))*pi_a_t/pi_c_t;

// Equation
pi_ab_t = (1/1)*pi_bb_t;
// Equation
pi_ac_t = Del_S_ac_t*pi_c_t;
// Equation
pi_ba_t = 1*pi_aa_t;
// Equation
pi_bc_t = Del_S_bc_t*pi_c_t;


//*************************************************************************
// Shocks
//*************************************************************************

// technology shock country A
a_a_t = rho_a_a*a_a_t(-1) + nua_a;

// technology shock country B
a_b_t = rho_a_b*a_b_t(-1) + nub_a;

// Price markup shock country A
theta_a_t/(theta_a_t-1) = rho_etheta_a*theta_a_t(-1)/(theta_a_t(-1)-1) + (1-rho_etheta_a)*theta_a/(theta_a-1) + nua_etheta;

// Price markup shock country B
theta_b_t/(theta_b_t-1) = rho_etheta_b*theta_b_t(-1)/(theta_b_t(-1)-1) + (1-rho_etheta_b)*theta_b/(theta_b-1) + nub_etheta;

// Wage markup shock country A
thetaw_a_t/(thetaw_a_t-1) = rho_ethetaw_a*thetaw_a_t(-1)/(thetaw_a_t(-1)-1) + (1-rho_ethetaw_a)*thetaw_a/(thetaw_a-1) + nua_ethetaw;

// Wage markup shock country B
thetaw_b_t/(thetaw_b_t-1) = rho_ethetaw_b*thetaw_b_t(-1)/(thetaw_b_t(-1)-1) + (1-rho_ethetaw_b)*thetaw_b/(thetaw_b-1) + nub_ethetaw;

// time preference shock country A
e_b_a_t=rho_eb_a*e_b_a_t(-1) + nua_eb;

// time preference shock country B
e_b_b_t=rho_eb_b*e_b_b_t(-1) + nub_eb; 

// labour supply shock country A
e_n_a_t=rho_en_a*e_n_a_t(-1) + nua_en; 

// labour supply shock country B
e_n_b_t=rho_en_b*e_n_b_t(-1) + nub_en; 

// investment shock country A
e_in_a_t=rho_ein_a*e_in_a_t(-1) + nua_ein;

// investment shock country B
e_in_b_t=rho_ein_b*e_in_b_t(-1) + nub_ein;

// risk premium shock country A
e_rp_a_t=rho_erp_a*e_rp_a_t(-1) + nua_erp;

// risk premium shock country B
e_rp_b_t=rho_erp_b*e_rp_b_t(-1) + nub_erp;

// country-specific demand shock from RoW for country A
e_RoW_a_t=rho_eRoW_a*e_RoW_a_t(-1) + nua_RoW;

// country-specific demand shock from RoW for country B
e_RoW_b_t=rho_eRoW_b*e_RoW_b_t(-1) + nub_RoW;

// country-specific demand shock from RoE for country A
e_RoE_a_t=rho_eRoE_a*e_RoE_a_t(-1) + nua_RoE;

// country-specific demand shock from RoE for country B
e_RoE_b_t=rho_eRoE_b*e_RoE_b_t(-1) + nub_RoE;

// tax shock country A
e_tau_a_t=rho_etau_a*e_tau_a_t(-1) + xi_b_etau_a*log(BG_a_t(-1)/BG_a_ts) + nua_etau;

// tax shock country B
e_tau_b_t=rho_etau_b*e_tau_b_t(-1) + xi_b_etau_b*log(BG_b_t(-1)/BG_b_ts) + nub_etau;

// public employment's shock as AR(1) proces (counry A)
epsilon_enG_a_t = rho_epsilon_enG_a*epsilon_enG_a_t(-1) + nua_enG;

// public employment's shock as AR(1) proces (counry B)
epsilon_enG_b_t = rho_epsilon_enG_b*epsilon_enG_b_t(-1) + nub_enG;

end;

// ######################################################################  
// Calculate steady state
// ###################################################################### 
resid(1);
steady;

//*************************************************************************
// Set up of the Variance-Covariance Matrix of innovations
// (assumption: all shocks are structural and uncorrelated)
//*************************************************************************

shocks;
  var	nua_a	=	0.00753802716440	^2	;
  var	nua_ein	=	0.04644287574065	^2	;
  var	nua_eb	=	0.02011454200299	^2	;
  var	nua_en	=	0.02484617620910	^2	;
  var	nua_erp	=	0.00428121468710	^2	;
  var	nub_erp	=	0.00718940475370	^2	;
  var	nua_etheta	=	0.07290560125821	^2	;
  var	nua_ethetaw	=	0.21101449478709	^2	;
  var	nua_RoE	=	0.02735018785307	^2	;
  var	nua_RoW	=	0.05734678553545	^2	;
  var	nua_etauw	=	0.00227315527636	^2	;
  var	nua_etauc	=	0.00162619256566	^2	;
  var	nua_etausc	=	0.00137848984641	^2	;
  var	nua_ecG	=	0.01605128003136	^2	;
  var	nua_einG	=	0.07503997122508	^2	;
  var	nua_enG	=	0.00018101663856	^2	;
  var	nua_emg	=	0.01084618528462	^2	;
  var	nua_eTR	=	0.01301741185614	^2	;
  var	nua_eT	=	0.02793296400063	^2	;
  var	nub_a	=	0.00473461040097	^2	;
  var	nub_ein	=	0.02432287957686	^2	;
  var	nub_eb	=	0.01126659878350	^2	;
  var	nub_en	=	0.02414766710473	^2	;
  var	nub_etheta	=	0.05103934639394	^2	;
  var	nub_ethetaw	=	0.36148852251111	^2	;
  var	nub_RoE	=	0.02686540985826	^2	;
  var	nub_RoW	=	0.02634508120905	^2	;
  var	nub_etauw	=	0.00193960315492	^2	;
  var	nub_etauc	=	0.00160944093838	^2	;
  var	nub_etausc	=	0.00153849138460	^2	;
  var	nub_ecG	=	0.01095394183877	^2	;
  var	nub_einG	=	0.03564545677108	^2	;
  var	nub_enG	=	0.00018091979448	^2	;
  var	nub_emg	=	0.01137572024947	^2	;
  var	nub_eTR	=	0.01013080707864	^2	;
  var	nub_eT	=	0.01273726556139	^2	;
  var	eps_y_c	=	0.00683460951211	^2	;
  var	eps_i_c	=	0.00115265055366	^2	;
  var	eps_pi_c	=	0.00532841738948	^2	;
  var eps_z_g = 0;//0.01^2;
  var nua_eM        = 0.0008^2;
end;

stoch_simul(order=1,irf_shocks=(nua_eM),irf=40) y_a_t c_a_t i_policy_t pi_a_t;