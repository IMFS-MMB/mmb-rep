// Model: US_PV15

// Further references:
// Poutineau, J. C., & Vermandel, G. (2015). Financial frictions and the extensive margin of activity.
// Research in Economics, 69(4), 525-554.

// Original code provided by Gauthier Vermandel 

// Edited by Lazar Milivojevic 27/02/2019

// The model with financial frictions
// Flexible counterpart of the model (necessary to produce the output gap) has been added 

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var uh uc w r rr pi v d de n ne mk mc Psi pic p c y yd h he hc z k i q u Phiu ku rK rL l nn s omega mcL eta w_sup w_inf mut_w wh pi_w mut_p mut_L
	s_a s_g s_b s_i s_l s_n s_p s_w s_e s_r	
	ln_yd ln_y ln_c ln_n ln_r ln_pi ln_i ln_ne ln_rL ln_l ln_p ln_v
	y_obs c_obs i_obs pi_obs r_obs w_obs h_obs ne_obs rL_obs l_obs
    uhn ucn wn rrn vn dn den nnn nen  mcn pn cn yn ydn hn hen hcn zn kn in qn un Phiun kun rKn rLn lnn nnnn sn omegan mcLn etan w_supn w_infn mut_wn whn pi_wn mut_Ln ln_yn;
varexo e_a e_g e_b e_i e_l e_n e_p e_w e_e e_r;

parameters	beta alpha delta mu sigmaL chi Fe kappa_P xi_P epsilon gy hh chi_I chi_E psi rho phi_pi phi_pic phi_y phi_dy
			L_QK R eta_d H RL sigmaC obsFactor theta gamma wmin ka TT phi N_K varkappa kappa_L mu_B mu_L mu_P mu_W kappa_W xi_W u_p u_w 
			rho_a rho_g rho_b rho_i rho_l rho_n rho_p rho_w rho_e rho_r rho_ag  mkn Psin rn pin picn mut_pn;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
% Paper calibrated in the parameter (see page 538)
beta 		= 0.992; 				% Discount Factor
delta 		= 0.025;				% Exit rate
epsilon 	= 3.8; 					% Substitution goods
mu			= epsilon/(epsilon-1);	% price markup
Fe 			= 5;					% Sunk costs
alpha 		= .4;					% share of capital in production
gy			= 0.18;					% Spending to gdp ratio
mu_W 		= 3/(3-1);				% Markup wage
N_K			= 0.5; 					% Net wealth to capital ratio
L_QK		= 0.5;					% Loan to capital ratio
eta_d 		= 0.02/4;				% Quarterly default rate (typo in the paper saying 2.5)
H 			= 1/3;					% Share of hours worked/day
theta 		= 0.04*100;				% Entrepreneurial dividend policy
gamma 		= 1;					% Share of the wage bill in advance
R			= 1/beta;				% ss riskless rate
RL			= (1+0.98/100)*R;		% ss credit rate

obsFactor	= 100; % = 100 when data are multiplied by, otherwise = 1

mkn=mu_P;   // for the RBC counterpart
Psin=0;
rn=R-1;
pin=1;
picn=1;
mut_pn=mu_P;

%%%%%%%%%%%%% Estimated Parameters %%%%%%%%%%%%%%%%%

% AR(1) root value
rho_a		= 0.989438995688241;
rho_g		= 0.964501329345530;
rho_b		= 0.866065054296960;
rho_i		= 0.992049882657876;
rho_l		= 0.844755249127079;
rho_n		= 0.950156585064000;
rho_p		= 0.633888649873990;
rho_w		= 0.992861418199060;
rho_e		= 0.427852388654990;
rho_r		= 0.479821648248877;
rho_ag		= 0.408305660498673;		% productivity in the spending shock
sigmaC 		= 1.412005386245682; 		% Elasticity of labor
sigmaL 		= 0.680598432322429; 		% Elasticity of labor
kappa_W  	= 57.815138488359928;
xi_W		= 0.147527509676122;		% Wage indexation
xi_P		= 0.256415364089944;		% Price indexation
u_p			= 0.353493870232101;		% ARMA price
u_w			= 0.880087358281597;		% ARMA wage
varkappa	= 0.212721156496507;		% external finance prem elasticity
kappa_L		= 13.105140377417609;		% credit rate adjustment cost	
mu_B 		= 0.074227073284695;		% Auditing cost 
kappa_P 	= 52.900789993278337;		% Price adjustment cost
hh			= 0.633600823023379;		% Consumption habits
chi_I		= 8.052744763552568;		% Investment cost
rho			= 0.874082619958901;		% MPR smoothing
phi_pi		= 1.442040888486226;		% MPR inflation
phi_pic		= 0;						% MPR inflation CPI (unused)
phi_dy		= 0.086084005670054;		% MPR output growth
phi_y		= 0.107573728902499;		% MPR output gap
psi			= 0.865371316948408;		% Utilization elasticity
chi_E 		= 0.911043517537755;		% Free entry cost

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

