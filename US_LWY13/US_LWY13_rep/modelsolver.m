function [G,C0,M,fmat,fwt,ywt,gev,eu] = modelsolver(param,nvar,nexog,nforerrors)
% Minimizes the negative of the log posterior distribution.
% INPUT:
% param: N x 1 vector of initial values for parameters
nvar=43;
nexog=10;
nforerrors = 9;

%----------------------------------
% Set Parameters
%----------------------------------

pnames = { 	'alph  '   	% 
            'bet   '    % 
            'gamm  '  	% 1
            'kappa  '   % 2
            'omegaw'    % 3    
            'omegap'    % 4
            'etaw'      % 
            'etap'      % 
            'mu'        %  
            'phipi'     % 5
            'phiy'      % 6
            'sg'        %
            'sb'        %
            'taul'		%
            'tauk'      %
            'tauc'      %
            'theta'     % 7
            'gpsi'      % 8
            's'         % 9 
            'chiw'      %10
            'chip'      %11
            'delt'      %
            'rhoa'		%12
            'rhob'      %13
            'rhor'      %14
            'rhoi'      %15
            'rhow'      %16
            'rhop'      %17
            'rhog'		%18
            'rhotk'     %19
            'rhotl'     %20
            'rhoz'      %21
            'gammg'	    %22
            'gammtk'	%23
            'gammtl'    %24
            'gammz'     %25
            'psitk'     %26
            'psitl'     %27
            'psigc'     %
            'psiz'      %
            'siga'      %28    
            'sigb'      %29
            'sigm'      %30
            'sigi'      %31
            'sigw'      %32
            'sigp'      %33
            'sigg'      %34
            'sigtk'     %35
            'sigtl'     %36
            'sigz'      %37
            'phipid'    %38
            'phiyd'     %39
            'phia'      %40
};      

parameter = [  0.36             %    alph: capital share
            0.99                %    bet: time preference
            param(1,1)       	% 1. gamm: curvature over consumption
            param(1,2)          % 2. kappa: curvature over leisure
            param(1,3)          % 3. omegaw: prob that union cannot reset optimal wage .7
            param(1,4)          % 4. omegap: prob that intermediat firms cannot reset optimal price .66 
            8                   %    etaw: elasticity of substitution b/w labor talents
            8                   %    etap: elasticity of substitution b/w intermediate goods
            0%.35                 %    mu: share of Ricardian agents
            param(1,5)          % 6. phipi: Taylor rule inflation coefficient
            param(1,6)          % 7. phiY: Taylor rule output coefficient
            0.171%.0698+.00395 % 12.sg:  
            .3952*4             %    sb 
            0.236               %    taul 
            0.360               %    tauk 
            0%.0149             %    tauc 
           param(1,7)           % 7. theta: habit formation parameter
           param(1,8)           % 8. gpsi: K utilization cost parameter; 1: no K utilization
           param(1,9)           % 9. s: s" in the investment adjustment cost function
           param(1,10)          % 10.chiw
           param(1,11)          % 11.chip: the percent of intermediate firms' price adjustment when they cannot optimize 
           0.025                %    delt: k depreciation
           param(1,12)          % 12.rhoa: serial correlation on A 
           param(1,13)          % 13.rhob: serial correlation on cons. preference (ub)
           param(1,14)          % 14.rhor: serial correlation on interest rate in Taylor rule
           param(1,15)          % 15.rhoi: serial correlation on ui
           param(1,16)          % 16.rhow: serial correlation on uw
           param(1,17)          % 17.rhop: serial correlation on up
           param(1,18)          % 18.rhog: serial correlation on GC
           param(1,19)          % 19.rhotk: serial correlation on tauk
           param(1,20)          % 20.rhotl: serial correlation on taul
           param(1,21)          % 21.rhoz: serial correlation on transfers
           param(1,22)          % 22.gammg: response of G to debt; 
           0                    % 23.gammtk: response of capital tax revenue to debt; 
           0                    % 24.gammtl: response of labor tax revenue to debt
           param(1,23)          % 25.gammz: response of transfers to debt
           0                    % 27.psitk
           0                    % 28.psitl
           0                    % 44.psigc: GC response to output, BP value
           0                    % 45.psiz: tr response to output
           param(1,24)          % 46.sigma
           param(1,25)          % 47.c sigma (ub)
           param(1,26)          % 48.m sigma
           param(1,27)          % 49.i sigma
           param(1,28)          % 50.w sigma
           param(1,29)          % 51.p sigma
           param(1,30)          % 52.g sigma
           param(1,31)          % 54.tk sigma
           param(1,32)          % 55.tl sigma
           param(1,33)          % 57.z sigma
           
           0                    % 58.phipid
           param(1,34)          % 59.phiyd
           0                    % 60.phia
                   ];
            
