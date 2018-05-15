//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Journal of Economic Behavior & Organization, vol. 83(3), 2015, pp. 523-541.
//**************************************************************************

//**************************************************************************
// Replication of "Monetary Policy and Risk Taking"
// 
// Ignazio Angeloni, Ester Faia and Marco Lo Duca 
// 
// Journal of Economic Dynamics and Control, vol. 52 Issue C, 2015, pp. 285-307
//**************************************************************************

global mcss SIG ALFA PHI CoY zss;  

var c pai rn k z y mc n q inv rok a g uc un Fk Fn bk d deprat ra br fai rd crun cpai rsh;  
varexo ua ug ur;                           
//------------------------------------------------------------------------------------------------------------------------

//2. Parameter declaration

//------------------------------------------------------------------------------------------------------------------------
parameters PSI calvo ritcapss YoK IoK CoY PAIss css rnss kss zss yss mcss nss qss invss rokss gss ucss unss Fkss Fnss bkss dss depratss rass brss faiss rdss crunss cpaiss XXss OMP SIG PHI BETTA RHOa ALFA RHOg GY OMK THETA  DELTA EPSI  BET HH vP vY vQ vR VV CR a_ss;

a_ss	= 0;
SIG     = 1;			%intertemporal elasticity of consumption
PHI     = 3;			%labour elasticity
OMK     = 2;			%adjustment cost parameter
EPSI 	= 6;			%elasticity of demand
RHOa    = 0.95;         %persistence productivity shock
RHOg    = 0.9;          %persistence gov spending shock
BETTA   = 0.995;         %discount rate
ALFA    = 1/3;			%capital share
PAIss	= 1;			%s.s. GROSS quarterly inflation rate
DELTA   = 0.025;        %capital depreciation
GY      = 0.2;          %gov spend output ratio
calvo=0.75;             %price stickiness
CR=0.10;                 %cost of run 
BET     = 0.45;          %liquidity ratio
HH	= 0.40;              %dispersion of uniform distriution, in the paper the variable that represents the range of the shock which is added to bank returns 'h'
VV	= PHI;          
THETA=0.97;            %probability exit bankers


//Policy Rule parameters
vP      = 1.5;
vY      = (0.5)/4;
vQ      = 0;
vR      = 0;


//calibrations steady state


stst2=fsolve(@(stst2) (1-BETTA*(stst2+HH)/(2-BET+CR*(1+BET)))-THETA*((1-BETTA*(stst2+HH)/(2-BET+CR*(1+BET)))+(stst2+HH-(stst2+HH)/(2-BET        ))^2/(8*HH)-0.135)-0, [1]);
rass=stst2;
qss=1;
zss=rass-(1-DELTA);
rokss=zss+(1-DELTA);
rnss=PAIss/BETTA;
mcss=(EPSI-1)/EPSI;
YoK=zss/(mcss*ALFA);
IoK=DELTA;
IoY=IoK/YoK;
CoY=1-GY-IoY;
//stst=fsolve(@SteadyState_ynonlin, [1]);
//yss=stst;
//nss=(1-ALFA)*mcss/(PHI*CoY^SIG*yss^(SIG-1)+(1-ALFA)*mcss);
CoK=CoY*YoK;
XXss=((1-ALFA)*(mcss/VV)*YoK/CoK);                              %with U = log(C) + vlog(1-N)
nss = XXss/(1+XXss);
kss=YoK^(1/(ALFA-1))*nss;
bkss=(1-BETTA*(rass+HH)/(2-BET+CR*(1+BET)))*qss*kss;
depratss=BETTA*(rass+HH)/(2-BET+CR*(1+BET));
dss=depratss*qss*kss;
brss=(1/2)*(1-(rass-rnss*depratss)/HH);
yss = (kss^ALFA)*(nss^(1-ALFA))-CR*brss*rass*kss;
Fkss=ALFA*YoK;
Fnss=(1-ALFA)*yss/nss;
invss=IoK*kss;
gss=GY*yss;
css=CoY*yss;
ucss=css^(-SIG);
unss=PHI/(nss-1);
ritcapss=(rass+HH-rnss*depratss)^2/(8*HH);
faiss=brss*(.25*(1+BET)*(1-CR)*(rnss+(rass-HH)/depratss));                    %risk premium on deposits 
rdss=rnss*(1-faiss);                                                          %Return on deposits with risk
 
