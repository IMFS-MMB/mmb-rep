// model file, A simple model of pricing under financial friction

parameters alpha beta gam_x theta rho_s gam_h eta rho_A gam_p rho_r rho_y 
           rho_pi varrhobar sig rho_F rho_D Asig Rsig Fsig Dsig zeta eta_w gam_w;

var xi s c x pt y h pii A D w pS m dt z abar mu v lambda R varrho F xi_f 
    s_f c_f x_f pt_f y_f h_f pii_f w_f pS_f m_f dt_f z_f abar_f mu_f v_f lambda_f R_f phi pii_w pii_w_f lw; 

varexo eA eR eF eD;

alpha       = 0.85; //drs parameter
beta        = 0.985; //time discount
gam_x       = 1.001; //crra
theta       = -0.75;//relative habit -0.9
rho_s       = 0.95; //habit stock persistence 0.97
gam_h       = 1/5;   //inverse of Frisch elasticity
eta         = 2.00; //elasticity of substitution
rho_A       = 0.900; //persistence of tech shock
gam_p       = 10;   //price adj cost
rho_r       = 0.750; //monetary policy inertia
rho_y       = 0.00;// Taylor rule output coeff
rho_pi      = 2.00; //Taylor rule inflation coeff
varrhobar   = 0.5;  //equity issuance cost
sig         = 0.05; //idiosyncratic vol
rho_F       = 0.900; //persistence of fin shock
rho_D       = 0.900; //persistence of demand shock
Asig        = 0.010; //vol of agg tech shock
Rsig        = 0.006250;// vol of monetary policy shock
Fsig        = 0.250; //vol of fin shock
Dsig        = 0.010/3; // vol of demand shock
zeta        = 1.000; // utility weight on labor disutility
eta_w       = 2.000; // market power of labor
gam_w       = 30; // wage adjustment cost

model;

// sticky stuffs

phi         = steady_state(phi);
xi          = 1+varrho/(1-varrho)*(1-normcdf(z));
s           = rho_s*s(-1)+(1-rho_s)*c; 
x           = c/(s(-1)^theta);
pt          = s(-1)^theta;
y           = exp(0.5*alpha*(1+alpha)*sig^2)*(A*h)^alpha-phi;
c           = y-gam_p/2*(pii-1)^2*c;
//w/pt        = zeta*h^gam_h/((x-D)^-gam_x);
0           = - eta_w*zeta*h^gam_h*h*(x-D)^gam_x*pt+(eta_w - 1)*w*h
              + gam_w*(pii_w-1)*pii_w*w*h-m(+1)*gam_w*(pii_w(+1)-1)*pii_w(+1)*w(+1)*h(+1);
pii_w       = w/w(-1)*pii;
1           = m(+1)*R/pii(+1);
pS          = m(+1)/pii(+1)*(dt(+1)+pS(+1));
m           = beta*((x-D)^-gam_x)/((x(-1)-D(-1))^-gam_x)*(pt(-1))/(pt);
dt          = (1-gam_p*(pii-1)^2 - (c+phi)^(1/alpha)*w/(c*A))*c;
z           = (log(abar)+0.5*sig^2)/sig;
abar        = A/w*c/((c+phi)^(1/alpha))*(1-gam_p/2*(pii-1)^2);
mu          = alpha*A/w*(c+phi)^((alpha-1)/alpha);
v           = xi+(1-rho_s)*lambda
            -(1+varrho/(1-varrho)*(1-normcdf(z-sig)))*1/mu;
lambda      = rho_s*m(+1)*lambda(+1)
            + theta*(1-eta)*m(+1)*v(+1)*c(+1)/s;
1           = eta*v/xi+gam_p*pii*(pii-1)
            - gam_p*xi(+1)/xi*pii(+1)*(pii(+1)-1)*c(+1)/c;
//pii=1;
R           = R(-1)^rho_r*(1/beta*(y/steady_state(y))^rho_y*(pii/pii_f)^rho_pi)^(1-rho_r)*exp(Rsig*eR);
log(A)      = rho_A*log(A(-1))+Asig*eA;
varrho      = varrhobar*F;
log(F)      = rho_F*log(F(-1))+Fsig*eF;
D           = rho_D*D(-1)+Dsig*eD;
lw          = alpha*exp(0.5*alpha*(1+alpha)*sig^2)*(A*h)^(alpha-1)
            - zeta*h^gam_h/((x-D)^-gam_x);

// flexible stuffs

xi_f        = 1+varrho/(1-varrho)*(1-normcdf(z_f));
s_f         = rho_s*s_f(-1)+(1-rho_s)*c_f; 
x_f         = c_f/(s_f(-1)^theta);
pt_f        = s_f(-1)^theta;
y_f         = exp(0.5*alpha*(1+alpha)*sig^2)*(A*h_f)^alpha-phi;
c_f         = y_f-gam_p/2*(pii_f-1)^2*c_f;
0           = - eta_w*zeta*h_f^gam_h*h_f*(x_f-D)^gam_x*pt_f+(eta_w - 1)*w_f*h_f;
pii_w_f     = 1;
//w_f/pt_f    = zeta*h_f^gam_h/((x_f-D)^-gam_x);
1           = m_f(+1)*R_f/pii_f(+1);
pS_f        = m_f(+1)/pii_f(+1)*(dt_f(+1)+pS_f(+1));
m_f         = beta*((x_f-D)^-gam_x)/((x_f(-1)-D(-1))^-gam_x)
            *(pt_f(-1)/pt_f);
dt_f        = (1-gam_p*(pii_f-1)^2 - (c_f+phi)^(1/alpha)*w_f/(c_f*A))*c_f;
z_f         = (log(abar_f)+0.5*sig^2)/sig;
abar_f      = 1/w_f*c_f/((c_f+phi)^(1/alpha))*(1-gam_p/2*(pii_f-1)^2);
mu_f        = alpha*A/w_f*(c_f+phi)^((alpha-1)/alpha);
v_f         = xi_f+(1-rho_s)*lambda_f
            -(1+varrho/(1-varrho)*(1-normcdf(z_f-sig)))*1/mu_f;
lambda_f    = rho_s*m_f(+1)*lambda_f(+1)
            + theta*(1-eta)*m_f(+1)*v_f(+1)*c_f(+1)/s_f;
1           = eta*v_f/xi_f;
pii_f       = 1;

end;

//check;
//steady;

shocks;

var eA = 1;
var eF = 1;
var eD = 1;
var eR = 1;

end;

stoch_simul(order=1,pruning,irf = 20,ar = 4,nograph,noprint,periods=50000);
