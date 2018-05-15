% Model: NK_KW16

% Further Reference: 
% Kirchner, M., S. van Wijnbergen. 2016. " Fiscal deficits, financial fragility, and the effectiveness of government policies".
% Journal of Monetary Economics 80, pp. 51-68.

% Created by Felix Strobel (10.10.17)
% This code replicates the plot for Bank Financing' in Figure 1 of the article.



var 
Y           % final output
Ym          % intermediary output
L           % labor hours
w           % real wage
C           % consumption
U_c         % marginal utility of consumption
Lambda      % stochastic discount factor of households 
I           % investment
K           % capital
Q           % price of capital
a           % technology
ksi         % capital quality
Pm          % price of intermediary goods (real marginal cost for final goood producer)
infl        % inflation
inflstar    % optimal price divided by past price level
F           % auxiliary variable for price setting
Z           % auxiliary variable for price setting
Dis         % price dispersion

Rd          % real deposit rate 
i           % nominal interest rate
Rk          % real rate of capital
Rb          % real rate of bonds held by banks
Rp          % real rate of portfolio by banks
ERk         % expected real rate of capital
ERb         % expected real rate of bonds held by banks
prem        % premium of return on capital - return on deposits
prem2       % premium of return on bonds - return on deposits
Phi         % Leverage ratio of banks
portf_B     % portfolio of banks
N           % net worth of banks
Om          % portfolio share of capital assets
D           % economy-wide deposits
nu_k        % value of having another unit of capital assets
nu_b        % value of having another unit of bonds (for banks)
nu_n        % value of having another unit of net worth
G           % government spending
g           % government spending (shock process)
Gy          % government spending share of output
T           % taxes
B;          % government debt



%capital quality, government spending, interest rate, technology, and net worth shock
varexo e_ksi e_g e_i e_a e_n;

parameters 
    beta hh delta varphi eta_i alpha gam epsilon kappa_pi kappa_y G_over_Y B_over_Y theta lambda chi
    rho_i rho_ksi rho_a rho_g sigma_i sigma_ksi sigma_a sigma_g sigma_n
    Y_ss L_ss w_ss U_c_ss Y_over_K L_over_K K_ss Y_ss Ym_ss G_ss I_ss C_ss Z_ss F_ss B_ss N_ss D_ss T_ss
    a_ss ksi_ss g_ss Lambda_ss Pm_ss Phi_ss Q_ss Dis_ss infl_ss inflstar_ss Rd_ss Rp_ss Rb_ss Rk_ss i_ss
    prem_ss nu_b_ss nu_n_ss nu_k_ss portf_B_ss Om_ss Gy_ss;
    
% standard Parameters
beta=0.99;          % discount factor 
hh=0.815;           % habit formation
delta = 0.025;      % depreciation rate
varphi = 0.276;     % inverse of Frisch elasticity
eta_i = 1.728;      % inv. adjustment cost parameter
alpha = 0.33;       % output elasticity of capital
gam=0.779;          % Calvo parameter
epsilon=4.167;      % elasiticity of substitution between varieties of final goods
G_over_Y=0.2;       % stst. government spending share of output
B_over_Y=2.4;       % stst. debt/GDP
Phi_ss=4;           % stst. Leverage ratio of banks
theta=1-1/16;       % survival rate of banks

kappa_pi=1.50000000;% Taylor rule coefficient on inflation
kappa_y =0.12500000;% Taylor rule coefficient on output growth

%shock parameters
rho_i=0.8;        % interest rate smoothing
rho_ksi=0.66;     % persistence of capital quality shock
rho_a=0.95;       % persistence of technology shock
rho_g=0.80;       % persistence of government spending shock
sigma_ksi=0.05;   % std. dev. of capital quality shock
sigma_a=0.01;     % std. dev. of technology shock
sigma_g=0.05;     % std. dev. of government spending shock
sigma_i=0.0025;   % std. dev. of interest rate shock
sigma_n=0.01;     % std. dev. of net worth shock

%%% steady state values of variables labelled above
Lambda_ss = 1;                     %
Q_ss=1;                            % 
Dis_ss=1;
infl_ss=1;
inflstar_ss=1;
a_ss=1;
g_ss=1;
ksi_ss=1;
Pm_ss = (epsilon-1)/epsilon;       %

