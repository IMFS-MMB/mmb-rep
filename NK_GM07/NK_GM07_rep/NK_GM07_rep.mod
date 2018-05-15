% Model: NK_GM07

% Further Reference: 
% Goodfriend, M., B.T. McCallum. 2007. " Banking and interest raets in monetary policy analysis: A quantitative exploration".
% Journal of Monetary Economics 54, pp. 1480-1507.

% Created by Felix Strobel (02.10.17)

% for replicating figures 3-7 adjust parameters mu_1, mu_2, and mu_3, in the following way:
% Fig 3: mu_1 = 50;     mu_2 = 0.0; mu_3 = 0.0;
% Fig 4: mu_1 = 1.25;   mu_2 = 0.5; mu_3 = 0.0;
% Fig 5: mu_1 = 50;     mu_2 = 0.0; mu_3 = 0.0;
% Fig 6: mu_1 = 50;     mu_2 = 0.0; mu_3 = 0.0;
% Fig 7: mu_1 = 1.5;    mu_2 = 0.5; mu_3 = 0.8;

%********************************************************************************************************************

var dp, mc, omega, lambda, xi, w, n, m, c, q, p, h, b, a1, a2, a3, EFP, rT, rIB, rL, rB;

varexo eps_h, eps_a1, eps_a2, eps_a3, eps_i;

parameters 
phi, eta, theta, beta, kappa, alpha, k, delta, gamma, rr, V, boc F
K, n_ss, m_ss, c_ss, w_ss, b_ss, omega_ss, lambda_ss, mc_ss, EFP_ss, rT_ss, rIB_ss, rL_ss, rB_ss,
rho_h, rho_a1, rho_a2, rho_a3,
mu_0, mu_1, mu_2, mu_3;


// parameters

phi = 0.4;
eta = 0.36;
theta = 10;
mc_ss = 1/1.1;
beta = 0.99;
kappa = 0.05;
alpha = 0.65;
k = 0.2;
delta = 0.025;
gamma = 0.005;
V = 0.31;
rr = 0.005;
boc=0.56;
F=9;

// persistence parameters

rho_h  = 0.6;  %Fig 1: 0.6 Fig 2: 0.99 
rho_a1 = 0.99;
rho_a2 = 0.99;
rho_a3 = 0.9;


// monetary policy

mu_0 = 0;
mu_1 = 1.25;  %1.5 Fig 3&5&6: 50  Fig 4: 1.25 Fig 7: 0.5
mu_2 = 0.5;   %0.5 Fig 3&5&6: 0.0 Fig 4: 0.50 Fig 7: 0.5
mu_3 = 0.0;   %0.8 Fig 3&5&6: 0.0 Fig 4: 0.00 Fig 7: 0.8


// steady-state "parameters"

K = 9.19;
n_ss = 0.3195;
m_ss = 0.0063;
c_ss = 0.8409;
w_ss = 1.949;
b_ss = boc*c_ss;
omega_ss = 0.237;
lambda_ss = 0.457;
EFP_ss = (V * w_ss * m_ss) / ((1 - alpha) * (1 - rr) * c_ss);
rT_ss = 0.015;
rIB_ss = 0.0021;
rL_ss = 0.0066;
rB_ss = 0.0052;


model;

//########################
//#### baseline model ####
//########################

//(32)
dp = beta * dp(+1) + kappa * mc;

//(33)
mc = xi - lambda;

//(34) 
//(34')
%h - h(-1) = rho_h * (h(-1) - h(-2)) + eps_h;

//(35)
h = c + p;

//(36)
lambda + w = (n_ss / (1 - n_ss - m_ss)) * n + (m_ss / (1 - n_ss - m_ss)) * m;

//(37)
w + m + ((c_ss * (1 - alpha)) / (m_ss * w_ss)) * c + (1 + (c_ss * (1 - alpha)) / (m_ss * w_ss)) * lambda = 0;

//(38)
omega = ((k * K / c_ss) / (b_ss + (k * K / c_ss))) * (c - q - a3) - (b_ss / (b_ss + (k * K / c_ss))) * b;

//(39)
c = (1 + (delta * K / c_ss)) * (1 - eta) * (n + a1) - (delta * K / c_ss) * q;

//(40)
c = (1 - alpha) * (a2 + m) + (alpha * b_ss * c_ss / (b_ss * c_ss + k * K * (1 + gamma)) * (b + c) + (alpha * k * K * (1 + gamma) / (b_ss * c_ss + k * K * (1 + gamma))) * (a3 + q));

//(41)
mc = w + n - c;

//(42)
dp = p - p(-1);

//(43)
((k * omega_ss * phi) / (c_ss * lambda_ss)) * c = k * omega_ss * (phi / (c_ss * lambda_ss) - 1) * (omega + a3) + (k * omega_ss * ( phi / (c_ss * lambda_ss) - 1) - 1 ) * q + (beta / (1 + gamma)) * (1 - delta ) * q(+1) + (beta / (1 + gamma)) * (1 - delta + eta * mc_ss * (n_ss / K)^(1 - eta)) * lambda(+1) + ((beta * eta * mc_ss / (1 + gamma)) * (n_ss / K)^(1 - eta)) * (mc(+1) + (1 - eta) * (n(+1) + a1(+1))) - (k * omega_ss * phi / (c_ss * lambda_ss) + (beta / (1 + gamma)) * (1 - delta + eta * mc_ss * (n_ss / K)^(1 - eta))) * lambda;

rIB = (1 - mu_3) * ((1 + mu_1) * dp(+1) + mu_2 * (mc)) + mu_3 * (rIB(-1)) + eps_i;

//########################
//#### interest-rates ####
//########################

//Definition of the EFP
EFP = (w + m - c);

//(16)
rT = 1/beta*1/(1+gamma)*(dp(+1) + lambda - lambda(+1));
%rT*rT_ss = 1/beta*1/(1+gamma)*(dp(+1) + lambda - lambda(+1));

//(17)
rT - rB = omega_ss * (phi / (c_ss * lambda_ss)) * (omega - c - lambda) - omega_ss * omega;
%rT*rT_ss - rB*rT_ss = omega_ss * (phi / (c_ss * lambda_ss)) * (omega - c - lambda) - omega_ss * omega;

//(20)
rT - rIB = EFP;
%rT*rT_ss/(rT_ss-rIB_ss) - rIB*rIB_ss/(rT_ss-rIB_ss) = EFP;
%rT/(rT_ss-rIB_ss) - rIB/(rT_ss-rIB_ss) = EFP;

//(22)
rL - rIB =  EFP;




//########################
//##### policy rules #####
//########################


//Policy determination of constant bonds to consumption
b = 0;



//########################
//### shock-processes ####
//########################

a1 = rho_a1 * a1(-1) + eps_a1;
a2 = rho_a2 * a2(-1) + eps_a2;
a3 = rho_a3 * a3(-1) - eps_a3;


end;



%steady;
shocks;

var	eps_a1;  stderr 1;
%var eps_i; stderr 1;
%var eps_a2;  stderr 1;
%var eps_a3;  stderr 1;
%var	eps_h;  stderr 1;

end;

%check;

stoch_simul(order=1,nograph, irf=20) n, w, m, q, rIB, mc, c, lambda, EFP, rB, dp, rT;