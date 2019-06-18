% Financial frictions in the Euro Area and the United States: a Bayesian assessment
% Macroeconomic Dynamics, 20 (05), p. 1313-1340, 2016
% Stefania Villa

% note 1: The employment Phillips Curve (eq.12) is written below with the measurement equations

% note 2: as in the original code of the author, eq. 13 is shifted one period backwards. (this is consistent with the notation in Gertler/Karadi (2011))

% note 3: Eq 18b is shifted on period forward to guarantee determinacy. In the original code only the 
% right hand side of the equation has been shifted one period forward. The result of this replication thus differs from the original IRFs.
% the original equation 18b is in the code, but commented out.

% note 4: In eq 19, capital is forward looking in the original code [k(+1)]. 
% Here, I have changed this is changed to a static variable [k] to make the notation consistent with the rest of the code 

var 
y  i   ext_pr  c  lev  q  Lambda  l  d  v  rk  x  z  nn  mu  n  ne  k  u  w  r  zk  rn pi 
yf i_f ext_prf cf levf qf Lambdaf lf df vf rkf xf zf nnf muf nf nef kf uf wf rf zkf
a g eps_p eps_w eps_k eps_r eps_x
emp robs piobs dy dc dfi dw; 

varexo e_x e_r e_k e_g e_a e_w e_p;

parameters 
beta phi chi alpha delta epsilon epsilon_w G_Y h lambda theta zeta ksi sig_p sig_pi sig_w sig_wi sig_E M  
rho_r rho_ri rho_PI rho_Y rho_A rho_G rho_X rho_k rho_W rho_P THETA  rho_DY 
RK constelab picbar trend;
 
alpha       = 0.33;       %capital share
beta        = 0.99;       %Discount rate
delta       = 0.025;      %Steady state depreciation rate
epsilon     = 6;          % Price elasticity of demand for retail good
epsilon_w   = 6;          % elasticity across different types of labour
M           = epsilon /(epsilon-1);   %Mark-up in retail sector
G_Y         = 0.20;        %g/Y
phi         = 1.49;        %Inverse Frisch elasticity of L supply
h           = 0.65;        %habit parameter
lambda      = 0.5152;      %Fraction of capital that can be diverted
theta       = 0.9715;      %Fractions of bankers that survive every period
chi         = 0.001;       %fraction of of assets given to ne_w banks       
THETA       = 1.40;        % fixed costs in production

sig_p       = 0.84;        %Calvo parameter for retail firms
sig_pi      = 0.15;        % indexation to past inflation
sig_w       = 0.78;        %Calvo parameter for unions
sig_wi      = 0.39;        % indexation to past wage inflation
sig_E       = 0.8;
zeta        = 0.95;        %EDCU
ksi         = 4.95;        %2nd derivative of Inv adjustment cost

rho_PI      = 1.73;        %Response to inflation in Taylor rule
rho_Y       = 0.09;        %Response to output gap in Taylor rule
rho_DY      = 0.08;         %Response to change in output gap in Taylor rule
rho_r       = 0.89;        %Interest rate smoothing in Taylor rule
rho_A       = 0.90;        %Persistency of technological shock
rho_X       = 0.97;        %Persistency of shock to K
rho_G       = 0.92;   
rho_W       = 0.72;
rho_P       = 0.58;     
rho_k       = 0.99;
rho_ri      = 0.24;

% Steady State declared as parameters:
RK          = 1.013860066271978;

constelab   = 0;
picbar      = 0.63; 
trend       = 0.3;
 
model (linear);

%%%%%%transformed parameters%%%%%
#gamma      = 1 + trend/100;
#pic_ss     = 1+picbar/100;
#R          = 1/beta;
#ZK         = RK - (1-delta);
#W          = (alpha^alpha*((1-alpha)^(1-alpha))/(M*((ZK)^alpha)))^(1/(1-alpha));
#K_L        = alpha*W/((1-alpha)*ZK);
#L_K        = K_L^-1;
#conster    =(R-1)*100;
#Y_K        = (THETA*(K_L)^(1-alpha))^(-1);
#I_K        = 1- ((1-delta));
#C_K        = Y_K-I_K-G_Y*Y_K;
#K_Y        = Y_K^(-1);
#I_Y        = I_K/Y_K;
#C_Y        = 1-I_Y-G_Y;
#K          = (W*(1)/((1-h)) *(C_K^-1)*(K_L^phi))^(1/(1+phi));
#L          = K*(ZK)*(1-alpha)/(alpha*W);
#I          = delta*K;
#Y          = K*(L_K^(1-alpha))/THETA;
#NN_Y       = chi/Y_K;
#N_Y        = (1/(1-(R*theta)))*(NN_Y+(theta*(RK-R)/(Y_K)));
#N_e_Y      = N_Y-NN_Y;
#LEV        = (Y_K*N_Y)^(-1);
#Z          = (RK-R)*LEV+R;
#X          = Z;
#V          = (beta*(1-theta)*(RK-R))/(1-beta*theta*X);

