%********************************************************
% Run and plot IRFs for ALSV06 Working Paper for:
% a preference shock (epsa_)
% a technolgy shock (epsz_)
% as found in Figure 3 in the Appendix of Andrés, J., López-Salido, J.D.,
% Vallés, J. (2001), "Money in an Estimated Business Cycle Model of the Euro
% Area", Banco de España, Working Paper No. 0121.
%
% Last edited: 08/11/2019
%
% Authors: Jonas Wendelborn & Sehrish Usman
%
%********************************************************

%clear all;
%clc;
%close all;

%adjust path to folder where replication file is stored
%cd(...);

%********************************************************
% NOTE: only replication of the IRFs for the technology shock was
% successful, we therefore begin with this part. 
%********************************************************

%%
%********************************************************
% Replicate IRFs for technology shock
%********************************************************

figure('name','Responses to a Technology Shock','numbertitle','off')

t=[0:19];

% 1. Model without habits

% Set parameters which are passed on to Dynare.
% We set the parameters in this cumbersome way, so that later on we can
% loop over individual parameters to analyze their effects on the IRFs.
% These are the estimates from Table 1, column (2) in the Appendix of the
% working paper.
beta_ = 0.9878;
psi1_ = 0.9931;
psi2_ = 0.0000;
gamma1_ = 0.0083;
gamma2_ = 0.3130;
gamma3_ = 0.8323;
gammaf_ = 0.6685;
gammab_ = 1-gammaf_;
chi_ = 10.6670;
lambda_ = 0.2505;
rhor_ = 0.2523;
rhoy_ = 0.0000;
rhopi_ = 1.0487;
rhomu_ = 0.5491;
rhoa_ = 0.9906;
rhoe_ = 0.9638;
rhoz_ = 0.9977;
sigmaa_ = 0.0558;
sigmae_ = 0.0046;
sigmaz_ = 0.0052;
sigmar_ = 0.0023;

%run replication dynare file
dynare ALSV06WP_rep
%load results
load ALSV06WP_rep_results.mat;

% Define annualized variables to plot in terms of Dynare results
output_epsz = y_epsz;
interest_epsz = 4*r_epsz; 
inflation_epsz = 4*pi_epsz; 
moneygrowth_epsz = 4*mu_epsz;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot IRFs for the variables:
%   output (y),
%   real money groeth (m),
%   inflation (pi),
%   interest rate (r) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,1);
plot(t,output_epsz,'r','LineWidth',1.5);              hold on
axis([0 20 -0.6 0]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsz,'r','LineWidth',1.5);              hold on
axis([0 20 -0.3 0.4]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsz,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.4]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsz,'r','LineWidth',1.5);              hold on
axis([0 20 -0.1 0.4]);
title('Interest Rate');



% 2. Model with habits

% Set parameters which are passed on to Dynare.
% These are the estimates from Table 1, column (3) in the Appendix of the
% working paper.
beta_ = 0.9876;
sigma_ = 1.0573;
h_ = 0.9025;
delta_ = 108.76;
gammaf_ = 0.9876;
gammab_ = 1-gammaf_;
chi_ = 0.5432;
lambda_ = 1.1939;
rhor_ = 0.5058;
rhoy_ = 0.0555;
rhopi_ = 1.1796;
rhomu_ = 0.6845;
rss_ = exp(0.0224);
rhoa_ = 0.9835;
rhoe_ = 0.9625;
rhoz_ = 0.9701;
sigmaa_ = 0.0495;
sigmae_ = 0.0047;
sigmaz_ = 0.0046;
sigmar_ = 0.0018;


%run replication dynare file
dynare ALSV06WPh_rep;

%load results
load ALSV06WPh_rep_results.mat;

% Define annualized variables to plot in terms of Dynare results
output_epsz = y_epsz;
interest_epsz = 4*r_epsz; 
inflation_epsz = 4*pi_epsz; 
moneygrowth_epsz = 4*mu_epsz;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot IRFs for the variables:
%   output (y),
%   real money groeth (m),
%   inflation (pi),
%   interest rate (r) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,1);
plot(t,output_epsz,'o-b','LineWidth',1.5);              hold on
axis([0 20 -0.6 0]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsz,'o-b','LineWidth',1.5);              hold on
axis([0 20 -0.3 0.4]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsz,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.4]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsz,'o-b','LineWidth',1.5);              hold on
axis([0 20 -0.1 0.4]);
title('Interest Rate');



