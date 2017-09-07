// Replication file

// Model: EA_SR07

// Further references:
// Adolfson, M., S. Laseen, J. Linde, and M. Villani. 2007. "Bayesian Estimation of an Open Economy DSGE Model with Incomplete Pass-Through." 
// Journal of International Economics 72(2), pp. 481-511.

// Last edited: 10/09/07 by S. Schmidt


var pi_hat pi_mc pi_mi pi_x w_barhat c_hat i_hat psi_zhat P_k dS H_hat k_barhat k_hat q_hat m_barhat mu_hat a gamma_mcdhat gamma_midhat gamma_xstar mc_x R_hat E //23 endogenous variables
    pistar_hat ystar_hat Rstar_hat // 3 foreign variables
    tauk_hat tauy_hat tauc_hat tauw_hat g_hat //5 government variables
    epsilon mu_zhat zeta_c zeta_h lambda_dhat lambda_mchat lambda_mihat phi_tilde Upsilon z_tildestar lambda_x pi_bar //12 exogenous processes
    mc rk_hat mc_mc mc_mi pi_c y_hat x R_fhat u gamma_fhat gamma_cdhat gamma_idhat // 12 additional endogenous variables
    pi_hatf pi_mcf pi_mif pi_xf w_barhatf c_hatf i_hatf psi_zhatf P_kf dSf H_hatf k_barhatf k_hatf q_hatf m_barhatf mu_hatf af gamma_mcdhatf gamma_midhatf gamma_xstarf mc_xf R_hatf //variables for flex price case
    lambda_dhatf lambda_mchatf lambda_mihatf lambda_xf
    mcf rk_hatf mc_mcf mc_mif pi_cf y_hatf xf R_fhatf uf gamma_fhatf gamma_cdhatf gamma_idhatf
    pistar_hatf ystar_hatf Rstar_hatf 

//**************************************************************************
// Modelbase Variables                                                   //*                      
    interest inflation inflationq outputgap output;                      //*
//**************************************************************************       

varexo  epsilon_tauk epsilon_tauw epsilon_tauc epsilon_tauy epsilon_lambdad epsilon_lambdamc epsilon_lambdami epsilon_lambdax epsilon_muz epsilon_epsilon
        epsilon_Upsilon epsilon_ztildestar epsilon_zetac epsilon_zetah epsilon_phitilde epsilon_R epsilon_pibar epsilon_pistar epsilon_ystar epsilon_Rstar epsilon_rhog;


 
parameters 
           beta alpha eta_c sigma_a mu sigma_L delta lambda_w omega_i omega_c nu tau_y tau_c rho_pibar gr A_q A_L rho_tauk rho_tauw sigma_q //20 fixed parameters
           xi_d xi_mc xi_mi xi_x xi_w xi_e kappa_w kappa_d kappa_mc kappa_mi kappa_x lambda_d lambda_mi lambda_mc S_tilde b eta_i eta_f mu_z tau_w tau_k phi_a
           rho_muz rho_epsilon rho_Upsilon rho_ztildestar rho_zetac rho_zetah rho_phitilde rho_lambdamc rho_lambdami rho_lambdax rho_R  rho_pi rho_y rho_x rho_dpi rho_dy //Bayesian estimation
           rho_ghat rho_ghat2 rho_tauc rho_tauc2 rho_tauy rho_tauy2 rho_pistar rho_pistar2 rho_pistar3 rho_pistar4 rho_ystar rho_ystar2 rho_ystar3 rho_ystar4 rho_Rstar rho_Rstar2 rho_Rstar3 rho_Rstar4//foreign VAR and government VAR with additional Coefficients for further lags
           b_w eta_0 eta_1 eta_2 eta_3 eta_4 eta_5 eta_6 eta_7 eta_8 eta_9 eta_10 eta_11 pi R R_f eta_mc eta_mi gamma_id gamma_cd gamma_dc gamma_mcc gamma_cmc gamma_imi gamma_mii
           r_k w_bar k_H D1 D2 D3 D4 H c psi_z y_bar g q m_bar k k_bar i c_m i_m y_star //steady state relationships
           xi_df xi_mcf xi_mif xi_xf xi_wf xi_ef // flexible price case
        
// Parameters from exogenous VAR
//ForLag1, ForLag2, ForLag3, ForLag4, ForShock, FisLag1, FisLag2 , FisShock,
ForLag111 ,ForLag112 ,ForLag113 ,ForLag121 ,ForLag122 ,ForLag123 ,ForLag131 ,ForLag132 ,ForLag133 ,
ForLag211 ,ForLag212 ,ForLag213 ,ForLag221 ,ForLag222 ,ForLag223 ,ForLag231 ,ForLag232 ,ForLag233 ,
ForLag311 ,ForLag312 ,ForLag313 ,ForLag321 ,ForLag322 ,ForLag323 ,ForLag331 ,ForLag332 ,ForLag333 ,
ForLag411 ,ForLag412 ,ForLag413 ,ForLag421 ,ForLag422 ,ForLag423 ,ForLag431 ,ForLag432 ,ForLag433 ,
ForShock11 ,ForShock12 ,ForShock13 ,ForShock21 ,ForShock22 ,ForShock23 ,ForShock31 ,ForShock32 ,ForShock33 ,
FisLag111 ,FisLag112 ,FisLag113 ,FisLag121 ,FisLag122 ,FisLag123 ,FisLag131 ,FisLag132 ,FisLag133 ,
FisLag211 ,FisLag212 ,FisLag213 ,FisLag221 ,FisLag222 ,FisLag223 ,FisLag231 ,FisLag232 ,FisLag233 ,
FisShock11, FisShock12, FisShock13, FisShock14, FisShock15, FisShock21, FisShock22, FisShock23, FisShock24, FisShock25,
FisShock31, FisShock32, FisShock33, FisShock34, FisShock35, FisShock41, FisShock42, FisShock43, FisShock44, FisShock45,
FisShock51, FisShock52, FisShock53, FisShock54, FisShock55,epstauk, epstauw;   

