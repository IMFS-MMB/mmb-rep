// Title: An Estimated Stochastic Dynamic General Equilibrium Model of the Euro Area
// Authors: Smets, Frank and Raf Wouters
// Publication: Journal of the European Economic Association, September 2003, 1(5), 1123-1175.
// Earlier versions: ECB Working Paper 171, August 2002

// This file simulates the dynamic response of the model to specific shocks

// Replication of IRF. GR (2003) policy rule used, which reacts to annual inflation,
// comparable IRF also for annual inflation

var mcf zcapf rkf kf pkf muf cf invef yf labf pinff wf pf emplf rrf effortf
    rf mc zcap rk k pk mu c inve y lab pinf w p empl ww effort pinf4 r dr 
    pinfLAG1 pinfLAG2 ygap a as b g ls qs ps ms scons sinv sy slab spinf sw 
    kpf habf kp hab one

//**************************************************************************
// Modelbase Variables                                                   //*
        interest interestq inflation outputgap output;                   //*
//**************************************************************************

 
varexo ea eb y_ els eqs eps eas econs einv ey elab epinf ew em

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
//**************************************************************************


parameters calfa ctou cbeta chab ccs cinvs crelwage chabw clabeff chlab csadjcost 
           csigma chabb cprobw clandaw csigl cprobp cindw cindp cfc cinvdyn 
           czcap csadjlab crpi crdpi crr cry crdy crhoa crhoas crhob crhog 
           crhols crhoqs crhops crhoms crhoy crhocons crhoinv crhopinf crhow 
           crholab cscaleea cscaleeas cscaleeb cscaleeg cscaleels cscaleeqs 
           cscaleeps cscaleem cscaleecons cscaleeinv cscaleey cscaleelab 
           cscaleepinf cscaleew 

//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        std_r_ std_r_quart;                                              //*
                                                                         //*
// load Modelbase Monetary Policy Parameters                             //*
// Policy Rule Gerdesmeier and Roffia (2003)
cofintintb1 =  0.87^3; 
cofintintb2 = 0; 
cofintintb3 = 0; 
cofintintb4 = 0;
cofintinf0 = (1-0.87^3)*1.93; 
cofintinfb1 = 0; 
cofintinfb2 = 0; 
cofintinfb3 = 0; 
cofintinfb4 = 0; 
cofintinff1 = 0; 
cofintinff2 = 0; 
cofintinff3 = 0; 
cofintinff4 = 0;
cofintout = (1-0.87^3)*0.28; 
cofintoutb1 = 0; 
cofintoutb2 = 0; 
cofintoutb3 = 0; 
cofintoutb4 = 0; 
cofintoutf1 = 0; 
cofintoutf2 = 0; 
cofintoutf3 = 0; 
cofintoutf4 = 0;
std_r_ =  1;        //1.0124*1.0238;
std_r_quart = 0.0808*.25*4*3.1479; //  use 0.0808*.25*4*3.1479 to replicate results from Kuester, Wieland 
                                                                         //*
                                                                         //*
//**************************************************************************

calfa       = 0.3;
ctou        = 0.025;
cbeta       = 0.99;
chab        = 0;
ccs         = 0.6;
cinvs       = 0.22;
crelwage    = 0;
chabw       = 0;
clabeff     = 0;
chlab       = 0;

csadjcost   = 6.7711;
csigma      = 1.3533;
chabb       = 0.5732;
cprobw      = 0.7367;
clandaw     = 1.5;
csigl       = 2.3995;
cprobp      = 0.9082;
cindw       = 0.7627;
cindp       = 0.4694;
cfc         = 1.4077;
cinvdyn     = 1;
czcap       = 0.1690;
csadjlab    = 0.5990;

// reaction function
crpi        = 1.6841;
crdpi       = 0.1398;
crr         = 0.9613;
cry         = 0.0988;
crdy        = 0.1586;

// AR(1) shocks
crhoa       = 0.8232;
crhoas      = 0.9238;
crhob       = 0.8545;
crhog       = 0.9493;
crhols      = 0.8894;
crhoqs      = 0.9273;
crhops      = 0;
crhoms      = 0;
crhoy       = 0;
crhocons    = 0;
crhoinv     = 0;
crhopinf    = 0;
crhow       = 0;
crholab     = 0;

