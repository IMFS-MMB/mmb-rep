function diff = f_lambda(lambda0,ARG_STR)
ySS     =ARG_STR.ySS;
Abar_1  =ARG_STR.Abar_1;
Bprime_1=ARG_STR.Bprime_1;
Sigma   =ARG_STR.Sigma;
P       =ARG_STR.P;
mu      =ARG_STR.mu;
Lambda  =ARG_STR.Lambda;
mu_bar  =ARG_STR.mu_bar;
y_1SS =ySS(1);
y_4SS =ySS(2);
y_8SS =ySS(3);
y_12SS=ySS(4);
y_16SS=ySS(5);
y_20SS=ySS(6);
lambda=lambda0;
%Bprime_1=delta'; 
n=20;
for jj=1:n
     [~,Bbar_n{jj}]=Abar_n_Bbar_n(Abar_1,Bprime_1,Sigma,P,mu,lambda,Lambda,(jj-1));

    Z{jj}= Bbar_n{jj}*Sigma*Lambda*mu_bar+Bprime_1*mu_bar-1/2*Bbar_n{jj}*Sigma*(Sigma')*Bbar_n{jj}';

    B{jj} =Bbar_n{jj}*Sigma;
if jj==1
    Z_cum{jj}=0;
    B_cum{jj}=0;
elseif jj==2
    Z_cum{jj-1}=Z{jj-1};
    B_cum{jj-1}=B{jj-1}; 
else
    Z_cum{jj-1}=Z_cum{jj-2}+Z{jj-1};
    B_cum{jj-1}=B_cum{jj-2}+B{jj-1};
end
end
diff(1)= y_4SS -(1/4*(y_1SS+Z_cum{4-1})+1/4*B_cum{4-1}*lambda');
diff(2)= y_8SS -(1/4*(y_1SS+Z_cum{8-1})+1/4*B_cum{8-1}*lambda');
diff(3)= y_12SS-(1/4*(y_1SS+Z_cum{12-1})+1/4*B_cum{12-1}*lambda');
diff(4)= y_16SS-(1/4*(y_1SS+Z_cum{16-1})+1/4*B_cum{16-1}*lambda');
diff(5)= y_20SS-(1/4*(y_1SS+Z_cum{20-1})+1/4*B_cum{20-1}*lambda');  
