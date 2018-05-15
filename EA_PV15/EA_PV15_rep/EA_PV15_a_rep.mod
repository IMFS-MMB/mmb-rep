// Model: EA_PV15

// Further references:
// Poutineau, J.C. and Vermandel, G., 2015. Cross-border banking flows spillovers in the Eurozone:
// Evidence from an estimated DSGE model. Journal of Economic Dynamics and Control, 51, pp.378-403.

// Original code: Gauthier Vermandel 

// Last edited: Lazar Milivojevic 18/04/2018

// This file simulates the dynamic response of the model to the productivity, net wealth, and liability 
// shocks in the core country under autarky

//variables with subscript "_h" are for core country
//                         "_f" are for peripheral countries

%----------------------------------------------------------------
// 1. Defining variables
%----------------------------------------------------------------

var y_h y_f y_ea 		% output
	c_h c_f c_ea		% consumption
	r					% nominal ECB rate
	pi_h pi_f pi_ea		% inflation - production prices
	pic_h pic_f			% inflation - consumption prices
	w_h w_f				% real wages
	wh_h wh_f			% desired wage by households
	h_h h_f				% hours worked
	mc_h mc_f			% marginal cost
	k_h k_f				% physical capital
	i_h i_f i_ea		% investment
	z_h z_f				% cost of capital
	q_h q_f				% shadow value of physical capital
	ToT					% term of trade
	b_h					% net foreign asset
	ku_h ku_f			% utilized capital
	u_h u_f				% capital utilization rate
	CA					% current account
	
// Financial Accelerator

	omega_h omega_f		% default threshold
	n_E_h n_E_f			% entrepreneur net wealth
	r_K_h r_K_f			% rate of return of physical capital
	ld_h ld_f			% loan demand
	rr_h rr_f			% real rate
	s_h s_f				% spread
	nk_h nk_f			% capital to net wealth ratio
	v_E_h v_E_f			% one period profit of entrepreneurs

// banks

	mcL_h mcL_f			% marginal cost of loans
	ls_h ls_f ls_ea		% loan supply
	r_L_h r_L_f 		% real loan rate
	s_B_h s_B_f			% lending spread
	pl_h pl_f			% cost of borrowing - demand (CES)
    bk_h bk_f			% bank capital
    ibn_h ibn_f			% assets to bank capital ratio
    IBs_h IBs_f IB_ea	% interbank supply
    r_IB_h r_IB_f		% interbank rate - supply
    p_IB_h p_IB_f		% interbank rate - demand (CES)
    IBd_h IBd_f			% interbank demand

// shocks

	a_h a_f						% productivity shock
	g_h g_f						% demand shock
	beta_shock_h beta_shock_f	% time-preference shock
	n_shock_h n_shock_f			% net wealth shock
	q_shock_h q_shock_f			% external finance premium shock
	rL_shock_h rL_shock_f		% bank rate markup shock
	w_shock_h w_shock_f			% wage markup shock
    ib_shock_h ib_shock_f		% bank liability shock
    r_shock ;					% ECB monetary policy shock

varexo	e_a_h e_g_h e_beta_h  e_a_f e_g_f e_beta_f e_n_h e_n_f e_q_h e_q_f e_rL_h e_rL_f  e_w_h e_w_f e_ib_h e_ib_f %e_pi_h e_pi_f  e_pi  e_ac e_ac_h e_ac_f
        e_a e_g e_beta e_n e_q e_rL e_w e_ib e_r;