OMP     = yss*(EPSI-1)*calvo/((1-BETTA*calvo)*(1-calvo));
//PSI=THETA*qss*kss*(-0.075);
PSI=THETA*qss*kss*(-0.135);
crunss=CR*brss*rass*qss*kss;
cpaiss=0;
//------------------------------------------------------------------------------------------------------------------------

//3. Defining the model

//------------------------------------------------------------------------------------------------------------------------

model;
// 1.Marginal utility consumption
uc=c^(-SIG);

// 2.MU labour
un=PHI*(1/(n-1)); 

// 3.Marginal productivity capital
Fk=ALFA*y/k(-1);// 

// 4.MP labour
Fn=(1-ALFA)*y/n;  

// 5.Productivity shock
a=RHOa*a(-1)+ua;  

// 6.Gov spending shock
(g/gss)=(g(-1)/gss)^(RHOg)*exp(ug); 

// 7.Euler
uc=BETTA*uc(+1)*rd; 

//8. Return on deposits
rd =   (rn*(1-fai))/pai(+1);                                                              

// 9.Marginal cost
mc*Fn=-un/uc; 

// 10.FOC on k
mc*Fk=z; 

// 11.Tobin's q
q=(1-OMK*(inv/k(-1)-DELTA))^(-1); 

// 12.Return on capital
ra/pai(+1)=rok(+1)/q;

// 13.Return on capital (unitary)
rok=z+q*(1-DELTA+OMK*(inv/k(-1)-DELTA)*inv/k(-1)-OMK/2*(inv/k(-1)-DELTA)^2); 

// 14.Philipps curve
uc*pai*(pai-PAIss)=BETTA*uc(+1)*pai(+1)*(pai(+1)-PAIss)+uc*(exp(a))*k(-1)^ALFA*n^(1-ALFA)*(EPSI/OMP)*(mc-((EPSI-1)/EPSI));

// 15.Capital accumulation  
k=(1-DELTA)*k(-1)+inv-OMK/2*(inv/k(-1)-DELTA)^2*k(-1); 

// 16.Resource constraint
y=c+inv+cpai+crun+g;

// 17.Cost of inflation
cpai=(OMP/2)*(pai-PAIss)^2;

// 18.Cost of run
crun=CR*br*ra*q*k;

// 19.Taylor rule
log(rn/rnss)=vR*log(rn(-1)/rnss)+(1-vR)*(vP*log(pai/PAIss)+vQ*log(q/qss)+vY*log((y-crun)/yss))+rsh;

// 20. Monetary policy shock
//rsh=0.3*rsh(-1)+ur; 
rsh=0.2*rsh(-1)+ur; 

// 21.Production function
y=exp(a)*(k(-1)^ALFA)*(n^(1-ALFA)); 

// 22.Optimal bank capital    
bk=(1-(1/rn)*(ra+HH)/(2-BET+CR*(1+BET)))*q*k(-1);

// 23.Total loans
d+bk=q*k(-1);

// 24.Accumulation of bank capital
bk(+1)=THETA*(bk+((ra(+1)+HH-(ra(+1)+HH)/(2-BET))^2/(8*HH))*q(+1)*k)+PSI; 

// 25.Deposit ratio
deprat=d/(q*k(-1));

// 26.Bank riskiness
br=(1/2)*(1-(ra-rn*deprat)/HH); 

// 27. Premium on deposits
fai= br*(.25*(1+BET)*(1-CR)*(rn+(ra-HH)/deprat));                                                                      

end;

shocks;
var ua=1;
var ug=0;
var ur=1;
end;

steady_state_model;
c = css;
pai = PAIss;
rn = rnss;
k = kss;
z = zss;
y = yss+crunss;
mc = mcss;
n = nss;
q = qss;
inv = invss;
rok = rokss;
a = a_ss;
g = gss;
uc = ucss;
un = unss;
Fk = Fkss;
Fn = Fnss;
bk = bkss;
d = dss;
deprat = depratss;
ra = rass;
br = brss;
fai = faiss;                     
rd = rdss;                                                          
crun = crunss;
cpai = cpaiss;
rsh = 0;
end;

steady(nocheck);

//Computes IRF
stoch_simul(irf=41,order=1, nograph) y pai c inv deprat br;
