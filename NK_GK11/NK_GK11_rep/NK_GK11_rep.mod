// Dynare model file to calculate the GK model
// Created by Peter Karadi
// July 2010


var Y Ym K Keff L I C G Q varrho Lambda Rk R N Ne Nn nu eta phi z x Pm w 
     VMPK U X D F Z i prem delta In Welf infl inflstar a ksi g ;    

varexo e_a e_ksi e_g e_Ne e_i;   


parameters 

 betta sig hh varphi zetta theta alfa G_over_Y eta_i epsilon gam gam_P kappa_pi kappa_y rho_i rho_ksi sigma_ksi rho_a
 sigma_a rho_g sigma_g sigma_Ne sigma_i rho_shock_psi sigma_psi kappa tau omega lambda chi b delta_c G_ss I_ss Pmf
 L_mom RkmR_mom phi_mom  L0 K0 chi0 lambda0 omega0 deltai Y_ss;//kappa tau

%exogenous chosen parameters
betta   =   0.99;           %Discount rate
sig     =   1;              %Intertemporal elasticity of substitution
hh      =   0.815;          %Habit formation parameters
varphi  =   0.276;          %Inverse Frisch elasticity of labor supply       
zetta   =   7.2;            %Elasticity of marginal depreciation wrt the utilization rate
alfa    =   0.33;           %Capital share
deltai   =   0.025;          %Depreciation rate
G_over_Y=   0.2;            %Government expenditures over GDP
eta_i   =   1.728;          %elasticity of investment adjusment cost
theta   =   0.97155955;      %The survival probability

%Retail firms
epsilon =   4.167;          %Elasticity of substitution between goods %problem with 1: C-D
gam     =   0.779;          %Calvo parameter
gam_P   =   0.241;          %Price indexation parameter
Pmf=log((epsilon-1)/epsilon);
 
%Monetary Policy parameters
rho_i   =   0.8; %0.8            %Interest rate smoothing parameter
kappa_pi=   1.5;            %Inflation coefficient
kappa_y =   -0.5/4;          %Output gap coefficient

%Shocks
sigma_ksi   =   0.05;       %size of the capital quality shock
rho_ksi     =   0.66;       %persistence of the capital quality shock
sigma_a     =   0.01;       %size of the TFP shock
rho_a       =   0.95;       %persistence of the TFP shock
sigma_g     =   0.01;       %size of the government expenditure shock
rho_g       =   0.95;       %persistence of the government expenditure shock
sigma_Ne    =   0.01;       %wealth shock
sigma_i     =   0.01;       %monetary policy shock
rho_shock_psi=  0.66;       %persistence of the CP shock
sigma_psi   =   0.072;      %size of the CP shock

kappa=10.00000000;
tau=0.00100000; 
deltai=0.025;
 
//G_ss       =   0.16975710;
//I_ss       =   0.14153927;

%Targeted moments
L_mom    =   1/3;       %Steady state labor supply
RkmR_mom =   0.01/4;    %steady state premium
phi_mom  =   4;         %steady state leverage

%Credit policy parameters
kappa      =   10;     %Credit policy coefficient
tau        =   0.001;  %Costs of credit policy

%Starting values for some steady state values
L0      =   L_mom;
K0      =   9.5;      

% endogeous determined parameters
lambda0  =  0.3815;          %Starting value divertable fraction 
omega0   =  0.002;           %Starting value of proportional starting up funds
chi0    =   3.4;             %Starting value for the labor utility weight 
//lambda  =  lambda0;          %Starting value divertable fraction 
//omega   =  omega0;           %Starting value of proportional starting up funds
//chi      =   chi0;
  
//**************************************************************************

model;
 
//Home household

//1. Marginal utility of consumption
exp(varrho)  =   (exp(C)-hh*exp(C(-1)))^(-sig)-betta*hh*(exp(C(+1))-hh*exp(C))^(-sig); 
 
//2. Euler equation 
betta*exp(R)*exp(Lambda(+1))  =   1;

