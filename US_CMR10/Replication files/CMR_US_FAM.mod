//CMR 2010-Financial Accelerator Model (FAM)

// Based on code by Fabio Verona (Original: Christiano web site)

// Endogenous Variables
var piU, sU, rkU, iU, uU, omegabarU, RkXU, nU, qU, uzcU, lambdazU, cU, wU,
      hU, kbarU, ReXU, pstarU, wstarU, FpXU, FwXU,YU, PrU,BU
      lambdafU, pitargetU, muupU, gU, muzstarU, gammaU, epsilU, sigmaU, zetacU, zetaiU, tauoU;

// Exogenous Variables
varexo e_xpU e_lambdafU, e_pitargetU, e_muupU, e_gU, e_muzstarU, e_gammaU, e_epsilU, e_sigmaU,  e_zetaiU, e_tauoU;

// Steady-state values:
parameters piUU, sUU, rkUU, iUU, uUU, omegabarUU, RkXUU, nUU, qUU, uzcUU, lambdazUU, cUU, wUU, hUU, kbarUU, ReXUU, pstarUU, wstarUU, FpXUU, FwXUU,  lambdafUU, pitargetUU, muupUU, gUU, muzstarUU, gammaUU, epsilUU, sigmaUU, zetacUU, zetaiUU, tauoUU;

parameters rho1_lambdafU, rho1_pitargetU, rho1_muupU, rho1_gU, rho1_muzstarU, rho1_gammaU, rho1_epsilU, rho1_sigmaU,  rho1_zetaiU, rho1_tauoU;

parameters std1_lambdafU, std1_pitargetU, std1_muupU, std1_gU, std1_muzstarU, std1_gammaU, std1_epsilU, std1_sigmaU,  std1_zetaiU, std1_tauoU;

//PARAMETERS

parameters lambdawUU, sigmaLXUU, betaUU,xiwUU, bUU,
      psiLXUU, iotaw1UU, iotamuUU, muUU, weUU, bigthetaUU, sigmaaUU, SdouprXUU, zetaUU, 
      upsilUU, alphaUU, deltaUU, xipUU, iota1UU, etagUU,
      taukUU, taulUU, taucUU, taudUU, aptilUU, aytilUU, actilUU, rhotilUU,
      phiUU, pibarUU, vlUU;


pp=load('ss_parameters_US_FAM.mat');
for i=1:M_.param_nbr;
    name = deblank(M_.param_names(i,:));
    if isfield(pp,name);
       M_.params(i) = eval(['pp.' name]);
    end;
end;


//Annualizing the variables
//Inflation=(piU-1)*400;
//Re_an=((ReXU+1)^4-1)*100;
//Rk_an=((RkXU+1)^4-1)*100;

model;

// Welfare
//Util = zetacU*(log(cU*muzstarU-bUU*cU(-1))-zetaUU*psiLXUU/(1+sigmaLXUU)*(wstarU/wplusU)^((1+sigmaLXUU)*lambdawUU/(lambdawUU-1))*hU^(1+sigmaLXUU)-vUU/(1-sigmaqUU)*((1+taucUU)*piU*cU*muzstarU/(mbU(-1)*mU^(thetaUU*(1-chiiU))*(1-mU)^((1-chiiU)*(1-thetaUU))*dmU(-1)^chiiU))^(1-sigmaqUU)-(exp(sqrt(HdouprXUU/2)*(mU*(1+xU(-1))/mU(-1)-piUU*muzstarUU))+exp(-sqrt(HdouprXUU/2)*(mU*(1+xU(-1))/mU(-1)-piUU*muzstarUU))-2));
//Welf = Util + nbeta*Welf(+1);


// Model equations

//--Goods Producers--//
//Marginal cost (eq A.1)
-sU+((1-alphaUU)^(alphaUU-1)*alphaUU^(-alphaUU))*(rkU^alphaUU)*(wU^(1-alphaUU))/epsilU;

