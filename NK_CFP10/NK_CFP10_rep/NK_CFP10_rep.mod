// Replication of
// Charles T. Carlstrom & Timothy S. Fuerst & Matthias Paustian, 2010.
// "Optimal Monetary Policy in a Model with Agency Costs" 
// Journal of Money, Credit and Banking, Blackwell Publishing
// vol. 42(s1), pages 37-70, September.

// Model replication coded by: Philipp Lieberknecht, 
//                             e_mail: philipp.lieberknecht@gmail.com


var 
y       // output
yeff    // output without price and credit frictions
yg      // output gap
R       // gross nominal interest rate
pi      // gross quarterly inflation 
z       // marginal costs
phi     // credit distortion
e       // entrepreneur's equity share holdings
q       // asset price
d       // dividends
L       // labor input 1
u       // labor input 2
r       // rental rate of capital
w       // real wage

a       // technology shock
eps_pi  // mark-up shock
n       // net worth shock
eps_R   // monetary policy shock
;

varexo
eta_a   // technology shock innovation
eta_pi  // mark-up shock innovation
eta_n   // net worth shock innovation
eta_R   // monetary policy shock innovation
;

parameters
betta   $\beta$             // discount factor
sig     $\sigma$            // CRRA utility parameter
thet    $\thet$             // inverse Frisch labor supply elasticity
eps     $\epsilon$          // Dixit-Stiglitz elasticity of substitution
alfa    $\alpha$            // labor share
b                           // Collateral constraint Cobb-Douglas parameter
Lam     $\Lambda$           // auxiliary variable
varphi  $\varphi$           // Rotemberg adjustment cost parameter
lam     $\lambda$           // Philips curve slope wrt marginal costs
rho_a   $\rho_a$            // persistence technology shock
rho_R   $\rho_R$            // persistence monetary policy shock
rho_pi  $\rho_\pi$          // persistence price mark-up shock
rho_n   $\rho_n$            // persistence net worth shock
tau     $\tau$              // Taylor rule coefficient inflation
tau_g   $\tau_g$            // Taylor rule coefficient output gap
;

betta   = 0.99;
sig     = 0.16;
thet    = 0.47;
eps     = 10;
alfa    = 0.50;
b       = 0.20;
Lam     = (b-1);
varphi  = 173.08;
lam     = (eps-1)/varphi;
rho_a   = 0.95;
rho_n   = 0.90;
rho_pi  = 0.90;
rho_R   = 0.40;
tau     = 1.5;
tau_g   = 0.5;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Model %%%
model(linear); 

[name='(A1)']
sig*y + thet*L = w;
[name='(A2)']
sig*y + thet*u = r;
[name='(A3)']
sig*(y(+1)-y) = R - pi(+1);
[name='(A4) rewritten as in (35)']
phi = (1+thet)/(1+Lam)*(yg(+1)-yg) - (1-alfa*b)/(1+Lam)*(phi(+1)-phi) - (sig-1)*(1+thet)/((sig+thet)*(1+Lam))*(a(+1)-a) - 1/(1+Lam)*n(+1);
[name='(A5)']
e + q = z + y + Lam*phi;
[name='(A6) rewritten as in (34)']
e = 1/betta*(e(-1) - eps*(1-betta)*(sig+thet)*yg + (1+betta*Lam - alfa*eps*(1-betta)*b)*phi + n);
[name='(A7) rewritten as in (19)']
z = (sig+thet)*yg + alfa*b*phi;
[name='(A8)']
y = a + (1-alfa)*u + alfa*L;
[name='(A9)']
pi = lam*z + betta*pi(+1) + lam*eps_pi;
[name='(A10)']
d = y - (eps-1)*z;
[name='(A11)']
b*phi = z + y -w - L;
[name='Taylor Rule']
R = tau*pi + tau_g*yg + eps_R;
[name='Output without price and credit frictions']
yeff = (1+thet)/(sig+thet)*a;
[name='Output gap']
yg = y-yeff;
[name='Technology']
a = rho_a*a(-1) - eta_a;
[name='Mark-up shock']
eps_pi = rho_pi*eps_pi(-1) + eta_pi;
[name='Net worth shock']
n = rho_n*n(-1) - eta_n;
[name='Monetary policy shock']
eps_R = rho_R*eps_R(-1) - eta_R;

end;

shocks;
var eta_a;      stderr 1;
var eta_pi;     stderr 1;
var eta_n;      stderr 1;
var eta_R;      stderr 2.205993;
end;

check;
steady;
close all;
stoch_simul(order=1,irf=21, noprint, nograph);