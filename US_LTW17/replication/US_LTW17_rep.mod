//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Clearing Up the Fiscal Multiplier Morass, American Economic Review 2017, 107(8): 2409–2454
// Eric M. Leeper, Nora Traum, and Todd B. Walker
//
//**************************************************************************

// Model: USLTW17

//Ncs Ncn NR Ni Nk Nv Nl Ny Ngc Nc Nq Nrk Nw Npi Nb Nsb Ntauk Ntaul Ntauc Nr Nz Nmc Nkbar Nlambda NPb Ncstar Nugc Nuz Nua Nub Num Nui Nuw Nup;

var  
            // Endogenous Variables:
            cs        // 1 consumption: Savers
            cn        // 2 consumption: Non-Savers
            R         // 3 nominal interest rate
            i         // 4 investment
            k         // 5 effective capital
            v         // 6 capital utilization rate
            l         // 7 labor
            y         // 8 output 
            gc		  // 9 govt consumption
            c         //10 aggregate consumtpion
            q         //11 Lagragian multiplier for a unit of investment goods				
            rk        //12 real return for private k 
            w         //13 real wage 
            pi        //14 inflation 
            b         //15 govt debt
            sb        //16 b/y ratio
            tauk      //17 tauk
            taul      //18 taul
            tauc      //19 tauc
            r         //20 real interest rate 
            z         //21 transfers 
            mc        //22 real marginal cost
            kbar      //23 private capital
            lambda    //24 household Lagragian multiplier from budget constraint
            Pb        //25 price of bonds
            cstar     //26 consumption in utility function
            piL       //27 long-run inflation
            rL        //28 long-run interest rate
            S         //29 primary surplus
            rb        //30 rb defined
            Tk        //31 capital tax revenue
            Tl        //32 labor tax revenue
            Tc        //33 consumption tax revenue
            // Observables
            cobs      //34 consumption
            iobs      //35 investment
            gcobs     //36 govt spending
            wobs      //37 wages
            bobs      //38 debt
            Robs      //39 interest rate
            Piobs     //40 inflation
            Lobs      //41 hours worked       
            // Expectations: (9 formard looking vaiables)
            //xlambda   //42 Cs(t+1)
            //xpi       //43 pi(t+1)
            //xi        //44 i(t+1)
            //xq        //45 q(t+1)
            //xrk       //46 rk(t+1)
            //xtauk     //47 tauk(t+1)
            //xw        //48 w(t+1)
            //xPb       //49 Pb(t+1)
            //xrL       //50 rL(t+1)
            // Shocks:     
            ugc       //51 gc shock 
            uz        //52 z shock
            ua        //53 general preference shock
            ub        //54 investment shock in adjustment costs
            um        //55 technology shock
            ui        //56 wage markup shock
            uw        //57 price markup shock
            up        //58 monetary policy shock

;


parameters AD bet delt alph etaw etap gamm100 xi muHH omegaw omegap gpsi s chiw chip phipi phiy gammgc gammtk gammtl gammz 
rhoa rhob rhor rhoi rhow rhop rhogc rhotk rhotl rhotc rhoz siga sigb sigm sigi sigw sigp siggc sigz thet alphag rhoem rhoeg rhoez Lbar Pibar 
lamprice lamwage 

//steady state parameters

sbss taulss taukss taucss Rhoss gammss expgss Rss Rbarss Pbss Rkss psi1ss mcss wss KLss OmegLss YLss ILss CLss rkss ZLss ZnLss CnLss CsLss CstarLss lss csss cnss yss kss Omegss css invss 
zss bss gcss kyss cyss lyss TKss TLss TCss Sss

sgcss;


varexo 
            eugc       //1 gc shock 
            euz        //2 z shock
            eua        //3 general preference shock
            eub        //4 investment shock in adjustment costs
            eum        //5 technology shock
            eui        //6 wage markup shock
            euw        //7 price markup shock
            eup        //8 monetary policy shock
;


// Calibrated parameters
AD = 20;                // average duration of government debt
bet = 0.99;           	// discount factor
delt = 0.025;           // private capital depreciation rate
alph = 0.33;            // share of capital in the prod. function
etaw = 0.14;            // elasticity of substitution b/w labor talents
etap = 0.14;            // elasticity of substitution b/w intermediate goods
sgcss = 0.11;             // steady state government consumption to model Y ratio; fiscal variables are US data averages over 1954Q3 to 2014Q2
sbss = 1.47;              // steady state government debt to model Y ratio
taulss = 0.186;           // steady state labor tax rate
taukss = 0.218;           // steady state capital tax rate
taucss = 0.023;           // steady state consumption tax rate



// Estimated parameter No. 01: steady state growth rate of technology, multiplied by 100 
gamm100 = 0.242968973360760;

// Estimated parameter No. 02: inverse Frisch elasticity
xi =  1.540098680199818;

// fraction of non-savers in population
muHH = 0;

// Estimated parameter No. 03: prob. of unions not resetting price
omegaw =  0.873633441786572;

// Estimated parameter No. 04: prob. of firms not resetting price
omegap =  0.889634877904653;

