% Model file for "Financial Intermediation, Investment Dynamics, and
% Business Cycle Fluctuations" by Andrea Ajello, American Economic Review, 2016

% Original code obtained from AER and reviewed/modified by
% Maximilian Mayer --- 04.04.2018

%% Model Variables and Paramters Declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declare model variables
var     
AI                      % Integral of A_{i_t}x \iota_{i,t} for all i
AIK                     % Integral of A_{i_t}x \iota_{i,t} for keepers (i = k)
AIS                     % Integral of A_{i_t}x \iota_{i,t} for savers (i = s)  
A_eff                   % Effective investment technology A_{eff} (i = s)  
Ak_over_P               % Integral of A_{i_t} \ P_t^K for keepers (i = k)
B_t                     % Government bonds
BoY_t                   % Government bonds as fraction of GDP                
CASH_t                  % Cash share (as of Table 1)
D_t                     % Dividend payoffs (intermediate good producers)
Delta_N                 % Traded equity claims
FGS                     % Finangin Gap Share
FGS_num     			% Financing Gap (numerator of FGS)
FGS_obs        			% Finangin Gap Share plus Measurement Error
FGSgap_t                % FGS (model-consistennt HP filtered series)
GDP_t                   % GDP
Ihat          			% Investment
Kbar                    % Capital stock
LIQS_t                  % Liquidation Share (as of Table 1)
N_t                     % Equity stock 
QK						% Price of investment units (P_t^K)             
Q_t_A                   % Sale price of equity
Q_t_B         			% Purchase price of equity
QtilK_iota_t        	% Integrals of tech distribution for Euler eq. (keepers)
QtilS_iota_t            % Integrals of tech distribution for Euler eq. (sellers)
S                       % Investment Adjustment Cost Function
SMG     				% Stock market growth
SMG_bar                 % 4-quarter stock-market growth rate
SMGm1                   % Stock market growth (lag 1)
SMGm2                   % Stock market growth (lag 2)
SMGm3                   % Stock market growth (lag 3)
Spread_ob_t             % Spread plus measurement error
Spread_t 				% Spread
Spreadgap_t             % Spread (model-consistent HP-filtered series)
Sprime                  % Investment Adjustment Costs (first derivative)
T_t                     % Taxes  
ToY_t                   % Taxes as a fraction of GDP
beta_t                  % Time-varying discount factor
chat                    % Consumption
chi_k                   % Fraction of keepers
chi_s                   % Fraction of savers
chi_spk                 % Fraction of savers and keepers
chi_w                   % Fraction of buyers/workers
ctau_q_t                % Transitory financial intermediation shock
d_FGS_num               % Growth rate of financing gap
d_GDP                   % Growth rate of real GDP
d_GDPm1                 % Growth rate of real GDP (lag 1)
d_GDPm2                 % Growth rate of real GDP (lag 2)
d_GDPm3                 % Growth rate of real GDP (lag 3)
d_Ihat                  % Growth rate of real Investment
d_chat                  % Growth rate of real Consumption
dlnwhat                 % Growth rate of real wages
eta_beta                % Intertemporal preference shock    
etau_q_t                % Persistent financial intermediation shock
e_p                     % Price mark-up shock
e_w                     % Wage mark-up shock
g_t                     % Government spending
i_ob_t					% FFR observed   
i_t                     % FFR (Taylor rule)
invQ_til_As             % Integrals of tech distribution for Euler eq. 
iota_k                  % Investment goods demand (keepers)
iota_s  				% Investment goods demand (savers)
iota_t                  % Investment goods demand (total)
l                       % Hours worked
l_ob_t                  % Hours worked observed
lambda_p_t              % Price mark-up
lambda_t                % Marginal Utility of consumption
lambda_w_t              % Wage mark-up
mchat                   % Marginal cost
phi_t                   % Liquidity shock
pi_ob_t                 % Inflation observed
pi_t                    % Inflation
pi_tm1                  % Inflation (lag 1)
pi_tm2                  % Inflation (lag 2)
pi_tm3                  % Inflation (lag 3)
pistar                  % Inflation target
r                       % Real rate           
rK                      % Rate of return on capital
sdf                     % Stochastic discount factor (nominal)
sdfr                    % Stochastic discount factor (real)
sg                      % Investment technology dispersion
tau_q_t                 % Financial intermediation wedge
what_t					% Real wage            
ygap_t                  % Output Gap (model-consistent HP-filtered series)
yhat                    % output  = GDP
z_t;                    % TFP growth 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% exogenous variables
%eps_z           % technology shock
%eps_g                   % government expenditure shock
%eps_i                   % monetary policy shock
%eps_tau                 % permanent intermediation shock
%eps_tau_trans           % transitory intermediation shock
%eps_phi                 % 
%eps_beta                % intertemporal preference shock
%eps_p                   % price mark-up shock
%eps_w                   % wage mark-up shock
%eps_meas                % measurement error I
%eps_meas_sp             % measurement error II
%eps_sg;                 % variance shock
varexo  eps_z  eps_g  eps_i  eps_tau eps_tau_trans eps_beta  eps_p  eps_w  eps_meas  eps_meas_sp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declare model parameters
parameters
gam_s       
bet_s       
delta       
nu          
h           
l_ss        
eta         
lambda_p    
xi_p        
iota_p      
lambda_w    
xi_w        
iota_w      
mu_ss          
sg_ss          
fgs_param   
theta       
Bs_ss       
gs_ss       
etau_q_ss   
theta_I     
pis         
rho_i       
phi_pi      
phi_DY      
phi_Ygap    
tB %\varphi_B in paper notation         
rho_z       
rho_g       
rho_tau     
decay       
rho_beta    
rho_p       
rho_w       
theta_p     
theta_w     
s_z         
s_g         
s_i         
s_tau       
s_tau_trans 
s_phi
s_sg
s_beta      
s_p         
s_w         
s_meas_sp   
s_meas;

