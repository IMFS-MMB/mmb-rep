function [ys,check] = mkup_nr1_ff1_steadystate(ys,exe) 

% steady state file

global M_ alpha beta gam_x theta rho_s gam_h eta rho_A gam_p rho_r rho_y...
       rho_pi varrhobar sig rho_F rho_D Asig Rsig Fsig Dsig zeta eta_w gam_w xi s ...
       c x pt y h pii A D w pS m dt z abar mu v lambda R varrho F ...
       xi_f s_f c_f x_f pt_f y_f h_f pii_f w_f pS_f m_f dt_f z_f abar_f...
       mu_f v_f lambda_f R_f phi pii_w pii_w_f lw; 

alpha       = M_.params(1);    
beta        = M_.params(2);
gam_x       = M_.params(3);
theta       = M_.params(4);
rho_s       = M_.params(5);
gam_h       = M_.params(6);
eta         = M_.params(7);
rho_A       = M_.params(8);
gam_p       = M_.params(9);
rho_r       = M_.params(10);
rho_y       = M_.params(11);
rho_pi      = M_.params(12);
varrhobar   = M_.params(13);
sig         = M_.params(14);
rho_F       = M_.params(15);
rho_D       = M_.params(16);
Asig        = M_.params(17);
Rsig        = M_.params(18);
Fsig        = M_.params(19);
Dsig        = M_.params(20);
zeta        = M_.params(21);
eta_w       = M_.params(22);
gam_w       = M_.params(23);

check       = 0;

options     = optimset('LargeScale','off','display','off',...
            'MaxIter',5000,'MaxFunEvals',5000,'TolX',1e-10,...
            'TolFun',1e-10);
      
% h_ini       = 1;
% w_ini       = 1;
% x_ini       = [h_ini;w_ini];
% sticky stuffs

z_ini       = 0.50;
c_ini       = 0.50;
phi_ini     = 0.50;
x_ini       = [z_ini;c_ini;phi_ini];

% xsol        = fsolve(@get_z_drs,x_ini,options);
% h           = xsol(1);
% w           = xsol(2);

xsol        = fsolve(@get_z_drs_sw,x_ini,options);
z           = xsol(1);
c           = xsol(2);
phi         = xsol(3);
xi          = 1+varrhobar/(1-varrhobar)*(1-normcdf(z));
h           = ((c+phi)/exp(0.5*alpha*(1+alpha)*sig^2))^(1/alpha);
abar        = exp(sig*z-0.5*sig^2);
mu          = alpha*abar*(c+phi)/c;
w           = alpha/mu*(c+phi)^((alpha-1)/alpha);
%c           = exp(0.5*alpha*(1+alpha)*sig^2)*h^alpha-phi;
pii         = 1;
%abar        = 1/w*c/((c+phi)^(1/alpha))*(1-gam_p/2*(pii-1)^2);
pt          = c^theta;
%z           = (log(abar)+0.5*sig^2)/sig;           
%xi          = 1+varrhobar/(1-varrhobar)*(1-normcdf(z));
%mu          = alpha/w*(c+phi)^((alpha-1)/alpha);
y           = c;
s           = c;
x           = c/(s^theta);
A           = 1;
D           = 0;
F           = 1;
pii_w       = 1;
varrho      = varrhobar*F;
dt          = (1-gam_p*(pii-1)^2 - (c+phi)^(1/alpha)*w/(c*A))*c;
pS          = dt*beta/(1-beta);
m           = beta;
R           = 1/beta;
v           = xi/eta;
lambda      = beta*theta*(1-eta)/(1-rho_s*beta)*v;

% flexible stuffs

z_f         = z;
xi_f        = xi;
mu_f        = mu;
h_f         = h;
y_f         = y;
pii_f       = pii;
pii_w_f     = pii_w;
c_f         = c;
abar_f      = abar;
s_f         = s;
pt_f        = pt;
x_f         = x;
w_f         = w;
dt_f        = dt;
pS_f        = pS;
m_f         = m;
R_f         = R;
v_f         = v;
lambda_f    = lambda;
lw          = alpha*exp(0.5*alpha*(1+alpha)*sig^2)*(A*h)^(alpha-1)...
            - zeta*h^gam_h/((x-D)^-gam_x);

ys          = [xi s c x pt y h pii A D w pS m dt z abar mu v lambda...
               R varrho F xi_f s_f c_f x_f pt_f y_f h_f pii_f ...
               w_f pS_f m_f dt_f z_f abar_f mu_f v_f lambda_f R_f ...
               phi pii_w pii_w_f lw]';