ForLag111 = 0.1762;
ForLag112 = 0.2798;
ForLag113 = -0.2080;
ForLag121 = -0.0628;
ForLag122 =1.0482;
ForLag123 =0.2843;
ForLag131 =0.3216;
ForLag132 =0.1327;
ForLag133 =0.9193;
ForLag211= 0.2644;
ForLag212=-0.1566;
ForLag213=0.0812;
ForLag221=0.1531;
ForLag222=-0.1304;
ForLag223=-0.5787;
ForLag231=0.1433;
ForLag232=-0.2009;
ForLag233=-0.1952;
ForLag311=0.3586;
ForLag312=0.0419;
ForLag313=0.2397;
ForLag321=-0.1653;
ForLag322=0.1009;
ForLag323=0.4756;
ForLag331= -0.0967;
ForLag332=0.1684;
ForLag333=0.2152;
ForLag411=0.0274;
ForLag412=-0.0561;
ForLag413=-0.0878;
ForLag421=0.1359;
ForLag422=-0.2141;
ForLag423=-0.2811;
ForLag431=-0.0791;
ForLag432=-0.1606;
ForLag433=-0.1158;
ForShock11=0.2585;
ForShock12=0;
ForShock13=0;
ForShock21=0;
ForShock22=0.3375;
ForShock23=0;
ForShock31=-0.0258;
ForShock32=0.0567;
ForShock33=0.2257;
FisLag111=1.5745;
FisLag112=0.0640;
FisLag113=-0.0395;
FisLag121=0.0366;
FisLag122=0.7623;
FisLag123=0.0286;
FisLag131=-0.0485;
FisLag132=0.0538;
FisLag133=0.5621;
FisLag211=-0.6462;
FisLag212=0.0371;
FisLag213=-0.0178;
FisLag221=-0.0295;
FisLag222=0.2120;
FisLag223=-0.0526;
FisLag231=0.1051;
FisLag232=-0.1395;
FisLag233=0.1993;
FisShock11=1;
FisShock12=0;
FisShock13=0;
FisShock14=0;
FisShock15=0;
FisShock21=0;
FisShock22=0.1324;
FisShock23=0;
FisShock24=0;
FisShock25=0;
FisShock31=0;
FisShock32=0;
FisShock33=0.1430;
FisShock34=0;
FisShock35=0;
FisShock41=0;
FisShock42=0;
FisShock43=0;
FisShock44=1;
FisShock45=0;
FisShock51=0;
FisShock52=0;
FisShock53=0;
FisShock54=0;
FisShock55=0.4148;


// fixed parameters
mu=1.01; //money growth rate
beta=0.999; //Discount factor
delta=0.013; //depreciation rate
alpha=0.29; //Capital share in production
A_L=7.5;//constant in labour disutility function
sigma_L=1.00; //labor supply elasticity
lambda_w=1.05; //wage markup
omega_i=0.55; //imported investment share
omega_c=0.31; //imported consumption share
rho_pibar=0.975;//inflation target persistence
gr=0.2037; //G/Y ratio
tau_y=0.1771; //labor income tax
tau_c=0.1249; //value added tax
A_q=0.3776;
rho_tauk=0.9;
rho_tauw=0.9;
epstauk = 1;
epstauw = 1;
sigma_q=10.62;
eta_c=5.00;  //substitution elasticity
sigma_a=1000000; //capital utilization cost
nu=1.00; //share of wage in advance


// estimated parameters initialisation (mean of Bayesian estimation)
//Calvo parameter
xi_w=0.69;
xi_d=0.891;
xi_mc=0.444;
xi_mi=0.721;
xi_x=0.612;
xi_e=0.787;
xi_wf =0.0000001; //flexible price case
xi_df =0.0000001;
xi_mcf =0.0000001;
xi_mif =0.0000001;
xi_xf =0.0000001;
xi_ef =0;
//indexation parameter
kappa_w =0.497;
kappa_d=0.217;
kappa_mc=0.220;
kappa_mi=0.231;
kappa_x=0.185;
//markups
lambda_d=1.222;
lambda_mc=1.633;
lambda_mi=1.275;
S_tilde=8.670; //investment adjustment cost
b=0.708; //habit formation
eta_i=1.696; //substitution elasticity investment
eta_f=1.486; //substitution elasticity foreign
mu_z=1.005; //technology growth
tau_k=0.135; //capital income tax
tau_w=0.197; //Labour pay-roll tax
phi_a=0.252;
rho_muz=0.698;
rho_epsilon=0.886;
rho_Upsilon=0.720;
rho_ztildestar=0.992;
rho_zetac=0.892;
rho_zetah=0.676;
rho_phitilde=0.955;
rho_lambdamc=0.970;
rho_lambdami=0.963;
rho_lambdax=0.886;
rho_R=0.881;
rho_pi=1.73;
rho_dpi=0.310;
rho_x=-0.009;
rho_y=0.104;
rho_dy=0.128;