// Estimated parameter No. 05: K utilization cost parameter
gpsi =  0.126297919145076; 

// Estimated parameter No. 06: s" in the investment adjustment cost function
s =  5.213147230492578;

// Estimated parameter No. 07: percentage of unions' wage adjustment when they cannot optimize
chiw =  0.089393160044567;

// Estimated parameter No. 08: percentage of intermediate firms' price adjustment when they cannot optimize
chip =  0.060355303068460;

// Estimated parameter No. 09: Taylor rule inflation coefficient
phipi =  1.142492263502070;

// Estimated parameter No. 10: Taylor rule output coefficient
phiy =  0.178225311630840;

// Estimated parameter No. 11: response of government consumption to debt
gammgc =  0.214956274043740;

//// response of capital tax to debt
gammtk = 0;

//// response of labor tax to debt
gammtl = 0;

// Estimated parameter No. 12: response of saver transfers to debt
gammz =  -0.028247874637231;

// Estimated parameter No. 13: serial correlation on technological productiviety growth
rhoa =  0.251431768280169;

// Estimated parameter No. 14: serial correlation on preference shock
rhob =  0.314713788054350;

// Estimated parameter No. 15: serial correlation on interest rate in Taylor rule
rhor =  0.756483804459602;

// Estimated parameter No. 16: serial correlation on investment preference shock
rhoi =  0.511411853483883;

// Estimated parameter No. 17: serial correlation on wage markup shock
rhow =  0.326894727384245;

// Estimated parameter No. 18: serial correlation on price markup shock
rhop =  0.724249353191094;

// Estimated parameter No. 19: serial correlation on gov. consumption shock
rhogc =  0.984047962915516;

//// serial correlation on capital tax shock
rhotk = 0;

//// serial correlation on labor tax shock
rhotl = 0;

//// serial correlation on consumption tax shock
rhotc = 0;

// serial correlation on savers transfers shock
//if RegimeM_I == 1
rhoz = 0.98; 
/*
else
    param_index = param_index + 1;
    rhoz = param(param_index);
end
*/

// Estimated parameter No. 20: technology shock standard deviation
siga =  1.03292319884557;

// Estimated parameter No. 21: preference shock standard deviation
sigb =  42.6559249998644;

// Estimated parameter No. 22: monetary policy shock standard deviation
sigm =  0.231187433032408;

// Estimated parameter No. 23: investment preference shock standard deviation
sigi =  0.978941599253400;

// Estimated parameter No. 24: wage markup shock standard deviation
sigw =  0.250356962066959;

// Estimated parameter No. 25: price markup shock standard deviation
sigp =  0.0988174659346631;

// Estimated parameter No. 26: gov. consumption shock standard deviation
siggc =  1.83235871273796;

// Estimated parameter No. 27: saver transfer shock standard deviation
sigz =  2.68115974402062;

// Estimated parameter No. 28: habit formation
thet =  0.989468754445726;

// Estimated parameter No. 29: substitutability (>0) or complementarity (< 0) of private and public consumption              
alphag = -0.185909020087479;    

// Estimated parameter No. 30: AR coefficients on policy shocks
//rhoem = 0.336277752958210;
rhoem = 0;

// Estimated parameter No. 31:   
rhoeg = 0.126568144141410; 

//if RegimeM_I == 1
rhoez = 0.8; 
/*
else
    param_index = param_index + 1;
    rhoez = param(param_index); 
end
*/

// Estimated parameter No. 32 & No. 33: Mean values of observables
Lbar = 475.202534563017;
Pibar = 0.643991271663901;

lamprice = ((1+bet*chip)*omegap)/((1-bet*omegap)*(1-omegap));
lamwage = (omegaw*(1+bet)*(1+xi*(1+(1/etaw))))/((1-omegaw*bet)*(1-omegaw));

//// -------------------------------------------------------------------------
// Computation of the steady state
// -------------------------------------------------------------------------
Rhoss = (1 - (1/AD))*(1/bet);
gammss = gamm100/100;
expgss = exp(gammss);
Rss = expgss/bet; // real or nominal interest rate since pi = 1 in steady state
Rbarss = (Rss - 1)*100;
Pbss = 1/(Rss - Rhoss);
Rkss = (exp(gammss)/bet - 1 + delt)/(1-taukss);
psi1ss = Rkss*(1-taukss);
mcss = 1/(1 + etap);
wss = (mcss*((1-alph)^(1-alph))*(alph^alph)*(Rkss^(-alph)))^(1/(1-alph));
KLss = (wss/Rkss)*alph/(1-alph);
OmegLss = (KLss^alph) - Rkss*(KLss) - wss; 
YLss = (KLss^alph) - OmegLss;
ILss = (1-(1-delt)*exp(-gammss))*expgss*KLss;
CLss = YLss*(1 - sgcss) - ILss;
rkss = Rkss;
ZLss = ((1 - Rss*exp(-gammss))*sbss - sgcss)*YLss + (taucss)*CLss + taulss*wss + taukss*rkss*KLss;
ZnLss = ZLss;
CnLss = ((1-taulss)*wss + ZnLss)/(1+taucss);
CsLss = (CLss - muHH*CnLss )/(1-muHH);
CstarLss = CsLss + alphag*sgcss*YLss;
lss = ((wss*(1-taulss)/((1+taucss)*(1+etaw)))*(1/((1-thet*exp(-gammss))*CstarLss)))^(1/(xi + 1));
csss = CsLss*lss;
cnss = CnLss*lss;
yss = YLss*lss;
kss = KLss*lss;
Omegss = OmegLss*lss;
css = CLss*lss;
invss = ILss*lss;
zss = ZLss*lss;
bss = sbss*yss;
gcss = sgcss*yss;
kyss = kss/yss;
cyss = css/yss;
lyss = lss/yss;
TKss = taukss*rkss*kss;
TLss = taulss*lss*wss;
TCss = taucss*css;
Sss = taukss*rkss*kss + taulss*lss*wss + taucss*css - gcss - zss;
//ss = [Rss gc c y inv TK TL TC z bet expg Rho rhogc];



