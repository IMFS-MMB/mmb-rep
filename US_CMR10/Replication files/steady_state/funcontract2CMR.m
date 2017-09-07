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

%p(1) = omegabarU

function WW = funcontract2CMR(p,RkXUU,sigmaUU,ReXUU,muUU)

WW = [
(1-( normcdf(( (log(p(1))+sigmaUU^2/2)/sigmaUU )-sigmaUU)   +p(1)*(1-normcdf(( (log(p(1))+sigmaUU^2/2)/sigmaUU   ))) ))*( (1+RkXUU)/(1+ReXUU) )  + ( (1-( normcdf((log(p(1))+sigmaUU^2/2)/sigmaUU) ))/(1-( normcdf((log(p(1))+sigmaUU^2/2)/sigmaUU) )-muUU*p(1)*( normpdf((log(p(1))+sigmaUU^2/2)/sigmaUU)/p(1)/sigmaUU )) )*(( (1+RkXUU)/(1+ReXUU) )*( (1-muUU)*normcdf(( (log(p(1))+sigmaUU^2/2)/sigmaUU )-sigmaUU)+p(1)*(1-normcdf(( (log(p(1))+sigmaUU^2/2)/sigmaUU ))) )-1)
 ];



