// A Dynare version of 
// Meh and Moran. 2010. "The Role of Bank Capital in the Propagation of Shocks"
// JEDC 34: 555-576
// Written by Kevin Moran, Nov 2010 - March 2011

//---------------------------------------------------------------------
// 1. Variable declaration
//---------------------------------------------------------------------

var 
ch    % 1- household consumption
Ce    % 2- entrepreneurial consumption
Cb    % 3- banking consumption
H     % 4- aggregate (composite) labour input
Y     % 5- Output
I     % 6- Investment 
bigN  % 7- entrepreneurial net worth 
bigA  % 8- net worth of banking sector (bank capital)
G     % 9- inverse of leverage 
q     % 10- relative price of capital goods
rk    % 11- rental rate on capital
infl  % 12 - gross rate of quarterly inflation
w_h   % 13 - wage rate (households)
w_e   % 14 - wage rate (entrepreneurs)
w_b   % 15 - wage rate (bankers)
Rd    % 16 - gross, nominal rate of interest
Ra    % 17 - gross return on bank capital
lam   % 18 - marginal utility of consumption
CA    % Capital-Asset ratio of banking sector
p     % inverse of real money balances
TL    % Aggregate bank lending in the economy
mc    % fraction of HH's financiel assets held as currency
s     % marginal costs
mgrowth % growth rate of money
expinfl % expected rate of inflation at time t+1
smalld  % real value of household deposits  
gY   % gross rate of output growth
totC % aggregate consumption
u    % utilization rate on physical capital 
keff  % effective capital services
K     % total physical capital
Kb    % holdings of physical capital by banking sector
Ke    % holdings of physical capital by entrepreneurial sector
ptilde % price chosen by reoptimising price-setters
nump   %auxiliary variable used in solving for ptilde
denp   %auxiliary variable used in solving for ptilde
wtilde % price chosen by reoptimising wage-setters
numw   %auxiliary variable used to help solve for wtilde
denw   %auxiliary variable used to help solve for wtilde
lz     % log of exogenous technology z
lmp    % log of monetary policy disturbance
lbk    % log of disturbances to bank capital
log_y  %
log_I
;


varexo 
z_shk  % innovation to productivity process
mp_shk % innovation to monetary policy process
bk_shk % innovation to the bank capital shock
;


//---------------------------------------------------------------------
// 2. Parameter declaration and calibration
//---------------------------------------------------------------------

parameters 

habit
bet
delta
reta
psi_l
elas_l
chi1
chi2
pi_ss
xi_w
phi_w
mark_w
eta_h
eta_e
eta_b
xi_p
phi_p
mark_p
theta_k
theta_h
theta_e
theta_b
alphag
mu
mu_ss
bigR
delalpha
smallb
tau_b
tau_e
lam_r
lam_pi
lam_y
bigtheta
bby
nu
rhoz
rhomp
rhobk
sigmaz
sigmamp
sigmabk
;



habit = 0.65;  %parameter governing habit formation (CEE 2005 use 0.65)

bet = 0.99;    %discount factor
delta = 0.02;  %depreciation of physical capital
reta = 0.001832219;

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters related to labour supply
% (labour disutility is: -psi_l * l^(1+elas_l)  / (1+elas_l) )
% elas_l = 1 follows CEE(2005)
% elas_l = 0.429 reproduces (for dynamics) our JEDC specification with log disutility
% in either case, psi_l is set in order for work effort at ss to be 0.3
% (this requires psi_l = 4.55 if elas_l = 0.429)

%psi_l = 9.05;
%elas_l = 1.0;

psi_l = 4.55;
elas_l = 0.429;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%parameters of monetary policy
pi_ss = 1.02^(0.25);
lam_r = 0.8;
lam_pi = 1.5;
lam_y = 0.1/4;
Rd_temp = pi_ss/bet;

% nominal rigidities and elasticities of substitution
% (follows CEE, 2005)
xi_w = 21;
phi_w = 0.64;
xi_p = 6;
phi_p = 0.6;
mark_p  = xi_p/(xi_p-1);
mark_w = xi_w/(xi_w-1);