%%
%********************************************************
% Replication attempt of IRFs for preference shock
%********************************************************


figure('name','Responses to a Preference Shock','numbertitle','off')

% 1. Model without habits

% Set parameters which are passed on to Dynare.
% These are the estimates from Table 1, column (2) in the Appendix of the
% working paper.
beta_ = 0.9878;
psi1_ = 0.9931;
psi2_ = 0.0000;
gamma1_ = 0.0083;
gamma2_ = 0.3130;
gamma3_ = 0.8323;
gammaf_ = 0.6685;
gammab_ = 1-gammaf_;
chi_ = 10.6670;
lambda_ = 0.2505;
rhor_ = 0.2523;
rhoy_ = 0.0000;
rhopi_ = 1.0487;
rhomu_ = 0.5491;
rhoa_ = 0.9906;
rhoe_ = 0.9638;
rhoz_ = 0.9977;
sigmaa_ = 0.0558;
sigmae_ = 0.0046;
sigmaz_ = 0.0052;
sigmar_ = 0.0023;

%run replication dynare file
dynare ALSV06WP_rep
%load results
load ALSV06WP_rep_results.mat;

% Define annualized variables to plot in terms of Dynare results
output_epsa = y_epsa;
interest_epsa = 4*r_epsa; 
inflation_epsa = 4*pi_epsa; 
moneygrowth_epsa = 4*mu_epsa;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot IRFs for the variables:
%   output (y),
%   real money groeth (m),
%   inflation (pi),
%   interest rate (r) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,1);
plot(t,output_epsa,'r','LineWidth',1.5);              hold on
axis([1 20 -0.1 0.5]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsa,'r','LineWidth',1.5);              hold on
axis([1 20 0 0.4]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsa,'r','LineWidth',1.5);              hold on
axis([1 20 0 0.6]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsa,'r','LineWidth',1.5);              hold on
axis([1 20 0 0.6]);
title('Interest Rate');



% 2. Model with habits

% Set parameters which are passed on to Dynare.
% These are the estimates from Table 1, column (3) in the Appendix of the
% working paper.
beta_ = 0.9876;
sigma_ = 1.0573;
h_ = 0.9025;
delta_ = 108.76;
gammaf_ = 0.9876;
gammab_ = 1-gammaf_;
chi_ = 0.5432;
lambda_ = 1.1939;
rhor_ = 0.5058;
rhoy_ = 0.0555;
rhopi_ = 1.1796;
rhomu_ = 0.6845;
rss_ = exp(0.0224);
rhoa_ = 0.9835;
rhoe_ = 0.9625;
rhoz_ = 0.9701;
sigmaa_ = 0.0495;
sigmae_ = 0.0047;
sigmaz_ = 0.0046;
sigmar_ = 0.0018;

%run replication dynare file
dynare ALSV06WPh_rep;

%load results
load ALSV06WPh_rep_results.mat;

% Define annualized variables to plot in terms of Dynare results
output_epsa = y_epsa;
interest_epsa = 4*r_epsa; 
inflation_epsa = 4*pi_epsa; 
moneygrowth_epsa = 4*mu_epsa;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot IRFs for the variables:
%   output (y),
%   real money groeth (m),
%   inflation (pi),
%   interest rate (r) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,1);
plot(t,output_epsa,'o-b','LineWidth',1.5);              hold on
axis([1 20 -0.1 0.5]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsa,'o-b','LineWidth',1.5);              hold on
axis([1 20 0 0.4]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsa,'o-b','LineWidth',1.5);              hold on
axis([1 20 0 0.6]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsa,'o-b','LineWidth',1.5);              hold on
axis([1 20 0 0.6]);
title('Interest Rate');

%%
%********************************************************
% Re-run the above exercise, but with new variable definitions, i.e.
% de-annualize (divide by 4) the response variables to improve the fit to
% the IRFs in the working paper


figure('name','Responses to a Preference Shock, de-annulized','numbertitle','off')

% 1. Model without habits


