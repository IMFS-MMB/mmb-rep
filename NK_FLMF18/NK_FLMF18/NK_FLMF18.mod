%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code to replicate the baseline model of:
% Monetary policy spillovers, global commodity prices and cooperation
% by A. Filardo, M. Lombardi, C. Montoro and M. Ferrari
% Paper: https://www.bis.org/publ/work696.pdf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


var GG NGG Y C CY TY PI PIY MC 
WP L R O OC OY X Q Z OMEGA A G ETA NY NC NCY 
NTY NPI NN DD NPIY DELTA NMC NWP NL NR NO NOC
 NOY NX NQ NZ NOMEGA NA NETA NY_aux Y_aux NYn Yn Yn_gap 
Y_gap NYe Ye NYfe Yfe NRn Rn NRe Re NRfe Rfe UTIL WELF ERR Z_CB 
ETA_CB A_CB G_CB Yfe_CB Y_gap_CB Rfe_CB ERR_CB ERR_CBS
EYG EPI ERE EPIC R1 R2 ERN EY EYNG;


varexo EZ, EOMEGA, EA, EG, EERR, EGG;

parameters scale_Y XI GAMMA KAPPA ALPHA NU PHI_HEAD PHI_CORE PHI_COMM RHO_Z RHO_OMEGA RHO_A RHO_ERR SZ SOMEGA SA SERR SERR_Z SERR_OMEGA SERR_A SERR_G ES MU EPS BETA THETA ZS AS RHO_G SG PHI_BENCH PHI_NAT PHI_EFF PHI_Y PHI_Yn PHI_Yfe Y_gapS M1_a M1_b M1_c M1 M2_a M2_b M2_c M2 PHI_MISP_a PHI_MISP_b PHI_MISP_c CORR_Z_ETA S_Z_ETA PHI_CB Z_CBS Yfe_CBS YfeS Y_gap_CBS Rfe_CBS RfeS YS NOMEGAS isexp;

% Main parameters
scale_Y=1;    %scaling of CB response to output gap
GAMMA=0.1;    %foreign share in CPI
XI=1-GAMMA;   
ALPHA = 0.1;  %share of commodity in production
NU    = 0.5;  %elasticity of labor
EPS   = 7.67; %elasticity of substitution (good market)
MU    = EPS/(EPS-1);    %markup
BETA  = 0.99; %fiscount factor
THETA = 0.75; %clavo probability  
KAPPA = (1-THETA)/THETA*(1-BETA*THETA);

%Monetary policy parameters; reactions to headline inflation, core inflation,
%commodity price and relevant output gap
isexp=1;        %=1 to use Taylor rule with expectations, =0 to use standard Taylor rule
PHI_HEAD = 0;
PHI_CORE = 1.5;
PHI_COMM = 0.05;
PHI_Yn    = 0.5*scale_Y;
PHI_Yfe   = 0.5*scale_Y;
PHI_Y     = 0.5*scale_Y;

PHI_CB    = 0; %=1 for monetary policy misperception

%Select model based on natural rate and output gap (benchmark, natural, 
%efficient) based on equations 3.2 to 3.9

PHI_BENCH = 0;
PHI_NAT   = 0;
PHI_EFF   = 1;

% Parameters steady state

AS  = 1;
ZS  = 1;
ES  = 0.01;

% Parameters shocks
%AR components
RHO_Z 	   = 0.5*0+0.95;  %commodity productivity shock
RHO_OMEGA  = 0.5*0+0.5;   %number of fringe exporters shock  
RHO_A      = 0.5*0+0.5;   %TFP process (commodity importer)   
RHO_G      = 0.5;         %Consumers' preference shock (commodity importer)
RHO_GG      = 0.5;        %Gov. speding (commodity importer)
RHO_ERR    = 0.5;         %Mon. policy shock (commodity importer)  
%standard deviations and autocorrelations
SZ   	   = 0.01;
SOMEGA     = 0.01;
SA         = 0.01;
SG         = 0.01;
SERR       = 0.01;
SERR_Z     = -0.2*0; 
SERR_OMEGA = -0.2*0;
SERR_A     = -0.2*0;
SERR_G     = -0.2*0;

