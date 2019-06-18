%Medium-sized model of Christiano, Eichenbaum and Trabandt (2015)       
%'Understanding the Great Recession', American Economic Journal:        
%Macroeconomics, forthcoming                                            

%This code employs the parameter estimates that match the IRFs of the model and the VAR to a monetary policy shock 

%Notes on model implementation
%Wanted: monetary policy shock is not in period t information set of agents 
%(just as in VAR identified with Choleski decomp.) 
%All other shocks are in period t information set. 

%Solution: create two parallel economies which are structually identical. One which is 
%subject to the monetary shock only. This shock is not in period t info set. 
%The other economy has the other shocks with the standard info set.

%variables ending with 'F' are in the economy with full info set
%variables ending with 'R' are in the restricted info set economy
%variables ending with 'AGG' are aggregated variables from both economies

%Note that in the 'R' economy, all exogenous variables are set to their steady states, except the monetary shock
%likewise, in the 'F' economy, the monetary shock is set to zero while all other shocks are active

%Note that both steady states (i.e. 'R' and 'F' economy) are identical

%All Variables in logs.
 

var 
% Endogenous variables (R economy)
lambda_CR cR RR piR iR pkR FR KR ukR wR kststR lR xR varthetR DispR yR JR UR GDPR 
fR vR unempR VR A_R vTotR QR wpR varthetpR eR NR LR cHR UcHR plR LcalR nGR

% Endogenous variables (F economy)
lambda_CF cF RF piF iF pkF FF KF ukF wF kststF lF xF varthetF DispF yF JF UF GDPF 
fF vF unempF VF AF vTotF QF wpF varthetpF eF NF LF cHF UcHF plF LcalF
% for F economy: terms for exogenous technology processes and annual inflation 
muzF mupsiF muF nGF pi4F 

% Endogenous variables (AGG economy)
GDPAGG piAGG RAGG ukAGG lAGG wAGG cAGG 
iAGG unempAGG vTotAGG fAGG pinvestAGG LAGG; 

%Shocks
varexo epsR_eps muz_eps mupsi_eps;

parameters 
u L s rho Q sigma recSHAREpercent DSHARE M phiL elasttarget
xi pibar kappaf varkappaf pibreve lambda nuf alfa deltak Spp sigmaa
betta b rhoR rpi rdeltay G_over_Y thetaG profits
sig_mupsi sig_epsR sig_muz sigmuzTPratio sigmuzT rhomupsi rhomuz rhomuzT
chi delta mu mupsi muz nG nKAP nD nGAM nL nH uk S Sprime Fcal
Fcalprime m l R pk Rk 
sigmab pitilde mc Disp kl varthet y k phi i c g GDP
x f v sigmam kappa J varthetp wp w D e unemp_stst vTot_stst cH
alp1 alp2 alp3 alp4 omega lambda_C UcH gamma F K U N A V pl
sig_eta theta1 theta2;   

deltak=0.025;   %depreciation rate of capital
betta=0.996773254690569;    %discount factor households; implies 3% real rate
rho=0.9;                %job survival rate
M=60;                   %Maximum ststgaining rounds per quarter, needs to be an even number!!!!
elasttarget=3;          %CES parameter market and home consumption ( (1-b)/(1-chi) is elasticity of substition)
                        %choose chi such that elasttarget is hit. see cet_steadystate.m                     
pibar=1.005;            %inflation rate, gross, quarterly
mu=exp(1.7/100/4);      %growth rate of real GDP
mupsi=exp(2.9/100/4)/mu;%growth rate of investment
profits=0;
Q=0.7;                  %vacancy filling rate
u=0.055;                %unemp. rate
L=0.67;                 %Labor force 
G_over_Y=0.2;           %Government spending-to-output in ss

%Table 2 posterior means  
xi=0.7545;      %Calvo prices
lambda=1.3639;  %steady state price markup
nuf=0.5619;     %working capital fraction
rhoR=0.7503;    %Interest rate smoothing
rpi=1.6663;     %Coefficient on inflation
rdeltay=0.2471; %Coefficient on GDP growth rate
b=0.8992;       %habit formation in consumption
sigmaa=0.0530;  %capacity utilization costs parameter
Spp=4.3546;     %second derivative of invest. adjustment costs
alfa=0.2273;    %capital share
thetaG = 0.1085;  %Technology diffusion
delta=0.1298/100;       %probability that wage bargaining breaks down
DSHARE=0.3151;          %unempl. benefits as share of w (replacement ratio)
recSHAREpercent= 0.4945;%hiring/search cost para; share of hiring/search cost relative to output, in percent
phiL=127.45;            %Adjustment cost for labor force
s=0.8395;               %Probability of staying in labor force
sigma=0.4904;           %matching function share of unemp.
% shock parameter
rhomuz=0.7652;      %unit root neutral tech.
rhomuzT=0.8475;     %neutral tech. (transitory)
sigmuzTPratio=4.8476;%ratio of standard deviations
rhomupsi=0.6623;    %unit root investment tech.
sig_mupsi=0.1286;   %unit root investment tech.
sig_epsR=0.6555;    %monetary policy
sig_muz=0.0384;     %unit root neutral tech. (permanent)
                        


% standard deviation of shocks (%)
sigmuzT=sig_muz*sigmuzTPratio;%neutral tech. (transitory)

