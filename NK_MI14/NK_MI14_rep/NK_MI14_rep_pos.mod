//**************************************************************************
// A Theory of Countercyclical Government Multiplier
//
// Pascal Michaillat
//
// AEJ:Macro, 2014
//**************************************************************************

//**************************************************************************
//Endogenous variables

var a c pie l n th R g gendo
//as in original file.
//add output as endogenous variable to make it consistent with MMB 
    y 
//add other endogenous variables to get rid of hashtags from the original code
    u h w mpl f;
//Hence, 15 endogenous variables in total
//**************************************************************************

//**************************************************************************
//Shocks
varexo epsa hireg;
//**************************************************************************

//**************************************************************************
//Parameters
parameters phi phipi D s delta r omegah eta alpha omega gamma R_ss rhoa epsilon sigmaa  phir zeta gexo
           th_ss n_ss a_ss l_ss u_ss h_ss w_ss mpl_ss f_ss g_ss y_ss c_ss;

alpha=0.66;
epsilon=11;
delta=0.999014076834481;
eta=0.7;
s=0.008950757575758;
gamma=0.5;
phipi=1.5;
phir=0.961467727988398;
phi=61;
rhoa=0.991693729807990;
D=delta*(1-s);
zeta=0.165479788012770;
gexo=0.156346165403230;

//Shocks
valg=0.005;
sigmaa=0.003022418150967;

//Steady-states
u_ss=0.064;
th_ss=0.425619083447042;
n_ss=(1-u_ss)/(1-s);
a_ss=1;
g_ss=zeta*n_ss;
l_ss=n_ss-g_ss;

omegah = s*n_ss*th_ss^(eta-1)/u_ss;
omega=((epsilon-1)/epsilon)*alpha*l_ss^(alpha-1)/(1+(1-D)*0.32/(omegah*th_ss^(-eta)));
r=0.32*omega;

h_ss = s*n_ss;
w_ss = omega*a_ss^gamma;
mpl_ss = a_ss*alpha*l_ss^(alpha-1);
f_ss = min(1,omegah*th_ss^(1-eta));
R_ss=1/delta;
y_ss = a_ss*(l_ss^alpha);
c_ss = (y_ss - (r*a_ss*h_ss)/(omegah*th_ss^(-eta)))/(1+(phi/2)*pie^2);

//**************************************************************************


//**************************************************************************
model;

//Job-finding probability
f = min(1,omegah*th^(1-eta));

//Unemployment
u = 1-(1-s)*n(-1);

//Matching function
h = n-(1-s)*n(-1);

//Exogneous wage
w = omega*a^gamma;

//Marginal product of labor
mpl = a*alpha*l^(alpha-1);

//Monetary policy rule
R = max(1,R_ss*(1+pie)^(phipi*(1-phir))*(R(-1)/R_ss)^phir);

//Euler equation
1/R = delta*c/(c(+1)*(1+pie(+1)));

// Resource constraint
y=c*(1+(phi/2)*pie^2)+(r/(omegah*th^(-eta)))*h*a;

//New Keynesian Phillips Curve
pie*(1+pie)=1/phi*(epsilon*((1/mpl)*(w+a*r/(omegah*th^(-eta))-D*(c/c(+1))*a(+1)*r/(omegah*th(+1)^(-eta))))+(1-epsilon))*(y/c)+ delta*pie(+1)*(1+pie(+1));

//Production function
y = a*(l^alpha);

//Total employment
n=l+g;

//Law of motion of total employment
n=(1-s)*n(-1)+u*f;

//Government employment endogenous component
gendo=(1-s)*gendo(-1)+hireg;

//Government employment total
g=gendo+gexo;

//Technology 
log(a) = rhoa* log(a(-1))+epsa;

end;
//**************************************************************************

//**************************************************************************
initval;

n=n_ss;
th=th_ss;
l=l_ss; 
pie=0;
c=c_ss;
y=y_ss;
a=a_ss;
R=R_ss;
gendo=0;
epsa=0;
hireg=0;
g=gendo+gexo;
u=u_ss;
h=h_ss;
w=w_ss;
mpl=mpl_ss;
f=f_ss;

end;
//**************************************************************************

//**************************************************************************
shocks;
var epsa;
periods 1;
values (18*sigmaa);
var hireg;
periods 1;
values (valg);
end;
//**************************************************************************

simul(periods=15000);