for j = 1:length(parameter)
    eval([char(pnames(j,:)) '=parameter(j);']);
end

%Solve for the steady state

R = 1/bet;
rk = (1 - bet*(1 - delt))/(bet*(1 - tauk)*(1+tauc));
psi1 = rk*(1-tauk);

X(1) = 1;  %w
X(2) = 5;  %k/y
X(3) = 1;  %l/y
X(4) = .7; %c/y
X(5) = 1;  %y 
X(6) = 0.4;
X(7) = 0.7;
X(8) = 0.7;

%Solve w, k/y, l/y, c/y, y jointly
options = optimset('Display','off','MaxIter',10000,'TolFun',1e-10);
[X,fval,exitflag] = fsolve(@ssNLEst,X,options,parameter,rk,R);
w = X(1);
ky = X(2);
ly = X(3);
cy = X(4);
y = X(5);
str = X(6);
cry = X(7);
cnry = X(8);

cr = cry*y;
cnr = cnry*y;
k = ky*y;
iv = delt*k;
l = ly*y;
c = cy*y;
z = str*y;
b = sb*y;
g = sg*y;
lambr = ((1-theta)^(-gamm))*(cr^(-gamm));
lambnr = (cnr^(-gamm));

% Load variables
variables

g0 = zeros(nvar,nvar);
g1 = g0;
CC = zeros(nvar,1);
Psi = zeros(nvar,nvar);
Pie = zeros(nvar,nforerrors);
%-------------------------------------------------------------------------------
%   (1)
%   real interest rate (FOC B)
%-------------------------------------------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ncr) = 1;
eq1(Ncr) = theta/(1+theta);
eq0(Nxcr) = -1/(1+theta);
eq0(NR) = (1-theta)/(gamm*(1+theta));
eq0(Nxpi) = -(1-theta)/(gamm*(1+theta));
eq0(Nub) = -(1-theta)/(gamm*(1+theta));
eq0(Nxub) = (1-theta)/(gamm*(1+theta));
g0(1,:) = eq0;
g1(1,:) = eq1;
Psi(1,:) = eq0ex;
%-------------------------------------------------------------------------------
%   (2)
%   investment (FOC I)
%-------------------------------------------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ni) = 1;%(1+bet)*s;
eq1(Ni) = 1/(1+bet);%s;
eq0(Nxi) = -bet/(1+bet);%-bet*s;
eq0(Nq) = -1/((1+bet)*s);%-1;
eq0(Nxui) = -bet;%-bet*s;
eq0(Nui) = 1;%s; normalized
g0(2,:) = eq0;
g1(2,:) = eq1;
Psi(2,:) = eq0ex;
%--------------------------------------------
%(3)	Q equation
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nq) = 1;
%eq0(Ntauc) = -tauc/(1+tauc);
eq0(NR) = 1;
eq0(Nxpi) = -1;
eq0(Nxq) = -bet*(1-delt);
eq0(Nxrk) = -bet*rk*(1-tauk)*(1+tauc);
eq0(Nxtk) = tauk*bet*rk*(1+tauc);
%eq0(Nxtc) = bet*tauc*(1-delt)/(1+tauc);
g0(3,:) = eq0;
g1(3,:) = eq1;
Psi(3,:) = eq0ex;
%--------------------------------------------
%(4)	Capital Accumulation Equation
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nk) = 1;
eq1(Nk) = 1-delt;
%eq0(Nv) = psi1;
eq0(Ni) = -delt;
g0(4,:) = eq0;
g1(4,:) = eq1;
Psi(4,:) = eq0ex;
%--------------------------------------------
%(5)	Phillips Equation
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
% eq0(Nppi) = 1;
% eq0(Nxppi) = -bet/(1 + bet*chip);
% eq1(Nppi) = chip/(1 + bet*chip);

