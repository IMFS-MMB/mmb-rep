%close all;
var y, pi, r, mp, yf, mpf, ep, ei, em, at ygap;
varexo up, ui, um, ua;

parameters alpha beta teta vega sigma neta epsilon b a1 a2 li1 li2 li3 li4 rhoa rhop rhoi rhom pb yb mpb rb cstd;


   alpha	=	0.295;
    beta	=	0.995;
    teta	=	0.65;
    vega	=	1.25;
    sigma	=	2.;
    b       =   0.25;
    a1		=	1/(1+((b/(1-b))^(1-vega))*((1/(1-exp(-1/beta)))^((1-vega)/vega)));
    a2		=	1/(exp(1/beta)-1);
    neta	=	2.0;
    epsilon	=	6.0;
    li1		=	0.42;
    li2		=	1.8;
    li3		=	1;
    li4		=	0.0;
    rhoa	=	0.98;
    rhop	=	0.968;
    rhoi	=	0.42;
    rhom	=	0.0;

	// Stationary values
%	pb		= 0.48;
%	yb		= 0.00;
%	mpb		= 0.00;
%	rb		= 0.00;
%	cstd	= 0.01;

	// Stationary values
	pb		= 0.92;
	yb		= 0.00;
	mpb		= 0.00;
	rb		= 0.00;
	cstd	= 0.008;

model;
yf = ((1+neta)/((vega-(vega-sigma)*a1)*(1-alpha)+neta+alpha))*at+((1-alpha)*(vega-sigma)*(1-a1)/((vega-(vega-sigma)*a1)*(1-alpha)+neta+alpha))*(mpf) - (log((1+(1/((1/(epsilon-1)))))/((1+(1/((1/(epsilon-1)))))-1)))*((1-alpha)/((vega-(vega-sigma)*a1)*(1-alpha)+neta+alpha))+(((1-alpha)*(vega-sigma)*(1-a1))/((1-vega)*((vega-(vega-sigma)*a1)*(1-alpha)+neta+alpha)))*em;
mpf = -((a2*(vega-(vega-sigma)*a1))/vega)*(yf(+1))+(1+((a2*(vega-(vega-sigma)*a1))/vega))*(yf)+(1/vega)*em;
pi = beta*(pi(+1)) + (((1-alpha)*(1-teta)*(1-beta*teta)*(vega-(vega-sigma)*a1+((neta+alpha)/(1-alpha))))/(teta*(1-alpha+alpha*(1+(1/((1/(epsilon-1))+ep))))))*(y-yf) + (((1-alpha)*(1-teta)*(1-beta*teta)*(sigma-vega)*(1-a1))/(teta*(1-alpha+alpha*(1+(1/((1/(epsilon-1))+ep))))))*(mp-mpf);
y = y(+1) - (1/(vega-a1*(vega-sigma)))*(r-rb - (pi(+1))) + (((sigma-vega)*(1-a1))/(vega-a1*(vega-sigma)))*(mp(+1)-mp) - (((1-a1)*(vega-sigma))/((1-vega)*(vega-a1*(vega-sigma))))*(em(+1)-em) ;
mp = y - (a2/vega)*(r-rb) + (1/vega)*em;
r-rb = (1-li1)*(li2*(pi-pb) + li3*(y-yf)) + li1*(r(-1)-rb)+ ei;// + li4*(mp-mpf)
ygap=y-yf;
at  = rhoa * at(-1) + 100*ua;
ep  = rhop * ep(-1) + 100*up;
ei  = rhoi * ei(-1) + 100*ui;
em  = rhom * em(-1) + 100*um;
end;

steady;
check;

shocks;
%    var ua = cstd;
    var ui = (cstd)^2;
%    var up = cstd;
%    var um = cstd^2;
end;
stoch_simul(order=1,irf=3) em y ygap pi;
