/*
 * Aino 2.0 model
 * Copyright (C) 2016 Bank of Finland, Juha Kilponen and Fabio Verona

 * This file provides the file to simulate the model described in 
 * Kilponen, Orjasniemi, Ripatti and Verona, "The Aino 2.0 model",
 * Bank of Finland Research Discussion Paper No. 16 / 2016

 * First version:  20 May 2016 
 * Second version: 23 August 2019 (correct typos in Tobin's Q equation (equation A.2 in Appendix A) 
 *                                 and in the net wholesale loan rate (equation A.5 in Appendix A))  
 * This version:   19 November 2019 (correct typos in Wage Phillips curve equation (equation A.17 in Appendix A) 

 * The file "all_parameters_February2016.mat" contains the results of the Bayesian estimation of the model, which are needed to run the simulation
 * The code produces the impulse response functions following a temporary capital productivity shock (the blue line in figure 6 in the paper)
 * To obtain the impulse response functions following other shocks, just uncomment the respective line in the "shocks" block in the Dynare code

 * This file was originally written by Antti Ripatti 
 * and has been updated by Juha Kilponen and Fabio Verona 
 * It should work with Dynare 4.3.3 and Matlab 2012b and 2015b 
 * Please cite the source if you use the code.  

 * If you spot mistakes, please email us at 
 * juha.kilponen@bof.fi 
 * fabio.verona@bof.fi
 */


var psi	q iH cH rFI rEUR k wF y hF mcY pieY ds yC mC pC c pO iT yI mI pI
    rK yX mX mcX x pieX pX pieMC pieM tbY m pM ToT bstar astar  pieC pieI rs trY w h  mu lamK lamLT lamCY lamCM lamIY 
    upsilon upsilonMC upsilonX zetaCH zetaEUR lamW iG hG cGF wG pOILS mW pieW pieOILS epsX pRAWS pieRAWS
    rb nwe btot epsb lev_e by  RB kbank nuB epsKB bankprofits deposits bka rwage;
 
varexo epsMU epsLAMBDAK epsLAMBDALT epsLAMBDACY epsLAMBDACM epsLAMBDAIY epsUPSILON epsUPSILONMC epsUPSILONX epsZETACH epsLAMW
       epsZETAEUR epsdS epsIG epshG epsGF epsPOILS epsPRAWS epsMW epsPIEW epsXX epsEPSB epsnuB epsBankCapital epsrEUR;      	

parameters
    bC ssMU ssTAXWR ssRS ssRPOILS ssTAXCR bet delta lambdaW	rhoY deltaY ssLAMBDAK ssLAMBDALT ssTAXKR gamI sspieY phia
    xiW sigmaL ssHG ssTAXFR ssUPSILON ssUPSILONMC ssUPSILONMI ssUPSILONMX
    zeta theta deltaI  deltaC ssLAMBDACY rhoC ssLAMBDACM ssGCF gamCM  zetaMC 
    ssLAMBDAIY ssLAMBDAIM rhoI gamIM ssIG rhoX deltaX thetaX zetaX ssLAMBDAXY ssLAMBDAXM ssUPSILONF
    thetaMC omegaMC rhoMU rhoLAMBDAK rhoLAMBDALT rhoLAMBDACY rhoLAMBDACM 
    rhoLAMBDAIY rhoUPSILON rhoUPSILONMC   rhoUPSILONX rhoZETACH rhoZETAEUR rhoLAMW rhoiG rhohG rhocFG rhoPOILS rhoPRAWS rhomW rhopieW 
    rhodS rhoepsX omegaOIL omegaRAW rhorEUR RMCX sigmaW WEHE ssnuBank kappaB kappaKB rhoepsB rhoepsKB  BYSS_data  spread_data ;


pp=load('all_parameters_February2016');
for i=1:M_.param_nbr;
    name = deblank(M_.param_names(i,:));
    if isfield(pp,name);
       M_.params(i) = eval(['pp.' name]);
    end;
end;

