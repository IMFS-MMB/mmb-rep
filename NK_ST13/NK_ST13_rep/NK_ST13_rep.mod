% Model: NK_S13

% Further Reference: 
% Stracca, L. 2013. "Inside Money in General Equilibrium: Does it matter for monetary policy?".
% Macroeconomic Dynamics 17, pp. 563-590.

% Created by Felix Strobel (18.10.17)

var c i y n w k delta_k m d b l R Rd Rl lambda xi psi pi rmc yk yn f EFP IMP alpha omega A theta
    c_fe i_fe y_fe n_fe w_fe k_fe delta_k_fe m_fe d_fe b_fe l_fe R_fe Rd_fe Rl_fe lambda_fe xi_fe psi_fe rmc_fe yk_fe yn_fe f_fe EFP_fe IMP_fe
    outputgap;

varexo q epsilon_theta j epsilon_r; 

parameters phi rho_alpha phi_d beta gamma chi rho_theta phi_p phi_k delta sigma 
 rho rho_pi sigma_r sigma_theta sigma_j sigma_q rho_omega mu
c_ss i_ss y_ss n_ss w_ss k_ss m_ss d_ss b_ss l_ss R_ss Rd_ss Rl_ss lambda_ss xi_ss psi_ss pi_ss rmc_ss yk_ss yn_ss f_ss EFP_ss IMP_ss alpha_ss omega_ss A_ss theta_ss;

beta 		= 0.995 ;   % discount factor
phi 		= 3 ;       % weight of disutility of labor
gamma 		= 0.35 ;    % capital share
delta 		= 0.025 ;   % depreciation rate
sigma 		= 0.00675 ; % cost paameter for loan intermediation
phi_d 		= 10 ;      % deposit adjustment cost parameter
rho_alpha 	= 0.88 ;    % persistence of alpha-shock
phi_p 		= 58.25 ;   % price adjustment cost parameter
phi_k 		= 4 ;       % investment adjustment cost parameter
rho 		= 0.75 ;    % interest rate smoothing parameter
rho_pi 		= 1.5 ;     % Taylor rule parameter for inflation
sigma_r		= 0.0025 ;  % std. dev. of interest rate shocks
sigma_theta 	= 0.008 ;   % std. dev. of tech. shocks 
sigma_j		= 0.0018 ;  % std. dev. of omega shocks
sigma_q		= 0.006 ;   % std. dev. of alpha-shocks
rho_omega 	= 0.9 ;     % persistence of omega shock
chi 		= 0 ;       % slope of trend in TFP
rho_theta 	= 0.95;      % persistence of tech. shock
mu 		= 6 ;           % elasticity of substitution between varieties of final goods

A_ss        = 1;        % stst. of TFP
omega_ss 	= 0.0009 ;  % stst. of parameter for bank's maintenance cost of deposit
alpha_ss	= 0.7;      % stst of CIA parameter
pi_ss		= 1 ;       % steady state inflation
psi_ss      = beta;     % stst of SDF
delta_k_ss  = 0;        % stst of rate of change of capital
theta_ss    = 0;        % stst of tech. shock
rmc_ss =(mu-1)/mu;      % stst of real marginal cost      
R_ss  = 1/beta;         % steady state interest rate on bonds
Rl_ss=sigma/beta+R_ss;  % stst. of loan rate
Rd_ss=R_ss-0.017/4;     % stst. of deposit rate
yk_ss = Rl_ss*(1-beta*(1-delta))/(beta*rmc_ss);
y_over_k = yk_ss/gamma;
k_over_n=y_over_k^(1/(gamma-1));
y_over_n=k_over_n^gamma;
yn_ss = y_over_n*(1-gamma);
w_ss=yn_ss*beta*rmc_ss/Rl_ss;     % stst. of real wage                     
lambda_ss=phi/w_ss;
xi_ss=lambda_ss*beta*(R_ss-Rd_ss);
c_ss = 1/(lambda_ss*(1+alpha_ss*beta*(R_ss-Rd_ss)));
d_ss= c_ss*alpha_ss;
n_ss = (c_ss+d_ss*beta*(R_ss-Rd_ss))/(y_over_n-delta*k_over_n-w_ss*sigma-sigma*delta*k_over_n);
y_ss=y_over_n*n_ss; % stst. of output
k_ss=k_over_n*n_ss; % stst. of capital
i_ss=delta*k_ss;    % stst. of investment
l_ss=w_ss*n_ss+i_ss; % stst. of loans
m_ss = (R_ss-Rd_ss)*d_ss/(R_ss-1);
omega_ss = (R_ss-Rd_ss)*beta*m_ss;
f_ss = sigma*l_ss+omega_ss*d_ss/m_ss; % stst. of financial intermediation cost 
b_ss = l_ss-d_ss;       % stst. of bonds held by households
EFP_ss = Rl_ss-R_ss;    % external finance premium
IMP_ss = R_ss-Rd_ss;    % inside money premium


