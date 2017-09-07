//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
//**************************************************************************

// Model: NK_GK13, created by Peter Karadi

// Model replication coded by:  Sören Karau (Soerenkarau@web.de)
//                              Arne Vogler (Arne.Vogler@web.de)

// Last edited: March 2016

// Reference:
// Gertler, M. and Karadi, P. 'QE 1 vs. 2 vs. 3...: A Framework for 
// Analyzing Large-Scale Asset Purchases as a Monetary Policy Tool'
// In: International Journal of Central Banking (2013)
//**************************************************************************









//--------------------------------------------------------------------------
// 1. Defining variables
//--------------------------------------------------------------------------

var
    Ym Y D K Keff L I C G Q varrho Lambda Z Ne Nn Rk Rb R qn mu_s mu_b nu
    phi x Omega Pm X F H ir ib prem_K prem_B w qn_rf iir prem_ib rb q qB N Kb
    Bb Dep Nbook phibook Kbook Qfair Qbook qnbook Kh Bh irstar Welf a ksi g
    shock_ir infl inflstar psi Gamma shock_psi shock_Gamma QKg_Y qBg_Y QKg_A 
    qBg_A zlb e_zlb1 e_zlb2 e_zlb3 e_zlb4;

varexo 
    e_a e_ksi e_g e_Ne e_ir e_psi e_Gamma e_zlb;

parameters
    betta sig hh varphi zetta theta Delta alfa delta G_over_Y 
    eta_i Psi Sigma kappa_s kappa_b switch_Kh_bar epsilon gam gam_P kappa_pi
    kappa_pi_ex kappa_y rho_ir rho_ir_DSGE rho_ir_QE2 rho_ir_zlb 
    rho_ir_zlb_ex rho_ksi sigma_ksi rho_a sigma_a rho_g sigma_g 
    sigma_Ne sigma_ir sigma_ir_ZLB rho1_shock_psi rho2_shock_psi 
    ma1_shock_psi ma2_shock_psi sigma_psi rho1_shock_Gamma rho2_shock_Gamma
    ma1_shock_Gamma ma2_shock_Gamma sigma_Gamma rho_shock_ir nu_K nu_B
    rho_psi rho_Gamma tau w_book
    omega lambda chi B Kh_bar Bh_bar b delta_c Xi Rk_ss RkmR_ss RbmR_ss 
    Ym_ss Y_ss D_ss K_ss Keff_ss L_ss I_ss C_ss G_ss Q_ss varrho_ss Lambda_ss
    Z_ss Ne_ss Nn_ss     Rb_ss R_ss qn_ss mu_s_ss mu_b_ss nu_ss phi_ss x_ss
    Omega_ss Pm_ss X_ss F_ss H_ss ir_ss ib_ss prem_K_ss prem_B_ss w_ss qn_rf_ss
    iir_ss prem_ib_ss rb_ss q_ss qB_ss N_ss Kb_ss Bb_ss Dep_ss Nbook_ss 
    phibook_ss Kbook_ss Qfair_ss Qbook_ss qnbook_ss Kh_ss Bh_ss irstar_ss 
    Welf_ss a_ss ksi_ss g_ss shock_ir_ss infl_ss inflstar_ss psi_ss Gamma_ss
    shock_psi_ss shock_Gamma_ss QKg_Y_ss qBg_Y_ss QKg_A_ss qBg_A_ss zlb_ss;




//--------------------------------------------------------------------------
// 2. Calibration
//--------------------------------------------------------------------------

//  parameters:
    betta=0.99500000;
    sig=1.00000000;
    hh=0.81500000;
    varphi=0.27600000;
    zetta=7.20000000;
    theta=0.97155955;
    Delta=0.50000000;
    alfa=0.33000000;
    delta=0.02500000;
    G_over_Y=0.20000000;
    eta_i=1.72800000;
    Psi=0.50000000;
    Sigma=0.75000000;
    kappa_s=1.00000000;
    kappa_b=1.00000000;
    switch_Kh_bar=0.00000000;
    epsilon=4.16700000;
    gam=0.77900000;
    gam_P=0.00000000;
    kappa_pi=1.50000000;
    kappa_pi_ex=1.50000000;
    kappa_y=-0.12500000;
    rho_ir=0.00000000;
    rho_ir_DSGE=0.00000000;
    rho_ir_QE2=0.00000000;
    rho_ir_zlb=0.00000000;
    rho_ir_zlb_ex=0.00000000;
    rho_ksi=0.70000000;
    sigma_ksi=0.04000000;
    rho_a=0.95000000;
    sigma_a=0.01000000;
    rho_g=0.95000000;
    sigma_g=0.01000000;
    sigma_Ne=0.30000000;
    sigma_ir=0.00250000;
    sigma_ir_ZLB=0.00100000;
    rho1_shock_psi=1.50000000;
    rho2_shock_psi=-0.55000000;
    ma1_shock_psi=0.00000000;
    ma2_shock_psi=0.00000000;
    sigma_psi=0.00758333;
    rho1_shock_Gamma=1.50000000;
    rho2_shock_Gamma=-0.55000000;
    ma1_shock_Gamma=0.00000000;
    ma2_shock_Gamma=0.00000000;
    sigma_Gamma=0.03159722;
    rho_shock_ir=0.00000000;
    nu_K=0.00000000;
    nu_B=0.00000000;
    rho_psi=0.00000000;
    rho_Gamma=0.00000000;
    tau=0.00100000;
    w_book=0.75000000;
    omega=0.00072872;
    lambda=0.34530233;
    omega=0.00072872;
    lambda=0.34530233;

