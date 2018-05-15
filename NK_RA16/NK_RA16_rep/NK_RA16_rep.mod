% Rannenberg, Ansgar (2016). "Bank Leverage Cycles and the External Finance Premium", 
%                             Journal of Money, Credit and Banking, Vol. 48, No. 8, pp. 1569-1612

% replicated by Felix Strobel, last edited 21.02.2018

% This code replicates the full model used in figure 1 and 2 of the article. To perfectly match the IRFs 
%   in figure 1 and 2, variable capital utilization is included. The calibration of the respective 
%   parameter is not included in the paper, but was provided by the author.

var 
Y       % output
GDP     % GDP
I       % Investment
K       % Capital stocl 
l       % labor
U       % Utilization rate
Cp      % aggregate consumption
C       % households consumption
Ce      % entrepreneurs consumption
Cb      % banks consumption
varrho  % marginal utility of consumption (household)
R       % riskfree rate
Rk      % return on capital
rk      % marginal product of capital
Rb      % return on banks assets
Rl      % return on loans 
w       % wage
a       % technology
Q       % price of capital
Pi      % inflation
mc      % marginal cost
N       % net worth
V       % value function of entrepreneur
phi_e   % entrepreneurs leverage
omega_bar_prime % derivative of default function
L       % aggregate loans
Lr      % working capital loans
Le      % loans to entrepreneur
g       % government spending
Nb      % net worth banks
phi_b   % leverage banks
z       % asset growth rate banks
Lambda  % SDF
spread_RlR % spread loan rate/riskless rate
spread_RkR % spread capital rate/riskless rate
spread_RbR % spread banks rate/riskless rate
spread_RkRb % spread capital rate/banks rate
R4         % annualized riskfree rate
Pi4        % annualized inflation rate
%%%flex price counterparts
Y_fe  GDP_fe I_fe K_fe l_fe U_fe Cp_fe C_fe Ce_fe Cb_fe varrho_fe R_fe Rk_fe rk_fe Rb_fe Rl_fe w_fe Q_fe Pi_fe mc_fe N_fe V_fe phi_e_fe
omega_bar_prime_fe L_fe Lr_fe Le_fe Nb_fe phi_b_fe z_fe Lambda_fe outputgap;

varexo e_i e_a e_g; %(monetary policy shock, technology shock, government spending shock)

parameters beta varphi h alpha delta eta_i epsilon xi_p theta psi_L psi_K sigma mu gamma lambda N_nb  psi_pi psi_y rho_i rho_a sigma_i sigma_a
           G_over_Y brate omega_bar_ss F_ss F1_ss  G_ss G1_ss G11_ss Gamma_ss Gamma1_ss Gamma11_ss rho_g 
           xi_ss spread_RkRb_ss phi_e_ss Pi_ss R_ss Rl_ss Rk_ss Rb_ss X_ss mc_ss Q_ss rk_ss K_over_l w_ss l_ss K_ss Y_ss Gov_ss I_ss 
           omega_bar_prime_ss V_ss N_ss Le_ss Lr_ss L_ss phi_ss Ce_ss phi_b_ss z_ss x_ss eta_ss nu_ss Nb_ss Nb_e_ss Cb_ss C_ss Cp_ss 
           GDP_ss varrho_ss chi gamma_p tr_omega_bar_ss spread_RbR_ss chi_e c_U xi_p_fe;

