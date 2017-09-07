function diff=f_KL(XX,params)

%Calculates the steady state capital 
%Output:    diff: difference between the lhs and rhs of the equilibrium
%                   condition (needs to be 0)
%Input:     XX: vector of capital and labor (K,N)
%           params: structure of parameters

%Created by Peter Karadi
%June 2010

K   =   XX(1);
L   =   XX(2);

%Creating variables from the params structure
params_names     =   fieldnames(params);
nn=length(params_names);
for ii=1:nn
    eval([params_names{ii} '=params.' params_names{ii} ';']);
end;
 
%Calculating steady state values
Y   =   K^alfa*L^(1-alfa);
G   =   G_over_Y*Y;
I   =   deltai*K;
C   =   Y-I-G;
Pm  =   (epsilon-1)/epsilon;
R   =   1/betta;
Rk  =   Pm*alfa*Y/K+1-deltai;
RkmR=   Rk-R;

%Calculating the leverages (now only the lower leverages: need to check outcomes with low-high case)
aa     =   lambda*betta*theta*RkmR;
bb     =   -(1-theta)*(lambda-betta*RkmR);
cc     =   (1-theta);
phi    =   (-bb-sqrt(bb^2-4*aa*cc))/(2*aa);

N      =   omega*K/(1-theta*(RkmR*phi+R));

diff(1)     =   chi*L^varphi-(1-betta*hh)*((1-hh)*C)^(-sig)*Pm*(1-alfa)*Y/L;
diff(2)     =   phi*N-K;