model;

%Household problem
alpha * c = d ;												// Deposit in advance constraint
1 / c - lambda - xi * alpha = 0 ;							// First order condition c						
lambda = phi / w ;											// First order condition n
lambda = beta * R * lambda(+1) / pi(+1) ;					// First order condition b
beta * lambda(+1) * (R - Rd) / pi(+1) + phi_d * (d - d(-1) / pi) = beta * phi_d / pi(+1) * (d(+1) - d / pi(+1)) + xi ;		// First order condition d (Fehler in paper -xi)

%Firms problem
y = A * k(-1)^gamma * n^(1 - gamma) ;						// Production function
A = exp(theta) ;											// TFP
k = i + (1 - delta) * k(-1) ;							// l.o.m. of capital
yk = gamma * y/k(-1) ;											// Marginal productivity capital
yn = (1 - gamma) * y / n ;									// Marginal productivity labor
%rmc = psi(+1) * w * Rl / (yn * pi(+1)) ;					// Real marginal costs
w = rmc*yn * pi(+1)/ (psi(+1) * Rl) ;							// First order condition n	
Rl(-1) / pi + phi_k * delta_k = rmc*yk + phi_k * psi(+1) * delta_k(+1) + psi(+1) * Rl * (1 - delta) / pi(+1) ;          // First order condition k
lambda * (pi - 1) * pi = lambda / phi_p * (1 - mu + mu * rmc) + beta * lambda(+1) * (pi(+1) - 1) * pi(+1) * y(+1) / y ;	// NK Philips curve
l = i + w*n;

%Financial intermediary
l = b + d ;									// Budget constraint
psi(+1) * (Rl - R) / pi(+1) = sigma ;					// First order condition l
psi(+1) * (R - Rd) / pi(+1) = omega / m ;				// First order condition d
m = sqrt(omega * d * pi(+1) / (psi(+1) * (R - 1))) ;	// First order condition m

%Central bank
R = (1 - rho) * (1 / beta + rho_pi * (pi - 1)) + rho * R(-1) + epsilon_r ;	// Interest rate rule

% Aggregate Resource Constraint
y = c + i + phi_k / 2 * delta_k^2 + phi_p / 2 * (pi - 1)^2 * y + omega * d / m + sigma * l ; //								

%Definitions:
psi = beta * lambda / lambda(-1) ;	// Stochastic discount factor
delta_k = k - k(-1) ;				// change of capital
EFP = Rl - R;                       // External finance premium
IMP = R - Rd;                       // Inside Money premium
f = sigma * l + omega * d / m ;	    // costs of financial intermediation

%Shocks
alpha = rho_alpha * alpha(-1) + (1 - rho_alpha) * alpha_ss + q ;
theta = rho_theta * theta(-1) + epsilon_theta ;					
omega = (1 - rho_omega) * omega_ss + rho_omega * omega(-1) + j ;

%%%Frictionless Eq.%%%%%%%%%%%%%%%%%%%

