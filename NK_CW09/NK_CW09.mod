//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_CW09

// Further references:
//Curdia, V. and Woodford, M. (2009), Credit frictions and optimal monetary policy,
//BIS Working Papers 278, Bank for International Settlements.

// Last edited: 14/03/04 by A.Hüser and M.Kontny

var i_d i_d_hat_a lambda_b lambda_s Pi Pi_hat_a Y K F Delta b G chi_tilde 
    omega_hat_a C_bar_s C_bar_b H_bar mu_w tau omega Z b_g B 
    Lambda lambda_tilde i_d_hat lambda_b_hat lambda_s_hat Pi_hat Y_hat 
    K_hat F_hat Delta_hat b_hat Xi_tilde_hat G_hat chi_tilde_hat
    C_bar_s_hat C_bar_b_hat H_bar_hat mu_w_hat tau_hat omega_hat Z_hat 
    b_g_hat i_b_hat Lambda_hat lambda_tilde_hat e_G Y_n_hat// epsilon_m 
//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq outputgap output fispol;                //*
//**************************************************************************


varexo e_C_bar_s e_C_bar_b e_H_bar e_mu_w e_tau //e_epsilon_m 
         e_Xi_tilde e_chi_tilde e_Z e_b_g
//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
//************************************************************************** 


parameters 
//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
        std_r_ std_r_quart coffispol                                     //*
//**************************************************************************
           beta phi delta pi_b pi_s mu_p omega_y nu theta alpha
           sigma_b sigma_s psi_b psi_s psi eta varchi phi_pi phi_y 
           rho_C_bar_s rho_C_bar_b rho_G rho_H_bar rho_mu_w rho_tau 
           rho_epsilon_m rho_Xi_tilde rho_chi_tilde rho_Z rho_b_g
           Omega_bar rho_b_g_ar Y_bar rho_b s_b s_s s_g s_c i_d_bar 
           omega_bar s_Xi Xi_tilde_bar C_bar_b_bar C_bar_s_bar chi_tilde_bar
           mu_w_bar tau_bar lambda_b_bar lambda_s_bar K_bar F_bar 
           lambda_tilde_bar Lambda_bar H_bar_bar Z_bar Pi_bar Delta_bar B_bar
           b_bar b_g_bar G_bar s_diff sigma_bar;


%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
//Persistence of AR(1)-Processes 
rho_C_bar_s     = 0.9;
rho_C_bar_b     = 0.9;
rho_G           = 0.9;
rho_H_bar       = 0.9;
rho_mu_w        = 0.9;
rho_tau         = 0.9;
rho_epsilon_m   = 0.6;
rho_Xi_tilde    = 0.9;
rho_chi_tilde   = 0.9;
rho_Z           = 0.9;
rho_b_g_ar      = 0.9;

//Model Parameters
pi_b            = 0.5; 
pi_s            = 0.5;
alpha           = 0.66;
theta           = 0.15^-1 + 1;
nu              = 0.1048;
phi             = 1/0.75;
omega_y         = phi*(1+nu)-1; 
delta           = 0.975;
phi_pi          = 2;
phi_y           = 0.25;
varchi          = 0;
s_c             = 0.7;
sigma_bar       = 6.25;
mu_p            = theta / (theta-1) ;
sigma_b         = 13.8019;      //intertemporal elasticity of substitution of type b households
sigma_s         = 2.7604;       //intertemporal elasticity of substitution of type s households
rho_b_g         = 0;
rho_b           = 3.2;

//Steady-State Definitions
Y_bar           = 1;
i_d_bar         = 0.01;
tau_bar         = 0.2;
b_bar           = rho_b * Y_bar;
omega_bar       = (1.02)^0.25-1; 

//Model Parameters dependent on Steady-State values
eta             = (1/4) *(1+omega_bar)/omega_bar +1; 
beta            = ((delta+1) + omega_bar*(delta+(1-delta)*pi_b)
                    -sqrt(((delta+1)+omega_bar*(delta+(1-delta)*pi_b))^2 - 4*delta*(1+omega_bar))   ) 
                     /(2*delta*(1+omega_bar)) / (1+i_d_bar);
Omega_bar       = (1 - (1+i_d_bar)*beta*(delta + (1-delta)*(1-pi_b)))/((1+i_d_bar)*beta*(1-delta)*pi_b);

psi_s           = (0.5 * Omega_bar^(-1/nu) + 0.5)^nu;
psi_b           = Omega_bar * psi_s;
psi             = (pi_b * psi_b^(-1/nu) + (1-pi_b) * psi_s^(-1/nu) )^nu;

