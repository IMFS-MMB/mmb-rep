// Replication file for EAES_RA09 model 
//by Martina Jancokova
//RESTRICTED model
//Note: pi represents here p-p(t-1)

var dy dy_star mu r pi c mu_star c_star rer t_N t_H t_F t_T t_N_star t_H_star t_F_star t_T_star 
    c_H c_F c_N c_H_star c_F_star c_N_star l w l_star w_star l_N l_T l_N_star l_T_star y_N z_N y_H z_T y_N_star z_N_star 
    y_F_star z_T_star pi_H pi_N pi_N_star pi_F pi_star pi_EMU g_N g_T g_N_star g_T_star y y_star; 
//pi_T pi_T_star p_N p p_H p_F p_T p_N_star p_T_star p_star 

varexo eps_m eps_ZT eps_ZN eps_ZT_star eps_Z eps_ZN_star eps_GT eps_GN eps_GT_star eps_GN_star;

parameters b x alfa_T b_star alfa_T_star nu eps w_bar w_bar_star gamma gamma_star vaphi_N theta_N beta alfa_N  
           vaphi_H theta_H vaphi_N_star theta_N_star alfa_N_star vaphi_F_star theta_F_star lambda lambda_star s
           eta eta_star rho_r gamma_pi rho_ZT rho_ZN rho_ZT_star rho_ZN_star rho_GT rho_GN rho_GT_star rho_GN_star;

//NOTE: eta=G_N/Y_N=G_T/Y_H 

//"C" at the end of parameter description stands for "calibrated parameter"
//"star" denotes parameters describing foreign country

//NOTE: the positive estimated trends are set equal zero (multiplied by zero)
//      to perfectly match the IRFs in the paper
//  TRENDS: x alfa_T alfa_T_star alfa_N alfa_N_star

b=0.6;                  //habit persistence in home country C
x=0*0.57;                 //growth rate in the EMU in percent 
alfa_T=0*0.04;            //sector-specific trend (home tradable sector) 
b_star=0.6;             //habit persistence in foreign country C
alfa_T_star=0*0.06;       //sector-specific trends (foreign tradable sector)  
nu=0.52;                //elasticity of substitution between H and F goods 
eps=0.51;               //elasticity of substitution between T and N goods  
w_bar=1;                //labor disutility in home country C 
w_bar_star=1;           //labor disutility in foreign country C 
gamma=0.66;             //proportion of goods in Spain HICP C 
gamma_star=0.61;        //proportion of goods in Euro Area HICP C 
vaphi_N=0.28;           //sector-specific last period's inflation rate indexation fraction (the rest indexes to the SS inflation rate)
theta_N=0.66;           //sector-specific Calvo lottery 
beta=0.99;              //discount factor C
alfa_N=0*(-0.11);           //sector-specific trend (nontradable sector)  
vaphi_H=0.44;           //sector-specific last period's inflation rate indexation fraction (the rest indexes to the SS inflation rate) 
theta_H=0.35;           //sector-specific Calvo lottery 
vaphi_N_star=0.46;      //sector-specific last period's inflation rate indexation fraction (the rest indexes to the SS inflation rate)  
theta_N_star=0.85;      //sector-specific Calvo lottery 
alfa_N_star=0*(-0.03);      //sector-specific trend (foreign nontradable sector) 
vaphi_F_star=0.37;      //sector-specific last period's inflation rate indexation fraction (the rest indexes to the SS inflation rate)   
theta_F_star=0.43;      //sector-specific Calvo lottery  

eta=0.18;               //average ratio G/Y in Spain C 
eta_star=0.20;          //average ratio G/Y in euro area C 
rho_r=0.73;             //interest rate smoothing 
gamma_pi=1.43;          //Taylor rule inflation 
rho_ZT=0.65;            //AR(1) coefficient of productivity shock in tradable sector at home 
rho_ZN=0.77;            //AR(1) coefficient of productivity shock in nontradable sector at home  
rho_ZT_star=0.65;       //=rho_ZT
rho_ZN_star=0.77;       //=rho_ZN
rho_GT=0.96;            //AR(1) coefficient of preference (government spending) shock in tradable sector at home  
rho_GN=0.98;            //AR(1) coefficient of preference (government spending) shock in nontradable sector at home 
rho_GT_star=0.96;       //=rho_GT 
rho_GN_star=0.98;       //=rho_GN

//Differencies to Rabanal's code
//lambda=0.16;            //average ratio of imports from EMU C 
//lambda_star=0.015;      //average ratio of imports from Spain C
lambda=0.85;            
lambda_star=0.98;      

//s=0.11;                 //average weight of Spain in EMU HICP C
s=((1-lambda)*gamma*(1-eta)/((1-lambda_star)*gamma_star*(1-eta_star))+1)^(-1);


model(linear);

//Definitions
//pi=p-p(-1);
//pi_star=p_star-p_star(-1);              
//t_N=p_N-p;
//t_H=p_H-p;
//t_F=p_F-p;
//t_T=p_T-p;
//t_N_star=p_N_star-p_star;
//t_H_star=p_H-p_star;
//t_F_star=p_F-p_star;
//t_T_star=p_T_star-p_star;


//****************************
// HOME AND FOREIGN COUNTRY **
//****************************

//GDP growth rate
dy=y-y(-1);
dy_star=y_star-y_star(-1);


//Euler equation
mu=mu(+1)+(r-pi(+1));   
-mu_star*(1-b_star/((1+x)*(1+alfa_T_star)))=c_star-b/((1+x)*(1+alfa_T_star))*c_star(-1); 
-mu*(1-b/((1+x)*(1+alfa_T)))=c-b/((1+x)*(1+alfa_T))*c(-1);


