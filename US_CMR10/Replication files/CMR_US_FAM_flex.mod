//CMR 2010-Financial Accelerator Model (FAM)

// Based on code by Fabio Verona (Original: Christiano web site)

//---Flexible price equilibrium---

// Endogenous Variables
var piflexU, sflexU, rkflexU, iflexU, uflexU, omegabarflexU, RkXflexU, nflexU, qflexU, 
uzcflexU, lambdazflexU, cflexU, wflexU, hflexU, kbarflexU, ReXflexU, pstarflexU, wstarflexU,
FpXflexU, FwXflexU,YflexU, PrflexU,BflexU
      lambdafU, pitargetU, muupU, gU, muzstarU, gammaU, epsilU, sigmaU, zetacU, zetaiU, tauoU;//shocks

// Exogenous Variables
varexo e_xpU e_lambdafU, e_pitargetU, e_muupU, e_gU, e_muzstarU, e_gammaU, e_epsilU, e_sigmaU,  e_zetaiU, e_tauoU;

// Steady-state values:
parameters piflexUU, sflexUU, rkflexUU, iflexUU, uflexUU, omegabarflexUU, RkXflexUU, nflexUU,
qflexUU, uzcflexUU, lambdazflexUU, cflexUU, wflexUU, hflexUU, kbarflexUU, ReXflexUU, pstarflexUU,
wstarflexUU, FpXflexUU, FwXflexUU, YflexUU, PrflexUU, BflexUU, 
lambdafUU, pitargetUU, muupUU, gUU, muzstarUU, gammaUU, epsilUU, sigmaUU, zetacUU, zetaiUU, tauoUU;

parameters rho1_lambdafU, rho1_pitargetU, rho1_muupU, rho1_gU, rho1_muzstarU, rho1_gammaU, rho1_epsilU, rho1_sigmaU,  rho1_zetaiU, rho1_tauoU;

parameters std1_xpU, std1_lambdafU, std1_pitargetU, std1_muupU, std1_gU, std1_muzstarU, std1_gammaU, std1_epsilU, std1_sigmaU,  std1_zetaiU, std1_tauoU;

//PARAMETERS

parameters lambdawUU, sigmaLXUU, betaUU, bUU,
      psiLXUU, iotaw1UU, iotamuUU, muUU, weUU, bigthetaUU, sigmaaUU, SdouprXUU, zetaUU, 
      upsilUU, alphaUU, deltaUU, iota1UU, etagUU,
      taukUU, taulUU, taucUU, taudUU, aptilUU, aytilUU, actilUU, rhotilUU,
      phiUU, pibarUU, nbeta, vlUU;


pp=load('ss_parameters_US_FAM.mat');
for i=1:M_.param_nbr;
    name = deblank(M_.param_names(i,:));
    if isfield(pp,name);
       M_.params(i) = eval(['pp.' name]);
    end;
end;


pp=load('ss_parameters_US_FAM_flex.mat');
for i=1:M_.param_nbr;
    name = deblank(M_.param_names(i,:));
    if isfield(pp,name);
       M_.params(i) = eval(['pp.' name]);
    end;
end;

nbeta= betaUU;

model;

// Model equations

//--Goods Producers--//
//Marginal cost (eq A.1)
-sflexU+((1-alphaUU)^(alphaUU-1)*alphaUU^(-alphaUU))*(rkflexU^alphaUU)*(wflexU^(1-alphaUU))/epsilU;

//Another measure of marginal cost (eq. A2)
rkflexU/( alphaUU*epsilU*( (upsilUU*muzstarU*( hflexU*(wstarflexU ^ (lambdawUU/(lambdawUU-1)) ) )/(uflexU*kbarflexU(-1)))^(1-alphaUU) ) )-sflexU;