eq0(Npi) = 1;
eq0(Nxpi) = -bet/(1 + bet*chip);
eq1(Npi) = chip/(1 + bet*chip);
eq0(Nrk) = -alph*(1/(1 + bet*chip))*(1-bet*omegap)*(1-omegap)*(1/omegap);
eq0(Nw) = -(1-alph)*(1/(1 + bet*chip))*(1-bet*omegap)*(1-omegap)*(1/omegap);
eq0(Nua) = (1/(1 + bet*chip))*(1-bet*omegap)*(1-omegap)*(1/omegap);
%eq1(Nkg) = -(1/(1 + bet*chip))*(1-bet*omegap)*(1-omegap)*(1/omegap)*(alphg);
%eq0(Ntauc) = -(tauc/(1+tauc))*(1/(1 + bet*chip))*(1-bet*omegap)*(1-omegap)*(1/omegap);
eq0(Nup) = -1;
g0(5,:) = eq0;
g1(5,:) = eq1;
Psi(5,:) = eq0ex;
%--------------------------------------------
%(6)	Wage Equation (L supply equation)
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nw) = 1 + (1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa));
eq0(Nxw) = -bet/(1+bet);
eq1(Nw) = 1/(1+bet);
eq0(Nxpi) = -bet/(1+bet);
eq0(Npi) = (1 + bet*chiw)/(1 + bet);
eq1(Npi) = chiw/(1 + bet);
eq0(Nl) = -kappa*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa));
eq0(Ncr) = -(gamm/(1-theta))*(((1-mu)*lambr)/((1-mu)*lambr + mu*lambnr))*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa));
eq1(Ncr) = -((gamm*theta)/(1-theta))*(((1-mu)*lambr)/((1-mu)*lambr + mu*lambnr))*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa));
eq0(Ncnr) = -gamm*((mu*lambnr)/((1-mu)*lambr + mu*lambnr))*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa));
eq0(Ntaul) = -(taul/(1-taul))*(1/(1 + bet))*(1 - bet*omegaw)*(1-omegaw)*(1/omegaw)*(1/(1 + etaw*kappa));
eq0(Nuw) = -1;
g0(6,:) = eq0;
g1(6,:) = eq1;
Psi(6,:) = eq0ex;
%--------------------------------------------
%(7)	Capital Demand Equation
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nkbar) = 1;
eq0(Ny) = -1;
eq0(Nw) = -(1-alph);
eq0(Nrk) = (1-alph);
eq0(Nua) = 1;
g0(7,:) = eq0;
g1(7,:) = eq1;
Psi(7,:) = eq0ex;
%--------------------------------------------
%(8)	Production Function
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ny) = 1;
eq0(Nua) = -1;
eq0(Nkbar) = -alph;
eq0(Nl) = -(1-alph);
g0(8,:) = eq0;
g1(8,:) = eq1;
Psi(8,:) = eq0ex;
%--------------------------------------------
%(9)	Taylor Rule
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(NR) = 1;
eq1(NR) = rhor;
eq0(Npi) = -(1-rhor)*phipi - phipid;
eq0(Ny) = -(1-rhor)*phiy - phiyd;

eq1(Npi) = -phipid;
eq1(Ny) = -phiyd;
eq0(Nua) = phia;  %capture the effect on potential output.