prem_ss = 0.01/4;
prem2_ss = prem_ss;
Phi_ss=4;
Rd_ss=1/beta;
i_ss=Rd_ss;
Rk_ss=Rd_ss+prem_ss;
Rb_ss=Rk_ss;
Rp_ss=Rk_ss;
ERk_ss=Rk_ss;
ERb_ss=Rk_ss;
nu_n_ss = (1-theta)*beta*(Rd_ss)/(1-theta*beta);
nu_k_ss = (1-theta)*beta*(Rk_ss-Rd_ss)/(1-theta*beta);
nu_b_ss = nu_k_ss; 
lambda = nu_k_ss + nu_n_ss/Phi_ss;          % tightness parameter on incentive constraint
chi = 1-theta*((Rk_ss-Rd_ss)*Phi_ss+Rd_ss); % share of old net worth that is given to new bankers
w_ss = (alpha^(alpha)*(1-alpha)^(1-alpha)*Pm_ss*(Rk_ss-1+delta)^(-alpha))^(1/(1-alpha));
Y_over_K = (Rk_ss-1+delta)/(alpha*Pm_ss);
L_over_K = (Y_over_K)^(1/(1-alpha));
I_over_Y = delta*(Y_over_K)^(-1);
C_over_Y = 1-G_over_Y-I_over_Y;
habit = (1-beta*hh)/(1-hh);
Y_ss = (L_over_K)^(-alpha*varphi/(1+varphi))*(habit*w_ss*C_over_Y^(-1))^(1/(1+varphi));
Ym_ss= Y_ss;
C_ss = Y_ss*C_over_Y;
G_ss = Y_ss*G_over_Y;
Gy_ss = G_over_Y;
I_ss = Y_ss*I_over_Y;
K_ss = I_ss/delta;
L_ss = L_over_K*K_ss;
U_c_ss = habit/C_ss;
Z_ss = 1/(1-beta*gam)*Y_ss;
F_ss = Z_ss*Pm_ss;
B_ss = Y_ss*B_over_Y;
N_ss = (K_ss+B_ss)/Phi_ss;
Om_ss = K_ss/(K_ss+B_ss);
Rp_ss = Om_ss*(Rk_ss)+(1-Om_ss)*Rb_ss;
T_ss = (Rb_ss-1)*B_ss+G_ss;
portf_B_ss = Phi_ss*N_ss;
D_ss = K_ss + B_ss - N_ss;

model;

% Households
exp(U_c)  =   (exp(C)-hh*exp(C(-1)))^(-1)-beta*hh*(exp(C(+1))-hh*exp(C))^(-1); % Marginal utility of consumption
exp(Lambda)  =   exp(U_c)/exp(U_c(-1));                                        % Stochastic discount rate
beta*exp(Rd(+1))*exp(Lambda(+1))  =   1;                                       % Euler equation
exp(L)^varphi    = exp(U_c)*exp(w);                                            % Labor supply

% Intermediate goods producer
exp(Rk)     =   (exp(Pm)*alpha*exp(Ym)/exp(K(-1))+exp(ksi)*exp(Q)*(1-delta))/exp(Q(-1)); % Return on capital (Assumption: this = E26)

exp(Ym)     =   exp(a)*(exp(ksi)*exp(K(-1)))^alpha*exp(L)^(1-alpha); % Production function
exp(w)      =   exp(Pm)*(1-alpha)*exp(Ym)/exp(L); % Real Wages (Assumption: This replaces E28 (Eq. for mc))

% Capital Goods Producer
%exp(Q)  =   1 + eta_i/2*(exp(I)/exp(I(-1))-1)^2
%              + eta_i*(exp(I)/exp(I(-1))-1)*exp(I)/exp(I(-1))
%              - beta*exp(Lambda(+1))*eta_i*(exp(I(+1))/exp(I)-1)*(exp(I(+1))/exp(I))^2;     % Optimal investment decision (check out E29)
1/exp(Q) =   1 - eta_i/2*(exp(I)/exp(I(-1))-1)^2 
               - eta_i*(exp(I)/exp(I(-1))-1)*exp(I)/exp(I(-1)) 
               + beta*exp(Lambda(+1))*eta_i*(exp(I(+1))/exp(I)-1)*(exp(I(+1))/exp(I))^2*exp(Q)/exp(Q(+1)); //E29

exp(K)  =   (1-delta)*exp(ksi)*exp(K(-1)) + (1 - eta_i/2*(exp(I)/exp(I(-1))-1)^2)*exp(I);          % Capital accumulation equation

% Retailer
exp(Ym)    =   exp(Y)*exp(Dis);                                                                             % Retail output
exp(Dis)    =   gam*exp(Dis(-1))*exp(infl)^epsilon + 
                (1-gam)*((1-gam*exp(infl)^(epsilon-1))/(1-gam))^(-epsilon/(1-epsilon));                     % Price dispersion
exp(F)       =   exp(Y)*exp(Pm) + beta*gam*exp(Lambda(+1))*exp(infl(+1))^epsilon    *exp(F(+1));            % Optimal price choice
exp(Z)       =   exp(Y)         + beta*gam*exp(Lambda(+1))*exp(infl(+1))^(epsilon-1)*exp(Z(+1));            % Optimal price choice
exp(inflstar)   =  epsilon/(epsilon-1)*exp(F)/exp(Z)*exp(infl);                                             % Optimal price choice
exp(infl)^(1-epsilon)     =   gam + (1-gam)*(exp(inflstar))^(1-epsilon);                                    % Price index


