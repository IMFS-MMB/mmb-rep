function [Rb_SS,tax_rev_tauw_SS, tax_rev_tauk_SS, cg_SS, y_SS, w_SS, rk_SS, lp_SS]=setparams(xparam0)

global M_

NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for i = 1:NumberOfParameters                                  % Loop...
  paramname = deblank(M_.param_names(i,:));                   %    Get the name of parameter i. 
  eval([ paramname ' = M_.params(' int2str(i) ');']);         %    Get the value of parameter i.
end  
 

tau_k_SS=0.1929;   
tau_w_SS=0.2088;   
R_SS=1.013;       
cgy=0.085;         
tr_o_y=0.105;       
l_SS=1/3;
nbeta=0.9935;       
nalpha=0.36;      
delta=0.025;
theta_p=6;
theta_w=11;


sigma_c=xparam0(1);     
sigma_l=xparam0(2);  
h=xparam0(3);  
gamma_p=xparam0(4);  
gamma_w=xparam0(5);  
nu=xparam0(6);     
sigma_u =xparam0(7);   

rho_R=xparam0(8);  
rho_pi=xparam0(9);  
rho_y=xparam0(10);   

      

rho_eps_i=xparam0(11);  
rho_eps_z=xparam0(12);  
rho_eps_q=xparam0(13);  
rho_tr= xparam0(14);  
rho_cg=xparam0(15);  
rho_P=xparam0(16);  



rho_w=xparam0(17);    
etaWb=xparam0(18);     
etaWy=xparam0(19);  
etaWh=0; 
rho_k=xparam0(20);    
etaKb=xparam0(21);   
etaKy=xparam0(22);  
etaKI=0;

  

    

NumberOfParameters = M_.param_nbr;
        for i = 1:NumberOfParameters
            paramname = deblank(M_.param_names(i,:));
            eval(['M_.params(' int2str(i) ')=' paramname ';']);
        end
        

inf_p_SS=R_SS*nbeta;
mc_SS=(theta_p-1)/theta_p;
rk_SS=(1-nbeta*(1-delta))/(1-tau_k_SS)/nbeta;
w_SS=mc_SS^(1/(1-nalpha))*(1-nalpha)*nalpha^(nalpha/(1-nalpha))*rk_SS^(-nalpha/(1-nalpha));
lk_bar=(1-nalpha)/nalpha*rk_SS/w_SS;
ckbar=(1-cgy)*(mc_SS*lk_bar^(1-nalpha))-delta;
psi_l=(w_SS^(1)*(theta_w-1)/theta_w *(1-h)^(-sigma_c)*(1-tau_w_SS)*(1-nbeta*h) *ckbar^(-sigma_c)*lk_bar^(sigma_c))/l_SS^(sigma_c+sigma_l);
lp_SS=l_SS;
k_SS=lp_SS/lk_bar;
FC= (1-mc_SS)*(k_SS)^nalpha*lp_SS^(1-nalpha);
y_SS=k_SS^nalpha*lp_SS^(1-nalpha)-FC;
c_SS=ckbar*k_SS;
I_SS=delta*k_SS;
cg_SS=y_SS-c_SS-I_SS;
tax_SS=tau_w_SS*w_SS*lp_SS+tau_k_SS*(rk_SS*k_SS+y_SS-rk_SS*k_SS-w_SS*lp_SS);
tr_SS=tr_o_y*y_SS;
b_SS=1/(1-1/nbeta)*(tr_SS+cg_SS-tax_SS);
Rb_SS=1/nbeta;
tax_rev_tauw_SS=tau_w_SS*w_SS*lp_SS;

tax_rev_tauk_SS=tau_k_SS*rk_SS*k_SS;

 