% Calibrate model parameters (order and numbers correspond to Table 2 in the paper)
gam_s        =  0.50;
bet_s        =  0.632;
delta        =  0.0250;
nu           =  2.38;
h            =  0.843;
l_ss         =     0;
eta          =  0.748;
lambda_p     =  0.15;
xi_p         =  0.813;
iota_p       =  0.203;
lambda_w     =  0.15;
xi_w         =  0.927;
iota_w       =  0.431;
mu_ss        =     0;
sg_ss        =  0.0147;
fgs_param    =  0.35;
theta        =  0.677;
Bs_ss        =  0.02;
gs_ss        =  0.17;
etau_q_ss    =  3.52;
theta_I      =  0.755;
pis          =  0.312;
rho_i        =  0.828;
phi_pi       =  0.46;
phi_DY       =  0.156;
phi_Ygap     =  0;
tB           =  0.236;
rho_z        =  0.379;
rho_g        =  0.996;
rho_tau      =  0.986;
decay        =  0.771;
rho_beta     =  0.487;
rho_p        =  0.707;
rho_w        =  0.159;
theta_p      =  0.194;
theta_w      =  0.148;
s_z          =  0.601;
s_g          =  0.153;
s_i          =  0.121;
s_tau        =  0.143;
s_tau_trans  =  0.154;
s_phi        =  0;
s_sg         =  0;
s_beta       =  2.37;
s_p          =  0.069;
s_w          =  0.308;
s_meas_sp    =  0.025;
s_meas       =  0.148;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% model equations
model;
#pi_ss    = pis/100;
#gam      = gam_s/100;
#bet      = 1/(bet_s/100 + 1);  
#tau_q_ss = etau_q_ss/100;   
#kp       = (1-xi_p*bet)*(1-xi_p)/(xi_p*(1+iota_p*bet));
#chi0     = exp(steady_state(what_t))/(exp(lambda_w))/((1/exp(steady_state(lambda_t)))*((exp(steady_state(l))))^(nu));
#phi_ss    = steady_state(phi_t);
#rho_tau_trans = rho_tau*decay;