//  SS values:
    a_ss=0;
    ksi_ss=0;
    ksi_ss=0;
    g_ss=0;
    shock_ir_ss=0;
    psi_ss=0;
    Gamma_ss=0;
    shock_psi_ss=0;
    shock_Gamma_ss=0;
    inflstarf=0;
    QKg_Y_ss=0;
    qBg_Y_ss=0;
    QKg_A_ss=0;
    qBg_A_ss=0;
    zlb_ss=0;
    L_ss = log(0.333333333333333);
    phi_ss	=	log(5.31250000);
    RkmR_ss	=	0.002484411292921;
    x_ss = log(0.12);
    Q_ss    =   log(1);  
	Qfair_ss=	log(1);	
	Qbook_ss=	log(1);	
	Pm_ss	=	log((epsilon-1)/epsilon);	
	X_ss	=	log(1/exp(Pm_ss));	
	D_ss	=	log(1);		
	Lambda_ss	=	log(1);	
	R_ss	=	log(1/betta);	
	Rk_ss	=	RkmR_ss+R_ss;
	K_ss	=	log(((exp(Rk_ss)-(1-delta))/(exp(Pm_ss)*alfa))^(1/(alfa-1))*exp(L_ss));	
	Y_ss	=	log(exp(K_ss)^alfa*exp(L_ss)^(1-alfa));	
	Ym_ss	=	Y_ss;	
	I_ss	=	log(delta*exp(K_ss));	
	G_ss	=	log(G_over_Y*exp(Y_ss));	
	C_ss	=	log(exp(Y_ss)-exp(I_ss)-exp(G_ss));	
	varrho_ss	=	log((1-betta*hh)*((1-hh)*exp(C_ss))^(-sig));	
	Rb_ss	=	Delta*Rk_ss+(1-Delta)*R_ss;	
	RbmR_ss	=	Rb_ss-R_ss;	
	Xi  	=	exp(Rb_ss)-1;	
	ib_ss	=	log(Xi+1);	
	rb_ss	=	log(Xi+1);	
	qn_ss	=	log(Xi/(exp(Rb_ss)-1));	
	qnbook_ss	=	qn_ss;	
	q_ss	=	qn_ss;	
	w_ss	=	log(exp(Pm_ss)*(1-alfa)*exp(Y_ss)/exp(L_ss));	
	Z_ss	=	log(exp(Pm_ss)*alfa*exp(Y_ss)/exp(K_ss));	
    chi  	=	(exp(Pm_ss)*(1-alfa)*exp(Y_ss)/exp(L_ss))/(1/exp(varrho_ss)*exp(L_ss)^varphi);	
    Welf_ss	=	(log((1-hh)*exp(C_ss))-chi*exp(L_ss)^(1+varphi)/(1+varphi))/(1-betta);	
	F_ss	=	log(exp(Y_ss)*exp(Pm_ss)/(1-betta*gam));	
	H_ss	=	log(exp(Y_ss)/(1-betta*gam));	
	infl_ss	=	0;	
	inflstar_ss	=	0;	
	ir_ss	=	R_ss;
    irstar_ss = ir_ss;	
	iir_ss	=	ir_ss;	
	qn_rf_ss	=	log(Xi/(exp(ir_ss)-1));	
    b       =	exp(Pm_ss)*alfa*exp(Y_ss)/exp(K_ss);	
    delta_c	=	delta-b/(1+zetta);	
	B       =	exp(x_ss)*(1-Psi)*exp(K_ss)/(1-Sigma);	
	Omega_ss	=	log((1-theta)/(1-theta-theta*betta*RkmR_ss*(1+Delta*exp(x_ss))*exp(phi_ss)));	
	mu_s_ss	=	log(betta*exp(Omega_ss)*RkmR_ss);	
	mu_b_ss	=	log(betta*exp(Omega_ss)*RbmR_ss);	
	nu_ss	=	log(betta*exp(Omega_ss)*exp(R_ss));	
    N_ss	=	log(omega*(exp(K_ss)+exp(qn_ss)*B)/(1-theta*(RkmR_ss*exp(phi_ss)+RbmR_ss*exp(phi_ss)*exp(x_ss)+exp(R_ss))));	
    Ne_ss	=	log(theta*(RkmR_ss*exp(phi_ss)+RbmR_ss*exp(phi_ss)*exp(x_ss)+exp(R_ss))*exp(N_ss));	
	Nn_ss	=	log(omega*(exp(K_ss)+exp(qn_ss)*B));	
	qB_ss	=	log(exp(q_ss)*B);	
	Kh_bar	=	exp(K_ss)*Psi-kappa_s*betta*(exp(Rk_ss)-exp(R_ss));	
	Bh_bar	=	B*Sigma-kappa_b*Delta*betta*(exp(Rk_ss)-exp(R_ss));	
	Kb_ss	=	log(exp(K_ss)-Kh_bar-kappa_s*betta*(exp(Rk_ss)-exp(R_ss)));	
	Bb_ss	=	log(B-Bh_bar-kappa_b*Delta*betta*(exp(Rk_ss)-exp(R_ss)));	
	Kh_ss	=	log(exp(K_ss)-exp(Kb_ss));	
	Bh_ss	=	log(B-exp(Bb_ss));	
    Dep_ss	=	log(exp(Kb_ss)+exp(Bb_ss)-exp(N_ss));	
	Nbook_ss	=	N_ss;	
	phibook_ss	=	log(exp(Dep_ss)/exp(Nbook_ss));	
	Kbook_ss	=	K_ss;	
	Keff_ss 	=	K_ss;	
	prem_K_ss	=	log(exp(Rk_ss)/exp(R_ss));	
	prem_B_ss	=	log(exp(Rb_ss)/exp(R_ss));	
	prem_ib_ss	=	log(exp(ib_ss)/exp(iir_ss));	