s_diff          = ((1+pi_b*omega_bar -delta*(1+omega_bar)*(1+i_d_bar))
                    *rho_b + pi_b *rho_b_g*(1-delta*(1+i_d_bar)) )/(pi_b*(1-pi_b));
s_s             = s_c - pi_b * s_diff;              //output share of type s consumption
s_b             = s_c + (1 - pi_b) * s_diff;        //output share of type b consumption
s_Xi            = omega_bar * b_bar / eta;          //output share of financial intermediation 
s_g             = 1- s_c - s_Xi;                    //output share og government expenditure

// Steady state definitions .. continued
Pi_bar          = 1;
Delta_bar       = 1;
mu_w_bar        = 1;
H_bar_bar       = 1;
Z_bar           = 1;
G_bar           = s_g*Y_bar;
b_g_bar         = rho_b_g;
Xi_tilde_bar    = omega_bar / (eta * b_bar^(eta-1)); 
chi_tilde_bar   = 0;
lambda_s_bar    = (mu_p * (1+omega_y) * mu_w_bar *H_bar_bar^-nu * 
                    (1/Z_bar)^(1+omega_y)) /((1-tau_bar)*((pi_b * Omega_bar^(1/nu) 
                    *psi_b^(-1/nu) + (1-pi_b) *psi_s^(-1/nu) ))^nu);
lambda_b_bar    = lambda_s_bar * Omega_bar;
C_bar_b_bar     = s_b*Y_bar * lambda_b_bar^sigma_b;
C_bar_s_bar     = s_s*Y_bar * lambda_s_bar^sigma_s;
Lambda_bar      = (pi_b*lambda_b_bar + (1-pi_b)*lambda_s_bar); 
lambda_tilde_bar= psi*(pi_b*(lambda_b_bar/psi_b)^(1/nu) + (1-pi_b) *(lambda_s_bar/psi_s)^(1/nu))^nu ;
F_bar           = Lambda_bar * (1-tau_bar) / (1-alpha*beta );
K_bar           = Lambda_bar *mu_p * (1+omega_y) * psi * mu_w_bar *lambda_tilde_bar^-1 
                    *H_bar_bar^-nu * (1/Z_bar)^(1+omega_y) / (1-alpha*beta);
B_bar           = C_bar_b_bar*(lambda_b_bar)^(-sigma_b) - C_bar_s_bar*(lambda_s_bar)^(-sigma_s) 
                    - ((lambda_b_bar/psi_b)^(1/nu)-(lambda_s_bar/psi_s)^(1/nu))*(lambda_tilde_bar/psi)
                    ^(-(1+nu)/nu)*H_bar_bar^-nu * (Y_bar/Z_bar)^(1+omega_y) * mu_w_bar * Delta_bar;

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
    deep_parameter_name = M_.param_names(i,:);                           
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);                                                            
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest    = i_d_hat*4;                                                 //*
inflation   = Pi_hat + Pi_hat(-1) + Pi_hat(-2) + Pi_hat(-3);             //*                                                      
inflationq  = Pi_hat*4;                                                  //*
outputgap   = Y_hat - Y_n_hat;                                           //*
output      = Y_hat;                                                     //*
fispol      = e_G;                                                       //*
//**************************************************************************


//**************************************************************************                                                                    
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy                                                       //*
                                                                         //*
interest =   cofintintb1*interest(-1)                                    //* 
           + cofintintb2*interest(-2)                                    //* 
           + cofintintb3*interest(-3)                                    //* 
           + cofintintb4*interest(-4)                                    //* 
           + cofintinf0*inflationq                                       //* 
           + cofintinfb1*inflationq(-1)                                  //* 
           + cofintinfb2*inflationq(-2)                                  //* 
           + cofintinfb3*inflationq(-3)                                  //* 
           + cofintinfb4*inflationq(-4)                                  //* 
           + cofintinff1*inflationq(+1)                                  //* 
           + cofintinff2*inflationq(+2)                                  //* 
           + cofintinff3*inflationq(+3)                                  //* 
           + cofintinff4*inflationq(+4)                                  //* 
           + cofintout*outputgap 	                                     //* 
           + cofintoutb1*outputgap(-1)                                   //* 
           + cofintoutb2*outputgap(-2)                                   //* 
           + cofintoutb3*outputgap(-3)                                   //* 
           + cofintoutb4*outputgap(-4)                                   //* 
           + cofintoutf1*outputgap(+1)                                   //* 
           + cofintoutf2*outputgap(+2)                                   //* 
           + cofintoutf3*outputgap(+3)                                   //* 
           + cofintoutf4*outputgap(+4)                                   //* 
           + cofintoutp*output 	                                         //* 
           + cofintoutpb1*output(-1)                                     //* 
           + cofintoutpb2*output(-2)                                     //* 
           + cofintoutpb3*output(-3)                                     //* 
           + cofintoutpb4*output(-4)                                     //* 
           + cofintoutpf1*output(+1)                                     //* 
           + cofintoutpf2*output(+2)                                     //* 
           + cofintoutpf3*output(+3)                                     //* 
           + cofintoutpf4*output(+4)                                     //*
           + std_r_ *interest_;                                          //* 
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************


