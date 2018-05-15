function [Abar_n,Bbar_n]=Abar_n_Bbar_n(Abar_1,Bprime_1,Sigma,P,mu,lambda,Lambda,n)
A{1}=-Abar_1;
Bprime{1}=Bprime_1;
if n==0
    i=1;
else
for i=2:n+1  
    A{i}=A{i-1} + Bprime{i-1}*(mu-Sigma*lambda')...
         +1/2*Bprime{i-1}*Sigma*(Sigma')*Bprime{i-1}'; 
    Bprime{i}=Bprime{i-1}*(P-Sigma*Lambda)+Bprime_1;
end
end 
if n==0
Abar_n=A{1};
Bbar_n=Bprime{1};
elseif i>1
Abar_n=-A{i}/(n+1);
Bbar_n=-Bprime{i}/(n+1);
end