kappaf=0;       %price indexation to past inflation
varkappaf=1;    %price indexation parameter; if kappaf=0 and varkappaf=1 and pibreve=1 -> no indexation at all.
pibreve=1;      %price indexation to value pibreve

chi=1-(1-b)/elasttarget;

%%%%%%%%%%%%%%% steady states %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
muz=mu/mupsi^(alfa/(1-alfa));   % combined technology growth
nG=mu^(-1/thetaG);              % eta_G=eta_ in paper
nKAP=mu^(-1/thetaG);            % eta_KAP=eta_ in paper
nD=mu^(-1/thetaG);              % eta_D=eta_ in paper
nGAM=mu^(-1/thetaG);            % eta_GAM=eta_ in paper
nPHI=mu^(-1/thetaG);            % eta_PHI=eta_ in paper
nL=mu^(-1/thetaG);              % eta_L=eta_ in paper
nH=mu^(-1/thetaG);              % eta_H=eta_ in paper
uk=1;                           % capital utilization rate
a_uk=0;                         % adjustment cost of capital utilization
S=0;                            % investment adjustment cost
Sprime=0;                       % first derivative of investment adjustment cost
Fcal=0;                         % adjustment cost of the labor force
Fcalprime=0;                    % first derivative of adjustment cost of the labor force
m=betta/mu;                     % discount factor
l=L*(1-u);                      % labor hours
R=pibar/m;                      % nominal interest rate
pk=1;                           % price of capital
Rk=R;                           % nominal rate of capital

sigmab=Rk*mupsi*pk/pibar-(1-deltak)*pk;                                 % parameter in adjustment cost for capital utilization
pitilde=pibar^kappaf*pibar^(1-kappaf-varkappaf)*pibreve^varkappaf;      % relative optimal price
mc=1/lambda*(1-betta*xi*(pitilde/pibar)^(lambda/(1-lambda)))/(1-betta*xi*(pitilde/pibar)^(1/(1-lambda)))*((1-xi*(pitilde/pibar)^(1/(1-lambda)))/(1-xi))^(1-lambda); % real marginal cost
Disp=((1-xi*(pitilde/pibar)^(1/(1-lambda)))/(1-xi))^(1-lambda)/((1-xi*(pitilde/pibar)^(lambda/(1-lambda)))/(1-xi))^((1-lambda)/lambda);    % price dispersion
kl=(alfa*(mupsi*mu)^(1-alfa)*mc/sigmab)^(1/(1-alfa));                   % capital-labor ratio
varthet=(1-alfa)*mc/((mupsi*mu)^alfa*(nuf*R+1-nuf))*kl^alfa;            % marginal revenue product associated with a worker to the firm
y=mc/( (Disp^(lambda/(1-lambda))-1)*mc+1-profits)*(kl/(mu*mupsi))^alfa*l;% output
k=kl*l;                                                                 % capital
phi=((k/l/(mupsi*mu))^alfa*l-y*Disp^(lambda/(1-lambda)))/nPHI;          % fixed cost of production
i=(1-(1-deltak)/(mu*mupsi))*k;                                          % investment
c=(1-G_over_Y)*y-i-recSHAREpercent/100*y;                               % consumption
g=G_over_Y*y/nG;                                                        % government spending
GDP=g*nG+c+i;                                                           % GDP (output without inefficiencies or adjustment cost)

%steady states specific to unemployment models, except for real wage
x=1-rho;                                                                % hiring rate
f=x*l/(L-rho*l);                                                        % job finding probability
v=x/Q;                                                                  % vacancy rate
sigmam=x*l*(L-rho*l)^(-sigma)*(l*v)^(sigma-1);                          % parameter of matching function
kappa=(recSHAREpercent/100/((x))/l*y)/nKAP;                             % fixed cost of meeting worker/posting vacancy
J=kappa*nKAP;                                                           % value of a match for the firm
varthetp=varthet/(1-rho*m*mu);                                          % present value of marginal revenue product associated with a worker to the firm
wp=varthetp-J;                                                          % present value of wage
w=(wp*(1-rho*m*mu));                                                    % real wage
D=DSHARE*w/nD;                                                          % unemployment benefit
e=(L-s*(L-rho*l)-rho*l)/(1-L);                                          % probability of joining the labor force

unemp_stst=1-l;                                                         % unemployment workers
vTot_stst=v*l;                                                          % number of vacancies
cH=nH*(1-L)-Fcal;                                                       % home consumption

omega = 0.4654694262;                                                   % utility weight on home consumption
ctilde=( (1-omega)*(c*(1-b/mu))^chi+omega*(cH*(1-b/mu))^chi )^(1/chi);  % composite consumption
lambda_C=(1-omega)*ctilde^(1-chi-1)*(c*(1-b/mu))^(chi-1);               % marginal utility with respect to consumption of market goods
UcH=omega/(1-omega)*( cH*(1-b/mu)/(c*(1-b/mu)) )^(chi-1)*lambda_C;      % marginal utility with respect to consumption of home goods

%pricing equations
K=lambda*lambda_C*y*mc/(1-betta*xi*(pitilde/pibar)^(lambda/(1-lambda)));% auxiliary variable for price setting
F=lambda_C*y/(1-betta*xi*(pitilde/pibar)^(1/(1-lambda)));               % auxiliary variable for price setting