beta = 0.9958;      % households discount factor
h = 0.6;            % habit formation
varphi = 0.25;      % inverse of Frisch elasticity      %1.5 in the case of sticky wages
alpha = 0.33;       % output elasticity of capital
delta = 0.025;      % depreciation rate 
c_U = 100;          % taken from file provided by Ansgar Rannenberg  (model with sticky wages and variable capital utilization)
eta_i = 4;          % inverse elasticity of investment w.r.t price of capital
epsilon = 6;        % elasticity of substitution between varieties of final good
xi_p = 0.67;        % Calvo parameter
xi_p_fe = 0.00000001; % Calvo parameter
gamma_p = 0;        % degree of price indexation
psi_L = 1;          % share of wage bill that retailers finance externally
psi_K = 1;          % share of capital cost that retailers finance externally
sigma = 0.35;       % std.dev. of ideosyncratic productivity shock
mu = 0.298122852301025; % monitoring cost parameter (in this precision taken from file provided by Ansgar Rannenberg - in article: 0.2981)
gamma = 0.975;      % survival probability of entrepreneur
theta = 0.9915;     % survival probability of banker
psi_pi = 1.5;       % Taylor rule coefficient for inflation
psi_y  = 0.125;     % Taylor rule coefficient for real marginal cost
rho_i  = 0.8;       % interest rate smoothing
rho_a = 0.9;        % persistence of tech. shock
rho_g = 0.9;        % persistence of government spending shock
sigma_i = 0.16;     % std.dev. of interest rate shock
sigma_a = 1.2;      % std.dev. of tech. shock
sigma_g = 1;        % std.dev. of gov. spending shock

G_over_Y = 0.2;     % output share of government spending
brate=0.0075;       % targeted bankrupcy rate
Pi_ss = (1+0.0223)^(1/4);                     % quarterly Inflation
R_ss =  Pi_ss/(beta);                         % nominal risk free rate (deposits and policy rate)
spread_RbR_ss = 1.002^(1/4);                  % spread of return on banks portfolio vs. deposit rate (taken from file provided by Ansgar Rannenberg)
Rb_ss = spread_RbR_ss * R_ss;                 % return on banks portfolio
phi_b_ss = 1/0.125;                           % leverage ratio of banks (as in file provided by Ansgar Rannenberg)

omega_bar_ss = exp(sigma*norminv(brate,0,1)-0.5*sigma^2);   % cutoff value of omega
tr_omega_bar_ss = (log(omega_bar_ss)+0.5*sigma^2)/sigma;    % transformed cutoff value (s.t. tr_omega_bar_ss results in F_ss=0.0075 when plugged into standard normcdf)
F_ss =   normcdf(tr_omega_bar_ss,0,1);                      % probability of default
F1_ss= 1/(omega_bar_ss*sigma)*normpdf(tr_omega_bar_ss,0,1); % first derivative of default probability w.r.t. omega
F11_ss= -F1_ss/omega_bar_ss*(1+(log(omega_bar_ss)+0.5*sigma^2)/sigma^2); % second derivative w.r.t. omega
G_ss = normcdf(tr_omega_bar_ss-sigma);
G1_ss = omega_bar_ss*F1_ss;                                 % first derivative of G w.r.t. omega
G11_ss = F1_ss + omega_bar_ss*F11_ss;                       % second derivative
Gamma_ss = omega_bar_ss*(1-F_ss) + G_ss;                    % gain from loan to bank (pre substracting default costs)
Gamma1_ss = 1-F_ss;                                         % first derivative of Gamma w.r.t. omega
Gamma11_ss = -F1_ss;                                        % second derivative of Gamma w.r.t. omega

F12_ss    =   -F1_ss/sigma*(1+(0.25*sigma^4-(log(omega_bar_ss))^2)/sigma^2);
F2_ss     =   (0.5*sigma^2-log(omega_bar_ss))/sigma^2*normpdf(tr_omega_bar_ss,0,1);
G12_ss    =   omega_bar_ss*F12_ss;
G2_ss     =   ((0.5*sigma^2-log(omega_bar_ss))/sigma^2-1)*normpdf(tr_omega_bar_ss-sigma,0,1);
Gamma2_ss   =   -omega_bar_ss*F2_ss+G2_ss;
Gamma12_ss  =   -F2_ss;
xi_ss =   Gamma1_ss/(Gamma1_ss-mu*G1_ss);    %Lagrange multiplier for Entrepreneur's participation constraint
spread_RkRb_ss   =   Gamma1_ss/(Gamma1_ss-mu*(G1_ss*(1-Gamma_ss)+Gamma1_ss*G_ss)); % spread of return on capital over return on banks' portfolios
phi_e_ss=   1/(1-(Gamma_ss-mu*G_ss)*spread_RkRb_ss);   % entrepreneurs' leverage

