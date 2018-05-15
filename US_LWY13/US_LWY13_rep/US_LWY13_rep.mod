// Model: US_LWY13

// References:
// Title: "Fiscal Foresight and Information Flows"
// Journal published: Econometrica, Vol. 81, No. 3 (May 2013), pp. 1115-1145
// Authors: Eric M. Leeper, Todd B. Walker and Shu-Chun Susan Yang 

// Created by Balint Tatar
// Last edited: 20/04/18 by Balint Tatar


var cr cnr R i k v l y g c q rk w pi b sb tauk taul r kbar z mc Tk Tl ua ub um ui uw up ug utk utl uz 

//%flexible-price counterparts

crstar cnrstar istar kstar vstar lstar ystar gstar cstar qstar rkstar wstar bstar sbstar taukstar taulstar rstar kbarstar zstar Tkstar Tlstar mcstar ygap


//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************
 

varexo epsilona epsilonb epsiloni epsilonw epsilonp epsilontk epsilontl epsilonz
// epsilonm epsilong 


//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;//                                              //*
//**************************************************************************
   
parameters 
//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
        std_r_ std_r_quart coffispol                                     //*
//**************************************************************************

alph bet gamm kappa omegaw omegap etaw etap mu phipi phiy sgss sbss taulss taukss taucss theta gpsi s chiw chip delt rhoa rhob rhor rhoi rhow rhop rhog rhotk rhotl rhoz gammg gammtk gammtl gammz psitk psitl psigc psiz siga sigb sigm sigi sigw sigp sigg sigtk sigtl sigz phipid phiyd phia Rss rkss psi1ss wss kyss lyss cyss yss strss cryss cnryss crss cnrss kss ivss lss css zss bss gss lambrss lambnrss;

//Load Parameter File

load paramfile_leeper;

set_param_value('alph',alph)
set_param_value('bet',bet)
set_param_value('gamm',gamm)
set_param_value('kappa',kappa)
set_param_value('omegaw',omegaw)
set_param_value('omegap',omegap)
set_param_value('etaw',etaw)
set_param_value('etap',etap)
set_param_value('mu',mu)
set_param_value('phipi',phipi)
set_param_value('phiy',phiy)
set_param_value('sgss',sgss)
set_param_value('sbss',sbss)
set_param_value('taulss',taulss)
set_param_value('taukss',taukss)
set_param_value('taucss',taucss)
set_param_value('theta',theta)
set_param_value('gpsi',gpsi)
set_param_value('s',s)
set_param_value('chiw',chiw)
set_param_value('chip',chip)
set_param_value('delt',delt)
set_param_value('rhoa',rhoa)
set_param_value('rhob',rhob)
set_param_value('rhor',rhor)
set_param_value('rhoi',rhoi)
set_param_value('rhow',rhow)
set_param_value('rhop',rhop)
set_param_value('rhog',rhog)
set_param_value('rhotk',rhotk)
set_param_value('rhotl',rhotl)
set_param_value('rhoz',rhoz)
set_param_value('gammg',gammg)
set_param_value('gammtk',gammtk)
set_param_value('gammtl',gammtl)
set_param_value('gammz',gammz)
set_param_value('psitk',psitk)
set_param_value('psitl',psitl)
set_param_value('psigc',psigc)
set_param_value('psiz',psiz)
set_param_value('siga',siga)
set_param_value('sigb',sigb)
set_param_value('sigm',sigm)
set_param_value('sigi',sigi)
set_param_value('sigw',sigw)
set_param_value('sigp',sigp)
set_param_value('sigg',sigg)
set_param_value('sigtk',sigtk)
set_param_value('sigtl',sigtl)
set_param_value('sigz',sigz)
set_param_value('phipid',phipid)
set_param_value('phiyd',phiyd)
set_param_value('phia',phia)

Rss = 1/bet;
rkss = (1 - bet*(1 - delt))/(bet*(1 - taukss)*(1+taucss));
psi1ss = rkss*(1-taukss);

