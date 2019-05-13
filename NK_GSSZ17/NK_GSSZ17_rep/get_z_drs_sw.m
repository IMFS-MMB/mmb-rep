function zero = get_z_drs_sw(x_ini)

global alpha beta gam_x theta rho_s gam_h eta rho_A gam_p rho_r rho_y...
       rho_pi varrhobar sig rho_F rho_D Asig Rsig Fsig Dsig zeta eta_w gam_w%#ok<NUSED>
    
z = x_ini(1);
c = x_ini(2);
phi = x_ini(3);

h = ((c+phi)/exp(0.5*alpha*(1+alpha)*sig^2))^(1/alpha);
abar = exp(sig*z-0.5*sig^2);
mu = alpha*abar*(c+phi)/c;
w = alpha/mu*(c+phi)^((alpha-1)/alpha);

zero1 = 1/eta*(1+varrhobar/(1-varrhobar)*(1-normcdf(z))) ...
     - (1-rho_s*beta)/(1-rho_s*beta-beta*theta*(1-eta)*(1-rho_s))...
     *(1+varrhobar/(1-varrhobar)*(1-normcdf(z))...
     -1/mu*(1+varrhobar/(1-varrhobar)*(1-normcdf(z-sig))));

zero2 = - eta_w*zeta*h^gam_h*c^(gam_x*(1-theta)+theta)+(eta_w - 1)*w;
%zero2 = - eta_w*zeta*h^gam_h*c^(gam_x*(1-theta)+theta)+w;
 
%zero2 = w-zeta*h^gam_h*c^(gam_x*(1-theta)+theta);
pii=1;

dc    = (1-gam_p/2*(pii-1)^2)-(c+phi)^(1/alpha)*w/c;
zero3 = dc-0.025;
zero = [zero1;zero2;zero3];