% Set parameters which are passed on to Dynare.
% These are the estimates from Table 1, column (2) in the Appendix of the
% working paper.
beta_ = 0.9878;
psi1_ = 0.9931;
psi2_ = 0.0000;
gamma1_ = 0.0083;
gamma2_ = 0.3130;
gamma3_ = 0.8323;
gammaf_ = 0.6685;
gammab_ = 1-gammaf_;
chi_ = 10.6670;
lambda_ = 0.2505;
rhor_ = 0.2523;
rhoy_ = 0.0000;
rhopi_ = 1.0487;
rhomu_ = 0.5491;
rhoa_ = 0.9906;
rhoe_ = 0.9638;
rhoz_ = 0.9977;
sigmaa_ = 0.0558;
sigmae_ = 0.0046;
sigmaz_ = 0.0052;
sigmar_ = 0.0023;


%run replication dynare file
dynare ALSV06WP_rep
%load results
load ALSV06WP_rep_results.mat;

% Define variables to plot in terms of Dynare results
output_epsa = 0.25*y_epsa;
interest_epsa = r_epsa; 
inflation_epsa = pi_epsa; 
moneygrowth_epsa = 0.25*mu_epsa; % improves the fit 

subplot(2,2,1);
plot(t,output_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Interest Rate');



% 2. Model with habits

% Set parameters which are passed on to Dynare.
% These are the estimates from Table 1, column (3) in the Appendix of the
% working paper.
beta_ = 0.9876;
sigma_ = 1.0573;
h_ = 0.9025;
delta_ = 108.76;
gammaf_ = 0.9876;
gammab_ = 1-gammaf_;
chi_ = 0.5432;
lambda_ = 1.1939;
rhor_ = 0.5058;
rhoy_ = 0.0555;
rhopi_ = 1.1796;
rhomu_ = 0.6845;
rss_ = exp(0.0224);
rhoa_ = 0.9835;
rhoe_ = 0.9625;
rhoz_ = 0.9701;
sigmaa_ = 0.0495;
sigmae_ = 0.0047;
sigmaz_ = 0.0046;
sigmar_ = 0.0018;

%run replication dynare file
dynare ALSV06WPh_rep;

%load results
load ALSV06WPh_rep_results.mat;

% Define variables to plot in terms of Dynare results
output_epsa = 0.25*y_epsa;
interest_epsa = r_epsa; 
inflation_epsa = pi_epsa; 
moneygrowth_epsa = mu_epsa;


subplot(2,2,1);
plot(t,output_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Interest Rate');

%% 
%********************************************************
% Loop over parameters to analyzie their effects on the overall responses
%
%
figure('name','Responses to a Preference Shock, no habits, change param','numbertitle','off')

% 1. Model without habits


% initialize the variable over which we want to loop
run_var=0;

for i=1:10
% Set parameters which are passed on to Dynare.
% select one over which you want to loop and replace its value with run_var
% here we loop over psi1
beta_ = 0.9878;
psi1_ = run_var; %0.9931;
psi2_ = 0.0000;
gamma1_ = 0.0083;
gamma2_ = 0.3130;
gamma3_ = 0.8323;
gammaf_ = 0.6685;
gammab_ = 1-gammaf_;
chi_ = 10.6670;
lambda_ = 0.2505;
rhor_ = 0.2523;
rhoy_ = 0.0000;
rhopi_ = 1.0487;
rhomu_ = 0.5491;
rhoa_ = 0.9906;
rhoe_ = 0.9638;
rhoz_ = 0.9977;
sigmaa_ = 0.0558;
sigmae_ = 0.0046;
sigmaz_ = 0.0052;
sigmar_ = 0.0023;

%run replication dynare file
dynare ALSV06WP_rep
%load results
load ALSV06WP_rep_results.mat;

% Define variables to plot in terms of Dynare results
output_epsa = 0.25*y_epsa;
interest_epsa = r_epsa; 
inflation_epsa = pi_epsa; 
moneygrowth_epsa = 0.25*mu_epsa; % improves the fit 

subplot(2,2,1);
plot(t,output_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Interest Rate');

% set next value for looping variable
run_var=run_var+0.2;

end


%%
%********************************************************
% Loop over parameters to analyzie their effects on the overall responses
% in the model with habits
%
figure('name','Responses to a Preference Shock, habits, change param','numbertitle','off')

% 2. Model with habits


% initialize the variable over which we want to loop
run_var=0;

for i=1:10
% Set parameters which are passed on to Dynare.
% select one over which you want to loop and replace its value with run_var
% here we loop over sigma
beta_ = 0.9876;
sigma_ = run_var; %1.0573;
h_ = 0.9025;
delta_ = 108.76;
gammaf_ = 0.9876;
gammab_ = 1-gammaf_;
chi_ = 0.5432;
lambda_ = 1.1939;
rhor_ = 0.5058;
rhoy_ = 0.0555;
rhopi_ = 1.1796;
rhomu_ = 0.6845;
rss_ = exp(0.0224);
rhoa_ = 0.9835;
rhoe_ = 0.9625;
rhoz_ = 0.9701;
sigmaa_ = 0.0495;
sigmae_ = 0.0047;
sigmaz_ = 0.0046;
sigmar_ = 0.0018;

%run replication dynare file
dynare ALSV06WPh_rep;

%load results
load ALSV06WPh_rep_results.mat;

% Define variables to plot in terms of Dynare results
output_epsa = 0.25*y_epsa;
interest_epsa = r_epsa; 
inflation_epsa = pi_epsa; 
moneygrowth_epsa = mu_epsa;


subplot(2,2,1);
plot(t,output_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Interest Rate');

% set next value for looping variable
run_var=run_var+0.2;

end

%% 
%********************************************************
% Plot the best fitting IRFs we could find
%
%
figure('name','Responses to a Preference Shock, best fit','numbertitle','off')

% 1. Model without habits


% Set parameters which are passed on to Dynare.
% Here we adjusted the parameters such that the IRFs match their target
% best
beta_ = 0.9878;
psi1_ = 2; %0.9931;
psi2_ = 0.0000;
gamma1_ = 1; %0.0083;
gamma2_ = 0.4; %0.3130;
gamma3_ = 0.8323;
gammaf_ = 0.6685;
gammab_ = 0; %1-gammaf_;
chi_ = 10.6670;
lambda_ = 0.8; %0.2505;
rhor_ = 0.2523;
rhoy_ = 0.0000;
rhopi_ = 1.0487;
rhomu_ = 0.5491;
rhoa_ = 0.9906;
rhoe_ = 0.9638;
rhoz_ = 0.9977;
sigmaa_ = 0.0558;
sigmae_ = 0.0046;
sigmaz_ = 0.0052;
sigmar_ = 0.0023;

%run replication dynare file
dynare ALSV06WP_rep
%load results
load ALSV06WP_rep_results.mat;

% Define variables to plot in terms of Dynare results
output_epsa = 0.25*y_epsa;
interest_epsa = r_epsa; 
inflation_epsa = pi_epsa; 
moneygrowth_epsa = 0.25*mu_epsa; % improves the fit 

subplot(2,2,1);
plot(t,output_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsa,'r','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Interest Rate');



% 2. Model with habits
% The only slight improvement that could be achieved was by changing the
% sings of the preference shock in the money demand equation, to do so go
% to the mod-file ALSV06WPh_rep.mod and change the sign infront of a in the
% second model equation from + to -.

beta_ = 0.9876;
sigma_ = 1.0573;
h_ = 0.9025;
delta_ = 108.76;
gammaf_ = 0.9876;
gammab_ = 1-gammaf_;
chi_ = 0.5432;
lambda_ = 1.1939;
rhor_ = 0.5058;
rhoy_ = 0.0555;
rhopi_ = 1.1796;
rhomu_ = 0.6845;
rss_ = exp(0.0224);
rhoa_ = 0.9835;
rhoe_ = 0.9625
rhoz_ = 0.9701;
sigmaa_ = 0.0495;
sigmae_ = 0.0047;
sigmaz_ = 0.0046;
sigmar_ = 0.0018;

%run replication dynare file
dynare ALSV06WPh_rep;

%load results
load ALSV06WPh_rep_results.mat;

% Define variables to plot in terms of Dynare results
output_epsa = 0.25*y_epsa;
interest_epsa = r_epsa; 
inflation_epsa = pi_epsa; 
moneygrowth_epsa = mu_epsa;


subplot(2,2,1);
plot(t,output_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Output');

subplot(2,2,4);
plot(t,moneygrowth_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Money Growth');

subplot(2,2,3);
plot(t,inflation_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Inflation');

subplot(2,2,2);
plot(t,interest_epsa,'o-b','LineWidth',1.5);              hold on
axis([0 20 0 0.15]);
title('Interest Rate');

