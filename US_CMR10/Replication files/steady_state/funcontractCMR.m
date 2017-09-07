%---------------------------------------------------------------------------------------
%      This file computes the steady state value for kbarU, nU and omegabarU
%      March 2012
%
%      THIS PROGRAM WAS WRITTEN FOR MATLAB 7 BY:
%
%      Fabio Verona
%
%      f8fabio@yahoo.it
%---------------------------------------------------------------------------------------

% %x(1)=kbarU
% %x(2)=nU


function W = funcontractCMR(x,qUU,RkXUU,sigmaUU,ReXUU,gammaUU,piUU,muUU,weUU,muzstarUU,omegabarUU)

W = [

(qUU*x(1)*(1+RkXUU)* ( (1-muUU)*normcdf(( (log(omegabarUU)+sigmaUU^2/2)/sigmaUU )  -sigmaUU)  + omegabarUU*(1-normcdf(( (log(omegabarUU)+sigmaUU^2/2)/sigmaUU ))) )/(x(2)*(1+ReXUU)))   - (qUU*x(1)/x(2)) + 1 

-x(2)+ (gammaUU/(piUU*muzstarUU))*(RkXUU-ReXUU-( ( normcdf(( (log(omegabarUU)+sigmaUU^2/2)/sigmaUU )-sigmaUU)+omegabarUU*(1-normcdf(( (log(omegabarUU)+sigmaUU^2/2)/sigmaUU ))) )-( (1-muUU)*normcdf(( (log(omegabarUU)+sigmaUU^2/2)/sigmaUU )-sigmaUU)+omegabarUU*(1-normcdf(( (log(omegabarUU)+sigmaUU^2/2)/sigmaUU ))) ) )*(1+RkXUU))*x(1)*qUU+weUU+gammaUU*(1+ReXUU)*x(2)/(piUU*muzstarUU) ];