%solve for V A U N
Emat=zeros(4,4);                                                        % matrix of a) transition probabilities b) discounting (m*mu)
Emat(1,2)=1;                                                            %  
Emat(2,1)=(1-rho)*m*mu*s*f/(1-rho*m*mu);                                % probability of losing job, staying in labor force and finding a new job
Emat(2,3)=(1-rho)*m*mu*s*(1-f)/(1-rho*m*mu);                            % probability of losing job, staying in labor force and not finding a new job
Emat(2,4)=(1-rho)*m*mu*(1-s)/(1-rho*m*mu);                              % probability of losing job and not staying in labor force
Emat(3,1)=m*mu*s*f;                                                     % probability of staying in labor force and finding a new job
Emat(3,3)=m*mu*s*(1-f);                                                 % probability of staying in labor force and finding a new job
Emat(3,4)=m*mu*(1-s);                                                   % probability of not staying in labor force
Emat(4,1)=m*mu*e*f/(1-m*mu*(1-e));                                      % probability of joining the labor force and finding a job
Emat(4,3)=m*mu*e*(1-f)/(1-m*mu*(1-e));                                  % probability of joining the labor force and not finding a job
sol=inv(eye(4)-Emat)*[wp;0;nD*D;(UcH/lambda_C*nH)/(1-m*mu*(1-e))];      %
V=sol(1);                                                               % value of being matched
A=sol(2);                                                               % expected present value of the payments that a worker receives in all states and dates in which he is separated from the firm (contains U and N)
U=sol(3);                                                               % value of unemployment
N=sol(4);                                                               % value of non participation
pl=(w-nG*D)/(1-m*mu*rho*(1-f));                                         % value of employment over unemployment

%AOB sharing rule
alp1=1-delta+(1-delta)^M;                                               
alp2=1-(1-delta)^M;
alp3=alp2*(1-delta)/delta-alp1;
alp4=(1-delta)/(2-delta)*alp2/M+1-alp2;
gamma=(alp2*(V-U)-alp1*J+alp4*(varthet-nD*D))/(nGAM*alp3);              % cost of making a counteroffer in bargaining process

sig_eta =1000;                                                          % stddev. of technology innovation in technology
theta1 =0;                                                              % root of AR(2) process of technology
theta2=0;                                                               % root of AR(2) process of technology

model;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/
%R economy, monetary policy shock, current realization not in info set/%%%%%%%/ 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/
%information set in line with Choleski decomposition in VA_R
%set exogenous variables to steady states (except monetary shock, of course)
#mupsiR=STEADY_STATE(mupsiF);
#mupsiR_tp1=STEADY_STATE(mupsiF);
#muR=alfa/(1-alfa)*STEADY_STATE(mupsiF)+STEADY_STATE(muzF); 
#muR_tp1=STEADY_STATE(muF);
exp(nGR)=nG;


%conditional expectations based on t-1 info;
#piR_tp1=EXPECTATION(-1)(piR(+1));
#FR_tp1=EXPECTATION(-1)(FR(+1));
#KR_tp1=EXPECTATION(-1)(KR(+1));
#psiR_tp1=EXPECTATION(-1)(lambda_CR(+1));
#pkR_tp1=EXPECTATION(-1)(pkR(+1));
#iR_tp1=EXPECTATION(-1)(iR(+1));
#UR_tp1=EXPECTATION(-1)(UR(+1));
#fR_tp1=EXPECTATION(-1)(fR(+1));
#V_R_tp1=EXPECTATION(-1)(VR(+1)); 
#ukR_tp1=EXPECTATION(-1)(ukR(+1));
#wpR_tp1=EXPECTATION(-1)(wpR(+1));
#varthetpR_tp1=EXPECTATION(-1)(varthetpR(+1));
#AA_R_tp1=EXPECTATION(-1)(A_R(+1));

#RRinfo=EXPECTATION(-1)(RR);
#LR_tp1=EXPECTATION(-1)(LR(+1));
#NR_tp1=EXPECTATION(-1)(NR(+1));
#eR_tp1=EXPECTATION(-1)(eR(+1));
#plR_tp1=EXPECTATION(-1)(plR(+1));
#UcHR_tp1=EXPECTATION(-1)(UcHR(+1));
#LcalR_tp1=EXPECTATION(-1)(LcalR(+1));

%abbreviations

%capacity utilization
#aofukprimeR=sigmab*sigmaa*(exp(ukR))+sigmab*(1-sigmaa);
#aofukprimeR_tp1=sigmab*sigmaa*(exp(ukR_tp1))+sigmab*(1-sigmaa);
#aofukR=0.5*sigmab*sigmaa*(exp(ukR))^2+sigmab*(1-sigmaa)*exp(ukR)+sigmab*((sigmaa/2)-1);
#aofukR_tp1=0.5*sigmab*sigmaa*(exp(ukR_tp1))^2+sigmab*(1-sigmaa)*exp(ukR_tp1)+sigmab*((sigmaa/2)-1);

%return on capital
#RkR_tp1=log(((exp(ukR_tp1)*aofukprimeR_tp1-aofukR_tp1)+(1-deltak)*exp(pkR_tp1))/(exp(pkR+mupsiR_tp1-piR_tp1)));