% Parameters signal-extraction problem

%select correct mispercetion exercise (A, B, C)
PHI_MISP_a = 0;
PHI_MISP_b = 0;
PHI_MISP_c = 0;
 
CORR_Z_ETA = 0.5530*0+0.5;        % : corr(zeta,eta)
S_Z_ETA    = 1.533*0+50*0+0.5;    % : sd_z/sd_eta

M1_a = 0;             %M matrix under case a (x->0)
M2_a = (1-NETA)/NETA;

M1_b = -1;             %M matrix under case a (x->inf)
M2_b = 0;

M1_c = (NETA/(1-NETA)*CORR_Z_ETA - S_Z_ETA)*S_Z_ETA/(S_Z_ETA^2-2*NETA/(1-NETA)*CORR_Z_ETA*S_Z_ETA+(NETA/(1-NETA))^2)*0-1/2;             %M matrix under general case
M2_c = (NETA/(1-NETA)/S_Z_ETA - CORR_Z_ETA)*S_Z_ETA/(S_Z_ETA^2-2*NETA/(1-NETA)*CORR_Z_ETA*S_Z_ETA+(NETA/(1-NETA))^2)*0+1/2;

M1 = M1_a*PHI_MISP_a + M1_b*PHI_MISP_b + M1_c*PHI_MISP_c; % M matrix
M2 = M2_a*PHI_MISP_a + M2_b*PHI_MISP_b + M2_c*PHI_MISP_c;  

% Steady state values
% These parameters are defined in the steady state file
Y_gapS  = Y_gap;
Z_CBS   = Z_CB;
Yfe_CBS = Yfe_CB;
YfeS    = Yfe;
Y_gap_CBS = Y_gap_CB;
Rfe_CBS = Rfe_CB;
RfeS    = Rfe;
YS      = Y;
NOMEGAS = NOMEGA;



model;


% Aggregate demand

//TYS*(TY+Y) = CS*C + QS*OYS*(Q+OY)+G;
NTY*NY  = (NC + NQ*NOY)*NGG; 

//Euler condition (commodity importer)
//C - C(+1)  = -(R-PI(+1));
1 = BETA*NR*exp(G(+1))/exp(G)*(NC(+1)/NC)^(-1)/NPI(1);

//Demand for goods
//C = (1-GAMMA)*CY+GAMMA*OC;
NC   = NCY^(1-GAMMA)*(NOC^GAMMA);

//Relative price
//0 = (1-GAMMA)*TY+GAMMA*Q;
1 = NTY^(1-GAMMA)*NQ^GAMMA;


% Aggregate supply

//CPI
//PI = (1-GAMMA)*PIY+GAMMA*(Q-Q(-1)+PI);
NPI = NPIY^(1-GAMMA)*(NQ/NQ(-1)*NPI)^GAMMA;

//Recursive Phillips curve
//PIY = KAPPA*MC + BETA*PIY(+1);
DD = NY/NC + THETA*BETA*(NPIY(+1)^(EPS-1)*DD(+1));
NN = MU*NY/NC*NMC + THETA*BETA*(NPIY(+1)^(EPS)*NN(+1));
THETA*(NPIY)^(EPS-1) = 1-(1-THETA)*(NN/DD)^(1-EPS);

DELTA = (1-THETA)*(NN/DD)^(-EPS) + THETA*DELTA(-1)*(NPIY)^EPS; 

//Marginal cost
//MC = (1-ALPHA)*WP + ALPHA*Q-A;
NMC  = NWP^(1-ALPHA)*NQ^(ALPHA)/(NA*(1-ALPHA)^(1-ALPHA)*ALPHA^ALPHA);

% Labour market

//Supply of labor
//WP = C + NU*L;
NWP = NC*NL^NU;

//Demand for labor
//L = MC - WP +Y;
NL =(1-ALPHA)*NMC/NWP*NY*DELTA;


% Monetary policy