model (linear);

//--------------------------------------------
//(1)	Production Function
//--------------------------------------------
//g0(Nl,Ny) = 1;
//g0(Nl,Nk) = -((y+Omeg)/y)*alph;
//g0(Nl,Nl) = -((y+Omeg)/y)*(1-alph);

y - ((yss+Omegss)/yss)*alph*k -((yss+Omegss)/yss)*(1-alph)*l=0;

//Ny - ((y+Omeg)/y)*alph*Nk - ((y+Omeg)/y)*(1-alph)*Nl = 0;


//--------------------------------------------
//(2)	Production Factors
//--------------------------------------------
//g0(Nrk,Nrk) = 1;
//g0(Nrk,Nw) = -1;
//g0(Nrk,Nk) = 1;
//g0(Nrk,Nl) = -1;

rk - w + k -l = 0;

//Nrk - Nw + Nk - Nl = 0;


//--------------------------------------------
//(3)	Marginal Cost
//--------------------------------------------
//g0(Nmc,Nmc) = 1;
//g0(Nmc,Nrk) = -alph;
//g0(Nmc,Nw) = alph-1;

mc-alph*rk + (alph-1)*w=0;

//Nmc - alph*Nrk + (alph-1)*Nw = 0;


//--------------------------------------------
//(4)	Phillips Equation
//--------------------------------------------
//g0(Npi,Npi) = lamprice;
//g0(Npi,Nxpi) = -lamprice*bet/(1+bet*chip);
//g1(Npi,Npi) = lamprice*chip/(1+bet*chip);
//g0(Npi,Nmc) = -1;
//g0(Npi,Nup) = -lamprice;        
                          
lamprice*pi -lamprice*bet/(1+bet*chip)*pi(+1) - mc -lamprice*up = lamprice*chip/(1+bet*chip)*pi(-1);

//lamprice*Npi - (lamprice*bet/(1+bet*chip))*Npi(+1) - Nmc - lamprice*Nup = (lamprice*chip/(1+bet*chip))*Npi(-1);




//--------------------------------------------
//(5)	Savers' Lagrange Multiplier
//--------------------------------------------
//g0(Nlambda,Nlambda) = 1;
//g0(Nlambda,Nua) = thet/(expg-thet);
//g0(Nlambda,Ncstar) = expg/(expg-thet);
//g1(Nlambda,Ncstar) = thet/(expg-thet);
//g0(Nlambda,Nub) = -1;
//g0(Nlambda,Ntauc) = (tauc/(1+tauc));

lambda + thet/(expgss-thet)*ua + expgss/(expgss-thet)*cstar -ub + (taucss/(1+taucss))*tauc = thet/(expgss-thet)*cstar(-1);

//Nlambda + (thet/(expg-thet))*Nua + (expg/(expg-thet))*Ncstar - Nub + (tauc/(1+tauc))*Ntauc = (thet/(expg-thet))*Ncstar(-1);

//--------------------------------------------
//(6)	Long-Run Real Interest Rate
//--------------------------------------------
//g0(NrL,NrL) = 1;
//g0(NrL,NPb) = 1;
//g0(NrL,NxrL) = -bet*Rho/expg;
//g0(NrL,NxPb) = -bet*Rho/expg;
//g0(NrL,Nxpi) = 1;

rL + Pb -bet*Rhoss/expgss*rL(+1) -bet*Rhoss/expgss*Pb(+1) +pi(+1)= 0;

//--------------------------------------------
//(7)	Long-Run Inflation Rate
//--------------------------------------------
//g0(NpiL,NpiL) = 1;
//g0(NpiL,NPb) = 1;
//g0(NpiL,NrL) = 1;

piL + Pb + rL = 0;


//--------------------------------------------
//(8)	Consumption in Utility
//--------------------------------------------
//g0(Ncstar,Ncstar) = 1;
//g0(Ncstar,Ncs) = -cs/(cs + alphag*gc);
//g0(Ncstar,Ngc) = -alphag*gc/(cs + alphag*gc);

cstar -csss/(csss + alphag*gcss)*cs -alphag*gcss/(csss + alphag*gcss)*gc=0;