steady_state_model;
	q 		= 1;	%	Steady state Tobin's q normalized to one
	r 		= R-1;	%	nominal rate
	rr 		= r;	% 	real rate same as nominal with 0 inflation in ss
	h		= H;	% 	hours worked
	rL 		= RL-1; %	calibrated credit rate
	% threshold - eq B.35
	wmin 	= L_QK;	
	% shape pareto distribution - eq B.36
	ka		= 1/L_QK;
	% threshold - eq B.37
	omega 	= wmin*(1-eta_d)^(-1/ka);
	% capital rate of return - eq B.38
	rK 		= ((1+rL)/omega)*(1-L_QK)-1;	
	% marginal product capital - eq B.39
	z		= 1+rK -(1-delta);
	% surviving rate entreprneurs
	eta	= (wmin/omega)^ka;
	% mean of project above the threshold - eq B.40
	w_sup 	= (ka/(ka-1))*omega;
	% mean of project below the threshold - eq B.41
	w_inf 	= (1-eta*w_sup)/(1-eta);
	% marginal cost of loans - eq B.42
	mcL 	= ((1+r)/( (wmin/omega)^ka + (1-mu_B)*(1-(wmin/omega)^ka)*(ka/(ka-1))*(((omega^(1-ka))-(wmin^(1-ka)))/((omega^(-ka))-(wmin^(-ka))))/omega ) )-1;
	% credit rate bank markup - eq B.43 // typo in the paper
	mu_L	= rL/mcL;
	% price markup
	mu_P	= epsilon/(epsilon-1);
	% steady state amount of firms - eq B.48
	n		= h/( (1-beta*(1-delta))/((mu_P-1+theta/100*eta*omega*(1+rK)*q*alpha/((ka-1)*z))*beta*(1-delta))*Fe*(1+gamma*rL)*(1-alpha)+delta/(1-delta)*Fe);
	% relative price - eq B.49
	p 		= n^(1/(epsilon-1));
	% relative price - eq B.49
	mc 		= p/mu_P;
	% number of entrants - eq B.50
	ne 		= delta/(1-delta)*n;
	% labor demand entrants - eq B.51
	he 		= Fe*ne;
	% labor demand installed - eq B.51
	hc		= h-he;
	% real wage - eq B.52
	w 		= (1-alpha)*(mc*(alpha/z)^alpha)^(1/(1-alpha));
	% capital- eq B.53
	k 		= alpha/(1-alpha)*w*hc/z;
	y 		= k^alpha*hc^(1-alpha)/n;
	i 		= delta*k;
	yd 		= n*y*p^epsilon;
	c 		= yd*(1-gy) - i;
	d 		= y*p*(1-1/mu_P);
	uc 		= (c-hh*c)^-sigmaC;
	wh 		= w/mu_W;
	uh 		= uc*wh;
	chi 	= uh*h^-sigmaL;
	l		= L_QK*q*k;
	nn 		= (q*k+gamma*w*he-l);
	de		= ((wmin^ka)/(ka-1))*((omega^(1-ka))*(1+rK)*q*k/n);
	phi 	= w_sup^(1-(((1-N_K)/N_K*varkappa)/(((1-N_K)/N_K*varkappa)-1)));
	s 		= (1+rK)/(1+rL);
	TT 		= nn - (1-delta)*(1-theta/100)*de*n;
	v 		= beta*(1-delta)/(1-beta*(1-delta))*(d+theta/100*de);
	mut_w 	= mu_W;
	mut_p 	= mu_P;
	mut_L 	= mu_L;
	Psi		= 0;
	mk 		= mu_P;
	pi 		= 1;
	pic 	= 1;
	u 		= 1;
	Phiu 	= 0;
	ku 		= k;
	pi_w 	= 1;
	s_a 	= 0;
	s_g 	= 0;
	s_b 	= 0;
	s_i 	= 0;
	s_l 	= 0;
	s_n 	= 0;
	s_p 	= 0;
	s_w 	= 0;
	s_e 	= 0;
	s_r 	= 0;
	ln_yd = 0; ln_y = 0; ln_pi = 0; ln_i = 0; ln_ne = 0; ln_rL = 0; ln_l = 0; ln_p = 0; ln_v = 0; ln_c = 0; ln_n = 0; ln_r = 0;
	y_obs = 0; c_obs = 0; i_obs = 0; pi_obs = 0; r_obs = 0; w_obs = 0; h_obs = 0; ne_obs = 0; rL_obs = 0; l_obs = 0;
