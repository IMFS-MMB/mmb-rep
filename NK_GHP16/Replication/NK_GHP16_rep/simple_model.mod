// Replication of Gnocchi, Hauser, Pappa, 2016 : "Housework and fiscal expansions"


var C C_m C_n W h_m h_n r lambda infl inflstar x_1 x_2 RMC g Y D; //G

varexo e_g;

% parameters b_1 alpha_1 delta xi b beta sigma eps theta tau G_ss rho_g phi_infl;
parameters g_ratio taup b_1 alpha_1 alpha_2 alpha_3 delta xi b beta sigma eps theta tau G_ss rho_g phi_infl
            RMC_ss h_n_ss h_m_ss kn_y_ss km_y_ss Y_ss C_m_ss C_n_ss G_ss W_ss h_ss l_ss;


 %% fixed parameters:
beta	=	0.99;
eps 	=	11;
theta	=	0.75;
xi      =	252.5;
sigma	=	2;
rho_g	=	0.8;
delta	=	0.0241;
tau     =   0;
taup     =	1/eps;
phi_infl=	1.5;
g_ratio  =   0;
alpha_3     =   0;
alpha_2     =   0;
         
% targets
RMC_ss  =    (eps-1)/(eps*(1-tau));
h_n_ss  =   0.19;
h_m_ss  =   0.33;
kn_y_ss  =   0;
km_y_ss  =   0;

% choose b_1
load parameterfile;
set_param_value('b_1',b_1)
%b_1     =   0.000001;
%b_1 	=   1/3;
%b_1     =   0.636;
%b_1     =   3/4;    

%steady state values:
Y_ss        =   h_m_ss;
C_m_ss      =   Y_ss;
G_ss        =   0;
W_ss        =   RMC_ss;
C_n_ss      =   h_n_ss;
alpha_1     =   ((1-alpha_2)*C_n_ss^b_1/(W_ss*h_n_ss))/(C_m_ss^(b_1-1)+(1-alpha_2)*C_n_ss^b_1/(W_ss*h_n_ss));
h_ss        =   h_n_ss + h_m_ss;
l_ss        =   1-h_ss;
b           =   ((1-alpha_2)*C_m_ss+W_ss*h_n_ss)/((1-alpha_2)*(W_ss*l_ss+C_m_ss)+W_ss*h_n_ss);
C_ss        =   (alpha_1*C_m_ss^b_1+(1-alpha_1)*C_n_ss^b_1)^(1/b_1);
I_ss        =    0;


model;
// Households:
	
// 1. Aggregate Consumption
exp(C)=(alpha_1*exp(C_m)^b_1+(1-alpha_1)*exp(C_n)^b_1)^(1/b_1);

// 2.  Production of home goods
exp(C_n)=exp(h_n);


//3. MRS between leisure and home comsumption equal to their relative prices
alpha_1/(1-alpha_1)*(exp(C_m)/exp(C_n))^(b_1-1)=1/exp(W);


//4. Optimal allocation of time btw. leisure and market consumption
exp(W)*(1-exp(h_m)-exp(h_n))=(1-b)/(b*alpha_1)*exp(C_m)^(1-b_1)*exp(C)^b_1;


//5. Euler equation for financial assets
beta*exp(lambda(+1))/exp(lambda)*exp(1+r)*exp(infl(+1))^(-1)=1;

//6. Marginal utility of market consumption
exp(lambda)=b*alpha_1*(1-exp(h_n)-exp(h_m))^((1-b)*(1-sigma))*exp(C_m)^(b_1-1)*exp(C)^(b*(1-sigma)-b_1);


//Firms

//7. Optimal price choice
exp(inflstar)=((1-theta*exp(infl)^(eps-1))/(1-theta))^(1/(1-eps));

//8.
exp(inflstar)=exp(x_1)/exp(x_2);

//9. Auxiliary variables
exp(x_1)=(exp(C_m)+g)*(eps*(1-tau)/(eps-1))*exp(RMC)+beta*theta*exp(lambda(+1))/exp(lambda)*exp(infl(+1))^eps*exp(x_1(+1));

//10.
exp(x_2)=(exp(C_m)+g)+beta*theta*exp(lambda(+1))/exp(lambda)*exp(infl(+1))^(eps-1)*exp(x_2(+1));

//11. Market clearing
exp(Y)=exp(C_m)+g;

//12. Output
exp(Y)=exp(D)^(-1)*exp(h_m);

//13.
exp(RMC)*exp(D)*exp(Y)/exp(h_m)=exp(W);

//14. Price dispersion
exp(D)=(1-theta)*exp(inflstar)^(-eps)+theta*exp(infl)^eps*exp(D(-1));

//Government
//15. Government expenditure
//G  =   exp(g);

//16.
g  =   rho_g*g(-1)+e_g;

//17. Interest rate rule
//1+r=beta^(-1)+infl*phi_infl;
exp(1+r)=beta^(-1)*exp(infl)^phi_infl;
end;

initval;
Y=log(Y_ss);
//G=0;
g=0;

h_m=log(h_m_ss);
h_n=log(h_n_ss);
W=log(W_ss);

infl=0;
inflstar=0;
C=log(C_ss);
C_m=log(C_m_ss);
C_n=log(C_n_ss);

lambda= log(b*alpha_1*(1-h_n_ss-h_m_ss)^((1-b)*(1-sigma))*C_m_ss^(b_1-1)*C_ss^(b*(1-sigma)-b_1));
r=log(1/beta)-1;
RMC=log(RMC_ss);
D= 0;
x_1=log((C_m_ss+G_ss)/(1-beta*theta));
x_2=x_1;
end;
steady;
resid;

shocks;
var e_g=(Y_ss)^2;
end;


stoch_simul(order=1, irf=20, nograph);