Rb_ss = spread_RbR_ss * R_ss;              % return on banks portfolio
Rk_ss = Rb_ss*spread_RkRb_ss;              % return on capital
Rl_ss = omega_bar_ss*Rk_ss/(1-1/phi_e_ss); % loan rate

X_ss  = epsilon/(epsilon-1);                % markup
mc_ss = (epsilon-1)/epsilon;                % real marginal cost
Q_ss  = 1;                                  % price of capital 
rk_ss = Rk_ss/Pi_ss - (1-delta);            % real marginal product of capital

K_over_l = (alpha/(X_ss*(1+psi_K*(R_ss-1))*(rk_ss)))^(1/(1-alpha)); % capital-labor ratio
w_ss = (1-alpha)*(K_over_l)^(alpha)/(X_ss*(1+psi_L*(R_ss-1))); % real wage
Y_over_K = X_ss/alpha*(rk_ss)*(1+psi_K*(R_ss-1));      % output-capital ratio
l_ss = 1/3;                     % labor input
K_ss = K_over_l * l_ss;         % capital
Y_ss = Y_over_K * K_ss;         % output
Gov_ss = G_over_Y * Y_ss;       % government spending
I_ss = delta * K_ss;            % investment

YK_ss   =   X_ss/alpha*(rk_ss)*(1+psi_K*(R_ss-1));

omega_bar_prime_ss = omega_bar_ss*Rk_ss;    %  
V_ss = K_ss*Rk_ss/Pi_ss*(1-Gamma_ss);       % Value fct. of entrepreneurs
N_ss = K_ss/phi_e_ss;                       % net worth of entrepreneur
Le_ss = K_ss-N_ss;                          % loans received by entrepreneur
Lr_ss = psi_L*w_ss*l_ss + psi_K*rk_ss*K_ss; % loans received by retailers
L_ss = Le_ss + Lr_ss;                       % total loans
phi_ss = (L_ss+N_ss)/N_ss;                  % non-bank leverage ratio
We = N_ss-gamma*V_ss;                       % transfers to new entrepreneurs
Ce_ss = (1-gamma)*V_ss;                     % consumption of entrepreneur


z_ss = ((Rb_ss-R_ss)*phi_b_ss+R_ss)/Pi_ss;  % asset growth rate
x_ss = z_ss;                                % growth rate of net worth
eta_ss = (1-theta)/(1-beta*theta*x_ss);     % margina value of net worth to banker
nu_ss = (1-theta)*((Rb_ss-R_ss)/R_ss)/(1-beta*theta*z_ss); % marginal value of portfolio to banker 
lambda = (eta_ss+phi_b_ss*nu_ss)/phi_b_ss;  % share of loans to entrepreneurs that bankers can divert
Nb_ss = Le_ss/phi_b_ss;                     % net worth of banker
Nb_e_ss = theta*z_ss*Nb_ss;                 % net worth of existing/old bankers
N_nb    = Nb_ss-Nb_e_ss;                    % net worth of new bankers
Cb_ss = (1-theta)*z_ss*Nb_ss;               % consumption of banker

C_ss = Y_ss-I_ss-Ce_ss-Cb_ss-Gov_ss-mu*G_ss*Rk_ss*K_ss/Pi_ss; % consumption of households
Cp_ss = C_ss+Ce_ss+Cb_ss;                   % aggregate consumption
GDP_ss = Cp_ss+I_ss+Gov_ss;                 % GDP
varrho_ss = -1/(C_ss-h*C_ss);               % marginal utility of consumption for households
chi = (varrho_ss*w_ss)/(l_ss^varphi);       % weight of disutility of labor for households