// RBC counterpart
    qn 		= 1;	%	Steady state Tobin'sn qn normalized to one
	rn 		= R-1;	%	nominal rate
	rrn 		= rn;	% 	real rate same as nominal with 0 inflation in ss
	hn		= H;	% 	hours worked
	rLn 		= RL-1; %	calibrated credit rate
	% threshold - eq B.37
	omegan 	= wmin*(1-eta_d)^(-1/ka);
	% capital rate of return - eq B.38
	rKn 		= ((1+rLn)/omegan)*(1-L_QK)-1;	
	% marginal product capital - eq B.39
	zn		= 1+rKn -(1-delta);
	% surviving rate entreprneurs
	etan	= (wmin/omegan)^ka;
	% mean of project above the threshold - eq B.40
	w_supn 	= (ka/(ka-1))*omegan;
	% mean of project below the threshold - eq B.41
	w_infn 	= (1-etan*w_supn)/(1-etan);
	% marginal cost of loans - eq B.42
	mcLn 	= ((1+rn)/( (wmin/omegan)^ka + (1-mu_B)*(1-(wmin/omegan)^ka)*(ka/(ka-1))*(((omegan^(1-ka))-(wmin^(1-ka)))/((omegan^(-ka))-(wmin^(-ka))))/omegan ) )-1;
	% steady state amount of firms - eq B.48
	nnn		= hn/( (1-beta*(1-delta))/((mu_P-1+theta/100*etan*omegan*(1+rKn)*qn*alpha/((ka-1)*zn))*beta*(1-delta))*Fe*(1+gamma*rLn)*(1-alpha)+delta/(1-delta)*Fe);
	% relative price - eq B.49
	pn 		= nnn^(1/(epsilon-1));
	% relative price - eq B.49
	mcn 		= pn/mu_P;
	% number of entrants - eq B.50
	nen 		= delta/(1-delta)*nnn;
	% labor demand entrants - eq B.51
	hen 		= Fe*nen;
	% labor demand installed - eq B.51
	hcn		= hn-hen;
	% real wage - eq B.52
	wn 		= (1-alpha)*(mcn*(alpha/zn)^alpha)^(1/(1-alpha));
	% capital- eq B.53
	kn 		= alpha/(1-alpha)*wn*hcn/zn;
	yn 		= kn^alpha*hcn^(1-alpha)/nnn;
	in 		= delta*kn;
	ydn 		= nnn*yn*pn^epsilon;
	cn 		= ydn*(1-gy) - in;
	dn 		= yn*pn*(1-1/mu_P);
	ucn 		= (cn-hh*cn)^-sigmaC;
	whn 		= wn/mu_W;
	uhn 		= ucn*whn;
	lnn		= L_QK*qn*kn;
	nnnn 		= (qn*kn+gamma*wn*hen-lnn);
	den		= ((wmin^ka)/(ka-1))*((omegan^(1-ka))*(1+rKn)*qn*kn/nnn);
	sn 		= (1+rKn)/(1+rLn);
	vn 		= beta*(1-delta)/(1-beta*(1-delta))*(dn+theta/100*den);
	mut_wn 	= mu_W;
	mut_pn 	= mu_P;
	mut_Ln 	= mu_L;
	Psin		= 0;
	mkn 		= mu_P;
	pin 		= 1;
	picn 	= 1;
	un 		= 1;
	Phiun 	= 0;
	kun 		= kn;
	pi_wn 	= 1;


end;