parameters	beta alpha delta thetap_h thetap_f xi_B xi_I_h xi_I_f GYss 
			rho_a_h rho_g_h rho_a_f rho_g_f rho_beta_f rho_beta_h rho_n_h rho_n_f rho_q_h rho_q_f rho_L_h rho_L_f rho_W_h rho_W_f rho_B_h rho_B_f
 			u_W_h u_W_f rho_ag_h rho_ag_f
			phi_pi phi_dy rho_R rho sigmaC_h sigmaC_f mu sigmaL_h sigmaL_f xiL_h xiL_f thetaL_h thetaL_f xiw_h xiw_f thetaw_h thetaw_f
			alpha_I alpha_C Rss Hss Zss Iss Qss Kss
			Yss Css Wss xip_h xip_f hc_h hc_f psi_h psi_f
			% financial accelerator
			ETA_Sss gamma_E RKss RRLss Nss Lss NKss OMEGAss ka wmin w_sup 
			w_inf varkappa_h varkappa_f chi_IB_h chi_IB_f gammatild_E
			gamma_B hL_h hL_f alpha_L alpha_IB nu xi Vss BKss IBss RFss lambda hib_h hib_f
			;

%----------------------------------------------------------------
// 2. Calibration
%----------------------------------------------------------------

// CALIBRATED PARAMETERS

beta 		= 0.995;	% Discount Factor
delta 		= 0.02;		% Depreciation rate
alpha 		= 0.25;		% Capital share
GYss 		= 0.24;		% Public spending in GDP
xi_B 		= 0.0007;	% portfolio adjustment cost
NKss		= 0.40; 	% leverage ratio N/Kss
SLss		= 2/400;	% entrepreneur spread
Hss			= 1/3;		% hours worked

// ESTIMATED PARAMETERS

sigmaC_h 	= 2;    % parameters on consumption = risk aversion
sigmaC_f 	= 2.04; % parameters on consumption = risk aversion
hc_h 		= 0.32; % Consumption habit
hc_f 		= 0.57; % Consumption habit
sigmaL_h 	= .59;	% Elasticity of labor
sigmaL_f 	= .66;	% Elasticity of labor
thetap_h 	= 0.56;	% NKPC forward looking
thetap_f 	= 0.56;	% NKPC forward looking
xip_h 		= 0.07;	% NKPC backward looking
xip_f 		= 0.08;	% NKPC backward looking
thetaw_h 	= 0.67; % NKPC bank forward looking
thetaw_f 	= 0.6;	% NKPC bank forward looking
xiw_h 		= 0.46;	% NK bank backward looking
xiw_f 		= 0.36;	% NK bank backward looking
thetaL_h 	= 0.29;	% NKPC bank forward looking
thetaL_f 	= 0.31;	% NKPC bank forward looking
xiL_h 		= 0.12;	% NK bank backward looking
xiL_f 		= 0.21;	% NK bank backward looking
xi_I_h 		= 0.63;	% investment adjustment cost
xi_I_f 		= 1.87;	% investment adjustment cost
chi_IB_h  	= 0.48;	% monitoring technology
chi_IB_f   	= 0.23; % monitoring technology
psi_h		= 0.66;	% capital utilization rate
psi_f		= 0.68;	% capital utilization rate
varkappa_h	= 0.05; % external finance premium elasticity
varkappa_f	= 0.08; % external finance premium elasticity
hL_h		= 0.96; % firms loans demand habits
hL_f		= 0.95; % firms loans demand habits
hib_h 		= 0.20; % interbank loan demand habits
hib_f 		= 0.21; % interbank loan demand habits
lambda 		= 0.25; % illiquid bank share
phi_pi		= 1.85; % monetary policy - inflation weight
phi_dy		= 0.15; % monetary policy - gdp growth
rho			= 0.84;	% monetary policy - smoothing 
alpha_C 	= 0.17;	% consumption goods openness
alpha_I 	= 0.06;	% investment goods openness
alpha_L 	= 0;	% corporate loans openness
alpha_IB 	= 0;	% interbank loans openness
mu			= 4.43; % substitutability final goods
nu			= 2.02;	% substitutability corporate loans
xi 			= 0.87; % substitutability interbank loans