// Household
phi_t = phi_ss;
beta_t - bet*exp(eta_beta); % checked 
(lambda_t - steady_state(lambda_t)) - ( exp(gam)/(exp(gam) - h*bet) * ( (z_t - gam) - exp(gam)/(exp(gam) - h) * ((chat - steady_state(chat)) + (z_t - gam)) + h/(exp(gam) - h) * (chat(-1) - steady_state(chat)) ) + h*bet/(exp(gam) - h*bet) * ( exp(gam)/(exp(gam)-h) * ((chat(1) - steady_state(chat)) +  (z_t(1) - gam)) - h/(exp(gam)-h) * (chat - steady_state(chat))) + ((exp(gam) - h*bet*rho_beta)/(exp(gam) - h*bet))*eta_beta );
(sdfr - steady_state(sdfr)) - ( (lambda_t - steady_state(lambda_t)) - (lambda_t(-1) - steady_state(lambda_t)) - (z_t - gam) );
(sdf - steady_state(sdf))   - ( (lambda_t - steady_state(lambda_t)) - (lambda_t(-1) - steady_state(lambda_t)) - (z_t - gam) - (pi_t - pi_ss));

exp(Q_t_B) - exp(sdfr(1)) * ( exp(Q_t_B(+1)) * (exp(invQ_til_As(+1))) *
                        (exp(rK(1)) + exp(phi_t(1))*exp(Q_t_A(1))*(1-delta)) + exp(chi_s(1))*(1-exp(phi_t(1)))*exp(Q_t_B(1))*(1-delta) +
                              exp(Q_t_B(+1)) * (exp(Ak_over_P(+1))) * 
                        (exp(rK(1))) + exp(chi_k(1))*exp(Q_t_B(1))*(1-delta) + 
                           exp(chi_w(1)) * (exp(rK(1)) + exp(Q_t_B(1))*(1-delta) ) );                           
                                         
1/exp(r) -   exp(sdfr(1)) *  ( exp(invQ_til_As(1))*exp(Q_t_B(+1)) + exp(Ak_over_P(1))*exp(Q_t_B(+1)) + exp(chi_w(1))  );
1/exp(i_t) - exp(sdf(1)) *   ( exp(invQ_til_As(1))*exp(Q_t_B(+1)) + exp(Ak_over_P(1))*exp(Q_t_B(+1)) + exp(chi_w(1))  );

// Bank 13 - 

exp(Q_t_B) - exp(Q_t_A)*(exp(tau_q_t));

// Savers and Keepers


exp(chi_w)   - (1/2 + 1/2*erf((log(exp(QK)/exp(Q_t_B)) - mu_ss)/(sqrt(2)*sg)) - 0);   %checked ..derived from p2273
exp(chi_spk) - (exp(chi_s) + exp(chi_k));  //Definition
exp(chi_s)        - (1 - (1/2 + 1/2*erf((log(exp(QK)/exp(Q_t_A)) - mu_ss)/(sqrt(2)*sg)))); %p. 2272 --- share of savers
exp(invQ_til_As)  - (  ( -( exp(QK)*theta* (-1)) + exp(mu_ss + sg^2/2)*exp(Q_t_A)*(-1))/(2*exp(QK)*exp(Q_t_A)*(-1 + theta)) - 
                       ( -( exp(QK)*theta* erf((mu_ss - log(exp(QK)/exp(Q_t_A)))/(sqrt(2)*sg))) + exp(mu_ss + sg^2/2)*exp(Q_t_A)*erf((mu_ss + sg^2 - log(exp(QK)/exp(Q_t_A)) )/ (sqrt(2)*sg)))/(2*exp(QK)*exp(Q_t_A)*(-1 + theta)) ) ; 
exp(QtilS_iota_t) -  exp(chi_s)/(exp(QK)*(1-theta)); % checked
exp(AIS)         -  ( (exp(mu_ss + sg^2/2)*(-1))/ (2*exp(QK)*(-1 + theta)) - (exp(mu_ss + sg^2/2)*erf((mu_ss + sg^2 - log(exp(QK)/exp(Q_t_A)))/(sqrt(2)*sg)))/ (2*exp(QK)*(-1 + theta)) ) *
                    (exp(rK)*exp(N_t(-1))/exp(z_t) + exp(r(-1))*exp(B_t(-1))/exp(z_t) + exp(D_t) - exp(T_t) + exp(phi_t)*exp(Q_t_A)*(1-delta)*exp(N_t(-1))/exp(z_t)) ;