%ingredients of equation 1
(1-h)*mu   = h*c(-1)-c;
Lambda     = mu-mu(-1);                        
Lambda(+1) = -r;                     
%2
w   =  (1/(1+beta))*w(-1) +(beta/(1+beta))*w(+1)+(sig_wi/(1+beta))*pi(-1)-(1+beta*sig_wi)/(1+beta)*pi+(beta)/(1+beta)*pi(+1)
      + (1-sig_w)*((1-beta*sig_w) *(1/(1+beta))/(sig_w*(1+ epsilon_w *phi )))* (phi*l + (1/(1-h))*c - (h/(1-h))*c(-1) -w) + eps_w ;
%3
k =  ((1-delta)/1)*(k(-1)+eps_k)+delta*(i)+ I_K*ksi*eps_x ;  
%4
zk = zeta/(1-zeta)*u;          
%5
i = (1/(1+beta))* (i(-1) + beta*i(+1)+(1/(ksi))*(q+eps_x) )  ;
%6
y = C_Y*c+ I_Y*i+G_Y*g+K_Y*ZK*u;      
%7
y = THETA*(a + alpha*(k(-1)+eps_k)+alpha*u  +(1-alpha)*l);
%8
w = zk - l + k(-1)+u;
%9
pi =  (1/(1+beta*sig_pi)) * (beta*pi(+1) +sig_pi*pi(-1)+((1-sig_p)*(1-beta*sig_p)/sig_p)*(alpha*zk-a+(1-alpha)*(w) ) ) + eps_p ; 
%10
rn = rho_r*rn(-1)+(1-rho_r)*(rho_PI*pi+rho_Y*(y-yf))+rho_DY*(y-yf-y(-1)+yf(-1))+eps_r; 
%11
rn = r+pi(+1);
%12
% Employment Phillips Curve omitted
%13
rk = (ZK/RK)*zk + (1-delta)/RK*(q+eps_k)- q(-1);    
%14
v = beta*theta*X*(Lambda(+1)+x+v(+1))+((1-theta)/V)*beta*(RK*rk-R*(r(-1)))+((1-theta)/V)*beta*(RK-R)*Lambda(+1);
%15
d = theta*beta*Z*(Lambda(+1)+z+d(+1));  
%16
z = (1/Z)*((LEV*RK/1)*rk+(R*(1-LEV/1))*(rn(-1)-pi)+ ((RK-R)*LEV/1)*lev(-1));        
%17
x = lev+z-lev(-1);                          
%18
%lev = d(+1)+(V/(lambda-V))*v(+1); 
lev(+1) = d(+1)+(V/(lambda-V))*v(+1);
%19
ne = n(-1)+z;                     
%20
%k(+1)+q = n+lev; 
k+q = n+lev; 
%21
nn = k+q;                                    
%22
n = (N_e_Y/N_Y)*ne+(NN_Y/N_Y)*nn; 
%23
ext_pr = rk(+1)-(rn-pi(+1));                           

a       = rho_A*a(-1) - e_a ;                          
eps_x   = rho_X*eps_x(-1) - e_x ;               
g       = rho_G*g(-1)-e_g;            
eps_r   = rho_ri*eps_r(-1) + e_r;
eps_p   = rho_P*eps_p(-1) + e_p;
eps_w   = rho_W*eps_w(-1) + e_w;
eps_k   = rho_k*eps_k(-1)- e_k;       

%%%%%%%%%%%%%%%%%%%%%%%%%
%%FLEXIBLE PRICE MODEL%%%
%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%HOUSEHOLDS%%%%%%%
(1-h)*muf=h*cf(-1)-cf;                                              
Lambdaf = muf-muf(-1);                            
Lambdaf(+1)+ rf = 0;                             
wf = phi*lf-muf;
%%%%%%%%FINANCIAL INTERMEDIARIES%%%%%%%
vf = beta*theta*X*(Lambdaf(+1)+xf+vf(+1))+((1-theta)/V)*beta*(RK*rkf-R*rf(-1))+((1-theta)/V)*beta*(RK-R)*Lambdaf(+1);
df = theta*beta*Z*(Lambdaf(+1)+zf+df(+1));
zf = (1/Z)*((LEV*RK/1)*rkf+(R*(1-LEV/1))*rf(-1)+
    ((RK-R)*LEV/1)*levf(-1));          
xf = levf+zf-levf(-1);                            
levf(+1) = df(+1)+(V/(lambda-V))*vf(+1); 
nef = nf(-1)+zf;                         
kf+qf=nf+levf; 
nf=(N_e_Y/N_Y)*nef+(NN_Y/N_Y)*nnf;   
nnf = kf+qf;                                     
ext_prf = rkf(+1)-rf;                             
%%%%%%%%INTERMEDIATE GOODS FIRMS%%%%%%%
yf = THETA*(a + alpha*(kf(-1)+eps_k)+alpha*uf  +(1-alpha)*lf);   
rkf = (ZK/RK)*zkf + (1-delta)/RK*(qf+eps_k)-qf(-1); 
uf = (1/(zeta/(1-zeta)))*zkf  ;          
a=alpha*zkf+ (1-alpha)*wf  ;   
zkf=wf+lf-kf(-1)-uf;                    
%CAPITAL PRODUCERS
i_f = (1/(1+beta))* (i_f(-1) + beta*i_f(+1)+(1/(ksi))*(qf +eps_x))  ;
%kf  =  ((1-delta)/1)*(kf(-1)+eps_k)+I_K*i_f + I_K*ksi*eps_x ;
kf  =((1-delta)/1)*(kf(-1)+eps_k)+delta*(i_f)+ I_K*ksi*eps_x  ; 
% RESOURCE CONSTRAINTS
yf=(C_Y)*cf+(I_Y)*i_f+G_Y*g+K_Y*ZK*uf;       