//3. Stochastic discount rate 
exp(Lambda)  =   exp(varrho)/exp(varrho(-1));

//4. Labor market equilibrium 
chi*exp(L)^varphi    =   exp(varrho)*exp(Pm)*(1-alfa)*exp(Y)/exp(L);

//Financial Intermediaries

//5. Value of banks' capital 
exp(nu)     =   (1-theta)*betta*exp(Lambda(+1))*(exp(Rk(+1))-exp(R))+betta*exp(Lambda(+1))*theta*exp(x(+1))*exp(nu(+1));

//6. Value of banks' net wealth
exp(eta)    =   (1-theta)+betta*exp(Lambda(+1))*theta*exp(z(+1))*exp(eta(+1));

//7. Optimal leverage
exp(phi)    =   exp(eta)/(lambda-exp(nu ));

//8. Growth rate of banks' capital
exp(z)      =   (exp(Rk )-exp(R(-1)))*exp(phi(-1))+exp(R(-1));

//9. Growth rate of banks' net wealth
exp(x)      =   (exp(phi)/exp(phi(-1)))*exp(z);

//Aggregate capital, net worth
//10. Aggregate capital
exp(Q)*exp(K)     =   exp(phi)*exp(N);

//11. Banks' net worth
exp(N)      =   exp(Ne)+exp(Nn);

//12. Existing banks' net worth accumulation
exp(Ne)     =   theta*exp(z)*exp(N(-1))*exp(-e_Ne);

//13. New banks' net worth
exp(Nn)    =   omega*exp(Q)*exp(ksi)*exp(K(-1));

//Final goods producer
//14. Return to capital
exp(Rk )     =   (exp(Pm )*alfa*exp(Ym )/exp(K (-1))+exp(ksi)*(exp(Q )-exp(delta )))/exp(Q (-1)); 

//15. Production function
exp(Ym)     =   exp(a)*(exp(ksi)*exp(U)*exp(K(-1)))^alfa*exp(L)^(1-alfa); 
 
//Capital Goods Producer
//16. Optimal investment decision
exp(Q)  =   1+eta_i/2*((In+I_ss)/(In(-1)+I_ss)-1)^2+eta_i*((In+I_ss)/(In(-1)+I_ss)-1)*(In+I_ss)/(In(-1)+I_ss)
               -betta*exp(Lambda(+1))*eta_i*((In(+1)+I_ss)/(In+I_ss)-1)*((In(+1)+I_ss)/(In+I_ss))^2;

//17. Depreciation rate
exp(delta) = delta_c+b/(1+zetta)*exp(U)^(1+zetta);

//18. Optimal capacity utilization rate
exp(Pm)*alfa*exp(Ym)/exp(U) = b*exp(U)^zetta*exp(ksi)*exp(K(-1));

//19. Net investment
In    =   exp(I)-exp(delta)*exp(ksi)*exp(K(-1));


//20. Capital accumulation equation
exp(K)  =   exp(ksi)*exp(K(-1))+In  ;

//21. Government consumption
exp(G)   =   G_ss*exp(g);

//Equilibrium
//22. Aggregate resource constraint 
exp(Y)   =   exp(C)+exp(G)+exp(I)+eta_i/2*((In+I_ss)/(In(-1)+I_ss)-1)^2*(In+I_ss);


//23. Wholesale, retail output
exp(Ym)    =   exp(Y)*exp(D);

//24. Price dispersion
exp(D)    =   gam*exp(D(-1))*exp(infl(-1))^(-gam_P*epsilon)*exp(infl)^epsilon+(1-gam)*((1-gam*exp(infl(-1))^(gam_P*(1-gam))*exp(infl)^(gam-1))/(1-gam))^(-epsilon/(1-gam));

//25. Markup
exp(X)  =   1/exp(Pm);

//26. Optimal price choice
exp(F)       =   exp(Y)*exp(Pm)+betta*gam*exp(Lambda(+1))*exp(infl(+1))^epsilon*(exp(infl))^(-epsilon*gam_P)*exp(F(+1));