// estimated parameters initialisation (mode of Bayesian estimation)
//Calvo parameter
//xi_w=0.697;
//xi_d=0.883;
//xi_mc=0.463;
//xi_mi=0.740;
//xi_x=0.639;
//xi_e=0.792;
//indexation parameter
//kappa_w =0.516;
//kappa_d=0.212;
//kappa_mc=0.161;
//kappa_mi=0.187;
//kappa_x=0.139;
//markups
//lambda_d=1.168;
//lambda_mc=1.619;
//lambda_mi=1.226;
//S_tilde=8.732; //investment adjustment cost
//b=0.690; //habit formation
//eta_i=1.669; //substitution elasticity investment
//eta_f=1.460; //substitution elasticity foreign
//mu_z=1.005; //technology growth
//tau_k=0.137; //capital income tax
//tau_w=0.186; //Labour pay-roll tax
//phi_a=0.145;
//rho_muz=0.723;
//rho_epsilon=0.909;
//rho_Upsilon=0.750;
//rho_ztildestar=0.993;
//rho_zetac=0.935;
//rho_zetah=0.675;
//rho_phitilde=0.991;
//rho_lambdamc=0.978;
//rho_lambdami=0.974;
//rho_lambdax=0.894;
//rho_R=0.874;
//rho_pi=1.710;
//rho_dpi=0.317;
//rho_x=-0.009;
//rho_y=0.078;
//rho_dy=0.116;

//steady state
//From wage equation B5
b_w=(lambda_w*sigma_L-(1-lambda_w))/((1-beta*xi_w)*(1-xi_w));
eta_0=b_w*xi_w;
eta_1=(sigma_L*lambda_w-b_w*(1+beta*xi_w^2));
eta_2=b_w*beta*xi_w;
eta_3=-b_w*xi_w;
eta_4=b_w*beta*xi_w;
eta_5=b_w*xi_w*kappa_w;
eta_6=-b_w*beta*xi_w*kappa_w;
eta_7=(1-lambda_w);
eta_8=-(1-lambda_w)*sigma_L;
eta_9=-(1-lambda_w)*tau_y/(1-tau_y);
eta_10=-(1-lambda_w)*tau_w/(1+tau_w);
eta_11=-(1-lambda_w);

pi=mu/mu_z; //A.3
R=(pi*mu_z-tau_k*beta)/((1-tau_k)*beta);//A.2
R_f=nu*R+1-nu; //A.17
eta_mc=lambda_mc/(lambda_mc-1); //Substitution elasticity among imported consumption goods
eta_mi=lambda_mi/(lambda_mi-1);//Substitution elasticity among imported investment goods
gamma_id=((1-omega_i)+omega_i*(eta_mi/(eta_mi-1))^(1-eta_i))^(1/(1-eta_i)); //A.11
gamma_cd=((1-omega_c)+omega_c*(eta_mc/(eta_mc-1))^(1-eta_c))^(1/(1-eta_c)); //A.9
gamma_dc=1/gamma_cd;
gamma_cmc=((1-omega_c)*((eta_mc-1)/eta_mc)^(1-eta_c)+omega_c)^(1/(1-eta_c)); //A.10
gamma_mcc=1/gamma_cmc;
gamma_imi=((1-omega_i)*((eta_mi-1)/eta_mi)^(1-eta_i)+omega_i)^(1/(1-eta_i)); //A.12
gamma_mii=1/gamma_imi;
r_k=(mu_z*gamma_id-beta*(1-delta)*gamma_id)/((1-tau_k)*beta);//using A.6 in FOC for k_bar(2.54)
w_bar= (1-alpha)*lambda_d^(-1/(1-alpha))*alpha^(alpha/(1-alpha))*r_k^(-alpha/(1-alpha))*R_f^(-1);   //using A.19
k_H=alpha/(1-alpha)*mu_z*w_bar*R_f*r_k^(-1);//using A.16
D1=(1-omega_c)*gamma_cd^eta_c+omega_c*gamma_cmc^eta_c;
D2=(1-gr)/lambda_d*mu_z^(-alpha)*k_H^alpha-((1-omega_i)*gamma_id^eta_i+omega_i*gamma_imi^eta_i)*(1-(1-delta)/mu_z)*k_H;
D3=(((1-tau_y)/lambda_w*w_bar/(1+tau_w))/A_L)^(1/sigma_L);
D4=((mu_z-beta*b)/((1+tau_c)*(mu_z-b)))*gamma_cd^(-1);
H=(D3*D4^(1/sigma_L)*(D2/D1)^(-1/sigma_L))^(sigma_L/(1+sigma_L));
c=D2/D1*H;
psi_z=1/c*D4;
y_bar=1/lambda_d*(mu_z)^(-alpha)*(k_H)^alpha*H;
g=gr*y_bar;
q=(A_q/((1-tau_k)*psi_z*(R-1)))^(1/sigma_q);
m_bar=nu*w_bar*H+q;
k=k_H*H;
k_bar=k;
i=(1-(1-delta)/mu_z)*k;
c_m =omega_c*gamma_cmc^eta_c*c;
i_m=omega_i*gamma_imi^eta_i*i;
y_star=omega_c*gamma_cmc^eta_c*c+omega_i*gamma_imi^eta_i*i;
 

// derived from steady state

//Declare parameters
//ForFisEstRes
//DeclareALLVParametersEstim


model(linear);

//***************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*R_hat;                                                    //*
inflation  = pi_c+pi_c(-1)+pi_c(-2)+pi_c(-3);                            //*
inflationq = pi_c*4;                                                 	 //* 
outputgap  = y_hat-y_hatf;                                               //*
output     = y_hat;                                                      //*
//**************************************************************************


//Original monetary policy rule (B22)
R_hat=rho_R*R_hat(-1)+(1-rho_R)*(pi_bar+rho_pi*(pi_c(-1)-pi_bar)+rho_y*y_hat(-1)+rho_x*x(-1))+rho_dpi*(pi_c-pi_c(-1))+rho_dy*(y_hat-y_hat(-1))+epsilon_R;


