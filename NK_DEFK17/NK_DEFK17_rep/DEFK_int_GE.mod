% Non-linear DEFK
% Capitalized gross profits
% Fixed costs in retail sector
% See Model-BigQ-Fix-CP.pdf
% Andrea Ferrero
% September 9, 2014

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var 

% Quantities

C Inv S_Inv dS_Inv H Y tau K N Ng LY QK GDP

% Prices

R Q pI RK rK rr rr0 ERQ w infl_w X1w X2w mc infl X1p X2p Delta_p CY Spr phi;

% Shocks

varexo e_phi;

% Parameters

parameters

% Structural parameters

beta sigma nu kappa theta gamma Gamma delta s0 lambda_w lambda_p xi_w xi_p 

% Policy rules parameters

psi_p psi_y rho_i psi_k psi_tau rho_phi

% Steady state values

Y_ss C_ss I_ss K_ss H_ss R_ss Q_ss RK_ss rK_ss w_ss tau_ss LY_ss A_ss phi_ss

% Shock value and loop parameters

shock_val;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

beta=0.99347;
sigma=1;
nu=1;
theta=0.79246;
kappa=0.009486;
delta=0.024291;
gamma=0.34002;
s0=0.75;
xi_p=0.75;
xi_w=0.75;
lambda_p=0.1;
lambda_w=0.1;
psi_p=1.5;
psi_y=0.125;
rho_i=0;
psi_tau=0.1;

R_ss=1.0055;
A_ss=1;
phi_ss=0.3092;
LY_ss=1.6;
Y_ss=2.6779;
K_ss=29.2064;
H_ss=0.90345;
I_ss=0.70945;
C_ss=1.9685;
Q_ss=1.0223;
RK_ss=0.031176;
rK_ss=0.031176;
CY_ss=0.0011116;
w_ss=1.9563;
tau_ss=0.023387;
KY_ratio=10.9064;
KH_ratio=32.3277;
IY_ratio=0.26493;
CY_ratio=0.73507;
Gamma=0.26779;

psi_k=-4.8066;
shock_val=-0.218;
rho_phi=0.984;
GE=1;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model; 

// 1) Euler equation for bonds C
C^(-sigma) = beta * (C(+1)^(-sigma)) * rr * ( 1 + kappa * (Q(+1) - pI(+1)) / (pI(+1) - theta * Q(+1)) );

// 2) Euler equation for equity Q
C^(-sigma) = beta *  (C(+1)^(-sigma)) * ( (RK(+1) + (1 - delta) * Q(+1)) / Q ) *
(1 + kappa * (Q(+1) - pI(+1)) * (RK(+1) + phi(+1) * (1 - delta) * Q(+1)) / ( (pI(+1) - theta * Q(+1)) * (RK(+1) + (1 - delta) * Q(+1)) ) ) ;

// 3) Investment equation Inv
(pI - theta * Q) * Inv = kappa * ( (RK + phi * (1 - delta) * Q) * N(-1) + R(-1) * LY(-1) * Y(-1) / infl - tau ); 

// 4) Price of investment pI
pI = 1 + S_Inv + dS_Inv * (Inv / I_ss);
// + beta * ((C(+1) / C)^(-sigma)) * dS_Inv(+1) * (Inv(+1) / Inv)^2;

// 5) Investment adjustment cost function S_Inv
S_Inv = s0 * (Inv / I_ss - 1)^2 / 2;

// 6) First derivative of investment adjustment cost function dS_Inv
dS_Inv = s0 * (Inv / I_ss - 1);

// 7) Production function Y
Y * Delta_p = A_ss * (K(-1)^gamma) * (H^(1-gamma)) - Gamma;

// 8) MPK
rK = gamma * mc * A_ss * (H / K(-1))^(1-gamma);

// 9) MPL
w = (1 - gamma) * mc * A_ss * (K(-1) / H)^gamma;

// 10) Rental rate RK
RK * K(-1) =  Y - w * H + (pI - (1 + S_Inv)) * Inv;

// 11) Market clearing condition for capital N
K = N + Ng;

// 12) Law of motion of capital K
K = (1 - delta) * K(-1) + Inv; 

// 13) Price Phillips curve infl
X1p = X2p * ( (1 - xi_p * infl^(1 / lambda_p)) / (1 - xi_p) )^(- lambda_p);

