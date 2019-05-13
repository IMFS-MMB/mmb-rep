// Replication of Gnocchi, Hauser, Pappa, 2016 : "Housework and fiscal expansions"


var C C_m C_n K K_m K_n I W h_m h_n r_k r lambda infl inflstar x_1 x_2 RMC G g Y D;

varexo e_g;

parameters g_ratio taup b_1 alpha_1 alpha_2 alpha_3 delta xi b beta sigma eps theta tau G_ss rho_g phi_infl
            RMC_ss h_n_ss h_m_ss kn_y_ss km_y_ss i_ratio_ss r_k_ss Y_ss C_m_ss C_n_ss G_ss W_ss h_ss l_ss;


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
g_ratio  =   0.18;
         
% targets
RMC_ss  =    (eps-1)/(eps*(1-tau));
h_n_ss  =   0.19;
h_m_ss  =   0.33;
kn_y_ss  =   6.76;
km_y_ss  =   5.16;

% choose b_1
load parameterfile;
set_param_value('b_1',b_1)
%b_1     =   0;
%b_1 	=   1/3;
%b_1     =   0.636;
%b_1     =   3/4;    

%steady state values:
i_ratio_ss  =   delta;
r_k_ss      =   (1-beta*(1-delta))/beta;
alpha_3     =   r_k_ss*km_y_ss;
Y_ss        =   km_y_ss^(alpha_3/(1-alpha_3))*h_m_ss;
C_m_ss      =   Y_ss*(1-g_ratio-delta*(km_y_ss+kn_y_ss));
G_ss        =   g_ratio*Y_ss;
W_ss        =   (1-alpha_3)*Y_ss/h_m_ss;
alpha_2     =   (kn_y_ss*r_k_ss*Y_ss)/(kn_y_ss*r_k_ss*Y_ss+W_ss*h_n_ss);
C_n_ss      =   (kn_y_ss*Y_ss)^alpha_2*h_n_ss^(1-alpha_2);
alpha_1     =   ((1-alpha_2)*C_n_ss^b_1/(W_ss*h_n_ss))/(C_m_ss^(b_1-1)+(1-alpha_2)*C_n_ss^b_1/(W_ss*h_n_ss));
h_ss        =   h_n_ss + h_m_ss;
l_ss        =   1-h_ss;
b           =   ((1-alpha_2)*C_m_ss+W_ss*h_n_ss)/((1-alpha_2)*(W_ss*l_ss+C_m_ss)+W_ss*h_n_ss);

C_ss        =   (alpha_1*C_m_ss^b_1+(1-alpha_1)*C_n_ss^b_1)^(1/b_1);
I_ss        =    i_ratio_ss*(kn_y_ss+km_y_ss)*Y_ss;


model;
// Households:
	
// 1. Aggregate Consumption
exp(C)=(alpha_1*exp(C_m)^b_1+(1-alpha_1)*exp(C_n)^b_1)^(1/b_1);

// 2.  Production of home goods
exp(C_n)=exp(K_n)^alpha_2*exp(h_n)^(1-alpha_2);
//exp(C_n)=exp(K_n)*alpha_2+exp(h_n)*(1-alpha_2);

//3. Aggregate capital
exp(K)=exp(K_m)+exp(K_n);

//4. Capital accumulation
exp(K)=(1-delta)*exp(K(-1))+exp(I)-xi/2*(exp(K)/exp(K(-1))-1)^2;

//5. MRS between leisure and home comsumption equal to their relative prices
alpha_1/(1-alpha_1)*(exp(C_m)/exp(C_n))^(b_1-1)=(1-alpha_2)/exp(W)*exp(C_n)/exp(h_n);

//6. MRS between the two consumption goods equal to ratio of returns to capital in both sectors
alpha_1/(1-alpha_1)*(exp(C_m)/exp(C_n))^(b_1-1)=alpha_2/exp(r_k)*exp(C_n)/exp(K_n);