//Another measure of marginal cost (eq. A2)
rkU/( alphaUU*epsilU*( (upsilUU*muzstarU*( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )/(uU*kbarU(-1)))^(1-alphaUU) ) )-sU;

//--Capital Producers--//
//Supply of capital (eq. A.7)
lambdazU*zetacU*qU*( -( ( sqrt(SdouprXUU/2) )*exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))-( sqrt(SdouprXUU/2) )*exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU)) )*( zetaiU*iU*muzstarU*upsilUU/iU(-1) )+1-( exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))+exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))-2 ) )-(lambdazU/muupU)*zetacU+betaUU*zetacU(+1)*lambdazU(+1)*qU(+1)*( ( ( sqrt(SdouprXUU/2) )*exp(( sqrt(SdouprXUU/2) )*(( zetaiU(+1)*iU(+1)*muzstarU(+1)*upsilUU/iU )-muzstarUU*upsilUU))-( sqrt(SdouprXUU/2) )*exp(-( sqrt(SdouprXUU/2) )*(( zetaiU(+1)*iU(+1)*muzstarU(+1)*upsilUU/iU )-muzstarUU*upsilUU)) )*(( zetaiU(+1)*iU(+1)*muzstarU(+1)*upsilUU/iU )^2) )/(muzstarU(+1)*upsilUU);

//Capital accumulation (eq. A.8)
kbarU-(1-deltaUU)*(kbarU(-1)/(muzstarU*upsilUU))-(1-( exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))+exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))-2 ))*iU;

//--Entrepreneurs--//
//Capital utilization (eq. A.9)
rkU - tauoU*rkUU*exp(sigmaaUU*(uU-1));

//Debt contract offered to entrepreneurs (eq. A.11)
(1-( normcdf(( (log(omegabarU(+1))+sigmaU^2/2)/sigmaU )-sigmaU)+omegabarU(+1)*(1-normcdf(( (log(omegabarU(+1))+sigmaU^2/2)/sigmaU ))) ))*( (1+RkXU(+1))/(1+ReXU) )+( (1-( normcdf((log(omegabarU(+1))+sigmaU^2/2)/sigmaU) ))/(1-( normcdf((log(omegabarU(+1))+sigmaU^2/2)/sigmaU) )-muUU*omegabarU(+1)*( normpdf((log(omegabarU(+1))+sigmaU^2/2)/sigmaU)/omegabarU(+1)/sigmaU )) )*(( (1+RkXU(+1))/(1+ReXU) )*( (1-muUU)*normcdf(( (log(omegabarU(+1))+sigmaU^2/2)/sigmaU )-sigmaU)+omegabarU(+1)*(1-normcdf(( (log(omegabarU(+1))+sigmaU^2/2)/sigmaU ))) )-1);

//Zero profit condition for banks on entrepreneurial loans (eq. A.12)
(qU(-1)*kbarU(-1)*(1+RkXU)*( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )/(nU(-1)*(1+ReXU(-1))))-(qU(-1)*kbarU(-1)/nU(-1))+1;