// Original Model Code:
//Domestic Phillips Curve (B1)
pi_hat-pi_bar=beta/(1+kappa_d*beta)*(pi_hat(+1)-rho_pibar*pi_bar)+kappa_d/(1+kappa_d*beta)*(pi_hat(-1)-pi_bar)-(kappa_d*beta*(1-rho_pibar)/(1+kappa_d*beta))*pi_bar+(((1-xi_d)*(1-xi_d*beta))/(xi_d*(1+kappa_d*beta)))*mc +lambda_dhat;

//marginal cost
//mc=alpha*rk_hat+(1-alpha)*(w_barhat+R_fhat)-epsilon;
//Different specification
mc=alpha*(mu_zhat+H_hat-k_hat)+ w_barhat+R_fhat -epsilon;
//rental rate of capital
rk_hat=mu_zhat+w_barhat+R_fhat+H_hat-k_hat;

//gross effective nominal rate of interest paid by firms to finance wage bill in advance
//R_fhat=nu*R/(nu*R+1-nu)*R_hat(-1)+nu*(R-1)/(nu*R+1-nu)*nu_hat;
R_fhat=nu*R/(nu*R+1-nu)*R_hat(-1); //without money demand shock

//Phillips Curve for imported consumption goods (B2)
pi_mc-pi_bar=(beta/(1+kappa_mc*beta))*(pi_mc(+1)-rho_pibar*pi_bar)+(kappa_mc/(1+kappa_mc*beta))*(pi_mc(-1)-pi_bar)-(kappa_mc*beta*(1-rho_pibar)/(1+kappa_mc*beta))*pi_bar+(((1-xi_mc)*(1-xi_mc*beta))/(xi_mc*(1+kappa_mc*beta)))*mc_mc +lambda_mchat;
mc_mc=-mc_x-gamma_xstar-gamma_mcdhat;
//Phillips Curve for imported investment goods (B3)
pi_mi-pi_bar=(beta/(1+kappa_mi*beta))*(pi_mi(+1)-rho_pibar*pi_bar)+(kappa_mi/(1+kappa_mi*beta))*(pi_mi(-1)-pi_bar)-(kappa_mi*beta*(1-rho_pibar)/(1+kappa_mi*beta))*pi_bar+(((1-xi_mi)*(1-xi_mi*beta))/(xi_mi*(1+kappa_mi*beta)))*mc_mi + lambda_mihat;
mc_mi=-mc_x-gamma_xstar-gamma_midhat;


//Phillips Curve for exporting firm (B4)
pi_x-pi_bar=(beta/(1+kappa_x*beta))*(pi_x(+1)-rho_pibar*pi_bar)+(kappa_x/(1+kappa_x*beta))*(pi_x(-1)-pi_bar)-(kappa_x*beta*(1-rho_pibar)/(1+kappa_x*beta))*pi_bar+(((1-xi_x)*(1-xi_x*beta))/(xi_x*(1+kappa_x*beta)))*mc_x + lambda_x;
//wage equation (B5)
//w_barhat=-(1/eta_1)*(eta_0*w_barhat(-1)+eta_2*w_barhat(+1)+eta_3*(pi_hat-pi_bar)+eta_4*(pi_hat(+1)-rho_pibar*pi_bar)+eta_5*(pi_c(-1)-pi_bar)+eta_6*(pi_c-rho_pibar*pi_bar)+eta_7*psi_zhat+eta_8*H_hat+eta_9*tauy_hat + eta_10*tauw_hat + eta_11*zeta_h);
//additive labour supply shock
w_barhat=-(1/eta_1)*(eta_0*w_barhat(-1)+eta_2*w_barhat(+1)+eta_3*(pi_hat-pi_bar)+eta_4*(pi_hat(+1)-rho_pibar*pi_bar)+eta_5*(pi_c(-1)-pi_bar)+eta_6*(pi_c-rho_pibar*pi_bar)+eta_7*psi_zhat+eta_8*H_hat+eta_9*tauy_hat + eta_10*tauw_hat) + zeta_h;



//Euler equation (B6)
//c_hat=-(1/(mu_z^2+b^2*beta))*(-b*beta*mu_z*c_hat(+1)-b*mu_z*c_hat(-1)+b*mu_z*(mu_zhat-beta*mu_zhat(+1))+(mu_z-b*beta)*(mu_z-b)*psi_zhat+tau_c/(1+tau_c)*(mu_z-b*beta)*(mu_z-b)*tauc_hat + (mu_z-b*beta)*(mu_z-b)*gamma_cdhat-(mu_z-b)*(mu_z*zeta_c-b*beta*zeta_c(+1)));
c_hat=-(1/(mu_z^2+b^2*beta))*(-b*beta*mu_z*c_hat(+1)-b*mu_z*c_hat(-1)+b*mu_z*(mu_zhat-beta*mu_zhat(+1))+(mu_z-b*beta)*(mu_z-b)*psi_zhat+tau_c/(1+tau_c)*(mu_z-b*beta)*(mu_z-b)*tauc_hat + (mu_z-b*beta)*(mu_z-b)*gamma_cdhat-(mu_z-b)*(-b*beta*zeta_c(+1))) + zeta_c;

//Derivative w.r.t. Investment (B7)
//P_k+Upsilon-gamma_idhat-mu_z^2*S_tilde*(i_hat-i_hat(-1)-beta*(i_hat(+1)-i_hat)+mu_zhat-beta*mu_zhat(+1))=0;
//written differently
//i_hat=(1/((mu_z^2*S_tilde)*(1+beta)))*((mu_z^2*S_tilde)*(i_hat(-1)+beta*i_hat(+1)-mu_zhat+beta*mu_zhat(+1))+P_k+Upsilon-gamma_idhat);
//additive shock
i_hat=(1/((mu_z^2*S_tilde)*(1+beta)))*((mu_z^2*S_tilde)*(i_hat(-1)+beta*i_hat(+1)-mu_zhat+beta*mu_zhat(+1))+P_k-gamma_idhat)+Upsilon;