seepsZETAEUR=pp.seepsZETAEUR; 
seepsZETACH=pp.seepsZETACH;
seepsLAMW=pp.seepsLAMW;
seepsMU=pp.seepsMU;
seepsUPSILON=pp.seepsUPSILON;
seepsLAMBDALT=pp.seepsLAMBDALT;
seepsLAMBDAK=pp.seepsLAMBDAK;
seepsLAMBDACY=pp.seepsLAMBDACY;
seepsLAMBDACM=pp.seepsLAMBDACM;
seepsLAMBDAIY=pp.seepsLAMBDAIY;
seepsUPSILONMC=pp.seepsUPSILONMC;
seepsUPSILONX=pp.seepsUPSILONX;
seepsXX=pp.seepsXX;
seepsGF=pp.seepsGF;
seepsIG=pp.seepsIG;
seepshG=pp.seepshG;
seepsdS=pp.seepsdS;
seepsPIEW=pp.seepsPIEW;
seepsMW=pp.seepsMW;
seepsPOILS=pp.seepsPOILS;
seepsPRAWS=pp.seepsPRAWS;
seepsBankCapital=pp.seepsBankCapital;
seepsEPSB=pp.seepsEPSB;
seepsrEUR=pp.seepsrEUR; 

model(linear);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%
%  Analytical deterministic non-linear steady-state                              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%

