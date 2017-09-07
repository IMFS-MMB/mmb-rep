function [ma_m] = SIGEmafive1(N)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This is part of a suite of files that solve sticky-information in      %
%general equilibrium (SIGE) models. It is used and explained in:        %
%Reis, Ricardo (2009a). “A Sticky-Information General-Equilibrium Model %
%  for Policy Analysis.” In: Monetary Policy under Uncertainty and      % 
%  Learning, edited by K. Schmidt-Heubel and C. Walsh, Central Bank of  %
%  Chile: forthcoming, 2009.                                            %
%Reis, Ricardo (2009b). “Optimal Monetary Policy Rules in an Estimated  %
%  Sticky Information Model.” American Economic Journal: Macroeconomics,%
%  forthcoming.     <5                                                    %
%Mankiw, N. Gregory and Ricardo Reis (2007). “Sticky Information in     %
%  General Equilibrium.” Journal of the European Economic Association,  %
%  5 (2-3), 603-613.                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Please cite if you use the programs. I do not provide tech support.    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Last revised: August 30, 2006                                          %
%Written by: Ricardo Reis                                               %
%Input: parameters                                                      %
%Output: solution of the model as coefficients in MA representation     %
%         (inflation output-growth nominal-rate wage-growth hours       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%PARAMETERS %%%%%
beta=2/3;
psi=4;
theta=1;
nu=34.068;
gamma=4.196;
phiy=0.33;
phipi=1.24;
rho_m=0.918;
rho_a=0.350; 
rho_g=0.938;
rho_nu=0.630; 
rho_gam=0.938; 
delta=0.184;
omega=0.195;
lambda=0.702;

xi_a=(1+1/psi)/(1+1/psi+beta/theta-beta);
xi_g=(beta/theta)/(1+1/psi+beta/theta-beta);
xi_gam=(beta/(gamma-1))/(1+1/psi+beta/theta-beta);
xi_nu=(beta/(nu-1))/(1+1/psi+beta/theta-beta);

%%%%STEP 2: MODEL AUXILIARY VARIABLES %%%%%%
DELTA(1,1)=delta; OMEGA(1,1)=omega; LAMBDA(1,1)=lambda;
temp1=theta*DELTA(1,1)*((psi+gamma*(1-OMEGA(1,1)))*((beta+nu*(1-beta))/LAMBDA(1,1)-nu*(1-beta))-beta*psi*OMEGA(1,1));
temp2=(1-beta)*(gamma+psi)*theta*DELTA(1,1)+OMEGA(1,1)*(theta*DELTA(1,1)*(1-gamma*(1-beta))+psi*beta);
PSI(1,1)=temp1/temp2;
UPSILON_a(1,1)=(theta*DELTA(1,1)*(gamma+psi+OMEGA(1,1)*(1-gamma)))/temp2;
UPSILON_g(1,1)=(beta*psi*OMEGA(1,1))/temp2;
UPSILON_nu(1,1)=beta*theta*DELTA(1,1)*(psi+gamma*(1-OMEGA(1,1)))/(temp2*(nu-1));
UPSILON_gam(1,1)=beta*theta*psi*DELTA(1,1)*OMEGA(1,1)/(temp2*(gamma-1));
A(1,1)=1+PSI(1,1)/(theta*DELTA(1,1));
B(1,1)=A(1,1)+phipi+phiy*PSI(1,1);
for i=2:N+2;
    DELTA(i,1)=DELTA(i-1,1)+delta*(1-delta)^(i-1);
    OMEGA(i,1)=OMEGA(i-1,1)+omega*(1-omega)^(i-1);
    LAMBDA(i,1)=LAMBDA(i-1,1)+lambda*(1-lambda)^(i-1);
    temp1=theta*DELTA(i,1)*((psi+gamma*(1-OMEGA(i,1)))*((beta+nu*(1-beta))/LAMBDA(i,1)-nu*(1-beta))-beta*psi*OMEGA(i,1));
    temp2=(1-beta)*(gamma+psi)*theta*DELTA(i,1)+OMEGA(i,1)*(theta*DELTA(i,1)*(1-gamma*(1-beta))+psi*beta);
    PSI(i,1)=temp1/temp2;
    UPSILON_a(i,1)=(theta*DELTA(i,1)*(gamma+psi+OMEGA(i,1)*(1-gamma)))/temp2;
    UPSILON_g(i,1)=(beta*psi*OMEGA(i,1))/temp2;
    UPSILON_nu(i,1)=beta*theta*DELTA(i,1)*(psi+gamma*(1-OMEGA(i,1)))/(temp2*(nu-1));
    UPSILON_gam(i,1)=beta*theta*psi*DELTA(i,1)*OMEGA(i,1)/(temp2*(gamma-1));
end
C_m(1,1)=-1;
C_a(1,1)=phiy*(UPSILON_a(1,1)-xi_a)+UPSILON_a(1,1)/(theta*DELTA(1,1))-(1+rho_a)*UPSILON_a(2,1)/(theta*DELTA(2,1));
C_g(1,1)=(1-UPSILON_g(2,1))*rho_g/(theta*DELTA(2,1))-(1-UPSILON_g(1,1))/(theta*DELTA(1,1))+phiy*(UPSILON_g(1,1)-xi_g);
C_gam(1,1)=(phiy+1/(theta*DELTA(1,1)))*UPSILON_gam(1,1)-phiy*xi_gam-rho_gam*UPSILON_gam(2,1)/(theta*DELTA(2,1));
C_nu(1,1)=(phiy+1/(theta*DELTA(1,1)))*UPSILON_nu(1,1)-phiy*xi_nu-rho_nu*UPSILON_nu(2,1)/(theta*DELTA(2,1));
for i=2:N+1;
    A(i,1)=1+PSI(i,1)/(theta*DELTA(i,1));
    B(i,1)=A(i,1)+phipi+phiy*PSI(i,1);
    C_m(i,1)=-rho_m^(i-1);
    C_a(i,1)=(1/(1-rho_a))*((1-rho_a^i)*(phiy*(UPSILON_a(i,1)-xi_a)+UPSILON_a(i,1)/(theta*DELTA(i,1)))-(1-rho_a^(i+1))*UPSILON_a(i+1,1)/(theta*DELTA(i+1,1)));
    C_g(i,1)=(rho_g^(i-1))*((1-UPSILON_g(i+1,1))*rho_g/(theta*DELTA(i+1,1))-(1-UPSILON_g(i,1))/(theta*DELTA(i,1))+phiy*(UPSILON_g(i,1)-xi_g));
    C_gam(i,1)=(rho_gam^(i-1))*((phiy+1/(theta*DELTA(i,1)))*UPSILON_gam(i,1)-phiy*xi_gam-rho_gam*UPSILON_gam(i+1,1)/(theta*DELTA(i+1,1)));
    C_nu(i,1)=(rho_nu^(i-1))*((phiy+1/(theta*DELTA(i,1)))*UPSILON_nu(i,1)-phiy*xi_nu-rho_nu*UPSILON_nu(i+1,1)/(theta*DELTA(i+1,1)));
end

%%%%STEP 3: PATH FOR PRICES FROM SOLVING DIFF. EQUATION %%%%%%%
%Solve system H*p = b; first build the H matrix
H(1,:)=[-B(1,1) A(2,1) zeros(1,N-1)];
H(2,:)=[phipi -B(2,1) A(3,1) zeros(1,N-2)];
for i=3:N
    H(i,:)=[zeros(1,i-2) phipi -B(i,1) A(i+1,1) zeros(1,N-i)];
end
H(N+1,:)=[zeros(1,N-1) 1 -1];
%monetary shocks
path=H\[C_m(1:N,1); 0];
inflation(1:N+1,1)=path(1:N+1,1)-[0;path(1:N,1)];
output=PSI(1:N+1,1).*path; output(N+2,1)=0; inflation(N+2,1)=0;
for i=1:N+1; 
    nomrate(i,1)=(1/theta)*(output(i+1,1)/DELTA(i+1,1)-output(i,1)/DELTA(i,1)) + inflation(i+1,1);
    realwage(i,1)=(1+nu*(1/beta-1))*(1/LAMBDA(i,1)-1)*path(i,1)+(1-1/beta)*output(i,1);
    hours(i,1)=output(i,1)/beta;
end
%Dy(1:N+1,1)=output(1:N+1,1)-[0;output(1:N,1)];
Dwp(1:N+1,1)=realwage(1:N+1,1)-[0;realwage(1:N,1)];
ma_m=[inflation(1:N+1,1) output(1:N+1,1) nomrate Dwp hours];
clear path inflation output realwage nomrate hours Dy Dwp;