exp(iota_s)       - exp(QtilS_iota_t) *                     
                          (exp(rK)*exp(N_t(-1))/exp(z_t) + exp(r(-1))*exp(B_t(-1))/exp(z_t) + exp(D_t) - exp(T_t) + exp(phi_t)*exp(Q_t_A)*(1-delta)*exp(N_t(-1))/exp(z_t)); %eq p16
                    
exp(chi_k)       - (1/2 + 1/2*erf((log(exp(QK)/exp(Q_t_A)) - mu_ss)/(sqrt(2)*sg)) - (1/2 + 1/2*erf((log(exp(QK)/exp(Q_t_B)) - mu_ss)/(sqrt(2)*sg)))); %checked
exp(Ak_over_P)   - ((exp(mu_ss + 1/2 * sg^2)*(normcdf((mu_ss + sg^2 - log(exp(QK)/exp(Q_t_B)))/sg) - normcdf((mu_ss + sg^2 - log(exp(QK)/exp(Q_t_A)))/sg) ))/exp(QK));
exp(QtilK_iota_t) - exp(chi_k)/exp(QK); %checked
exp(AIK)          - ( exp(Ak_over_P) * (exp(rK)*exp(N_t(-1))/exp(z_t) + exp(r(-1))*exp(B_t(-1))/exp(z_t) + exp(D_t) - exp(T_t)) ) ;
exp(iota_k)       - exp(QtilK_iota_t)  *
                         (exp(rK)*exp(N_t(-1))/exp(z_t) + exp(r(-1))*exp(B_t(-1))/exp(z_t) + exp(D_t) - exp(T_t)); %eq a87

exp(AI) - exp(AIK) - exp(AIS); % Definition

exp(iota_t) - (exp(QtilS_iota_t) *                     
                         ( exp(rK)*exp(N_t(-1))/exp(z_t) + exp(r(-1))*exp(B_t(-1))/exp(z_t) + exp(D_t) - exp(T_t) + exp(phi_t)*exp(Q_t_A)*(1-delta)*exp(N_t(-1))/exp(z_t)) +
               exp(QtilK_iota_t)  *
                         ( exp(rK)*exp(N_t(-1))/exp(z_t) + exp(r(-1))*exp(B_t(-1))/exp(z_t) + exp(D_t) - exp(T_t)) );   %checked---eq p87  

exp(N_t) - ( exp(AI) + (1-delta)*exp(N_t(-1))/exp(z_t) ); 

exp(Delta_N) - ( theta*exp(QK)/exp(Q_t_A)*exp(iota_s) + exp(phi_t)*(1-delta)*exp(chi_s)*exp(N_t(-1))/exp(z_t));

exp(N_t) - exp(Kbar); // eq a101

exp(A_eff) - (exp(AI)/exp(iota_t)); 

// Capital Producers

S - ( 0.5*theta_I*(exp(Ihat)/exp(Ihat(-1))*exp(z_t)-exp(gam))^2 );

Sprime - ( theta_I*(exp(Ihat)/exp(Ihat(-1))*exp(z_t)-exp(gam)));

exp(QK) - ( ( 1 - exp(sdfr(1))*exp(QK(1))*Sprime(1)*(exp(Ihat(1))/exp(Ihat)*exp(z_t(1)))^2)/((1-(Sprime*(exp(Ihat)/exp(Ihat(-1))*exp(z_t))+S))) );

exp(iota_t) - (1 - S)*exp(Ihat); //eq p28

// Government and Central Bank

exp(ToY_t) = exp(T_t)/exp(yhat);
exp(BoY_t) = exp(B_t(-1))/exp(yhat) / exp(z_t);

exp(ToY_t)/exp(steady_state(ToY_t)) = ((exp(BoY_t)/(exp(steady_state(BoY_t))))^(tB)); %eq p33

(1 - 1/exp(g_t))*exp(yhat) + exp(r(-1))*exp(B_t(-1))/exp(z_t) - exp(T_t) - exp(B_t);  %eq p32

