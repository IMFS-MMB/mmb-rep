// Model: NK_GLSV07_pclm

// Title: Understanding the effects of government spending on consumption
// Authors: Jordi Gali, J. David Lopez-Salido and  Javier Valles
// Publication: Journal of the European Economic Association.

// This file simulates the dynamic response of the model to the fiscal policy shock
// Version of the model: Perfectly competitive labor market

// Replicated impulse responses do not match the IRFs from the paper precisely for all the variables. 
// Qualitatively they are the same. 

// Replication coded by: Lazar Milivojevic 

// Variables

var n c pi k b g y w t i ; 
predetermined_variables k, b ;
varexo e_g;

//Parameters

parameters alpha beta gamma_c gamma_c_bar gamma_g delta eta theta theta_n theta_tau lambda lambda_p my_p rho rho_g sigma_bar phi_b phi_g phi_pi omega psi gamma;

//Calibration

alpha=0.33;             %Elasticity of output with respect to capital
beta=0.99;              %Household discount factor
gamma_g=0.2;            %Share of government purchase to output in stedy state
delta=0.025;            %Depreciation rate of capital
eta=1;                  %The elasticity of incestement wrt q
theta=0.75;             %Fraction of firms that keep their price constant           
lambda=0.5;             %Amount of rule-of-thumb households
my_p=1.2;               %Steady state price markup
psi=0.2;                %Elasticity of wages wrt hours
phi_pi=1.5;             %The response of the monetary authority to inflation

rho= beta^(-1)-1;
gamma_c= (1-gamma_g) - delta*alpha/((rho+delta)*my_p);
gamma_c_bar= gamma_c + gamma_g;
lambda_p= (1-beta*theta)*(1-theta)/theta;

//parameters describing the fiscal policy rule
phi_b=0.33;
phi_g=0.10;
rho_g=0.9;

//parameter generated for the solution of the model 
gamma= 1/(gamma_c*my_p*psi + (1-alpha)*(1-lambda*(1+psi)));
sigma_bar= 1/((1-lambda)*gamma*(my_p*psi*gamma_c + (1-alpha)));
omega= eta*(1-beta*(1-delta))*(1-gamma_c_bar)  ;
theta_tau= lambda*gamma*my_p*psi ;
theta_n= lambda*gamma*(1-alpha)*(1+psi)*psi ;

model;

// C1
k(+1) = (1-delta+delta*alpha/(1-gamma_c_bar))*k + n*delta*(1-alpha)/(1-gamma_c_bar) - c*delta*gamma_c/(1-gamma_c_bar) - g*delta/(1-gamma_c_bar);

// C3
pi = beta*pi(+1) + lambda_p*c - alpha*lambda_p*k + (alpha + psi)*lambda_p*n;

// C6
c - theta_n*n + pi*phi_pi/sigma_bar = c(+1) + pi(+1)/sigma_bar - theta_n*n(+1) + theta_tau*phi_b*(b(+1)-b) + theta_tau*phi_g*(rho_g-1)*g;

// C7
(1-alpha)*n - gamma_c*c - (1-gamma_c_bar-alpha)*k + (1-gamma_c_bar)*eta*phi_pi*pi = (omega*(1+psi)+beta*(1-alpha))*n(+1)+(omega-beta*gamma_c)*c(+1)- (omega+beta*(1-gamma_c_bar-alpha))*k(+1) + (1-gamma_c_bar)*eta*pi(+1) + (1-beta*rho_g)*g ;

// 37
b(+1)= (1+rho)*(1-phi_b)*b + (1+rho)*(1-phi_g)*g; 

// 21
g=rho_g*g(-1) + e_g;

// 35
y= (1-alpha)*n + alpha*k;

// additional equations in order to replicate all the IRFs from the paper:


// 30
w = c + psi*n;

// 20

t = phi_b*b + phi_g*g;

// inv

i = k + 1/(1-gamma_c_bar)*((1-alpha)*n - gamma_c*c - g - (1 - gamma_c_bar - alpha)*k);

end;

initval;

n=0;
c=0;
pi=0;
k=0;
b=0;
g=0;
y=0;

end;

steady;

shocks;
var e_g=1;
end;

stoch_simul(irf=20, noprint, nograph);

