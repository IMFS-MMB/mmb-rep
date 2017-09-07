%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created for replicating 'Fiscal Stimulus in a Monetary Union:
% Evidence from U.S. Regions', Nakamura and Steinsson (2014) 
% By Bopjun & Paul in Jan. 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

%% model selection

% 1: basic model   2: basic with GHH   3: Firm-specific capital
model=3;    


%% Running Dynare 

if model==1
    dynare Basic
elseif model==2
    dynare BasicGHH
elseif model==3
    dynare FSCM
end

close all;

%% Simulation for Open Ecoonmy Relative Multipliers

% Simulation
NSim = 200000;                                      % number of simulation
NBurn = 50;                                         % number of burn-in
mu = zeros(NSim+NBurn,3);                           % mean of distribution which I'm drawing from 
sigma_shock = [1 corrG 0; corrG 1 0; 0 0 1];        % Cov of distribution which I'm drawing from
shocks = mvnrnd(mu,sigma_shock);                    % multivariate normal distribution
shocks = shocks(:,1);                               % using only eg and egf
per=100;                                            % period of impulse-response

% empty matrix for storing simulated date
Sim_piH=zeros(NSim+NBurn+per,1); Sim_piF=zeros(NSim+NBurn+per,1); 
Sim_pi=zeros(NSim+NBurn+per,1); Sim_pif=zeros(NSim+NBurn+per,1);
Sim_y=zeros(NSim+NBurn+per,1); Sim_yf=zeros(NSim+NBurn+per,1);
Sim_g=zeros(NSim+NBurn+per,1); Sim_gf=zeros(NSim+NBurn+per,1);

% In each period, simulated variables are affected by current shocks
% and evolved previous shocks. The IR from dynare code is based on one std.
% deviation shock, where var(eg) = 1. So, below also rescale by current shock.
for i=1:NSim+NBurn
   Sim_piH(i:i+per-1,:)=Sim_piH(i:i+per-1,:)+piH_eg*shocks(i) ;
   Sim_piF(i:i+per-1,:)=Sim_piF(i:i+per-1,:)+piF_eg*shocks(i) ;
   Sim_pi(i:i+per-1,:)=Sim_pi(i:i+per-1,:)+pi_eg*shocks(i) ;
   Sim_pif(i:i+per-1,:)=Sim_pif(i:i+per-1,:)+pif_eg*shocks(i) ;
   Sim_y(i:i+per-1,:)=Sim_y(i:i+per-1,:)+y_eg*shocks(i) ;
   Sim_yf(i:i+per-1,:)=Sim_yf(i:i+per-1,:)+yf_eg*shocks(i) ;
   Sim_g(i:i+per-1,:)=Sim_g(i:i+per-1,:)+g_eg*shocks(i) ;
   Sim_gf(i:i+per-1,:)=Sim_gf(i:i+per-1,:)+gf_eg*shocks(i) ;
end

XSim=[Sim_piH Sim_piF Sim_pi Sim_pif Sim_y Sim_yf Sim_g Sim_gf];
XSim=XSim(NBurn+1:end-per,:);

% Convert to annual data
NAnnual = floor(NSim/4);                      %# of simulations divided by 4, rounded to lower int.
NColumns = size(XSim);
NColumns = NColumns(2);                       %# of variables in system. Why not use size() command?
XAnnual = zeros(NAnnual,NColumns);            %X vector with NSim/4 (50k) obs. for NCol (8) variables

%Generate the average of four periods. Why not just the sum?!
for ii = 1:NAnnual 
    XAnnual(ii,:) = sum(XSim((4*(ii-1)+1):(4*ii),:))/4;
end
XSimOrig = XSim;
XSim = XAnnual;
NSim = NAnnual;

% Create annual price level
Nquarters = size(XSimOrig);
Nquarters = Nquarters(1);
Xprices = zeros(Nquarters,4);
Xprices(1,1) = XSimOrig(1,1);
Xprices(1,2) = XSimOrig(1,2);
Xprices(1,3) = XSimOrig(1,3);
Xprices(1,4) = XSimOrig(1,4);

