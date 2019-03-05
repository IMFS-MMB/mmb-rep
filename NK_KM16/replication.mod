//**************Public Debt and Changing Inflation Targets**********************

//FLEXIBLE PRICE

var yn $output$,cn,hn,wn,mn,Dn,Dnewn,i_Dn,i_Dnewn,in,Rn,pin,lamdan,mun,taun,Dbs,taun_obs,PIESTARn,Dn_obs,DG, 
y,c,h,w,m,D,Dnew,i_D,i_Dnew,i,R,pi,lamda,mu,tau,PIESTAR,pistar,MC,G,D_obs,tau_obs,i_obs,pi_obs,y_obs,yn_obs,
Disp,Z1,Z2,epsi_R,
c_obs,w_obs,h_obs,Dnew_obs,m_obs,Rrate,mu_obs,i_Dnew_obs,G_obs,i_D_obs;

varexo epsi_D, eta_PIESTAR,eta_r,epsi_G;

parameters sigmac,sigmam,sigmah,theta,epsi,markup, betta,alphaa,rho_tau,phi_tau_D,rho_D,rho_pi,phi, rho_i,
phipi,phiy, rho_r,rho_G,xi;

//***********stractural parameters************
//********************************************

betta=0.99;
theta=0.75 ; //price stickiness phi
sigmac=1.5;
sigmah=2;
sigmam=2.56;
epsi=6;
markup=epsi/(epsi-1);
alphaa=0.0472;//0.0472;
xi=7.1406*10^(-6) ;     // 7.1181*10^(-6);       // 7.1406*10^(-6) ;// 5.2*10^(-6);//7.1406*10^(-6);// 7.1181*10^(-6);the competitive//
phi=35.4634381498;     //35.4635; //9325;      //42.556125;         //35.4635; //2671; //34.82329694;//35.94;//  34.8233;//37.26023087; //35.46122; // 42.556125; competitive //42.553400003;//


//shock persistence 
 
rho_D=0.00; //persistence of a debt shock
rho_pi=0.99; //persistence of the AR(1) inflation target shock 
rho_G=0;//persistence of a govern.spending shock

//tax rule

rho_tau=0.5; //persistence of tax rule
phi_tau_D=0.0037; // 0.035; // response of tax on debt

// Monetary policy shock
rho_i=0.75; //persistence of the interest rate;
phipi=1.5; //response of i on inflation
phiy=0.5; // response of i on y
rho_r=0.01;//persistence of interest rate shock

//*********************************************
//**********Natural Block**********************
//*********************************************

model;
Rn=(1+in)/pin(+1); //gross
wn=1/markup;
yn=hn;
yn-cn-DG;
mn  = (xi*cn^sigmac*(1+in)/in)^(1/sigmam);
1 = betta*(cn(+1)/cn)^(-sigmac)*Rn;
1 = betta*(cn(+1)/cn)^(-sigmac)/pin(+1)*(1+i_Dnewn- mun(+1)*(1-alphaa)*(i_Dnewn(+1)-i_Dnewn));
mun = betta*(cn(+1)/cn)^(-sigmac)/pin(+1)*(1+mun(+1)*(1-alphaa));
lamdan=(cn)^(-sigmac);
phi*hn^sigmah=cn^(-sigmac)*(1-taun)*wn*(1/markup);
//phi*hn^sigmah=cn^(-sigmac)*(1-taun)*wn;
Dn=(1-alphaa)*Dn(-1)/pin + Dnewn + Dbs;
(1-alphaa)*i_Dn(-1)*Dn(-1)/pin + i_Dnewn*Dnewn = i_Dn*Dn; // -i_Dn*Dbs;
taun*wn*hn + mn - mn(-1)/pin + Dnewn = DG + (alphaa+i_Dn(-1))*Dn(-1)/pin ;
taun_obs = rho_tau*(taun_obs(-1)) + phi_tau_D*(Dn_obs);
pin=STEADY_STATE(pin)*exp(PIESTARn/100);
PIESTARn=rho_pi*PIESTARn(-1)+eta_PIESTAR;
Dbs=rho_D*Dbs(-1)+ epsi_D;

100*(log(DG)-log(STEADY_STATE(DG)))=100*(rho_G*(log(DG(-1))-log(STEADY_STATE(DG))))+epsi_G ;

//DG/STEADY_STATE(DG)=((DG(-1)/STEADY_STATE(DG))^rho_G)*exp(epsi_G/100);