// Shocks AR process
rho_a_h		= 0.99;	% AR productivity
rho_a_f		= 0.99;
rho_g_h		= 0.93; % AR demand
rho_g_f		= 0.91;
rho_beta_h	= 0.81;	% AR time preference
rho_beta_f	= 0.54;
rho_n_h		= 0.96;	% AR entrepreneur net wealth
rho_n_f		= 0.96;
rho_q_h		= 0.47;	% AR external finance premium
rho_q_f		= 0.59;
rho_L_h		= 0.99;	% AR loan rate markup
rho_L_f		= 0.90;
rho_B_h		= 0.90;	% AR bank liabilities
rho_B_f		= 0.93;
rho_W_h		= 0.99;	% AR markup wage
rho_W_f		= 0.99;
u_W_h 		= 0.51;	% ARMA wage
u_W_f 		= 0.28;
rho_R		= 0.41;	% AR monetary policy
rho_ag_h 	= 0.84;	% Productivity to spending spillover
rho_ag_f 	= 0.83;


// Financial parameters

Rss			= 1/beta; 
RRLss		= Rss+SLss;
wmin		= 1-NKss;
ka			= 1/NKss;

// Calibrating Model by financial spreads

OMEGAss 	= wmin*((RRLss/Rss)^(1/ka));
RKss		= (RRLss/OMEGAss)*(1-NKss);
Gw			= 1-((wmin/OMEGAss)^(ka-1));
ETA_Dss 	= 1-(wmin/OMEGAss)^ka;
ETA_Sss 	= (wmin/OMEGAss)^ka;
w_sup 		= (ka/(ka-1))*OMEGAss;
w_inf 		= (ka/(ka-1))*(((OMEGAss^(1-ka))-(wmin^(1-ka)))/((OMEGAss^(-ka))-(wmin^(-ka)))); 

// entrepreneurs ss
Qss			=1;
Kss			=(((RKss)*Qss-(1-delta)*Qss)/(alpha*Hss^(1-alpha)))^(1/(alpha-1));
Nss			=NKss*Qss*Kss;
Lss			=Qss*Kss-Nss;
gammatild_E_h=w_sup^(1-varkappa_h);
gammatild_E_f=w_sup^(1-varkappa_f);
Vss 		= (ETA_Sss*OMEGAss*Kss*RKss/(ka-1));
gamma_E 	= Nss/(Vss);

// Real part
Zss			= (RKss*Qss-(1-delta)*Qss);
Yss			= (Zss/alpha)*Kss;
Wss			= (1-alpha)*(Yss/Hss);
Css			= (1-GYss)*Yss-delta*Kss;
Iss			= delta*Kss;
BKss 		= 0.11*Lss;
IBss 		= 0.2*Lss;
RFss 		= Lss-BKss-IBss;
PI_Bss 		= (ETA_Sss*RRLss*Lss - Rss*IBss);
gamma_B 	= 1-BKss/PI_Bss;

%----------------------------------------------------------------
// 3. Model (the number refers to the equation in the paper)
%----------------------------------------------------------------