//Ncstar - (cs/(cs + alphag*gc))*Ncs - (alphag*gc/(cs + alphag*gc))*Ngc = 0;



//--------------------------------------------
//(9)	Euler Equation
//--------------------------------------------
//g0(Ncs,Nlambda) = 1; 
//g0(Ncs,NR) = -1;
//g0(Ncs,Nxpi) = 1;
//g0(Ncs,Nxlambda) = -1;
//g0(Ncs,Nua) = rhoa;

lambda - R + pi(+1) - lambda(+1) + rhoa*ua=0;

//Nlambda - NR + Npi(+1) - Nlambda(+1) + rhoa*Nua = 0;


//--------------------------------------------
//(10)	Capacity Utilization
//--------------------------------------------
//g0(Nv,Nrk) = ((1-gpsi)/gpsi);
//g0(Nv,Nv) = -1;
//g0(Nv,Ntauk) = -(((1-gpsi)/gpsi)*tauk/(1-tauk));

((1-gpsi)/gpsi)*rk - v -(((1-gpsi)/gpsi)*taukss/(1-taukss))*tauk=0;

//((1-gpsi)/gpsi)*Nrk - Nv - (((1-gpsi)/gpsi)*tauk/(1-tauk))*Ntauk = 0;


//--------------------------------------------
//(11)	Capital FOC
//--------------------------------------------
//g0(Nq,Nq) = 1;
//g0(Nq,NR) = 1;
//g0(Nq,Nxpi) = -1;
//g0(Nq,Nxq) = -bet*exp(-gamm)*(1-delt);
//g0(Nq,Nxrk) = -bet*exp(-gamm)*Rk*(1-tauk);
//g0(Nq,Nxtauk) = tauk*exp(-gamm)*bet*Rk;

q + R - pi(+1) -bet*exp(-gammss)*(1-delt)*q(+1) -bet*exp(-gammss)*Rkss*(1-taukss)*rk(+1) + taukss*exp(-gammss)*bet*Rkss*tauk(+1)=0;

//Nq + NR - Npi(+1) - bet*exp(-gamm)*(1-delt)*Nq(+1) - bet*exp(-gamm)*Rk*(1-tauk)*Nrk(+1) + tauk*exp(-gamm)*bet*Rk*Ntauk(+1) = 0;



//--------------------------------------------
//(12)	Investment FOC
//--------------------------------------------
//g0(Ni,Nq) = -1/((1+bet)*s*(exp(2*gamm)));
//g0(Ni,Ni) = 1;
//g0(Ni,Nxi) = -bet/(1+bet);
//g0(Ni,Nua)=(1-bet*rhoa)/(1+bet);
//g1(Ni,Ni) = 1/(1+bet);
//g0(Ni,Nui) = -1; // Note: shock normalized by 1/((1+bet)*s*(expg^2))


-1/((1+bet)*s*(exp(2*gammss)))*q + i - bet/(1+bet)*i(+1) + (1-bet*rhoa)/(1+bet)*ua - ui =  1/(1+bet)*i(-1); 

//Ni - (1/((1+bet)*s*(exp(2*gamm))))*Nq - (bet/(1+bet))*Ni(+1) + ((1-bet*rhoa)/(1+bet))*Nua - Nui = (1/(1+bet))*Ni(-1);


//--------------------------------------------
//(13)	Effective Capital
//--------------------------------------------
//g0(Nk,Nk) = 1;
//g0(Nk,Nv) = -1;
//g0(Nk,Nua) = 1;
//g1(Nk,Nkbar) = 1;

k - v + ua = kbar(-1);

//Nk - Nv + Nua = Nkbar(-1);


//--------------------------------------------
//(14)	Law of Motion for Capital
//--------------------------------------------
//g0(Nkbar,Nkbar) = 1;
//g0(Nkbar,Nui) = -(1 - (1-delt)*exp(-gamm))*((1+bet)*s*(exp(2*gamm))); // Note: extra terms due to normalization
//g0(Nkbar,Ni) = -(1 - (1-delt)*exp(-gamm));
//g0(Nkbar,Nua) = (1-delt)*exp(-gamm);
//g1(Nkbar,Nkbar) = (1-delt)*exp(-gamm);

kbar -(1 - (1-delt)*exp(-gammss))*((1+bet)*s*(exp(2*gammss)))*ui  -(1 - (1-delt)*exp(-gammss))*i  +(1-delt)*exp(-gammss)*ua = (1-delt)*exp(-gammss)*kbar(-1) ;

//Nkbar - (1 - (1-delt)*exp(-gamm))*((1+bet)*s*(exp(2*gamm)))*Nui - (1 - (1-delt)*exp(-gamm))*Ni + (1-delt)*exp(-gamm)*Nua = (1-delt)*exp(-gamm)*Nkbar(-1);



//--------------------------------------------
//(15)	Wage Equation!!
//--------------------------------------------

