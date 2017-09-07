% -----------------------------------------
% AWM_par.m 
%
% program to read and define the parameters 
% in the model file 
%
% by: Keith Kuester, January 2003
% modified: Keith Kuester, 4 August 2003
% -----------------------------------------

param_AWM;                  % obtain the TROLL parameters                         
steady_state_param_AWM;     % obtain the steady state parameters (includes atransfer and atdn_yen)

Exog_param;                 % obtain the parameters governing the exogeneous processes
load SHOCKVCV Omega;        % load the variance covariance matrix of shocks