//Standard taylor rule without expectations
R1 = (-ln(BETA) + PHI_HEAD*PI+ PHI_CORE*PIY + PHI_COMM*(Q-Q(-1)) + PHI_Y*(Y-YS))*PHI_BENCH +(Rn +PHI_HEAD*PI + PHI_CORE*PIY +PHI_COMM*(Q-Q(-1))+ PHI_Yn*Yn_gap)*PHI_NAT + (Rfe + PHI_HEAD*PI + PHI_CORE*PIY +PHI_COMM*(Q-Q(-1))+ PHI_Yfe*(Y_gap-Y_gapS))*PHI_EFF + ERR + ERR_CBS*PHI_CB;

//Taylor rule with expectations
R2 = (-ln(BETA) + PHI_HEAD*EPI(-1) + PHI_CORE*EPIC(-1) + PHI_COMM*(Q-Q(-1)) + PHI_Y*(EY(-1)-YS))*PHI_BENCH +(ERN(-1) +PHI_HEAD*EPI(-1) + PHI_CORE*EPIC(-1) +PHI_COMM*(Q-Q(-1))+ PHI_Yn*EYNG(-1))*PHI_NAT + (ERE(-1) + PHI_HEAD*EPI(-1)+ PHI_CORE*EPIC(-1) +PHI_COMM*(Q-Q(-1))+ PHI_Yfe*(EYG(-1)-Y_gapS))*PHI_EFF + ERR + ERR_CB(-1)*PHI_CB;

//Actual rate (uses only one of the two)
R=isexp*R2+(1-isexp)*R1;

%Definition of expectations
EYG=Y_gap(+1);
EPI=PI(+1);
EPIC=PIY(+1);
ERE=Rfe(+1);
ERN=Rn(+1);
EY=Y(+1);
EYNG=Yn_gap(+1);

%Central bank error with expected variables
ERR_CB = (Rfe_CB(+1) - Rfe(+1)) + PHI_Yfe*((Y_gap_CB(+1) - Y_gap_CBS) - (Y_gap(+1)-Y_gapS));
%Central bank error withpout expected variables
ERR_CBS= (Rfe_CB - Rfe) + PHI_Yfe*((Y_gap_CB - Y_gap_CBS) - (Y_gap-Y_gapS));


% Signal-extraction

//Mispeception B x->0
Z_CB = M1*Q;
//Mispeception A x->Inf
ETA_CB = M2*Q;
//Mispeception C
A_CB = 0;     % Normalised to zero, for the analisys of only demand shocks
G_CB = 1*ETA_CB; % From the benchmark model.

% Commodity sector / countries

//Commodity demand
//OS*O = OCS*OC + OYS*OY - XS*X;
NO = NOC + NOY - NX;

//Commodity consumption demand
//OC = C - Q;
NOC  = GAMMA*NC/NQ;

//Commodity production demand
//OY = MC + Y - Q;
NOY = ALPHA*NMC/NQ*NY*DELTA;

//Supply of the fringe
//X  = OMEGA + Z + Q;
NX = NOMEGA*NQ*NZ;

//Commodity price
//Q  = - Z + XI/(XI-ETAS)*ETA;
NQ=((1/NZ)*(1/(1-(NETA/XI))))^(XI);

//Commodity markup
//NETA = NO/sqrt(NO^2 + 4*(NO+NX)*NX);
NETA=NO/(NO+2*NX);


% EXOGENOUS VARIABLES

//Commodity price shock (i.e. if negative price of commodity increases)
Z = RHO_Z*Z(-1) - EZ;
//Fringe size shock
OMEGA = RHO_OMEGA*OMEGA(-1) + EOMEGA;
//TFP shock (commodity importer)
A = RHO_A*A(-1) + EA;
//Preference shock (commodity importer)
G = RHO_G*G(-1) + EG;
//Monetary policy shock (commodity importer)
ERR = RHO_ERR*ERR(-1) + EERR;
//Government spending (demand) shock (commodity importer)
GG= RHO_G*GG(-1) + EGG;

% Vars in logs
Y = ln(NY);
C = ln(NC);
CY = ln(NCY);
TY = ln(NTY);
PI = ln(NPI);
PIY = ln(NPIY);
MC = ln(NMC);
WP = ln(NWP);
L = ln(NL);
NR = exp(R);
O = ln(NO);
OC = ln(NOC);
OY = ln(NOY);
X = ln(NX);
Q = ln(NQ);
Z = ln(NZ);
NOMEGA = NOMEGAS*exp(OMEGA); //OMEGA = ln(NOMEGA/NOMEGAS);
A= ln(NA);
GG= ln(NGG);
ETA = ln(NETA);