//Calculation of coefficient on entrepreneurial leverage chi_e and on sigma chi_sigma
Upsilon     =   1-Gamma_ss+xi_ss*(Gamma_ss-mu*G_ss); 
domegabards1=-(Gamma_ss-mu*G_ss)/((Gamma1_ss-mu*G1_ss)*spread_RkRb_ss);
domegabardphi_e=(1-(Gamma_ss-mu*G_ss)*spread_RkRb_ss)/((Gamma1_ss-mu*G1_ss)*spread_RkRb_ss*phi_e_ss);
domegabardsigma=-(Gamma2_ss-mu*G2_ss)/(Gamma1_ss-mu*G1_ss);
psi_1  =   mu*(Gamma1_ss*G11_ss-Gamma11_ss*G1_ss)/((Gamma1_ss-mu*G1_ss)^2);
psi_2  =   mu*(Gamma1_ss*G12_ss-Gamma12_ss*G1_ss)/((Gamma1_ss-mu*G1_ss)^2);
Upsilon_1   =   psi_1*(Gamma_ss-mu*G_ss);
Upsilon_2   =   -Gamma2_ss+psi_2*(Gamma_ss-mu*G_ss)+xi_ss*(Gamma2_ss-mu*G2_ss);
dphi_eds1=((spread_RkRb_ss*Upsilon_1-psi_1)*domegabards1+Upsilon)/((psi_1-spread_RkRb_ss*Upsilon_1)*domegabardphi_e);
chi_e=      phi_e_ss/dphi_eds1*(1/spread_RkRb_ss);


model(linear);

% households 
%marginal utility of consumption
varrho= 1/((1-h)*(1-beta*h))*(-(C-h*C(-1)) + beta*h * (C(+1)-h*C));

%Euler equation
R + Lambda(+1) - Pi(+1)  =  0;

%SDF
Lambda  =   varrho-varrho(-1);

%labor supply
varphi*l    = varrho + w;

% capital good producers and retailers
% investment dynamics
I  = 1/(1+beta)*(I(-1)+beta*I(+1)+Q/eta_i);

% capital accumulation
K = (1-delta)*K(-1)+delta*I;

% production function
Y = alpha*(U+K(-1))+(1-alpha)*(a+l);

% new Keynesian Phillips curve
Pi = 1/(1+beta*gamma_p)*(beta*Pi(+1) + gamma_p*Pi(-1)+(1-xi_p*beta)*(1-xi_p)/xi_p *mc);

% labor demand
w_ss*(1+psi_L*(R_ss-1))*w + w_ss*psi_L*R_ss*R = (1+psi_L*(R_ss-1))*w_ss   *(mc + Y - l);

% capital demand by firms
rk/rk_ss+R*psi_K*R_ss/(1+psi_K*(R_ss-1))=   mc+Y-K(-1)-U;

% working capital loans to firms
Lr*Lr_ss=   psi_L*w_ss*l_ss*(w+l)+psi_K*K_ss*rk_ss*(rk/rk_ss+U+K(-1)); %mistake - why not L_r*L_r_ss?

% banks
% bank leverage 
phi_b = Le-Nb;

% bank net worth 
Nb = theta*z_ss*(z + Nb(-1));

% consumption of bankers
Cb = z + Nb(-1);

% asset growth
z_ss*Pi_ss*(z+Pi) = ((Rb_ss-R_ss)*phi_b(-1) + Rb_ss*Rb-R_ss*R(-1))*phi_b_ss + R_ss*R(-1);

% leverage dynamics
phi_b= theta*beta^2*z_ss^2*phi_b(+1)+phi_b_ss*Rb_ss/R_ss*(Rb(+1)-R);   

% entrepreneurs (20-30)

% entrepreneurs' consumption
Ce = V;

% entrepreneur net worth
N*N_ss = gamma*V*V_ss;

% return to capital
Rk_ss*(Rk+Q(-1))=      Rk_ss* Pi+Pi_ss*(rk+Q*(1-delta));

% entrepreneur leverage
phi_e = Q + K - N;

% entrepreneurs loans
Le-N=phi_e_ss/(phi_e_ss-1)*phi_e;