# ssR   = ssMU*sspieY/bet;
# RPOIL = ssRS*ssRPOILS; 
# RPMC  = ssUPSILONMC;  
# RPMI  = ssUPSILONMI;
# RPMX  = ssUPSILONMX;
# RPX   = ssUPSILONF*RMCX;
# RPZ   = (deltaC^(1/(1+rhoC))*(1/ssLAMBDACY)^(rhoC/(1+rhoC))+(1-deltaC)^(1/(1+rhoC))*(RPMC/ssLAMBDACM)^(rhoC/(1+rhoC)))^((1+rhoC)/rhoC);
# RPC   = RPZ; % NO OIL
# RPI   = (deltaI^(1/(1+rhoI))*(1/ssLAMBDAIY)^(rhoI/(1+rhoI))+(1-deltaI)^(1/(1+rhoI))*(RPMI/ssLAMBDAIM)^(rhoI/(1+rhoI)))^((1+rhoI)/rhoI);
# ssQ   = RPI/RPC;
# EPSBSS    = 1+400*(ssR-1)/spread_data;
# RBSS  = EPSBSS/(EPSBSS-1)*(ssR - 1);
# Xi    = ((1/(bet*sspieY))-delta*ssTAXKR-(1-delta)+RBSS/sspieY)/(1-ssTAXKR);
# RRK   = Xi*RPI/RPC;
# KsLF  = ssMU*ssLAMBDALT*(((((ssLAMBDAK^rhoY)*RRK*RPC*ssUPSILON/deltaY)^(-rhoY/(1+rhoY))-deltaY*ssLAMBDAK^(-rhoY)))/(1-deltaY))^(1/rhoY);
# YsLF  = (deltaY*(ssLAMBDAK*KsLF/ssMU)^(-rhoY)+(1-deltaY)*(ssLAMBDALT^(-rhoY)))^(-1/rhoY);
# sYCZ  = (deltaC^(1/(1+rhoC)))*(RPZ^(1/(1+rhoC)))*ssLAMBDACY^(-rhoC/(1+rhoC));
# sZCH  = 1;
# sYII  = (1-(1-deltaI)^(1/(1+rhoI))*(RPMI/(ssLAMBDAIM*RPI))^(rhoI/(1+rhoI)))^(-1/rhoI)*((deltaI)^(1/rhoI))*(1/ssLAMBDAIY);
# sYXX  = (1-(1-deltaX)^(1/(1+rhoX))*(RPMX/(ssLAMBDAXM*RMCX))^(rhoX/(1+rhoX)))^(-1/rhoX)*((deltaX)^(1/rhoX))*(1/ssLAMBDAXY);
# sMXX  = (((1-deltaX)*ssLAMBDAXM/RPMX)^(1/(1+rhoX))*RMCX^(1/(1+rhoX)))*(1/ssLAMBDAXM);
# sMCZ  = (1-deltaC)^(1/(1+rhoC))*((RPMC/RPZ)^(-1/(1+rhoC)))*(ssLAMBDACM^(-rhoC/(1+rhoC)));
# sMII  = (1-deltaI)^(1/(1+rhoI))*((RPMI/RPI)^(-1/(1+rhoI)))*(ssLAMBDAIM^(-rhoI/(1+rhoI)));
# sIK   = 1-((1-delta)/ssMU);
# A     = (lambdaW*RPC*(((deltaY/(1-deltaY))*(1+ssTAXCR)*(1+ssTAXFR)*(1-(bC/ssMU)))/(1-ssTAXWR))*((1/(1-ssHG))^sigmaL)*(ssMU^(1+rhoY)))*(1/Xi)*(ssLAMBDAK/ssLAMBDALT)^(-rhoY);
# EHF   = ((YsLF-(sYII+(sYXX*sMII/(1-sMXX)))*(sIK*KsLF/(1-ssIG)))/((sYCZ*sZCH+(ssGCF/(1-ssGCF))+(sYXX*sMCZ*sZCH/(1-sMXX)))*(1/A)*RPI*(KsLF^(rhoY+1))))^(-1/(1+sigmaL));
# ECH   = (1/A)*(EHF^(-sigmaL))*(KsLF^(1+rhoY))*RPI;
# ECGF  = (ssGCF/(1-ssGCF))*ECH;
# EC    = ECH + ECGF;
# ERWF  = ((1-deltaY)/deltaY)*((KsLF/ssMU)^(rhoY+1))*(RRK*RPC/(1+ssTAXFR))*((ssLAMBDALT/ssLAMBDAK)^(-rhoY)); 
# EK8   = KsLF*EHF; 
# EY    = (deltaY*(ssLAMBDAK*EK8/ssMU)^(-rhoY)+(1-deltaY)*((ssLAMBDALT*EHF)^(-rhoY)))^(-1/rhoY);
# EI    = (sIK/(1-ssIG))*EK8;
# EIG   = ssIG*EI;
# EI8   = sIK*EK8;
# EMI   = sMII*EI; 
# EYI   = sYII*EI;
# EZ    = sZCH*ECH;
# EMC   = sMCZ*sZCH*ECH;
# EYC   = sYCZ*sZCH*ECH+(ssGCF/(1-ssGCF))*ECH;
# EX    = (EMI+EMC)/(1-sMXX);
# EMX   = sMXX*EX;
# EYX   = sYXX*EX;
# sGY   = ( ssGCF*EC + ssIG*EI*RPI + (1+ssTAXFR)*(ssHG/(1-ssHG))*ERWF*EHF ) / EY;
# sTRy  = sGY - ( ssTAXCR*RPC*ECH + ((ssTAXWR+ssTAXFR)*ERWF*EHF/(1-ssHG)) + ssTAXKR*EK8*(RRK*RPC-delta*RPI)/ssMU ) / EY;
# TBy   = (EX-EMC-EMI-EMX)/EY; // this should be 0 !!!
# ssMCY = 1/ssUPSILON;
# ERWG  = ERWF;
# GAMMAESS  = (ssMU*sspieY*(EK8*RPC*ssQ-BYSS_data*EY-WEHE))/(sspieY*((1-ssTAXKR)*RRK/RPC + ssQ*(1-delta+delta*ssTAXKR-((1+RBSS)/sspieY)))*RPC*EK8+(1+RBSS)*(ssQ*RPC*EK8-BYSS_data*EY));
# NWSS          = (1/(1-GAMMAESS*(1+RBSS)/ssMU/sspieY)) * ( GAMMAESS*EK8*RPC/ssMU * ( (1-ssTAXKR)*RRK/RPC + ssQ*(1-delta+delta*ssTAXKR-((1+RBSS)/sspieY))) + WEHE );
# BTOTSS        = ssQ*RPC*EK8 - NWSS;
# deltaBank     = 1 - ssMU*sspieY + RBSS/ssnuBank*((1+ssnuBank*(EPSBSS-1))/(EPSBSS-1));
# KBankSS       = ssnuBank*BTOTSS;
# DepSS         = (1-ssnuBank)*BTOTSS;
# profitsBankSS = (RBSS*BTOTSS-(ssR-1)*DepSS)/ssMU/sspieY;
# LEVSS         = ssQ*RPC*EK8/NWSS;
# BYSS          = BTOTSS / EY;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Dynamic Equations, Banking Sector   %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Total loans
# b1_coef=ssQ*EK8*RPC/BTOTSS;
# b2_coef=NWSS/BTOTSS;
btot = b1_coef*(q + k + pC) - b2_coef*nwe;    