//g0(Nw,Nw) = 1 + lamwage;
//g0(Nw,Nxw) = -lamwage*(bet/(1+bet));
//g0(Nw,Npi) = (lamwage*(1 + bet*chiw)/(1 + bet));
//g0(Nw,Nxpi) = -(lamwage*bet/(1+bet));
//g0(Nw,Nl) = -xi;
//g0(Nw,Nlambda) = 1;
//g0(Nw,Nua) = lamwage*((1 + bet*chiw - rhoa*bet)/(1+bet));
//g0(Nw,Ntaul) = -(taul/(1-taul));
//g0(Nw,Nuw) = -lamwage;
//g0(Nw,Nub) = -1;
//g1(Nw,Nw) = (lamwage/(1+bet));
//g1(Nw,Npi) = (lamwage*chiw/(1 + bet));
//g1(Nw,Nua) = (lamwage*chiw/(1+bet));

(1 + lamwage)*w -lamwage*(bet/(1+bet))*w(+1) + (lamwage*(1 + bet*chiw)/(1 + bet))*pi -lamwage*(bet/(1+bet))*pi(+1) -xi*l +lambda + 
lamwage*((1 + bet*chiw - rhoa*bet)/(1+bet))*ua -(taulss/(1-taulss))*taul -lamwage*uw -ub 
= (lamwage/(1 + bet))*w(-1) + (lamwage*chiw/(1 + bet))*pi(-1) + (lamwage*chiw/(1 + bet))*ua(-1);

/*
(1 + lamwage)*Nw - lamwage*(bet/(1+bet))*Nw(+1) + (lamwage*(1 + bet*chiw)/(1 + bet))*Npi - (lamwage*bet/(1+bet))*Npi(+1) - xi*Nl + Nlambda + 
lamwage*((1 + bet*chiw - rhoa*bet)/(1+bet))*Nua - (taul/(1-taul))*Ntaul - lamwage*Nuw - Nub 
= (lamwage/(1+bet))*Nw(-1) + (lamwage*chiw/(1 + bet))*Npi(-1) + (lamwage*chiw/(1+bet))*Nua(-1);
*/



//--------------------------------------------
//(16)	Monetary Policy Rule
//--------------------------------------------
//g0(NR,NR) = 1;
//g1(NR,NR) = rhor;
//g0(NR,Npi) = -(1-rhor)*phipi;
//g0(NR,Ny) = -(1-rhor)*phiy;
//g0(NR,Num) = -1;

R -(1-rhor)*phipi*pi -(1-rhor)*phiy*y - um = rhor*R(-1); 

//NR = rhor*NR(-1) + (1-rhor)*phipi*Npi + (1-rhor)*phiy*Ny + Num;


//--------------------------------------------
//(17)	Aggregate Resource Constraint
//--------------------------------------------
//g0(Ny,Nc) = c;
//g0(Ny,Ni) = inv;
//g0(Ny,Ny) = -y;
//g0(Ny,Ngc) = sgc*y;
//g0(Ny,Nv) = psi1*k;

css*c + invss*i - yss*y + sgcss*yss*gc + psi1ss*kss*v = 0;

//c*Nc + inv*Ni - y*Ny + sgc*y*Ngc + psi1*k*Nv = 0;



//--------------------------------------------
//(18)	Non-Savers Household's Budget
//--------------------------------------------
//g0(Ncn,Ncn) = cn*(1+tauc);
//g0(Ncn,Ntauc) = tauc*cn;
//g0(Ncn,Nw) = -w*l*(1-taul);
//g0(Ncn,Nl) = -w*l*(1-taul);
//g0(Ncn,Ntaul) = w*l*taul; 
//g0(Ncn,Nz) = -z;

cnss*(1+taucss)*cn + taucss*cnss*tauc -wss*lss*(1-taulss)*w -wss*lss*(1-taulss)*l + wss*lss*taulss*taul -zss*z =0;

//cn*(1+tauc)*Ncn + tauc*cn*Ntauc - w*l*(1-taul)*Nw - w*l*(1-taul)*Nl + w*l*taul*Ntaul - z*Nz = 0;


//--------------------------------------------
//(19)	Consumption Aggregation
//--------------------------------------------
//g0(Nc,Nc) = c;
//g0(Nc,Ncs) = -(1-muHH)*cs;
//g0(Nc,Ncn) = -muHH*cn;

css*c-(1-muHH)*csss*cs-muHH*cnss*cn=0;

//c*Nc - (1-muHH)*cs*Ncs - muHH*cn*Ncn = 0;


//--------------------------------------------
//(20)	Maturity Structure
//--------------------------------------------
//g0(NPb,NR) = 1;
//g0(NPb,NxPb) = -Rho*Pb/(1+Rho*Pb);
//g0(NPb,NPb) = 1;

R-Rhoss*Pbss/(1+Rhoss*Pbss)*Pb(+1) + Pb = 0;

//NR + NPb - (Rho*Pb/(1+Rho*Pb))*NPb(+1) = 0;