//Derivative w.r.t. real balances (B8)
-mu*psi_zhat +mu*psi_zhat(+1)-mu*mu_zhat(+1)+(mu-beta*tau_k)*R_hat-mu*pi_hat(+1)+tau_k/(1-tau_k)*(beta-mu)*tauk_hat(+1)=0;

//Derivative w.r.t. capital(B9)
psi_zhat+mu_zhat(+1)-psi_zhat(+1)-beta*(1-delta)/mu_z*P_k(+1)+P_k-(mu_z-beta*(1-delta))/mu_z*rk_hat(+1)+tau_k/(1-tau_k)*(mu_z-beta*(1-delta))/mu_z*tauk_hat(+1);

//UIP condition (B10)
dS(+1)-(R_hat-Rstar_hat)-phi_a*a+phi_tilde;

//Aggregate resource constraint (B11)
(1-omega_c)*gamma_cd^eta_c*c/y_bar*(c_hat+eta_c*gamma_cdhat)+(1-omega_i)*gamma_id^eta_i*i/y_bar*(i_hat+eta_i*gamma_idhat)+gr*g_hat+y_star/y_bar*(ystar_hat-eta_f*gamma_xstar+z_tildestar)=lambda_d*(epsilon+alpha*(k_hat-mu_zhat)+(1-alpha)*H_hat)-(1-tau_k)*r_k*k_bar/(y_bar*mu_z)*(k_hat-k_barhat(-1));

//Law of motion for capital (B12)
//k_barhat=(1-delta)*1/mu_z*k_barhat(-1)-(1-delta)*1/mu_z*mu_zhat+(1-(1-delta)*1/mu_z)*Upsilon+(1-(1-delta)*1/mu_z)*i_hat;
//additive investment technology shock
k_barhat=(1-delta)*1/mu_z*k_barhat(-1)-(1-delta)*1/mu_z*mu_zhat+(1-(1-delta)*1/mu_z)*i_hat+Upsilon;


//Deriative w.r.t. cash holding (B14)
//q_hat=1/sigma_q*(zeta_q+tau_k/(1-tau_k)*tauk_hat-psi_zhat-R/(R-1)*R_hat(-1);
q_hat=1/sigma_q*(tau_k/(1-tau_k)*tauk_hat-psi_zhat-R/(R-1)*R_hat(-1)); //without money demand shock

//Money growth (B15)
mu_hat-m_barhat-mu_zhat-pi_hat+m_barhat(-1)=0;

//loan market clearing condition (B16)
//nu*w_bar*H*(nu_hat+w_barhat+H_hat)=mu*m_bar/(pi*mu_z)*(mu_hat+m_barhat(-1)-pi_hat-mu_zhat)-q*q_hat;
nu*w_bar*H*(w_barhat+H_hat)=mu*m_bar/(pi*mu_z)*(mu_hat+m_barhat(-1)-pi_hat-mu_zhat)-q*q_hat; //without firm money demand shock

//net foreign assets (B17)
a=-y_star*mc_x-eta_f*y_star*gamma_xstar+y_star*ystar_hat+y_star*z_tildestar+(c_m+i_m)*gamma_fhat-(c_m*(-eta_c*(1-omega_c)*(gamma_cd)^(-(1-eta_c))*gamma_mcdhat +c_hat)+i_m*(-eta_i*(1-omega_i)*(gamma_id)^(-(1-eta_i))*gamma_midhat+i_hat))+R/(pi*mu_z)*a(-1);

//relative prices (B18-B21)
gamma_mcdhat=gamma_mcdhat(-1)+pi_mc-pi_hat;
gamma_midhat=gamma_midhat(-1)+pi_mi-pi_hat;
gamma_xstar=gamma_xstar(-1)+pi_x-pistar_hat;
mc_x=mc_x(-1)+pi_hat-pi_x-dS;
gamma_fhat=mc_x+gamma_xstar;
gamma_cdhat=omega_c*(gamma_mcc)^(1-eta_c)*gamma_mcdhat; 
gamma_idhat=omega_i*(gamma_mii)^(1-eta_i)*gamma_midhat;



//CPI_Inflation
pi_c=((1-omega_c)*(gamma_dc)^(1-eta_c))*pi_hat+((omega_c)*(gamma_mcc)^(1-eta_c))*pi_mc;
//Deviation of output from SS
y_hat=lambda_d*(epsilon+alpha*(k_hat-mu_zhat)+(1-alpha)*H_hat);
//real exchange rate
x=-omega_c*(gamma_cmc)^(-(1-eta_c))*gamma_mcdhat-gamma_xstar-mc_x;

//employment equation (B23)
E=beta/(1+beta)*E(+1)+(1/(1+beta))*E(-1)+((1-xi_e)*(1-beta*xi_e))/((1+beta)*xi_e)*(H_hat-E);

//FOC w.r.t Capital utilization rate (B13)
u=1/sigma_a*rk_hat-1/sigma_a*tau_k/(1-tau_k)*tauk_hat;
//Capital utilization rate
u=k_hat-k_barhat(-1);



// FLEXIBLE PRICE ECONOMY  (added)

// Instead of policy rule
pi_hatf = 0;

mcf = 0;
mc_mcf = 0;
mc_mif = 0;
mc_xf = 0;

//marginal cost
//mcf=alpha*rk_hatf+(1-alpha)*(w_barhatf+R_fhatf)-epsilon;
//Different specification
mcf=alpha*(mu_zhat+H_hatf-k_hatf)+ w_barhatf+R_fhatf -epsilon;
//rental rate of capital
rk_hatf=mu_zhat+w_barhatf+R_fhatf+H_hatf-k_hatf;

