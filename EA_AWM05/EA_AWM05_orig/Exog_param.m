% --------------------------------------------------------------------
% Exog_param.m 
% Specifies the parameter values of exogenous variables for the AWM.
% This file sets the coefficients to stationarize yett, compr, ywr,
% ywd and gcr.
% Keith Küster, 4 August 2003
% --------------------------------------------------------------------



%------ Stationarity assumptions
subtract=1.e-6;
    agcr    = 1-subtract;.001;subtract;             % Forces gcr back to steady state if agcr<1
    aywr    = 1-subtract;.002;subtract;             % Same for ywr
    aywd    = 1-subtract;.006;subtract;             % Same for ywd
    ayett   = 1-subtract;.004;0*subtract;           % Same for yett which captures the LFN and TFT growth rate
    acompr  = 1-subtract;.005;subtract;             % Same as above for gcr also for compr