//--------------------------------------------
//(21)	Government Budget Constraint
//--------------------------------------------
//g0(Nb,Nb) = sb;
//g0(Nb,Ngc) = -sgc;
//g0(Nb,Nz) = -(z/y); 
//g0(Nb,Ntauk) = tauk*rk*ky;
//g0(Nb,Nrk) = tauk*rk*ky;
//g0(Nb,Nk) = tauk*rk*ky;
//g0(Nb,Nua) = sb/bet;
//g0(Nb,Ntaul) = taul*w*ly;
//g0(Nb,Nw) = taul*w*ly;
//g0(Nb,Nl) = taul*w*ly;
//g0(Nb,Nc) = (tauc*cy);
//g0(Nb,Ntauc) = (tauc*cy);
//g1(Nb,Nb) = sb/bet;
//g0(Nb,NPb) = -sb*Rho*exp(-gamm);
//g1(Nb,NPb) = -sb/bet; 
//g0(Nb,Npi) = sb/bet; 


sbss*b -sgcss*gc -(zss/yss)*z +taukss*rkss*kyss*tauk +taukss*rkss*kyss*rk + taukss*rkss*kyss*k 
+ sbss/bet*ua + taulss*wss*lyss*taul+taulss*wss*lyss*w +taulss*wss*lyss*l 
+ (taucss*cyss)*c+(taucss*cyss)*tauc -sbss*Rhoss*exp(-gammss)*Pb +sbss/bet*pi = sbss/bet*b(-1) - sbss/bet*Pb(-1); 

/*
sb*Nb - sgc*Ngc - (z/y)*Nz + tauk*rk*ky*Ntauk + tauk*rk*ky*Nrk + tauk*rk*ky*Nk 
+ (sb/bet)*Nua + taul*w*ly*Ntaul + taul*w*ly*Nw + taul*w*ly*Nl
+ (tauc*cy)*Nc + (tauc*cy)*Ntauc - sb*Rho*exp(-gamm)*NPb + (sb/bet)*Npi = (sb/bet)*Nb(-1) - (sb/bet)*NPb(-1);
*/


//--------------------------------------------
//(22)    gc Rule
//--------------------------------------------
//g0(Ngc,Ngc) = 1;
//g1(Ngc,Nsb) = -(1-rhogc)*gammgc;
//g1(Ngc,Ngc) = rhogc;
//g0(Ngc,Nugc) = -1;

gc  -ugc = rhogc*gc(-1) -(1-rhogc)*gammgc*sb(-1) ;

//Ngc = rhogc*Ngc(-1) - (1-rhogc)*gammgc*Nsb(-1) + Nugc;


//--------------------------------------------
//(23)    Capital Tax Rate Rule
//--------------------------------------------
//g0(Ntauk,Ntauk) = 1;
//g1(Ntauk,Nsb) = (1-rhotk)*gammtk;
//g1(Ntauk,Ntauk) = rhotk;

tauk = (1-rhotk)*gammtk*sb(-1) + rhotk*tauk(-1);

//Ntauk = (1-peg_switch_fiscal)*(rhotk*Ntauk(-1) + (1-rhotk)*gammtk*Nsb(-1));


//--------------------------------------------
//(24)    Labor Tax Rate Rule
//--------------------------------------------
//g0(Ntaul,Ntaul) = 1;
//g1(Ntaul,Nsb) = (1-rhotl)*gammtl;
//g1(Ntaul,Ntaul) = rhotl;

taul = (1-rhotl)*gammtl*sb(-1) + rhotl*taul(-1);

//Ntaul = (1-peg_switch_fiscal)*(rhotl*Ntaul(-1) + (1-rhotl)*gammtl*Nsb(-1));


//--------------------------------------------
//(25)    Consumption Tax Rate Rule
//--------------------------------------------
//g0(Ntauc,Ntauc) = 1;
//g1(Ntauc,Ntauc) = rhotc;

tauc = rhotc*tauc(-1);

//Ntauc = rhotc*Ntauc(-1);


//--------------------------------------------
//(26)    Z Rule
//--------------------------------------------
//g0(Nz,Nz) = 1;
//g1(Nz,Nsb) = -(1-rhoz)*gammz; 
//g1(Nz,Nz) = rhoz;
//g0(Nz,Nuz) = -1;

z - uz = -(1-rhoz)*gammz*sb(-1) + rhoz*z(-1);

//Nz = (1-peg_switch_fiscal)*(rhoz*Nz(-1) - (1-rhoz)*gammz*Nsb(-1)) + Nuz;


//--------------------------------------------
//(27)	Fisher Equation
//--------------------------------------------
//g0(Nr,Nr) = 1;
//g0(Nr,NR) = -1;
//g0(Nr,Nxpi) = 1;

r-R+pi(+1)=0;

//Nr - NR + Npi(+1) = 0;


//--------------------------------------------
//(28)	sb Defined
//--------------------------------------------
//g0(Nsb,Nsb) = 1;
//g0(Nsb,Ny) = 1;
//g0(Nsb,Nb) = -1;

sb + y - b = 0;

//Nsb + Ny - Nb = 0;


//--------------------------------------------
//(29)	Consumption Tax Revenue
//--------------------------------------------
//g0(NTc,NTc) = 1;
//g0(NTc,Ntauc) = -1;
//g0(NTc,Nc) = -1;

