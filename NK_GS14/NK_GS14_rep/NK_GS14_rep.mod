% Model: NK_GS14
% Replication of "Should MP Lean against the Wind? An Analysis based on a DSGE Model with Banking"
% L. Gambacorta and F.M. Signoretti (2014), Journal of Economic Dynamics & Control 43, pp. 146-174

% Code provided by the authors


var 
c_p     //  1 Patient HHs
d_p     //  2 Patient HHs
lam_p   //  3 Patient HHs
l_p     //  4 Patient HHs
c_e     //  5 Entrepreneurs
k_e     //  6 Entrepreneurs
b_ee    //  7 Entrepreneurs
lam_e   //  8 Entrepreneurs
s_e     //  9 Entrepreneurs
l_pd    // 10 Entrepreneurs
y_e     // 11 Entrepreneurs
r_k     // 12 Entrepreneurs
pie     // 13 Production, CGPs, Retailers
mc_E    // 14 Production, CGPs, Retailers
J_R     // 15 Production, CGPs, Retailers
q_k     // 16 Production, CGPs, Retailers
x       // 17 Production, CGPs, Retailers
I       // 18 Production, CGPs, Retailers
C       // 19 Aggregation & Equilibrium
Y       // 20 Aggregation & Equilibrium
w_p     // 21 Aggregation & Equilibrium
B       // 22 Aggregation & Equilibrium
D       // 23 Aggregation & Equilibrium
K       // 24 Aggregation & Equilibrium
r_ib    // 25 Monetary Policy
J_B     // 26 Banks 
r_b     // 27 Banks 
spread  // 28 Banks 
K_b     // 29 Banks 
R_b     // 30 Banks
lev     // 31 Leverage 
rr      // 32 Real Rate (on loans if possible) 
Y1      // 33 Auxiliary variable 1
mk_y    // 34 Exogenous Process
A_e;    // 35 Exogenous Process


varexo  e_A_e e_mk_y ;

parameters  beta_p beta_e phi m_e_ss gamma_p gamma_e// HOUSEHOLDS & ENTREPRENEURS
            theta  vi   mcspread delta_b // BANKS 
            eps_y mk_y_ss ksi kappa_p kappa_i deltak piss // PRODUCTION & RETAILERS
            r_ib_ss rho_ib phi_pie phi_y phi_AP phi_B      // MON POLICY
            rho_A_e rho_mk_y;     // SHOCKS
            
beta_p   = 0.996;
beta_e   = 0.975;
phi      = 1; // Robustness: High: 1.5, Low: 0.5
m_e_ss   = 0.35; // Hi-LTV case: m_e_ss = 0.70
gamma_p  = 1;
gamma_e  = 1 ;
eps_y    = 6; 
mk_y_ss  = eps_y   / (eps_y  - 1);
ksi    = 0.20;
kappa_p  =  28.65; // Robustness: High: 100, Low: 15
kappa_i  = 5; // For Tech. Shock. For cost-push shock, subst with kappa_i = 0.05
              // Robustness: Tech.Sh.: kappa_i = 0.05, 0.5, 10 
              //             C-p Sh. : kappa_i = 5, 0.5 0.005
deltak    = 0.050;
piss     = 1.00;
r_ib_ss  = (piss/beta_p - 1) ;
theta        = 11; // Robustness: High: 100, Low: 1
vi           = 0.09; // Robustness: High: 0.15, Low: 0.045
mcspread = 0.0050; // = 2% annual
delta_b      =  r_ib_ss + mcspread/vi;
rho_ib   = 0.77; // Robustness: rho_ib = 0
phi_pie  = 0.5; // MP RULE parameter, to be changed for simulations
phi_y    = 0; // MP RULE parameter, to be changed for simulations
phi_AP   = 0;    // MP RULE parameter, to be changed for simulations
phi_B    = 0;    // MP RULE parameter, to be changed for simulations
rho_A_e      = 0.95; // Robustness: rho_A_e  = 0, rho_A_e  = 0.50
rho_mk_y     = 0.50; // Robustness: rho_mk_y = 0, rho_mk_y = 0.75