i_t - (rho_i*i_t(-1) + (1-rho_i)*((steady_state(r) + (pi_t + pi_t(-1)+pi_t(-2)+pi_t(-3))/4) + phi_pi*((pi_t + pi_t(-1)+pi_t(-2)+pi_t(-3))/4 - pistar) + phi_Ygap*(ygap_t) + phi_DY*(d_GDP + d_GDP(-1) + d_GDP(-2) + d_GDP(-3))/400) + eps_i/100);

(ygap_t+1600*(ygap_t(+2) - 4*ygap_t(+1) + 6*ygap_t - 4*ygap_t(-1) + ygap_t(-2))) = 1600*(yhat(+2) - 4*yhat(+1) + 6*yhat - 4*yhat(-1) + yhat(-2));

// Firms

exp(D_t) - ( exp(yhat) - exp(rK)*exp(N_t(-1))/exp(z_t) - exp(what_t)*exp(l) + (exp(QK)*(1-S)*exp(Ihat) - exp(Ihat)) + (exp(Q_t_B) - exp(Q_t_A) )*exp(Delta_N)  ); %eq a96

exp(mchat) - ( 1/((1-eta)^(1-eta) * eta^eta) * exp(rK)^(1-eta) * exp(what_t)^(eta) );  % eq a77

exp(Kbar(-1))/( exp(z_t) * exp(l) ) - ( exp(what_t)/exp(rK) * (1-eta)/eta );  %eq a76

(pi_t - pi_ss) - (bet/(1+iota_p*bet) * (pi_t(1) - pi_ss)  
               + iota_p/(1+iota_p*bet)*(pi_t(-1) - pi_ss)
               + kp*(mchat - steady_state(mchat))
               + (lambda_p_t - lambda_p));

exp(yhat)  - ((exp(Kbar(-1))/exp(z_t))^(1-eta)*exp(l)^eta);
exp(yhat)  - (exp(chat) + exp(Ihat) + (1 - 1/exp(g_t))*exp(yhat)  ); %eq. a98

// Wage block

% If you want to assume that wages are sticky, then use:
(what_t - steady_state(what_t)) - ( (1/(1+bet))*(what_t(-1) - steady_state(what_t))
      + (bet/(1+bet))*(what_t(1) - steady_state(what_t))
      + ((iota_w)/(1+bet)) * ( (pi_t(-1) - pi_ss)  + (z_t(-1) - gam) )
      - ((bet*iota_w + 1)/(1+bet)) * ( (pi_t - pi_ss)  + (z_t - gam) )
      + (bet/(1+bet)) * ( (pi_t(1) - pi_ss)  + (z_t(1) - gam) ) 
      + ((1-xi_w*bet)*(1-xi_w)/(1+bet)) * (eta_beta - (lambda_t - steady_state(lambda_t)) + nu*(l - l_ss) - (what_t - steady_state(what_t))) + (lambda_w_t - lambda_w) );  

% If you want to assume that wages are flexible (as in online appendix K), then use:
% exp(what_t)  -  chi0*(1/exp(lambda_t))*((exp(l)))^(nu) * exp(lambda_w_t);      

// Definitions
exp(GDP_t) - (exp(chat) + exp(Ihat) + (1 - 1/exp(g_t))*exp(yhat)); 
pistar - pi_ss;

%// Exogenous processes (check)

z_t         - ( (1-rho_z)*gam + rho_z*z_t(-1) + eps_z/100);
etau_q_t    - ( (1-rho_tau)*tau_q_ss + rho_tau*etau_q_t(-1) + eps_tau/100 );
ctau_q_t    - (  rho_tau_trans*ctau_q_t(-1) + eps_tau_trans/100);
tau_q_t     - (  etau_q_t + ctau_q_t  );
g_t         - ( (1-rho_g)*gs_ss  + rho_g*g_t(-1) + eps_g/100);
eta_beta    - ( rho_beta*eta_beta(-1) + eps_beta/100 );
lambda_p_t  - ( (1-rho_p)*lambda_p + rho_p*lambda_p_t(-1) + eps_p/100 + theta_p*e_p(-1)/100);
lambda_w_t  - ( (1-rho_w)*lambda_w + rho_w*lambda_w_t(-1) + eps_w/100 + theta_w*e_w(-1)/100);
% Liquidity shock (as described in online appendix D)
%phi_t       - ( (1-rho_phi)*phi_ss + rho_phi*phi_t(-1) + eps_phi);

