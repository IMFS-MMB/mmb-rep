// Endogenous variables 
var  MUL,  MRS,  chi,   w,  q, y, inf_p, mc, u,Rb
    I, c, lp,  rk, R,  k, inf_w, tax,  b, tau_w, tau_k, 
     cg,  eps_i, eps_z, eps_q,tr GDP, tax_rev_tauw, tax_rev_tauk;
   
varexo e_i, e_z, e_q, eps_m, eps_cg, eps_tr, eps_tauk, eps_tauw; 

//PARAMETERS 
parameters nbeta, nalpha, sigma_l, sigma_c, theta_w, theta_p, gamma_w, gamma_p, delta, nu, sigma_u, h,
            rho_R, rho_pi, rho_y, rho_w, rho_k, rho_cg,  rho_eps_i, rho_eps_z,rho_eps_q, rho_tr, 
            cgy, tau_k_SS, tau_w_SS, l_SS, R_SS, tr_o_y, rho_P, rho_L,
            etaWk, etaWb, etaWy, etaWc, etaWh,  etaWw, etaWI, etaWpi,etaWR,
            etaKk, etaKb, etaKy, etaKc, etaKh,  etaKw, etaKI, etaKpi,etaKR;
            
 
tau_k_SS=0.1929;   // average trend of our data to our data 
tau_w_SS=0.2088;   // average trend of our data to our data 
R_SS=1.013;       // average trend of our data 
cgy=0.085;          // to match ca. b/4Y =0.50
tr_o_y=0.105;       //  data 0.11 
l_SS=1/3;
nbeta=0.9935;       // to match average trend of inflation in our data 
nalpha=0.36;      
delta=0.025;  
cg_SS2=0;

          
// other Deep Model Parameter
 
sigma_c=2; 
h=0.5;      
sigma_l=4; 
sigma_u=2;  
nu=4;   

// Calvo Pricing and Wages

gamma_p=0.65;
theta_p=6;
gamma_w=0.65;
theta_w=11;


// Parameter Taylor Rule
rho_R=0.8;   
rho_pi= 2.1; 
rho_y= 0.05;  

// AR(1) Parameter
rho_cg=0.85;   
rho_tr= 0.85;  
rho_eps_i= 0.85;
rho_eps_z= 0.85;
rho_eps_q=0.85 ;
rho_L=0;
rho_P=0;

// Fiscal feedback Rules

rho_w=0.91; 
etaWk=0; 
etaWb=0.2; 
etaWy=0; 
etaWc=0; 
etaWh=0; 
etaWw=0; 
etaWI=0; 
etaWpi=0; 
etaWR=0; 


rho_k=0.95;    
etaKk=0;  
etaKb=0.2;  
etaKy=0; 
etaKc=0; 
etaKh=0; 
etaKw=0; 
etaKI=0; 
etaKpi=0; 
etaKR=0; 
   
model(linear); 
#inf_p_SS=R_SS*nbeta;
#mc_SS=(theta_p-1)/theta_p;
#rk_SS=(1-nbeta*(1-delta))/(1-tau_k_SS)/nbeta;
#w_SS=mc_SS^(1/(1-nalpha))*(1-nalpha)*nalpha^(nalpha/(1-nalpha))*rk_SS^(-nalpha/(1-nalpha));
#lk_bar=(1-nalpha)/nalpha*rk_SS/w_SS;
#ckbar=(1-cgy)*(mc_SS*lk_bar^(1-nalpha))-delta;
#psi_l=(w_SS^(1)*(theta_w-1)/theta_w *(1-h)^(-sigma_c)*(1-tau_w_SS)*(1-nbeta*h) *ckbar^(-sigma_c)*lk_bar^(sigma_c))/l_SS^(sigma_c+sigma_l);
#lp_SS=l_SS;
#k_SS=lp_SS/lk_bar;
#FC= (1-mc_SS)*(k_SS)^nalpha*lp_SS^(1-nalpha);
#y_SS=k_SS^nalpha*lp_SS^(1-nalpha)-FC;
#c_SS=ckbar*k_SS;
#I_SS=delta*k_SS;
#cg_SS=y_SS-c_SS-I_SS;
#tax_SS=tau_w_SS*w_SS*lp_SS+tau_k_SS*(rk_SS*k_SS+y_SS-rk_SS*k_SS-w_SS*lp_SS);
#tr_SS=tr_o_y*y_SS;
#b_SS=1/(1-1/nbeta)*(tr_SS+cg_SS-tax_SS);
// Household

(1-nbeta*h)*chi=eps_q-sigma_c/(1-h)*(c-h*c(-1))-h*nbeta*eps_q(+1)+h*nbeta*sigma_c/(1-h)*(c(+1)-h*c);
0=chi(+1)-chi+R-inf_p(+1);
Rb=R-inf_p(+1);
MRS=MUL-chi;
MUL=sigma_l*lp;
chi+q=chi(+1)+nbeta*((1-tau_k_SS)*rk_SS*rk(+1)-tau_k_SS*rk_SS*tau_k(+1)+(1-delta)*q(+1));
k=(1-delta)*k(-1)+delta*I+delta*eps_i;
I=I(-1)/(1+nbeta)+nbeta/(1+nbeta)*I(+1)+ q/nu/(1+nbeta)+eps_i/nu/(1+nbeta);
sigma_u*u=rk-tau_k_SS/(1-tau_k_SS)*tau_k;

// Staggered Prices & Wages 

