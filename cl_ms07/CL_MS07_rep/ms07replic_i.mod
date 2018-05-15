// Replication of figure 1, pages 35-36, of
// Medina, J. P. and C. Soto (2007). The Chilean Business Cycles Through
//  the Lens of a Stochastic General Equilibrium Model.
//  Working Paper 457, Central Bank of Chile.

// Code implemented by Sebastian Kripfganz, Goethe-University Frankfurt
// Last change: February 17, 2010

// This code is a Dynare adaptation of the author's code for Uhlig's
//  toolkit. This implemented version refers to the specification that
//  has oil included in the economy, with investment adjustment costs
//  (time-to-build), and where the external premium is a function of the
//  net foreign assets to GDP ratio.
// The flexible price allocation can be achieved by replacing the monetary
//  policy rule with 'picz_hat=0' and by setting all Calvo probabilites
//  equal to zero.

// ------------------------------------------------------------------------
// variable declaration

var ah_hat, bF_hat, bg_hat, c_hat, ca_y_hat, cf_hat, ch_hat, chF_hat,
    dc_hat, de_hat, dinv_hat, dwr_hat, dy_hat, dyF_hat, dys_hat, g_hat,
    gex_hat, i_hat, iF_hat, iFax_hat, inv_hat, invf_hat, invh_hat, k_hat,
    klag_hat, l_hat, m_hat, mcrh_hat, mo_hat, oc_hat, oh_hat, pic_hat,
    picz_hat, pif_hat, pifF_hat, pihd_hat, pihf_hat, prf_hat, prfF_hat,
    prhd_hat, prhf_hat, pri_hat, prm_hat, proF_hat, prs_hat, prsa_hat,
    prsF_hat, prx_hat, pry_hat, qr_hat, r_hat, rer_hat, Rk_hat, sh_c_hat,
    sh_i_hat, sh_m_hat, sh_w_hat, st_hat, tau_hat, u_hat, wr_hat, x_hat,
    y_hat, yF_hat, yFa_hat, yh_hat, ys_hat, ysa_hat, zr_hat;

varexo eps_ah, eps_ys, eps_prsF, eps_yF, eps_iF, eps_piF, eps_sh_m,
    eps_sh_w, eps_sh_c, eps_gex, eps_sh_i, eps_prfF, eps_proF, eps_st;

// ------------------------------------------------------------------------
// parameter declaration

parameters sigma_L, h, phi_L, xi_L, eta_C, theta_I, S_I, phi_Hd, xi_Hd,
    phi_Hf, xi_Hf, phi_F, xi_F, omega_C, omega_H, mvarphi_i1, mvarphi_pi1,
    mvarphi_y1, mvarphi_rer1, mvarphi_i2, mvarphi_pi2, mvarphi_y2, eta_F,
    mvarrho, rho_ah, rho_ys, rho_yF, rho_iF, rho_piF, rho_sh_w, rho_sh_c,
    rho_gex, rho_sh_i, rho_prfF, rhoT, sd_ah, sd_ys, sd_yF, sd_iF, sd_piF,
    sd_sh_m, sd_sh_w, sd_sh_c, sd_gex, sd_sh_i, sd_prfF, sdT, rho_sh_m,
    sigma_C, eps_L, alpha_C, eps_H, eps_F, delta_I, sigma_I, gamma_H,
    theta_H, eta_H, chi, prsF_ref, n_prsF, NX_Y, Gh_Y, Ys_Y, CCq_Y,
    gamma_C, gamma_I, rho_prsF, sd_prsF, rho_proF, sd_proF, mvarrho_de,
    psi_mon, psi_tau, lambda, premio_s, g_y, pi_C, n, g_yF, nF, piF, r, iF,
    Prh, Prf, Wr, RER, PrFo, PrFs, Pro, Prs, Pri, beta, Theta_ss, Zr,
    eBF_Y, Kh_Lh, Oh_Lh, agg_Lh, Gh_Lh, Yh_Lh, Gh_Kh, Ah, Id_Kh, I_Y, C_Y,
    Mf_Y, VAh_Y, Y_Lh, Yh_Y, M_Y, X_Y, YhF_Y, Mo_M, Ys_X, BalG_Y, Tau_Y,
    bG_Y, Ren_Y, RenNs_Y;