//Risk sharing (real exchange rate)
rer=mu_star-mu;


//Consumption demand functions by households
c_H=-nu*t_H-(eps-nu)*t_T+c;
c_F=-nu*t_F-(eps-nu)*t_T+c;
c_N=-eps*t_N+c;

c_H_star=-nu*t_H_star-(eps-nu)*t_T_star+c_star;
c_F_star=-nu*t_F_star-(eps-nu)*t_T_star+c_star;
c_N_star=-eps*t_N_star+c_star;


//Labor supply
w_bar*l=w+mu;
w_bar_star*l_star=w_star+mu_star;


//Hours allocation across sectors
l=(1-gamma)*l_N+gamma*l_T;
l_star=(1-gamma_star)*l_N_star+gamma_star*l_T_star;


//Production functions in the two sectors
y_N=z_N+l_N;
y_H=z_T+l_T;

y_N_star=z_N_star+l_N_star;
y_F_star=z_T_star+l_T_star;


//Price setting in the two sectors
pi_N-vaphi_N*pi_N(-1)=((1-theta_N)*(1-beta*theta_N*((1+alfa_N)/(1+alfa_T))))/theta_N*(w-t_N-z_N)+beta*((1+alfa_N)/(1+alfa_T))*(pi_N(+1)-vaphi_N*pi_N);
pi_H-vaphi_H*pi_H(-1)=((1-theta_H)*(1-beta*theta_H))/theta_H*(w-t_H-z_T)+beta*(pi_H(+1)-vaphi_H*pi_H);

pi_N_star-vaphi_N_star*pi_N_star(-1)=((1-theta_N_star)*(1-beta*theta_N_star*((1+alfa_N_star)/(1+alfa_T_star))))/theta_N_star*(w_star-t_N_star-z_N_star)+beta*((1+alfa_N_star)/(1+alfa_T_star))*(pi_N_star(+1)-vaphi_N_star*pi_N_star);
pi_F-vaphi_F_star*pi_F(-1)=((1-theta_F_star)*(1-beta*theta_F_star))/theta_F_star*(w_star-t_F_star-z_T_star)+beta*(pi_F(+1)-vaphi_F_star*pi_F);


//Relevant price indices

//Consumer price inflation
pi=gamma*lambda*pi_H+gamma*(1-lambda)*pi_F+(1-gamma)*pi_N;
pi_star=gamma_star*(1-lambda_star)*pi_H+gamma_star*lambda_star*pi_F+(1-gamma_star)*pi_N_star;

//ECB target (as the euro-area wide CPI)
pi_EMU=s*pi+(1-s)*pi_star;


//Relative price variables movement processes
//t_N=t_N(-1)+pi_N-pi;
//t_T=t_T(-1)+pi_T-pi;

t_H=t_H(-1)+pi_H-pi;
t_F=t_F(-1)+pi_F-pi;

t_N=-gamma/(1-gamma)*t_T;
t_T=lambda*t_H+(1-lambda)*t_F;


t_N_star=t_N_star(-1)+pi_N_star-pi_star;

//t_T_star=t_T_star(-1)+pi_T_star-pi_star;
//t_H_star=t_H-rer;
//t_F_star=t_F-rer;

t_T_star=(1-lambda_star)*t_H_star+lambda_star*t_F_star;
t_H_star=t_H_star(-1)+pi_H-pi_star;
t_F_star=t_F_star(-1)+pi_F-pi_star;


//Real exchange rate movement process
//rer=rer(-1)+pi_star-pi;

rer=-(1-gamma)*(t_N - t_T)+(1-gamma_star)*(t_N_star - t_T_star)+(1-lambda-lambda_star)*(t_H-t_F);


//Market clearing
y_N=(1-eta)*c_N+eta*g_N;
y_H=(1-eta)*(lambda*c_H+(1-lambda)*c_H_star)+eta*g_T;

y_N_star=(1-eta_star)*c_N_star+eta_star*g_N_star;
y_F_star=(1-eta_star)*((1-lambda_star)*c_F+lambda_star*c_F_star)+eta_star*g_T_star;


//Aggregate real GDP aggregates tradable and nontradable goods
y=gamma*(t_H+y_H)+(1-gamma)*(t_N+y_N);
y_star=gamma_star*(t_F_star+y_F_star)+(1-gamma_star)*(t_N_star+y_N_star);


//Monetary policy
r=rho_r*r(-1)+(1-rho_r)*gamma_pi*pi_EMU+eps_m;


//Shocks

//Technology shocks
z_T=rho_ZT*z_T(-1)+eps_ZT+eps_Z;
z_N=rho_ZN*z_N(-1)+eps_ZN;

z_T_star=rho_ZT_star*z_T_star(-1)+eps_ZT_star+eps_Z;
z_N_star=rho_ZN_star*z_N_star(-1)+eps_ZN_star;

//Demand shocks
g_T=rho_GT*g_T(-1)+eps_GT;
g_N=rho_GN*g_N(-1)+eps_GN;

g_T_star=rho_GT_star*g_T_star(-1)+eps_GT_star;
g_N_star=rho_GN_star*g_N_star(-1)+eps_GN_star;

end;

steady;
check;

shocks;
var eps_m; stderr 0.14;
var eps_Z; stderr 0.54;
var eps_ZT; stderr 0.59;
var eps_ZT_star; stderr 0.46;
var eps_ZN; stderr 0.72;
var eps_ZN_star; stderr 0.88;
var eps_GT; stderr 3.07;
var eps_GT_star; stderr 3.26;
var eps_GN; stderr 4.58;
var eps_GN_star; stderr 2.34;
end;

stoch_simul(irf=15, nograph, noprint) pi pi_star pi_N_star pi_N dy dy_star;