%investment adjustment cost
#SR=(0.5*(exp(sqrt(Spp)*(exp(iR)/exp(iR(-1))*exp(muR)*exp(mupsiR)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))+exp(-sqrt(Spp)*(exp(iR)/exp(iR(-1))*exp(muR)*exp(mupsiR)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))-2));
#SprimeR=(0.5*sqrt(Spp)*(exp(sqrt(Spp)*(exp(iR)/exp(iR(-1))*exp(muR)*exp(mupsiR)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))-exp(-sqrt(Spp)*(exp(iR)/exp(iR(-1))*exp(muR)*exp(mupsiR)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))));
#SprimeR_tp1=(0.5*sqrt(Spp)*(exp(sqrt(Spp)*(exp(iR_tp1)/exp(iR)*exp(muR_tp1)*exp(mupsiR_tp1)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))-exp(-sqrt(Spp)*(exp(iR_tp1)/exp(iR)*exp(muR_tp1)*exp(mupsiR_tp1)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))));

%marginal cost
#mcR=alfa*mupsiR+varthetR+log(nuf*(exp(RRinfo))+1-nuf)-log(1-alfa)-alfa*(kststR(-1)+ukR-muR-lR ); 

%indexation
#pitildepiR=-piR+kappaf*piR(-1)+(1-kappaf-varkappaf)*log(pibar)+varkappaf*log(pibreve);
#pitildepiR_tp1=-piR_tp1+kappaf*piR+(1-kappaf-varkappaf)*log(pibar)+varkappaf*log(pibreve);

%labor force adjustment cost
#FcalR=0.5*exp(nGR)*phiL*100*(exp(LR)/exp(LR(-1))-1)^2;                                                       
#FcalLR=exp(nGR)*phiL*100*(exp(LR)/exp(LR(-1))-1)*1/exp(LR(-1));                                              
#FcalprimeLR=-exp(nGR)*phiL*100*(exp(LR_tp1)/exp(LR)-1)*exp(LR_tp1)*(1/exp(LR))^2;  

%asset pricing kernel
#mR_tp1=betta*exp(psiR_tp1)/exp(lambda_CR)*(exp(muR_tp1))^(-1); 

%composite consumption
#ctildeR=( (1-omega)*(exp(cR)-b*exp(cR(-1))/exp(muR))^chi+omega*(exp(cHR)-b*exp(cHR(-1))/exp(muR))^chi )^(1/chi);

%R1 - Consumption FOC
exp(lambda_CR)=(1-omega)*(ctildeR)^(-chi)*(exp(cR)-b*exp(cR(-1))/exp(muR))^(chi-1);

%R2 - Bond FOC (Fisher equation) 
1=mR_tp1*exp(RRinfo)/exp(piR_tp1);

%R3 - Investment FOC
1=exp(pkR)*(1-SR-SprimeR*exp(muR)*exp(mupsiR)*exp(iR)/exp(iR(-1)))+mR_tp1*exp(muR_tp1)*exp(pkR_tp1)*SprimeR_tp1*(exp(iR_tp1)/exp(iR))^2*exp(muR_tp1)*exp(mupsiR_tp1);

%R4 - Capital FOC
1=mR_tp1*exp(RkR_tp1)/exp(piR_tp1);

%R5 - Law of motion for physical capital
exp(kststR)=(1-deltak)/(exp(muR)*exp(mupsiR))*exp(kststR(-1))+(1-SR)*exp(iR);

%R6 - Cost minimization (opt. factor inputs)
0=aofukprimeR*exp(ukR)*exp(kststR(-1))/(exp(muR)*exp(mupsiR))-alfa/(1-alfa)*(nuf*exp(RRinfo)+1-nuf)*exp(lR)*((exp(varthetR)));

%R7 - Production
exp(yR)=exp(DispR)^(lambda/(lambda-1))*((exp(lR))^(1-alfa)*(exp(kststR(-1)+ukR)/(exp(muR)*exp(mupsiR)))^alfa-phi*exp(nGR)); 

%R8 - Resource Constraint
exp(yR)=g*exp(nGR)+exp(cR)+exp(iR)+aofukR*exp(kststR(-1))/(exp(mupsiR)*exp(muR))+kappa*exp(nGR)*(exp(xR))*exp(lR(-1));

%R9 Monetary Policy Rule
#pi4R=piR+piR(-1)+piR(-2)+piR(-3);
RR=rhoR*RR(-1)+(1-rhoR)*(STEADY_STATE(RR)+rpi/4*(pi4R-STEADY_STATE(pi4R))+rdeltay/4*(GDPR-GDPR(-4)+4*STEADY_STATE(muR)-4*STEADY_STATE(muR)))-sig_epsR*epsR_eps/400;

%R10 Pricing 1
exp(FR)-exp(lambda_CR+yR)-betta*xi*exp( pitildepiR_tp1  /(1-lambda)+FR_tp1);

%R11 Pricing 2 
exp(KR)-lambda*exp(lambda_CR+yR+mcR)-betta*xi*exp( pitildepiR_tp1 *lambda/(1-lambda)+KR_tp1);

%R12 Pricing 3
KR-FR=(1-lambda)*log((1-xi*exp( pitildepiR /(1-lambda)))/(1-xi));

%R13  Price dispersion
exp(DispR*lambda/(1-lambda))-(1-xi)^(1-lambda)*(1-xi*exp( pitildepiR /(1-lambda)))^lambda-xi*(exp( pitildepiR +DispR(-1)))^(lambda/(1-lambda));

%R14 Present value of wages
-exp(wpR)+exp(wR)+rho*mR_tp1*exp(muR_tp1)*exp(wpR_tp1);