// monetary policy rule (real versus nominal interest rate target)
psi_mon     = 1;                // 0: real instrument, 1: nominal instrument

// fiscal policy shock transmission channel ([0,1] interval)
psi_tau     = 1;                // 0: tax channel, 1: expenditure channel

// copper reference price adjustment
prsF_ref	= 0;                // 0: no adjustment, 1: adjustment

// appearance of the exchange rate change in the uncovered interest parity
mvarrho_de  = 0;                // 0: period t+1, 1: period t

// calibrated parameters (table 1, page 30)
g_y         = 1.035^0.25-1;     // domestic labor productivity growth
pi_C        = 1.03^0.25-1;      // domestic steady state inflation target
NX_Y        = 0.02;             // steady state net export / GDP ratio
CCq_Y       = -0.018;           // steady state current account / GDP ratio
beta        = 0.999;            // discount factor
alpha_C     = 0.015;            // share of oil in the consumption basket
gamma_C     = 0.65;             // share of home goods in core consumption
gamma_I     = 0.5;              // share of home goods in investment
Ys_Y        = 0.1;              // share of commoditiy production in GDP
chi         = 0.4;              // government share in commodity production
delta_I     = 1.058^0.25-1;     // depreciation rate
gamma_H     = 0.01;             // share of oil in production of home goods
eta_H       = 0.66;             // labor share in value added production
eps_L       = 11;               // elasticity of substitution (labor)
eps_H       = 11;               // elasticity of substitution (home goods)
eps_F       = 11;               // elasticity of substitution (foreign goods)
rho_prsF    = 0.95;             // copper price AR coefficient
rho_proF    = 0.97;             // oil price AR coefficient
sd_prsF     = 9;                // copper price standard deviation
sd_proF     = 12;               // oil price standard deviation

// calibrated parameters (section 3, page 15)
n           = 1.015^0.25-1;     // domestic labor force growth
lambda      = 0.5;              // share of non-Ricardian households