// scaling factor of the innovations
cscaleea    = 0.5978;
cscaleeas   = 0.0165;
cscaleeb    = 0.3361;
cscaleeg    = 0.3247;
cscaleels   = 3.5197;
cscaleeqs   = 0.0851;
cscaleeps   = 0;
cscaleem    = 0.0808;
cscaleecons = 0;
cscaleeinv  = 0.6043;
cscaleey    = 0;
cscaleelab  = 0;
cscaleepinf = 0.1602;
cscaleew    = 0.2892;

model(linear);

//**************************************************************************
// Modelbase Variables                                                   //*
interest   = interestq * 4;                                              //*
interestq  = r;                                                          //*
inflation  = pinf4;                                                      //*
outputgap  = ygap;                                                       //*
output     = y;                                                          //*
                                                                         //*
// Policy Rule                                                           //*
interestq =   cofintintb1*interestq(-1)                                  //* 
            + cofintintb2*interestq(-2)                                  //*
            + cofintintb3*interestq(-3)                                  //*
            + cofintintb4*interestq(-4)                                  //*
            + cofintinf0/4*inflation                                     //*
            + cofintinfb1/4*inflation(-1)                                //*
            + cofintinfb2/4*inflation(-2)                                //*
            + cofintinfb3/4*inflation(-3)                                //*
            + cofintinfb4/4*inflation(-4)                                //*
            + cofintinff1/4*inflation(+1)                                //*
            + cofintinff2/4*inflation(+2)                                //*
            + cofintinff3/4*inflation(+3)                                //*
            + cofintinff4/4*inflation(+4)                                //*
            + cofintout/4*outputgap  	                                 //*
            + cofintoutb1/4*outputgap(-1)                                //*
            + cofintoutb2/4*outputgap(-2)                                //*
            + cofintoutb3/4*outputgap(-3)                                //*
            + cofintoutb4/4*outputgap(-4)                                //*
            + cofintoutf1/4*outputgap(+1)                                //*
            + cofintoutf2/4*outputgap(+2)                                //*
	        + cofintoutf3/4*outputgap(+3)                                //*
            + cofintoutf4/4*outputgap(+4)                                //*
            + std_r_quart * interest_;                                   //*
//**************************************************************************
// Original Model Code:

mcf      =   calfa*rkf + (1-calfa)*wf - a;
zcapf    =   (1/czcap)*rkf;
rkf      =   wf + labf - kf;
kf       =   kpf(-1) + zcapf;
invef    =   (1/(1+cinvdyn*cbeta))*((cinvdyn*invef(-1) + cbeta*invef(+1)) + (1/csadjcost)*pkf) + 0*sinv;
pkf      = - muf - 1*b + muf(+1) + (1-cbeta*(1-ctou))*rkf(+1) + 0*(1-cbeta*(1-ctou))*zcapf(+1) + cbeta*(1-ctou)*pkf(+1) + qs;
muf      =   muf(+1) + rf - pinff(+1) - b;
muf      = - csigma*((1-chab)/(1-chab-chabb))*cf + csigma*(chabb/(1-chab-chabb))*habf;
yf       =   ccs*cf + cinvs*invef + g;
yf       =   cfc*(calfa*kf + (1-calfa)*labf + a);
mcf      = - 0*ps - 0*(1+cbeta*cindp)*(1/((1-cprobp)*(1-cbeta*cprobp)/(cprobp)))*spinf;
wf       = - 1*muf - 1*ls + csigl*labf;
pf       =   0*pf(-1) + pinff;
emplf    =   emplf(-1) + 1*emplf(+1)- 1*emplf + ((1-csadjlab)*(1-csadjlab)/csadjlab)*effortf;
rrf      =   rf - pinff(+1);
effortf  =   labf - emplf;
pinff    =   0;
mc       =   calfa*rk+(1-calfa)*w - a - slab;
zcap     =   (1/czcap)*rk - 0*(1/czcap)*pk;
rk       =   w + lab - k;
k        =   kp(-1) + zcap;
inve     =   (1/(1+cinvdyn*cbeta))*((cinvdyn*inve(-1) + cbeta*inve(+1)) + (1/csadjcost)*pk) + 1*sinv;
pk       = - mu - 1*b - 0*(1-crhols)*ls - 0*scons+mu(+1) + 0*b(+1) + (1-cbeta*(1-ctou))*rk(+1) + 0*(1-cbeta*(1-ctou))*zcap(+1)
             + cbeta*(1-ctou)*pk(+1) + qs + 0*sinv;