%R15 Present value of marginal revenue
-exp(varthetpR)+exp(varthetR)+rho*mR_tp1*exp(muR_tp1)*exp(varthetpR_tp1);

%R16 Hiring FOC  - zero profit/free entry condition
-kappa*exp(nGR)+exp(JR);

%R17 Value of firm
-exp(JR)+exp(varthetpR)-exp(wpR);

%R18 Value of work
-exp(VR)+exp(wpR)+exp(A_R);

%F19 Present value of worker payoff after separation 
-exp(A_R)+(1-rho)*mR_tp1*exp(muR_tp1)*(s*exp(fR_tp1)*exp(V_R_tp1)+s*(1-exp(fR_tp1))*exp(UR_tp1)+(1-s)*(exp(NR_tp1)+LcalR_tp1))+rho*mR_tp1*exp(muR_tp1)*exp(AA_R_tp1);
 
%F20 Unempoyment value
-exp(UR)+D*exp(nGR)+mR_tp1*exp(muR_tp1)*(s*exp(fR_tp1)*exp(V_R_tp1)+s*(1-exp(fR_tp1))*exp(UR_tp1)+(1-s)*(exp(NR_tp1)+LcalR_tp1) );

%R21 Sharing rule
-alp1*exp(JR)+alp2*(exp(VR)-exp(UR))-alp3*exp(nGR)*gamma+alp4*(exp(varthetR)-exp(nGR)*D);

%R22 GDP
exp(GDPR)=g*exp(nGR)+exp(cR)+exp(iR);

%R23 Unempl. rate
-exp(unempR)+(exp(LR)-exp(lR))/exp(LR);

%R24 Job finding rate
-exp(fR)+exp(xR)*exp(lR(-1))/(exp(LR)-rho*exp(lR(-1))); 

%R25 Matching function
-exp(xR)*exp(lR(-1))+sigmam*(exp(LR)-rho*exp(lR(-1)))^sigma*(exp(vTotR))^(1-sigma);

%R26 Total vacancies
-exp(vTotR)+exp(vR)*exp(lR(-1));

%R27 Vacancy filling rate
-exp(QR)+exp(xR)/exp(vR);

%R28 Law of motion of employment  
-exp(lR)+(rho+exp(xR))*exp(lR(-1));

%R29 value of non-participation
-exp(NR)+exp(UcHR)/exp(lambda_CR)*exp(nGR)+mR_tp1*exp(muR_tp1)*( exp(eR_tp1)*(exp(fR_tp1)*exp(V_R_tp1)+(1-exp(fR_tp1))*exp(UR_tp1) - LcalR_tp1 )+(1-exp(eR_tp1))*exp(NR_tp1) );

%R30 probability of leaving non-participation
-exp(eR)+( exp(LR)-s*(exp(LR(-1))-rho*exp(lR(-1)))-rho*exp(lR(-1)) )/(1-exp(LR(-1)));
 
%R31 FOC employment
-exp(plR)+exp(wR)-exp(nGR)*D+mR_tp1*exp(muR_tp1)*exp(plR_tp1)*rho*(1-exp(fR_tp1));

%R32 FOC labor force participation 
exp(nGR)*D+exp(plR)*exp(fR)-exp(UcHR)/exp(lambda_CR)*(exp(cHR)+FcalR)/(1-exp(LR))-exp(UcHR)/exp(lambda_CR)*FcalLR-mR_tp1*exp(muR_tp1)*exp(UcHR_tp1)/exp(psiR_tp1)*FcalprimeLR;

%R33 home consumption
-exp(cHR)+exp(nGR)*(1-exp(LR))-FcalR; 

%R34 marginal utility of home consumption 
-exp(UcHR)+omega/(1-omega)*((exp(cHR)-b*exp(cHR(-1))/exp(muR))/(exp(cR)-b*exp(cR(-1))/exp(muR))   )^(chi-1)*exp(lambda_CR);