% value function of entrepreneur 
V = N(-1) + Rk -Pi + phi_e(-1)- Gamma1_ss*omega_bar_ss/(1-Gamma_ss)*(omega_bar_prime(-1)-Rk);

% cost of variable capital utilization
rk =   rk_ss*c_U*U;

% spread of return on capital over return on banks rate
Rk(+1)-Rb(+1)=chi_e*phi_e;

% determination of loan rate
omega_bar_prime= Rl+1/(phi_e_ss-1)*phi_e;

% condition for optimal contract between entrepreneur and bank
(Rk_ss*(Gamma_ss-mu*G_ss)-omega_bar_prime_ss*(Gamma1_ss-mu*G1_ss))*Rk+(Gamma1_ss-mu*G1_ss)*omega_bar_prime_ss*omega_bar_prime(-1) = Rb_ss*(phi_e(-1)/phi_e_ss+(phi_e_ss-1)/phi_e_ss*Rb);


% further equilibrium conditions (31-40)
% Taylor rule
R*R_ss = (1-rho_i)*(psi_pi*Pi + psi_y*mc) + rho_i*R(-1)*R_ss +e_i;

% aggregate consumption
Cp*Cp_ss = C*C_ss+Ce*Ce_ss+Cb*Cb_ss;

% aggregate resource constraint
Y*Y_ss  = I*I_ss + Cp*Cp_ss + G_over_Y*g + Rk_ss/Pi_ss*K_ss*mu*G_ss*(Rk-Pi+Q(-1)+K(-1)+G1_ss/G_ss*omega_bar_ss*(omega_bar_prime(-1)-Rk))+rk_ss*K_ss*U;

% definition of GDP
GDP*GDP_ss = Cp*Cp_ss+I*I_ss+G_over_Y*g;

% aggregate loans
L_ss*L = Le_ss*Le + Lr_ss*Lr;

% TFP shock
a = rho_a*a(-1)-e_a;

% government spending shock
g = rho_g*g(-1)-e_g;

% annualized riskfree rate
R4 = 4*R;

% annualized inflation rate
Pi4 =4*Pi;

% annualized spreads
spread_RlR = 4*(Rl - R);
spread_RkR = 4*(Rk(+1) - R);
spread_RbR = 4*(Rb(+1) - R);
spread_RkRb = 4*(Rk(+1) - Rb(+1));


