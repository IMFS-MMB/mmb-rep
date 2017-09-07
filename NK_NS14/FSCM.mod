clc;
close all;

%----------------------------------------------------------------
% Varialbles
%----------------------------------------------------------------
var c cf r pi pif piH piF l lf pH p pf sH sF y yf g gf w wf i if k kf ny nyf q ;
varexo eg egf er;

%----------------------------------------------------------------
% Parameters
%----------------------------------------------------------------
parameters sigma_c sigma_l beta kappa zeta phiH phiF phiHstar phiFstar Cbar Ibar nn eta rhoii phiPi phiY phiG rhoG aa nu omegaBar delta eps_phi rho_y rho_k;

sigma   = 1;      % Intertemporal elastisity of substitution
alpha   = 0.75;   % Calvo parameter
beta    = 0.99;   % Subjective discount factor
nu      = 1;      % Frish elasticity of labor suppy
aa      = 0.67;   % Curvature of production function
eta     = 2;      % Elasticity of substitution between home and foreign goods
theta   = 7;      % Elasticity of substitution between varieties

delta   = 0.012;  % Rate of depreciation of capital
eps_phi = 3;      % Capital adjustment cost parameter

nn      = 0.1;    % Size of home region
phiH    = 0.69;   % Weig ht of home goods in home consumption basket
phiF    = 1-phiH; % Weight of foreign goods in home consumption basket
phiHstar = phiF*nn/(1-nn);  % Weight of home goods in foreign consumption basket
phiFstar = 1 - phiHstar;    % Weight of foreign goods in foreign consumption basket

phiPi    = 1.5;     % Inflation response in Taylor Rule
phiY     = 0.5;     % Output response in Taylor Rule
rhoii    = 0.8;     % Lagged dependence in Taylor Rule
phiG     = 0.0;     % Direct response of monetary policy to fiscal shock
phi_c    = 1;       % Consumption elasticity of money demand
phi_i    = 0;       % Interest elasticity of money demand

rhoG     = 0.933; %0.5^(1/8);     % Persistence of government spending shock
corrG    = 0.999;       % Correlation of home and foreign gov spending shocks

KoverL   = ((1-aa)*(beta/(1-beta*(1-delta)))*(theta-1)/theta)^(1/aa);
Ibar     = delta*KoverL^aa; % Steady state investment-output ratio
Gbar     = 0.2;      % Steady state government spending-output ratio
Cbar     = 1 - Gbar - Ibar; % Steady state consumption-output ratio

sigma_c  = sigma^(-1)*(1-aa*((theta-1)/theta)*Cbar^(-1)*(1+1/nu)^(-1))^(-1);
sigma_l  = (Cbar^(-1)*((theta-1)/theta)*aa*sigma_c^(-1))^(-1);

kappa    = (1-alpha)*(1-alpha*beta)/alpha;

omegaBar = (nu^(-1)+1-aa)/aa; 
rho_y    = omegaBar + 1;
rho_k    = rho_y - nu^(-1);
Xi       = (1-beta*(1-delta))*rho_y*theta*eps_phi^(-1);

AA = 1+beta+(1-beta*(1-delta))*rho_k*eps_phi^(-1);
BB = 2*(1+omegaBar*theta)*alpha*beta+alpha^2*beta*(omegaBar-nu^(-1))*Xi;

RR0 = beta*(1+omegaBar*theta);
RR1 = -beta*BB-(1+omegaBar*theta)*AA;
RR2 = beta*(1+omegaBar*theta)+beta*AA*BB+alpha*beta^2*(1+omegaBar*theta);
RR3 = -beta*BB-alpha*beta^2*AA*(1+omegaBar*theta);
RR4 = alpha*beta^2*(1+omegaBar*theta);

QQ = [RR4 RR3 RR2 RR1 RR0];

lambda = roots(QQ);
realLambda = (lambda == real(lambda));
lessOneLambda = (abs(lambda) < 1);
whichLambda = realLambda.*lessOneLambda;
lambda = whichLambda'*lambda;

