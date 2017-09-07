// Title: The Financial Accelerator in an Estimated New Keynesian Model
// Authors: Christensen, Ian, and Ali Dib
// Publication: Review of Economic Dynamics 2008 (11), 155-178.
// This file simulates the dynamic response of the model with financial accelerator (FA)
//to specific shocks

// Replication of IRF to monetary policy shock (unit shock)
// Replication of IRF to money demand shock (unit shock)
var lambda c b m e r h w y k a i cost z mu pi q x f n rp;

varexo e_r u_x u_a u_e u_b;

parameters gamma alpha rho_pi rho_y rho_mu delta chi beta phi psi nu 
rho_a rho_e rho_x rho_b c1 m1 r1 h1 cy1 iy1 f1 z1 kn1 pi_ss r_ss xi_ss f_ss z_ss 
lambda_c lambda_m k__y c__y w_h_y h_ss i__y b_ss k__n S;

gamma=0.0598;
alpha=0.3384;
rho_pi=1.4059;
rho_y=0.2947;
rho_mu=0.6532;
delta=0.025;
b_ss=0.062;
chi=0.5882;
beta=0.9928;
eta=1.315;
phi=0.7418;
psi=0.042; // 0 in the NoFa
nu=0.9728;
rho_a=0.7625;
rho_e=0.6156;
rho_x=0.6562;
rho_b=0.7206;
pi_ss=1.0079;
xi_ss=5/6;
k__n=2;

///////////////////////////

S=1.0075; // Note, when replicating reported standard errors, one has to set S=1 to get the reported results.

///////////////////////////

r_ss=pi_ss/beta;
f_ss=(S*r_ss)/pi_ss;
z_ss=f_ss+ delta-1;
lambda_c=(1+b_ss*(pi_ss/(pi_ss-beta))^(gamma-1))^(-1);
lambda_m=lambda_c*b_ss*(pi_ss/(pi_ss-beta))^(gamma);
k__y=alpha*(xi_ss/z_ss);
c__y=1-delta*(k__y);
w_h_y=(1-alpha)*lambda_c*xi_ss/(c__y);
h_ss=w_h_y/(eta+w_h_y);
i__y=1-c__y;

model(linear); 
((1-gamma)*lambda_c-1)*c=gamma*lambda+lambda_m*((r_ss-1)/r_ss)*(b+(gamma-1)*m)-gamma*e; 

(gamma*r)/(r_ss-1)=b+c-m; 

h_ss*h=(1-h_ss)*(w+lambda);

lambda(+1)=lambda-r+pi(+1);

y=alpha*k(-1)+(1-alpha)*h+(1-alpha)*a;

y=c__y*c+i__y*i;

w=y+cost-h;

z=y+cost-k(-1);

mu=m-m(-1)+pi; 

r=rho_pi*pi+rho_mu*mu+rho_y*y+e_r;

f=(z_ss/f_ss)*z+(1-delta)/f_ss*q-q(-1);             

q=chi*(i-k(-1))-x;//q=chi*delta*(i-k(-1))-x;  

pi=beta*pi(+1)+((1-beta*phi)*(1-phi)/phi)*cost;

k=delta*i+delta*x+(1-delta)*k(-1); 

f(+1)=r-pi(+1)+psi*(q+k-n);

rp=psi*(q+k-n);
n/(nu*f_ss)=k__n*((z_ss/f_ss)*z+(1-delta)/f_ss*q-q(-1))-(k__n-1)*(r(-1)-pi)-psi*(k__n-1)*(k(-1)+q(-1))+(psi*(k__n-1)+1)*n(-1); 
x=rho_x*x(-1)+u_x;
a=rho_a*a(-1)+u_a;
e=rho_e*e(-1)+u_e;
b=rho_b*b(-1)+u_b;

end; 




// Caution: Standard errors are set equal to 1, in order to replicate IRFs. The correct standard errors are commented out.
shocks;
var e_r ; stderr 1; //0.0058 ;
var u_e ; stderr 1; //0.0073 ;
var  u_b ; stderr 1; //0.0103 ;
var  u_a ; stderr 1; //0.0096 ;
var  u_x ; stderr 1; //0.0331 ;

end;

//check;
//stoch_simul(dr_algo=1,ar=10,irf=10,periods=50000)y i c h r pi q n rp m;
//stoch_simul(ar=10,irf=10)y y_f gap c i m r pi;
stoch_simul(irf=10, noprint, nograph)y i h r;
// ar order of autocorrelation coefficients to compute and to print