mu       =   mu(+1) + r - pinf(+1) - b + 0*b(+1) - scons - 0*(1-crhols)*ls;
mu       = - csigma*((1-chab)/(1-chab-chabb))*c + csigma*(chabb/(1-chab-chabb))*hab;
y        =   ccs*c + cinvs*inve + g + sy;
y        =   cfc*(calfa*k + (1-calfa)*lab + a + slab);
pinf     =   0*as + (1/(1+cbeta*cindp))*((cbeta)*(pinf(+1) - 0*as(+1)) + (cindp)*(pinf(-1) - 0*as(-1)) 
             + ((1-cprobp)*(1-cbeta*cprobp)/(cprobp))*(mc+ps) + 0*0.1*ps)+ spinf;
w        =   ((1/(((1+cbeta)*cprobw*((clandaw/(1-clandaw))*csigl-1+crelwage)/(1-cprobw))+crelwage+crelwage*cprobw*cbeta*(chabw-1))))
             *(((cprobw*((clandaw/(1-clandaw))*csigl-1+crelwage))/(1-cprobw)+crelwage+crelwage*(chabw-1))*w(-1)
             + (cbeta)*((cprobw*((clandaw/(1-clandaw))*csigl-1+crelwage))/(1-cprobw))*w(+1)
             + (cindw)*(cprobw/(1-cprobw))*((clandaw/(1-clandaw))*csigl-1+crelwage)*(pinf(-1)-0*as(-1))
             - (cindw*cbeta*cprobw*(cprobw/(1-cprobw))*((clandaw/(1-clandaw))*csigl-1+crelwage)
             + (cprobw/(1-cprobw))*((clandaw/(1-clandaw))*csigl-1+crelwage)
             + cprobw*cbeta*cindw*((clandaw/(1-clandaw))*csigl-1))*(pinf - 0*as)
             + (cbeta*cprobw)*(((cprobw/(1-cprobw))*((clandaw/(1-clandaw))*csigl-1+crelwage))
             + ((clandaw/(1-clandaw))*csigl-1))*(pinf(+1) - 0*as(+1))
             + (1-cbeta*cprobw)*(w + 1*mu + 1*ls - clabeff*effort - csigl*(1/(1-chlab))*lab + csigl*(chlab/(1-chlab))*lab(-1)))
             + 0*(1/(1+cbeta))*1*ls + 1*sw;
p        =   0*p(-1) + pinf;
empl     =   empl(-1) + 1*empl(+1) - 1*empl - 0*r + 0*pinf(+1) + 0*csadjlab*effort + ((1-csadjlab)*(1-csadjlab)/csadjlab)*effort
             + 0.0*(a(-1) + cbeta*a(+1) - (1+cbeta)*a);
ww       =   w + 0*(lab - empl);
effort   =   lab - empl;
dr       =   r - r(-1);
pinfLAG1 =   pinf(-1);
pinfLAG2 =   pinfLAG1(-1);
pinf4    =   pinf + pinfLAG1 + pinfLAG2 + pinfLAG2(-1);
ygap     =   y - yf;
a        =   crhoa*a(-1) + cscaleea*ea;
as       =   crhoas*as(-1) + cscaleeas*eas;
b        =   crhob*b(-1) + cscaleeb*eb;
//g        =   crhog*g(-1) + cscaleeg*fiscal_;
g        =   crhog*g(-1) + fiscal_;
ls       =   crhols*ls(-1) + cscaleels*els;
qs       =   crhoqs*qs(-1) + cscaleeqs*eqs;
ps       =   crhops*ps(-1) + cscaleeps*eps;
ms       =   crhoms*ms(-1) + cscaleem*em; //Monetary policy innovation
scons    =   crhocons*scons(-1) + cscaleecons*econs;
sinv     =   crhoinv*sinv(-1) + cscaleeinv*einv;
sy       =   crhoy*sy(-1) + cscaleey*ey;
slab     =   crholab*slab(-1) + cscaleelab*elab;
spinf    =   crhopinf*spinf(-1) + cscaleepinf*epinf;
sw       =   crhow*sw(-1) + cscaleew*ew;
kpf      =   (1-ctou)*kpf(-1) + ctou*invef(-1);
habf     =   chab*habf(-1) + (1-chab)*cf(-1);
kp       =   (1-ctou)*kp(-1) + ctou*inve(-1);
hab      =   chab*hab(-1) + (1-chab)*c(-1);
one      =   0*one(-1);
end;


shocks;
var interest_ = 1; // set equal to one for IRF

end;


stoch_simul (irf = 41, ar=0, nograph, noprint) inflation outputgap interest;