% measurement equations
dy     = y-y(-1)+trend;
dc     = c-c(-1)+trend;
dfi    = i-i(-1)+trend;
dw     = w-w(-1)+trend;
piobs  = pi + picbar;
robs   = r + conster;
%hobsgm = l + constelab;
emp    = (1/(1+beta))*emp(-1)+(beta/(1+beta))*emp(+1)+((1-beta*sig_E)*(1-sig_E)/((1+beta)*sig_E))*(l-emp);       

end;

steady;

check;

shocks;
var e_a; stderr 0.96;
var e_x; stderr 2.11;
var e_g; stderr 1.47;
var e_k; stderr 0.17;
var e_r; stderr 0.11;
var e_p; stderr 0.09;
var e_w; stderr 0.12;
end;
varobs dy dc dfi emp piobs dw robs;

estimated_params;

stderr e_a,   0.3974 ,0.01,25,INV_GAMMA_PDF,0.1,2;
stderr e_x,   1.0534 ,0.01,50,INV_GAMMA_PDF,0.1,2;
stderr e_r,   0.1224 ,0.01,25,INV_GAMMA_PDF,0.1,2;
stderr e_k,  0.1705 ,0.025,25,INV_GAMMA_PDF,0.1,2;
stderr e_g,   2.2030 ,0.01,50,INV_GAMMA_PDF,0.1,2;
stderr e_p, 0.1288 ,0.01,25,INV_GAMMA_PDF,0.1,2;
stderr e_w,    0.2806 ,0.01,25,INV_GAMMA_PDF,0.1,2;
%%%%%%%%%%%%%%%%%%%%%%%%%
rho_A,         0.9493 ,.01,.99999,BETA_PDF,0.5,0.20;
rho_k,        0.9802 ,.01,.99999,BETA_PDF,0.5,0.20;
rho_G,         0.9624 ,.01,.9999999,BETA_PDF,0.5,0.20;
rho_X,         0.9914 ,.01,.9999999,BETA_PDF,0.5,0.20;
rho_ri,        0.2154 ,-0.02,.9999,BETA_PDF,0.5,0.20;
rho_P,         0.2101 ,.01,.99999,BETA_PDF,0.5,0.20;
rho_W,         0.1907 ,.001,.9999,BETA_PDF,0.5,0.20;
ksi,      3.8293 ,0.0001,15,NORMAL_PDF,4,1.5;
h,             0.4279 ,0.1,0.99,BETA_PDF,0.7,0.1;
sig_w,       0.8453 ,0.25,0.99,BETA_PDF,0.75,0.05;
sig_p,        0.8953 ,0.5,0.97,BETA_PDF,0.75,0.05;
THETA,           1.3488 ,1.0,3,NORMAL_PDF,1.45,0.125;
phi,           1.6665 , 0.1, 3.5,gamma_pdf, 0.33,  0.25;
sig_wi,      0.3078 ,0.01,0.99,BETA_PDF,0.5,0.15;
sig_pi,      0.4257 ,0.01,0.99,BETA_PDF,0.5,0.15;
zeta,          0.8554 ,0.0001,1,BETA_PDF,0.25,0.15;
rho_PI,       1.8855 , 1.0,3,NORMAL_PDF,1.7,0.15;
rho_r,         0.8495 ,0.35,0.975,BETA_PDF,0.75,0.10;
rho_Y,        0.0743 ,-0.065 ,0.5,GAMMA_PDF,.125,0.05;
rho_DY,       0.2004 ,-0.1,0.5,NORMAL_PDF,0.0625,0.05;
%%%%%%%%%%%%%%%%%%%%%
picbar,       0.6473 ,0.1,2.0,GAMMA_PDF,0.625,0.1;
trend,       0.3029 ,0.001,0.8,NORMAL_PDF,0.4,0.10;

end;

options_.plot_priors=0;

%,,,bayesian_irf,mode_file=swbggus_mode,,bayesian_irf
% estimation(datafile=dataset_mv,mode_compute=0,mode_file=swgkusr2_mode,first_obs=125,nobs = 103, presample=0,
% lik_init=2,prefilter=0,conf_sig=0.95,mh_replic=0,load_mh_file,mh_nblocks=2,mh_jscale=0.35,
% mh_drop=0.25,moments_varendo) y i c pi rn ext_pr n;

%it gives IRF and variance decomposition,,conditional_variance_decomposition=[1 4 8 40 80]
stoch_simul(irf=20, nograph) y i pi n ext_pr;
%stoch_simul(irf=20) y i pi c robs q n ext_pr;