% Financial Intermediaries
exp(nu_k)=beta*exp(Lambda(+1))*((exp(Rk(+1))-exp(Rd(+1)))*(1-theta)+ 
          theta*exp(Q(+1))*exp(K(+1))/(exp(Q)*exp(K))*exp(nu_k(+1))); % shadow excess value of loans
exp(nu_b)=beta*exp(Lambda(+1))*((exp(Rb(+1))-exp(Rd(+1)))*(1-theta)+
          theta*exp(B(+1))/(exp(B))*exp(nu_b(+1)));     % shadow value of bonds
exp(nu_n)=beta*exp(Lambda(+1))*(exp(Rd(+1))*(1-theta) +
          theta*(exp(N(+1))/exp(N))*exp(nu_n(+1)));     % shadow value of equity

exp(nu_k)=exp(nu_b);                                    % relation between shadow values of loans and bonds
exp(Phi)=exp(nu_n)/(lambda-exp(nu_k));                  % Leverage of Banks
exp(N)= theta*((exp(Rp)-exp(Rd))*exp(Phi(-1)) + exp(Rd))*exp(N(-1)) + chi* exp(N(-1));    % law of motion for net worth

exp(N)+exp(D)= exp(Q)*exp(K)+exp(B);                    % balance sheet identity of banks
exp(portf_B) = exp(Q)*exp(K)+exp(B);                    % Banks' portfolio
exp(Q)*exp(K) = exp(Om) * exp(Phi) * exp(N);            % claims on capital assets

exp(B)        = (1 - exp(Om)) * exp(Phi) * exp(N);      % claims on bonds 
exp(ERk)= exp(Rk(+1));                                  % Expected Return on Capital
exp(ERb) = exp(Rb(+1));                                 % Expected Return on Bonds
exp(prem) =   exp(Rk(+1))-exp(Rd(+1));                  % Loan Premium
exp(prem2) =   exp(Rb(+1))-exp(Rd(+1));                 % Bond Premium
exp(Rp) = exp(Rk)*exp(Om(-1))+exp(Rb)*(1-exp(Om(-1)));  % Return on portfolio

% Fiscal policy
%G = (1-rho_g)*G_ss + rho_g*G(-1) + eg; %
exp(B) = exp(Rb)*exp(B(-1))+exp(G)-exp(T); % Government Budget Constraint
exp(G) = G_ss*exp(g); % Government consumption
exp(T) = T_ss; % Taxes
exp(Gy) = exp(G)/Y_ss; % Share of gov. consumption in GDP
 
% Additional Equations
exp(Y) =   exp(C) +exp(G) + exp(I); % Aggregate resource constraint
exp(i(-1)) =   exp(Rd)*exp(infl); % Fisher equation
exp(i) =   exp(i(-1))^rho_i* (i_ss*exp(infl)^kappa_pi*((Y)/(Y(-1)))^(kappa_y))^(1-rho_i)*exp(-e_i); % Taylor rule

% Shocks
a  =   rho_a*a(-1)-e_a; %42. TFP shock
ksi=   rho_ksi*ksi(-1)-e_ksi; %43. Capital quality shock
g  =   rho_g*g(-1)+e_g; %44. Government consumption shock
end;


initval;
Y=log(Y_ss);
Ym=log(Ym_ss);
K=log(K_ss);
L=log(L_ss);
I=log(I_ss);
C=log(C_ss);
G=log(G_ss);
Q=log(Q_ss);
U_c=log(U_c_ss);
Lambda=log(Lambda_ss);
Rk=log(Rk_ss);
Rd=log(Rd_ss);
N=log(N_ss);
Pm=log(Pm_ss);
w=log(w_ss);
Dis=log(Dis_ss);
F=log(F_ss);
Z=log(Z_ss);
i=log(i_ss);
prem=log(prem_ss);
a=0.00000000;
ksi=0.00000000;
g=0.00000000;
infl=0.00000000;
inflstar=0.00000000;
e_a=0.00000000;
e_ksi=0.00000000;
e_g=0.00000000;
e_i=0.00000000;
B=log(B_ss);
D=log(D_ss);
T=log(T_ss);
Phi=log(Phi_ss);
Rb=log(Rb_ss);
nu_k=log(nu_k_ss);
nu_b=log(nu_b_ss);
nu_n=log(nu_n_ss);
prem2=log(prem2_ss);
ERk=log(Rk_ss);
ERb=log(Rb_ss);
Rp=log(Rp_ss);
portf_B=log(portf_B_ss);
Om=log(Om_ss);
Gy=log(Gy_ss);
end;

steady;
check;

shocks;
%var e_a=sigma_a^2;
%var e_ksi=sigma_ksi^2;
%var e_g=sigma_g^2;
var e_g=25;
%var e_i=sigma_i^2;
end;

stoch_simul(order = 1, irf=30) Gy ERb ERk I K Q N Phi G C Y;
    