// estimated parameters (table 2, pages 31-32)
sigma_L     = 0.84;             // inverse elasticity of labor supply
h           = 0.65;             // habit formation
phi_L       = 0.82;             // Calvo probability in nominal wages
xi_L        = 0.44;             // indexation of nominal wages
eta_C       = 1.12;             // intratemporal elasticity of consumption
theta_I     = 1.04;             // intratemporal elasticity of investment
S_I         = 1.48;             // investment inertia
phi_Hd      = 0.74;             // Calvo prob. in domestic price (home goods)
xi_Hd       = 0.34;             // indexation of domestic price (home goods)
phi_Hf      = 0.59;             // Calvo prob. in foreign price (home goods)
xi_Hf       = 0.31;             // indexation of foreign price (home goods)
phi_F       = 0.66;             // Calvo prob. in price of imported goods
xi_F        = 0.28;             // indexation of price of imported goods
omega_C     = 0.3;              // elast. of substit. of oil (consumption)
omega_H     = 0.3;              // elast. of substitution of oil (production)
mvarphi_i1  = 0.73;             // monetary policy parameter
mvarphi_pi1 = 1.61;             // monetary policy parameter
mvarphi_y1  = 0.28;             // monetary policy parameter
mvarphi_rer1 = 0.02;            // monetary policy parameter
mvarphi_i2  = 0.74;             // monetary policy parameter
mvarphi_pi2 = 1.67;             // monetary policy parameter
mvarphi_y2  = 0.39;             // monetary policy parameter
eta_F       = 0.79;             // intratemporal elasticity in foreign demand
mvarrho     = 0.01;             // elasticity of the external premium
rho_ah      = 0.89;             // transitory productivity shock persistence
rho_ys      = 0.77;             // commodity production shock persistence
rho_yF      = 0.67;             // foreign demand shock persistence
rho_iF      = 0.87;             // foreign interest rate shock persistence
rho_piF     = 0.80;             // foreign inflation shock persistence
rho_sh_w	= 0.89;             // labor supply shock persistence
rho_sh_c	= 0.87;             // preference shock persistence
rho_gex     = 0.65;             // fiscal policy shock persistence
rho_sh_i    = 0.34;             // investment adjust. cost shock persistence
rho_prfF    = 0.9;              // import price shock persistence
rhoT        = 0.73;             // permanent productivity shock persistence
sd_ah       = 1.43;             // transitory productivity shock std. dev.
sd_ys       = 4.51;             // commodity production shock std. deviation
sd_yF       = 3.57;             // foreign demand shock standard deviation
sd_iF       = 0.37;             // foreign interest rate shock std. deviation
sd_piF      = 0.28;             // foreign inflation shock standard deviation
sd_sh_m     = 0.39;             // monetary policy shock standard deviation
sd_sh_w     = 1.01;             // labor supply shock standard deviation
sd_sh_c     = 3.41;             // preference shock standard deviation
sd_gex      = 1.01;             // fiscal policy shock standard deviation
sd_sh_i     = 5.99;             // investment adjust. cost shock std. dev.
sd_prfF     = 4.16;             // import price shock standard deviation
sdT         = 0.4;              // permanent productivity shock std. dev.
rho_sh_m    = 0;                // monetary policy shock persistence

// calibrated parameters (values not given in the paper)
Gh_Y        = 0.12;             // government expenditure / GDP ratio
g_yF        = 1.02^0.25-1;      // foreign steady state GDP growth
nF          = (1+g_y)*(1+n)/(1+g_yF)-1; // foreign labor force growth
piF         = 1.02^0.25-1;      // foreign steady state inflation
r           = 1.042^0.25-1;     // steady state real interest rate
iF          = 1.05^0.25-1;      // foreign steady state nominal interest rate
sigma_C     = 1;                // intertemporal elasticity of substitution
theta_H     = 1;                // elasticity of substitution (labor-capital)
n_prsF      = 40;               // periods for reference price calculation
sigma_I     = 100000;
premio_s    = 0;
Prh         = 1;
Prf         = 1;
Wr          = 1;
RER         = Prf*(eps_F-1)/eps_F;
PrFo        = 1/RER;
PrFs        = 1/RER;
Pro         = RER*PrFo;
Prs         = RER*PrFs;
Pri         = 1;
Theta_ss    = (1+r)/((1+iF)/(1+piF));
Zr          = ((1+r)*(1+premio_s)-(1-delta_I))*Pri;
eBF_Y       = CCq_Y*(1+iF)*Theta_ss/(1-1/((1+n)*(1+g_y)*(1+piF)));
Ren_Y       = CCq_Y-NX_Y-eBF_Y*(1-1/((1+iF)*Theta_ss))/((1+n)*(1+g_y)*(1+piF));
RenNs_Y     = Ren_Y+Prs*Ys_Y*(1-chi);
Kh_Lh       = (Wr/Zr)^theta_H*(1-eta_H)/(eta_H);
Oh_Lh       = ((Wr/Pro)/(eta_H^(1/theta_H)*(Kh_Lh^(1-eta_H))^((1/theta_H-1/omega_H))))^omega_H*gamma_H/(1-gamma_H);
agg_Lh      = ((1-gamma_H)^(1/omega_H)*(Kh_Lh^(1-eta_H))^((omega_H-1)/omega_H)+gamma_H^(1/omega_H)*Oh_Lh^((omega_H-1)/omega_H))^(omega_H/(omega_H-1));
Gh_Lh       = (Kh_Lh)^(1-eta_H);
Yh_Lh       = (Wr+Zr*Kh_Lh+Pro*Oh_Lh)*eps_H/(eps_H-1);
Gh_Kh       = Gh_Lh/Kh_Lh;
Ah          = Yh_Lh/agg_Lh;
Id_Kh       = (1+g_y)*(1+n)-(1-delta_I);
I_Y         = Id_Kh*Kh_Lh*(1-Ys_Y-(1-NX_Y-Gh_Y)*(1-gamma_C)*(Prf-RER))/((Prh*Yh_Lh-Pro*Oh_Lh)+Id_Kh*Kh_Lh*(Prf-RER)*(gamma_C-gamma_I));
C_Y         = 1-NX_Y-Gh_Y-I_Y;
Mf_Y        = C_Y*(1-alpha_C)*(1-gamma_C)+I_Y*(1-gamma_I);
VAh_Y       = 1-Ys_Y-Mf_Y*(Prf-RER);
Y_Lh        = (Prh*Yh_Lh-Pro*Oh_Lh)/VAh_Y;
Yh_Y        = Yh_Lh/Y_Lh;
M_Y         = RER*Mf_Y+Pro*(Oh_Lh/Y_Lh+alpha_C*C_Y);
X_Y         = NX_Y+M_Y;
YhF_Y       = X_Y-Ys_Y;
Mo_M        = Pro*(Oh_Lh/Y_Lh+alpha_C*C_Y)/M_Y;
Ys_X        = Ys_Y/X_Y;
BalG_Y      = 0.01;
Tau_Y       = 0.092;
bG_Y        = (Gh_Y-Tau_Y-chi*Ys_Y+BalG_Y)*((1+pi_C)*(1+g_y)*(1+n))/(1-1/((1+iF)*Theta_ss));