//gross effective nominal rate of interest paid by firms to finance wage bill in advance
//R_fhatf=nu*R/(nu*R+1-nu)*R_hatf(-1)+nu*(R-1)/(nu*R+1-nu)*nu_hat;
R_fhatf=nu*R/(nu*R+1-nu)*R_hatf(-1); //without money demand shock

//imported consumption goods 
mc_mcf=-mc_xf-gamma_xstarf-gamma_mcdhatf;
//imported investment goods 
mc_mif=-mc_xf-gamma_xstarf-gamma_midhatf;

//wage equation (B5) for flexible price case, ie (2.64) log-linearized
-tau_y/(1-tau_y)*tauy_hat+psi_zhatf+w_barhatf-(tau_w/(1+tau_w))*tauw_hat = zeta_h+sigma_L*H_hatf;


//Euler equation (B6)
//c_hatf=-(1/(mu_z^2+b^2*beta))*(-b*beta*mu_z*c_hatf(+1)-b*mu_z*c_hatf(-1)+b*mu_z*(mu_zhat-beta*mu_zhat(+1))+(mu_z-b*beta)*(mu_z-b)*psi_zhatf+tau_c/(1+tau_c)*(mu_z-b*beta)*(mu_z-b)*tauc_hat + (mu_z-b*beta)*(mu_z-b)*gamma_cdhatf-(mu_z-b)*(mu_z*zeta_c-b*beta*zeta_c(+1)));
c_hatf=-(1/(mu_z^2+b^2*beta))*(-b*beta*mu_z*c_hatf(+1)-b*mu_z*c_hatf(-1)+b*mu_z*(mu_zhat-beta*mu_zhat(+1))+(mu_z-b*beta)*(mu_z-b)*psi_zhatf+tau_c/(1+tau_c)*(mu_z-b*beta)*(mu_z-b)*tauc_hat + (mu_z-b*beta)*(mu_z-b)*gamma_cdhatf-(mu_z-b)*(-b*beta*zeta_c(+1))) + zeta_c;

//Derivative w.r.t. Investment (B7)
//P_kf+Upsilon-gamma_idhatf-mu_z^2*S_tilde*(i_hatf-i_hatf(-1)-beta*(i_hatf(+1)-i_hatf)+mu_zhat-beta*mu_zhat(+1))=0;
//written differently
//i_hatf=(1/((mu_z^2*S_tilde)*(1+beta)))*((mu_z^2*S_tilde)*(i_hatf(-1)+beta*i_hatf(+1)-mu_zhat+beta*mu_zhat(+1))+P_kf+Upsilon-gamma_idhatf);
//additive shock
i_hatf=(1/((mu_z^2*S_tilde)*(1+beta)))*((mu_z^2*S_tilde)*(i_hatf(-1)+beta*i_hatf(+1)-mu_zhat+beta*mu_zhat(+1))+P_kf-gamma_idhatf)+Upsilon;

//Derivative w.r.t. real balances (B8)
-mu*psi_zhatf +mu*psi_zhatf(+1)-mu*mu_zhat(+1)+(mu-beta*tau_k)*R_hatf-mu*pi_hatf(+1)+tau_k/(1-tau_k)*(beta-mu)*tauk_hat(+1)=0;

//Derivative w.r.t. capital(B9)
psi_zhatf+mu_zhat(+1)-psi_zhatf(+1)-beta*(1-delta)/mu_z*P_kf(+1)+P_kf-(mu_z-beta*(1-delta))/mu_z*rk_hatf(+1)+tau_k/(1-tau_k)*(mu_z-beta*(1-delta))/mu_z*tauk_hat(+1);

//UIP condition (B10)
dSf(+1)-(R_hatf-Rstar_hatf)-phi_a*af+phi_tilde;

//Aggregate resource constraint (B11)
(1-omega_c)*gamma_cd^eta_c*c/y_bar*(c_hatf+eta_c*gamma_cdhatf)+(1-omega_i)*gamma_id^eta_i*i/y_bar*(i_hatf+eta_i*gamma_idhatf)+gr*g_hat+y_star/y_bar*(ystar_hatf-eta_f*gamma_xstarf+z_tildestar)=lambda_d*(epsilon+alpha*(k_hatf-mu_zhat)+(1-alpha)*H_hatf)-(1-tau_k)*r_k*k_bar/(y_bar*mu_z)*(k_hatf-k_barhatf(-1));

//Law of motion for capital (B12)
//k_barhatf=(1-delta)*1/mu_z*k_barhatf(-1)-(1-delta)*1/mu_z*mu_zhat+(1-(1-delta)*1/mu_z)*Upsilon+(1-(1-delta)*1/mu_z)*i_hatf;
//additive investment technology shock
k_barhatf=(1-delta)*1/mu_z*k_barhatf(-1)-(1-delta)*1/mu_z*mu_zhat+(1-(1-delta)*1/mu_z)*i_hatf+Upsilon;


//Deriative w.r.t. cash holding (B14)
//q_hatf=1/sigma_q*(zeta_q+tau_k/(1-tau_k)*tauk_hat-psi_zhatf-R/(R-1)*R_hatf(-1);
q_hatf=1/sigma_q*(tau_k/(1-tau_k)*tauk_hat-psi_zhatf-R/(R-1)*R_hatf(-1)); //without money demand shock

//Money growth (B15)
mu_hatf-m_barhatf-mu_zhat-pi_hatf+m_barhatf(-1)=0;

