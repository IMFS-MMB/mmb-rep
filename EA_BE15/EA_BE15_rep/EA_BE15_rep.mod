// Replication of the model:
// Benchimol, J. 2015. "Money in the Production Function: A New Keynesian DSGE Perspective."
// Southern Economic Journal 2015, 82(1), 152–184

// Implemented : 18/06/05 by Matyas Farkas
// Last edited : 19/02/18 by Felix Strobel 


	//	Unconstrained (return to scale sum could be different from 1)

var y, pi, ir, mp, mn, yf, mpf, mnf, ea, eu, ei, ep, en, vel rr ygap;
varobs y, pi, ir, mp, mn;
varexo ua, uu, ui, up, un;

parameters
	//	Micro parameters
	alphan alpham beta teta nu sigma gamma khi neta epsilon a1 a2 li1 li2 li3 cible
	rhoa1 rhou1 rhoi1 rhop1 rhon1
	vel0 vel1 vel2
	//	Macro parameters
	vym vyc vya vyp
	mnf1 mnf2 mnf3 mnf4
	pi1 pi2; 
	//	Micro parameters
	alphan	=	0.50;
	alpham	=	0.25;
    beta	=	0.9926;
    teta	=	0.66;
    nu		=	1.3567;
    sigma	=	1.8465;
    epsilon	=	6.00;
    neta	=	1.00;
    gamma   =   0.4399;
    khi     =   0.9998;
    a1		=	ln(1-exp(-1/beta))-((1/beta)/(exp(1/beta)-1)); // Steady State value and Taylor approximation order 1
    a2		=	1/(exp(1/beta)-1);								// Steady State value and Taylor approximation order 1
    li1		=	0.6005;
    li2		=	3.4258;
    li3		=	1.4118;
	cible	=	1.80;

    rhoa1	=	0.9398;
    rhou1	=	0.9543;
    rhoi1	=	0.1567;
    rhop1	=	0.7656;
    rhon1	=	0.8342;

	vel0	=	0.3082;
	vel1	=	2.0798;
	vel2	=	0.1617;

	//	Macro parameters

	//	yf
	vym		=	((alphan+alpham*(1+neta)-1)/(neta+alphan-(1-sigma)*(1-alphan)));
	vyc		=	(((1-alphan)*(ln(alpham*(1-alphan))-ln(khi)-ln(epsilon/(epsilon-1))))/(neta+alphan-(1-sigma)*(1-alphan)));
	vya		=	((1+neta)/(neta+alphan-(1-sigma)*(1-alphan)));
	vyp		=	((alpham*(1+neta))/(neta+alphan-(1-sigma)*(1-alphan)));

	//	mnf
	mnf1	=	(sigma/nu);	
	mnf2	=	-((a2*sigma)/nu);
	mnf3	=	-((-ln(beta))*(a2/nu))-((-ln(gamma)+a1)/nu);
	mnf4	=	(1/nu);

	//	pi
	pi1		=	((((1-teta)*(1-beta*teta))/((1-alphan+epsilon*(2*alphan-1))*teta))*(neta+alphan-((1-sigma)*(1-alphan)))); // a verifier
	pi2		=	((((1-teta)*(1-beta*teta))/((1-alphan+epsilon*(2*alphan-1))*teta))*(1-alphan-alpham*(1+neta)));

model(linear);

	// Flexible-price economy
	yf		=	vym*mpf + vyc + vya*ea + vyp*ep;
	mnf		=	mnf1*yf + mnf2*(yf(+1)-yf) + mnf3 + mnf4*en;
	mpf		=	yf - mnf - vel; 

	// Sticky-price economy
	pi		=	beta*pi(+1) + pi1*(y-yf) + pi2*(mp-mpf);
	y		=	y(+1) - (1/sigma)*(ir-pi(+1)+ln(beta))-(1/sigma)*(eu(+1)-eu);
	mn		=	(sigma/nu)*y - (a2/nu)*ir - ((-ln(gamma)+a1)/nu) + (1/nu)*en;
	mp		=	y - mn - vel;
	ir		=	(1-li1)*(li2*(pi-cible) + li3*(y-yf)) + li1*(ir(-1)) + ei;
	vel		=	vel0 + vel1*(vel2*en + (1-vel2)*ep);
    rr      =   ir-pi(+1);
    ygap    =   y-yf;
	// Shocks
	ea  	=	rhoa1*ea(-1) + 100*ua;
	eu  	=	rhou1*eu(-1) + 100*uu;
	ei  	=	rhoi1*ei(-1) + 100*ui;
	ep  	=	rhop1*ep(-1) + 100*up;
	en		=	rhon1*en(-1) + 100*un;

end;

steady;
check;

	// Stochastic shocks
shocks;
    var ua; stderr 0.0071;
    var uu; stderr 0.1063;
    var ui; stderr 0.0290;
    var up; stderr 0.0164;
    var un; stderr 0.0169;
end;

estimated_params;
    alphan,     beta_pdf,			0.50,		0.2;
    alpham,     beta_pdf,			0.25,		0.2;
    teta,		beta_pdf,			0.66,		0.1;
    nu,       	normal_pdf,			1.25,		0.1;
    sigma,      normal_pdf,			2.00,		0.1;
    epsilon,    normal_pdf,			6.00,		0.1;
    neta,		normal_pdf,			1.00,		0.1;
    gamma,      normal_pdf,			0.44,		0.05;
    khi,		normal_pdf,			1.00,		0.1;

    li1,        beta_pdf,			0.50,		0.05;
    li2,        normal_pdf,			3.50,		0.2;
    li3,        normal_pdf,			1.50,		0.2;
    cible,      normal_pdf,			2.0,		0.1;

    vel0,		normal_pdf,			0.31,		0.1;
    vel1,		normal_pdf,			1.00,		0.5;
    vel2,		beta_pdf,			0.50,		0.1;

    rhoa1,		beta_pdf,			0.75,		0.1;
    rhou1,		beta_pdf,			0.75,		0.1;
    rhoi1,		beta_pdf,			0.15,		0.01;
    rhop1,		beta_pdf,			0.75,		0.1;
    rhon1,		beta_pdf,			0.75,		0.1;

    stderr ua,	inv_gamma_pdf,		0.02,		2;
    stderr uu,  inv_gamma_pdf,		0.02,		2;
    stderr ui,  inv_gamma_pdf,		0.02,		2;
    stderr up,  inv_gamma_pdf,		0.02,		2;
    stderr un,  inv_gamma_pdf,		0.02,		2;
end;

//estimation(nograph,graph_format=(eps,fig),nodisplay,datafile=data1pchpdetrend,mode_compute=4,filter_step_ahead=[1:12],bayesian_irf,forecast=12,filter_decomposition,mh_jscale=0.5,mh_replic=300000,mh_nblocks=10) y pi ir mp mn yf mpf mnf vel;
//close all;
stoch_simul(graph_format=(eps),order=1,irf=40,conditional_variance_decomposition=[1:60], nograph) pi y ir rr ygap mp mn vel;
//close all;
//oomipf1_=oo_;
//save mipf1_oo oomipf1_
//close all;
//dynare_sensitivity(nograph,graph_format=(eps,fig),nodisplay,identification=1,morris=1,morris_nliv=6,morris_ntra=50,stab=1,rmse=1,redform=1,ppost=1);
//close all;