%R35 LFP adjustment cost         
LcalR=exp(UcHR)/exp(lambda_CR)*FcalLR+mR_tp1*exp(muR_tp1)*exp(UcHR_tp1)/exp(psiR_tp1)*FcalprimeLR;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%F economy, other shocks, current realization in info set %%%%%/ 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%abbreviations (same as above)
#muzF_tp1=muzF(+1);
#muF_tp1=alfa/(1-alfa)*mupsiF(+1)+muzF_tp1;
#aofukprimeF=sigmab*sigmaa*(exp(ukF))+sigmab*(1-sigmaa);
#aofukprimeF_tp1=sigmab*sigmaa*(exp(ukF(+1)))+sigmab*(1-sigmaa);
#aofukF=0.5*sigmab*sigmaa*(exp(ukF))^2+sigmab*(1-sigmaa)*exp(ukF)+sigmab*((sigmaa/2)-1);
#aofukF_tp1=0.5*sigmab*sigmaa*(exp(ukF(+1)))^2+sigmab*(1-sigmaa)*exp(ukF(+1))+sigmab*((sigmaa/2)-1);
#RkF_tp1=log(((exp(ukF(+1))*aofukprimeF_tp1-aofukF_tp1)+(1-deltak)*exp(pkF(+1)))/(exp(pkF+mupsiF(+1)-piF(+1))));
#SF=(0.5*(exp(sqrt(Spp)*(exp(iF)/exp(iF(-1))*exp(muF)*exp(mupsiF)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))+exp(-sqrt(Spp)*(exp(iF)/exp(iF(-1))*exp(muF)*exp(mupsiF)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))-2));
#SprimeF=(0.5*sqrt(Spp)*(exp(sqrt(Spp)*(exp(iF)/exp(iF(-1))*exp(muF)*exp(mupsiF)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))-exp(-sqrt(Spp)*(exp(iF)/exp(iF(-1))*exp(muF)*exp(mupsiF)-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))));
#SprimeF_tp1=(0.5*sqrt(Spp)*(exp(sqrt(Spp)*(exp(iF(+1))/exp(iF)*exp(muF_tp1)*exp(mupsiF(+1))-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))-exp(-sqrt(Spp)*(exp(iF(+1))/exp(iF)*exp(muF_tp1)*exp(mupsiF(+1))-exp(STEADY_STATE(muF))*exp(STEADY_STATE(mupsiF))))));
#mcF=alfa*mupsiF+varthetF+log(nuf*(exp(RF))+1-nuf)-log(1-alfa)-alfa*(kststF(-1)+ukF-muF-lF );
#pitildepiF=-piF+kappaf*piF(-1)+(1-kappaf-varkappaf)*log(pibar)+varkappaf*log(pibreve);
#pitildepiF_tp1=-piF(+1)+kappaf*piF+(1-kappaf-varkappaf)*log(pibar)+varkappaf*log(pibreve);
#FcalF=0.5*exp(nGF)*phiL*100*(exp(LF)/exp(LF(-1))-1)^2;                                                          
#FcalLF=exp(nGF)*phiL*100*(exp(LF)/exp(LF(-1))-1)*1/exp(LF(-1));                                                   
#FcalprimeLF=-exp(nGF(+1))*phiL*100*(exp(LF(+1))/exp(LF)-1)*exp(LF(+1))*(1/exp(LF))^2;
#mF_tp1=betta*exp(lambda_CF(+1))/exp(lambda_CF)*(exp(muF_tp1))^(-1); %asset pricing kernel
#ctildeF=( (1-omega)*(exp(cF)-b*exp(cF(-1))/exp(muF))^chi+omega*(exp(cHF)-b*exp(cHF(-1))/exp(muF))^chi )^(1/chi);




%F1 - Consumption FOC
exp(lambda_CF)=(1-omega)*(ctildeF)^(-chi)*(exp(cF)-b*exp(cF(-1))/exp(muF))^(chi-1);

%F2 - Bond FOC (Fisher equation) 
1=mF_tp1*exp(RF)/exp(piF(+1));

%F3 - Investment FOC
1=exp(pkF)*(1-SF-SprimeF*exp(muF)*exp(mupsiF)*exp(iF)/exp(iF(-1)))+mF_tp1*exp(muF_tp1)*exp(pkF(+1))*SprimeF_tp1*(exp(iF(+1))/exp(iF))^2*exp(muF_tp1)*exp(mupsiF(+1));

%F4 - Capital FOC
1=mF_tp1*exp(RkF_tp1)/exp(piF(+1));

%F5 - Law of motion for physical capital
exp(kststF)=(1-deltak)/(exp(muF)*exp(mupsiF))*exp(kststF(-1))+(1-SF)*exp(iF);

%F6 - Cost minimization (opt. factor inputs)
0=aofukprimeF*exp(ukF)*exp(kststF(-1))/(exp(muF)*exp(mupsiF))-alfa/(1-alfa)*(nuf*exp(RF)+1-nuf)*exp(lF)*exp(varthetF);

%F7 - Production
exp(yF)=exp(DispF)^(lambda/(lambda-1))*( (exp(lF))^(1-alfa)*(exp(kststF(-1)+ukF)/(exp(muF)*exp(mupsiF)))^alfa-phi*exp(nGF)); 

%F8 - Resource Constraint
exp(yF)=g*exp(nGF)+exp(cF)+exp(iF)+aofukF*exp(kststF(-1))/(exp(mupsiF)*exp(muF))+kappa*exp(nGF)*exp(xF)*exp(lF(-1));

%F9 Monetary Policy Rule
RF=rhoR*RF(-1)+(1-rhoR)*(STEADY_STATE(RF)+rpi/4*(pi4F-STEADY_STATE(pi4F))+rdeltay/4*(GDPF-GDPF(-4)+muF+muF(-1)+muF(-2)+muF(-3)-4*STEADY_STATE(muF)));

%F10 Pricing 1
exp(FF)-exp(lambda_CF+yF)-betta*xi*exp( pitildepiF_tp1 /(1-lambda)+FF(+1));

%F11 Pricing 2 
exp(KF)-lambda*exp(lambda_CF+yF+mcF)-betta*xi*exp( pitildepiF_tp1*lambda/(1-lambda)+KF(+1));

%F12 Pricing 3
KF-FF=(1-lambda)*log((1-xi*exp( pitildepiF /(1-lambda)))/(1-xi));

%F13  Price dispersion
exp(DispF*lambda/(1-lambda))-(1-xi)^(1-lambda)*(1-xi*exp( pitildepiF /(1-lambda)))^lambda-xi*(exp( pitildepiF +DispF(-1)))^(lambda/(1-lambda));

%F14 Present value of wages
-exp(wpF)+exp(wF)+rho*mF_tp1*exp(muF_tp1)*exp(wpF(+1));

%F15 Present value of marginal revenue
-exp(varthetpF)+exp(varthetF)+rho*mF_tp1*exp(muF_tp1)*exp(varthetpF(+1));