// 14) PDV of real marginal costs X1p
X1p = (1 + lambda_p) * (C^(-sigma)) * Y * mc + beta * xi_p * ( infl(+1)^((1 + lambda_p) / lambda_p) ) * X1p(+1);

// 15) PDV of real marginal revenues X2p
X2p = (C^(-sigma)) * Y + beta * xi_p * ( infl(+1)^(1 / lambda_p) ) * X2p(+1);

// 16) Wage Phillips curve infl_w
X1w = X2w * ( (1 - xi_w * infl_w^(1 / lambda_w)) / (1 - xi_w) )^(- (lambda_w + (1 + lambda_w) * nu));

// 17) PDV of marginal disutility of work X1w
X1w = (1 + lambda_w) * H^(1+nu) + beta * xi_w * ( infl_w(+1)^((1 + lambda_w) * (1 + nu) / lambda_w) ) * X1w(+1);

// 18) PDV of real wage X2w
X2w = (C^(-sigma)) * w * H + beta * xi_w * ( infl_w(+1)^(1 / lambda_w) ) * X2w(+1);

// 19) Relation between real wage and inflation rates
w * infl = w(-1) * infl_w;

// 20) Price dispersion Delta_p
Delta_p = xi_p * Delta_p(-1) * infl^((1 + lambda_p) / lambda_p) + (1 - xi_p) * ( (1 - xi_p * infl^(1 / lambda_p)) / (1 - xi_p) )^(1 + lambda_p);

// 21) Taylor rule R
R = max((R(-1)^rho_i) * (R_ss * (infl^psi_p) * ((Y/Y_ss)^psi_y))^(1-rho_i),1);

// 22) Liquidity intervention Ng
Ng = psi_k * (phi - phi_ss);

// 23) Tax rule tau
tau = tau_ss + psi_tau * (R(-1) * LY(-1) * Y(-1) / infl - R_ss * LY_ss * Y_ss - Q * Ng(-1));

// 24) Government budget constraint LY
Q * Ng + R(-1) * LY(-1) * Y(-1) / infl = tau + (RK + (1 - delta) * Q) * Ng(-1) + LY * Y;

// 25) Resource constraint rK
Y = C + (1 + S_Inv) * Inv; 

// 26) Real rate
rr = R / infl(+1);

// 27) Expected return on illiquid asset
ERQ = (RK(+1) + (1 - delta) * Q(+1)) / Q;
 
// 28) Spread equity-bonds
Spr = ERQ - rr;
 
// 29) Convenience yield
CY = kappa * (Q(+1) - pI(+1)) / (pI(+1) - theta * Q(+1));

// 30) Value of capital
QK = Q * K(-1);

// 31) GDP
GDP = C + pI * Inv;

// 32) Return on illiquid security
C^(-sigma) = beta * (C(+1)^(-sigma) * rr0);

// 33) Borrowing constraint shock phi
phi = (1 - rho_phi) * phi_ss + rho_phi * phi(-1) + e_phi;

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;

C       = C_ss;
Inv     = I_ss;
S_Inv   = 0;
dS_Inv  = 0;
H       = H_ss;
Y       = Y_ss; 
LY      = LY_ss;
tau     = tau_ss;
K       = K_ss;
N       = K_ss;
Ng      = 0;
R       = R_ss;
rr      = R_ss;
rr0     = R_ss * (1 + CY_ss);
ERQ     = RK_ss / Q_ss + (1 - delta);
Spr     = ERQ - rr;
Q       = Q_ss;
pI      = 1;
RK      = RK_ss;
rK      = rK_ss;
CY      = CY_ss;
w       = w_ss;
infl_w  = 1;
X1w     = (1 + lambda_w) * H_ss^(1+nu) / (1 - beta * xi_w);
X2w     = (C_ss^(-sigma)) * w_ss * H_ss / (1 - beta * xi_w);
mc      = 1 / (1 + lambda_p);
infl    = 1;
X1p     = (C_ss^(-sigma)) * Y_ss / (1 - beta * xi_p);
X2p     = (C_ss^(-sigma)) * Y_ss / (1 - beta * xi_p);
Delta_p = 1;
phi     = phi_ss;
e_phi   = 0;

end;

steady(solve_algo=2);

check;

shocks;
var e_phi;
periods 1;
values (shock_val);
end;

simul(periods=300);