//--Capital Producers--//
//Supply of capital (eq. A.7)
lambdazflexU*zetacU*qflexU*( -( ( sqrt(SdouprXUU/2) )*exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))-( sqrt(SdouprXUU/2) )*exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU)) )*( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )+1-( exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))+exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))-2 ) )-(lambdazflexU/muupU)*zetacU+betaUU*zetacU(+1)*lambdazflexU(+1)*qflexU(+1)*( ( ( sqrt(SdouprXUU/2) )*exp(( sqrt(SdouprXUU/2) )*(( zetaiU(+1)*iflexU(+1)*muzstarU(+1)*upsilUU/iflexU )-muzstarUU*upsilUU))-( sqrt(SdouprXUU/2) )*exp(-( sqrt(SdouprXUU/2) )*(( zetaiU(+1)*iflexU(+1)*muzstarU(+1)*upsilUU/iflexU )-muzstarUU*upsilUU)) )*(( zetaiU(+1)*iflexU(+1)*muzstarU(+1)*upsilUU/iflexU )^2) )/(muzstarU(+1)*upsilUU);

//Capital accumulation (eq. A.8)
kbarflexU-(1-deltaUU)*(kbarflexU(-1)/(muzstarU*upsilUU))-(1-( exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))+exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))-2 ))*iflexU;

//--Entrepreneurs--//
//Capital utilization (eq. A.9)
rkflexU - tauoU*rkflexUU*exp(sigmaaUU*(uflexU-1));

