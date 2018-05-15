// Replication of
// PAOLI, B. D. and PAUSTIAN, M. (2017)
// Coordinating Monetary and Macroprudential Policies.
// Journal of Money, Credit and Banking, 49: 319–349.

// Model replication coded by: Philipp Lieberknecht, 
//                             e_mail: philipp.lieberknecht@gmail.com

var 
y       // output
yg      // output gap
R       // gross nominal interest rate
pi      // gross quarterly inflation 
phi     // credit distortion
n       // net worth 
del     // leverage
S       // macroprudential subsidy
z       // marginal costs

a       // technology shock
ns      // net worth shock 
eps_m   // mark-up shock
eps_R   // monetary policy shock
lam     // divertable fraction of loans, moral hazard shock
;

varexo
eta_a   // technology shock innovation
eta_m   // mark-up shock innovation
eta_n   // net worth shock innovation
eta_R   // monetary policy shock innovation
eta_l   // moral hazard shock innovation
;

parameters
betta   $\beta$             // discount factor
sig     $\sigma$            // CRRA utility parameter
alfa    $\alpha$            // labor share
thet    $\thet$             // inverse Frisch labor supply elasticity
eps     $\epsilon$          // Dixit-Stiglitz elasticity of substitution
del_ss  $\delta_{ss}$       // Steady-state leverage     
phi_ss  $\phi_{ss}$         // Steady-state credit spread     
varphi  $\varphi$           // Rotemberg adjustment cost parameter
b                           // auxiliary variable
kap     $\kappa$            // slope of Phillips curve wrt marginal costs
rho_a   $\rho_a$            // persistence technology shock
rho_m   $\rho_m$            // persistence mark-up shock
rho_n   $\rho_n$            // persistence net worth shock
rho_R   $\rho_R$            // persistence monetary policy shock
rho_l   $\rho_l$            // persistence moral hazard shock
tau     $\tau$              // Taylor rule coefficient inflation
tau_g   $\tau_g$            // Taylor rule coefficient output gap
;

betta   = 0.99;
sig     = 1;
alfa    = 0.50;
thet    = 0.47; // the text in 4.1 says unitary elasticity, thet = 1
eps     = 10;
del_ss  = 9;
phi_ss  = 0.02;
varphi  = 211; // the text in 4.1 says 173.08, which is the value from CFP(2010)
b       = 1/(1+phi_ss);
kap     = (eps-1)/varphi;
rho_a   = 0.95;
rho_m   = 0.95;
rho_n   = 0;
rho_R   = 0.5;  // not given in paper
rho_l   = 0.5;  // not given in paper
tau     = 1.5;
tau_g   = 0.125;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Model %%%
model(linear); 

[name='(22) Phillips curve']
pi = kap*((sig+thet)*yg+alfa*(R+b*phi) + eps_m) + betta*pi(+1);
[name='(23) Euler equation']
R = sig*(yg(+1)-yg) + (thet+1)/(sig+thet)*sig*(a(+1)-a) + pi(+1);
[name='(24) Net worth evolution']
n = n(-1) + R(-1) - pi + 1/(phi_ss*del_ss+1)*(phi_ss*del_ss*del(-1) + del_ss*phi(-1) + (del_ss-1)*S(-1))+ns;
[name='(25) Firms labor demand and bank sector']
del + n = (1+sig+thet)*yg + (thet+1)/(sig+thet)*a - (1-alfa)*(R + b*phi);
[name='(26) Incentive compatability constraint']
del + lam = del_ss*phi + (del_ss - 1)*S + betta*((phi_ss*del_ss+1)*del(+1) + lam(+1));
[name='Macroprudential policy']
S = 0;
[name='Taylor Rule']
R = tau*pi + tau_g*yg + eps_R;
[name='Output gap']
yg = y-(1+thet)/(sig+thet)*a;
[name='Marginal costs']
z = kap*((sig+thet)*yg+alfa*(R+b*phi));

[name='Technology']
a = rho_a*a(-1) - eta_a;
[name='Mark-up shock']
eps_m = rho_m*eps_m(-1) + eta_m;
[name='Net worth shock']
ns = rho_n*ns(-1) - eta_n;
[name='Monetary policy shock']
eps_R = rho_R*eps_R(-1) - eta_R;
[name='Moral hazard shock']
lam = rho_l*lam(-1) + eta_l;

end;

shocks;
var eta_a;      stderr 0.5;
var eta_m;      stderr 0.5;
var eta_n;      stderr 4.3;
var eta_R;      stderr 1;    // not given in paper
var eta_l;      stderr 1;    // not given in paper
end;

check;
steady;
close all;
stoch_simul(order=1,irf=21, noprint, nograph);