//7. Optimal allocation of time btw. leisure and market consumption
exp(W)*(1-exp(h_m)-exp(h_n))=(1-b)/(b*alpha_1)*exp(C_m)^(1-b_1)*exp(C)^b_1;

//8. Euler equation for the capital stock
beta*exp(lambda(+1))/exp(lambda)*(1+xi/exp(K(-1))*(exp(K)/exp(K(-1))-1))^(-1)*(1-delta+exp(r_k(+1))+xi*(exp(K(+1))/exp(K)-1)*exp(K(+1))/exp(K)^2)=1;

//9. Euler equation for financial assets
beta*exp(lambda(+1))/exp(lambda)*exp(1+r)*exp(infl(+1))^(-1)=1;

//10. Marginal utility of market consumption
exp(lambda)=b*alpha_1*(1-exp(h_n)-exp(h_m))^((1-b)*(1-sigma))*exp(C_m)^(b_1-1)*exp(C)^(b*(1-sigma)-b_1);


//Firms

//11. Optimal price choice
exp(inflstar)=((1-theta*exp(infl)^(eps-1))/(1-theta))^(1/(1-eps));

//12.
exp(inflstar)=exp(x_1)/exp(x_2);

//13. Auxiliary variables
exp(x_1)=(exp(C_m)+exp(I)+exp(G))*(eps*(1-tau)/(eps-1))*exp(RMC)+beta*theta*exp(lambda(+1))/exp(lambda)*exp(infl(+1))^eps*exp(x_1(+1));

//14.
exp(x_2)=(exp(C_m)+exp(I)+exp(G))+beta*theta*exp(lambda(+1))/exp(lambda)*exp(infl(+1))^(eps-1)*exp(x_2(+1));

//15. Market clearing
exp(Y)=exp(C_m)+exp(I)+exp(G);

//16. Output
exp(Y)=exp(D)^(-1)*exp(K_m)^alpha_3*exp(h_m)^(1-alpha_3);
//exp(Y)=exp(D)^(-1)*(exp(K_m)*alpha_3+exp(h_m)*(1-alpha_3));


//17. Cost minimization
alpha_3*exp(RMC)*exp(D)*exp(Y)/exp(K_m)=exp(r_k)*(1-taup);

//18.
(1-alpha_3)*exp(RMC)*exp(D)*exp(Y)/exp(h_m)=exp(W)*(1-taup);

//19. Price dispersion
exp(D)=(1-theta)*exp(inflstar)^(-eps)+theta*exp(infl)^eps*exp(D(-1));

//Government
//20. Government expenditure
exp(G)   =   G_ss*exp(g);
%exp(G)      =   (exp(g)-1)*(C_m_ss+I_ss);

//21.
g  =   rho_g*g(-1)+e_g ;

//22. Interest rate rule
//1+r=beta^(-1)+infl*phi_infl;
exp(1+r)=beta^(-1)*exp(infl)^phi_infl;
end;

initval;
Y=log(Y_ss);
G=log(G_ss);
g=0;
K_m=log(km_y_ss*Y_ss);
K_n=log(kn_y_ss*Y_ss);
K=log(km_y_ss*Y_ss+kn_y_ss*Y_ss);
h_m=log(h_m_ss);
h_n=log(h_n_ss);
W=log(W_ss);
I=log(I_ss);
infl=0;
inflstar=0;
C=log(C_ss);
C_m=log(C_m_ss);
C_n=log(C_n_ss);
r_k=log(r_k_ss);
lambda= log(b*alpha_1*(1-h_n_ss-h_m_ss)^((1-b)*(1-sigma))*C_m_ss^(b_1-1)*C_ss^(b*(1-sigma)-b_1));
r=log(1/beta)-1;
RMC=log(RMC_ss);
D= 0;
x_1=log((C_m_ss+I_ss+G_ss)/(1-beta*theta));
x_2=x_1;
end;

steady;
resid;

shocks;
var e_g=(Y_ss/G_ss)^2;
end;


stoch_simul(order=1, irf=40, nograph);