Tc -tauc - c = 0;



//--------------------------------------------
//(30)	Capital Tax Revenue
//--------------------------------------------
//g0(NTk,NTk) = 1;
//g0(NTk,Ntauk) = -1;
//g0(NTk,Nrk) = -1;
//g0(NTk,Nk) = -1;

Tk - tauk - rk - k = 0;


//--------------------------------------------
//(31)	rb defined
//--------------------------------------------
//g0(Nrb,Nrb) = 1;
//g0(Nrb,NPb) = -Rho*bet/expg;
//g1(Nrb,NPb) = -1;
//g0(Nrb,Npi) = 1;

rb -Rhoss*bet/expgss*Pb + pi = -Pb(-1);

//--------------------------------------------
//(32)	S defined
//--------------------------------------------
//g0(NS,NS) = 1;
//g0(NS,Ntauk) = -tauk*rk*k/S;
//g0(NS,Nrk) = -tauk*rk*k/S;
//g0(NS,Nk) = -tauk*rk*k/S;
//g0(NS,Ntaul) = -taul*w*l/S;
//g0(NS,Nw) = -taul*w*l/S;
//g0(NS,Nl) = -taul*w*l/S;
//g0(NS,Ntauc) = -tauc*c/S;
//g0(NS,Nc) = -tauc*c/S;
//g0(NS,Nz) = z/S;
//g0(NS,Ngc) = gc/S;


S -taukss*rkss*kss/Sss*tauk    -taukss*rkss*kss/Sss*rk     -taukss*rkss*kss/Sss*k 
  -taulss*wss*lss/Sss*taul    -taulss*wss*lss/Sss*w      -taulss*wss*lss/Sss*l
  -taucss*css/Sss*tauc -taucss*css/Sss*c + zss/Sss*z + gcss/Sss*gc = 0;  
 
//--------------------------------------------
//(33)	Labor Tax Revenue
//--------------------------------------------
//g0(NTl,NTl) = 1;
//g0(NTl,Ntaul) = -1;
//g0(NTl,Nw) = -1;
//g0(NTl,Nl) = -1;

Tl - taul - w - l = 0;


//--------------------------------------------
//(34)	Define Xpi
//--------------------------------------------
//g0(Nxpi,Npi)=1; 
//g1(Nxpi,Nxpi)=1; 
//Pie(Nxpi,1)=1;

//--------------------------------------------
//(35)	Define Xq
//--------------------------------------------
//g0(Nxq,Nq)=1; 
//g1(Nxq,Nxq)=1; 
//Pie(Nxq,2)=1;

//--------------------------------------------
//(36)	Define Xrk
//--------------------------------------------
//g0(Nxrk,Nrk)=1; 
//g1(Nxrk,Nxrk)=1; 
//Pie(Nxrk,3)=1;

//--------------------------------------------
//(37)	Define XI
//--------------------------------------------
//g0(Nxi,Ni)=1; 
//g1(Nxi,Nxi)=1; 
//Pie(Nxi,4)=1;

//--------------------------------------------
//(38)	Define Xtauk
//--------------------------------------------
//g0(Nxtauk,Ntauk)=1; 
//g1(Nxtauk,Nxtauk)=1; 
//Pie(Nxtauk,5)=1;

//--------------------------------------------
//(39)	Define Xw
//--------------------------------------------
//g0(Nxw,Nw)=1; 
//g1(Nxw,Nxw)=1; 
//Pie(Nxw,6)=1;

//--------------------------------------------
//(40)	Define Xlambda
//--------------------------------------------
//g0(Nxlambda,Nlambda)=1; 
//g1(Nxlambda,Nxlambda)=1; 
//Pie(Nxlambda,7)=1;

//--------------------------------------------
//(41)	Define XPb
//--------------------------------------------
//g0(NxPb,NPb)=1; 
//g1(NxPb,NxPb)=1; 
//Pie(NxPb,8)=1;

//--------------------------------------------
//(42)	Define XrL
//--------------------------------------------
//g0(NxrL,NrL)=1; 
//g1(NxrL,NxrL)=1; 
//Pie(NxrL,9)=1;

//--------------------------------------------
//(43)	C Obs
//--------------------------------------------
//g0(Ncobs,Ncobs) = 1;
//g0(Ncobs,Nc) = -100;
//g1(Ncobs,Nc) = -100;
//g0(Ncobs,Nua) = -100;

cobs - 100*c -100*ua = -100*c(-1);

//--------------------------------------------
//(44)	I Obs
//--------------------------------------------
//g0(Niobs,Niobs) = 1;
//g0(Niobs,Ni) = -100;
//g1(Niobs,Ni) = -100;
//g0(Niobs,Nua) = -100;


iobs - 100*i -100*ua = -100*i(-1);

//--------------------------------------------
//(45)	gc Obs
//--------------------------------------------
//g0(Ngcobs,Ngcobs) = 1;
//g0(Ngcobs,Ngc) = -100;
//g1(Ngcobs,Ngc) = -100;
//g0(Ngcobs,Nua) = -100;

gcobs - 100*gc -100*ua = -100*gc(-1);