wss=((((1-alph)^(1-alph))*(alph^(alph))*(rkss^(-alph))*(etap-1))/(etap*(1+taucss)))^(1/(1-alph));
kyss = ((wss*alph)/(rkss*(1-alph)))^(1-alph);
lyss = ((wss*alph)/(rkss*(1-alph)))^(-alph);
cyss = (1 - delt*kyss - sgss);
strss = ((1 - Rss)*sbss - sgss + (taucss/(1+taucss))*cyss + taulss*wss*lyss + taukss*rkss*kyss); %transfer-output share
cnryss = (1-taulss)*wss*lyss + strss;
cryss = (cyss - mu*cnryss)/(1-mu);
yss = ((wss*(1-taulss)*(mu*(cnryss^(-gamm)) + (1-mu)*(cryss^(-gamm))*(1-theta)^(-gamm))*(etaw-1))/(etaw*(lyss^kappa)))^(1/(gamm+kappa));

crss = cryss*yss;
cnrss = cnryss*yss;
kss = kyss*yss;
ivss = delt*kss;
lss = lyss*yss;
css = cyss*yss;
zss = strss*yss;  %transfer=transfer output share time outpput
bss = sbss*yss;
gss = sgss*yss;
lambrss = ((1-theta)^(-gamm))*(crss^(-gamm));
lambnrss = (cnrss^(-gamm));



//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
/*
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
    deep_parameter_name = M_.param_names(i,:);                           
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);       
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
*/

coffispol = 1/sgss;                                                        //*
%coffispol = sigg;
//**************************************************************************

model(linear); 

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variable //*

interest   = 4*R;                                                        //*
inflation  = 4*(pi/4+pi(-1)/4+pi(-2)/4+pi(-3)/4);                        //*
inflationq = 4*pi;                                                       //*
outputgap  = ygap;                                                    //*
output     = y;                                                          //*
fispol   = ug;                                                           //*
//**************************************************************************


//**************************************************************************                                                                    
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy                                                       //*
/*                                                                         //*
interest =   cofintintb1*interest(-1)                                    //* 
           + cofintintb2*interest(-2)                                    //* 
           + cofintintb3*interest(-3)                                    //* 
           + cofintintb4*interest(-4)                                    //* 
           + cofintinf0*inflationq                                       //* 
           + cofintinfb1*inflationq(-1)                                  //* 
           + cofintinfb2*inflationq(-2)                                  //* 
           + cofintinfb3*inflationq(-3)                                  //* 
           + cofintinfb4*inflationq(-4)                                  //* 
           + cofintinff1*inflationq(+1)                                  //* 
           + cofintinff2*inflationq(+2)                                  //* 
           + cofintinff3*inflationq(+3)                                  //* 
           + cofintinff4*inflationq(+4)                                  //* 
           + cofintout*outputgap 	                                     //* 
           + cofintoutb1*outputgap(-1)                                   //* 
           + cofintoutb2*outputgap(-2)                                   //* 
           + cofintoutb3*outputgap(-3)                                   //* 
           + cofintoutb4*outputgap(-4)                                   //* 
           + cofintoutf1*outputgap(+1)                                   //* 
           + cofintoutf2*outputgap(+2)                                   //* 
           + cofintoutf3*outputgap(+3)                                   //* 
           + cofintoutf4*outputgap(+4)                                   //* 
           + cofintoutp*output 	                                         //* 
           + cofintoutpb1*output(-1)                                     //* 
           + cofintoutpb2*output(-2)                                     //* 
           + cofintoutpb3*output(-3)                                     //* 
           + cofintoutpb4*output(-4)                                     //* 
           + cofintoutpf1*output(+1)                                     //* 
           + cofintoutpf2*output(+2)                                     //* 
           + cofintoutpf3*output(+3)                                     //* 
           + cofintoutpf4*output(+4)                                     //* 
           + std_r_ *interest_;                                          //* 
*/                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

// Original Model Code:


%-------------------------------------------------------------------------------
%   (1)
%   real interest rate (FOC B) - OK
%-------------------------------------------------------------------------------