//loan market clearing condition (B16)
//nu*w_bar*H*(nu_hat+w_barhatf+H_hatf)=mu*m_bar/(pi*mu_z)*(mu_hatf+m_barhatf(-1)-pi_hatf-mu_zhat)-q*q_hatf;
nu*w_bar*H*(w_barhatf+H_hatf)=mu*m_bar/(pi*mu_z)*(mu_hatf+m_barhatf(-1)-pi_hatf-mu_zhat)-q*q_hatf; //without firm money demand shock

//net foreign assets (B17)
af=-y_star*mc_xf-eta_f*y_star*gamma_xstarf+y_star*ystar_hatf+y_star*z_tildestar+(c_m+i_m)*gamma_fhatf-(c_m*(-eta_c*(1-omega_c)*(gamma_cd)^(-(1-eta_c))*gamma_mcdhatf +c_hatf)+i_m*(-eta_i*(1-omega_i)*(gamma_id)^(-(1-eta_i))*gamma_midhatf+i_hatf))+R/(pi*mu_z)*af(-1);

//relative prices (B18-B21)
gamma_mcdhatf=gamma_mcdhatf(-1)+pi_mcf-pi_hatf;
gamma_midhatf=gamma_midhatf(-1)+pi_mif-pi_hatf;
gamma_xstarf=gamma_xstarf(-1)+pi_xf-pistar_hatf;
mc_xf=mc_xf(-1)+pi_hatf-pi_xf-dSf;
gamma_fhatf=mc_xf+gamma_xstarf;
gamma_cdhatf=omega_c*(gamma_mcc)^(1-eta_c)*gamma_mcdhatf; 
gamma_idhatf=omega_i*(gamma_mii)^(1-eta_i)*gamma_midhatf;



//CPI_Inflation
pi_cf=((1-omega_c)*(gamma_dc)^(1-eta_c))*pi_hatf+((omega_c)*(gamma_mcc)^(1-eta_c))*pi_mcf;
//Deviation of output from SS
y_hatf=lambda_d*(epsilon+alpha*(k_hatf-mu_zhat)+(1-alpha)*H_hatf);
//real exchange rate
xf=-omega_c*(gamma_cmc)^(-(1-eta_c))*gamma_mcdhatf-gamma_xstarf-mc_xf;

//FOC w.r.t Capital utilization rate (B13)
uf=1/sigma_a*rk_hatf-1/sigma_a*tau_k/(1-tau_k)*tauk_hat;
//Capital utilization rate
uf=k_hatf-k_barhatf(-1);

// END FLEXIBLE PRICE ECONOMY

//Shock processes

//Fiscal VAR 
 tauk_hat    = rho_tauk*tauk_hat(-1)    + epstauk*epsilon_tauk;
 tauw_hat    = rho_tauw*tauw_hat(-1)    + epstauw*epsilon_tauw; 
 tauy_hat    =   FisLag111*tauy_hat(-1)   + FisLag112*tauc_hat(-1) + FisLag113*g_hat(-1)   
               + FisLag211*tauy_hat(-2)   + FisLag212*tauc_hat(-2) + FisLag213*g_hat(-2) 
               + FisShock22*epsilon_tauy   + FisShock23*epsilon_tauc + FisShock25*epsilon_rhog;
 
 tauc_hat    =   FisLag121*tauy_hat(-1)   + FisLag122*tauc_hat(-1) + FisLag123*g_hat(-1)   
               + FisLag221*tauy_hat(-2)   + FisLag222*tauc_hat(-2) + FisLag223*g_hat(-2) 
               + FisShock32*epsilon_tauy   + FisShock33*epsilon_tauc + FisShock35*epsilon_rhog;
 
 g_hat       =   FisLag131*tauy_hat(-1)   + FisLag132*tauc_hat(-1) + FisLag133*g_hat(-1)   
               + FisLag231*tauy_hat(-2)   + FisLag232*tauc_hat(-2) + FisLag233*g_hat(-2) 
               + FisShock52*epsilon_tauy   + FisShock53*epsilon_tauc + FisShock55*epsilon_rhog; 

//Foreign VAR
 pistar_hat  = ForLag111*pistar_hat(-1)  + ForLag112*ystar_hat(-1) + ForLag113*Rstar_hat(-1)  
             +ForLag211*pistar_hat(-2)  + ForLag212*ystar_hat(-2) + ForLag213*Rstar_hat(-2) 	
             +ForLag311*pistar_hat(-3)  + ForLag312*ystar_hat(-3) + ForLag313*Rstar_hat(-3) 
      		+ForLag411*pistar_hat(-4)  + ForLag412*ystar_hat(-4) + ForLag413*Rstar_hat(-4) + ForShock11*epsilon_pistar + ForShock12*epsilon_ystar + ForShock13*epsilon_Rstar ;
 
 ystar_hat = ForLag121*pistar_hat(-1)  + ForLag122*ystar_hat(-1) + ForLag123*Rstar_hat(-1)  
             +ForLag221*pistar_hat(-2)  + ForLag222*ystar_hat(-2) + ForLag223*Rstar_hat(-2) 	
             +ForLag321*pistar_hat(-3)  + ForLag322*ystar_hat(-3) + ForLag323*Rstar_hat(-3) 
      		+ForLag421*pistar_hat(-4)  + ForLag422*ystar_hat(-4) + ForLag423*Rstar_hat(-4) + ForShock21*epsilon_pistar + ForShock22*epsilon_ystar + ForShock23*epsilon_Rstar ;
 
 Rstar_hat  = ForLag131*pistar_hat(-1)  + ForLag132*ystar_hat(-1) + ForLag133*Rstar_hat(-1)  
             +ForLag231*pistar_hat(-2)  + ForLag232*ystar_hat(-2) + ForLag233*Rstar_hat(-2) 	
             +ForLag331*pistar_hat(-3)  + ForLag332*ystar_hat(-3) + ForLag333*Rstar_hat(-3) 
      		+ForLag431*pistar_hat(-4)  + ForLag432*ystar_hat(-4) + ForLag433*Rstar_hat(-4) + ForShock31*epsilon_pistar + ForShock32*epsilon_ystar + ForShock33*epsilon_Rstar ;