// ------------------------------------------------------------------------
// linearized model
// all variables are fractional deviations from their steady state values
model(linear);

// monetary policy for flexible price allocation
//picz_hat=0;

// monetary policy rule
(1-psi_mon)*(-r_hat+mvarphi_i1*r_hat(-1) + (1-mvarphi_i1)*(mvarphi_pi1-1)*picz_hat+(1-mvarphi_i1)*mvarphi_y1*dy_hat+(1-mvarphi_i1)*mvarphi_rer1*rer_hat+sh_m_hat)
+psi_mon*(-i_hat+mvarphi_i2*i_hat(-1)+(1-mvarphi_i2)*mvarphi_pi2*picz_hat+(1-mvarphi_i2)*mvarphi_y2*dy_hat+sh_m_hat)=0;

// Euler equation for consumption
-c_hat+lambda*Wr/(Y_Lh*C_Y)*(wr_hat+l_hat)-lambda*Tau_Y/C_Y*(tau_hat+y_hat+pry_hat)
-(1-lambda)*(1-h)/(1+h)*sigma_C*(i_hat-pic_hat(+1))
+1/(1+h)*(c_hat(+1))-lambda/(1+h)*Wr/(Y_Lh*C_Y)*(wr_hat(+1)+l_hat(+1))+lambda/(1+h)*Tau_Y/C_Y*(tau_hat(+1)+y_hat(+1)+pry_hat(+1))
+h/(1+h)*c_hat(-1)-lambda*h/(1+h)*Wr/(Y_Lh*C_Y)*(wr_hat(-1)+l_hat(-1))+lambda*h/(1+h)*Tau_Y/C_Y*(tau_hat(-1)+y_hat(-1)+pry_hat(-1))
+(1-lambda)*(1-h)/(1+h)*(1-rho_sh_c)*sh_c_hat-(1-lambda)*(h-rhoT)/(1+h)*st_hat=0;

// uncovered interest rate parity
-i_hat+iF_hat+mvarrho*bF_hat+(1-mvarrho_de)*(de_hat(+1))-mvarrho_de*de_hat=0;