//--------------------------------------------
//(46)	w Obs
//--------------------------------------------
//g0(Nwobs,Nwobs) = 1;
//g0(Nwobs,Nw) = -100;
//g1(Nwobs,Nw) = -100;
//g0(Nwobs,Nua) = -100;

wobs - 100*w -100*ua = -100*w(-1);

//--------------------------------------------
//(47)	b Obs
//--------------------------------------------
//g0(Nbobs,Nbobs) = 1;
//g0(Nbobs,Nb) = -100;
//g1(Nbobs,Nb) = -100;
//g0(Nbobs,Nua) = -100;

bobs - 100*b -100*ua = -100*b(-1);

//--------------------------------------------
//(48)	R Obs
//--------------------------------------------
//g0(NRobs,NRobs) = 1;
//g0(NRobs,NR) = -100;

Robs - 100*R = 0;

//--------------------------------------------
//(49)	Pi Obs
//--------------------------------------------
//g0(NPiobs,NPiobs) = 1;
//g0(NPiobs,Npi) = -100;

Piobs -100*pi =0;

//--------------------------------------------
//(50)	L Obs
//--------------------------------------------
//g0(NLobs,NLobs) = 1;
//g0(NLobs,Nl) = -100;

Lobs -100*l = 0;
//--------------------------------------------
//(51)	gc Spending Shock
//--------------------------------------------
//g0(Nugc,Nugc) = 1;
//g1(Nugc,Nugc) = rhoeg; 
//Psi(Nugc,Nugc) = 1;

//ugc = rhoeg*ugc(-1) + siggc*eugc;
ugc = rhoeg*ugc(-1) + eugc;
//Nugc = rhoeg*Nugc(-1) + eps_gc;


//--------------------------------------------
//(52)	Zs Shock
//--------------------------------------------
//g0(Nuz,Nuz)=1; 
//g1(Nuz,Nuz) = rhoez; 
//Psi(Nuz,Nuz) = 1;

//uz = rhoez*uz(-1) + sigz*euz;
uz = rhoez*uz(-1) + euz;

//Nuz = rhoez*Nuz(-1) + eps_z;


//--------------------------------------------
//(53)	Growth Rate of Technology shock
//--------------------------------------------
//g0(Nua,Nua) = 1; 
//g1(Nua,Nua) = rhoa; 
//Psi(Nua,Nua) = 1;

//ua = rhoa*ua(-1) + siga*eua;
ua = rhoa*ua(-1) + eua;

//Nua = rhoa*Nua(-1) + eps_ua;


//--------------------------------------------
//(54)	Preference Shock
//--------------------------------------------
//g0(Nub,Nub) = 1; 
//g1(Nub,Nub) = rhob; 
//Psi(Nub,Nub) = 1;

//ub = rhob*ub(-1) + sigb*eub;
ub = rhob*ub(-1) + eub;

//Nub = rhob*Nub(-1) + eps_ub;


//--------------------------------------------
//(55)	Monetary Policy Shock
//--------------------------------------------
//g0(Num,Num) = 1; 
//g1(Num,Num) = rhoem; 
//Psi(Num,Num) = 1;

um = rhoem*um(-1) + sigm*eum;
//um = rhoem*um(-1) + eum;


//Num = rhoem*Num(-1) + eps_um;


//--------------------------------------------
//(56)	Investment Shock
//--------------------------------------------
//g0(Nui,Nui) = 1; 
//g1(Nui,Nui) = rhoi; 
//Psi(Nui,Nui) = 1;

//ui = rhoi*ui(-1) + sigi*eui;
ui = rhoi*ui(-1) + eui;


//Nui = rhoi*Nui(-1) + eps_ui;


//--------------------------------------------
//(57)	wage markup Shock
//--------------------------------------------
//g0(Nuw,Nuw) = 1; 
//g1(Nuw,Nuw) = rhow; 
//Psi(Nuw,Nuw) = 1;

//uw = rhow*uw(-1) + sigw*euw;
uw = rhow*uw(-1) + euw;


//Nuw = rhow*Nuw(-1) + eps_uw;


//--------------------------------------------
//(58)	price markup Shock
//--------------------------------------------
//g0(Nup,Nup) = 1; 
//g1(Nup,Nup) = rhop; 
//Psi(Nup,Nup) = 1;

//up = rhop*up(-1) + sigp*eup;
up = rhop*up(-1) + eup;

//Nup = rhop*Nup(-1) + eps_up;


end;

check;
steady;



shocks;

          var eugc = siggc^2 ;       //1 gc shock 
          var  euz = sigz^2;       //2 z shock
          var  eua = siga^2;       //3 general preference shock
          var  eub = sigb^2;       //4 investment shock in adjustment costs
          var  eum = sigm^2;       //5 technology shock
          var  eui = sigi^2;       //6 wage markup shock
          var  euw = sigw^2;       //7 price markup shock
          var  eup = sigp^2;       //8 monetary policy shock

//          var  eum = 0.25^2;
end;

stoch_simul(irf = 40, nograph) ;
//stoch_simul(irf = 40) y pi R l;