% Tobin's Q (FOC, capital stock), with the correction from August 2019 noted by the authors
q = 1/(1+bet*RBSS)*( bet*sspieY*(1-delta+delta*ssTAXKR)*q(+1) - bet*RBSS*rb + bet*sspieY/ssQ*(RRK*(1-ssTAXKR)*(rK(+1)- pC(+1)) ))
  + pieY(+1) + pC(+1) - pC ;

% Entrepreneur's net worth
# c1star = RRK*RPC*(1-ssTAXKR) + (1-delta+delta*ssTAXKR)*ssQ*RPC;  
# N1     = sspieY*NWSS*ssMU/GAMMAESS;
# N2     = sspieY*EK8*c1star - (1+RBSS)*EK8*ssQ*RPC;
# N3     = sspieY*EK8*RRK*RPC*(1-ssTAXKR);
# N4     = sspieY*EK8*ssQ*RPC*(1-delta+delta*ssTAXKR);
# N5     = -EK8*ssQ*RPC*(1+RBSS);
# N6     = NWSS*(1+RBSS);
# N7     = -RBSS*(EK8*ssQ*RPC-NWSS);
# N8     = sspieY*EK8*c1star - (NWSS-WEHE)*ssMU*sspieY/GAMMAESS;
# N9     = -(NWSS-WEHE)*ssMU*sspieY/GAMMAESS;
# N10    = sspieY*EK8*(delta*ssQ*RPC-RRK*RPC);
# N11    = N4;
# N12    = N5;

N1*nwe = N2*k(-1) + N3*rK + N4*q + N5*q(-1) + N6*nwe(-1) + N7*rb(-1) + N8*pieY + N9*mu + N11*pC + N12*pC(-1); 

% Net interest rate on loans, complete model
rb = (kappaB/(EPSBSS-1+(1+bet)*kappaB))*rb(-1) + (bet*kappaB/(EPSBSS-1+(1+bet)*kappaB))*rb(+1)
    + ((EPSBSS-1)/(EPSBSS-1+(1+bet)*kappaB))*RB-(epsb/(EPSBSS-1+(1+bet)*kappaB));

% Net wholesale loan rate, with the correction from August 2019 noted by the authors
RB = rFI - (kappaKB/(ssR-1)*(ssnuBank^3))*(kbank - btot - nuB);

% Bank capital
kbank = (1-deltaBank)/ssMU/sspieY*(kbank(-1) - pieY - mu - epsKB) + (1-(1-deltaBank)/ssMU/sspieY)*bankprofits;

% Bank profits
bankprofits = RBSS/(RBSS-(ssR-1)*(1-ssnuBank))*(rb(-1)+btot(-1)) 
              -(ssR-1)*(1-ssnuBank)/(RBSS-(ssR-1)*(1-ssnuBank))*(rFI(-1)+deposits(-1))
              - pieY - mu;

% Bank balance sheet
btot = (1-ssnuBank)*deposits + ssnuBank*kbank;

% Bank capital-to-asset ratio
bka = kbank - btot;

% Entrepreneur leverage
lev_e = q + k + pC - nwe;  

% Credit-to-output ratio
by = btot - y; 

%%%%%%%%%%%%%%%%%%%%%%%%%
% Households %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

% Private Consumption, Lagrange multiplier 
psi = -(1/(1-bC/ssMU))*(cH-(bC/ssMU)*cH(-1)) - ((bC/ssMU)/(1-bC/ssMU))*mu+zetaCH;
      
% Investment equation
iH = (1/(1+bet))*(bet*iH(+1)+iH(-1))-(1/(gamI*ssMU^2*(1+bet)))*(pI-pC-q)+(1/(1+bet))*(bet*mu(+1)-mu);

