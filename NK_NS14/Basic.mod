clc;
close all;

%----------------------------------------------------------------
% Varialbles
%----------------------------------------------------------------
var c cf r p pf pi q piH y tau piF yf pF 
pH pif g gf piag yag gag L Lf w wf s sf;
varexo eg egf er;

%----------------------------------------------------------------
% Parameters
%----------------------------------------------------------------
parameters sigma alpha beta nu aa eta theta nn phiH 
phiF phiHstar phiFstar Gbar Cbar phiPi phiY rhoii phiG phi_c phi_i phi_p rhoG kappa psi_v zeta taubar;

sigma = 1;       % Intertemporal elastisity of substitution
alpha = 0.75;    % Calvo parameter
beta = 0.99;     % Subjective discount factor
nu = 1;          % Frish elasticity of labor suppy
aa = 0.67;        % Curvature of production function
eta = 2;         % Elasticity of substitution between home and foreign goods
theta = 7;       % Elasticity of substitution between varieties
nn = 0.1;        % Size of home region
phiH = 0.69;     % Weight of home goods in home consumption basket
phiF = 1-phiH;   % Weight of foreign goods in home consumption basket
phiHstar = phiF*nn/(1-nn);  % Weight of home goods in foreign consumption basket
phiFstar = 1 - phiHstar;    % Weight of foreign goods in foreign consumption basket
Gbar = 0.2;     % Steady state government spending - output ratio
Cbar = 1 - Gbar; % Steady state consumption-output ratio
phiPi = 1.5;     % Inflation response in Taylor Rule
phiY  = 0.5;     % Output response in Taylor Rule
rhoii = 0.8;     % Lagged dependence in Taylor Rule
phiG  = 0.0;    % Direct response of monetary policy to fiscal shock
phi_c = 1;       % Consumption elasticity of money demand
phi_i = 1;       % Interest elasticity of money demand
phi_p = 0.025;     % Response to price level in Wickselling rule
rhoG = 0.933;     % Persistence of government spending shock
corrG = 0.0;       % Correlation of home and foreign gov spending shocks
kappa = (1-alpha)*(1-alpha*beta)/alpha;
psi_v = (1+1/nu)/aa - 1;
zeta  = 1/(1+psi_v*theta);
taubar=0;

%----------------------------------------------------------------
% Model
%----------------------------------------------------------------

model(linear);

% Home Consumption Euler Equation
c=c(+1)-sigma*(r-pi(+1));

% Backus-Smith Condition
c-cf=sigma*q;


% Home Phillips Curve
piH=beta*piH(+1)+kappa*zeta*psi_v*y-kappa*zeta*pH+kappa*zeta*sigma^(-1)*c
+kappa*zeta*taubar/(1-taubar)*tau;

% Foreign Phillips Curve
piF=beta*piF(+1)+kappa*zeta*psi_v*yf-kappa*zeta*pF+kappa*zeta*sigma^(-1)*cf
+kappa*zeta*taubar/(1-taubar)*tau+kappa*zeta*q;

% Relationship between pH and pF
pF=-phiH/phiF*pH;

% Home Inflation
pi=phiH*piH+phiF*piF;

% Foreign Inflation
pif=phiHstar*piH+phiFstar*piF;

% Home Resource Constraint
y=phiH*Cbar*c+(1-nn)/nn*phiHstar*Cbar*cf-eta*Cbar*(phiH+(1-nn)/nn*phiHstar)*pH
+eta*Cbar*(1-nn)/nn*phiHstar*q+g;

% Foreign Resource Constraint
yf=nn/(1-nn)*phiF*Cbar*c+phiFstar*Cbar*cf-eta*Cbar*(nn/(1-nn)*phiF+phiFstar)*pF
+eta*Cbar*phiFstar*q+gf;

% Home Relative Price
pH-pH(-1)=piH-pi;

% Real Exchange Rate
phiHstar*pH+phiFstar*pF=q;

% Monetary Policy
r=rhoii*r(-1)+(1-rhoii)*(phiPi*piag+phiY*yag+phiG*gag)+er;

% Home Government Spending
g=rhoG*g(-1)+eg;

% Foreign Government Spending
gf=rhoG*gf(-1)+egf;

% Home labor
y=aa*L;

% Foreign labor
yf=aa*Lf;

% Home production real wage
w=1/(aa*nu)*y+sigma^(-1)*c-pH+taubar/(1-taubar)*tau;     % w, wf real wage

% Foreign production real wage
wf=1/(aa*nu)*yf+sigma^(-1)*cf-pF+taubar/(1-taubar)*tau+q;

% Home marginal cost
s=psi_v*y+sigma^(-1)*c+taubar/(1-taubar)*tau;            % s, sf real marginal cost

% Foreign marginal cost
sf=psi_v*yf+sigma^(-1)*cf+taubar/(1-taubar)*tau+q;

% Home CPI Price Level
p-pi=p(-1);

% Foreign CPI Price Level
pf-pif=pf(-1);

% Aggregate output
yag=nn*y+(1-nn)*yf;

% Aggregate government spending
gag=nn*g+(1-nn)*gf;

% Aggregate inflation
piag=nn*pi+(1-nn)*pif;

% tax
tau=0;

end;

shocks;
var eg = 1; 
var egf = 1;
end;

steady; 


stoch_simul(hp_filter = 1600, order = 1, irf=100);