//mn=0.07*yn;
//DG=0.2*yn;
//k=(1/phi*(1/markup)*cn^(-sigmac)*(1-taun))^(1/sigmah);

//*****************************************************************
//****************************STICKY MODEL*************************
//*****************************************************************

R=(1+i)/pi(+1);
w=MC;
y=h/Disp;
y-c-G;
m  = (xi*c^sigmac*(1+i)/i)^(1/sigmam);
1 = betta*(c(+1)/c)^(-sigmac)*R;
1 = betta*(c(+1)/c)^(-sigmac)/pi(+1)*(1+i_Dnew- mu(+1)*(1-alphaa)*(i_Dnew(+1)-i_Dnew));
mu = betta*(c(+1)/c)^(-sigmac)/pi(+1)*(1+mu(+1)*(1-alphaa));
lamda=(c)^(-sigmac);
phi*h^sigmah=c^(-sigmac)*(1-tau)*w*(1/markup);
//phi*h^sigmah=c^(-sigmac)*(1-tau)*w;
D=(1-alphaa)*D(-1)/pi + Dnew + Dbs;
(1-alphaa)*i_D(-1)/pi*D(-1) + i_Dnew*Dnew = i_D*D;// -i_D*Dbs;
tau*w*h + m - m(-1)/pi + Dnew = G + (alphaa+i_D(-1))*D(-1)/pi ;
tau_obs= rho_tau*(tau_obs(-1))+ phi_tau_D*(D_obs);

i_obs/4=(1-rho_i)*(PIESTAR+phipi*(pi_obs/4-PIESTAR)+phiy*(y_obs-yn_obs))+rho_i*i_obs(-1)/4-epsi_R;




epsi_R=rho_r*epsi_R(-1)+eta_r;
PIESTAR=rho_pi*PIESTAR(-1)+eta_PIESTAR;
pistar=STEADY_STATE(pistar)*exp(PIESTAR/100);

Z1=lamda*MC*y+theta*betta*(pi(+1)/pistar(+1))^(epsi)*Z1(+1);
Z2=lamda*y+theta*betta*(pi(+1)/pistar(+1))^(epsi-1)*Z2(+1);
1=theta*pistar^(1-epsi)*pi^(epsi-1)+(1-theta)*(epsi/(epsi-1)*Z1/Z2)^(1-epsi);//aggregate price index
Disp=(theta)*Disp(-1)*(pi/pistar)^(epsi)+(1-theta)*(epsi/(epsi-1)*Z1/Z2)^(-epsi);

//G/STEADY_STATE(G)=((G(-1)/STEADY_STATE(G))^rho_G)*exp(epsi_G/100);
100*(log(G)-log(STEADY_STATE(G)))=100*(rho_G*(log(G(-1))-log(STEADY_STATE(G))))+epsi_G ;

//Dbs=rho_D*Dbs(-1)+ epsi_D; ////DEN XREIAZETAI, EINAI STO NATURAL BLOCK
//G=0.2*y;


//**********************observable variables*******************

pi_obs =100*(pi-STEADY_STATE(pi))*4; //100*log(pi/STEADY_STATE(pi))*4;
 
        
i_obs = 100*(i-STEADY_STATE(i))*4;
y_obs = 100*log(y/STEADY_STATE(y));
yn_obs = 100*log(yn/STEADY_STATE(yn));
tau_obs = 100*(tau-STEADY_STATE(tau));
taun_obs = 100*(taun-STEADY_STATE(taun));
D_obs = 100*log(D/STEADY_STATE(D));
Dn_obs = 100*log(Dn/STEADY_STATE(Dn));

c_obs = 100*log(c/STEADY_STATE(c));
w_obs = 100*log(w/STEADY_STATE(w));
h_obs = 100*log(h/STEADY_STATE(h));
Dnew_obs = 100*log(Dnew/STEADY_STATE(Dnew));
 
m_obs = 100*log(m/STEADY_STATE(m));
//PIESTAR4 = PIESTAR*4;
//DI_obs = D_obs + Int_D_obs;
//Tax_obs = Tau_obs+W_obs+H_obs;
Rrate = i_obs - pi_obs(+1); //linearized
mu_obs = 100*log(mu/STEADY_STATE(mu));
i_Dnew_obs=100*(i_Dnew-STEADY_STATE(i_Dnew))*4;
G_obs=100*log(G/STEADY_STATE(G));
i_D_obs=100*(i_D-STEADY_STATE(i_D))*4;