// labor supply
-(1+beta*phi_L^2+sigma_L*eps_L*phi_L*(1+beta))*wr_hat+(1-beta*phi_L)*(1-phi_L)*(sigma_L*l_hat+1/(1-h)*c_hat-h/(1-h)*c_hat(-1)+sh_w_hat)
+(1+sigma_L*eps_L)*phi_L*wr_hat(-1)+(1+sigma_L*eps_L)*beta*phi_L*(wr_hat(+1))-(1+sigma_L*eps_L)*phi_L*(1+beta*xi_L)*pic_hat
+(1+sigma_L*eps_L)*phi_L*xi_L*pic_hat(-1)
+(1+sigma_L*eps_L)*beta*phi_L*(pic_hat(+1))=0;

// consumption demand for home goods
-ch_hat+c_hat-(eta_C*(1-gamma_C)+omega_C*gamma_C)*prhd_hat+(eta_C-omega_C)*(1-gamma_C)*prf_hat=0;

// consumption demand for foreign goods
-cf_hat+c_hat-(eta_C*gamma_C+omega_C*(1-gamma_C))*prf_hat+(eta_C-omega_C)*gamma_C*prhd_hat=0;

// real price of the consumption bundle
alpha_C*(rer_hat+proF_hat)+(1-alpha_C)*gamma_C*prhd_hat+(1-alpha_C)*(1-gamma_C)*prf_hat=0;

// law of motion for capital
-k_hat+(1-delta_I)/((1+n)*(1+g_y))*k_hat(-1)+(1-(1-delta_I)/((1+n)*(1+g_y)))*(inv_hat+sh_i_hat)
-Zr/(Pri*(1+n)*(1+g_y))*u_hat-(1-delta_I)/((1+n)*(1+g_y))*st_hat=0;

// investment demand for home goods
-invh_hat+inv_hat-theta_I*(prhd_hat-pri_hat)=0;

// investment demand for foreign goods
-invf_hat+inv_hat-theta_I*(prf_hat-pri_hat)=0;

// real price of investment
-pri_hat+gamma_I*prhd_hat+(1-gamma_I)*prf_hat=0;

// investment decision
-pri_hat+qr_hat+sh_i_hat-(1+1/((1+r)))*((1+g_y))^2*S_I*inv_hat
+(1+g_y)^2*S_I*inv_hat(-1)+(1+g_y)^2*S_I/(1+r)*(inv_hat(+1))-(1+g_y)^2*S_I*(1-rhoT*(1+g_y)/(1+r))*st_hat=0;

// price of capital
-qr_hat+(pic_hat(+1)-i_hat)+Zr/(Pri*(1+r)*(1+premio_s))*(zr_hat(+1))
+(1-delta_I)/((1+r)*(1+premio_s))*(qr_hat(+1))=0;

// utilization rate of capital
-zr_hat+qr_hat+sigma_I*u_hat=0;

// first-order condition for cost minimization (capital and labor)
-1/theta_H*(k_hat(-1)+u_hat-st_hat-l_hat)+wr_hat-zr_hat=0;

// marginal cost for home goods production
-mcrh_hat+(Zr*eps_H/(eps_H-1))*Kh_Lh/Yh_Lh*(zr_hat+k_hat(-1)-st_hat+u_hat)
+(Wr*eps_H/(eps_H-1))/Yh_Lh*(wr_hat+l_hat)
+(Pro*eps_H/(eps_H-1))*Oh_Lh/Yh_Lh*(rer_hat+proF_hat+oh_hat)-yh_hat=0;

// Philipps curve for home goods sold domestically
-phi_Hd*pihd_hat+phi_Hd*beta/(1+beta*xi_Hd)*(pihd_hat(+1))+phi_Hd*xi_Hd/(1+beta*xi_Hd)*pihd_hat(-1)
+(1-beta*phi_Hd)*(1-phi_Hd)/(1+beta*xi_Hd)*(mcrh_hat-prhd_hat)=0;