model;

//// PATIENT HHs

//1. Marginal utility of consumption
exp(c_p)^(-1) = exp(lam_p);

// 2. Euler equation
exp(lam_p) = beta_p*exp(lam_p(+1))*(1+r_ib);

// 3. Labor supply decision
exp(l_p)^phi = exp(lam_p)*exp(w_p);

// 4. Budget constraint
exp(c_p) + exp(d_p) = exp(w_p)*exp(l_p)+(1+r_ib(-1))*exp(d_p(-1))+exp(J_R)/gamma_p;


//// ENTREPRENEURS

//5. Marginal utility of consumption
exp(c_e) ^(-1) = exp(lam_e); 

// 6. Labor demand
exp(w_p) = (1-ksi)*exp(y_e)/(exp(l_pd)*exp(x)); 

// 7. Investment Euler equation
exp(s_e) * m_e_ss * exp(q_k(+1))*(1-deltak)/(1+r_b) + beta_e*exp(lam_e(+1))*(exp(q_k(+1))*(1-deltak) + exp(r_k(+1))) 
    = exp(lam_e) * exp(q_k) ;

// 8. Consumption Euler equation
exp(lam_e)-exp(s_e) = beta_e*exp(lam_e(+1))*(1+r_b);

// 9. Budget constraint
exp(c_e) + (1+r_b(-1)) * exp(b_ee(-1))  +  exp(w_p)*exp(l_pd)  + exp(q_k) * exp(k_e) 
   = exp(y_e) / exp(x) + exp(b_ee) + exp(q_k) * (1-deltak) * exp(k_e(-1))  ;    

// 10. Production function
exp(y_e) = exp(A_e) * ( exp(k_e(-1)) )^ksi * ( exp(l_pd) ) ^ (1-ksi);

// 11. Borrowing constraint
(1+r_b) * exp(b_ee) = m_e_ss * exp(q_k(+1))  * exp(k_e) * (1-deltak);

// 12. Return to capital
exp(r_k) = ksi * exp(A_e) * exp(k_e(-1))^(ksi-1) * ( exp(l_pd) ) ^ (1-ksi) /exp(x); 


//// CAPITAL PRODUCERS

// 13. Capital accumulation
exp(K) = (1-deltak) * exp(K(-1)) + ( 1 - kappa_i/2 * (exp(I)/exp(I(-1)) - 1)^2 ) * exp(I) ;

// 14. FOC
1 = exp(q_k) * ( 1 -  kappa_i/2 * (exp(I)/exp(I(-1)) - 1)^2  - kappa_i * (exp(I)/exp(I(-1)) - 1) * exp(I)/exp(I(-1)) ) 
  + beta_e * exp(lam_e(+1)) / exp(lam_e) * exp(q_k(+1)) *   kappa_i * (exp(I(+1))/exp(I) - 1)  * (exp(I(+1))/exp(I))^2 ; // 14

    
//// RETAILERS

// 15. NK Phillips curve
1 - exp(mk_y)/(exp(mk_y)-1)+ exp(mk_y)/(exp(mk_y)-1)*exp(mc_E) - kappa_p*(exp(pie) - 1)*exp(pie) 
   + beta_p*exp(lam_p(+1))/exp(lam_p)*kappa_p*(exp(pie(+1))-1)*exp(pie(+1))*(exp(Y(+1))/exp(Y)) = 0;

// 16. with
exp(mc_E) = 1 / exp(x);

//// AGGREGATION & EQUILIBRIUM 