alpha * c_fe = d_fe ;												// Deposit in advance constraint
1 / c_fe - lambda_fe - xi_fe * alpha = 0 ;							// First order condition c						
lambda_fe = phi/ w_fe ;											// First order condition n
lambda_fe = beta * R_fe * lambda_fe(+1);					// First order condition b
beta * lambda_fe(+1) * (R_fe - Rd_fe) + phi_d * (d_fe - d_fe(-1)) = beta * phi_d  * (d_fe(+1) - d_fe) + xi_fe ;		// First order condition d (Fehler in paper -xi)
y_fe = A * k_fe(-1)^gamma * n_fe^(1 - gamma) ;						// Production function
k_fe = i_fe + (1 - delta) * k_fe(-1) ;							// l.o.m. of capital
yk_fe = gamma * y_fe/k_fe(-1) ;											// Marginal productivity capital
yn_fe = (1 - gamma) * y_fe / n_fe ;									// Marginal productivity labor
w_fe = rmc_fe*yn_fe/ (psi_fe(+1) * Rl_fe) ;							// First order condition n	
Rl_fe(-1) + phi_k * delta_k_fe = rmc_fe*yk_fe + phi_k * psi_fe(+1) * delta_k_fe(+1) + psi_fe(+1) * Rl_fe * (1 - delta) ;          // First order condition k
l_fe = i_fe + w_fe*n_fe;
l_fe = b_fe + d_fe ;									// Budget constraint
psi_fe(+1) * (Rl_fe - R_fe)  = sigma ;					// First order condition l
psi_fe(+1) * (R_fe - Rd_fe)  = omega / m_fe ;				// First order condition d
m_fe = sqrt(omega * d_fe / (psi_fe(+1) * (R_fe - 1))) ;	// First order condition m
y_fe = c_fe + i_fe + phi_k / 2 * delta_k_fe^2 + omega * d_fe / m_fe + sigma * l_fe ; //								
psi_fe = beta * lambda_fe / lambda_fe(-1) ;	// Stochastic discount factor
delta_k_fe = k_fe - k_fe(-1) ;				// change of capital
EFP_fe = Rl_fe - R_fe;                       // External finance premium
IMP_fe = R_fe - Rd_fe;                       // Inside Money premium
f_fe = sigma * l_fe + omega * d_fe / m_fe ;	    // costs of financial intermediation
rmc_fe=rmc_ss;

outputgap = y-y_fe;

end;

initval;
c=c_ss;
i=i_ss; 
y=y_ss;
n=n_ss; 
w=w_ss; 
k=k_ss; 
delta_k=delta_k_ss; 
m=m_ss; 
d=d_ss; 
b=b_ss; 
l=l_ss; 
R=R_ss; 
Rd=Rd_ss; 
Rl=Rl_ss; 
lambda=lambda_ss; 
xi=xi_ss; 
psi=psi_ss; 
pi=pi_ss; 
rmc=rmc_ss; 
yk=yk_ss; 
yn=yn_ss; 
f=f_ss;
EFP=EFP_ss; 
IMP=IMP_ss; 
alpha=alpha_ss; 
omega=omega_ss; 
A=A_ss; 
theta=theta_ss;

c_fe=c_ss;
i_fe=i_ss; 
y_fe=y_ss;
n_fe=n_ss; 
w_fe=w_ss; 
k_fe=k_ss; 
delta_k_fe=delta_k_ss; 
m_fe=m_ss; 
d_fe=d_ss; 
b_fe=b_ss; 
l_fe=l_ss; 
R_fe=R_ss; 
Rd_fe=Rd_ss; 
Rl_fe=Rl_ss; 
lambda_fe=lambda_ss; 
xi_fe=xi_ss; 
psi_fe=psi_ss; 
rmc_fe=rmc_ss; 
yk_fe=yk_ss; 
yn_fe=yn_ss; 
f_fe=f_ss;
EFP_fe=EFP_ss; 
IMP_fe=IMP_ss; 
end ;

steady ;
check ;

shocks ;

var q = sigma_q^2 ;
var epsilon_theta = sigma_theta^2 ;
var j= sigma_j^2 ;
var epsilon_r = sigma_r^2 ;
end ;

stoch_simul(order = 1, irf = 25) c i y pi R m d IMP;