%FLEX PRICE EQ
%FLEX PRICE EQ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varrho_fe= 1/((1-h)*(1-beta*h))*(-(C_fe-h*C_fe(-1)) + beta*h * (C_fe(+1)-h*C_fe));
R_fe + Lambda_fe(+1) - Pi_fe(+1)  =  0;
Lambda_fe  =   varrho_fe-varrho_fe(-1);
varphi*l_fe    = varrho_fe + w_fe;
I_fe  = 1/(1+beta)*(I_fe(-1)+beta*I_fe(+1)+Q_fe/eta_i);
K_fe = (1-delta)*K_fe(-1)+delta*I_fe;
Y_fe = alpha*(U_fe+K_fe(-1))+(1-alpha)*(a+l_fe);
Pi_fe = 1/(1+beta*gamma_p)*(beta*Pi_fe(+1) + gamma_p*Pi_fe(-1)+(1-xi_p_fe*beta)*(1-xi_p_fe)/xi_p_fe *mc_fe);
w_ss*(1+psi_L*(R_ss-1))*w_fe + w_ss*psi_L*R_ss*R_fe = (1+psi_L*(R_ss-1))*w_ss   *(mc_fe + Y_fe - l_fe);
rk_fe/rk_ss+R_fe*psi_K*R_ss/(1+psi_K*(R_ss-1))=   mc_fe+Y_fe-K_fe(-1)-U_fe;
Lr_fe*Lr_ss=   psi_L*w_ss*l_ss*(w_fe+l_fe)+psi_K*K_ss*rk_ss*(rk_fe/rk_ss+U_fe+K_fe(-1)); 
phi_b_fe = Le_fe-Nb_fe;
Nb_fe = theta*z_ss*(z_fe + Nb_fe(-1));
Cb_fe = z_fe + Nb_fe(-1);
z_ss*Pi_ss*(z_fe+Pi_fe) = ((Rb_ss-R_ss)*phi_b_fe(-1) + Rb_ss*Rb_fe-R_ss*R_fe(-1))*phi_b_ss + R_ss*R_fe(-1);
phi_b_fe= theta*beta^2*z_ss^2*phi_b_fe(+1)+phi_b_ss*Rb_ss/R_ss*(Rb_fe(+1)-R_fe);   
Ce_fe = V_fe;
N_fe*N_ss = gamma*V_fe*V_ss;
Rk_ss*(Rk_fe+Q_fe(-1))=      Rk_ss* Pi_fe+Pi_ss*(rk_fe+Q_fe*(1-delta));
phi_e_fe = Q_fe + K_fe - N_fe;
Le_fe-N_fe=phi_e_ss/(phi_e_ss-1)*phi_e_fe;
V_fe = N_fe(-1) + Rk_fe -Pi_fe + phi_e_fe(-1)- Gamma1_ss*omega_bar_ss/(1-Gamma_ss)*(omega_bar_prime_fe(-1)-Rk_fe);
rk_fe =   rk_ss*c_U*U_fe;
Rk_fe(+1)-Rb_fe(+1)=chi_e*phi_e_fe;
omega_bar_prime_fe= Rl_fe+1/(phi_e_ss-1)*phi_e_fe;
(Rk_ss*(Gamma_ss-mu*G_ss)-omega_bar_prime_ss*(Gamma1_ss-mu*G1_ss))*Rk_fe+(Gamma1_ss-mu*G1_ss)*omega_bar_prime_ss*omega_bar_prime_fe(-1) = Rb_ss*(phi_e_fe(-1)/phi_e_ss+(phi_e_ss-1)/phi_e_ss*Rb_fe);
R_fe*R_ss = (1-rho_i)*(psi_pi*Pi_fe + psi_y*mc_fe) + rho_i*R_fe(-1)*R_ss;
Cp_fe*Cp_ss = C_fe*C_ss+Ce_fe*Ce_ss+Cb_fe*Cb_ss;
Y_fe*Y_ss  = I_fe*I_ss + Cp_fe*Cp_ss + G_over_Y*g + Rk_ss/Pi_ss*K_ss*mu*G_ss*(Rk_fe-Pi_fe+Q_fe(-1)+K_fe(-1)+G1_ss/G_ss*omega_bar_ss*(omega_bar_prime_fe(-1)-Rk_fe))+rk_ss*K_ss*U_fe;
GDP_fe*GDP_ss = Cp_fe*Cp_ss+I_fe*I_ss+G_over_Y*g;
L_ss*L_fe = Le_ss*Le_fe + Lr_ss*Lr_fe;
outputgap=Y-Y_fe;
end;


    
initval;
Y  =   0;
GDP=   0;
I  =   0; 
K  =   0; 
l  =   0;
C  =   0;
Ce=   0;
Cp=   0;
Cb=   0;
varrho=0;
R  =   0; 
Rk =   0;
rk =   0; 
Rb =   0;
Rl =   0;
w  =   0; 
a   =   0;
Q= 0; 
Pi =   0;
mc  =   0;
N   =   0;
V   =   0; 
phi_e=  0;
omega_bar_prime=  0;
L   =   0;
Lr =   0;
Le =   0;
Nb  =  0;
phi_b=  0; 
z   =   0;
spread_RlR  =0;
spread_RkR  =0;
spread_RbR  =0;
spread_RkRb =0;
Lambda  =0;
end;

%steady;
%check;

shocks;
var e_a = sigma_a^2;
var e_i = sigma_i^2;
var e_g = sigma_g^2;
end;

stoch_simul(order=1,irf=40, nograph, nomoments, hp_filter=1600, ar=1) GDP Cp I Q Pi R Le N Nb phi_b spread_RkR spread_RbR spread_RkRb; 
%stoch_simul(order=1,irf=40) Y Y_fe outputgap;