%  Consumption equation (FOC, holdings of domestic bonds & FOC, private consumption)
cH=(bC/ssMU)/(1+bC/ssMU)*cH(-1)+(1/(1+bC/ssMU))*cH(+1)
    +(1/(1+bC/ssMU))*(mu(+1)-(bC/ssMU)*mu)
    -((1-bC/ssMU)/(1+bC/ssMU))*(rFI-pieC(+1))                              
    -((1-bC/ssMU)/(1+bC/ssMU))*(zetaCH(+1)-zetaCH);

% Interest rate
rFI-rEUR = -phia*astar + zetaEUR; 
   
%  Capital accumulation equation
k =((1-delta)/ssMU)*(k(-1)-mu)+(1-(1-delta)/ssMU)*(iH);

%   Wage setting (FOC, Household labour supply); typo corrected in November 2019                 
# calcoef=(1-xiW)*(1-bet*xiW)/(xiW*(1+bet)*(1-(sigmaL*(1-ssHG)*(lambdaW/(1-lambdaW)))));    

wF-pC=(1/(1+bet))*(wF(-1)-pC(-1))
      -(1/(1+bet))*(pC-pC(-1)+pieY-pieY(-1))+(bet/(1+bet))*(pC(+1)-pC+pieY(+1)-pieY)
      +(bet/(1+bet))*(wF(+1)-pC(+1))
      +calcoef*(sigmaL*((1-ssHG)*hF+ssHG*hG)-psi+lamW)
      -calcoef*wF
      +calcoef*pC;

rwage = wF-pC;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Domestic intermediate goods producer %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#sigmaY=1/(1+rhoY);
#alphaK=RRK*RPC*EK8/(EY*ssMCY*ssMU); 
#alphal=(1+ssTAXFR)*ERWF*EHF/(EY*ssMCY);  

% Combined first order condition for labour and capital
sigmaY*rK=mu+hF+sigmaY*(wF+rhoY*(lamLT-lamK))-k(-1);
    
% Real marginal costs
mcY=alphaK*(rK-lamK)+alphal*(wF-lamLT);
 
% Production function
y=alphaK*(lamK+k(-1)-mu)+alphal*(lamLT+hF);
    
% Domestic intermediate good inflation
pieY=(theta/(1+bet*theta))*(pieY(-1))
     +(bet/(1+theta*bet))*pieY(+1)
     +((1-zeta)*(1-zeta*bet)/(zeta*(1+bet*theta)))*(mcY+upsilon);

% Aggregate nominal resource constraint
y*EY = RPC*ECH*(pC+cH)+ECGF*cGF+RPI*(EI8+EIG)*pI+(RPI*EI8)*iH+(RPI*EIG)*iG+(ssRS*RPX*EX)*(pX+x+rs)-RPMC*EMC*(pM+mC)-RPMI*EMI*(pM+mI)-RPMX*EMX*(pM+mX) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Consumption goods retailer   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# sigmaC=1/(1+rhoC);

% Conditional demand for domestic intermediate consumption good
yC*EYC=(sYCZ/RPZ)*EZ*(cH-sigmaC*(rhoC*lamCY-pC))+ECGF*cGF;

% Conditional demand for imported intermediate consumption good
mC=(sigmaC*gamCM/(1+sigmaC*gamCM))*(mC(-1)+cH-cH(-1))
   -(sigmaC/(1+sigmaC*gamCM))*(pM-pC)
   -(sigmaC*rhoC/(1+sigmaC*gamCM))*lamCM + (1/(1+sigmaC*gamCM))*cH;

% Import prices of oil based consumption goods (NOT USED)
RPOIL*pO=ssRS*ssRPOILS*(rs+pOILS);
 
% Import prices of non-oil based consumption goods
pC=-(sYCZ/RPZ)*lamCY+sMCZ*(RPMC/RPZ)*(pM-lamCM+gamCM*((mC-cH)-(mC(-1)-cH(-1))));

% Total consumption
c = (1-ssGCF)*cH + ssGCF*cGF;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Investment goods retailer %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# sigmaI=1/(1+rhoI);

% Demand for domestic intermediate investment good
yI=iT+sigmaI*(pI-rhoI*lamIY);