// Philipps curve for home goods sold abroad
-phi_Hf*pihf_hat+phi_Hf*beta/(1+beta*xi_Hf)*(pihf_hat(+1))+phi_Hf*xi_Hf/(1+beta*xi_Hf)*pihf_hat(-1)
+(1-beta*phi_Hf)*(1-phi_Hf)/(1+beta*xi_Hf)*(mcrh_hat-rer_hat-prhf_hat)=0;

// Philipps curve for foreign goods sold domestically
-phi_F*pif_hat+phi_F*beta/(1+beta*xi_F)*(pif_hat(+1))+phi_F*xi_F/(1+beta*xi_F)*pif_hat(-1)
+(1-beta*phi_F)*(1-phi_F)/(1+beta*xi_F)*(rer_hat+prfF_hat-prf_hat)=0;

// foreign demand for home goods
-chF_hat+yF_hat-eta_F*prhf_hat=0;

// real price of the commodity good
-prs_hat+prsF_hat+rer_hat=0;

// real price of the home good sold domestically
-pihd_hat+prhd_hat-prhd_hat(-1)+pic_hat=0;

// real price of the home good sold abroad
-pihf_hat+prhf_hat-prhf_hat(-1)+pifF_hat=0;

// real price of the imported good
-pif_hat+prf_hat-prf_hat(-1)+pic_hat=0;

// law of motion for the exchange rate
-de_hat+rer_hat-rer_hat(-1)+pic_hat-pifF_hat=0;

// total exports
-x_hat+Ys_X*ys_hat+(1-Ys_X)*chF_hat=0;

// real price deflator for exports
-prx_hat+Ys_X*prs_hat+(1-Ys_X)*(prhf_hat+rer_hat)=0;

// total imports
-m_hat+Mo_M*mo_hat+(1-Mo_M)*C_Y*(1-alpha_C)*(1-gamma_C)/Mf_Y*cf_hat
+(1-Mo_M)*I_Y*(1-gamma_I)/Mf_Y*invf_hat=0;

// real price deflator for imports
-prm_hat+Mo_M*proF_hat+(1-Mo_M)*prfF_hat+rer_hat=0;

// ex-post real interest rate
(1-psi_mon)*(-r_hat+i_hat-pic_hat)+psi_mon*(-r_hat+i_hat-picz_hat)=0;

// total demand for home goods
-yh_hat+gamma_C*C_Y/Yh_Y*ch_hat+Gh_Y/Yh_Y*(g_hat-prhd_hat+pry_hat+y_hat)
+gamma_I*I_Y/Yh_Y*invh_hat+YhF_Y/Yh_Y*chF_hat=0;

// total supply of home goods
-yh_hat+ah_hat+gamma_H^(1/omega_H)*(Ah*Oh_Lh/Yh_Lh)^((omega_H-1)/omega_H)*oh_hat
+(1-gamma_H)^(1/omega_H)*(Ah*Gh_Lh/Yh_Lh)^((omega_H-1)/omega_H)*eta_H^(1/theta_H)*(1/Gh_Lh)^((theta_H-1)/theta_H)*l_hat
+(1-gamma_H)^(1/omega_H)*(Ah*Gh_Lh/Yh_Lh)^((omega_H-1)/omega_H)*(1-eta_H)^(1/theta_H)*(1/Gh_Kh)^((theta_H-1)/theta_H)*(k_hat(-1)-st_hat+u_hat)=0;

// real GDP
-y_hat+C_Y*c_hat+Gh_Y*(g_hat-prhd_hat+pry_hat+y_hat)+I_Y*inv_hat+X_Y*x_hat-M_Y*m_hat=0;