e_p          - eps_p;
e_w          - eps_w;


% Constant dispersion of investment technology distribution:
sg           - sg_ss;
% You can substitute the previous equation with the following: 
% log(sg)     - (1-rho_sg)*log(sg_ss) - rho_sg*log(sg(-1)) - eps_sg;
% to add a risk shock to the dispersion of investment technology distribution.

// Observation equations

(d_chat)      -     100*(chat - chat(-1) + z_t - gam);
(d_Ihat)      -     100*(Ihat - Ihat(-1) + z_t - gam);
(d_GDP)       -     100*(GDP_t - GDP_t(-1) + z_t - gam);
(dlnwhat)     -     100*(what_t - what_t(-1) + z_t - gam);
pi_ob_t       -     100*pi_t;
i_ob_t        -     100*i_t;
l_ob_t        -     100*l;
FGS_obs       -     ((FGS) + eps_meas);
Spread_ob_t   -     (400*(Spread_t)) - eps_meas_sp;

(FGSgap_t+1600*(FGSgap_t(+2) - 4*FGSgap_t(+1) + 6*FGSgap_t - 4*FGSgap_t(-1) + FGSgap_t(-2))) = 1600*(FGS_obs(+2) - 4*FGS_obs(+1) + 6*FGS_obs - 4*FGS_obs(-1) + FGS_obs(-2));

// Auxiliary variables

exp(Spread_t) -  (((exp(rK(1)) + exp(Q_t_A(1))*(1-delta))*exp(pi_t(1))/exp(Q_t_A))/exp(i_t));

exp(FGS)      - ( (exp(Q_t_A)*exp(Delta_N) + exp(chi_spk)*exp(r(-1))*exp(B_t(-1))/exp(z_t))   /   (exp(Ihat)) );

exp(FGS_num)  - ( (exp(Q_t_A)*exp(Delta_N) + exp(chi_spk)*exp(r(-1))*exp(B_t(-1))/exp(z_t))  );

d_FGS_num     -     100*(FGS_num - FGS_num(-1) + z_t - gam);

(Spreadgap_t+1600*(Spreadgap_t(+2) - 4*Spreadgap_t(+1) + 6*Spreadgap_t - 4*Spreadgap_t(-1) + Spreadgap_t(-2))) = 1600*(Spread_ob_t(+2) - 4*Spread_ob_t(+1) + 6*Spread_ob_t - 4*Spread_ob_t(-1) + Spread_ob_t(-2));

d_GDPm1       - d_GDP(-1);
d_GDPm2       - d_GDPm1(-1);
d_GDPm3       - d_GDPm2(-1);
pi_tm1        - pi_t(-1);
pi_tm2        - pi_tm1(-1);
pi_tm3        - pi_tm2(-1);

SMG     - ( 100*(log(exp(Q_t_B)*exp(N_t)) - log((exp(Q_t_B(-1))*exp(N_t(-1)))) + z_t - gam));
SMGm1   - SMG(-1);
SMGm2   - SMGm1(-1);
SMGm3   - SMGm2(-1);
SMG_bar - (SMG + SMGm1 + SMGm2 + SMGm3)/4;

exp(LIQS_t)  - (exp(Q_t_A)*((exp(phi_t))*(1-delta) * exp(chi_s) * exp(N_t(-1))/exp(z_t)) + (exp(chi_s)+exp(chi_k))*exp(r(-1))*exp(B_t(-1))/exp(z_t))/((exp(FGS))*exp(Ihat));
exp(CASH_t)  - ((exp(chi_s)+exp(chi_k))*exp(r(-1))*exp(B_t(-1))/exp(z_t))/((exp(FGS))*exp(Ihat));

end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assign values to shock variances
shocks;
var eps_z          = s_z^2;
var eps_g          = s_g^2;
var eps_i          = s_i^2;
var eps_tau        = s_tau^2;
var eps_tau_trans  = s_tau_trans^2;
var eps_beta       = s_beta^2;
var eps_p          = s_p^2;
var eps_w          = s_w^2;
end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stoch_simul(periods=0, IRF=30, order = 1, conditional_variance_decomposition=[6], nograph);
