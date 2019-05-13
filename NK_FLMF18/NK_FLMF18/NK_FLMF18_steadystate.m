function [ys,check] = flm_base_IC_NL_steadystate(ys,exo)
% function [ys,check] = NK_baseline_steadystate(ys,exo)
% computes the steady state for the NK_baseline.mod and uses a numerical
% solver to do so
% Inputs: 
%   - ys        [vector] vector of initial values for the steady state of
%                   the endogenous variables
%   - exo       [vector] vector of values for the exogenous variables
%
% Output: 
%   - ys        [vector] vector of steady state values fpr the the endogenous variables
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impos restriction on parameters)

global M_ 

% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = deblank(M_.param_names(ii,:));
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;


%% Enter model equations here

options=optimoptions('fsolve'); %options=optimset(); % set options for numerical solver

%% The steady state computation

% %OLD
% % FF = [QS   - 1/ZS*(1/(1-ETAS))
% %       ETAS - OS/sqrt(OS^2 + 4*(DS*NOMEGAS/YS))
% %       TYS  - QS^(-GAMMA/(1-GAMMA))
% %       DS   - (GAMMA*TYS + (1-GAMMA)*ALPHA/MU)
% %       OS   - (DS/QS - NOMEGAS/YS*QS)
% %       OYS - ALPHA/MU/QS
% %       CS  - (TYS-QS*OYS)
% %       LS - ((1-ALPHA)/MU/CS)^(1/(1+NU))
% %       YS - (AS*(ALPHA/MU/QS)^ALPHA )^(1/(1-ALPHA))*LS];

%NEW
% FF = [QS   - 1/ZS*(1/(1-ETAS))
%       ETAS - OS/sqrt(OS^2 + 4*(OS+XS)*XS)
%       TYS  - QS^(-GAMMA/(1-GAMMA))
%       DS   - (GAMMA*TYS + (1-GAMMA)*ALPHA/MU)
%       OS   - (DS/QS - ES*QS)
%       XS   -  ES*QS];