eta_h = 0.9;            % measure of agents that are households
eta_e = 0.07;           % measure of agents that are entrepreneurs
eta_b = 1-eta_h-eta_e;    % measure of agents that are bankers

theta_h = 0.639999;   % share of household labor in production
theta_k = 0.36;       % share of capital in production
theta_e = (1.0-theta_h-theta_k)/2.0;    % share of entrepreneurial labor in production
theta_b = 1.0-theta_h-theta_k-theta_e;   % share of bank labor in production


% sector producing physical capital
alphag = 0.9903;
smallb = 0.1547;
delalpha = 0.2411;
tau_b = 0.7230;
tau_e = 0.7817;
bigR = 1.2118;

mu = 0.025;
mu_ss = 0.025;
% In some experiments, we want to leave mu_ss unchanged at 0.025 (to compute s.s.)
% but have mu = 0.0 for the linearization (to produce "WITH BANK CAPITAl CHANNEL" responses
% and "NO BANK CAPITAl CHANNEL" responses)
% in order to do that, need to disable lines 81-84 in the "steady_.m" program
% of your dynare build


bby = 0.000;
               % additional capital endowment banks receive every period, as a percentage of output.
               % (This is used for the experiments titled
               % "Economy with More Bank Capital"): for that, set bby to  0.007


nu = 1.0;

% Parameters related to shock processes
rhoz = 0.95;    %autocorrelation of technology
sigmaz = 0.0035; % s.d. of innovation to technology

%sigmaz = 0.0015;