//Foreign VAR for flexible economy (added)
 pistar_hatf  = 0;
 
 ystar_hatf = ForLag121*pistar_hatf(-1)  + ForLag122*ystar_hatf(-1) + ForLag123*Rstar_hatf(-1)  
             +ForLag221*pistar_hatf(-2)  + ForLag222*ystar_hatf(-2) + ForLag223*Rstar_hatf(-2) 	
             +ForLag321*pistar_hatf(-3)  + ForLag322*ystar_hatf(-3) + ForLag323*Rstar_hatf(-3) 
      		+ForLag421*pistar_hatf(-4)  + ForLag422*ystar_hatf(-4) + ForLag423*Rstar_hatf(-4) + 0*epsilon_pistar + ForShock22*epsilon_ystar + ForShock23*epsilon_Rstar ;
 
 Rstar_hatf  = ForLag131*pistar_hatf(-1)  + ForLag132*ystar_hatf(-1) + ForLag133*Rstar_hatf(-1)  
             +ForLag231*pistar_hatf(-2)  + ForLag232*ystar_hatf(-2) + ForLag233*Rstar_hatf(-2) 	
             +ForLag331*pistar_hatf(-3)  + ForLag332*ystar_hatf(-3) + ForLag333*Rstar_hatf(-3) 
      		+ForLag431*pistar_hatf(-4)  + ForLag432*ystar_hatf(-4) + ForLag433*Rstar_hatf(-4) + 0*epsilon_pistar + ForShock32*epsilon_ystar + ForShock33*epsilon_Rstar ;


lambda_dhat=epsilon_lambdad;
lambda_mchat=rho_lambdamc*lambda_mchat(-1)+epsilon_lambdamc;
lambda_mihat=rho_lambdami*lambda_mihat(-1)+epsilon_lambdami;
lambda_x=rho_lambdax*lambda_x(-1)+epsilon_lambdax;
lambda_dhatf=0; //flexible price case
lambda_mchatf=0;
lambda_mihatf=0;
lambda_xf=0;
mu_zhat=rho_muz*mu_zhat(-1)+epsilon_muz;
epsilon=rho_epsilon*epsilon(-1)+epsilon_epsilon;
Upsilon=rho_Upsilon*Upsilon(-1)+epsilon_Upsilon;
z_tildestar=rho_ztildestar*z_tildestar(-1)+epsilon_ztildestar;
zeta_c=rho_zetac*zeta_c(-1)+epsilon_zetac;
zeta_h=rho_zetah*zeta_h(-1)+epsilon_zetah;
phi_tilde=rho_phitilde*phi_tilde(-1)+epsilon_phitilde;
pi_bar=rho_pibar*pi_bar(-1)+epsilon_pibar;
end; 

shocks;
//Government
//capital income tax shock
var epsilon_tauk;
stderr 1;
//pay-roll  tax shock
var epsilon_tauw;
stderr 1;
//comsumption tax shock
var epsilon_tauc;
stderr 1;
//labour income tax shock
var epsilon_tauy;
stderr 1;
//government spending
var epsilon_rhog;
stderr 1;

//Foreign Economy
//Foreign inflation
var epsilon_pistar;
stderr 1;
//Foreign output
var epsilon_ystar;
stderr 1;
//Foreign interest rate
var epsilon_Rstar;
stderr 1;

//Using mean of posterior distribution
//domestic markup
var epsilon_lambdad;
stderr 0.132;
//consumption import markup
var epsilon_lambdamc;
stderr 2.882;
//investment import markup
var epsilon_lambdami;
stderr 0.354;
//export markup
var epsilon_lambdax;
stderr 1.124;
//non-stationary technology growth
var epsilon_muz;
stderr 0.137;
//stationary technology
var epsilon_epsilon;
stderr 0.519;
//investment specific technology shock
var epsilon_Upsilon;
stderr 0.469;
//asymmetric technology shock
var epsilon_ztildestar;
stderr 0.217;
//consumption preference shock
var epsilon_zetac;
stderr 0.157;
//laboursupply shock
var epsilon_zetah;
stderr 0.098;
//risk premium shock
var epsilon_phitilde;
stderr 0.183;
//monetary policy shock
var epsilon_R;
stderr 0.135;
//inflation target shock
var epsilon_pibar;
stderr 0.053;

//Using mode of posterior distribution
//domestic markup
//var epsilon_lambdad;
//stderr 0.130;
//consumption import markup
//var epsilon_lambdamc;
//stderr 2.548;
//investment import markup
//var epsilon_lambdami;
//stderr 0.292;
//export markup
//var epsilon_lambdax;
//stderr 0.977;
//non-stationary technology growth
//var epsilon_muz;
//stderr 0.130;
//stationary technology
//var epsilon_epsilon;
//stderr 0.452;
//investment specific technology shock
//var epsilon_Upsilon;
//stderr 0.424;
//asymmetric technology shock
//var epsilon_ztildestar;
//stderr 0.203;
//consumption preference shock
//var epsilon_zetac;
//stderr 0.151;
//laboursupply shock
//var epsilon_zetah;
//stderr 0.095;
//risk premium shock
//var epsilon_phitilde;
//stderr 0.130;
//monetary policy shock
//var epsilon_R;
//stderr 0.133;
//inflation target shock
//var epsilon_pibar;
//stderr 0.044;

end;
//steady;
//check;

stoch_simul(irf=20, noprint, nograph) pi_hat w_barhat c_hat i_hat x R_hat E y_hat;