model(linear);
    // Household
	// Euler equation  (22)
	(c_h(+1)-(1+hc_h)*c_h+hc_h*c_h(-1))=((1-hc_h)/sigmaC_h)*(r-pic_h(+1)+beta_shock_h(+1)-beta_shock_h-Css*xi_B*b_h);
	(c_f(+1)-(1+hc_f)*c_f+hc_f*c_f(-1))=((1-hc_f)/sigmaC_f)*(r-pic_f(+1)+beta_shock_f(+1)-beta_shock_f+Css*xi_B*b_h);
	// Hours supply (23)
	wh_h=(sigmaL_h)*h_h+(sigmaC_h/(1-hc_h))*(c_h-hc_h*c_h(-1));
	wh_f=(sigmaL_f)*h_f+(sigmaC_f/(1-hc_f))*(c_f-hc_f*c_f(-1));
	// Labour Union
	// Sticky wage (24)
	(1+beta)*w_h=xiw_h*pic_h(-1)+w_h(-1)-(1+beta*xiw_h)*pic_h+beta*(w_h(+1)+pic_h(+1))+(((1-thetaw_h*beta)*(1-thetaw_h))/thetaw_h)*(wh_h-w_h) + w_shock_h;
	(1+beta)*w_f=xiw_f*pic_f(-1)+w_f(-1)-(1+beta*xiw_f)*pic_f+beta*(w_f(+1)+pic_f(+1))+(((1-thetaw_f*beta)*(1-thetaw_f))/thetaw_f)*(wh_f-w_f) + w_shock_f;

	
    // Firms
	// Input cost minimization
	h_h + w_h = z_h + ku_h;
	h_f + w_f = z_f + ku_f;
	// Utilized capital
	ku_h = k_h(-1) + u_h;
	ku_f = k_f(-1) + u_f;
	// Production function
	y_h = a_h + alpha*ku_h +  (1-alpha)*h_h;
	y_f = a_f + alpha*ku_f +  (1-alpha)*h_f;
	// Marginal cost of goods (25)
	mc_h = alpha*z_h + (1-alpha)*w_h - a_h;
	mc_f = alpha*z_f + (1-alpha)*w_f - a_f;
	// New Keynesian Phillips curve (26)
	(1+beta*xip_h)*pi_h=xip_h*pi_h(-1)+beta*pi_h(+1)+(((1-thetap_h*beta)*(1-thetap_h))/(thetap_h))*(mc_h + alpha_C*ToT) ;
	(1+beta*xip_f)*pi_f=xip_f*pi_f(-1)+beta*pi_f(+1)+(((1-thetap_f*beta)*(1-thetap_f))/(thetap_f))*(mc_f - alpha_C*ToT) ;
	// Fisherian equation
	r  = rr_h + pic_h(+1);
	r  = rr_f + pic_f(+1);

	
    // Capital producer 
	// Ex post return on capital (29)
	r_K_h = (Zss/RKss)*z_h + ((1-delta)/RKss)*q_h - q_h(-1) + (Css/RKss)*xi_B*b_h(-1) ;
	r_K_f = (Zss/RKss)*z_f + ((1-delta)/RKss)*q_f - q_f(-1) - (Css/RKss)*xi_B*b_h(-1) ;
	// Shadow value of capital (28)
	q_h + (alpha_C-alpha_I)*ToT = xi_I_h*( i_h - i_h(-1)) - beta*xi_I_h*( i_h(+1) - i_h );
	q_f - (alpha_C-alpha_I)*ToT = xi_I_f*( i_f - i_f(-1)) - beta*xi_I_f*( i_f(+1) - i_f );
	// Capital Law of motion
	delta*i_h = k_h - (1-delta)*k_h(-1);
	delta*i_f = k_f - (1-delta)*k_f(-1);
	// Optimal utilization rate of capital
	((1-psi_h)/psi_h)*z_h = u_h;
	((1-psi_f)/psi_f)*z_f = u_f;
	
   // Entrepreneur
	// Entrepreneur balance sheet (12)
	Lss*(ld_h-hL_h*ld_h(-1)) = Kss*(q_h+k_h)-Nss*n_E_h;
	Lss*(ld_f-hL_f*ld_f(-1)) = Kss*(q_f+k_f)-Nss*n_E_f;
	// Entrepreneur Net wealth law of motion (18)
	Nss*n_E_h = gamma_E*Vss*v_E_h - Nss*n_shock_h;
	Nss*n_E_f = gamma_E*Vss*v_E_f - Nss*n_shock_f;
	// Entrepreneur one-period profits (15)
	v_E_h = ((1-ka)*(1-varkappa_h)*(NKss/(1-NKss))*nk_h(-1) + r_K_h + q_h(-1) +k_h(-1));
	v_E_f = ((1-ka)*(1-varkappa_f)*(NKss/(1-NKss))*nk_f(-1) + r_K_f + q_f(-1) +k_f(-1));
	// Corporate Spread(19)
	s_h = r_K_h(+1) - pl_h;
    s_f = r_K_f(+1) - pl_f;
	// External finance premium (17)
	s_h = varkappa_h*(NKss/(1-NKss))*nk_h + q_shock_h;
	s_f = varkappa_f*(NKss/(1-NKss))*nk_f + q_shock_f;
	// Capital to net wealth ratio
	nk_h = q_h+k_h-n_E_h;
	nk_f = q_f+k_f-n_E_f;
	// Ex post threshold (34)
	omega_h+r_K_h+q_h(-1)+k_h(-1)=pl_h(-1)+(ld_h(-1)-hL_h*ld_h(-2));
	omega_f+r_K_f+q_f(-1)+k_f(-1)=pl_f(-1)+(ld_f(-1)-hL_f*ld_f(-2));
	// CES credit price index (14)
	pl_h = (1-alpha_L)*r_L_h + alpha_L*r_L_f + alpha_L*(pic_f(+1)-pic_h(+1));
	pl_f = (1-alpha_L)*r_L_f + alpha_L*r_L_h - alpha_L*(pic_f(+1)-pic_h(+1));
	


	// BANKING SYSTEM
    // Marginal cost of loans(10)
    mcL_h = ETA_Sss*RRLss/Rss*ka*(NKss/(1-NKss))*( (1-alpha_L)*(1-varkappa_h)*nk_h + alpha_L*(1-varkappa_f)*nk_f ) + lambda*p_IB_h + (1-lambda)*rr_h;
    mcL_f = ETA_Sss*RRLss/Rss*ka*(NKss/(1-NKss))*( (1-alpha_L)*(1-varkappa_f)*nk_f + alpha_L*(1-varkappa_h)*nk_h ) + lambda*p_IB_f + (1-lambda)*rr_f;
	// Sticky real lending rate (11)
	(1+beta*(1+xiL_h))*r_L_h = (1+xiL_h*(1+beta))*r_L_h(-1) - xiL_h*r_L_h(-2) + beta*r_L_h(+1) + (((1-thetaL_h*beta)*(1-thetaL_h))/thetaL_h)*( mcL_h - r_L_h ) + beta*thetaL_h*pic_h(+2) - (1+beta*thetaL_h)*pic_h(+1) + pic_h + rL_shock_h;
	(1+beta*(1+xiL_f))*r_L_f = (1+xiL_f*(1+beta))*r_L_f(-1) - xiL_f*r_L_f(-2) + beta*r_L_f(+1) + (((1-thetaL_f*beta)*(1-thetaL_f))/thetaL_f)*( mcL_f - r_L_f ) + beta*thetaL_f*pic_f(+2) - (1+beta*thetaL_f)*pic_f(+1) + pic_f + rL_shock_f;
	// Lending spread 
	r_L_h - rr_h = s_B_h;
	r_L_f - rr_f = s_B_f;
	 // Illiquid Bank
    // Illiquid bank capital law of motion (6)
    BKss/(1-gamma_B)*bk_h =  ETA_Sss*RRLss*Lss*( -ka*(NKss/(1-NKss))*( (1-alpha_L)*(1-varkappa_h)*nk_h(-1) + alpha_L*(1-varkappa_f)*nk_f(-1) ) + r_L_h(-1) + ls_h(-1) ) - IBss*Rss*( p_IB_h(-1) + IBd_h(-1)-hib_h*IBd_h(-2));
    BKss/(1-gamma_B)*bk_f =  ETA_Sss*RRLss*Lss*( -ka*(NKss/(1-NKss))*( (1-alpha_L)*(1-varkappa_f)*nk_f(-1) + alpha_L*(1-varkappa_h)*nk_h(-1) ) + r_L_f(-1) + ls_f(-1) ) - IBss*Rss*( p_IB_f(-1) + IBd_f(-1)-hib_f*IBd_f(-2));
    // Illiquid bank balance sheet (1)
    IBss*(IBd_h-hib_h*IBd_h(-1)) + BKss*bk_h + RFss*ib_shock_h = Lss*ls_h;
    IBss*(IBd_f-hib_f*IBd_f(-1)) + BKss*bk_f + RFss*ib_shock_f = Lss*ls_f;
	// Illiquid assets to bank capital ratio
	ibn_h=IBd_h-bk_h;
	ibn_f=IBd_f-bk_f;	
    // Illiquid Bank
 	// Interbank rate(9)
	r_IB_h = rr_h + chi_IB_h*IBss*IBs_h;
	r_IB_f = rr_f + chi_IB_f*IBss*IBs_f;
	// Interbank price index (5)
	p_IB_h = (1-alpha_IB)*r_IB_h + alpha_IB*r_IB_f + alpha_IB*(pic_f(+1)-pic_h(+1));
	p_IB_f = (1-alpha_IB)*r_IB_f + alpha_IB*r_IB_h - alpha_IB*(pic_f(+1)-pic_h(+1));

	
    // Aggregation
	// Market clearing for goods(31)
	Yss*y_h = (1-alpha_C)*(Css*c_h)+alpha_C*(Css*c_f) + Iss*((1-alpha_I)*i_h+alpha_I*i_f) + GYss*Yss*g_h + Zss*Kss*u_h + 2*mu*( Css*(1-alpha_C)*alpha_C + Iss*(1-alpha_I)*alpha_I )*ToT  ;
	Yss*y_f = (1-alpha_C)*(Css*c_f)+alpha_C*(Css*c_h) + Iss*((1-alpha_I)*i_f+alpha_I*i_h) + GYss*Yss*g_f + Zss*Kss*u_f - 2*mu*( Css*(1-alpha_C)*alpha_C + Iss*(1-alpha_I)*alpha_I )*ToT  ;
    // Corporate credit market equilibrium
	ls_h = (1-alpha_L)*ld_h + alpha_L*ld_f + alpha_L*(1-2*alpha_C)*ToT + 2*nu*(1-alpha_L)*alpha_L*(r_L_f+pic_f(+1)-r_L_h-pic_h(+1));
	ls_f = (1-alpha_L)*ld_f + alpha_L*ld_h - alpha_L*(1-2*alpha_C)*ToT - 2*nu*(1-alpha_L)*alpha_L*(r_L_f+pic_f(+1)-r_L_h-pic_h(+1));
    // Interbank market clearing
	(1-lambda)/lambda*IBs_h = (1-alpha_IB)*IBd_h + alpha_IB*IBd_f + alpha_IB*(1-2*xi)*ToT + 2*xi*(1-alpha_IB)*alpha_IB*(r_IB_f+pic_f(+1)-r_IB_h-pic_h(+1));
	(1-lambda)/lambda*IBs_f = (1-alpha_IB)*IBd_f + alpha_IB*IBd_h - alpha_IB*(1-2*xi)*ToT - 2*xi*(1-alpha_IB)*alpha_IB*(r_IB_f+pic_f(+1)-r_IB_h-pic_h(+1));


	// Monetary policy rule (30)
	r = rho*r(-1) + (1-rho)*0.5*( phi_pi*(pic_h+pic_f)+phi_dy*(y_h+y_f-y_h(-1)-y_f(-1)))+ r_shock;
 
 
	// International macroeconomics
	// Inflation consumption price 
	pic_h=pi_h+alpha_C*(ToT-ToT(-1));
	pic_f=pi_f-alpha_C*(ToT-ToT(-1));
	// Terms of trades 
	ToT = pi_f-pi_h+ToT(-1);
	// Net foreign assets
	Css*(b_h-b_h(-1))=		  Css*(Rss-1)*b_h(-1)	
							+ Css*alpha_C*( c_f - c_h + (2*mu*(1-alpha_C)-1)*ToT )
							+ Iss*alpha_I*( i_f - i_h + (2*mu*(1-alpha_I)-1)*ToT );	
	// Current account
	Css*CA = 	  Css*(b_h-b_h(-1)) 
				+ Lss*alpha_L*( ld_f - ld_f(-1) + pic_f(+1) - pic_h(+1) - (ld_h - ld_h(-1)) +  (2*nu*(1-alpha_L))*(r_L_f+pic_f(+1)-r_L_h-pic_h(+1)-(r_L_f(-1)+pic_f-r_L_h(-1)-pic_h) ) )
				+ IBss*alpha_IB*( IBd_f - IBd_f(-1) + pic_f(+1) - pic_h(+1) - (IBd_h - IBd_h(-1)) +  (2*xi*(1-alpha_IB))*(r_IB_f+pic_f(+1)-r_IB_h-pic_h(+1)-(r_IB_f(-1)+pic_f-r_IB_h(-1)-pic_h) )) ;
            
   
    // Euro area variables
    y_ea = .5*y_h + .5*y_f;			% output
    c_ea = .5*c_h + .5*c_f;			% consumption
    pi_ea = .5*pi_h + .5*pi_f;		% inflation
    i_ea = .5*i_h + .5*i_f;			% investment
    ls_ea = .5*ls_h + .5*ls_f;		% loan supply
    IB_ea = .5*IBs_h + .5*IBs_f;	% interbank supply
    
    // Exogenous shocks - core
	a_h = rho_a_h*a_h(-1) + e_a_h + e_a;
	g_h = rho_g_h*g_h(-1) + e_g_h + rho_ag_h*(e_a_h) + e_g;
	beta_shock_h = rho_beta_h*beta_shock_h(-1) + e_beta_h + e_beta;
	n_shock_h = rho_n_h*n_shock_h(-1) + e_n_h + e_n;
	q_shock_h = rho_q_h*q_shock_h(-1) + e_q_h + e_q;
	rL_shock_h = rho_L_h*rL_shock_h(-1) + e_rL_h + e_rL;
	w_shock_h = rho_W_h*w_shock_h(-1) + e_w_h - u_W_h*e_w_h(-1) + e_w;
	ib_shock_h = rho_B_h*ib_shock_h(-1) + e_ib_h + e_ib;
	// Exogenous shocks - periphery
	a_f = rho_a_f*a_f(-1) + e_a_f + e_a;
	g_f = rho_g_f*g_f(-1) + e_g_f + rho_ag_f*(e_a_f) + e_g;
	beta_shock_f = rho_beta_f*beta_shock_f(-1) + e_beta_f  + e_beta;
	n_shock_f = rho_n_f*n_shock_f(-1) + e_n_f + e_n;
	q_shock_f = rho_q_f*q_shock_f(-1) + e_q_f + e_q;
	rL_shock_f = rho_L_f*rL_shock_f(-1) + e_rL_f + e_rL;
	w_shock_f = rho_W_f*w_shock_f(-1) + e_w_f - u_W_f*e_w_f(-1) + e_w;
	ib_shock_f = rho_B_f*ib_shock_f(-1) + e_ib_f + e_ib;
	// Exogenous shocks - ECB rate
    r_shock = rho_R*r_shock(-1) + e_r;
end;

%----------------------------------------------------------------
// 4. Computation
%----------------------------------------------------------------

check;

// steady;

shocks;
var e_a_h;  stderr .88;
//var e_a_f;  stderr .76;
//var e_g_h;  stderr 1.64;
//var e_g_f;  stderr 1.66;
//var e_beta_h;  stderr 1.59;
//var e_beta_f;  stderr 2.12;
var e_n_h;  stderr 0.14;
//var e_n_f;  stderr 0.15;
//var e_n;  stderr 0.14;
//var e_q_h;  stderr 0.46;
//var e_q_f;  stderr 0.42;
//var e_q;  stderr 0.82;
var e_ib_h;  stderr 2.28;
//var e_ib_f;  stderr 2.43;
//var e_ib;  stderr 0.08;
//var e_w_h;  stderr 0.92;
//var e_w_f;  stderr 1.65;
//var e_r;  stderr .09;

end;

//stoch_simul(order=1,irf=24) y_h y_f c_h c_f pic_h pic_f r y_ea ;
stoch_simul(order=1,irf=24, noprint, nograph);