// Original Model Code:
// the orginial model monetary policy rule has to be commented out 
(1+i_d)*(1+omega)*beta*((delta+(1-delta)*pi_b)*(lambda_b(+1)/Pi(+1))       //#1 Euler equation household typ b
    + (1-delta)*(1-pi_b)*(lambda_s(+1)/Pi(+1)) )-lambda_b = 0;  

(1+i_d)*beta*( (1-delta)*pi_b*(lambda_b(+1)/Pi(+1)) + (delta+(1-delta)     //#2 Euler equation household typ s
    *(1-pi_b))*(lambda_s(+1)/Pi(+1)) )-lambda_s = 0;

Lambda*mu_p*(1+omega_y)*psi*mu_w*lambda_tilde^-1 * H_bar^(-nu) *(Y/Z)^     //#3 K law of motion
    (1+omega_y) + alpha*beta*Pi(+1)^(theta*(1+omega_y))*K(+1) - K =0;

Lambda*(1-tau)*Y+alpha*beta*Pi(+1)^(theta-1)*F(+1) - F =0;                 //#4 F law of motion

pi_b*(1-pi_b) * B - pi_b*b_g + delta*(b(-1)*(1+omega(-1))+pi_b*b_g(-1))    //#5 Aggregate borrowing law of motion
    *((1+i_d(-1))/Pi) - (1+pi_b*omega)*b =0;

pi_b * C_bar_b*lambda_b^(-sigma_b) + (1-pi_b)*C_bar_s*lambda_s^(-sigma_s)  //#6 Market clearing condition
    + ((Y_bar/b_bar^eta) * Xi_tilde_hat + Xi_tilde_bar)* b^eta + G - Y = 0;

alpha*Delta(-1) *Pi^(theta*(1+omega_y)) + (1-alpha)*((1-alpha*Pi^(theta-1))//#7 Price dispersion law of motion
    /(1-alpha))^((theta*(1+omega_y))/(theta-1)) - Delta =0;

((1-alpha*Pi^(theta-1))/(1-alpha))- (F/K)^((theta-1)/(1+omega_y*theta))=0; //#8 Prices law of motion

1 + (1+varchi)*chi_tilde*b^varchi + eta * ((Y_bar/b_bar^eta) *             //#9 F.O.C. financial intermediary
    Xi_tilde_hat + Xi_tilde_bar) * b^(eta-1) - (1 +omega) = 0;

//i_d_hat = phi_pi * Pi_hat + phi_y * Y_hat  + epsilon_m;                  //#10 Central Bank decision rule        

B=C_bar_b*(lambda_b)^(-sigma_b) - C_bar_s*(lambda_s)^(-sigma_s)            //#11
    - ((lambda_b/psi_b)^(1/nu) - (lambda_s/psi_s)^(1/nu)) * (lambda_tilde
    /psi)^(-(1+nu)/nu) *(mu_w)*H_bar^-nu * (Y/Z)^(1+omega_y)*Delta;

lambda_tilde = psi*(pi_b*(lambda_b/psi_b)^(1/nu)+                          //#12
    (1-pi_b)*(lambda_s/psi_s)^(1/nu))^nu;

Lambda = pi_b * lambda_b + (1-pi_b)*lambda_s;                              //#13


//Exogenous processes in levels: (Long-Run mean adjusted to steady-state values)