inf_w =nbeta*inf_w(+1)+(1-gamma_w)*(1-gamma_w*nbeta)/gamma_w/(1+theta_w*sigma_l)*(MRS-w+ tau_w_SS/(1-tau_w_SS)*tau_w);
inf_w=w-w(-1)+inf_p;
inf_p =nbeta*inf_p(+1)+(1-gamma_p)*(1-gamma_p*nbeta)/gamma_p*(mc);

//Firm

//u+k(-1)=y+(1-nalpha)*(w-rk)+(nalpha-1)*eps_z;
mc+(1-nalpha)*eps_z+nalpha*(u+k(-1))-nalpha*lp=w;

//mc=(1-nalpha)*(w-eps_z)+nalpha*rk;
mc+(1-nalpha)*eps_z+(nalpha-1)*(u+k(-1))+(1-nalpha)*lp=rk;


// Supply & Demand

y_SS*y=k_SS^(nalpha)*lp_SS^(1-nalpha)*(nalpha*u+nalpha*k(-1)+(1-nalpha)*lp+ (1-nalpha)*eps_z);
y_SS*y=c_SS*c+I_SS*I+cg_SS*cg+rk_SS*(1-tau_k_SS)*k_SS*u;

GDP=y-rk_SS*(1-tau_k_SS)*k_SS/y_SS*u;

//Government

b_SS*b-b_SS/nbeta*(R(-1)-inf_p+b(-1))=cg_SS*cg+tr_SS*tr-tax_SS*tax;


tax_SS*tax=tau_w_SS*w_SS*lp_SS*(tau_w+w+lp)+tau_k_SS*rk_SS*k_SS*(tau_k+rk+u+k(-1))+tau_k_SS*(y_SS*y-rk_SS*k_SS*(rk+u+k(-1))-w_SS*lp_SS*(w+lp));

// Policy functions


R = rho_R*R(-1) + (1-rho_R)*(rho_pi*inf_p+rho_y*GDP)+eps_m; 

// Fiscal Policy Rule I
tau_w=  rho_w*tau_w(-1)+(1-rho_w)*(etaWb*b(-1)+etaWy*GDP+etaWh*lp)+eps_tauw;

//  Fiscal Policy Rule II
tau_k=  rho_k*tau_k(-1)+(1-rho_k)*(etaKb*b(-1)+etaKy*GDP+etaKI*I)+eps_tauk;


// Exogenous Variables

cg=rho_cg*cg(-1)+eps_cg;
tr=rho_tr*tr(-1)+eps_tr;
eps_i=rho_eps_i*eps_i(-1)+e_i;
eps_z=rho_eps_z*eps_z(-1)+e_z;
eps_q=rho_eps_q*eps_q(-1)+e_q;

tau_w_SS*w_SS*lp_SS*tax_rev_tauw=tau_w_SS*w_SS*lp_SS*(tau_w+w+lp);

tau_k_SS*rk_SS*k_SS*tax_rev_tauk=tau_k_SS*rk_SS*k_SS*(tau_k+rk+u+k(-1))+tau_k_SS*(y_SS*y-rk_SS*k_SS*(rk+u+k(-1))-w_SS*lp_SS*(w+lp));


end; 
 
shocks; 
var e_i; stderr  2.614/100;
var e_z; stderr 0.684/100;
var eps_m; stderr 0.157/100;
var e_q; stderr 1.797/100;
var eps_cg; stderr 0.01;
var eps_tr; stderr 4.944/100;
var eps_tauk; stderr 0.03175;
var eps_tauw; stderr 0.0152;
end; 



steady;
check;



stoch_simul( irf=300,order = 1, nograph,nomoments, noprint)lp, I, c, y, w, k, tax,Rb, R, b, tau_w, tau_k, tax_rev_tauw, tax_rev_tauk, cg, GDP;

clc;
disp('loading posterior draws recommended model...')
load draws_ext.mat
disp('... done!')

nn=500;
kk=100;
horizon=20;

post_irf_tauk=zeros(kk,5,nn);
post_irf_tauw=zeros(kk,5,nn);
post_irf_cg=zeros(kk,5,nn);
post_SS=zeros(8,nn);

disp('calculating IRFs recommended model...')
for jj=1:nn
[Rb_SS,tax_rev_tauw_SS, tax_rev_tauk_SS, cg_SS, y_SS, w_SS, rk_SS, lp_SS]=setparams2(para_draws(:,jj));
post_SS(:,jj)=[Rb_SS,tax_rev_tauw_SS, tax_rev_tauk_SS, cg_SS, y_SS, w_SS, rk_SS, lp_SS]';

stoch_simul( irf=100,order = 1, nograph,nomoments, noprint)Rb, tax_rev_tauw, tax_rev_tauk, cg, GDP;



post_irf_tauk(:,:,jj)=[Rb_eps_tauk tax_rev_tauw_eps_tauk tax_rev_tauk_eps_tauk cg_eps_tauk GDP_eps_tauk];
post_irf_tauw(:,:,jj)=[Rb_eps_tauw tax_rev_tauw_eps_tauw tax_rev_tauk_eps_tauw cg_eps_tauk GDP_eps_tauw];
post_irf_cg(:,:,jj)=[Rb_eps_cg tax_rev_tauw_eps_cg tax_rev_tauk_eps_cg cg_eps_cg GDP_eps_cg];
end
disp('... done!')
disp('calculating multiplier recommended model...')

multipl_tauw=zeros(horizon,nn);
multipl_tauk=zeros(horizon,nn);
for jj=1:nn
[multipl_tauk(:,jj) multipl_tauw(:,jj)]=compute_fiscal_multiplier(post_SS(:,jj), post_irf_tauk(:,:,jj), post_irf_tauw(:,:,jj),horizon);
end

save('multiplier_ext.mat', 'multipl_tauk', 'multipl_tauw')

disp('... done!')