%FF = @(xx) [xx(1) - 1/ZS*(1/(1-xx(2)))
FF = @(xx) [xx(1) - ((1/ZS)*(1/(1-(xx(2)/XI))))^(XI)
      xx(2) - xx(5)/sqrt(xx(5)^2 + 4*(xx(5)+xx(6))*xx(6))
      xx(3) - xx(1)^(-GAMMA/(1-GAMMA))
      xx(4) - (GAMMA*xx(3) + (1-GAMMA)*ALPHA/MU)
      xx(5) - (xx(4)/xx(1) - ES*xx(1))
      xx(6) - ES*xx(1)];
            
ETAS_guess = 0.494085386207276; %0.454732709204794; %0.4565;
%QS_guess   = 1/ZS*(1/(1-ETAS_guess));
QS_guess   = ((1/ZS)*(1/(1-(ETAS_guess/XI))))^(XI);
TYS_guess  = QS_guess^(-GAMMA/(1-GAMMA));
DS_guess  = (GAMMA*TYS_guess + (1-GAMMA)*ALPHA/MU);
OS_guess  = (DS_guess/QS_guess - ES*QS_guess);
XS_guess  =  ES*QS_guess;

xx0= [QS_guess,ETAS_guess,TYS_guess,DS_guess,OS_guess,XS_guess];

SOL=fsolve(FF,xx0,options);

NETA = SOL(2);
%NQ  = 1/ZS*(1/(1-NETA));    
NQ  = ((1/ZS)*(1/(1-(NETA/XI))))^(XI); 
NTY = (NQ)^(-GAMMA/(1-GAMMA));
OYS = ALPHA/MU/NQ;
CS  = NTY-NQ*OYS;
OCS = GAMMA*CS/NQ;

NL = ((1-ALPHA)/MU/CS)^(1/(1+NU));
NY = (AS*(ALPHA/MU/NQ)^ALPHA )^(1/(1-ALPHA))*NL;
NA = AS;
NPI = 1;
NPIY = 1;
DELTA =1;
NMC = 1/MU;
NC = CS*NY;
NOC = OCS*NY;
NOY    = OYS*NY;
NZ     = ZS;
NOMEGA = ES*NY/ZS; 
NX = NOMEGA*NQ*NZ;
NO = NOC + NOY -NX;
NN = 1/CS/(1-THETA*BETA);
DD = 1/CS/(1-THETA*BETA);
NWP = NC*NL^NU;
NCY = (CS*NY/(OCS*NY)^GAMMA)^(1/(1-GAMMA));
NGG=AS;

Y = log(NY);
C = log(NC);
CY = log(NCY);
TY = log(NTY);
PI = log(NPI);
PIY = log(NPIY);
MC = log(NMC);
WP = log(NWP);
L = log(NL);
O = log(NO);
OC = log(NOC);
OY = log(NOY);
X = log(NX);
Q = log(NQ);
Z = log(NZ);
OMEGA = 0;
G = 0;
A = log(NA); 
ETA = log(NETA);
ERR = 0;
GG=log(NGG);

UTIL = (log(NC)-NL^(1+NU)/(1+NU));
WELF = UTIL/(1-BETA);

NY_aux = NY;
Y_aux  = log(NY_aux);

NYn = NY;
Yn  = Y;

Yn_gap = Y_aux-Yn;

NYe = (AS)^(1/(1-ALPHA))*(ALPHA/MU*ZS)^(ALPHA/(1-ALPHA))*((1-ALPHA)/MU/(ZS^(GAMMA/(1-GAMMA))-ALPHA/MU))^(1/(1+NU));
Ye  = log(NYe);

NYfe = (AS)^(1/(1-ALPHA))*(ALPHA*ZS)^(ALPHA/(1-ALPHA))*((1-ALPHA)/(ZS^(GAMMA/(1-GAMMA))-ALPHA))^(1/(1+NU));
Yfe  = log(NYfe);

Y_gap = Y_aux-Yfe;

NRn = 1/BETA;
Rn = log(NRn);

NRe = 1/BETA;
Re = log(NRe);

NRfe = 1/BETA;
Rfe = log(NRfe);

Rfem1=Rfe;
Rnm1=Rn;

R =  -log(BETA) + ERR ;
NR = exp(R);

% The steady state as parameters


% keyboard
M1_a = 0;             %M matrix under case a (x->0)
M2_a = (1-NETA)/NETA;

M1_b = -1;             %M matrix under case a (x->inf)
M2_b = 0;

M1_c = (NETA/(1-NETA)*CORR_Z_ETA - S_Z_ETA)*S_Z_ETA/(S_Z_ETA^2-2*NETA/(1-NETA)*CORR_Z_ETA*S_Z_ETA+(NETA/(1-NETA))^2);             %M matrix under general case
M2_c = (NETA/(1-NETA)/S_Z_ETA - CORR_Z_ETA)*S_Z_ETA/(S_Z_ETA^2-2*NETA/(1-NETA)*CORR_Z_ETA*S_Z_ETA+(NETA/(1-NETA))^2);

M1 = M1_a*PHI_MISP_a + M1_b*PHI_MISP_b + M1_c*PHI_MISP_c; % M matrix
M2 = M2_a*PHI_MISP_a + M2_b*PHI_MISP_b + M2_c*PHI_MISP_c;  

Z_CB = M1*Q;
ETA_CB = M2*Q;
A_CB   = 0;
G_CB   = 1*ETA_CB;

Yfe_CB = (1/(1-ALPHA))*(A_CB) + log((ALPHA*(exp(Z_CB))^(ALPHA/(1-ALPHA))*((1-ALPHA)/((exp(Z_CB))^(GAMMA/(1-GAMMA))-ALPHA))^(1/(1+NU))));
Y_gap_CB = Y_aux - Yfe_CB;
Rfe_CB = -log(BETA);
ERR_CB = 0;
ERR_CBS=ERR_CB;
YS      = Y;
Y_gapS  = Y_gap;
Yfe_CBS = Yfe_CB;
YfeS    = Yfe;
Y_gap_CBS = Y_gap_CB;
Rfe_CBS   = Rfe_CB;
RfeS    = Rfe;
Z_CBS = M1*log(Q);
NOMEGAS = NOMEGA;
EYG=Y_gap;
EPI=PI;
ERE=Rfe;
EPIC=PIY;
R1=R;
R2=R;
ERN=Rn;
EY=Y;
EYNG=Yn_gap;
% if exitflag <1
%     %indicate the SS computation was not sucessful; this would also be detected by Dynare
%     %setting the indicator here shows how to use this functionality to
%     %filter out parameter draws
%     check=1; %set failure indicator
%     return; %return without updating steady states
% end

for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'M_.params(' num2str(iter) ') = ' M_.param_names(iter,:) ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = deblank(M_.endo_names(ii,:));
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end