model; 

	%%% HOUSEHOLD
	% marginal utility of consumption (eq B.1)
	uc = (c-hh*c(-1))^-sigmaC;
	% Euler bond (eq B.2)
	beta*uc(+1)/uc*(1+rr)*exp(s_b)=1;
	% Euler shares (eq B.3)
	v = beta*uc(+1)/uc*(1-delta)*(d(+1)+v(+1) + theta/100*de(+1) );	
	% marginal disutility of labor (partially in eq B.4)
	uh = chi*h^sigmaL;
	% labor supply (eq B.4)
	uh/uc = wh;
	% free entry condition (eq B.5 and B.15)
	Fe*w*(1+gamma*((1+rL)/pic(+1)-1))/exp(s_a) = v*exp(s_e)*(1-chi_E/2*(3*(ne/ne(-1))^2+1-4*ne/ne(-1))) + beta*uc(+1)/uc*v(+1)*chi_E*exp(s_e(+1))*(ne(+1)/ne-1)*(ne(+1)/ne)^2;

	%%% UNIONS
	% varying markup (see page 533)
	mut_w = mu_W*exp(s_w);
	% wage decision (eq B.6)
	w = mut_w*wh 
		- (mut_w-1)*w*kappa_W*( pi_w*pi + (pi_w*pic-(xi_W*pi(-1)+(1-xi_W))) )*(pi_w*pic-(xi_W*pic(-1)+(1-xi_W)))
		+ (mut_w-1)*w(+1)/(pi_w(+1)*pic(+1))*beta*uc(+1)/uc*kappa_W*( pi_w(+1)*pic(+1) - (xi_W*pi+(1-xi_W)) )*(pi_w(+1)*pic(+1))^2;
	% real wage growth wage // axiliary variable
	pi_w = w/w(-1);
	
	%%% INSTALLED FIRMS
	% production function (eq B.7)
	n*y = exp(s_a)*(ku^alpha)*(hc^(1-alpha));
	% Capital utilized (eq B.8)
	ku = u*k(-1); 
	% marginal cost (eq B.9)
	mc = (1/exp(s_a))*(z/alpha)^alpha*(w/(1-alpha))^(1-alpha);
	% inputs cost minimization (eq B.10)
	w*hc/(1-alpha) = z*ku/alpha;
	% relative price as a markup over the marginal cost (eq B.11)
	p = mk*mc;
	% Endogenous markup (eq B.12)
	mk = exp(s_p)*mut_p/((1-kappa_P*(pi-(xi_P*pi(-1)+(1-xi_P)))^2)+kappa_P*Psi);
	% Auxiliary variable (see page 550 between B12 and B13 or footnote 23)
	Psi = pi*(pi-(xi_P*pi(-1)+(1-xi_P)))-beta*(1-delta)*( ((pi(+1)-(xi_P*pi+(1-xi_P)))^2)*(pi(+1)^2)*y(+1)*uc(+1)/(pic(+1)*uc*y) );
	% exogenous time varying markup (see between eq 39 and eq 40)
	mut_p = mu_P*exp(s_p);
	% dividends (eq B.13)
	d = y*p*(1-kappa_P/2*(pi-(xi_P*pi(-1)+(1-xi_P)))^2-1/mk);
	
	%%% STARTUPS
	% demand from entrant (eq B.14)
	ne*Fe = exp(s_a)*he;
	
    %%% ENTREPRENEUR
	% balance sheet (eq B.16)
	l + nn = q*k + gamma*w*he;
	% Ex post threshold (eq B.17)
	omega*s(-1)*q(-1)*k(-1)=l(-1);
 	% FOC Cost-Of-Funds (eq B.18)
	s = (phi^(((1-N_K)/N_K*varkappa)-1))*(((ka/(ka-1))*(l/(q*k)))^((1-N_K)/N_K*varkappa));
	% External finance premium
	s = (1+rK(+1))/(1+rL);
	% Net wealth law of motion (eq between B.18 and B.19 - typo in the paper because no eq number assigned)
	nn = (1-delta)*(1-theta/100)*de*n + TT ;
	% entrepreneurial dividends (eq B.19) - here I have rewritten the equation in a different fashion
	n*de = eta*(w_sup-omega)*(1+rK)/pic*q(-1)*k(-1)*exp(s_n);
	% surviving rate of entrepreneurs - see second paragraph page 529
	eta 	= (wmin/omega)^ka;
	% mean of successful projects (above omega) - see second paragraph page 529
	w_sup 	= (ka/(ka-1))*omega;
	% mean of defaulting projects (below omega) - eq B.40
	w_inf 	= (1-eta*w_sup)/(1-eta);

	%% Financial Intermediaries
	% Marginal cost of credit (eq B.20)
	1+mcL = (1+r)*( eta(+1) + (1-mu_B)*(1-eta(+1))*w_inf(+1)/omega(+1))^-1;
	% NK rate (eq B.21)
	rL = mut_L*mcL - (mut_L-1)*kappa_L*rL*(rL/rL(-1)-1)*rL/rL(-1) + kappa_L*(mut_L-1)*rL*beta*uc(+1)/uc*l(+1)/l*(rL(+1)/rL-1)*rL(+1)/rL;
	% Exogenous bank time varying markup (see text between eq14 and eq15)
	mut_L = mu_L*exp(s_l);
	
	%%% CAPITAL SUPPLIERS
	% investment equation (eq B.23)
	exp(s_i)*(1-(chi_I/2)*(i/i(-1)-1)^2)*i = k-(1-delta)*k(-1);
	% shadow value of capital - investment FOC (eq B.24)
	exp(s_i)*q = 1 + exp(s_i)*q*(chi_I/2)*( 1 + ( 3*i/i(-1)-4 )*i/i(-1) ) + beta*exp(s_i(+1))*uc(+1)/uc*(1-delta)*q(+1)*chi_I*(1-i(+1)/i)*(i(+1)/i)^2;
	% Optimal utilization rate (eq B.25)
	z = STEADY_STATE(z)*exp((psi/(1-psi))*(u-1));
	% Cost function on utilization (see page 535 between eq 46 and 47)
	Phiu = ((1-psi)/psi)*STEADY_STATE(z)*(exp((psi/(1-psi))*(u-1))-1);
	% return from holding one unit of capital (eq B.26)
	(1+rK)/pic=(z*u-Phiu+(1-delta)*q)/q(-1);

	%%% GENERAL EQUILIBRIUM
	% Taylor rule (eq B.27)
	r-STEADY_STATE(r)= rho*(r(-1)-STEADY_STATE(r)) + (1-rho)*(phi_pi*(pic-1) + phi_pic*(pic-1) +  phi_y*(y-STEADY_STATE(y)) ) + phi_dy*(y-y(-1)) + s_r;
	% Fisherian equation (eq B.28)
	1+rr = (1+r)/pic(+1);
	% Goods demand in the economy (eq B.29)
	yd = c + i + gy*yd*exp(s_g) + Phiu*k(-1) + kappa_P/2*(pi-(xi_P*pi(-1)+(1-xi_P)))^2*yd + kappa_L/2*(rL/rL(-1)-1)^2*yd;
	% variety effect (eq B.30)
	n*p^(1-epsilon)=1;
	% relative price (eq B.31)
	pi/pic = p/p(-1);
	% goods market equilibrium (eq B.32)
	n*y = (p^-epsilon)*yd;
	% Labor market equilibrium (B.33)
	h = hc + he;
	% law of motion of firms number (eq B.34)
	n = (1-delta)*(n(-1)+exp(s_e(-1))*(1-chi_E/2*(ne/ne(-1)-1)^2 )*ne(-1));
	
    // RBC counterpart
    
    %%% HOUSEHOLD
	% marginal utility of consumption (eq B.1)
	ucn = (cn-hh*cn(-1))^-sigmaC;
	% Euler bond (eq B.2)
	beta*ucn(+1)/ucn*(1+rrn)*exp(s_b)=1;
	% Euler shares (eq B.3)
	vn = beta*ucn(+1)/ucn*(1-delta)*(dn(+1)+vn(+1) + theta/100*den(+1) );	
	% marginal disutility of labor (partially in eq B.4)
	uhn = chi*hn^sigmaL;
	% labor supply (eq B.4)
	uhn/ucn = whn;
	% free entry condition (eq B.5 and B.15)
	Fe*wn*(1+gamma*((1+rLn)/picn(+1)-1))/exp(s_a) = vn*exp(s_e)*(1-chi_E/2*(3*(nen/nen(-1))^2+1-4*nen/nen(-1))) + beta*ucn(+1)/ucn*vn(+1)*chi_E*exp(s_e(+1))*(nen(+1)/nen-1)*(nen(+1)/nen)^2;

	%%% UNIONS
	% varying markup (see page 533)
	mut_wn = mu_W;%*exp(s_w);
	% wage decision (eq B.6)
	wn = mut_wn*whn; 
	% real wage growth wage // axiliary variable
	pi_wn = wn/wn(-1);
	
	%%% INSTALLED FIRMS
	% production function (eq B.7)
	nnn*yn = exp(s_a)*(kun^alpha)*(hcn^(1-alpha));
	% Capital utilized (eq B.8)
	kun = un*kn(-1); 
	% marginal cost (eq B.9)
	mcn = (1/exp(s_a))*(zn/alpha)^alpha*(wn/(1-alpha))^(1-alpha);
	% inputs cost minimization (eq B.10)
	wn*hcn/(1-alpha) = zn*kun/alpha;
	% relative price as a markup over the marginal cost (eq B.11)
	pn = mkn*mcn;
	
	% dividends (eq B.13)
	dn = yn*pn*(1-kappa_P/2*(pin-(xi_P*pin(-1)+(1-xi_P)))^2-1/mkn);
	
	%%% STARTUPS
	% demand from entrant (eq B.14)
	nen*Fe = exp(s_a)*hen;
	
    %%% ENTREPRENEUR
	% balance sheet (eq B.16)
	lnn + nnnn = qn*kn + gamma*wn*hen;
	% Ex post threshold (eq B.17)
	omegan*sn(-1)*qn(-1)*kn(-1)=lnn(-1);
 	% FOC Cost-Of-Funds (eq B.18)
	sn = (phi^(((1-N_K)/N_K*varkappa)-1))*(((ka/(ka-1))*(lnn/(qn*kn)))^((1-N_K)/N_K*varkappa));
	% External finance premium
	sn = (1+rKn(+1))/(1+rLn);
	% Net wealth law of motion (eq between B.18 and B.19 - typo in the paper because no eq number assigned)
	nnnn = (1-delta)*(1-theta/100)*den*nnn + TT ;
	% entrepreneurial dividends (eq B.19) - here I have rewritten the equation in a different fashion
	nnn*den = etan*(w_supn-omegan)*(1+rKn)/picn*qn(-1)*kn(-1)*exp(s_n);
	% surviving rate of entrepreneurs - see second paragraph page 529
	etan 	= (wmin/omegan)^ka;
	% mean of successful projects (above omegan) - see second paragraph page 529
	w_supn 	= (ka/(ka-1))*omegan;
	% mean of defaulting projects (below omegan) - eq B.40
	w_infn 	= (1-etan*w_supn)/(1-etan);

	%% Financial Intermediaries
	% Marginal cost of credit (eq B.20)
	1+mcLn = (1+rn)*( etan(+1) + (1-mu_B)*(1-etan(+1))*w_infn(+1)/omegan(+1))^-1;
	% NK rate (eq B.21)
	rLn = mut_Ln*mcLn ;%- (mut_Ln-1)*kappa_L*rLn*(rLn/rLn(-1)-1)*rLn/rLn(-1) + kappa_L*(mut_Ln-1)*rLn*beta*ucn(+1)/ucn*lnn(+1)/lnn*(rLn(+1)/rLn-1)*rLn(+1)/rLn;
	% Exogenous bank time varying markup (see text between eq14 and eq15)
	mut_Ln = mu_L;%*exp(s_l);
	
	%%% CAPITAL SUPPLIERS
	% investment equation (eq B.23)
	exp(s_i)*(1-(chi_I/2)*(in/in(-1)-1)^2)*in = kn-(1-delta)*kn(-1);
	% shadow value of capital - investment FOC (eq B.24)
	exp(s_i)*qn = 1 + exp(s_i)*qn*(chi_I/2)*( 1 + ( 3*in/in(-1)-4 )*in/in(-1) ) + beta*exp(s_i(+1))*ucn(+1)/ucn*(1-delta)*qn(+1)*chi_I*(1-in(+1)/in)*(in(+1)/in)^2;
	% Optimal utilization rate (eq B.25)
	zn = STEADY_STATE(zn)*exp((psi/(1-psi))*(un-1));
	% Cost function on utilization (see page 535 between eq 46 and 47)
	Phiun = ((1-psi)/psi)*STEADY_STATE(zn)*(exp((psi/(1-psi))*(un-1))-1);
	% return from holding one unit of capital (eq B.26)
	(1+rKn)/picn=(zn*un-Phiun+(1-delta)*qn)/qn(-1);

	%%% GENERAL EQUILIBRIUM
	% Goods demand in the economy (eq B.29)
	ydn = cn + in + gy*ydn*exp(s_g) + Phiun*kn(-1) + kappa_P/2*(pin-(xi_P*pin(-1)+(1-xi_P)))^2*ydn + kappa_L/2*(rLn/rLn(-1)-1)^2*ydn;
	% variety effect (eq B.30)
	nnn*pn^(1-epsilon)=1;
	% goods market equilibrium (eq B.32)
	nnn*yn = (pn^-epsilon)*ydn;
	% Labor market equilibrium (B.33)
	hn = hcn + hen;
	% law of motion of firms number (eq B.34)
	nnn = (1-delta)*(nnn(-1)+exp(s_e(-1))*(1-chi_E/2*(nen/nen(-1)-1)^2 )*nen(-1));
	
    
	%%% SHOCKS see page 536
	% Markup shocks are multiplied by 100 for prior simplificity purposes // does not affect the result
	s_a = rho_a*s_a(-1)+e_a/obsFactor;						% productivity AR(1)
	s_g = rho_g*s_g(-1)+(e_g+rho_ag*e_a)/obsFactor;			% spending AR(1) + productivity innovation
	s_b = rho_b*s_b(-1)+e_b/obsFactor;						% preference AR(1)
	s_i = rho_i*s_i(-1)+e_i/obsFactor;						% investment AR(1)
	s_l = rho_l*s_l(-1)+100*e_l/obsFactor;					% bank markup AR(1)
	s_n = rho_n*s_n(-1)+e_n/obsFactor;						% net wealth AR(1)
	s_p = rho_p*s_p(-1)+100*(e_p-u_p*e_p(-1))/obsFactor;	% price markup ARMA(1,1)
	s_w = rho_w*s_w(-1)+100*(e_w-u_w*e_w(-1))/obsFactor;	% wage markup ARMA(1,1
	s_e = rho_e*s_e(-1)+e_e/obsFactor;						% entry AR(1)
	s_r = rho_r*s_r(-1)+e_r/obsFactor;						% monetary policy AR(1)
	
	
	% Measurement equations as defined in eq A.1
	y_obs = obsFactor*log(yd/yd(-1));
	c_obs = obsFactor*log(c/c(-1));
	i_obs = obsFactor*log(i/i(-1));
	pi_obs = obsFactor*log(pic);
	r_obs = obsFactor*(r-STEADY_STATE(r));
	w_obs = obsFactor*log(w/w(-1));
	h_obs = obsFactor*log(h/STEADY_STATE(h));
	ne_obs = obsFactor*( log(n/n(-1)/(1-delta)-1) - log(1/(1-delta)-1) );
	rL_obs = obsFactor*((1+rL)/(1+r)-(1+STEADY_STATE(rL))/(1+STEADY_STATE(r)));%
	l_obs = obsFactor*log(l/l(-1));
	
	% Setting some key variables in log deviations from deterministic ss for plotting purposes
	ln_yd	= log(yd/STEADY_STATE(yd))*100;
	ln_y	= log(y/STEADY_STATE(y))*100;
	ln_pi	= log(pi/STEADY_STATE(pi))*100;
	ln_i	= log(i/STEADY_STATE(i))*100;
	ln_ne	= log(ne/STEADY_STATE(ne))*100;
	ln_rL	= log((1+rL)/(1+STEADY_STATE(rL)))*100;
	ln_l	= log(l/STEADY_STATE(l))*100;
	ln_p	= log(p/STEADY_STATE(p))*100;
	ln_v	= log(v/STEADY_STATE(v))*100;
	ln_c	= log(c/STEADY_STATE(c))*100;
	ln_n	= log(n/STEADY_STATE(n))*100;
	ln_r	= log(r/STEADY_STATE(r))*100;
    
    ln_yn	= log(yn/STEADY_STATE(yn))*100;  // natural output

end;


shocks;
	var e_a;  stderr 0.96;
	var e_g;  stderr 2.32;
//	var e_b;  stderr 0.40;
//	var e_i;  stderr 3.96;
//	var e_l;  stderr 0.18;
//	var e_n;  stderr 0.64;
	var e_p;  stderr 0.05;
//	var e_w;  stderr 0.27;
//	var e_e;  stderr 2.00;
	var e_r;  stderr 0.09;
end;

resid(1);
%steady;
check;


stoch_simul(order=1,irf=25, nograph) ln_yd ln_c ln_i ln_pi ln_y ln_n ln_v ln_r;