eq0(Num) = -1;
g0(9,:) = eq0;
g1(9,:) = eq1;
Psi(9,:) = eq0ex;
%--------------------------------------------
%(10)	Consumption Aggregation
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nc) = c;
eq0(Ncr) = -(1-mu)*cr;
eq0(Ncnr) = -mu*cnr;
g0(10,:) = eq0;
g1(10,:) = eq1;
Psi(10,:) = eq0ex;
%--------------------------------------------
%(11)	Non-Ricardian Household's Budget
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ncnr) = cnr;
eq0(Nw) = -w*l*(1-taul);
eq0(Nl) = -w*l*(1-taul);
eq0(Ntaul) = w*l*taul;
eq0(Nz) = -z;
g0(11,:) = eq0;
g1(11,:) = eq1;
Psi(11,:) = eq0ex;
% %--------------------------------------------
% %(12)	Producer Inflation Defined
% %--------------------------------------------
% eq0 = zeros(1,nvar);
% eq1 = eq0;
% eq0ex = zeros(1,nvar);
% eq0(Npi) = 1;
% eq0(Nppi) = -1;
% eq0(Ntauc) = -tauc/(1+tauc);
% eq1(Ntauc) = -tauc/(1+tauc);
% g0(12,:) = eq0;
% g1(12,:) = eq1;
% Psi(12,:) = eq0ex;
%--------------------------------------------
%(12)	sb Defined
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nsb) = 1;
eq0(Ny) = 1;
eq0(Nb) = -1;
g0(12,:) = eq0;
g1(12,:) = eq1;
Psi(12,:) = eq0ex;
%--------------------------------------------
%(13)	Aggregate Resouce Constraint
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ny) = 1;
eq0(Nc) = -cy;
eq0(Ni) = -delt*ky;
eq0(Ng) = -sg;
eq0(Nv) = -psi1*ky;