// net foreign asset position
-eBF_Y/((1+iF)*Theta_ss)*(bF_hat-iFax_hat)
+eBF_Y/((1+piF)*(1+n)*(1+g_y))*(de_hat-pic_hat+pry_hat(-1)+y_hat(-1)-pry_hat-y_hat+bF_hat(-1)-st_hat)
-(1-chi)*Ys_Y*(rer_hat+prsF_hat+ys_hat-pry_hat-y_hat)+X_Y*(prx_hat+x_hat-pry_hat-y_hat)-M_Y*(prm_hat+m_hat-pry_hat-y_hat)=0;    //+RenNs_Y*(rer_hat-pry_hat-y_hat)=0;

// current account
-ca_y_hat-(1-chi)*Ys_Y*(rer_hat+prsF_hat+ys_hat)    //-pry_hat-y_hat)
+X_Y*(prx_hat+x_hat-pry_hat-y_hat)
-M_Y*(prm_hat+m_hat-pry_hat-y_hat)+eBF_Y/((1+piF)*(1+n)*(1+g_y)*(1+iF)*Theta_ss)*iFax_hat(-1)
+eBF_Y/((1+piF)*(1+n)*(1+g_y)*(1+iF)*Theta_ss)*((1+iF)*Theta_ss-1)*(bF_hat(-1)+de_hat-pic_hat+pry_hat(-1)+y_hat(-1)-pry_hat-y_hat-st_hat)=0;    //+RenNs_Y*(rer_hat-pry_hat-y_hat)=0;

// auxiliary foreign interest rate
iFax_hat-iF_hat-mvarrho*bF_hat+mvarrho_de*((de_hat(+1))+de_hat)=0;

// GDP deflator
-pry_hat+Gh_Y*prhd_hat+I_Y*pri_hat+X_Y*prx_hat-M_Y*prm_hat=0;

// fiscal structural balance rule
-Gh_Y*g_hat+Tau_Y*(tau_hat-y_hat)+chi*Ys_Y*(prsa_hat+ys_hat-pry_hat-y_hat)
+(1-1/(Theta_ss*(1+iF)))*bG_Y/((1+piF)*(1+g_y)*(1+n))*(de_hat-pic_hat+bg_hat(-1)-pry_hat-y_hat+pry_hat(-1)+y_hat(-1)-st_hat)
+1/(Theta_ss*(1+iF))*bG_Y/((1+n)*(1+g_y)*(1+n))*(iFax_hat(-1))+Gh_Y*(gex_hat+prhd_hat-pry_hat-y_hat)=0;

// choice of fiscal policy instrument
psi_tau*tau_hat-(1-psi_tau)*g_hat=0;    //psi_tau*(tau_hat+pry_hat+y_hat)-(1-psi_tau)*(g_hat-prhd_hat+pry_hat+y_hat)=0;

// evolution of fiscal debt
-bG_Y/((1+iF)*Theta_ss)*(bg_hat-iFax_hat)
+1/((1+piF)*(1+g_y)*(1+n))*bG_Y*(de_hat-pic_hat+bg_hat(-1)+pry_hat(-1)+y_hat(-1)-pry_hat-y_hat-st_hat)
+Tau_Y*tau_hat+chi*Ys_Y*(prsF_hat+rer_hat+ys_hat-pry_hat-y_hat-st_hat)-Gh_Y*g_hat=0;

// auxiliary variable for lagged capital
-klag_hat+k_hat(-1)=0;

// consumption demand for oil
-oc_hat+c_hat-omega_C*(rer_hat+proF_hat)=0;

// first-order condition for cost minimization (oil)
1/omega_H*oh_hat-((1/omega_H+1/theta_H)*eta_H^(1/theta_H)*Gh_Lh^(-(theta_H-1)/theta_H)-1/theta_H)*l_hat
-((1/omega_H+1/theta_H)*(1-eta_H)^(1/theta_H)*Gh_Kh^(-(theta_H-1)/theta_H))*(k_hat(-1)+u_hat-st_hat)+rer_hat+proF_hat-wr_hat=0;