//27.
exp(Z)       =   exp(Y)+betta*gam*exp(Lambda(+1))*exp(infl(+1))^(epsilon-1)*exp(infl)^(gam_P*(1-epsilon))*exp(Z(+1));

//28. Optimal price choice
exp(inflstar)   =  epsilon/(epsilon-1)*exp(F)/exp(Z)*exp(infl);

//29. Price index
(exp(infl))^(1-epsilon)     =   gam*exp(infl(-1))^(gam_P*(1-epsilon))+(1-gam)*(exp(inflstar))^(1-epsilon);

//30. Fisher equation
exp(i)  =   exp(R)*exp(infl(+1));

//31. Interest rate rule
exp(i)      =   exp(i(-1))^rho_i*((1/betta)*exp(infl)^kappa_pi*(exp(X)/(epsilon/(epsilon-1)))^(kappa_y))^(1-rho_i)*exp(e_i);

//Some extra variables for convenience

//35. Effective capital
exp(Keff)   =   exp(ksi)*exp(K(-1));

//36. Wages
exp(w)      =   exp(Pm)*(1-alfa)*exp(Y)/exp(L);

//37. Marginal value product of capital
exp(VMPK)   =   exp(Pm)*alfa*exp(Y)/(exp(ksi)*exp(K(-1)));

//38. Welfare
Welf    =   log(exp(C)-hh*exp(C(-1)))-chi*exp(L)^(1+varphi)/(1+varphi)+betta*Welf(+1);

//39. Premium
exp(prem)   =   exp(Rk(+1))/exp(R); 

 
//Shocks
//32. TFP shock
a  =   rho_a*a(-1)-e_a;

//33. Capital quality shock
ksi=   rho_ksi*ksi(-1)-e_ksi;

//34. Government consumption shock
g  =   rho_g*g(-1)-e_g;




end;
check;

//initval;
//Y=log(0.84878550);          Yf =log(0.84878550);
//Ym=log(0.84878550);         Ymf =log(0.84878550);
//K=log(5.66157077);          Kf =log(5.66157077);
//Keff=log(5.66157077);       Kefff =log(5.66157077);
//L=log(0.33333333);          Lf =log(0.33333333);
//I=log(0.14153927);          If =log(0.14153927);
//C=log(0.53748913);          Cf =log(0.53748913);
//G=log(0.16975710);          Gf =log(0.16975710);
//Q=log(1.00000000);          Qf =log(1.00000000);
//varrho=log(1.94246544);     varrhof =log(1.94246544);
//Lambda=log(1.00000000);     Lambdaf =log(1.00000000);
//Rk=log(1.01260101);         Rkf =log(1.01260101);
//R=log(1.01010101);          Rf =log(1.01010101);
//N=log(1.41539269);          Nf =log(1.41539269);
//Ne=log(1.40277996);         Nef =log(1.40277996);
//Nn=log(0.01261274);         Nnf =log(0.01261274);
//nu=log(0.00373978);         nuf =log(0.00373978);
//eta=log(1.51102084);        etaf =log(1.51102084);
//phi=log(4.00000000);        phif =log(4.00000000);
//z=log(1.02010101);          zf =log(1.02010101);
//x=log(1.02010101);          xf =log(1.02010101);
//Pm=log(0.76001920);      
//w=log(1.29663748);          wf =log(1.29663748);
//VMPK=log(0.03760101);       VMPKf =log(0.03760101);
//U=log(1.00000000);          Uf =log(1.00000000);
//X=log(1.31575624);
//D=log(1.00000000);
//F=log(2.81958684);
//Z=log(3.70988896);
//i=log(1.01010101);
//prem=log(1.00247500);       premf =log(1.00247500);
//delta=log(0.02500000);      deltaf =log(0.02500000);
//In=0.00000000;              In_f =0.00000000;
//Welf=-296.62068821;         Welf =-296.62068821;
//a=0.00000000;
//ksi=0.00000000;
//g=0.00000000;
//infl=0.00000000;
//inflstar=0.00000000;

