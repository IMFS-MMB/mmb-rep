%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This code computes the final steady state

clear all;  
close all;
clc;
%% Settings
T=120;         % in T periods emissions go to 0
G=301;         % additional periods of simulation after T
GQE=1.5;       % final increase in reserves

FAST=0;        % if 1, the tax increase is faster in the first years
QE=0;          % if 0, the central bank only buys green bonds, if 1 the central bank buys both types of bonds, if 2 the the central bank buys green and sells brown
DUR=T;         % number of quarters after which CB stops to buy green bonds
INCR=0;        % specify if the Green QE is increasing over time
PATH=1;        % specify which saving_path you want to run. For the BASELINE Exercise:
               % 0: no Green QE, DUR=T
               % 1: DUR T, INCR 1: gradual permanent increase (GQE1)
               % 2: DUR 2, INCR 1: one shot permanent increase (GQE2)
               % 3: DUR T, INCR 0: transitory increase (GQE3)
               % 4: Robustness exercise
               % 5: robustness exercises (saving_path0b)
               % 6: bond functions (saving_path0c)
               % 7: don't run saving_path
mu=1;
%% 
load par_trans
 

%% Steady State
options = optimoptions('fsolve','MaxFunEvals',300000,'MaxIter',30000,'TolFun',1e-15);

rr=theta/betta;               
r=piss*theta/betta;             
tau=nuM/nuE*mu^(chi);
pI=(epsilon-1)/epsilon;       

load x1
x1=x1+0.0001;
[x,FF,Fval] = fsolve(@(xx) find_steady_clean(xx,alfa,phi,theta,delta,csi,pI,g,zeta,chi,dC,re_start,bCG_start,nuM,kappaG,kappaB,betta,nuG,nuB,nuE,tau,mu,varsig),x1,options);
y=real(x(1));
pB=real(x(2));
rG=real(x(3));
rB=real(x(4));

if csi==1
pG=((1-zeta)^(1-zeta)*zeta^(zeta)*pI*(pB)^(-zeta))^(1/(1-zeta));
else
pG=(1/(1-zeta)*(pI^(1-csi)-zeta*(pB)^(1-csi)))^(1/(1-csi));
end
rkG=rG-(1-delta);             
rkB=rB-(1-delta);  
yB=zeta*((pB/pI)^(-csi)*y);
yG=(1-zeta)*(pG/pI)^(-csi)*y;   
kG=alfa*theta*pG*yG/(rkG);
pBnet=pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi);
kB=alfa*theta*pBnet*yB/(rkB);                       
hB=(yB/((kB/theta)^(alfa)))^(1/(1-alfa));
hG=(yG/((kG/theta)^(alfa)))^(1/(1-alfa));
k=kG+kB;
i=(1-(1-delta)/theta)*k;                           
w=(1-alfa)*pG*yG/hG;
h=hB+hG;
bCB=re_start-dC-bCG_start;
bHG=kG-bCG_start;
bHB=kB-bCB;
c=y-i-g-nuM/(1+chi)*mu^(1+chi)*yB;  
e=(1-mu)*nuE*yB; 
X=(e+erow)/(1-(1-deltax)/theta);                                     

ABC_Y=(nuM/(1+chi)*mu^(1+chi)*yB)/y;

tau_clean=tau;
y_clean=y;
pB_clean=pB;
rG_clean=rG;
rB_clean=rB;
mu_clean=mu;
e_clean=e;


if Fval>-1           
x1=[y,pB,rG,rB];
save x1 x1
end


%% Build tax process

if FAST==0
step=(tau_clean-tau_start)/(T-1); % per-period increase
tt=zeros(T+G,1);
tt(1)=tau_start;

for j=2:1:T
    tt(j)=tt(j-1)+step;
end

tt(T+1:T+G)=ones(G,1)*tau_clean;
else
S=tau_clean-tau_start;

step_step=2*(S)/((T-2)*(T-1));

step=zeros(T-1,1);
step(T-1)=0;

for j=2:1:T-1
    step(T-j)=step(T-j+1)+step_step;
end


tt=zeros(T+G,1);
tt(1)=tau_start;

for j=2:1:T
    tt(j)=tt(j-1)+step(j-1);
end

tt(T+1:T+G)=ones(G,1)*tau_clean;
end

%% Build the vector of Green QE
% Green QE increases over time (GQE1)
rre=zeros(T+G,1);        % vectors of reserves

if INCR==1 && QE==0      % GQE is permanent, central bank buys only green bonds

re_end=re_start*GQE;
step_re=(re_end-re_start)/(DUR-1); % single steps
rre(1)=re_start;
rre(DUR+1:end)=re_end;
for j=2:1:DUR
    rre(j)=rre(j-1)+step_re;
end
bbGG=rre-dC-bCB_start;
% Green QE decreases (GQE3)

elseif INCR==0 && QE==0  

re_end=re_start;        % GQE is transitory, central bank buys only green bonds
re_new_start=re_start*GQE;
step_re=(re_end-re_new_start)/(DUR-1); % single steps
rre(1)=re_new_start;
rre(DUR+1:end)=re_end;
for j=2:1:DUR
    rre(j)=rre(j-1)+step_re;
end
bbGG=rre-dC-bCB_start;

elseif INCR==1 && QE==1 % GQE is permanent, central bank buys green and brown bonds

re_end=re_start*GQE;
step_re=(re_end-re_start)/(DUR-1); % single steps
rre(1)=re_start;
rre(DUR+1:end)=re_end;
for j=2:1:DUR
    rre(j)=rre(j-1)+step_re;
end
bbGG=bCG_start+kGshare*(rre-re_start);

elseif INCR==0 && QE==1 % GQE is permanent, central bank buys green and brown bonds

re_end=re_start;
re_new_start=re_start*GQE;
step_re=(re_end-re_new_start)/(DUR-1); % single steps
rre(1)=re_new_start;
rre(DUR+1:end)=re_end;
for j=2:1:DUR
    rre(j)=rre(j-1)+step_re;
end
bbGG=bCG_start+kGshare*(rre-re_start);

elseif QE==2          % GQE is permanent, central bank buys green and sells brown
 
rre=ones(T+G,1)*re_start;
re_end=re_start;
bbGG=[bCG_start; ones(T+G-1,1)*(bCG_start+bCB_start)];
end

bCG_end=bbGG(end);

%% Save parameters
save par_clean y_clean pB_clean rG_clean rB_clean tt rre re_end re_start mu_clean e_clean bCG_end bbGG


if PATH==0
    saving_path_0
elseif PATH==1
    saving_path_1
elseif PATH==2
    saving_path_2
elseif PATH==3
    saving_path_3
elseif PATH==4
    saving_path_4
elseif PATH==5
    saving_path_0b
 elseif PATH==6
 saving_path_0c
end



