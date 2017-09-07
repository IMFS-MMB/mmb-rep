% Cogley, Primiceri & Sargent (2010)
%
% Balint Tatar
% Frankfurt am Main, 2016

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables and parameters
%----------------------------------------------------------------


var p y lambdda w R z lambddap pit b ystar lambddastar wstar Rstar inflgap realR outpgap;

varexo Rs zs lambddaps pits bs;

parameters niu lambddapss iotap rhopit gamma100 pss100 Fbeta hparam xip fp fy rhoR rhoz rholambddap rhob sdr sdz sdlambddap sdpit sdb gamma betta rss rss100 expg;



%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------


%Calibrated parameters
niu=2;
lambddapss=0.1;
iotap=0;
rhopit=0.995; 

%Estimated parameters



/*
%Values from page 60 for the period 1960-1979
gamma100=0.468;	
pss100=0.501;	
Fbeta=0.159;	
hparam=0.445;	
xip=0.782;	
fp=1.557;	
fy=0.643;	
rhoR=0.704;	
rhoz=0.264;	
rholambddap=0.598;	
rhob=0.699;	
sdr=0.160;	
sdz=0.641;	
sdlambddap=0.118;	
sdpit=0.081;	
sdb=2.533;
*/


%Counterfactual
%Values from page 60 for the period 1960-1979, fp changed from 1.557 to 1.784
gamma100=0.468;	
pss100=0.501;	
Fbeta=0.159;	
hparam=0.445;	
xip=0.782;	
fp=1.784;	
fy=0.643;	
rhoR=0.704;	
rhoz=0.264;	
rholambddap=0.598;	
rhob=0.699;	
sdr=0.160;	
sdz=0.641;	
sdlambddap=0.118;	
sdpit=0.081;	
sdb=2.533;


/*
%Values from page 60 for the period 1982-2006
gamma100=0.484;	
pss100=0.516;	
Fbeta=0.255;	
hparam=0.526;	
xip=0.800;	
fp=1.784;	
fy=0.66;	
rhoR=0.633;	
rhoz=0.297;	
rholambddap=0.255;	
rhob=0.876;	
sdr=0.069;	
sdz=0.493;	
sdlambddap=0.126;	
sdpit=0.049;	
sdb=2.429;
*/






%Steady state values:
gamma=gamma100/100;
betta=100/(Fbeta+100);
rss=exp(gamma)/betta-1;
rss100=rss*100;


expg=exp(gamma);


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model (linear); 


% eq 1, Phillips Curve (p)
p -betta/(1+iotap*betta)*p(+1) -lambddap -((1-betta*xip)*(1-xip)/((1+iotap*betta)*xip*(1+niu*(1+1/lambddapss))))*w=iotap/(1+iotap*betta)*p(-1); 

% eq 1b, the corresponding equation for the "star" economy
wstar=0;

% eq 2, marginal utility of consumption
(expg-hparam*betta)*(expg-hparam)*lambdda -(expg-hparam*betta*rhob)*(expg-hparam)*b -(betta*hparam*expg*rhoz-hparam*expg)*z +(expg^2+betta*hparam^2)*y -betta*hparam*expg*y(+1)=expg*hparam*y(-1);


% eq 2b
(expg-hparam*betta)*(expg-hparam)*lambddastar -(expg-hparam*betta*rhob)*(expg-hparam)*b -(betta*hparam*expg*rhoz-hparam*expg)*z + (expg^2+betta*hparam^2)* ystar -betta*hparam*expg*ystar(+1)=expg*hparam*ystar(-1);


% eq 3, euler equation
lambdda-R-lambdda(+1)+p(+1)+rhoz*z=0;


% eq 3b
lambddastar-Rstar-lambddastar(+1)+rhoz*z=0;


% eq 4, labor supply equation
w-b-niu*y+lambdda=0;


% eq 4b
wstar-b-niu*ystar+lambddastar=0;



% eq 5, MP rule
R -(1-rhoR)*fp/4*p +(1-rhoR)*(fp)*pit -(1-rhoR)*fy*y +(1-rhoR)*fy*ystar = rhoR*R(-1) +(1-rhoR)*fp/4*p(-1) +(1-rhoR)*fp/4*p(-2) +(1-rhoR)*fp/4*p(-3)+Rs;



% eq 6 - 9, exogenous shocks
z=rhoz*z(-1)+zs;
lambddap=rholambddap*lambddap(-1)+lambddaps;
pit=rhopit*pit(-1)+pits;
b=rhob*b(-1)+bs;



%definition of inflation gap
inflgap=p-pit;

%definition of real interest rate
realR=R-p;

%output gap
outpgap=y-ystar;

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

steady;
resid(1);

shocks;
%var Rs = sdr^2; 
%var Rs = 1; 
%var zs = sdz^2;
%var lambddaps = sdlambddap^2;
%var pits = sdpit^2;
var pits = 1;
%var bs = sdb^2;
end;



stoch_simul(order=1,irf=17,solve_algo=1) inflgap realR;