cr-1/(1+theta)*cr(+1)+ (1-theta)/(gamm*(1+theta))*R -(1-theta)/(gamm*(1+theta))*pi(+1)-(1-theta)/(gamm*(1+theta))*ub+(1-theta)/(gamm*(1+theta))*ub(+1) = theta/(1+theta)*cr(-1);
crstar-1/(1+theta)*crstar(+1)+ (1-theta)/(gamm*(1+theta))*rstar -(1-theta)/(gamm*(1+theta))*ub+(1-theta)/(gamm*(1+theta))*ub(+1) = theta/(1+theta)*crstar(-1);


%-------------------------------------------------------------------------------
%   (2)
%   investment (FOC I) - OK
%-------------------------------------------------------------------------------
i-bet/(1+bet)*i(+1)-1/((1+bet)*s)*q-bet*ui(+1)+ui=1/(1+bet)*i(-1);
istar-bet/(1+bet)*istar(+1)-1/((1+bet)*s)*qstar-bet*ui(+1)+ui=1/(1+bet)*istar(-1);


%--------------------------------------------
%(3)	Q equation - OK
%--------------------------------------------
%eq0(Ntauc) = -tauc/(1+tauc);
%eq0(Nxtc) = bet*tauc*(1-delt)/(1+tauc);


q+R-pi(+1)-bet*(1-delt)*q(+1)-bet*rkss*(1-taukss)*(1+taucss)*rk(+1)+taukss*bet*rkss*(1+taucss)*tauk(+1)=0;
qstar+rstar-bet*(1-delt)*qstar(+1)-bet*rkss*(1-taukss)*(1+taucss)*rkstar(+1)+taukss*bet*rkss*(1+taucss)*taukstar(+1)=0;


%--------------------------------------------
%(4)	Capital Accumulation Equation - OK
%--------------------------------------------

k-delt*i=(1-delt)*k(-1);
kstar-delt*istar=(1-delt)*kstar(-1);




%--------------------------------------------
%(5)	Phillips Equation - OK
%--------------------------------------------

pi-bet/(1 + bet*chip)*pi(+1)-alph*(1/(1 + bet*chip))*(1-bet*omegap)*(1-omegap)*(1/omegap)*rk-(1-alph)*(1/(1 + bet*chip))*(1-bet*omegap)*(1-omegap)*(1/omegap)*w+(1/(1 + bet*chip))*(1-bet*omegap)*(1-omegap)*(1/omegap)*ua-up= chip/(1 + bet*chip)*pi(-1);
-(1-alph)*wstar-alph*rkstar+ua=0;


%--------------------------------------------
%(6)	Wage Equation (L supply equation) - OK
%--------------------------------------------


(1 + (1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa)))*w     -bet/(1+bet)*w(+1)    -bet/(1+bet)*pi(+1)    +(1 + bet*chiw)/(1 + bet)*pi   -kappa*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa))*l   -(gamm/(1-theta))*(((1-mu)*lambrss)/((1-mu)*lambrss + mu*lambnrss))*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa))*cr     -gamm*((mu*lambnrss)/((1-mu)*lambrss + mu*lambnrss))*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa))*cnr     -(taulss/(1-taulss))*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa))*taul    -uw= 1/(1+bet)*w(-1)  +chiw/(1 + bet)*pi(-1)    -((gamm*theta)/(1-theta))*(((1-mu)*lambrss)/((1-mu)*lambrss + mu*lambnrss))*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa))*cr(-1);
wstar  -(gamm/(1-theta))*(((1-mu)*lambrss)/((1-mu)*lambrss + mu*lambnrss))*crstar - gamm*((mu*lambnrss)/((1-mu)*lambrss + mu*lambnrss))*cnrstar    -taulss/(1-taulss)*taul  =  kappa*lstar   -((gamm*theta)/(1-theta))*(((1-mu)*lambrss)/((1-mu)*lambrss + mu*lambnrss))*crstar(-1);




%--------------------------------------------
%(7)	Capital Demand Equation - OK
%--------------------------------------------

kbar-y-(1-alph)*w+(1-alph)*rk+ua=0;
kbarstar-ystar-(1-alph)*wstar+(1-alph)*rkstar+ua=0;


