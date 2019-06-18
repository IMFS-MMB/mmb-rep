var 
lambda // marginal utility of consumption
c   // consumption
m   // money balances
pit // inflation
z   // transaction costs
nu  // taste
l   // labour
mu  // wage mark-up
w   // wage
R   // nominal interest rate
psi // real marginal costs
a   // productivity
g   // government expenditure
y   // output
RR  // real interest rate
pit_obs R_obs;

varexo eps_z eps_nu eps_mu eps_a eps_g eps_m;

parameters eta_cc eta_ch eta_hc_sigma_h sigma_c gamma omega betta alpha
rho_pi rho_y g_o_y rho_z rho_nu rho_mu rho_a rho_g eta_R rho_R;

gamma   = 0;  // habit formation
betta   = 0.99; // discount factor
omega   = 3.5;  //
sigma_c = 0.99; // according to authors code
alpha   = 0.5;  // Calvo parameter
g_o_y   = 0.2;  // stst. government spending to output ratio
eta_cc  = 0.01; // according to authors code
eta_R   = 20;   // according to authors code
rho_R   = 0.0;  // interest rate smoothing
rho_pi  = 1.5; // Taylor rule coefficient for inflation
rho_y   = 0;    // Taylor rule coefficient for output
eta_ch  = 0;    // for R4
eta_hc_sigma_h = 0.85; // eta_hc_sigma_h=eta_hc/sigma_h

rho_z   = 0.5; // persistence parameter for transaction cost shock
rho_nu  = 0.5; // persistence parameter for preference shock
rho_mu  = 0.5; // persistence parameter for labor supply shock
rho_a   = 0.5; // persistence parameter for technology shock
rho_g   = 0.5; // persistence parameter for gov. spending shock

model(linear);

lambda=-(eta_cc+sigma_c)*c+ eta_ch*(m(-1)-pit+z)+sigma_c*gamma*c(-1)+nu; // marginal utility of c
lambda=omega*l+mu-w;                                        // Labor supply
lambda=R + lambda(+1)-pit(+1);                              // Euler equation
w=psi+a;                                                    // Labor demand
pit=betta*pit(+1)+(1-alpha)*(1-alpha*betta)/(alpha)*psi;    // NKPC
y=a+l;                                                      // production function
y=(1-g_o_y)*c+g;                                            // aggregate good market clearing
R=rho_R*R(-1)+rho_pi*pit+rho_y*y+eps_m;                     // interest rate rule
m=-eta_R*R+eta_hc_sigma_h*c(+1)+pit(+1)-z(+1);              // money demand

z=rho_z*z(-1)+eps_z;                            // transaction cost shock
mu=rho_mu*mu(-1)+ eps_mu;                       // labor supply shock
nu=rho_nu*nu(-1)+eps_nu;                        // preference shock
a=rho_a*a(-1)+eps_a;                            // technology shock
g=rho_g*g(-1)+eps_g;                            // government spending shock

pit_obs=4*pit;
R_obs=4*R;
RR=R-pit(+1);

end;

shocks;                     //(posterior post-1982)
var eps_g;  stderr 1;       // government spending shock
var eps_a;  stderr 0.0044;  // technology shock
var eps_mu; stderr 0.0188;  // labor supply shock
var eps_z;  stderr 0.0140;  // transaction cost shock
var eps_nu; stderr 0.0152;  // preference shock
var eps_m;  stderr 0.0055;  // interest rate shock
end;

stoch_simul(irf=20, nograph) c y m pit RR R;