//--------------------------------------------------------------------------
// 3. Model
//--------------------------------------------------------------------------

model;

    //Household
    //1. Marginal utility of consumption
    C*((sig*exp(C_ss))/(exp(C_ss) - hh*exp(C_ss))^(sig + 1) + (betta*hh^2*sig*exp(C_ss))/(exp(C_ss) - hh*exp(C_ss))^(sig + 1)) + varrho*exp(varrho_ss) - (C(-1)*hh*sig*exp(C_ss))/(exp(C_ss) - hh*exp(C_ss))^(sig + 1) - (C(+1)*betta*hh*sig*exp(C_ss))/(exp(C_ss) - hh*exp(C_ss))^(sig + 1)=0;

    //2. Euler equation
    R*betta*exp(R_ss) - betta*varrho*exp(R_ss) + betta*varrho(+1)*exp(R_ss)=0;

    //3. Stochastic discount rate
    varrho(-1) - varrho + Lambda*exp(Lambda_ss)=0;

    //4. Labor market equilibrium
    L*(chi*varphi*exp(L_ss)*exp(L_ss)^(varphi - 1) - (exp(Pm_ss)*exp(Y_ss)*exp(varrho_ss)*(alfa - 1))/exp(L_ss)) + (Pm*exp(Pm_ss)*exp(Y_ss)*exp(varrho_ss)*(alfa - 1))/exp(L_ss) + (Y*exp(Pm_ss)*exp(Y_ss)*exp(varrho_ss)*(alfa - 1))/exp(L_ss) + (varrho*exp(Pm_ss)*exp(Y_ss)*exp(varrho_ss)*(alfa - 1))/exp(L_ss)=0;

    //Financial Intermediaries
    //5. Excess value of a unit of assets relative to deposits
    mu_s*exp(mu_s_ss) - betta*varrho*(exp(R_ss) - (exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/exp(Q_ss))*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) + betta*varrho(+1)*(exp(R_ss) - (exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/exp(Q_ss))*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) + R*betta*exp(R_ss)*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) + Q(+1)*betta*exp(ksi_ss)*(delta - 1)*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) + betta*mu_s(+1)*theta*(exp(R_ss) - (exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/exp(Q_ss))*((exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss)) + (exp(2*mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))^2) + betta*nu(+1)*theta*(exp(R_ss) - (exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/exp(Q_ss))*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - (Z(+1)*betta*exp(Z_ss)*exp(ksi_ss)*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1))/exp(Q_ss) + (Q*betta*exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1))*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1))/exp(Q_ss) - (betta*ksi(+1)*exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1))*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1))/exp(Q_ss)=0;

    //6. Excess value of a unit of long term government bonds relative to deposits
    mu_b*exp(mu_b_ss) - betta*varrho*(exp(R_ss) - (Xi + exp(qn_ss))/(exp(infl_ss)*exp(qn_ss)))*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) + betta*varrho(+1)*(exp(R_ss) - (Xi + exp(qn_ss))/(exp(infl_ss)*exp(qn_ss)))*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) + R*betta*exp(R_ss)*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) - (betta*qn(+1)*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1))/exp(infl_ss) + betta*mu_s(+1)*theta*(exp(R_ss) - (Xi + exp(qn_ss))/(exp(infl_ss)*exp(qn_ss)))*((exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss)) + (exp(2*mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))^2) + betta*nu(+1)*theta*(exp(R_ss) - (Xi + exp(qn_ss))/(exp(infl_ss)*exp(qn_ss)))*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) + (betta*infl(+1)*(Xi + exp(qn_ss))*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1))/(exp(infl_ss)*exp(qn_ss)) + (betta*qn*(Xi + exp(qn_ss))*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1))/(exp(infl_ss)*exp(qn_ss))=0;

    //7. Value of intermediary's net worth
    nu*exp(nu_ss) - R*betta*exp(R_ss)*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) + betta*varrho*exp(R_ss)*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) - betta*varrho(+1)*exp(R_ss)*(theta*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))) - theta + 1) - betta*mu_s(+1)*theta*exp(R_ss)*((exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss)) + (exp(2*mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss))^2) - betta*nu(+1)*theta*exp(R_ss)*(exp(nu_ss) + (exp(mu_s_ss)*exp(nu_ss))/(lambda - exp(mu_s_ss)))=0;

    //8. Indifference condition between capital and government bond excess returns
    Delta*mu_s*exp(mu_s_ss) - mu_b*exp(mu_b_ss)=0;

    //9. Expected shadow value of a unit of wealth
    Omega*exp(Omega_ss) - nu*theta*exp(nu_ss) + psi*theta*exp(mu_s_ss)*exp(phi_ss)*(Delta*exp(x_ss) + 1) + mu_s*theta*exp(mu_s_ss)*exp(phi_ss)*(psi_ss - 1)*(Delta*exp(x_ss) + 1) + phi*theta*exp(mu_s_ss)*exp(phi_ss)*(psi_ss - 1)*(Delta*exp(x_ss) + 1) + Delta*theta*x*exp(mu_s_ss)*exp(phi_ss)*exp(x_ss)*(psi_ss - 1)=0;

    //10. Proportion of value of government bonds relative to capital value within banks
    x*exp(x_ss) - (Bb*exp(Bb_ss)*exp(qn_ss))/(exp(Kb_ss)*exp(Q_ss)) + (Kb*exp(Bb_ss)*exp(qn_ss))/(exp(Kb_ss)*exp(Q_ss)) + (Q*exp(Bb_ss)*exp(qn_ss))/(exp(Kb_ss)*exp(Q_ss)) - (qn*exp(Bb_ss)*exp(qn_ss))/(exp(Kb_ss)*exp(Q_ss))=0;

    //11. Optimal 'capital' leverage
    phi*exp(phi_ss) + (nu*exp(nu_ss))/((psi_ss - 1)*(Delta*exp(x_ss) + 1)*(lambda - exp(mu_s_ss))) - (psi*exp(nu_ss))/((psi_ss - 1)^2*(Delta*exp(x_ss) + 1)*(lambda - exp(mu_s_ss))) + (mu_s*exp(mu_s_ss)*exp(nu_ss))/((psi_ss - 1)*(Delta*exp(x_ss) + 1)*(lambda - exp(mu_s_ss))^2) - (Delta*x*exp(nu_ss)*exp(x_ss))/((psi_ss - 1)*(Delta*exp(x_ss) + 1)^2*(lambda - exp(mu_s_ss)))=0;

    //Aggregate capital, net worth
    //12. Aggregate capital
    Kb*exp(Kb_ss)*exp(Q_ss) + Q*exp(Kb_ss)*exp(Q_ss) + psi*exp(N_ss)*exp(phi_ss) + N*exp(N_ss)*exp(phi_ss)*(psi_ss - 1) + phi*exp(N_ss)*exp(phi_ss)*(psi_ss - 1)=0;

    //13. Financial intermediaries' net worth
    N*exp(N_ss) - Ne*exp(Ne_ss) - Nn*exp(Nn_ss)=0;

    //14. Existing banks' net worth accumulation
    Ne*exp(Ne_ss) - (N(-1)*theta*exp(N_ss)*(exp(R_ss) + exp(phi_ss)*(exp(R_ss) - exp(Rk_ss))*(psi_ss - 1)*(Delta*exp(x_ss) + 1)))/exp(e_Ne) + (e_Ne*theta*exp(N_ss)*(exp(R_ss) + exp(phi_ss)*(exp(R_ss) - exp(Rk_ss))*(psi_ss - 1)*(Delta*exp(x_ss) + 1)))/exp(e_Ne) - (R(-1)*theta*exp(N_ss)*(exp(R_ss) + exp(R_ss)*exp(phi_ss)*(psi_ss - 1)*(Delta*exp(x_ss) + 1)))/exp(e_Ne) - (psi(-1)*theta*exp(N_ss)*exp(phi_ss)*(exp(R_ss) - exp(Rk_ss))*(Delta*exp(x_ss) + 1))/exp(e_Ne) + (Rk*theta*exp(N_ss)*exp(Rk_ss)*exp(phi_ss)*(psi_ss - 1)*(Delta*exp(x_ss) + 1))/exp(e_Ne) - (phi(-1)*theta*exp(N_ss)*exp(phi_ss)*(exp(R_ss) - exp(Rk_ss))*(psi_ss - 1)*(Delta*exp(x_ss) + 1))/exp(e_Ne) - (Delta*theta*x(-1)*exp(N_ss)*exp(phi_ss)*exp(x_ss)*(exp(R_ss) - exp(Rk_ss))*(psi_ss - 1))/exp(e_Ne)=0;

    //15. New banks' net worth
    Nn*exp(Nn_ss)=0;

    //Intermediate goods producer
    //16. Marginal value product of effective capital
    Z*exp(Z_ss) + (K(-1)*alfa*exp(Pm_ss)*exp(Ym_ss))/(exp(K_ss)*exp(ksi_ss)) - (Pm*alfa*exp(Pm_ss)*exp(Ym_ss))/(exp(K_ss)*exp(ksi_ss)) - (Ym*alfa*exp(Pm_ss)*exp(Ym_ss))/(exp(K_ss)*exp(ksi_ss)) + (alfa*ksi*exp(Pm_ss)*exp(Ym_ss))/(exp(K_ss)*exp(ksi_ss))=0;

    //17. Return to capital
    Rk*exp(Rk_ss) + Q*exp(ksi_ss)*(delta - 1) - (Z*exp(Z_ss)*exp(ksi_ss))/exp(Q_ss) + (Q(-1)*exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/exp(Q_ss) - (ksi*exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/exp(Q_ss)=0;

    //18. Long term government bond return
    Rb*exp(Rb_ss) - qn/exp(infl_ss) + (infl*(Xi + exp(qn_ss)))/(exp(infl_ss)*exp(qn_ss)) + (qn(-1)*(Xi + exp(qn_ss)))/(exp(infl_ss)*exp(qn_ss))=0;

    //19. Nominal yield to maturity
    ib*exp(ib_ss) + (Xi*qn)/exp(qn_ss)=0;

    //20. Intermediate good production function
    Ym*exp(Ym_ss) - a*exp(a_ss)*exp(L_ss)^(1 - alfa)*(exp(K_ss)*exp(ksi_ss))^alfa + (L*exp(L_ss)*exp(a_ss)*(alfa - 1)*(exp(K_ss)*exp(ksi_ss))^alfa)/exp(L_ss)^alfa - K(-1)*alfa*exp(K_ss)*exp(a_ss)*exp(ksi_ss)*exp(L_ss)^(1 - alfa)*(exp(K_ss)*exp(ksi_ss))^(alfa - 1) - alfa*ksi*exp(K_ss)*exp(a_ss)*exp(ksi_ss)*exp(L_ss)^(1 - alfa)*(exp(K_ss)*exp(ksi_ss))^(alfa - 1)=0;

    //Capital Goods Producer
    //21. Optimal net investment decision
    I(-1)*eta_i + Q*exp(Q_ss) - I*(eta_i + betta*eta_i) + I(+1)*betta*eta_i=0;

    //22. Capital accumulation equation
    K*exp(K_ss) - I*exp(I_ss) + ksi*exp(K_ss)*exp(ksi_ss)*(delta - 1) + K(-1)*exp(K_ss)*exp(ksi_ss)*(delta - 1)=0;

    //Final goods producer
    //23. Wholesale, retail output
    Ym*exp(Ym_ss) - D*exp(D_ss)*exp(Y_ss) - Y*exp(D_ss)*exp(Y_ss)=0;

    //24. Price dispersion
    D*exp(D_ss) + infl*((epsilon*gam*exp(infl_ss)*exp(infl_ss)^(gam - 2)*(((gam*exp(infl_ss)^(gam - 1))/exp(infl_ss)^(gam_P*(gam - 1)) - 1)/(gam - 1))^(epsilon/(gam - 1) - 1))/exp(infl_ss)^(gam_P*(gam - 1)) - (epsilon*gam*exp(D_ss)*exp(infl_ss)*exp(infl_ss)^(epsilon - 1))/exp(infl_ss)^(epsilon*gam_P)) + infl(-1)*((epsilon*gam*gam_P*exp(D_ss)*exp(infl_ss)*exp(infl_ss)^epsilon)/exp(infl_ss)^(epsilon*gam_P + 1) - (epsilon*gam*gam_P*exp(infl_ss)*exp(infl_ss)^(gam - 1)*(((gam*exp(infl_ss)^(gam - 1))/exp(infl_ss)^(gam_P*(gam - 1)) - 1)/(gam - 1))^(epsilon/(gam - 1) - 1))/exp(infl_ss)^(gam_P*(gam - 1) + 1)) - (D(-1)*gam*exp(D_ss)*exp(infl_ss)^epsilon)/exp(infl_ss)^(epsilon*gam_P)=0;

    //25. Markup
    X*exp(X_ss) + Pm/exp(Pm_ss)=0;

    //26. Optimal price choice
    F*exp(F_ss) - Pm*exp(Pm_ss)*exp(Y_ss) - Y*exp(Pm_ss)*exp(Y_ss) - (F(+1)*betta*gam*exp(F_ss)*exp(infl_ss)^epsilon)/exp(infl_ss)^(epsilon*gam_P) + (betta*gam*varrho*exp(F_ss)*exp(infl_ss)^epsilon)/exp(infl_ss)^(epsilon*gam_P) - (betta*gam*varrho(+1)*exp(F_ss)*exp(infl_ss)^epsilon)/exp(infl_ss)^(epsilon*gam_P) - (betta*epsilon*gam*infl(+1)*exp(F_ss)*exp(infl_ss)*exp(infl_ss)^(epsilon - 1))/exp(infl_ss)^(epsilon*gam_P) + (betta*epsilon*gam*gam_P*infl*exp(F_ss)*exp(infl_ss)*exp(infl_ss)^epsilon)/exp(infl_ss)^(epsilon*gam_P + 1)=0;

    //27.
    H*exp(H_ss) - Y*exp(Y_ss) - (H(+1)*betta*gam*exp(H_ss)*exp(infl_ss)^(epsilon - 1))/exp(infl_ss)^(gam_P*(epsilon - 1)) + (betta*gam*varrho*exp(H_ss)*exp(infl_ss)^(epsilon - 1))/exp(infl_ss)^(gam_P*(epsilon - 1)) - (betta*gam*varrho(+1)*exp(H_ss)*exp(infl_ss)^(epsilon - 1))/exp(infl_ss)^(gam_P*(epsilon - 1)) - (betta*gam*infl(+1)*exp(H_ss)*exp(infl_ss)*exp(infl_ss)^(epsilon - 2)*(epsilon - 1))/exp(infl_ss)^(gam_P*(epsilon - 1)) + (betta*gam*gam_P*infl*exp(H_ss)*exp(infl_ss)*exp(infl_ss)^(epsilon - 1)*(epsilon - 1))/exp(infl_ss)^(gam_P*(epsilon - 1) + 1)=0;

    //28. Optimal price choice
    inflstar*exp(inflstar_ss) - (F*epsilon*exp(F_ss)*exp(infl_ss))/(exp(H_ss)*(epsilon - 1)) + (H*epsilon*exp(F_ss)*exp(infl_ss))/(exp(H_ss)*(epsilon - 1)) - (epsilon*infl*exp(F_ss)*exp(infl_ss))/(exp(H_ss)*(epsilon - 1))=0;

    //29. Price index
    (gam*gam_P*infl(-1)*exp(infl_ss)*(epsilon - 1))/exp(infl_ss)^(gam_P*(epsilon - 1) + 1) - (inflstar*exp(inflstar_ss)*(epsilon - 1)*(gam - 1))/exp(inflstar_ss)^epsilon - (infl*exp(infl_ss)*(epsilon - 1))/exp(infl_ss)^epsilon=0;

    //30. Fisher equation
    ir*exp(ir_ss) - R*exp(R_ss)*exp(infl_ss) - infl(+1)*exp(R_ss)*exp(infl_ss)=0;

    //Government
    //31. Government consumption
    G*exp(G_ss) - g*exp(G_ss)*exp(g_ss)=0;

    //32. Interest rate rule
    ir = zlb*(0)+(1-zlb)*irstar;

    //33. Credit policy rule
    psi - shock_psi - psi(-1)*rho_psi - R*nu_K*(rho_psi - 1) + Rk(+1)*nu_K*(rho_psi - 1)=0;

    //34. Bond policy rule
    Gamma - shock_Gamma - Gamma(-1)*rho_Gamma - R*nu_B*(rho_Gamma - 1) + Rb(+1)*nu_B*(rho_Gamma - 1)=0;

    //Equilibrium
    //35. Aggregate resource constraint
    Y*exp(Y_ss) - G*exp(G_ss) - I*exp(I_ss) - C*exp(C_ss) - psi*tau*exp(K_ss) - K*psi_ss*tau*exp(K_ss)=0;

    //Shocks
    //36. TFP shock
    a + e_a - a(-1)*rho_a=0;

    //37. Capital quality shock
    e_ksi + ksi - ksi(-1)*rho_ksi=0;

    //38. Government consumption shock
    e_g + g - g(-1)*rho_g=0;

    //39. Credit policy shock
    shock_psi - e_psi - rho1_shock_psi*shock_psi(-1) - rho2_shock_psi*shock_psi(-2)=0;

    //40. Bond policy shock
    shock_Gamma - e_Gamma - rho1_shock_Gamma*shock_Gamma(-1) - rho2_shock_Gamma*shock_Gamma(-2)=0;

    //41. Monetary policy shock
    shock_ir - e_ir - rho_shock_ir*shock_ir(-1)=0;

    //Some extra variables for convenience
    //42. Effective capital
    Keff*exp(Keff_ss) - K(-1)*exp(K_ss)*exp(ksi_ss) - ksi*exp(K_ss)*exp(ksi_ss)=0;

    //43. Wages
    w*exp(w_ss) - (L*exp(Pm_ss)*exp(Y_ss)*(alfa - 1))/exp(L_ss) + (Pm*exp(Pm_ss)*exp(Y_ss)*(alfa - 1))/exp(L_ss) + (Y*exp(Pm_ss)*exp(Y_ss)*(alfa - 1))/exp(L_ss)=0;

    //44. Welfare
    Welf - Welf(+1)*betta - (C*exp(C_ss))/(exp(C_ss) - hh*exp(C_ss)) + L*chi*exp(L_ss)*exp(L_ss)^varphi + (C(-1)*hh*exp(C_ss))/(exp(C_ss) - hh*exp(C_ss))=0;

    //45. Premium
    prem_K*exp(prem_K_ss) + (Q(+1)*exp(ksi_ss)*(delta - 1))/exp(R_ss) - (Z(+1)*exp(Z_ss)*exp(ksi_ss))/(exp(Q_ss)*exp(R_ss)) + (Q*exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/(exp(Q_ss)*exp(R_ss)) + (R*exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/(exp(Q_ss)*exp(R_ss)) - (ksi(+1)*exp(ksi_ss)*(exp(Z_ss) - exp(Q_ss)*(delta - 1)))/(exp(Q_ss)*exp(R_ss))=0;

    //46. Term Premium
    prem_B*exp(prem_B_ss) - qn(+1)/(exp(R_ss)*exp(infl_ss)) + (R*(Xi + exp(qn_ss)))/(exp(R_ss)*exp(infl_ss)*exp(qn_ss)) + (infl(+1)*(Xi + exp(qn_ss)))/(exp(R_ss)*exp(infl_ss)*exp(qn_ss)) + (qn*(Xi + exp(qn_ss)))/(exp(R_ss)*exp(infl_ss)*exp(qn_ss))=0;

    //47. Bought capital value over GDP
    QKg_Y - (psi*exp(K_ss)*exp(Q_ss))/(4*exp(Y_ss)) - (K*psi_ss*exp(K_ss)*exp(Q_ss))/(4*exp(Y_ss)) - (Q*psi_ss*exp(K_ss)*exp(Q_ss))/(4*exp(Y_ss)) + (Y*psi_ss*exp(K_ss)*exp(Q_ss))/(4*exp(Y_ss))=0;

    //48. Bought bond value over GDP
    qBg_Y - (B*Gamma*exp(qn_ss))/(4*exp(Y_ss)) + (B*Gamma_ss*Y*exp(qn_ss))/(4*exp(Y_ss)) - (B*Gamma_ss*qn*exp(qn_ss))/(4*exp(Y_ss))=0;

    //49. Bought capital value over bank balance sheet
    QKg_A - K*((psi_ss*exp(K_ss)*exp(Q_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss)) - (psi_ss*exp(2*K_ss)*exp(2*Q_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss))^2) - Q*((psi_ss*exp(K_ss)*exp(Q_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss)) - (psi_ss*exp(2*K_ss)*exp(2*Q_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss))^2) - (psi*exp(K_ss)*exp(Q_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss)) + (B*psi_ss*qn*exp(K_ss)*exp(Q_ss)*exp(qn_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss))^2=0;

    //50. Bought bond value over GDP
    qBg_A + qn*((B^2*Gamma_ss*exp(2*qn_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss))^2 - (B*Gamma_ss*exp(qn_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss))) - (B*Gamma*exp(qn_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss)) + (B*Gamma_ss*K*exp(K_ss)*exp(Q_ss)*exp(qn_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss))^2 + (B*Gamma_ss*Q*exp(K_ss)*exp(Q_ss)*exp(qn_ss))/(B*exp(qn_ss) + exp(K_ss)*exp(Q_ss))^2=0;

    //51. Long term risk free government bond price
    qn_rf*exp(qn_rf_ss) + (ir*(Xi + exp(qn_rf_ss)))/exp(ir_ss) - (qn_rf(+1)*exp(qn_rf_ss))/exp(ir_ss)=0;

    //52. Risk free yield to maturity
    iir*exp(iir_ss) + (Xi*qn_rf)/exp(qn_rf_ss)=0;

    //53. Term premium
    prem_ib*exp(prem_ib_ss) - (ib*exp(ib_ss))/exp(iir_ss) + (iir*exp(ib_ss))/exp(iir_ss)=0;

    //54. Price of a real bond
    q*exp(q_ss) + (Rb*(Xi + exp(q_ss)))/exp(Rb_ss) - (q(+1)*exp(q_ss))/exp(Rb_ss)=0;

    //55. Real yield to maturity
    rb*exp(rb_ss) + (Xi*q)/exp(q_ss)=0;

    //56. Real value of goverment bonds
    qB*exp(qB_ss) - B*qn*exp(qn_ss)=0;

    //57. Financial Intermediaries' corporate bond holdings
    Kb*exp(Kb_ss) + psi*exp(K_ss) + K*exp(K_ss)*(psi_ss - 1) - R*betta*kappa_s*exp(R_ss) + Rk(+1)*betta*kappa_s*exp(Rk_ss) + betta*kappa_s*varrho*(exp(R_ss) - exp(Rk_ss)) - betta*kappa_s*varrho(+1)*(exp(R_ss) - exp(Rk_ss)) + Kh_bar*ksi*switch_Kh_bar*exp(ksi_ss)*exp(ksi_ss)^(switch_Kh_bar - 1)=0;

    //58. Financial Intermediaries' Long term Treasury holdings
    Bb*exp(Bb_ss) + B*Gamma + Delta*betta*kappa_b*varrho*(exp(R_ss) - exp(Rk_ss)) - Delta*betta*kappa_b*varrho(+1)*(exp(R_ss) - exp(Rk_ss)) - Delta*R*betta*kappa_b*exp(R_ss) + Delta*Rk(+1)*betta*kappa_b*exp(Rk_ss)=0;

    //59. HHs direct corporate bond holdings
    Kb*exp(Kb_ss) - K*exp(K_ss) + Kh*exp(Kh_ss)=0;

    //60. HHs direct long term Treasury holdings
    Bb*exp(Bb_ss) + Bh*exp(Bh_ss)=0;

    //61. Deposit
    Dep*exp(Dep_ss) + N*exp(N_ss) - Kb*exp(Kb_ss)*exp(Q_ss) - Q*exp(Kb_ss)*exp(Q_ss) - Bb*exp(Bb_ss)*exp(qn_ss) - qn*exp(Bb_ss)*exp(qn_ss)=0;

    //62. Book value of net worth
    Dep*exp(Dep_ss) - qn*(w_book*exp(Bb_ss)*exp(qn_ss) - exp(Bb_ss)*exp(qn_ss)*(w_book - 1)) - Bb*(w_book*exp(Bb_ss)*exp(qn_ss) - exp(Bb_ss)*exp(qn_ss)*(w_book - 1)) + Nbook*exp(Nbook_ss) + Kb*(exp(Kb_ss)*exp(Q_ss)*(w_book - 1) - (w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss)) + Q*exp(Kb_ss)*exp(Q_ss)*(w_book - 1) + (K*w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss) - (Kbook*w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss)=0;

    //63. Book value leverage
    phibook*exp(phibook_ss) - (Dep*exp(Dep_ss))/exp(Nbook_ss) + (Nbook*exp(Dep_ss))/exp(Nbook_ss)=0;

    //64. Book value of capital
    Kbook*exp(Kbook_ss) - I*exp(I_ss) + Kbook(-1)*exp(Kbook_ss)*(delta - 1)=0;

    //65. 'Fair' value of capital
    Qfair(+1)*(delta - 1) - (Z(+1)*exp(Z_ss))/exp(Qfair_ss) + (Qfair*(exp(Z_ss) - exp(Qfair_ss)*(delta - 1)))/exp(Qfair_ss)=0;

    //66. 'Book' value of capital
    Qbook*exp(Qbook_ss) - K*((w_book*exp(Kb_ss)*exp(Kbook_ss))/(exp(K_ss)*(exp(Kb_ss)*(w_book - 1) - (w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss))) - (w_book*exp(Kb_ss)*exp(Kbook_ss)*(exp(Kb_ss)*exp(Q_ss)*(w_book - 1) - (w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss)))/(exp(K_ss)*(exp(Kb_ss)*(w_book - 1) - (w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss))^2)) + Kbook*((w_book*exp(Kb_ss)*exp(Kbook_ss))/(exp(K_ss)*(exp(Kb_ss)*(w_book - 1) - (w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss))) - (w_book*exp(Kb_ss)*exp(Kbook_ss)*(exp(Kb_ss)*exp(Q_ss)*(w_book - 1) - (w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss)))/(exp(K_ss)*(exp(Kb_ss)*(w_book - 1) - (w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss))^2)) - (Q*exp(Kb_ss)*exp(Q_ss)*(w_book - 1))/(exp(Kb_ss)*(w_book - 1) - (w_book*exp(Kb_ss)*exp(Kbook_ss))/exp(K_ss))=0;

    //67. 'Book' value of long term government bonds
    qnbook*exp(qnbook_ss) + qn*exp(qn_ss)*(w_book - 1)=0;

    //Target interest rate
    irstar=rho_ir_zlb*ir(-1)+(1-rho_ir_zlb)*(kappa_pi*infl+kappa_y*X);

    //Indicator variable for the binding zero lower bound
    zlb=zlb(-1)+e_zlb-e_zlb4;

    // ZLB shocks as variables in recursive structure
    e_zlb1 = e_zlb(-1);
    e_zlb2 = e_zlb1(-1);
    e_zlb3 = e_zlb2(-1);
    e_zlb4 = e_zlb3(-1);

end;


initval;
    Ym=0;
    Y=0;
    D=0;
    K=0.00000000;
    Keff=0;
    L=0;
    I=0;
    C=0;
    G=0;
    Q=0;
    varrho=0;
    Lambda=0;
    Z=0;
    Ne=0;
    Nn=0;
    Rk=0;
    Rb=0;
    R=0;
    qn=0;
    mu_s=0;
    mu_b=0;
    nu=0;
    phi=0;
    x=0;
    Omega=0;
    Pm=0;
    X=0;
    F=0;
    H=0;
    ir=0;
    ib=0;
    prem_K=0;
    prem_B=0;
    w=0;
    qn_rf=0;
    iir=0;
    prem_ib=0;
    rb=0;
    q=0;
    qB=0;
    N=0;
    Kb=0;
    Bb=0;
    Dep=0;
    Nbook=0;
    phibook=0;
    Kbook=0;
    Qfair=0;
    Qbook=0;
    qnbook=0;
    Kh=0;
    Bh=0;
    irstar=0;
    Welf=0;
    a=0;
    ksi=0;
    g=0;
    shock_ir=0;
    infl=0;
    inflstar=0;
    psi=0;
    Gamma=0;
    shock_psi=0;
    shock_Gamma=0;
    QKg_Y=0;
    qBg_Y=0;
    QKg_A=0;
    qBg_A=0;
    zlb=0;
    e_a=0;
    e_ksi=0;
    e_g=0;
    e_Ne=0;
    e_ir=0;
    e_psi=0;
    e_Gamma=0;
    e_zlb=0;
    e_zlb1=0;
    e_zlb2=0;
    e_zlb3=0;
    e_zlb4=0;
end;

endval;
    Ym=0;
    Y=0;
    D=0;
    K=0;
    Keff=0;
    L=0;
    I=0;
    C=0;
    G=0;
    Q=0;
    varrho=0;
    Lambda=0;
    Z=0;
    Ne=0;
    Nn=0;
    Rk=0;
    Rb=0;
    R=0;
    qn=0;
    mu_s=0;
    mu_b=0;
    nu=0;
    phi=0;
    x=0;
    Omega=0;
    Pm=0;
    X=0;
    F=0;
    H=0;
    ir=0;
    ib=0;
    prem_K=0;
    prem_B=0;
    w=0;
    qn_rf=0;
    iir=0;
    prem_ib=0;
    rb=0;
    q=0;
    qB=0;
    N=0;
    Kb=0;
    Bb=0;
    Dep=0;
    Nbook=0;
    phibook=0;
    Kbook=0;
    Qfair=0;
    Qbook=0;
    qnbook=0;
    Kh=0;
    Bh=0;
    irstar=0;
    Welf=0;
    a=0;
    ksi=0;
    g=0;
    shock_ir=0;
    infl=0;
    inflstar=0;
    psi=0;
    Gamma=0;
    shock_psi=0;
    shock_Gamma=0;
    QKg_Y=0;
    qBg_Y=0;
    QKg_A=0;
    qBg_A=0;
    zlb=0;
    e_a=0;
    e_ksi=0;
    e_g=0;
    e_Ne=0;
    e_ir=0;
    e_psi=0;
    e_Gamma=0;
    e_zlb=0;
    e_zlb1=0;
    e_zlb2=0;
    e_zlb3=0;
    e_zlb4=0;
end;



//--------------------------------------------------------------------------
// 4. Computation
//--------------------------------------------------------------------------

shocks;
    var e_zlb;
    periods 1;
    values 1;
    var e_Gamma;
    periods 1;
    values 0.03159722;
end;
options_.slowc     =   1;
options_.maxit_     =   1000;
simul(periods=500);