%--------------------------------------------
%(8)	Production Function - OK
%--------------------------------------------
y-ua-alph*kbar-(1-alph)*l=0;
ystar-ua-alph*kbarstar-(1-alph)*lstar=0;



%--------------------------------------------
%(9)	Taylor Rule - OK
%--------------------------------------------
R + (-(1-rhor)*phipi - phipid)*pi +(-(1-rhor)*phiy - phiyd)*y+phia*ua -um=-phipid*pi(-1) -phiyd*y(-1)+rhor*R(-1);
%Rstar + (-(1-rhor)*phipi - phipid)*pistar +(-(1-rhor)*phiy - phiyd)*ystar+phia*ua -um=-phipid*pistar(-1) -phiyd*ystar(-1)+rhor*Rstar(-1);


%--------------------------------------------
%(10)	Consumption Aggregation
%--------------------------------------------
css*c-(1-mu)*crss*cr - mu*cnrss*cnr=0;
css*cstar-(1-mu)*crss*crstar - mu*cnrss*cnrstar=0;


%--------------------------------------------
%(11)	Non-Ricardian Household's Budget
%--------------------------------------------
cnrss*cnr-wss*lss*(1-taulss)*w-wss*lss*(1-taulss)*l+wss*lss*taulss*taul-zss*z=0;
cnrss*cnrstar   -wss*lss*(1-taulss)*wstar    -wss*lss*(1-taulss)*lstar     +wss*lss*taulss*taulstar   -zss*zstar=0;



%--------------------------------------------
%(12)	sb Defined
%--------------------------------------------
sb+y-b=0;
sbstar+ystar-bstar=0;

%--------------------------------------------
%(13)	Aggregate Resouce Constraint - OK
%--------------------------------------------


y-cyss*c-delt*kyss*i-sgss*g-psi1ss*kyss*v=0;
ystar-cyss*cstar-delt*kyss*istar-sgss*gstar-psi1ss*kyss*vstar=0;



%--------------------------------------------
%(14)	Government Budget Constraint - OK
%--------------------------------------------


sbss*b-sgss*g+taukss*rkss*kyss*tauk+taukss*rkss*kyss*rk+taukss*rkss*kyss*v+taulss*wss*lyss*taul+taulss*wss*lyss*w+taulss*wss*lyss*l-strss*z+Rss*sbss*pi   = Rss*sbss*R(-1)+Rss*sbss*b(-1)-taukss*rkss*kyss*k(-1);
%sbss*bstar  -sgss*gstar+taukss*rkss*kyss*taukstar    +taukss*rkss*kyss*rkstar   +taukss*rkss*kyss*vstar    +taulss*wss*lyss*taulstar         +taulss*wss*lyss*wstar     +taulss*wss*lyss*lstar    -strss*zstar     +Rss*sbss*pistar   = Rss*sbss*Rstar(-1)   +Rss*sbss*bstar(-1)   -taukss*rkss*kyss*kstar(-1);
sbss*bstar  -sgss*gstar+taukss*rkss*kyss*taukstar    +taukss*rkss*kyss*rkstar   +taukss*rkss*kyss*vstar    +taulss*wss*lyss*taulstar         +taulss*wss*lyss*wstar     +taulss*wss*lyss*lstar    -strss*zstar     = Rss*sbss*rstar(-1)   +Rss*sbss*bstar(-1)   -taukss*rkss*kyss*kstar(-1);




%--------------------------------------------
%(15)    g Rule - OK
%--------------------------------------------
g-ug= -(1-rhog)*gammg*sb(-1)+ rhog*g(-1);
gstar-ug= -(1-rhog)*gammg*sbstar(-1)+ rhog*gstar(-1);






%--------------------------------------------
%(16)    Capital Tax Rate Rule - OK
%--------------------------------------------


tauk-(1-rhotk)*psitk*y-utk=(1-rhotk)*gammtk*sb(-1)+rhotk*tauk(-1);
taukstar -(1-rhotk)*psitk*ystar  -utk=(1-rhotk)*gammtk*sbstar(-1)+rhotk*taukstar(-1);