%Parameter related to capital utilisation:
sigma_a = 0.01;  % from CEE(2005) this is (upsilon''(1)/upsilon'(1))


rhomp = 0.0;  %autocorrelation of disturbances to the MP rule
sigmamp = 0.0016; % s.d. of innovations to these disturbances.

rhobk = 0.90;  %autocorrelation of shocks to bank capital
sigmabk = 2.5; % s.d. of innovations to these disturbances.
%sigmabk = 0.000001;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% steady-state computations:


kk1 = delta*theta_k/(alphag*bigR*(1/bet-1+delta)); 
betatemp  = 1/bet;

infl_temp = pi_ss;

qtemp = kk1*(alphag*tau_b*mu*betatemp/delalpha-(1+mu+alphag*mu/(Rd_temp*delalpha)));
qtemp = qtemp/(alphag*smallb*kk1/(Rd_temp*delalpha)-alphag*bigR*kk1/Rd_temp-theta_e-theta_b-bby-alphag*tau_e*smallb*kk1*betatemp/delalpha);

Gtemp = 1+mu-(qtemp*alphag/Rd_temp)*(bigR-mu/(qtemp*delalpha)-smallb/delalpha);
   
IY = kk1/qtemp;

KY = alphag*bigR*IY/delta; 

KeY = tau_e*alphag*smallb*IY/delalpha;
    
KbY = tau_b*alphag*mu*IY/(qtemp*delalpha);

KhY = KY - KeY - KbY;

CeY = (1-tau_e)*alphag*smallb*IY*qtemp/delalpha;

CbY = nu*(1-tau_b)*alphag*mu*IY/delalpha;

ChY = 1 + bby - CeY - CbY  - (1+mu)*IY;

essai = (1-bet*habit)*theta_h/((1-habit)*ChY*psi_l*mark_w);
smallh = essai^(1/(1+elas_l));
Htemp = smallh*eta_h^(xi_w/(xi_w-1));

kk2 = (KY^(1/(1-theta_k))) * (eta_e^(theta_e/(1-theta_k)))* (eta_b^(theta_b/(1-theta_k)))* mark_p^(1/(theta_k-1));

Ktemp = Htemp^(theta_h/(1-theta_k))* kk2;

Ytemp = (1/mark_p)* (Ktemp^theta_k)*(Htemp^theta_h)*(eta_e^theta_e)*(eta_b^theta_b);

% fixed cost parameter to ensure zero profits in s.s.
bigtheta = (mark_p-1)*Ytemp;

Itemp = IY*Ytemp;

rktemp = (1/mark_p)*theta_k*(Ktemp^(theta_k-1))*(Htemp^theta_h)*(eta_e^theta_e)*(eta_b^theta_b);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Following Fernandez Villaverde et al. (2010) as well as others,
% set utilisation of capital as 
%upsilon(u) = chi_1 (u - 1) + 0.5chi_2 (u - 1)^2
%Set parameters in a way that replicates CEE (2005)
chi1 = rktemp;
chi2 = sigma_a*chi1;  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


w_htemp = (1/mark_p)*theta_h*(Ktemp^theta_k)*(Htemp^(theta_h-1))*(eta_e^theta_e)*(eta_b^theta_b);
                                 
w_etemp = (1/mark_p)*theta_e*(Ktemp^theta_k)*(Htemp^theta_h)*(eta_e^(theta_e-1))*(eta_b^theta_b);

w_btemp = (1/mark_p)*theta_b*(Ktemp^theta_k)*(Htemp^theta_h)*(eta_e^theta_e)*(eta_b^(theta_b-1));

Ketemp = KeY*Ytemp;

Kbtemp = KbY*Ytemp;

Khtemp = KhY*Ytemp;

Cetemp = CeY*Ytemp;

Cbtemp = CbY*Ytemp;

chtemp = ChY*Ytemp/eta_h;

bigAtemp = eta_b*w_btemp+(rktemp+qtemp*(1-delta))*Kbtemp+bby*Ytemp;
			
bigNtemp = eta_e*w_etemp+(rktemp+qtemp*(1-delta))*Ketemp;

totCtemp = Cetemp+Cbtemp+eta_h*chtemp;

lamtemp = (1-bet*habit)/((1-habit)*(chtemp));

smalldtemp = alphag*qtemp*( bigR - smallb/delalpha - mu/(qtemp*delalpha))*Itemp/(Rd_temp*eta_b);
   
ptemp = (Rd_temp-1)*lamtemp/ ( (Rd_temp-1)*lamtemp*eta_b*smalldtemp + eta_h*reta);

mctemp = reta*ptemp/((Rd_temp-1)*lamtemp);

Ratemp = alphag*qtemp*(mu/(qtemp*delalpha))*Itemp/bigAtemp;

TLtemp = Itemp-bigNtemp;

CAtemp = bigAtemp/((1+mu)*Itemp-bigNtemp);

wtildetemp = w_htemp*infl_temp*eta_h^(-1/(1-xi_w));

numwtemp =  ( ( (w_htemp*infl_temp)^(xi_w*(1+elas_l)) * Htemp^(1+elas_l) )/(1-bet*phi_w) )^(1/(1+elas_l*xi_w));

denwtemp = ( (w_htemp^(xi_w)*infl_temp^(xi_w-1)*Htemp*lamtemp)/(1-bet*phi_w) )^(1/(1+elas_l*xi_w));

wtildetemp = (mark_w*psi_l)^(1/(1+xi_w*elas_l))*numwtemp/denwtemp;

stemp = 1/mark_p;

mgrowthtemp = infl_temp;

expinfltemp = infl_temp;

gYtemp = 1;

utemp = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



//---------------------------------------------------------------------
// 3. Model declaration
//---------------------------------------------------------------------

model;  
1/(ch - habit*ch(-1)) - bet*habit*1/(ch(+1) - habit*ch) = lam;

reta/(mc/p) = (Rd-1)*lam;

rk = chi1 + chi2*(u - 1);

q*lam = bet* (lam(+1)* ( q(+1)*(1-delta) + rk(+1)*u- ( chi1*(u-1)+0.5*chi2*(u(+1)-1)^2 ) ));

lam = bet*lam(+1)*Rd(+1)/infl(+1);

infl = p*mgrowth/p(-1);

wtilde = (xi_w *psi_l/(xi_w-1))^(1/(1+elas_l*xi_w)) * numw /  denw;

numw =  ( bet*phi_w*(numw(+1)^(1+elas_l*xi_w)) + (H^(1+elas_l)) *(w_h*infl)^(xi_w*(1+elas_l)) )^(1/(1+elas_l*xi_w));

denw =  ( bet*phi_w*(denw(+1)^(1+elas_l*xi_w)) + lam*H*(w_h^xi_w)*(infl^(xi_w-1)) )^(1/(1+elas_l*xi_w)) ;

infl^(1-xi_w) *w_h^(1-xi_w) = eta_h*(1-phi_w)*wtilde^(1-xi_w) + phi_w* infl(-1)^(1-xi_w) *w_h(-1)^(1-xi_w);

ptilde = xi_p * nump/ ((xi_p - 1) * denp );

nump = bet*phi_p*nump(+1) + lam*s*Y*infl^xi_p;

denp = bet*phi_p*denp(+1) + lam*Y*infl^(xi_p-1);

infl^(1-xi_p) = (1-phi_p)*ptilde^(1-xi_p) + phi_p*infl(-1)^(1-xi_p);

rk = s * exp(lz)* theta_k * keff^(theta_k-1) * H^theta_h * eta_e^theta_e *eta_b^(theta_b);

w_h = s * exp(lz)* theta_h * keff^(theta_k) * H^(theta_h-1) * eta_e^theta_e * eta_b^(theta_b);

w_e = s * exp(lz)* theta_e * keff^(theta_k) * H^(theta_h) * eta_e^(theta_e-1) * eta_b^(theta_b);

w_b = s * exp(lz)* theta_b * keff^(theta_k) * H^(theta_h) * eta_e^(theta_e) * eta_b^(theta_b-1);

I = (bigA+bigN)/G;

bigA*Ra = alphag * mu*I/delalpha;

G = 1+ mu - q *alphag*( bigR - smallb/delalpha - mu/(q*delalpha) )/(Rd);

Rd*(1-eta_h*mc)/p = q*alphag*( bigR-smallb/delalpha - mu/(q*delalpha))*I;

Kb = tau_b*alphag*mu*I/(q*delalpha);

Ke = tau_e*alphag*smallb*I/delalpha;

bigA = ( rk + q*(1-delta*exp(lbk)))*Kb(-1) + eta_b*w_b;

bigN = ( rk + q*(1-delta))*Ke(-1) + eta_e*w_e;

Cb = (1-tau_b)*alphag*mu*I/delalpha;

Ce = (1-tau_e)*alphag*q*smallb*I/delalpha;

eta_h *ch + Ce + Cb + I + I*mu = Y;

K = (1-delta)*K(-1) + alphag*bigR*I;

log(Rd/steady_state(Rd)) = lam_r*log( Rd(-1)/steady_state(Rd) ) + (1-lam_r) * ( lam_pi*log(infl/steady_state(infl)) + lam_y*log(Y/steady_state(Y)) ) + lmp;

Y = exp(lz)* (keff^theta_k)*(H^theta_h)*(eta_e^theta_e)*(eta_b^theta_b) - bigtheta;

CA = bigA/((1+mu)*I-bigN);

eta_b* smalld = (1-eta_h*mc)/p;

keff = u*( K(-1) - Ke(-1) - Kb(-1) ) + Ke(-1) + Kb(-1);

expinfl = infl(+1);

gY = Y/Y(-1);

TL = I - bigN;

totC = eta_h *ch + Ce + Cb;

lz = rhoz*lz(-1)+ z_shk;

lmp = rhomp*lmp(-1)+ mp_shk;

lbk = rhobk*lbk(-1)+ bk_shk;

log_y = log(Y);

log_I = log(I);


end;

//---------------------------------------------------------------------
// 4. Initial values and steady state
//---------------------------------------------------------------------

resid;

steady;  

check;                    

//---------------------------------------------------------------------
// 5. Shock declaration  
//                       
//---------------------------------------------------------------------

shocks;
    var z_shk = sigmaz^2;
    var mp_shk = sigmamp^2;
    var bk_shk = sigmabk^2;
end;


stoch_simul(order=1,irf = 100,nograph,hp_filter = 1600);
%options_.pruning=1;
%stoch_simul(order=2,replic = 50,irf = 40,noprint,nograph,hp_filter = 1600);