end;

shocks;
var eta_PIESTAR;
stderr 0;//1
var  epsi_D;
stderr 0.107;// 0.107;
var eta_r;
stderr 0; //0.17;
var epsi_G=0;
end;

//***********************STEADY STATE MODEL*********************
//**************************************************************
steady_state_model;

wn=1/markup;
hn=0.33;
yn=hn;
//mn=0.07*yn;
pin=1.005;
Rn=1/betta;
PIESTARn=0;
Dbs=0;
in=Rn*pin-1;
DG=0.2*yn;
cn=yn-DG;
Dn=0.5*yn;
lamdan=(cn)^(-sigmac);
mn=(xi*cn^sigmac*(1+in)/in)^(1/sigmam);
//xi = mn^(sigmam)/(cn^sigmac*(1+in)/in);
mun=betta/pin*(1-betta/pin*(1-alphaa))^(-1);
Dnewn=(1-(1-alphaa)/pin)*Dn;
i_Dnewn=pin/betta-1;
i_Dn=i_Dnewn*Dnewn*((1-(1-alphaa)/pin)*Dn)^(-1);
taun=(DG+(alphaa+i_Dn)*Dn/pin-Dnewn-mn+mn/pin)/(wn*hn);
taun_obs=0;
Dn_obs=0;

//*************************Sticky STEADY STATE******************
w=1/1.2; //1/markup;
h=0.33;
MC=w;
Disp=1;
y=h/Disp;
//m=0.07*y;
pi=1.005;
pistar=pi;
R=1/betta;
PIESTAR=0;
//Dbs=0;
i=R*pi-1;
G=0.2*y;
c=y-G;
D=0.5*y;
lamda=(c)^(-sigmac);
m=(xi*c^sigmac*(1+i)/i)^(1/sigmam);
//xi = mn^(sigmam)/(cn^sigmac*(1+in)/in);
mu=betta/pi*(1-betta/pi*(1-alphaa))^(-1);
Dnew=(1-(1-alphaa)/pi)*D;
i_Dnew=pi/betta-1;
i_D=i_Dnew*Dnew*((1-(1-alphaa)/pi)*D)^(-1);
tau=(G+(alphaa+i_D)*D/pi-Dnew-m+m/pi)/(w*h);
tau_obs=0;
D_obs=0;
pi_obs=0;
i_obs=0;
y_obs=0;
yn_obs=0;
epsi_R=0;
Z1=lamda*MC*y/(1-theta*betta);
Z2=lamda*y/(1-theta*betta);

c_obs=0;
w_obs=0;
h_obs=0;
Dnew_obs=0;
m_obs=0;
Rrate=0;
mu_obs=0;
i_Dnew_obs=0;
G_obs=0;
i_D_obs=0;

end;

steady;

check;






Fig2= 1;

if Fig2 == 1
    
    // Plots figure 2
    steady;
    warning('OFF');
   //stoch_simul(order = 1, irf = 80, noprint,graph)D_obs,Dnew_obs,pi_obs,pi,PIESTAR,pistar,i_obs,y_obs,Rrate,w_obs,tau_obs,G,c_obs,i_Dnew,i_Dnew_obs,i;
    stoch_simul(order = 1, irf = 80, noprint,graph)D_obs,y_obs,pi_obs,i_obs,i_D_obs,i_Dnew_obs;

   /* extension =['Baseline'];
    save_irf;*/
    
    // Tax rule variant
    
   /* Params_list = str2mat('rho_tau','phi_tau_D');
    Params_vals = [0.5;0.035];
    
    nparams = size(Params_list,1)
    pindx = [ ];
    
    for i=1:nparams
        pindx = strmatch(Params_list(i,:),M_.param_names,'exact')
        M_.params(pindx) = Params_vals(i)
    end
    warning('OFF');
    stoch_simul(order = 1, irf = 80, noprint,graph)D_obs,Dnew_obs,pi_obs,i_obs,y_obs,Rrate,w_obs,tau_obs,G_obs,yn;
    // stoch_simul(order = 1, irf = 80, noprint,graph)yn,taun,pin,Rn,wn,i_Dnewn,i_Dn,Dn,Dnewn;
    extension =['Taxes'];
    save_irf; */
end;

//stoch_simul(order = 1, irf = 80) D_obs, tau,tau_obs, pi_obs,w, y,y_obs, i, R;


