for ii = 2:Nquarters
    Xprices(ii,1) = Xprices(ii-1,1) + XSimOrig(ii,1);
    Xprices(ii,2) = Xprices(ii-1,2) + XSimOrig(ii,2);
    Xprices(ii,3) = Xprices(ii-1,3) + XSimOrig(ii,3);
    Xprices(ii,4) = Xprices(ii-1,4) + XSimOrig(ii,4);
end

XpricesAnnual = zeros(NAnnual,4);
for ii = 2:NAnnual
    XpricesAnnual(ii,:) = sum(Xprices((4*(ii-1)+1):(4*ii),:))/4;
end

% Note on construction of regression variables:
% Subtracting world variables doesn't matter since this cancels out
% when we construct the relative variables for the regression

% Relative Regressions
%The difference is taken with two periods back (lag(2))
dgH = XSim(3:NSim,7) - XSim(1:(NSim-2),7) + (1-Cbar)*(XpricesAnnual(3:NSim,1) - XpricesAnnual(1:(NSim-2),1));
dgF = XSim(3:NSim,8) - XSim(1:(NSim-2),8) + (1-Cbar)*(XpricesAnnual(3:NSim,2) - XpricesAnnual(1:(NSim-2),2));
CC = ones(NSim-2,1);
NXX = [CC, dgH-dgF];

fprintf('\n')
fprintf('Relative Regression Results:[Replicated]\n')