g0(13,:) = eq0;
g1(13,:) = eq1;
Psi(13,:) = eq0ex;
%--------------------------------------------
%(14)	Government Budget Constraint
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nb) = sb;
eq0(Ng) = -sg;
eq0(Ntauk) = tauk*rk*ky;
eq0(Nrk) = tauk*rk*ky;
eq0(Nv) = tauk*rk*ky;
eq0(Ntaul) = taul*w*ly;
eq0(Nw) = taul*w*ly;
eq0(Nl) = taul*w*ly;
%eq0(Nc) = (tauc*cy)/(1+tauc);
%eq0(Ntauc) = (tauc*cy)/((1+tauc)^2);
eq0(Nz) = -str;
eq0(Npi) = R*sb; 
eq1(NR) = R*sb;
eq1(Nb) = R*sb;
eq1(Nk) = -tauk*rk*ky;
g0(14,:) = eq0;
g1(14,:) = eq1;
Psi(14,:) = eq0ex; 
%--------------------------------------------
%(15)    g Rule
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ng) = 1;
eq1(Nsb) = -(1-rhog)*gammg;
eq1(Ng) = rhog;
eq0(Nug) = -1;
g0(15,:) = eq0;
g1(15,:) = eq1;
Psi(15,:) = eq0ex;
%--------------------------------------------
%(16)    Capital Tax Rate Rule
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ntauk) = 1;
eq0(Ny) = -(1-rhotk)*psitk;
eq1(Nsb) = (1-rhotk)*gammtk;
eq1(Ntauk) = rhotk;
eq0(Nutk) = -1;
%eq0(Nutl) = -phikl;
g0(16,:) = eq0;
g1(16,:) = eq1;
Psi(16,:) = eq0ex;
%--------------------------------------------
%(17)    Labor Tax Rate Rule
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ntaul) = 1;
eq0(Ny) = -(1-rhotl)*psitl;
eq1(Nsb) = (1-rhotl)*gammtl;
eq1(Ntaul) = rhotl;
eq0(Nutl) = -1;
%eq0(Nutk) = -phikl;
g0(17,:) = eq0;
g1(17,:) = eq1;
Psi(17,:) = eq0ex;
% %--------------------------------------------
% %(19)    Consumption Tax Rate Rule
% %--------------------------------------------
% eq0 = zeros(1,nvar);
% eq1 = eq0;
% eq0ex = zeros(1,nvar);
% eq0(Ntauc) = 1;
% eq1(Ntauc) = rhotc;
% eq0(Nutc) = -1;
% g0(19,:) = eq0;
% g1(19,:) = eq1;
% Psi(19,:) = eq0ex;
%--------------------------------------------
%(18)    Z Rule
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nz) = 1;
eq0(Ny) = (1-rhoz)*psiz;
eq1(Nsb) = -(1-rhoz)*gammz;
eq1(Nz) = rhoz;
eq0(Nuz) = -1;
g0(18,:) = eq0;
g1(18,:) = eq1;
Psi(18,:) = eq0ex;
%--------------------------------------------
%(19)	v equation
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nv) = gpsi/(1-gpsi);
eq0(Nrk) = -1;
eq0(Ntauk) = tauk/(1-tauk);
%eq0(Nq) = 1;
%eq0(Ntauc) = -tauc/(1+tauc);
g0(19,:) = eq0;
g1(19,:) = eq1;
Psi(19,:) = eq0ex;
%--------------------------------------------
%(20)	kbar, effective unit of capital
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nkbar) = 1;
eq1(Nk) = 1;
eq0(Nv) = -1;
g0(20,:) = eq0;
g1(20,:) = eq1;
Psi(20,:) = eq0ex;
%--------------------------------------------
%(21)	Define Xpi
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Npi) = 1;
eq1(Nxpi) = 1;
g0(21,:) = eq0;
g1(21,:) = eq1;
Psi(21,:) = eq0ex;
Pie(21,1) = 1;
%--------------------------------------------
%(22)	Define Xw
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nw) = 1;
eq1(Nxw) = 1;
g0(22,:) = eq0;
g1(22,:) = eq1;
Psi(22,:) = eq0ex;
Pie(22,2) = 1;
%--------------------------------------------
%(23)	Define Xq
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nq) = 1;
eq1(Nxq) = 1;
g0(23,:) = eq0;
g1(23,:) = eq1;
Psi(23,:) = eq0ex;
Pie(23,3) = 1;
%--------------------------------------------
%(24)	Define Xrk
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nrk) = 1;
eq1(Nxrk) = 1;
g0(24,:) = eq0;
g1(24,:) = eq1;
Psi(24,:) = eq0ex;
Pie(24,4) = 1;
%--------------------------------------------
%(25)	Define Xui
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nui) = 1;
eq1(Nxui) = 1;
g0(25,:) = eq0;
g1(25,:) = eq1;
Psi(25,:) = eq0ex;
Pie(25,5) = 1;
%--------------------------------------------
%(26)	Define XI
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ni) = 1;
eq1(Nxi) = 1;
g0(26,:) = eq0;
g1(26,:) = eq1;
Psi(26,:) = eq0ex;
Pie(26,6) = 1;
%--------------------------------------------
%(27)	Define XCR
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ncr) = 1;
eq1(Nxcr) = 1;
g0(27,:) = eq0;
g1(27,:) = eq1;
Psi(27,:) = eq0ex;
Pie(27,7) = 1;
%--------------------------------------------
%(28)	Define Xub
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nub) = 1;
eq1(Nxub) = 1;
g0(28,:) = eq0;
g1(28,:) = eq1;
Psi(28,:) = eq0ex;
Pie(28,8) = 1;
%--------------------------------------------
%(29)	Define Xtk
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Ntauk) = 1;
eq1(Nxtk) = 1;
g0(29,:) = eq0;
g1(29,:) = eq1;
Psi(29,:) = eq0ex;
Pie(29,9) = 1;
%--------------------------------------------
%(30)	Fisher Equation: real interest rate checking
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nr) = 1;
eq0(NR) = -1;
eq0(Nxpi) = 1;
g0(30,:) = eq0;
g1(30,:) = eq1;
Psi(30,:) = eq0ex;
%--------------------------------------------
%(31)	real mc
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nmc) = 1;
eq0(Nw) = -(1-alph);
eq0(Nrk) = -alph;
eq0(Nua) = 1;
%eq1(Nkg) = -alphg;
g0(31,:) = eq0;
g1(31,:) = eq1;
Psi(31,:) = eq0ex;
%--------------------------------------------
%(32)	Capital Tax Revenue
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(NTk) = 1;
eq0(Ntauk) = -1;
eq0(Nrk) = -1;
eq0(Nkbar) = -1;
g0(32,:) = eq0;
g1(32,:) = eq1;
Psi(32,:) = eq0ex;
%--------------------------------------------
%(33)	Labor Tax Revenue
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(NTl) = 1;
eq0(Ntaul) = -1;
eq0(Nw) = -1;
eq0(Nl) = -1;
g0(33,:) = eq0;
g1(33,:) = eq1;
Psi(33,:) = eq0ex;
%--------------------------------------------
%(34)	Tech Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nua) = 1;
eq1(Nua) = rhoa;
eq0ex(Nua) = siga;
g0(34,:) = eq0;
g1(34,:) = eq1;
Psi(34,:) = eq0ex;
%--------------------------------------------
%(35)	Preference Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nub) = 1;
eq1(Nub) = rhob;
eq0ex(Nub) = sigb;
g0(35,:) = eq0;
g1(35,:) = eq1;
Psi(35,:) = eq0ex;
%--------------------------------------------
%(36)	Monetary Policy Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Num) = 1;
eq0ex(Num) = sigm;
g0(36,:) = eq0;
g1(36,:) = eq1;
Psi(36,:) = eq0ex;
%--------------------------------------------
%(37)	Investment Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nui) = 1;
eq1(Nui) = rhoi;
eq0ex(Nui) = sigi;
g0(37,:) = eq0;
g1(37,:) = eq1;
Psi(37,:) = eq0ex;
%--------------------------------------------
%(38)	wage markup Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nuw) = 1;
eq1(Nuw) = rhow;
eq0ex(Nuw) = sigw;
g0(38,:) = eq0;
g1(38,:) = eq1;
Psi(38,:) = eq0ex;
%--------------------------------------------
%(39)	price markup Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nup) = 1;
eq1(Nup) = rhop;
eq0ex(Nup) = sigp;
g0(39,:) = eq0;
g1(39,:) = eq1;
Psi(39,:) = eq0ex;
%--------------------------------------------
%(40)	g Spending Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nug) = 1;
eq0ex(Nug) = sigg;
g0(40,:) = eq0;
g1(40,:) = eq1;
Psi(40,:) = eq0ex;
%--------------------------------------------
%(41)	tk Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nutk) = 1;
eq0ex(Nutk) = sigtk;
g0(41,:) = eq0;
g1(41,:) = eq1;
Psi(41,:) = eq0ex;
%--------------------------------------------
%(42)	tl Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nutl) = 1;
eq0ex(Nutl) = sigtl;
g0(42,:) = eq0;
g1(42,:) = eq1;
Psi(42,:) = eq0ex;
% %--------------------------------------------
% %(48)	tauc Shock
% %--------------------------------------------
% eq0 = zeros(1,nvar);
% eq1 = eq0;
% eq0ex = zeros(1,nvar);
% eq0(Nutc) = 1;
% eq0ex(Nutc) = sigtc;
% g0(48,:) = eq0;
% g1(48,:) = eq1;
% Psi(48,:) = eq0ex;
%--------------------------------------------
%(43)	Z Shock
%--------------------------------------------
eq0 = zeros(1,nvar);
eq1 = eq0;
eq0ex = zeros(1,nvar);
eq0(Nuz) = 1;
eq0ex(Nuz) = sigz;
g0(43,:) = eq0;
g1(43,:) = eq1;
Psi(43,:) = eq0ex;


[G,C0,M,fmat,fwt,ywt,gev,eu] = gensys(g0,g1,CC,Psi,Pie);

end


