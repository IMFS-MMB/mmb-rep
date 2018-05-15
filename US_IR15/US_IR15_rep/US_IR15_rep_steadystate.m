function [ys,check] = US_IR15_rep_steadystate(ys,exe)
global M_ 
%% DO NOT CHANGE THIS PART.
%%
%% Here we load the values of the deep parameters in a loop.
%%
NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for ii = 1:NumberOfParameters                                  % Loop...
  paramname = deblank(M_.param_names(ii,:));                   %    Get the name of parameter i. 
  eval([ paramname ' = M_.params(' int2str(ii) ');']);         %    Get the value of parameter i.
  eval([ 'params.' paramname '= M_.params(' int2str(ii) ');']);
end                                                           % End of the loop.  
check = 0;
rhovr=0;
rhovy=0;
rhovtau=0;
rhovpi=0;
delta=[1 0 0 1 0]';
Abar_1=0;
Bprime_1=-delta';
dim=5;%size(X,1);
P0=[0      0             0           1         0     
    1 -(1-rhor)*rhopi -(1-rhor)*rhoy 0 -(1-rhor)*rhov
    0       1             0          0         0     
    0       0             1          0         0     
    0       0             0          0         1     ];
mu0=[(1-rhotau)*tauSS
    (1-rhor)*(grSS-rhoy*gySS)
    (-rhopir*grSS-rhopiy*gySS)
    ((1-rhoyy)*gySS-rhoyr*grSS)
    0];%*(-rhovr*grSS-rhovy*gySS-rhovtau*tauSS)

P1=[0      0             0          rhotau         0 
    rhor   0             0          0              0
    rhopir rhopipi       rhopiy     0              rhopiv
    rhoyr  rhoypi        rhoyy      0              rhoyv
    0      0             0          0              rhovv];

Sigma0=[0           0             0          sigtau           0 
        sigr        0             0          0                0
        0                  sigpi  0          sigpitau*sigtau  0
        0           sigypi*sigpi        sigy sigytau *sigtau  0
        sigvr*sigr  sigvpi*sigpi  sigvy*sigy sigvtau *sigtau  sigv];
    
    
mu    = P0^(-1)*mu0;%[0 0 0 0 0]';%
P     = P0^(-1)*P1;
Sigma = P0^(-1)*Sigma0; 
mu_bar= inv((eye(dim)-P))*mu; 



Lambda=[0 0 0 0 Lambdar
        0 0 0 0 Lambdapi
        0 0 0 0 Lambday
        0 0 0 0 Lambdatau
        0 0 0 0 Lambdav];

switch_print    =   'no';
switches.switch_print    =  switch_print;   
switch switch_print
    case 'details'
        options     =   optimset('Display','iter');
    case 'test'
        options     =   optimset('Display','iter');
    otherwise
        options     =   optimset('Display','off');
end
lambda0 = [ 1  1  1  1  1];
ySS     = [rSS y_4SS y_8SS y_12SS y_16SS y_20SS];
ARG_STR.ySS      =ySS;
ARG_STR.Abar_1   =Abar_1;
ARG_STR.Bprime_1 =Bprime_1;
ARG_STR.Sigma    =Sigma; 
ARG_STR.P        =P;
ARG_STR.mu       =mu;
ARG_STR.Lambda   =Lambda;
ARG_STR.mu_bar   =mu_bar;
%lambda = [0 0 0 0 0];
[lambda,fval,exitf]  =   fsolve(@f_lambda,lambda0,options,ARG_STR); 
%[Abar_n,Bprinme_n]=Abar_n_Bbar_n(Abar_1,Bprime_1,Sigma,mu,lambda,Lambda,(n-1)); 
[~,Bprinme_4]=Abar_n_Bbar_n(Abar_1,Bprime_1,Sigma,P,mu,lambda,Lambda,3);
[~,Bprinme_8]=Abar_n_Bbar_n(Abar_1,Bprime_1,Sigma,P,mu,lambda,Lambda,7);
[~,Bprinme_12]=Abar_n_Bbar_n(Abar_1,Bprime_1,Sigma,P,mu,lambda,Lambda,11);
[~,Bprinme_16]=Abar_n_Bbar_n(Abar_1,Bprime_1,Sigma,P,mu,lambda,Lambda,16);
[~,Bprinme_20]=Abar_n_Bbar_n(Abar_1,Bprime_1,Sigma,P,mu,lambda,Lambda,19);