%F16 Hiring FOC  - zero profit/free entry condition
-kappa*exp(nGF)+exp(JF);

%F17 Firm surplus
-exp(JF)+exp(varthetpF)-exp(wpF);

%F18 Value of work
-exp(VF)+exp(wpF)+exp(AF);

%F19 Present value of worker payoff after separation 
-exp(AF)+(1-rho)*mF_tp1*exp(muF_tp1)*(s*exp(fF(+1))*exp(VF(+1))+s*(1-exp(fF(+1)))*exp(UF(+1))+(1-s)*(exp(NF(+1))+LcalF(+1) ) )+rho*mF_tp1*exp(muF_tp1)*exp(AF(+1));
 
%F20 Unemployment value
-exp(UF)+D*exp(nGF)+mF_tp1*exp(muF_tp1)*(s*exp(fF(+1))*exp(VF(+1))+s*(1-exp(fF(+1)))*exp(UF(+1))+(1-s)*(exp(NF(+1)) + LcalF(+1)) );

%F21 Sharing rule
-alp1*exp(JF)+alp2*(exp(VF)-exp(UF))-alp3*exp(nGF)*gamma+alp4*(exp(varthetF)-exp(nGF)*D);

%F22 GDP
exp(GDPF)=g*exp(nGF)+exp(cF)+exp(iF);

%F23 Unempl. rate
-exp(unempF)+(exp(LF)-exp(lF))/exp(LF);

%F24 Finding rate 
-exp(fF)+exp(xF)*exp(lF(-1))/(exp(LF)-rho*exp(lF(-1))); 

%F25 Matching function
-exp(xF)*exp(lF(-1))+sigmam*(exp(LF)-rho*exp(lF(-1)))^sigma*(exp(vTotF))^(1-sigma);

%F26 Total vacancies
-exp(vTotF)+exp(vF)*exp(lF(-1));

%F27 Vacancy filling rate
-exp(QF)+exp(xF)/exp(vF);

%F28 Law of motion of employment  
-exp(lF)+(rho+exp(xF))*exp(lF(-1));

%F29 Value of non-participation
-exp(NF)+exp(UcHF)/exp(lambda_CF)*exp(nGF)+mF_tp1*exp(muF_tp1)*( exp(eF(+1))*(exp(fF(+1))*exp(VF(+1))+(1-exp(fF(+1)))*exp(UF(+1)) - LcalF(+1) )+(1-exp(eF(+1)))*exp(NF(+1)) );

%F30 Probability of leaving non-participation
-exp(eF)+( exp(LF)-s*(exp(LF(-1))-rho*exp(lF(-1)))-rho*exp(lF(-1)) )/(1-exp(LF(-1)));
 
%F31 FOC employment
-exp(plF)+exp(wF)-exp(nGF)*D+mF_tp1*exp(muF_tp1)*exp(plF(+1))*rho*(1-exp(fF(+1)));

%F32 FOC labor force participation 
exp(nGF)*D+exp(plF)*exp(fF)-exp(UcHF)/exp(lambda_CF)*(exp(cHF)+FcalF)/(1-exp(LF))-exp(UcHF)/exp(lambda_CF)*FcalLF-mF_tp1*exp(muF_tp1)*exp(UcHF(+1))/exp(lambda_CF(+1))*FcalprimeLF;

%F33 Home consumption
-exp(cHF)+exp(nGF)*(1-exp(LF))-FcalF;  

%F34 Marginal utility of home consumption 
-exp(UcHF)+omega/(1-omega)*(   (exp(cHF)-b*exp(cHF(-1))/exp(muF))/(exp(cF)-b*exp(cF(-1))/exp(muF))   )^(chi-1)*exp(lambda_CF);

%F35 LFP adjustment cost         
LcalF=exp(UcHF)/exp(lambda_CF)*FcalLF+mF_tp1*exp(muF_tp1)*exp(UcHF(+1))/exp(lambda_CF(+1))*FcalprimeLF;

%F36 Annual inflation (year-on-year)
pi4F=piF+piF(-1)+piF(-2)+piF(-3);


%%%%%%%%%%%%%
%Exogenous Variables/%%
%%%%%%%%%%%%%

%E1 Composite technology growth
muF=alfa/(1-alfa)*mupsiF+muzF;

%E2 Unit root invest. Tech.
mupsiF=(1-rhomupsi)*STEADY_STATE(mupsiF)+rhomupsi*mupsiF(-1)-sig_mupsi*mupsi_eps/100;

%E3 Diffusion of composite technology 
exp(nGF)-(exp(nGF(-1)))^(1-thetaG)/exp(muF);