//Debt contract offered to entrepreneurs (eq. A.11)
(1-( normcdf(( (log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU )-sigmaU)+omegabarflexU(+1)*(1-normcdf(( (log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU ))) ))*( (1+RkXflexU(+1))/(1+ReXflexU) )+( (1-( normcdf((log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU) ))/(1-( normcdf((log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU) )-muUU*omegabarflexU(+1)*( normpdf((log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU)/omegabarflexU(+1)/sigmaU )) )*(( (1+RkXflexU(+1))/(1+ReXflexU) )*( (1-muUU)*normcdf(( (log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU )-sigmaU)+omegabarflexU(+1)*(1-normcdf(( (log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU ))) )-1);

//Zero profit condition for banks on entrepreneurial loans (eq. A.12)
(qflexU(-1)*kbarflexU(-1)*(1+RkXflexU)*( (1-muUU)*normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )/(nflexU(-1)*(1+ReXflexU(-1))))-(qflexU(-1)*kbarflexU(-1)/nflexU(-1))+1;

//Law of motion of net worth (eq. A.13)
-nflexU+(gammaU/(piflexU*muzstarU))*(RkXflexU-ReXflexU(-1)-( ( normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXflexU))*kbarflexU(-1)*qflexU(-1)+weUU+gammaU*(1+ReXflexU(-1))*nflexU(-1)/(piflexU*muzstarU);

//Rate of return on capital (eq. A.10) 
RkXflexU - ( ( (1-taukUU)*(uflexU*rkflexU-tauoU*( rkflexUU*(exp(sigmaaUU*(uflexU-1))-1)/sigmaaUU ))+(1-deltaUU)*qflexU)*piflexU/(upsilUU*qflexU(-1)) + taukUU*deltaUU - 1);

//--Households--//
//Marginal utility of consumption (eq. A.19)
uzcflexU-(muzstarU*zetacU/(cflexU*muzstarU-bUU*cflexU(-1)))+bUU*betaUU*zetacU(+1)/(cflexU(+1)*muzstarU(+1)-bUU*cflexU);

//Consumption decision (eq A.20)
uzcflexU-zetacU*(1+taucUU)*lambdazflexU;

//Intertemporal efficiency of time deposit (eq A.24)
-zetacU*lambdazflexU+(betaUU*zetacU(+1)*lambdazflexU(+1)/(muzstarU(+1)*piflexU(+1)))*(1+(1-taudUU)*ReXflexU);


//Conditions associated with Calvo sticky prices
//(eq A.3)
pstarflexU - 1;
//(eq A.4)
zetacU*lambdazflexU*YflexU - FpXflexU;
//(eq A.5) 
zetacU*lambdafU*lambdazflexU*YflexU*sflexU - FpXflexU;

//Conditions associated with Calvo sticky wages
//(eq A.21)
wstarflexU - 1;
//(eq A.22)
zetacU*((wstarflexU^(lambdawUU/(lambdawUU-1)))*hflexU*(1-taulUU)*lambdazflexU/lambdawUU)- FwXflexU;
//(eq A.23)
zetacU*((wstarflexU^(lambdawUU/(lambdawUU-1))*hflexU)^(1+sigmaLXUU))*zetaUU - wflexU * FwXflexU/psiLXUU;
 
//--Resource constraint--// (eq A.30)
//( (pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * vlUU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) )-gU-cU-iflexU/muupU-tauoU*( rkflexUU*(exp(sigmaaUU*(uU-1))-1)/sigmaaUU )*kbarU(-1)/(muzstarU*upsilUU)-( ( ( normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXU)*qU(-1)*kbarU(-1)/(muzstarU*piflexU) )-bigthetaUU*(1-gammaU)*(nU-weUU)/gammaU;
YflexU-gU-cflexU-iflexU/muupU-tauoU*( rkflexUU*(exp(sigmaaUU*(uflexU-1))-1)/sigmaaUU )*kbarflexU(-1)/(muzstarU*upsilUU)-( ( ( normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXflexU)*qflexU(-1)*kbarflexU(-1)/(muzstarU*piflexU) )-bigthetaUU*(1-gammaU)*(nflexU-weUU)/gammaU;

//--Monetary Policy Rule--// 
// original:  log(ReXU)-log(ReXflexUU) - rhotilUU*(log(ReXU(-1)) -log(ReXflexUU)) -(1/ReXflexUU)*(1-rhotilUU)*piflexUU*( log(pitargetU) -log(piflexUU) ) - (1/ReXflexUU)*(1-rhotilUU)*aptilUU*piflexUU*(log(piflexU(+1)) - log(pitargetU)) - (1/(4*ReXflexUU))*(1-rhotilUU)*aytilUU*( cflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(cU)+iflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(iflexU)-iflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(muupU)+gUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(gU)  - (cflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(cflexUU)+iflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(iflexUU)+gUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(gUU)) ) - (1/ReXflexUU)*(1-rhotilUU)*amtilUU*muzstarUU*piflexUU*( log(m3U)-log(m3U(-1))+log(muzstarU)+log(piflexU)  -log(muzstarUU*piflexUU) )  - (1/ReXflexUU)*(1-rhotilUU)*actilUU*muzstarUU*( log(btotU)-log(btotU(-1))+log(muzstarU)  -log(muzstarUU)) - (1/(400*ReXflexUU))*(e_xpU);
log(ReXflexU)-log(ReXflexUU) - rhotilUU*(log(ReXflexU(-1)) -log(ReXflexUU)) -(1/ReXflexUU)*(1-rhotilUU)*piflexUU*( log(pitargetU) -log(piflexUU) ) - (1/ReXflexUU)*(1-rhotilUU)*aptilUU*piflexUU*(log(piflexU(+1)) - log(pitargetU)) - (1/(4*ReXflexUU))*(1-rhotilUU)*aytilUU*( cflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(cflexU)+iflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(iflexU)-iflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(muupU)+gUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(gU)  - (cflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(cflexUU)+iflexUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(iflexUU)+gUU/( (cflexUU+iflexUU)/(1-etagUU) )*log(gUU)) )   - (1/(400*ReXflexUU))*(e_xpU);

//--Definitions--//
//Output
YflexU-( (pstarflexU^(lambdafU/(lambdafU-1))) * ( epsilU * vlUU * ( (uflexU*kbarflexU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hflexU*(wstarflexU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) );
//Risk premium
PrflexU-( ( normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXflexU)*kbarflexU(-1)*qflexU(-1)/( kbarflexU(-1)*qflexU(-1)-nflexU(-1));
//Total Loans
BflexU -(kbarflexU(-1)*qflexU(-1)-nflexU(-1));


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
piflexU = piflexUU;
sflexU = sflexUU;
rkflexU = rkflexUU;
iflexU = iflexUU;
uflexU = uflexUU;
omegabarflexU = omegabarflexUU;
RkXflexU = RkXflexUU;
nflexU = nflexUU;
qflexU = qflexUU;
uzcflexU = uzcflexUU;
lambdazflexU = lambdazflexUU;
cflexU = cflexUU;
wflexU = wflexUU;
hflexU = hflexUU;
kbarflexU = kbarflexUU;
ReXflexU = ReXflexUU;
pstarflexU = pstarflexUU;
wstarflexU = wstarflexUU;
FpXflexU = FpXflexUU;
FwXflexU = FwXflexUU;
YflexU = YflexUU;
PrflexU = PrflexUU;
BflexU = BflexUU;
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
var e_xpU = 0.52^2;//size of the shock from baseline model
var e_lambdafU; stderr 0; //stderr std1_lambdafU; // 
var e_pitargetU;stderr 0;// stderr std1_pitargetU;
var e_muupU; stderr 0;// stderr std1_muupU;
var e_gU; stderr 0;// stderr std1_gU;
var e_muzstarU; stderr 0;// stderr std1_muzstarU;
var e_gammaU; stderr std1_gammaU;
//var e_gammaU = 0.005^2;//size of the shock from baseline model
//var e_epsilU; stderr std1_epsilU;
var e_epsilU = 0.005^2;//size of the shock from baseline model
var e_sigmaU; stderr std1_sigmaU; 
//var e_sigmaU = 0.05^2;//size of the shock from baseline model
//var e_zetacU; stderr 0; //stderr std1_zetacU
//var e_zetaiU; stderr std1_zetaiU;
var e_zetaiU = 0.018^2;//size of the shock from baseline model
var e_tauoU; stderr 0;// stderr std1_tauoU;
end;

check;
steady(solve_algo=4);

//options_.loglinear=1;
stoch_simul(order=1,nocorr,nomoments,nograph,irf=20)YflexU qflexU cflexU iflexU hflexU ReXflexU piflexU nflexU PrflexU BflexU RkXflexU;// cU iU ReXU piU wU nU qU;


figure('color','w') 
str=['CMR FA model, marginal efficiency of investment shock'];
suptitle(str);
 
subplot(5,2,1)
//YUU = 0.314587454676312 from SS_CMR
plot (1:20,YflexU_e_epsilU(1:20)/pp.YflexUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2); 
title('output')
ylabel('percent')//('% deviation from ss')
axis tight
 
subplot(5,2,2)
plot (1:20,cflexU_e_epsilU(1:20)/pp.cflexUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2); 
title('consumption')
//axis([-.05 -.25])
ylabel('percent')
axis tight
 
subplot(5,2,3)
plot (1:20,iflexU_e_epsilU(1:20)/pp.iflexUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2); 
title('investment')
ylabel('percent')
axis tight
 
subplot(5,2,4)
plot (1:20,hflexU_e_epsilU(1:20)/pp.hflexUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2);hold on;
title('hours worked')
ylabel('percent')
axis tight
 
subplot(5,2,5)
plot(1:20,((1+ReXflexU_e_epsilU(1:20)).^4-1)*10000,'b-','LineWidth',2); hold on;
ylabel('bp')
title('interest rate, annual rate')
axis tight
 
subplot(5,2,6)
plot (1:20,(piflexU_e_epsilU(1:20)/pp.piflexUU*100)*4,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2);hold on;
ylabel('percent')
title('inflation, annual')
axis tight
 
subplot(5,2,7)
plot (1:20,nflexU_e_epsilU(1:20)/pp.nflexUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2);hold on;
title('net worth')
ylabel('percent')
axis tight
 
subplot(5,2,8)
plot(1:20,((1+PrflexU_e_epsilU(1:20)).^4-1)*10000,'b-','LineWidth',2); hold on;
title('premium,annual rate')
ylabel('bp')
axis tight
 
subplot(5,2,9)
plot (1:20,BflexU_e_epsilU(1:20)/pp.BflexUU*100,'b-',1:20,zeros(size(1:20)),'k-.','LineWidth',2);hold on;
title('total loans')
ylabel('percent')
axis tight
 
subplot(5,2,10)
plot(1:20,((1+RkXflexU_e_epsilU(1:20)).^4-1)*100,'b-','LineWidth',2); hold on;
title('return on capital')
ylabel('percent')
axis tight