tauBar = alpha*Xi*lambda/(1-alpha*beta*lambda);
zeta     = (1+omegaBar*theta-(omegaBar-nu^(-1))*tauBar*alpha*beta/(1-alpha*beta*lambda))^(-1);

%----------------------------------------------------------------
% Model
%----------------------------------------------------------------

model(linear);

//Home Consumption Euler
c=c(+1)-sigma_c*(r-pi(+1))+sigma_c/sigma_l*l-sigma_c/sigma_l*l(+1);

//Backus Smith Condition
c-cf=sigma_c*q+sigma_c/sigma_l*(l-lf);

//Home Phillips Curve
piH=beta*piH(+1)+kappa*zeta*sH;

//Foreign Phillips Curve
piF=beta*piF(+1)+kappa*zeta*sF;

//Home Inflation
pi=phiH*piH+phiF*piF;

//Foreign Inflation
pif=phiHstar*piH+phiFstar*piF;

//Home Ressource Constraint
y=phiH*Cbar*c+(1-nn)/nn*phiHstar*Cbar*cf+Ibar*phiH*i+(1-nn)/nn*phiHstar*Ibar*if-eta*(Cbar+Ibar)*(phiH+(1-nn)/nn*phiHstar)*pH+eta*(Cbar+Ibar)*(1-nn)/nn*phiHstar*q+g;

//Foreign Ressource Constraint: Corrected at various points, esp. nn/(1-nn)
yf=phiFstar*Cbar*cf+nn/(1-nn)*phiF*Cbar*c+Ibar*phiFstar*if+
nn/(1-nn)*Ibar*phiF*i + eta*(Cbar+Ibar)*(phiFstar+nn/(1-nn)*phiF)*phiH/phiF*pH+eta*(Cbar+Ibar)*phiFstar*q+gf;

//Home Relative Price
pH-pH(-1)=piH-pi;

//Real Exchange Rate
phiHstar*pH-phiH/phiF*phiFstar*pH=q;

//Monetary Policy Rule
r=rhoii*r(-1)+(1-rhoii)*(phiPi*(nn*pi+(1-nn)*pif)+phiY*(nn*y+(1-nn)*yf)+phiG*(nn*g+(1-nn)*gf))+er;

//Home Government Spending
g=rhoG*g(-1)+eg;

//Foreign Government Spending
gf=rhoG*gf(-1)+egf;

//Home Nominal Output
ny=y+p;

//Foreign Nominal Output
nyf=yf+pf;

//Home Production Function
y=aa*l+(1-aa)*k(-1);

//Foreign Production Function
yf=aa*lf+(1-aa)*kf(-1);

//Home and Foreign Real Wage
w=1/nu*l;
wf=1/nu*lf;

//Home Marginal Costs
sH+pH=omegaBar*y-(omegaBar-1/nu)*k(-1);                % sH, sF real marginal cost

//Foreign Marginal Costs
sF-phiH/phiF*pH=omegaBar*yf-(omegaBar-1/nu)*kf(-1)+q;   

//Home & Foreign Capital Accumulation 
k=(1-delta)*k(-1)+delta*i;
kf=(1-delta)*kf(-1)+delta*if;

//Home Optimal Investment
sigma_c^(-1)*c-sigma_c^(-1)*c(+1)-sigma_l^(-1)*l+sigma_l^(-1)*l(+1)-(1+beta)*eps_phi*k
-(1-beta*(1-delta))*rho_k*k+beta*eps_phi*k(+1)+(1-beta*(1-delta))*rho_y*y(+1)=-eps_phi*k(-1);

//Foreign Optimal Investment
sigma_c^(-1)*cf-sigma_c^(-1)*cf(+1)-sigma_l^(-1)*lf+sigma_l^(-1)*lf(+1)-(1+beta)*eps_phi*kf
-(1-beta*(1-delta))*rho_k*kf+beta*eps_phi*kf(+1)+(1-beta*(1-delta))*rho_y*yf(+1)=-eps_phi*kf(-1);

//Home PPI: 
p=piH+p(-1);

//Foreign PPI
pf=piF+pf(-1);

end;


shocks;
var eg = 1;
var egf = 1;
end;

steady;

stoch_simul(hp_filter = 1600, order = 1, irf = 100);