%--------------------------------------------
%(17)    Labor Tax Rate Rule - OK
%--------------------------------------------

taul-(1-rhotl)*psitl*y-utl=(1-rhotl)*gammtl*sb(-1)+rhotl*taul(-1);
taulstar-(1-rhotl)*psitl*ystar-utl=(1-rhotl)*gammtl*sbstar(-1)+rhotl*taulstar(-1);



%--------------------------------------------
%(18)    Z Rule - OK
%--------------------------------------------

z+(1-rhoz)*psiz*y-uz=-(1-rhoz)*gammz*sb(-1)+rhoz*z(-1);
zstar  +(1-rhoz)*psiz*ystar   -uz   =     -(1-rhoz)*gammz*sbstar(-1)+rhoz*zstar(-1);


%--------------------------------------------
%(19)	v equation - OK
%--------------------------------------------


gpsi/(1-gpsi)*v-rk+taukss/(1-taukss)*tauk=0;
gpsi/(1-gpsi)*vstar-rkstar+taukss/(1-taukss)*taukstar=0;


%--------------------------------------------
%(20)	kbar, effective unit of capital - OK
%--------------------------------------------
kbar-v= k(-1);
kbarstar-vstar= kstar(-1);

%--------------------------------------------
%(30)	Fisher Equation: real interest rate checking - OK
%--------------------------------------------
r-R+pi(+1)=0;
%rstar-Rstar+pistar(+1)=0;

%--------------------------------------------
%(31)	real mc - OK
%--------------------------------------------

mc-(1-alph)*w-alph*rk+ua=0;
mcstar-(1-alph)*wstar-alph*rkstar+ua=0;



%--------------------------------------------
%(32)	Capital Tax Revenue - OK
%--------------------------------------------
Tk-tauk-rk-kbar=0;
Tkstar-taukstar-rkstar-kbarstar=0;


%--------------------------------------------
%(33)	Labor Tax Revenue - OK
%--------------------------------------------
Tl-taul-w-l=0;
Tlstar-taulstar-wstar-lstar=0;

%--------------------------------------------
%(34)	Tech Shock - OK
%--------------------------------------------
ua= rhoa*ua(-1) +siga*epsilona;


%--------------------------------------------
%(35)	Preference Shock - OK
%--------------------------------------------
ub=rhob*ub(-1)+sigb*epsilonb;

%--------------------------------------------
%(36)	Monetary Policy Shock - OK
%--------------------------------------------

%um=sigm*epsilonm;
%um=epsilonm;
um=0.25*interest_;
%--------------------------------------------
%(37)	Investment Shock - OK
%--------------------------------------------

ui=rhoi*ui(-1)+sigi*epsiloni;

%--------------------------------------------
%(38)	wage markup Shock - OK
%--------------------------------------------
uw=rhow*uw(-1)+sigw*epsilonw;

%--------------------------------------------
%(39)	price markup Shock - OK
%--------------------------------------------
up= rhop*up(-1)+sigp*epsilonp;

%--------------------------------------------
%(40)	g Spending Shock - OK
%--------------------------------------------
%ug= sigg*epsilong;

%--------------------------------------------
%(41)	tk Shock - OK
%--------------------------------------------
utk=sigtk*epsilontk;

%--------------------------------------------
%(42)	tl Shock - OK
%--------------------------------------------
utl=sigtl*epsilontl;


%--------------------------------------------
%(43)	Z Shock - OK
%--------------------------------------------
uz= sigz*epsilonz;

%--------------------------------------------
%(43)	Z Shock - OK
%--------------------------------------------
ygap= y-ystar;



end;



shocks;
var epsilona = 1; 
var epsilonb = 1;
//var epsilonm = 1;
var epsiloni = 1;
var epsilonw = 1;
var epsilonp = 1;
//var epsilong = 1;
var epsilontk = 1;
var epsilontl = 1;
var epsilonz = 1;
var interest_ = 1;
var fiscal_ = 1;

end;

stoch_simul(order=1,irf=100,solve_algo=1) ygap inflation interest y;