// oil imports
-mo_hat+alpha_C*C_Y/M_Y/Mo_M*oc_hat+(1-alpha_C*C_Y/M_Y/Mo_M)*oh_hat=0;

// real price of the core consumption bundle
-picz_hat+gamma_C*pihd_hat+(1-gamma_C)*pif_hat=0;

// real price of the commodity good
-prsa_hat+rer_hat+prsF_ref*(1-rho_prsF^n_prsF)/(1-rho_prsF)/n_prsF*prsF_hat=0;

// return on capital (?)
-Rk_hat+Zr/(Pri*(1+r)*(1+premio_s))*zr_hat+(1-delta_I)/((1+r)*(1+premio_s))*qr_hat-qr_hat(-1)=0;

// domestic output growth
-dy_hat+y_hat-y_hat(-1)+st_hat=0;

// consumption growth
-dc_hat+c_hat-c_hat(-1)+st_hat=0;

// investment growth
-dinv_hat+inv_hat-inv_hat(-1)+st_hat=0;

// real wage growth
-dwr_hat+wr_hat-wr_hat(-1)+st_hat=0;

// auxiliary variable for foreign output
-yFa_hat+yF_hat=0;

// foreign output growth
-dyF_hat+yFa_hat-yFa_hat(-1)+st_hat=0;

// auxiliary variable for commodity production
-ysa_hat+ys_hat=0;

// commodity production growth
-dys_hat+ysa_hat-ysa_hat(-1)+st_hat=0;

// transitory productivity shock
ah_hat=rho_ah*ah_hat(-1)+eps_ah;

// commodity production shock
ys_hat=rho_ys*ys_hat(-1)+eps_ys;

// foreign commodity price shock
prsF_hat=rho_prsF*prsF_hat(-1)+eps_prsF;

// foreign output shock
yF_hat=rho_yF*yF_hat(-1)+eps_yF;

// foreign interest rate shock
iF_hat=rho_iF*iF_hat(-1)+eps_iF;

// foreign inflation shock
pifF_hat=rho_piF*pifF_hat(-1)+eps_piF;

// monetary policy shock
sh_m_hat=rho_sh_m*sh_m_hat(-1)+eps_sh_m;

// labor supply shock
sh_w_hat=rho_sh_w*sh_w_hat(-1)+eps_sh_w;

// preference shock
sh_c_hat=rho_sh_c*sh_c_hat(-1)+eps_sh_c;

// government expenditure shock
gex_hat=rho_gex*gex_hat(-1)+eps_gex;

// investment adjustment cost shock
sh_i_hat=rho_sh_i*sh_i_hat(-1)+eps_sh_i;

// price of imports shock
prfF_hat=rho_prfF*prfF_hat(-1)+eps_prfF;

// oil price shock
proF_hat=rho_proF*proF_hat(-1)+eps_proF;

// permanent productivity shock
st_hat=rhoT*st_hat(-1)+eps_st;

end;

// ------------------------------------------------------------------------
// steady state values (should be zero) and Blanchard-Kahn conditions
steady;
check;

// ------------------------------------------------------------------------
// definition of shocks
shocks;

var eps_ah; stderr sd_ah;
var eps_ys; stderr sd_ys;
var eps_prsF; stderr sd_prsF;
var eps_yF; stderr sd_yF;
var eps_iF; stderr sd_iF;
var eps_piF; stderr sd_piF;
var eps_sh_m; stderr sd_sh_m;
var eps_sh_w; stderr sd_sh_w;
var eps_sh_c; stderr sd_sh_c;
var eps_gex; stderr sd_gex;
var eps_sh_i; stderr sd_sh_i;
var eps_prfF; stderr sd_prfF;
var eps_proF; stderr sd_proF;
var eps_st; stderr sdT;

end;

// ------------------------------------------------------------------------
// impulse response functions
stoch_simul(irf=21, nograph) dy_hat, picz_hat, rer_hat, l_hat, ca_y_hat;