n=20;P_cum0=eye(size(P,1));P_cum{1}=P_cum0; 
for jj=2:n     
    P_cum{jj}=P_cum{jj-1}+P^(jj-1); 
end

Q = [Bprinme_4-delta'*P_cum{4}/4
     Bprinme_8-delta'*P_cum{8}/8
     Bprinme_12-delta'*P_cum{12}/12
     Bprinme_16-delta'*P_cum{16}/16
     Bprinme_20-delta'*P_cum{20}/20];



%A_n = Abar_n/n; B_n=-Bprinme_n'/n;


%y_n(t) = A_n+B_n'*X;

%q_n(t) = A_n-delta'*(eye(dim)-1/n*(eye(dim)-P^n)*inv((eye(dim)-P)))*mu_bar+(Bprinme_n-1/n*delta'*(eye(dim)-P^n)*inv((eye(dim)-P)))*X(t);
     
U_r  = [1 0 0 1 0]; U_pi = [0 1 0 1 0]; U_y = [0 0 1 0 0];
U    = [U_r;U_pi;U_y;Bprinme_4;Bprinme_8;Bprinme_12;Bprinme_16;Bprinme_20] ;

for jj=1:size(U,1)
    for qq=1:size(U,2)
    ii=strmatch(['U' num2str(jj) num2str(qq)],M_.param_names,'exact');
    M_.params(ii)=U(jj,qq);
    end
end

for jj=1:size(Sigma,1)
    for qq=1:size(Sigma,2)
    ii=strmatch(['S' num2str(jj) num2str(qq)],M_.param_names,'exact');
    M_.params(ii)=Sigma(jj,qq);
    end
end

for jj=1:size(P,1)
    for qq=1:size(P,2)
    ii=strmatch(['P' num2str(jj) num2str(qq)],M_.param_names,'exact');
    M_.params(ii)=P(jj,qq);
    end
end

for jj=1:size(Q,1)
    for qq=1:size(Q,2)
    ii=strmatch(['Q' num2str(jj) num2str(qq)],M_.param_names,'exact');
    M_.params(ii)=Q(jj,qq);
    end
end

g_r = 0;
g_pi = 0;
g_y = 0;
tau = 0;
v = 0;
r = 0; 
pi = 0;
y_4 = 0;
y_8 = 0;
y_12 = 0;
y_16 = 0;
y_20 = 0;
g_y_obs = 0;
P_y_4 = 4*y_4 - r;
P_y_8 = 4*y_8 - r; 
P_y_12 = 4*y_12 - r; 
P_y_16 = 4*y_16 - r; 
P_y_20 = 4*y_20 - r;

y_4_a  =4*y_4;
P_y_4_a=4*P_y_4;
g_pi_a =4*g_pi;
y_8_a  =4*y_8;
P_y_8_a=4*P_y_8; 
r_a    =4*r;
y_12_a =4*y_12;
P_y_12_a=4*P_y_12; 
y_16_a =4*y_16;
P_y_16_a=4*P_y_16; 
y_20_a =4*y_20;
P_y_20_a=4*P_y_20;
output =0;
inflation=0;
M_.PA=[];
for ii=1:size(M_.params,1) 
M_.PA=[M_.PA;[cellstr(M_.param_names(ii,:)) num2str(M_.params(ii,:)) ]];
end 

%%
%% END OF THE MODEL SPECIFIC BLOCK.


%% DO NOT CHANGE THIS PART.
%%
%% Here we define the steady state values of the endogenous variables of
%% the model.
%%
NumberOfEndogenousVariables = M_.orig_endo_nbr;                % Number of endogenous variables.
ys = zeros(NumberOfEndogenousVariables,1);                     % Initialization of ys (steady state).
for ii = 1:NumberOfEndogenousVariables                         % Loop...
  varname = deblank(M_.endo_names(ii,:));                      %    Get the name of endogenous variable i.                     
  eval(['ys(' int2str(ii) ') = ' varname ';']);                %    Get the steady state value of this variable.
end



