% Demand for imported intermediate investment good
mI=(sigmaI*gamIM/(1+sigmaI*gamIM))*(mI(-1)+iT-iT(-1))
   -(sigmaI/(1+sigmaI*gamIM))*(pM-pI)
   -(sigmaI*rhoI/(1+sigmaI*gamIM))*lamCM + (1/(1+sigmaI*gamIM))*iT;

% Price of investment goods
pI=-(sYII/RPI)*lamIY+sMII*(RPMI/RPI)*(pM-lamCM+gamIM*((mI-iT)-(mI(-1)-iT(-1))));

% Investment identity
iT = (1-ssIG)*iH + ssIG*iG;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% Export markets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# sigmaX=1/(1+rhoX);
    
% Demand for domestic intermediate good
   yX=x+sigmaX*(mcX);

% Demand for imported intermediate good
mX=x+sigmaX*(mcX-pM-rhoX*lamCM);

% Exporters' marginal costs
mcX=sMXX*(RPMX/RMCX)*(pM-lamCM); 

% Export demand 
x = -sigmaW*(pX) + mW + epsX; 

% Export price inflation
pieX = (thetaX/(1+bet*thetaX))*(pieX(-1))+(bet/(1+thetaX*bet))*pieX(+1)
       +((1-zetaX)*(1-zetaX*bet)/(zetaX*(1+bet*thetaX)))*(mcX-pX-rs+upsilonX);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Import goods' inflation  %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pieMC=(thetaMC/(1+bet*thetaMC))*(pieMC(-1))+(bet/(1+thetaMC*bet))*pieMC(+1)
          +((1-zetaMC)*(1-zetaMC*bet)/(zetaMC*(1+bet*thetaMC)))*(rs-pM+omegaOIL*pOILS+omegaRAW*pRAWS+upsilonMC)
          + ((1-omegaMC)/(1+bet*thetaMC))*(ds-bet*ds(+1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Foreign Trade related quantities  %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Trade balance per output
tbY=(RPX*ssRS*EX/EY)*(pX+rs+x-y)-(RPMC*EMC/EY)*(pM+mC-y)-(RPMI*EMI/EY)*(pM+mI-y)-(RPMX*EMX/EY)*(pM+mX-y);

% Terms of Trade
ToT = rs + pX - pM;

% Total imports
m = (RPMC*EMC/(ssRS*RPX*EX))*mC+(RPMI*EMI/(ssRS*RPX*EX))*mI+(RPMX*EMX/(ssRS*RPX*EX))*mX;
   
% Net Foreign Assets
bstar = +(RPX*EX*ssRS)*(pX+rs+x)-RPMC*EMC*(pM+mC)-RPMI*EMI*(pM+mI)-RPMX*EMX*(pM+mX)+(ssR/(sspieY*ssMU))*bstar(-1);

% Net foreign assets per Output
astar=bstar/EY-y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Relative prices, rates of inflation and real exhange rate  %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pC=pC(-1)+pieC-pieY;  
pX=pX(-1)+pieX-pieW;      % Note that definition of pX is in terms of pieW!
pI=pI(-1)+pieI-pieY;
pM=pM(-1)+pieM-pieY;
pM=pM(-1)+pieMC-pieY;
rs=rs(-1)+ds+pieW-pieY;
pOILS=pOILS(-1)+pieOILS-pieY; 
pRAWS=pRAWS(-1)+pieRAWS-pieY; 
   
% Public sector budget constraint

(ECGF/EY)*(cGF-y)+(RPI*EIG/EY)*(pI+iG-y)+(1-ssTAXWR)*(ERWG*(ssHG/(1-ssHG))*EHF/EY)*(wG+hG-y)
=(RPC*ECH/EY)*(ssTAXCR*(pC+cH-y))
+(ERWF*EHF/EY)*((ssTAXWR+ssTAXFR)*(wF+hF-y))
+((1/ssMU)*EK8*(RRK*RPC-delta*RPI)/EY)*(ssTAXKR*(-mu+k(-1)-y+((RRK*RPC)/(RRK*RPC-delta*RPI))*rK-((delta*RPI)/(RRK*RPC-delta*RPI))*pI))
+sTRy*trY;

% Average (production) wage
w = ssHG*wG+(1-ssHG)*wF;                 
wG = wF;

% Total hours
h = ssHG*hG+(1-ssHG)*hF;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Shocks and exogenous processess   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Markup at banking sector
epsb = rhoepsB*epsb(-1) + epsEPSB; 

% Bank capital requirement           
nuB =  epsnuB;
  
% Bank capital            
epsKB = rhoepsKB*epsKB(-1) + epsBankCapital; 

% Intermediate goods' technology
mu = rhoMU*mu(-1) + epsMU;
lamK = rhoLAMBDAK*lamK(-1)    + epsLAMBDAK;
lamLT = rhoLAMBDALT*lamLT(-1) + epsLAMBDALT;
 
% Consumption goods' technology
lamCY = rhoLAMBDACY*lamCY(-1) + epsLAMBDACY;
lamCM = rhoLAMBDACM*lamCM(-1) + epsLAMBDACM;

% Investment goods' technology
lamIY = rhoLAMBDAIY*lamIY(-1) + epsLAMBDAIY;

% Markup shocks
upsilon   = rhoUPSILON*upsilon(-1) + epsUPSILON;
upsilonMC = rhoUPSILONMC*upsilonMC(-1) + epsUPSILONMC;
upsilonX  = rhoUPSILONX*upsilonX(-1)   + epsUPSILONX;
	
% Consumption preference shock
zetaCH=rhoZETACH*zetaCH(-1)+epsZETACH;

% Domestic risk premium shock
zetaEUR=rhoZETAEUR*zetaEUR(-1)+epsZETAEUR;

% Euro area interest rate 
rEUR=rhorEUR*rEUR(-1)+epsrEUR;

% Labour supply shocks
lamW=rhoLAMW*lamW(-1)+epsLAMW;
  
% Export share shock
epsX=rhoepsX*epsX(-1)+epsXX;

% Exogenous fiscal variables 
iG=rhoiG*iG(-1)+epsIG;
hG=rhohG*hG(-1)+epshG;
cGF=rhocFG*cGF(-1)+epsGF;

% Oil price shock 
pOILS = rhoPOILS*pOILS(-1)+epsPOILS;

% Foreign export demand shock
mW = rhomW*mW(-1)+epsMW ;

% Foreign inflation shock
pieW = rhopieW*pieW(-1)+epsPIEW ;

% Relative prices of raw materials
pRAWS = rhoPRAWS*pRAWS(-1) + epsPRAWS;

%   Trade weighted nominal exchange rate (log change), FIN weights, exogenous
ds=rhodS*ds(-1)+epsdS;

end;
    
steady(solve_algo = 1);
check;
resid(1);

shocks;
%var	epsZETAEUR; 	stderr seepsZETAEUR; 
%var	epsZETACH;  	stderr seepsZETACH;
%var	epsLAMW;    	stderr seepsLAMW;
%var	epsMU;  	    stderr seepsMU;
%var	epsUPSILON; 	stderr seepsUPSILON;
%var	epsLAMBDALT;    stderr seepsLAMBDALT;
var	epsLAMBDAK;         stderr seepsLAMBDAK;
%var	epsLAMBDACY;    stderr seepsLAMBDACY;
%var	epsLAMBDACM;    stderr seepsLAMBDACM;
%var	epsLAMBDAIY;    stderr seepsLAMBDAIY;
%var	epsUPSILONMC;   stderr seepsUPSILONMC;
%var	epsUPSILONX;    stderr seepsUPSILONX;
%var	epsXX;  	    stderr seepsXX;
%var	epsGF;  	    stderr seepsGF;
%var	epsIG;  	    stderr seepsIG;
%var	epshG;  	    stderr seepshG;
%var	epsdS;          stderr seepsdS;
%var	epsPIEW;    	stderr seepsPIEW;
%var	epsMW;          stderr seepsMW;
%var	epsPOILS;       stderr seepsPOILS;
%var	epsPRAWS;       stderr seepsPRAWS;
%var    epsBankCapital; stderr seepsBankCapital;
%var    epsEPSB;        stderr seepsEPSB;
var	epsrEUR;    	stderr seepsrEUR; 
end;

stoch_simul(order=1,irf=20,nograph, noprint) y cH iH x m tbY rK rwage mcY hF ToT pieY rb btot bka nwe q rs rEUR;