%E4 Shock to neutral technology growth (Wold representation of components representation)
muzF=( (1-rhomuz)*(1-rhomuzT) )*STEADY_STATE(muzF)+(rhomuz+rhomuzT)*muzF(-1)-(rhomuz*rhomuzT)*muzF(-2)-sig_eta*(muz_eps-theta1*muz_eps(-1)-theta2*muz_eps(-2))/100;

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%Aggregating 'F' and 'R' economies, expressed in percent deviations% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%A1 
GDPAGG-log(GDP)=GDPR-log(GDP)+GDPF-log(GDP);
%A2 
piAGG-log(pibar)=piR-log(pibar)+piF-log(pibar);
%A3 
RAGG-STEADY_STATE(RF)=RR-STEADY_STATE(RF)+RF-STEADY_STATE(RF);
%A4 
ukAGG-STEADY_STATE(ukF)=ukR-STEADY_STATE(ukF)+ukF-STEADY_STATE(ukF);
%A5 
lAGG-STEADY_STATE(lF)=lR-STEADY_STATE(lF)+lF-STEADY_STATE(lF);
%A6 
wAGG-STEADY_STATE(wF)=wR-STEADY_STATE(wF)+wF-STEADY_STATE(wF);
%A7 
cAGG-STEADY_STATE(cF)=cR-STEADY_STATE(cF)+cF-STEADY_STATE(cF);
%A8 
iAGG-STEADY_STATE(iF)=iR-STEADY_STATE(iF)+iF-STEADY_STATE(iF);
%A9 
unempAGG-STEADY_STATE(unempF)=unempR-STEADY_STATE(unempF)+unempF-STEADY_STATE(unempF);
%A10 
vTotAGG-STEADY_STATE(vTotF)=vTotR-STEADY_STATE(vTotF)+vTotF-STEADY_STATE(vTotF);
%A11 
fAGG-STEADY_STATE(fF)=fR-STEADY_STATE(fF)+fF-STEADY_STATE(fF);
%A12
pinvestAGG=-mupsiF; 
%A13
LAGG-STEADY_STATE(LF)=LR-STEADY_STATE(LF)+LF-STEADY_STATE(LF);
end; 
%%%%%%%%%%%%%%%%/
%End Model            %%%%%
%%%%%%%%%%%%%%%%/

initval;
lambda_CR =log(lambda_C);
cR =log(c);
RR =log(R);
piR = log(pibar);
iR =log(i);
pkR =log(pk);
FR =log(F);
KR =log(K);
ukR =log(uk);
wR = log(w);
kststR =log(k);
lR =log(l);
xR =log(x);
varthetR =log(varthet);
DispR =log(Disp);
yR =log(y);
JR =log(J);
UR =log(U);
GDPR =log(GDP);
fR =log(f);
vR =log(v);
unempR =log(u);
VR =log(V); 
A_R =log(A);
vTotR =log(v*l);
QR =log(Q);
wpR =log(wp);
varthetpR =log(varthetp);
eR =log(e);
NR =log(N);
LR =log(L);
cHR =log(cH);
UcHR =log(UcH);
plR=log(pl);
LcalR=0;
nGR =log(nG);

% Endogenous variables (F economy)
lambda_CF =log(lambda_C);
cF =log(c);
RF =log(R);
piF = log(pibar);
iF =log(i);
pkF=log(pk);
FF =log(F);
KF =log(K);
ukF =log(uk);
wF = log(w);
kststF=log(k); 
lF =log(l);
xF =log(x);
varthetF =log(varthet);
DispF =log(Disp);
yF =log(y);
JF =log(J);
UF =log(U);
GDPF =log(GDP);
fF =log(f);
vF =log(v);
unempF = log(u);
VF =log(V); 
AF=log(A); 
vTotF =log(v*l);
QF =log(Q);
wpF =log(wp);
varthetpF =log(varthetp);
eF =log(e);
NF =log(N);
LF =log(L);
cHF =log(cH);
UcHF =log(UcH);
plF=log(pl); 
LcalF=0;
muzF=log(muz);
mupsiF =log(mupsi);
muF =log(mu);
nGF =log(nG);
pi4F = 4*log(pibar);

% Endogenous variables (AGG economy)
GDPAGG =log(GDP);
piAGG = log(pibar);
RAGG =log(R);
ukAGG =log(uk);
lAGG =log(l);
wAGG = log(w);
cAGG =log(c);
iAGG =log(i);
unempAGG = log(u);
vTotAGG =log(v*l);
fAGG =log(f);
pinvestAGG =-log(mupsi);
LAGG=log(L); 

end;


shocks;
var epsR_eps= 1;
var muz_eps; stderr 1;
var mupsi_eps; stderr 1;
end;



%steady;
resid;
check;
stoch_simul(order = 1, irf=15, noprint, nograph) GDPAGG unempAGG piAGG RAGG lAGG wAGG cAGG LAGG iAGG ukAGG fAGG vTotAGG;

figure;
suptitle('Monetary Policy Shock')
subplot(3,4,1);
plot(GDPAGG_epsR_eps);
title('GDP');
subplot(3,4,2);
plot(unempAGG_epsR_eps);
title('Unemployment rate');
subplot(3,4,3);
plot(piAGG_epsR_eps);
title('Inflation');
subplot(3,4,4);
plot(RAGG_epsR_eps);
title('Fed Fund Rate');
subplot(3,4,5);
plot(lAGG_epsR_eps);
title('Hours');
subplot(3,4,6);
plot(wAGG_epsR_eps);
title('Real Wage');
subplot(3,4,7);
plot(cAGG_epsR_eps);
title('Consumption');
subplot(3,4,8);
plot(LAGG_epsR_eps);
title('Labor Force');
subplot(3,4,9);
plot(iAGG_epsR_eps);
title('Investment');
subplot(3,4,10);
plot(ukAGG_epsR_eps);
title('Capacity utilization');
subplot(3,4,11);
plot(fAGG_epsR_eps);
title('Job finding rate');
subplot(3,4,12);
plot(vTotAGG_epsR_eps);
title('Vacancies');
saveas(gcf,'IRF_MonPol.pdf');