C_bar_b         = C_bar_b_bar * (1-rho_C_bar_b) + rho_C_bar_b * C_bar_b(-1) + e_C_bar_b; 
C_bar_s         = C_bar_s_bar * (1-rho_C_bar_s) + rho_C_bar_s * C_bar_s(-1) + e_C_bar_s;
G               = G_bar * (1-rho_G) + rho_G * G(-1) + e_G;
H_bar           = H_bar_bar * (1-rho_H_bar) + rho_H_bar * H_bar(-1) + e_H_bar;
mu_w            = mu_w_bar * (1-rho_mu_w) + rho_mu_w * mu_w(-1) + e_mu_w;
tau             = tau_bar * (1-rho_tau) + rho_tau * tau(-1) + e_tau;
//epsilon_m       = rho_epsilon_m * epsilon_m(-1) + e_epsilon_m;
Xi_tilde_hat    = rho_Xi_tilde * Xi_tilde_hat(-1) + e_Xi_tilde;
chi_tilde       = chi_tilde_bar * (1-rho_chi_tilde) + rho_chi_tilde * chi_tilde(-1) + e_chi_tilde;
Z               = Z_bar * (1-rho_Z) + rho_Z * Z(-1) + e_Z;
b_g             = b_g_bar * (1-rho_b_g_ar) + rho_b_g_ar * b_g(-1) + e_b_g;


//Definitions of log-linear variables with devations from Steady-State

(1 + i_d)/(1+i_d_bar)           = exp(i_d_hat);
lambda_b/lambda_b_bar           = exp(lambda_b_hat); 
lambda_s/lambda_s_bar           = exp(lambda_s_hat);
lambda_tilde/lambda_tilde_bar   = exp(lambda_tilde_hat);
Lambda/Lambda_bar               = exp(Lambda_hat);
Pi                              = exp(Pi_hat);
Y/Y_bar                         = exp(Y_hat) ;
K/K_bar                         = exp(K_hat);
F/F_bar                         = exp(F_hat);
Delta/Delta_bar                 = exp(Delta_hat);
b/b_bar                         = exp(b_hat);
G                               = Y_bar * G_hat + s_g;
chi_tilde                       = chi_tilde_bar + chi_tilde_hat / ((1+varchi)*b_bar^varchi);  

// steady-state deviation of Xi_tilde is plugged 
// directly into the model equations due to numerical issues  

C_bar_s/C_bar_s_bar             = exp(C_bar_s_hat);
C_bar_b/C_bar_b_bar             = exp(C_bar_b_hat);
H_bar/H_bar_bar                 = exp(H_bar_hat);
mu_w/mu_w_bar                   = exp(mu_w_hat);
((1-tau)/(1-tau_bar))^-1        = exp(tau_hat);
(1 + omega)/(1+omega_bar)       = exp(omega_hat);
Z/Z_bar                         = exp(Z_hat);
b_g                             = Y_bar * b_g_hat + b_bar;


//Additional equations (introduces certain endogenous variables for plotting impulse responses)
i_b_hat = i_d_hat + omega_hat;                                              //spread definition
Y_n_hat = (omega_y + sigma_bar^-1)^-1 *(sigma_bar^-1 * (s_c *               //natural output 
          (pi_b*(s_b/s_c)*(C_bar_b_hat)+(1-pi_b)*(s_s/s_c)*(C_bar_s_hat)) 
           + G_hat) +nu*H_bar_hat + (1+omega_y)*Z_hat);

//Definitions of annualizations

i_d_hat_a = i_d_hat*4;
Pi_hat_a = Pi_hat*4;
omega_hat_a = omega_hat *4; 

end;

initval;
Z            = Z_bar;
H_bar        = H_bar_bar;
i_d          = i_d_bar;
mu_w         = mu_w_bar;
tau          = tau_bar; 
lambda_s     = lambda_s_bar;
lambda_b     = lambda_b_bar;
Lambda       = Lambda_bar;
lambda_tilde = lambda_tilde_bar;
Pi           = Pi_bar; 
Y            = Y_bar;
K            = K_bar;
F            = F_bar;
Delta        = Delta_bar; 
b            = b_bar;   
G            = G_bar; 
chi_tilde    = chi_tilde_bar;
//epsilon_m    = 0;  
omega        = omega_bar;
C_bar_b      = C_bar_b_bar;
C_bar_s      = C_bar_s_bar;
b_g          = b_g_bar; 
B            = B_bar;
end;


shocks;
var e_C_bar_s   = C_bar_s_bar^2;
var e_C_bar_b   = C_bar_b_bar^2;
var fiscal_     = 1;
var e_H_bar     = 1;
var e_mu_w      = 1;
var e_tau       = 1;
//var e_epsilon_m = 0.25^2;
var e_Xi_tilde  = 0.01^2;
var e_chi_tilde = 1;
var e_Z         = 1;
var e_b_g       = 4^2;
end;

//stoch_simul(order=1,irf=17,irf_shocks=(e_epsilon_m, e_Z, e_G, e_C_bar_s, e_b_g)) 
//            Y_hat Pi_hat_a i_d_hat_a omega_hat_a b_hat;



  