% Output Regression
dyH = XSim(3:NSim,5) - XSim(1:(NSim-2),5) + (XpricesAnnual(3:NSim,1) - XpricesAnnual(1:(NSim-2),1)) - (XpricesAnnual(3:NSim,3) - XpricesAnnual(1:(NSim-2),3));
dyF = XSim(3:NSim,6) - XSim(1:(NSim-2),6) + (XpricesAnnual(3:NSim,2) - XpricesAnnual(1:(NSim-2),2)) - (XpricesAnnual(3:NSim,4) - XpricesAnnual(1:(NSim-2),4));
YY = dyH - dyF;
bb = (NXX'*NXX)\NXX'*YY;
fprintf('beta output         = %5.5f\n',bb(2,1))

%Check for non-relative output regression:
XX = [CC, dgH];
bb_h = (XX'*XX)\XX'*dyH;
bb_f = (XX'*XX)\XX'*dyF;
fprintf('Regression Results:[Output (growth) on G (growth)]\n')
fprintf('beta output (home)         = %5.5f\n',bb_h(2,1))
fprintf('beta output (foreign)         = %5.5f\n',bb_f(2,1))

fprintf('\n')

% CPI Regression
dyH = XpricesAnnual(3:NSim,3) - XpricesAnnual(1:(NSim-2),3);
dyF = XpricesAnnual(3:NSim,4) - XpricesAnnual(1:(NSim-2),4);
YY = dyH - dyF;
bb = (NXX'*NXX)\NXX'*YY;
fprintf('beta cpi            = %5.5f\n',bb(2,1))

fprintf('\n')


%% Simulation for Closed Economy Aggregate Multiplier

% Simulation
NSim = 200000;       % number of simulation
NBurn = 50;          % number of burn-in
mu = zeros(NSim+NBurn,3);    % mean of distribution which I'm drawing from 
sigma_shock = [1 corrG 0; corrG 1 0; 0 0 1];   % Cov of distribution which I'm drawing from
shocks = mvnrnd(mu,sigma_shock);   % multivariate normal distribution
shocks = shocks(:,1:2);     % using only eg and egf
per=100;      % period of impulse-response

% empty matrix for storing simulated date
Sim_piH=zeros(NSim+NBurn+per,1); Sim_piF=zeros(NSim+NBurn+per,1); 
Sim_pi=zeros(NSim+NBurn+per,1); Sim_pif=zeros(NSim+NBurn+per,1);
Sim_y=zeros(NSim+NBurn+per,1); Sim_yf=zeros(NSim+NBurn+per,1);
Sim_g=zeros(NSim+NBurn+per,1); Sim_gf=zeros(NSim+NBurn+per,1);

% in each period, simulated variables are affected by current shocks
% and evolved previous shocks
for i=1:NSim+NBurn
   Sim_piH(i:i+per-1,:)=Sim_piH(i:i+per-1,:)+(piH_eg*shocks(i,1)+piH_egf*shocks(i,2)) ;
   Sim_piF(i:i+per-1,:)=Sim_piF(i:i+per-1,:)+(piF_eg*shocks(i,1)+piF_egf*shocks(i,2)) ;
   Sim_pi(i:i+per-1,:)=Sim_pi(i:i+per-1,:)+(pi_eg*shocks(i,1)+pi_egf*shocks(i,2)) ;
   Sim_pif(i:i+per-1,:)=Sim_pif(i:i+per-1,:)+(pif_eg*shocks(i,1)+pif_egf*shocks(i,2)) ;
   Sim_y(i:i+per-1,:)=Sim_y(i:i+per-1,:)+(y_eg*shocks(i,1)+y_egf*shocks(i,2)) ;
   Sim_yf(i:i+per-1,:)=Sim_yf(i:i+per-1,:)+(yf_eg*shocks(i,1)+yf_egf*shocks(i,2)) ;
   Sim_g(i:i+per-1,:)=Sim_g(i:i+per-1,:)+(g_eg*shocks(i,1)+g_egf*shocks(i,2)) ;
   Sim_gf(i:i+per-1,:)=Sim_gf(i:i+per-1,:)+(gf_eg*shocks(i,1)+gf_egf*shocks(i,2)) ;
end

XSim=[Sim_piH Sim_piF Sim_pi Sim_pif Sim_y Sim_yf Sim_g Sim_gf];
XSim=XSim(NBurn+1:end-per,:);   

% Convert to annual data
NAnnual = floor(NSim/4);
NColumns = size(XSim);
NColumns = NColumns(2);
XAnnual = zeros(NAnnual,NColumns);
for ii = 1:NAnnual 
    XAnnual(ii,:) = sum(XSim((4*(ii-1)+1):(4*ii),:))/4;
end
XSimOrig = XSim;
XSim = XAnnual;
NSim = NAnnual;

% Create annual price level
Nquarters = size(XSimOrig);
Nquarters = Nquarters(1);
Xprices = zeros(Nquarters,4);
Xprices(1,1) = XSimOrig(1,1);
Xprices(1,2) = XSimOrig(1,2);
Xprices(1,3) = XSimOrig(1,3);
Xprices(1,4) = XSimOrig(1,3);
for ii = 2:Nquarters
    Xprices(ii,1) = Xprices(ii-1,1) + XSimOrig(ii,1);
    Xprices(ii,2) = Xprices(ii-1,2) + XSimOrig(ii,2);
    Xprices(ii,3) = Xprices(ii-1,3) + XSimOrig(ii,3);
    Xprices(ii,4) = Xprices(ii-1,4) + XSimOrig(ii,4);
end

XpricesAnnual = zeros(NAnnual,4);
for ii = 2:NAnnual
    XpricesAnnual(ii,:) = sum(Xprices((4*(ii-1)+1):(4*ii),:))/4;
end

pW = nn*XpricesAnnual(:,3)+(1-nn)*XpricesAnnual(:,4);

% Regressors
dgH = XSim(3:NSim,7) - XSim(1:(NSim-2),7);
dgF = XSim(3:NSim,8) - XSim(1:(NSim-2),8);
XX = [CC, nn*dgH+(1-nn)*dgF];
fprintf('World Regression Results::[Replicated]\n')

% Output Regression
dyH = XSim(3:NSim,5) - XSim(1:(NSim-2),5);
dyF = XSim(3:NSim,6) - XSim(1:(NSim-2),6);
YY = nn*dyH + (1-nn)*dyF;
bb = (XX'*XX)\XX'*YY;
fprintf('beta output         = %5.5f\n',bb(2,1))

% CPI Regression
dyH = XpricesAnnual(3:NSim,3) - XpricesAnnual(1:(NSim-2),3);
dyF = XpricesAnnual(3:NSim,4) - XpricesAnnual(1:(NSim-2),4);
YY = nn*dyH + (1-nn)*dyF;
bb = (XX'*XX)\XX'*YY;
fprintf('beta cpi            = %5.5f\n',bb(2,1))

fprintf('\n')