% WELFARE FUNCTION

UTIL = (ln(NC)-NL^(1+NU)/(1+NU))*exp(G);
WELF = UTIL+BETA*WELF(+1);

% BENCHMARK ALLOCATIONS

NY_aux = (NA/DELTA)^(1/(1-ALPHA))*(ALPHA*NMC*DELTA/NQ)^(ALPHA/(1-ALPHA))*((1-ALPHA)*NMC*DELTA/(NQ^(-GAMMA/(1-GAMMA))-ALPHA*NMC*DELTA))^(1/(1+NU));

Y_aux  = ln(NY_aux);

NYn = (NA)^(1/(1-ALPHA))*(ALPHA/MU/NQ)^(ALPHA/(1-ALPHA))*((1-ALPHA)/MU/(NQ^(-GAMMA/(1-GAMMA))-ALPHA/MU))^(1/(1+NU));
Yn  = ln(NYn);

Yn_gap = Y_aux-Yn;

NYe = (NA)^(1/(1-ALPHA))*(ALPHA/MU*NZ)^(ALPHA/(1-ALPHA))*((1-ALPHA)/MU/(NZ^(GAMMA/(1-GAMMA))-ALPHA/MU))^(1/(1+NU));
Ye  = ln(NYe);

NYfe = (NA)^(1/(1-ALPHA))*(ALPHA*NZ)^(ALPHA/(1-ALPHA))*((1-ALPHA)/(NZ^(GAMMA/(1-GAMMA))-ALPHA))^(1/(1+NU));
Yfe  = ln(NYfe);

Y_gap = Y_aux-Yfe;

Yfe_CB = (1/(1-ALPHA))*(A_CB) + ln((ALPHA*(exp(Z_CB))^(ALPHA/(1-ALPHA))*((1-ALPHA)/((exp(Z_CB))^(GAMMA/(1-GAMMA))-ALPHA))^(1/(1+NU))));

Y_gap_CB = Y_aux - Yfe_CB;

1 = BETA*NRn*exp(G(+1))/exp(G)*((1-ALPHA/MU*NQ(+1)^(GAMMA/(1-GAMMA)))*NYn(+1)/((1-ALPHA/MU*NQ^(GAMMA/(1-GAMMA)))*NYn))^(-1);

Rn =ln(NRn);

1 = BETA*NRe*exp(G(+1))/exp(G)*((1-ALPHA/MU*NZ(+1)^(-GAMMA/(1-GAMMA)))*NYe(+1)/((1-ALPHA/MU*NZ^(-GAMMA/(1-GAMMA)))*NYe))^(-1);

Re =ln(NRe);

1 = BETA*NRfe*exp(G(+1))/exp(G)*((1-ALPHA*NZ(+1)^(-GAMMA/(1-GAMMA)))*NYfe(+1)/((1-ALPHA*NZ^(-GAMMA/(1-GAMMA)))*NYfe))^(-1);

Rfe =ln(NRfe);

1 = BETA*exp(Rfe_CB)*exp(G_CB(+1))/exp(G_CB)*((1-ALPHA*(exp(Z_CB(+1)))^(-GAMMA/(1-GAMMA)))*(exp(Yfe_CB(+1)))/((1-ALPHA*(exp(Z_CB))^(-GAMMA/(1-GAMMA)))*(exp(Yfe_CB))))^(-1);

end;


steady ;
check;
%model_diagnostics;

shocks;
var EZ; stderr SZ;
%var EOMEGA; stderr SOMEGA;
%var EA; stderr SA;
%var EG; stderr SG;
var EGG; stderr SG;
%var EERR; stderr SERR;
%corr EERR, EZ = SERR_Z;
%corr EERR, EA = SERR_A;
%corr EERR, EG = SERR_G;
%corr EERR, EOMEGA = SERR_OMEGA;

end;

%SIMULATION
stoch_simul(noprint, irf=20, order=1, nograph) NY X Q R PI Y Y_gap;