//e_a=0.00000000;
//e_ksi=0.00000000;
//e_g=0.00000000;
//e_Ne=0.00000000;
//e_i=0.00000000;
//end;

shocks;
var e_a=1;//sigma_a^2;
var e_ksi=sigma_ksi^2;
var e_g=sigma_g^2;
var e_Ne=1;//sigma_Ne^2;
var e_i=0.25^2;//sigma_i^2;
end;

//check;

//steady;

stoch_simul(order=1, irf=40, nograph, noprint);

// Saving the impulse responses
//save ../data/FA_1.mat Y_e_a Y_e_ksi Y_e_g Y_e_Ne Y_e_i Ym_e_a Ym_e_ksi Ym_e_g Ym_e_Ne Ym_e_i K_e_a K_e_ksi K_e_g K_e_Ne K_e_i Keff_e_a Keff_e_ksi Keff_e_g Keff_e_Ne Keff_e_i L_e_a L_e_ksi L_e_g L_e_Ne L_e_i I_e_a I_e_ksi I_e_g I_e_Ne I_e_i C_e_a C_e_ksi C_e_g C_e_Ne C_e_i G_e_a G_e_ksi G_e_g G_e_Ne G_e_i Q_e_a Q_e_ksi Q_e_g Q_e_Ne Q_e_i varrho_e_a varrho_e_ksi varrho_e_g varrho_e_Ne varrho_e_i Lambda_e_a Lambda_e_ksi Lambda_e_g Lambda_e_Ne Lambda_e_i Rk_e_a Rk_e_ksi Rk_e_g Rk_e_Ne Rk_e_i R_e_a R_e_ksi R_e_g R_e_Ne R_e_i N_e_a N_e_ksi N_e_g N_e_Ne N_e_i Ne_e_a Ne_e_ksi Ne_e_g Ne_e_Ne Ne_e_i Nn_e_a Nn_e_ksi Nn_e_g Nn_e_Ne Nn_e_i nu_e_a nu_e_ksi nu_e_g nu_e_Ne nu_e_i eta_e_a eta_e_ksi eta_e_g eta_e_Ne eta_e_i phi_e_a phi_e_ksi phi_e_g phi_e_Ne phi_e_i z_e_a z_e_ksi z_e_g z_e_Ne z_e_i x_e_a x_e_ksi x_e_g x_e_Ne x_e_i Pm_e_a Pm_e_ksi Pm_e_g Pm_e_Ne Pm_e_i w_e_a w_e_ksi w_e_g w_e_Ne w_e_i VMPK_e_a VMPK_e_ksi VMPK_e_g VMPK_e_Ne VMPK_e_i U_e_a U_e_ksi U_e_g U_e_Ne U_e_i X_e_a X_e_ksi X_e_g X_e_Ne X_e_i D_e_a D_e_ksi D_e_g D_e_Ne D_e_i F_e_a F_e_ksi F_e_g F_e_Ne F_e_i Z_e_a Z_e_ksi Z_e_g Z_e_Ne Z_e_i i_e_a i_e_ksi i_e_g i_e_Ne i_e_i prem_e_a prem_e_ksi prem_e_g prem_e_Ne prem_e_i delta_e_a delta_e_ksi delta_e_g delta_e_Ne delta_e_i In_e_a In_e_ksi In_e_g In_e_Ne In_e_i Welf_e_a Welf_e_ksi Welf_e_g Welf_e_Ne Welf_e_i a_e_a a_e_ksi a_e_g a_e_Ne a_e_i ksi_e_a ksi_e_ksi ksi_e_g ksi_e_Ne ksi_e_i g_e_a g_e_ksi g_e_g g_e_Ne g_e_i infl_e_a infl_e_ksi infl_e_g infl_e_Ne infl_e_i inflstar_e_a inflstar_e_ksi inflstar_e_g inflstar_e_Ne inflstar_e_i ;