//Law of motion of net worth (eq. A.13)
-nU+(gammaU/(piU*muzstarU))*(RkXU-ReXU(-1)-( ( normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXU))*kbarU(-1)*qU(-1)+weUU+gammaU*(1+ReXU(-1))*nU(-1)/(piU*muzstarU);

//Rate of return on capital (eq. A.10) 
RkXU - ( ( (1-taukUU)*(uU*rkU-tauoU*( rkUU*(exp(sigmaaUU*(uU-1))-1)/sigmaaUU ))+(1-deltaUU)*qU)*piU/(upsilUU*qU(-1)) + taukUU*deltaUU - 1);

//--Households--//
//Marginal utility of consumption (eq. A.19)
uzcU-(muzstarU*zetacU/(cU*muzstarU-bUU*cU(-1)))+bUU*betaUU*zetacU(+1)/(cU(+1)*muzstarU(+1)-bUU*cU);

//Consumption decision (eq A.20)
uzcU-zetacU*(1+taucUU)*lambdazU;

//Intertemporal efficiency of time deposit (eq A.24)
-zetacU*lambdazU+(betaUU*zetacU(+1)*lambdazU(+1)/(muzstarU(+1)*piU(+1)))*(1+(1-taudUU)*ReXU);


//Conditions associated with Calvo sticky prices
//(eq A.3)
pstarU - ((1-xipUU)*( ( ( (1 - xipUU*(( (pitargetU^iota1UU) * (piU(-1)^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU)^(1/(1-lambdafU)) ) / (1-xipUU) ) ) ^ lambdafU ) + xipUU*(((( (pitargetU^iota1UU) * (piU(-1)^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU)*pstarU(-1))^( lambdafU / (1-lambdafU) )) )^(1/( lambdafU / (1-lambdafU) ));
//(eq A.4)
//zetacU*lambdazU*( (pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * vlUU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) ) + ( (( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1)) ^ (1/(1-lambdafU(+1))) ) * betaUU * xipUU * FpXU(+1) - FpXU;
zetacU*lambdazU*YU+ ( (( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1)) ^ (1/(1-lambdafU(+1))) ) * betaUU * xipUU * FpXU(+1) - FpXU;
//(eq A.5) 
//zetacU*lambdafU*lambdazU*( (pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * vlUU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) )*sU + betaUU * xipUU *  ( (( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1)) ^ (lambdafU(+1)/(1-lambdafU(+1))) ) * ( FpXU(+1)* (( ( (1 - xipUU*(( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1))^(1/(1-lambdafU(+1))) ) / (1-xipUU) ) )^(1-lambdafU(+1))) ) - ( FpXU* (( ( (1 - xipUU*(( (pitargetU^iota1UU) * (piU(-1)^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU)^(1/(1-lambdafU)) ) / (1-xipUU) ) )^(1-lambdafU)) );
zetacU*lambdafU*lambdazU*YU*sU + betaUU * xipUU *  ( (( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1)) ^ (lambdafU(+1)/(1-lambdafU(+1))) ) * ( FpXU(+1)* (( ( (1 - xipUU*(( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1))^(1/(1-lambdafU(+1))) ) / (1-xipUU) ) )^(1-lambdafU(+1))) ) - ( FpXU* (( ( (1 - xipUU*(( (pitargetU^iota1UU) * (piU(-1)^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU)^(1/(1-lambdafU)) ) / (1-xipUU) ) )^(1-lambdafU)) );

//Conditions associated with Calvo sticky wages
//(eq A.21)
wstarU - ( ((1-xiwUU)*( ( (1 - xiwUU * ( ( (( (pitargetU^iotaw1UU) * (piU(-1)^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU*muzstarU*wU/wU(-1) )) * (muzstarUU^(1-iotamuUU)) * (muzstarU^iotamuUU) ) ^ (1/(1-lambdawUU)) ) ) / (1-xiwUU) ) ^ lambdawUU ) + xiwUU*( (( (( (pitargetU^iotaw1UU) * (piU(-1)^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU*muzstarU*wU/wU(-1) )) * (muzstarUU^(1-iotamuUU)) * (muzstarU^iotamuUU) )*wstarU(-1))^( lambdawUU/(1-lambdawUU) ) ) )^(1/( lambdawUU/(1-lambdawUU) )) );
//(eq A.22)
zetacU*((wstarU^(lambdawUU/(lambdawUU-1)))*hU*(1-taulUU)*lambdazU/lambdawUU) + betaUU * xiwUU * (muzstarUU^((1-iotamuUU)/(1-lambdawUU))) * ( (( (pitargetU(+1)^iotaw1UU) * (piU^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )^(1/(1-lambdawUU))) / piU(+1) ) * ( (1/( piU(+1)*muzstarU(+1)*wU(+1)/wU )) ^ (lambdawUU/(1-lambdawUU)) ) * (muzstarU(+1)^(iotamuUU/(1-lambdawUU)-1)) * FwXU(+1) - FwXU;
//(eq A.23)
zetacU*((wstarU^(lambdawUU/(lambdawUU-1))*hU)^(1+sigmaLXUU))*zetaUU + betaUU * xiwUU * (( (( (pitargetU(+1)^iotaw1UU) * (piU^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU(+1)*muzstarU(+1)*wU(+1)/wU )) * (muzstarUU^(1-iotamuUU)) * (muzstarU(+1)^iotamuUU) )  ^ (lambdawUU*(1+sigmaLXUU)/(1-lambdawUU))) * ( ( ( (1 - xiwUU * ( ( (( (pitargetU(+1)^iotaw1UU) * (piU^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU(+1)*muzstarU(+1)*wU(+1)/wU )) * (muzstarUU^(1-iotamuUU)) * (muzstarU(+1)^iotamuUU) ) ^ (1/(1-lambdawUU)) ) ) / (1-xiwUU) ) ^ (1-lambdawUU*(1+sigmaLXUU)) ) * wU(+1) * FwXU(+1)/psiLXUU ) - ( ( ( (1 - xiwUU * ( ( (( (pitargetU^iotaw1UU) * (piU(-1)^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU*muzstarU*wU/wU(-1) )) * (muzstarUU^(1-iotamuUU)) * (muzstarU^iotamuUU) ) ^ (1/(1-lambdawUU)) ) ) / (1-xiwUU) )   ^ (1-lambdawUU*(1+sigmaLXUU)) ) * wU   * FwXU/psiLXUU );
 
//--Resource constraint--// (eq A.30)
//( (pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * vlUU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) )-gU-cU-iU/muupU-tauoU*( rkUU*(exp(sigmaaUU*(uU-1))-1)/sigmaaUU )*kbarU(-1)/(muzstarU*upsilUU)-( ( ( normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXU)*qU(-1)*kbarU(-1)/(muzstarU*piU) )-bigthetaUU*(1-gammaU)*(nU-weUU)/gammaU;
YU-gU-cU-iU/muupU-tauoU*( rkUU*(exp(sigmaaUU*(uU-1))-1)/sigmaaUU )*kbarU(-1)/(muzstarU*upsilUU)-( ( ( normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXU)*qU(-1)*kbarU(-1)/(muzstarU*piU) )-bigthetaUU*(1-gammaU)*(nU-weUU)/gammaU;

//--Monetary Policy Rule--// 
// original:  log(ReXU)-log(ReXUU) - rhotilUU*(log(ReXU(-1)) -log(ReXUU)) -(1/ReXUU)*(1-rhotilUU)*piUU*( log(pitargetU) -log(piUU) ) - (1/ReXUU)*(1-rhotilUU)*aptilUU*piUU*(log(piU(+1)) - log(pitargetU)) - (1/(4*ReXUU))*(1-rhotilUU)*aytilUU*( cUU/( (cUU+iUU)/(1-etagUU) )*log(cU)+iUU/( (cUU+iUU)/(1-etagUU) )*log(iU)-iUU/( (cUU+iUU)/(1-etagUU) )*log(muupU)+gUU/( (cUU+iUU)/(1-etagUU) )*log(gU)  - (cUU/( (cUU+iUU)/(1-etagUU) )*log(cUU)+iUU/( (cUU+iUU)/(1-etagUU) )*log(iUU)+gUU/( (cUU+iUU)/(1-etagUU) )*log(gUU)) ) - (1/ReXUU)*(1-rhotilUU)*amtilUU*muzstarUU*piUU*( log(m3U)-log(m3U(-1))+log(muzstarU)+log(piU)  -log(muzstarUU*piUU) )  - (1/ReXUU)*(1-rhotilUU)*actilUU*muzstarUU*( log(btotU)-log(btotU(-1))+log(muzstarU)  -log(muzstarUU)) - (1/(400*ReXUU))*(e_xpU);
log(ReXU)-log(ReXUU) - rhotilUU*(log(ReXU(-1)) -log(ReXUU)) -(1/ReXUU)*(1-rhotilUU)*piUU*( log(pitargetU) -log(piUU) ) - (1/ReXUU)*(1-rhotilUU)*aptilUU*piUU*(log(piU(+1)) - log(pitargetU)) - (1/(4*ReXUU))*(1-rhotilUU)*aytilUU*( cUU/( (cUU+iUU)/(1-etagUU) )*log(cU)+iUU/( (cUU+iUU)/(1-etagUU) )*log(iU)-iUU/( (cUU+iUU)/(1-etagUU) )*log(muupU)+gUU/( (cUU+iUU)/(1-etagUU) )*log(gU)  - (cUU/( (cUU+iUU)/(1-etagUU) )*log(cUU)+iUU/( (cUU+iUU)/(1-etagUU) )*log(iUU)+gUU/( (cUU+iUU)/(1-etagUU) )*log(gUU)) )   - (1/(400*ReXUU))*(e_xpU);

//--Definitions--//
//Output
YU-( (pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * vlUU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) );
//Risk premium
PrU-( ( normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXU)*kbarU(-1)*qU(-1)/( kbarU(-1)*qU(-1)-nU(-1));
//Total Loans
BU -(kbarU(-1)*qU(-1)-nU(-1));


// Shock Equations
// Equations take the form: x = x_ *(1+e_x) + rho_x*(x(-1) - x_),
// where x_ is steady-state value, and e_x is iid shock with stderror std_x

lambdafU = lambdafUU* ( 1 + e_lambdafU) + rho1_lambdafU * ( lambdafU(-1) - lambdafUU );
pitargetU = pitargetUU* ( 1 + e_pitargetU) + rho1_pitargetU * ( pitargetU(-1) - pitargetUU );
muupU = muupUU* ( 1 + e_muupU) + rho1_muupU * ( muupU(-1) - muupUU );
gU = gUU* ( 1 + e_gU) + rho1_gU * ( gU(-1) - gUU );
muzstarU = muzstarUU* ( 1 + e_muzstarU) + rho1_muzstarU * ( muzstarU(-1) - muzstarUU );
gammaU = gammaUU* ( 1 + e_gammaU) + rho1_gammaU * ( gammaU(-1) - gammaUU );
epsilU = epsilUU* ( 1 + e_epsilU) + rho1_epsilU * ( epsilU(-1) - epsilUU );
sigmaU = sigmaUU* ( 1 + e_sigmaU) + rho1_sigmaU * ( sigmaU(-1) - sigmaUU );
zetacU = zetacUU;
zetaiU = zetaiUU* ( 1 + e_zetaiU) + rho1_zetaiU * ( zetaiU(-1) - zetaiUU );
tauoU = tauoUU* ( 1 + e_tauoU) + rho1_tauoU * ( tauoU(-1) - tauoUU );

end;

// Initial values, coinciding with steady-state values
initval;
piU = piUU;
sU = sUU;
rkU = rkUU;
iU = iUU;
uU = uUU;
omegabarU = omegabarUU;
RkXU = RkXUU;
nU = nUU;
qU = qUU;
//vlU = vlUU;
uzcU = uzcUU;
lambdazU = lambdazUU;
cU = cUU;
wU = wUU;
hU = hUU;
kbarU = kbarUU;
ReXU = ReXUU;
pstarU = pstarUU;
wstarU = wstarUU;
FpXU = FpXUU;
FwXU = FwXUU;
lambdafU = lambdafUU;
pitargetU = pitargetUU;
muupU = muupUU;
gU = gUU;
muzstarU = muzstarUU;
gammaU = gammaUU;
epsilU = epsilUU;
sigmaU = sigmaUU;
zetacU = zetacUU;
zetaiU = zetaiUU;
tauoU = tauoUU;
end;

shocks;
//var e_xpU; stderr std1_xpU; //stderr 0;
var e_xpU = 0.519^2;//
var e_lambdafU; stderr 0; //stderr std1_lambdafU; 
var e_pitargetU;stderr 0;// stderr std1_pitargetU;
var e_muupU; stderr 0;// stderr std1_muupU;
var e_gU; stderr 0;// stderr std1_gU;
var e_muzstarU; stderr 0;// stderr std1_muzstarU;
//var e_gammaU; stderr std1_gammaU;
var e_gammaU = 0.005^2;//size of the shock from baseline model
//var e_epsilU; stderr std1_epsilU;
var e_epsilU = 0.005^2;//size of the shock from baseline model
var e_sigmaU; stderr std1_sigmaU; 
//var e_sigmaU = 0.05^2;//size of the shock from baseline model
//var e_zetacU; stderr 0; //stderr std1_zetacU
var e_zetaiU; stderr std1_zetaiU;
//var e_zetaiU = 0.018^2;//size of the shock from baseline model
var e_tauoU; stderr 0;// stderr std1_tauoU;
end;

check;
steady(solve_algo=4);

//options_.loglinear=1;
stoch_simul(order=1,nocorr,nomoments,nograph,irf=20)YU qU cU iU hU ReXU piU nU PrU BU RkXU;// cU iU ReXU piU wU nU qU;


figure('color','w') 
//str=['CMR FA model,transitory technology shock'];
//suptitle(str);
 
subplot(5,1,1)
//YUU = 0.314587454676312 from SS_CMR
plot (1:20,YU_e_gammaU(1:20)/pp.YUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2); 
//title('output')
//ylabel('percent')//('% deviation from ss')
axis tight
 
subplot(5,1,2)
plot (1:20,iU_e_gammaU(1:20)/pp.iUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2); 
//title('investment')
//ylabel('percent')
axis tight
 
subplot(5,1,3)
plot(1:20,((1+ReXU_e_gammaU(1:20)).^4-1)*10000,'b-','LineWidth',2); hold on;
//ylabel('bp')
//title('interest rate, annual rate')
axis tight
 
subplot(5,1,4)
plot (1:20,nU_e_gammaU(1:20)/pp.nUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2);hold on;
//title('net worth')
//ylabel('percent')
axis tight
 
subplot(5,1,5)
plot (1:20,BU_e_gammaU(1:20)/pp.BUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2);hold on;
//title('total loans')
//ylabel('percent')
axis tight
 
figure('color','w') 
//str=['CMR FA model, transitory technology shock'];
//suptitle(str);

subplot(5,1,1)
plot (1:20,cU_e_gammaU(1:20)/pp.cUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2); 
//title('consumption')
//ylabel('percent')
axis tight

subplot(5,1,2)
plot (1:20,hU_e_gammaU(1:20)/pp.hUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2);hold on;
//title('hours worked')
//ylabel('percent')
axis tight

subplot(5,1,3)
plot (1:20,(piU_e_gammaU(1:20)/pp.piUU*100)*4,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2);hold on;
//ylabel('percent')
//title('inflation, annual')
axis tight

subplot(5,1,4)
plot(1:20,((1+PrU_e_gammaU(1:20)).^4-1)*10000,'b-','LineWidth',2); hold on;
//title('premium,annual rate')
//ylabel('bp')
axis tight

subplot(5,1,5)
plot(1:20,((1+RkXU_e_gammaU(1:20)).^4-1)*100,'b-','LineWidth',2); hold on;
//title('return on capital')
//ylabel('percent')
axis tight