exp(C)              = gamma_p*exp(c_p) + gamma_e*exp(c_e); // 17.
gamma_e * exp(l_pd) = gamma_p*exp(l_p); // 18.
exp(B)              = gamma_e*exp(b_ee); // 19.
exp(D)              = gamma_p*exp(d_p) ; // 20.
exp(K)              = gamma_e*exp(k_e); //  21.
exp(B)              = exp(D) + exp(K_b);  // // 22.
exp(Y)              = gamma_e*exp(y_e); // 23.
exp(Y)              = exp(C) + exp(q_k)*(exp(K) - (1-deltak)*exp(K(-1))) + delta_b*exp(K_b(-1)); // 24.

           
//// MONETARY POLICY 
// 25. Interest rate rule
(1+r_ib) = (1+r_ib_ss)^(1-rho_ib)*(1+r_ib(-1))^rho_ib*((exp(pie)/piss)^phi_pie*(exp(Y1)/exp(steady_state(Y1)))^phi_y  
           *(exp(q_k)/exp(steady_state(q_k)))^phi_AP*(exp(B)/exp(steady_state(B)))^phi_B)^(1-rho_ib);
                 
////EXOGENOUS PROCESSES

// 26. Technology shock
exp(A_e)  = 1 - rho_A_e + rho_A_e*exp(A_e(-1)) + e_A_e;

// 27. Goods' mark-up shock
exp(mk_y) = (1-rho_mk_y)*mk_y_ss + rho_mk_y*exp(mk_y(-1)) + e_mk_y;


//// BANKS 

// 28. Aggregate bank profits
exp(J_B)  = (r_b*exp(B) - r_ib*exp(D) - theta/2*(exp(K_b)/exp(B) - vi)^2 *exp(K_b));

// 29. Retail loan rate
r_b = R_b + mcspread ;

// 30. Spread
spread = r_b - r_ib;

// 31. FOC
R_b   = - theta*(exp(K_b)/exp(B) - vi)*(exp(K_b)/exp(B))^2 + r_ib ;

//32. Aggregate bank capital
exp(K_b)  = ((1-delta_b)*exp(K_b(-1)) + exp(J_B(-1)));

// 33 Real rate
rr = r_b - exp(pie);

// 34. Auxiliary variable 1
exp(Y1)   = exp(C)+exp(I);

// 35. Leverage
exp(lev)  =  exp(B)/exp(K_b);

end;


initval;
c_p   	=	-0.137462976;
d_p   	=	-0.559765003;
lam_p 	=	0.137462976	;
l_p   	=	-0.114893574;
c_e   	=	-2.690622647;
k_e   	=	0.65064922;
b_ee  	=	-0.465454324;
lam_e 	=	2.690622647;
s_e   	=	-0.643270157;
l_pd  	=	-0.114893574;
y_e   	=	0.038214985;
r_k   	=	-2.404193704;
pie   	=	0;
mc_E  	=	-0.182321557;
J_R   	=	-1.753544484;
q_k   	=	0;
x     	=	0.182321557;
I     	=	-2.345083053;
C     	=	-0.062508258;
Y     	=	0.038214985;
w_p   	=	-0.252356549;
B     	=	-0.465454324;
D     	=	-0.559765003;
K     	=	0.65064922;
r_ib  	=	0.01010101;
J_B   	=	-5.596717606;
r_b   	=	0.01510101;
spread	=	0.005;
K_b   	=	-2.873399932;
R_b   	=	0.01510101;
lev   	=	2.407945609;
rr    	=	-0.98489899;
Y1    	=	0.034637676;
mk_y  	=	0.182321557;
A_e   	=	-3E-15;
end;

steady(solve_algo=0);
resid;

shocks;
var e_A_e            =  1;
var e_mk_y           =  1; 
end;

// Stochastic simulations 
options_.nograph   = 1;
//options_.nomoments = 1;
//options_.noprint   = 1;
stoch_simul(order=1,irf=20, periods=10000) pie Y I lev r_ib r_b;
%stoch_simul(order=1,irf=20);

