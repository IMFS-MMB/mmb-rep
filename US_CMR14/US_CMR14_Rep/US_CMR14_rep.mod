var c consumption_obs credit_obs epsil Fp Fw g gamma gdp_obs h hours_obs i inflation_obs investment_obs
    kbar lambdaf lambdaz muup muzstar n networth_obs omegabar phi pi pinvest_obs pitarget premium_obs
    pstar q Re Re_obs RealRe_obs rL rk Rk RL s sigma xi0 xi1 xi2 xi3 xi4 xi5 xi6 xi7 xi8 Spread1_obs
    term volEquity u wage_obs wtilde wstar zetac zetai
    log_zetac  log_lambdaz log_term log_pi log_muzstar
    log_xi0 log_xi1 log_xi2 log_xi3 log_xi4 log_xi5 log_xi6 log_xi7 log_xi8;

varexo e_epsil e_g e_gamma e_lambdaf e_muup e_muzstar e_pitarget e_sigma e_xi1 e_xi2 e_xi3 e_xi4 e_xi5
       e_xi6 e_xi7 e_xi8 e_term e_zetac e_zetai e_xp; 


parameters actil_p adptil_p adytil_p alpha_p aptil_p aytil_p b_p beta_p bigtheta_p c_p delta_p epsil_p etag_p 
           Fomegabar_p g_p gamma_p i_p iota_p iotamu_p iotaw_p lambdaf_p lambdaw_p mu_p muup_p muzstar_p signal_corr_p
           pi_p pibar_p pitarget_p psik_p psil_p psiL_p Re_p rhoepsil_p rhog_p rhogamma_p rholambdaf_p rhomuup_p rhomuzstar_p
           rhopitarget_p rhosigma_p rhoterm_p rhozetac_p rhozetai_p rhotil_p Sdoupr_p sigmaL_p sigma_p sigmaa_p stdepsil_p
           stdg_p stdgamma_p stdlambdaf_p stdmuup_p stdmuzstar_p stdpitarget_p stdsigma1_p stdterm_p stdxp_p stdzetac_p
           stdzetai_p stdsigma2_p tauc_p taud_p tauk_p taul_p tauo_p term_p upsil_p we_p xip_p xiw_p zeta_p zetac_p zetai_p;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Set parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% when stopshock = 1, then non-risk shocks are all turned off
@# define stopshock = 0

% when stopsignal = 1, then signals on risk are turned off
@# define stopsignal = 0

% when stopunant = 1, then unanticipated risk shock turned off
@# define stopunant = 0

% when signal_corr_nonzero = 1, sig_corr_p can be non zero.
@# define signal_corr_nonzero = 1
@#define possible_signals = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]

stdlambdaf_p   =   0.010955960700000  ;  
stdmuup_p      =   0.003985791800000  ;	 
stdg_p         =   0.022812723300000  ;	 
stdmuzstar_p   =   0.007148784800000  ;	 
stdgamma_p     =   0.008103540300000  ;	 
stdepsil_p     =   0.004633811900000  ;	 
stdxp_p        =   0.489344620900000  ;	 
stdzetac_p     =   0.023325355100000  ;	 
stdzetai_p     =   0.054964824400000  ;	 
stdterm_p      =   0.001603753000000  ;	 
xiw_p          =   0.812796311400000  ;	  
b_p            =   0.735843822700000  ;	 
Fomegabar_p    =   0.005588569300000  ;	 
mu_p           =   0.214894511100000  ;	 
sigmaa_p       =   2.535553419500000  ;	 
Sdoupr_p       =  10.780000003400000  ;	 
xip_p          =   0.741218603400000  ;	 
aptil_p        =   2.4;//1.5;
rhotil_p       =   0.850296450300000  ;	 
iota_p         =   0.897367052100000  ;	 
iotaw_p        =   0.489073535900000  ;	 
iotamu_p       =   0.936565280700000  ;	 
adytil_p       =   0.364943654300000  ; 
signal_corr_p  =   0;//0.3861343781103740 ;	 Set to zero to replicate figure 2
rholambdaf_p   =   0.9108528528580380 ;	 
rhomuup_p      =   0.9870257396836700 ;	 
rhog_p         =   0.9427215849959780 ;	 
rhomuzstar_p   =   0.1459051086113400 ;	 
rhoepsil_p     =   0.8089285617540170 ;	 
rhosigma_p     =   0.9706370265612010 ;	 
rhozetac_p     =   0.8968400853887450 ;	 
rhozetai_p     =   0.9086616567125290 ;	 
rhoterm_p      =   0.9743991813961140 ;	 
stdsigma2_p    =   0.0282985295279650 ;
stdsigma1_p    =   0.0700061676650730 ;	 
	
		 

// Calibrated parameters.
actil_p           = 0;
adptil_p          = 0;
alpha_p           = 0.4;
aytil_p           = 0;
beta_p            = 0.998704208591811;
bigtheta_p        = 0.005;
c_p               = 1.545858551297361;
delta_p           = 0.025;
epsil_p           = 1;
etag_p            = 0.2043;
g_p               = 0.586751768198739;
gamma_p           = 0.985;
i_p               = 0.739400293322006;
lambdaf_p         = 1.2;
lambdaw_p         = 1.05;
muup_p            = 1;
muzstar_p         = 1.004124413586981;
pi_p              = 1.006010795406775;
pibar_p           = 1.006010795406775;
pitarget_p        = 1.006010795406775;
psik_p            = 0;
psil_p            = 0;
psiL_p            = 0.7705;
Re_p              = 0.011470654984364;
rhogamma_p        = 0;
rhopitarget_p     = 0.975;
sigmaL_p          = 1;
sigma_p           = 0.327545843119697;
stdpitarget_p     = 0.0001;
tauc_p            = 0.047;
taud_p            = 0;
tauk_p            = 0.32;
taul_p            = 0.241;
tauo_p            = 1;
term_p            = 1;
upsil_p           = 1.004223171829000;
we_p              = 0.005;
zeta_p            = 1;
zetac_p           = 1;
zetai_p           = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


model;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Auxiliary expressions.  These simplify the equations without adding
% additional variables.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # pitilde    = (pitarget^iota_p * pi(-1)^(1-iota_p) * pibar_p^(1-iota_p-(1-iota_p)));
  
  # Kp         = (Fp * ((1 - xip_p * (pitilde / pi)^(1/(1-lambdaf))) / (1 - xip_p))^(1-lambdaf)); 
  
  # rk_ss      = (steady_state(rk));
  
  # a          = (rk_ss * (exp(sigmaa_p * (u - 1)) - 1) / sigmaa_p); 
    
  # F          = (normcdf(((log(omegabar) + sigma(-1)^2 / 2) / sigma(-1)))); 

  # G           = (normcdf((log(omegabar) + sigma(-1)^2 / 2) / sigma(-1) - sigma(-1))); 

  # H           = (normcdf((log(omegabar) + sigma(-1)^2 / 2) / sigma(-1) - 2 * sigma(-1)));             

  # d           = (((G  + omegabar  * (1 - F )) - ((1 - mu_p) * G  + omegabar  * (1 - F ))) * (1 + Rk ) * q(-1)  * kbar(-1)  / (muzstar * pi)); 

  # pitildep1   = (pitarget(+1)^iota_p * pi^(1-iota_p) * pibar_p^(1-iota_p-(1-iota_p)));

  # yz          = (pstar^(lambdaf/(lambdaf-1)) * (epsil * (u * kbar(-1) / (muzstar * upsil_p))^alpha_p 
                     * (h * wstar^(lambdaw_p/(lambdaw_p-1)))^(1-alpha_p) - phi));

  # Kpp1       = (Fp(+1) * ((1 - xip_p * (pitildep1 / pi(+1))^(1/(1-lambdaf(+1)))) / (1 - xip_p))^(1-lambdaf(+1)));
  # pitildewp1 = (pitarget(+1)^iotaw_p * pi^(1-iotaw_p) * pibar_p^(1-iotaw_p-(1-iotaw_p)));
  # piwp1      = (pi(+1) * muzstar(+1) * wtilde(+1) / wtilde);
  # piw        = (pi * muzstar * wtilde / wtilde(-1));
  # pitildew   = (pitarget^iotaw_p * pi(-1)^(1-iotaw_p) * pibar_p^(1-iotaw_p-(1-iotaw_p)));
  # Kwp1       = (((1 - xiw_p * (pitildewp1 / piwp1 * muzstar_p^(1-iotamu_p) * muzstar(+1)^iotamu_p)^(1/(1-lambdaw_p))) 
                 / (1-xiw_p))^(1-lambdaw_p*(1+sigmaL_p)) * wtilde(+1) * Fw(+1) / psiL_p); 

  # Kw         = (((1 - xiw_p * (pitildew / piw * muzstar_p^(1-iotamu_p) * muzstar^iotamu_p)^(1/(1-lambdaw_p))) 
                 / (1 - xiw_p))^(1-lambdaw_p*(1+sigmaL_p)) * wtilde * Fw / psiL_p); 

  # S          = (exp(sqrt(Sdoupr_p / 2)*(zetai * muzstar * upsil_p * i / i(-1) - muzstar_p * upsil_p))
                 + exp(-sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i/i(-1) - muzstar_p * upsil_p)) - 2); 

  # Spr        = (sqrt(Sdoupr_p / 2) * (exp(sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i / i(-1) - muzstar_p * upsil_p)) 
                 - exp(-sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i / i(-1) - muzstar_p * upsil_p))));

  # Sprp1      = (sqrt(Sdoupr_p / 2) * (exp(sqrt(Sdoupr_p / 2) * (zetai(+1) * muzstar(+1) * upsil_p * i(+1) / i - muzstar_p * upsil_p)) 
                 - exp(-sqrt(Sdoupr_p / 2) * (zetai(+1) * muzstar(+1) * upsil_p * i(+1) / i - muzstar_p * upsil_p)))); 

  # Fp1        = (normcdf((log(omegabar(+1)) + sigma^2 / 2) / sigma)); 

  # Gp1        = (normcdf((log(omegabar(+1)) + sigma^2 / 2) / sigma - sigma)); 

  # G_ss       = (normcdf((log(steady_state(omegabar)) + steady_state(sigma)^2 / 2) / steady_state(sigma) - steady_state(sigma), 0, 1));   

  # Rk_ss      = (steady_state(Rk));
  # kbar_ss    = (steady_state(kbar));
  
  # n_ss       = (steady_state(n));
  # sigma_ss   = (steady_state(sigma));
   
  # h_ss       = (steady_state(h));
  # g_ss       = (etag_p * (steady_state(c) + steady_state(i)) / (1 - etag_p));
  
  # Gammap1    = (omegabar(+1) * (1 - Fp1) + Gp1); 

  # Gammaprp1  = (1 - Fp1);

  # Gprp1       = (omegabar(+1) * normpdf((log(omegabar(+1)) + sigma^2 / 2) / sigma) / omegabar(+1) / sigma); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Equations characterizing equilibrium.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Eqn 1: Law of motion for \latex{p^*}
    pstar = ((1 - xip_p) * (Kp / Fp)^(lambdaf/(1-lambdaf)) 
            + xip_p * ((pitilde / pi) * pstar(-1))^(lambdaf/(1-lambdaf)))^((1-lambdaf)/lambdaf); 
  
  % Eqn 2: Law of motion for \latex{F_p}.
    Fp = zetac * lambdaz * yz + (pitildep1 / pi(+1))^(1/(1-lambdaf(+1))) * beta_p * xip_p * Fp(+1); 

  % Eqn 3: Law of motion for \latex{K_p}
  % This error is ignored.
  %  Kp = zetac * lambdaf * lambdaz * pstar^(lambdaf/(lambdaf-1)) * yz * s 
  %       + beta_p * xip_p * (pitildep1 / pi(+1))^(lambdaf(+1)/(1-lambdaf(+1))) * Kpp1;
    Kp = zetac * lambdaf * lambdaz * yz * s 
         + beta_p * xip_p * (pitildep1 / pi(+1))^(lambdaf(+1)/(1-lambdaf(+1))) * Kpp1; 

  % Eqn 4: Relationship between \latex{K_p} and \latex{F_p}.
  % This equation is contained in the definitions of Kp and Kpp1 in the
  % auxiliary equations.
  
  % Eqn 5: Law of motion for \latex{F_w}.
    Fw = zetac * lambdaz * wstar^(lambdaw_p/(lambdaw_p-1)) * h * (1 - taul_p) / lambdaw_p 
         + beta_p * xiw_p * muzstar_p^((1-iotamu_p)/(1-lambdaw_p)) * (muzstar(+1)^(iotamu_p/(1-lambdaw_p)-1))
         * pitildewp1^(1/(1-lambdaw_p)) / pi(+1) * (1 / piwp1)^(lambdaw_p/(1-lambdaw_p))  *  Fw(+1); 


  % Eqn 6: Law of motion for \latex{K_w}.
    Kw = zetac * (wstar^(lambdaw_p/(lambdaw_p-1)) * h)^(1+sigmaL_p) * zeta_p + beta_p * xiw_p
         * (pitildewp1 / piwp1 * muzstar_p^(1-iotamu_p) * muzstar(+1)^iotamu_p)^(lambdaw_p*(1+sigmaL_p)/(1-lambdaw_p)) * Kwp1; 
  
  % Eqn 7: Relationship between \latex{F_w} and \latex{K_w}.
  % This equation is contained in the definitions of Kw and Kwp1 in the
  % auxiliary equations.

  % Eqn 8: Law of motion of \latex{w^*}
    wstar = ((1 - xiw_p) * ( ((1 - xiw_p * (pitildew / piw * muzstar_p^(1-iotamu_p) * muzstar^iotamu_p)^(1/(1-lambdaw_p))) 
            / (1 - xiw_p))^lambdaw_p ) + xiw_p * (pitildew / piw * muzstar_p^(1-iotamu_p) * muzstar^iotamu_p 
            * wstar(-1))^(lambdaw_p/(1-lambdaw_p)))^(1/(lambdaw_p/(1-lambdaw_p)));

   
 
  % Eqn 9: Efficiency condition for setting captial utilization
    rk  = tauo_p * rk_ss * exp(sigmaa_p * (u  - 1));
  
  % Eqn 10: Rental rate on capital 
    rk  = alpha_p * epsil * ((upsil_p * muzstar * h * wstar^(lambdaw_p/(lambdaw_p-1)) /(u  * kbar(-1) ))^(1 - alpha_p)) *  s;
     
  % Eqn 11: Marginal Cost 
    s = (rk  / alpha_p)^alpha_p * (wtilde  / (1 - alpha_p))^(1-alpha_p) / epsil;  

  % Eqn 12: Resource constraint
    
    yz  = g + c  + i   / muup + tauo_p * a  * kbar(-1)  / (muzstar * upsil_p) + d  + bigtheta_p * (1 - gamma) * (n  - we_p) / gamma;   

  % Eqn 13: Law of motion for capital
    kbar  = (1 - delta_p) * kbar(-1)  / (muzstar * upsil_p) + (1 -  S) * i;   

  % Eqn 14: Household FOC w.r.t. risk-free bonds
    0 = beta_p * zetac(+1) * lambdaz(+1)  / (muzstar(+1) * pi(+1))  * (1 + (1 - taud_p) * Re ) - zetac * lambdaz; 
  
  % Eqn 15: Household FOC w.r.t. consumption
    (1 + tauc_p) * zetac * lambdaz  = muzstar * zetac / (c  * muzstar -  b_p * c(-1))    - b_p * beta_p * zetac(+1) / (c(+1)  * muzstar(+1) - b_p * c ); 
  
  % Eqn 16: FOC for capital
    
    %0 = (1 - Gp1 - omegabar(+1) * (1 - Fp1)) * (1 + Rk(+1)) / (1 + Re) + (1 - Fp1) / (1 - Fp1 - mu_p * omegabar(+1) 
    %    * normpdf((log(omegabar(+1)) + sigma^2 / 2) / sigma) / omegabar(+1) / sigma) * ((1 + Rk(+1)) / (1 + Re) * ((1 - mu_p) * Gp1 
    %    + omegabar(+1) * (1 - Fp1)) - 1);

    0 = (1 - Gammap1 ) * (1 + Rk(+1))  / (1 + Re ) + Gammaprp1  / (Gammaprp1  - mu_p * Gprp1 ) * ((1 + Rk(+1))  / (1 + Re)  * (Gammap1  - mu_p * Gp1 ) - 1); 

  % Eqn 17: Definition of return of entrepreneurs, Rk
    1 + Rk  = ((1 - tauk_p) * (u  * rk  - tauo_p * a ) + (1 - delta_p) * q ) * pi        / (upsil_p * q(-1))  + tauk_p * delta_p; 
  
  % Eqn 18: Household FOC w.r.t. investment
    0 = - zetac * lambdaz  / muup + lambdaz  * zetac * q  * (-Spr  * zetai * i   * muzstar * upsil_p / i(-1)   + 1 - S )
        + beta_p * zetac(+1) * lambdaz(+1)  * q(+1)  * Sprp1  * (zetai(+1) * i(+1)  * muzstar(+1) * upsil_p / i  )^2 / (muzstar(+1) * upsil_p); 
  
  % Eqn 19: Definition of yz.  
  % This equation is represented in the definition of yz in the definition
  % of the auxiliary equations.
  
 // @# if cee == 1
  % Eqn 20: Monetary Policy Rule
   // log(Re / Re_p) = rhotil_p * log(Re(-1) / Re_p) + (1 / Re_p) * (1 - rhotil_p) 
   //                  * (aptil_p * pi_p * log(pi(+1) / pitarget) + (1 / 4) * adytil_p*log(yz/yzf));% muzstar_p * log(gdp_obs));
     
  // log(Re / Re_p) = rhotil_p * log(Re(-1) / Re_p) + (1 / Re_p) * (1 - rhotil_p) * (aptil_p * pi_p * log(pi(+1) / pitarget) + (1 / 4) * adytil_p * muzstar_p * log(gdp_obs));
 
   
  //@#endif
 //@# if cee == 1
  % Eqn 20: Monetary Policy Rule
  %  log(Re / Re_p) = rhotil_p * log(Re(-1) / Re_p) + (1 / Re_p) * (1 - rhotil_p) 
  %                   * (aptil_p * pi_p * log(pi(+1) / pitarget) + (1 / 4) * adytil_p * muzstar_p * log(gdp_obs));
  % monetary policy rule with short term interest rate:
   // log(Re / Re_p) = rhotil_p * log(Re(-1) / Re_p) + (1 / Re_p) * (1 - rhotil_p) * pi_p * log(pitarget / pi_p) 
   //                  + (1 / Re_p) * (1 - rhotil_p) * aptil_p * pi_p * (log(pi(+1)) - log(pitarget)) 
   //                  + (1 / (4 * Re_p)) * (1 - rhotil_p) * adytil_p * muzstar_p * ((c_p * log(c / c(-1)) 
   //                  + i_p * log(i / i(-1)) - i_p * log(muup / muup(-1)) + g_p * log(g / g(-1)) ) / ( (c_p+i_p)/(1-etag_p) ) 
   //                  + log(muzstar / muzstar_p)) + (1 / Re_p) * (1 - rhotil_p) * adptil_p * log(pi / pi(-1)) 
   //                  - (1 / (4 * Re_p)) * (1 - rhotil_p) * aytil_p * (c_p * log(c / c_p) + i_p * log(i / i_p) 
   //                  - i_p * log(muup) + g_p * log(g / g_p)) / ((c_p+i_p)/(1-etag_p))
   //                  + (1 - @{stopshock}) * (1 / (400 * Re_p)) * e_xp;
  //@#else
    % monetary policy rule with short term interest rate:
    log(Re / Re_p) = rhotil_p * log(Re(-1) / Re_p) + (1 / Re_p) * (1 - rhotil_p) * pi_p * log(pitarget / pi_p) 
                     + (1 / Re_p) * (1 - rhotil_p) * aptil_p * pi_p * (log(pi(+1)) - log(pitarget)) 
                     + (1 / (4 * Re_p)) * (1 - rhotil_p) * adytil_p * muzstar_p * ((c_p * log(c / c(-1)) 
                     + i_p * log(i / i(-1)) - i_p * log(muup / muup(-1)) + g_p * log(g / g(-1)) ) / ( (c_p+i_p)/(1-etag_p) ) 
                     + log(muzstar / muzstar_p)) + (1 / Re_p) * (1 - rhotil_p) * actil_p * muzstar_p * (log(q * kbar - n) 
                     - log(q(-1)*kbar(-1)-n(-1)) + log(muzstar / muzstar_p)) + (1 / Re_p) * (1 - rhotil_p) * adptil_p * log(pi / pi(-1)) 
                     - (1 / (4 * Re_p)) * (1 - rhotil_p) * aytil_p * (c_p * log(c / c_p) + i_p * log(i / i_p) 
                     - i_p * log(muup) + g_p * log(g / g_p)) / ((c_p+i_p)/(1-etag_p))
                     + (1 - @{stopshock}) * (1 / (400 * Re_p)) * e_xp
    //@# if sigma_in_taylor_rule
    //    - 1 * (sigma - steady_state(sigma));
    //@# else
        ;
    //@# endif
  //@#endif




  % Eqn 21: GDP
  % This is not used.  It is only used in the manuscript in the monetary
  % policy rule.
  %  # y = g + c + i / muup;
  
    
  % Eqn 22: Zero profit condition
    q (-1) * kbar (-1) * (1 + Rk ) * ((1 - mu_p) * G  + omegabar  * (1 - F )) / (n(-1)  * (1 + Re(-1) )) - q(-1)  * kbar(-1)  / n(-1)  + 1;  
  
  % Eqn 23: Law of motion of net worth
    n = gamma / (pi * muzstar) * (Rk  - Re(-1) -((G  + omegabar  * (1 - F )) - ((1 - mu_p) * G  + omegabar  * (1 - F ))) * (1 + Rk )) 
        * kbar(-1)  * q(-1)  + we_p + gamma * (1 + Re(-1) ) * n(-1)  / (pi * muzstar); 

    volEquity  = (1 + Rk ) * q(-1)  * kbar(-1)  / n(-1)  * sqrt( (exp(sigma(-1)^2)/(1-F )*(1-H ) - ((1-G )/(1-F ))^2) ); 

  % Long rate
    log_zetac +log_lambdaz  = 40*(log(1 + RL ) + log(beta_p)) + log_zetac(+40) +log_lambdaz (+40) 
    @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
      + (log_term(@{index}) -( log_pi(@{index})+ log_muzstar(@{index})))
    @#endfor
    ;
 zetac=exp(log_zetac);
lambdaz=exp(log_lambdaz);
term=exp(log_term);
pi=exp(log_pi);
muzstar=exp(log_muzstar);
 % Long rate
 %   zetac * lambdaz  = ((1 + RL ) * beta_p)^40 * zetac(+40) * lambdaz (+40) 
 %   @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
 %     * (term(@{index}) / (pi(@{index})* muzstar(@{index})))
 %   @#endfor
 %   ;
     
 % Real risk free 10 year rate
    log_zetac + log_lambdaz   = 40*log(rL  * beta_p) + log_zetac(+40) + log_lambdaz (+40) 
    @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
      -log_muzstar(@{index})
    @#endfor
    ; 

  % Real risk free 10 year rate
  %    zetac * lambdaz   = (rL  * beta_p)^40 * zetac(+40) * lambdaz (+40) 
  %  @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
  %    /  muzstar(@{index})
  %  @#endfor
  %  ; 
   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Observation equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  consumption_obs = c / c(-1) * muzstar / muzstar_p;
 // @#if cee == 0
  credit_obs      = (q * kbar - n) / (q(-1) * kbar(-1) - n(-1)) * muzstar / muzstar_p;
  //@#endif
  gdp_obs         = (c + i / muup + g) / (c(-1) + i(-1) / muup(-1) + g(-1)) * muzstar / muzstar_p;
  hours_obs       = h / h_ss;
  inflation_obs   =  pi / pi_p;
  investment_obs  = i / i(-1) * muzstar / muzstar_p;
  
  networth_obs    = n / n(-1) * muzstar / muzstar_p;
  premium_obs     = exp((((G + omegabar * (1 - F)) - ((1 - mu_p) * G + omegabar * (1 - F))) * (1 + Rk) * q(-1) * kbar(-1) 
                    / (q(-1) * kbar(-1) - n(-1))) - mu_p * G_ss * (1 + Rk_ss) * kbar_ss / (kbar_ss - n_ss));
  
  pinvest_obs     = muup(-1) / muup;
  Re_obs          = exp(Re - Re_p);
  RealRe_obs      = ((1 + Re) / pi(+1))/((1 + Re_p) / pi_p);
  
  Spread1_obs     = 1 + RL - Re;  
  
  wage_obs        = wtilde / wtilde(-1) * muzstar / muzstar_p;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Shock equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  log(epsil / epsil_p)       = rhoepsil_p    * log(epsil(-1) / epsil_p)       + (1 - @{stopshock}) * e_epsil;
  log(g / g_ss)              = rhog_p        * log(g(-1) / g_ss)              + (1 - @{stopshock}) * e_g;  
  log(gamma / gamma_p)       = rhogamma_p    * log(gamma(-1) / gamma_p)       + (1 - @{stopshock}) * e_gamma;  
  log(lambdaf / lambdaf_p)   = rholambdaf_p  * log(lambdaf(-1) / lambdaf_p)   + (1 - @{stopshock}) * e_lambdaf;
  log(muup / muup_p)         = rhomuup_p     * log(muup(-1) / muup_p)         + (1 - @{stopshock}) * e_muup;
  log(muzstar / muzstar_p)   = rhomuzstar_p  * log(muzstar(-1) / muzstar_p)   + (1 - @{stopshock}) * e_muzstar;
  log(pitarget / pitarget_p) = rhopitarget_p * log(pitarget(-1) / pitarget_p) + (1 - @{stopshock}) * e_pitarget; 
  log(term / term_p)         = rhoterm_p     * log(term(-1) / term_p)         + (1 - @{stopshock}) * e_term;
  log(zetac / zetac_p)       = rhozetac_p    * log(zetac(-1) / zetac_p)       + (1 - @{stopshock}) * e_zetac;
  log(zetai / zetai_p)       = rhozetai_p    * log(zetai(-1) / zetai_p)       + (1 - @{stopshock}) * e_zetai;  
  log(sigma / sigma_ss)      = rhosigma_p    * log(sigma(-1) / sigma_ss)  + log_xi0 
  @#for index in ["1", "2", "3", "4", "5", "6", "7", "8"]
    + log_xi@{index}(-@{index})
  @#endfor 
  ;
log_xi0=log(xi0);
log_xi1=log(xi1);
log_xi2=log(xi2);
log_xi3=log(xi3);
log_xi4=log(xi4);
log_xi5=log(xi5);
log_xi6=log(xi6);
log_xi7=log(xi7);
log_xi8=log(xi8); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Signal equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  @#if ("8" in possible_signals)
  log(xi8) = stdsigma2_p * e_xi8;
  @#else
  log(xi8) = 0;
  @#endif
  
  @#if ("7" in possible_signals)
  log(xi7) = signal_corr_p * stdsigma2_p * e_xi8 
  @#for index in ["7"]
    + sqrt(1 - signal_corr_p^2) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi7) = 0;
  @#endif
  
  @#if ("6" in possible_signals)
  log(xi6) = signal_corr_p^2 * stdsigma2_p * e_xi8
  @#for index in ["7", "6"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 6) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi6) = 0;
  @#endif

  @#if ("5" in possible_signals)
  log(xi5) = signal_corr_p^3 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 5) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi5) = 0;
  @#endif

  @#if ("4" in possible_signals)
  log(xi4) = signal_corr_p^4 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 4) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi4) = 0;
  @#endif

  @#if ("3" in possible_signals)  
  log(xi3) = signal_corr_p^5 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 3) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi3) = 0;
  @#endif

  @#if ("2" in possible_signals)  
  log(xi2) = signal_corr_p^6 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 2) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi2) = 0;
  @#endif
  
  @#if ("1" in possible_signals)
  log(xi1) = signal_corr_p^7 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2", "1"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 1) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi1) = 0;
  @#endif
  
  @# if ("0" in possible_signals)
  log(xi0) = signal_corr_p^8 * stdsigma1_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2", "1"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 0) * stdsigma1_p * e_xi@{index}
  @#endfor
  + sqrt(1-signal_corr_p^2) * stdsigma1_p * e_sigma;
  @#else
  log(xi0)=0;
  @#endif  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This ensures zero profits.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  phi = steady_state(phi); 

end;

steady;
check;
shocks; 
var e_xp;       stderr 1;//stdxp_p;
var e_lambdaf;  stderr stdlambdaf_p;
var e_pitarget; stderr stdpitarget_p;
var e_muup;     stderr stdmuup_p;
var e_g;        stderr stdg_p;
var e_muzstar;  stderr stdmuzstar_p; 
var e_gamma;    stderr stdgamma_p; 
var e_epsil;    stderr stdepsil_p; 
var e_sigma;    stderr 1-@{stopunant}; 
var e_zetac;    stderr stdzetac_p;
var e_zetai;    stderr stdzetai_p; 
var e_term;     stderr stdterm_p; 
var e_xi8;      stderr 1-@{stopsignal};
var e_xi7;      stderr 1-@{stopsignal};
var e_xi6;      stderr 1-@{stopsignal};
var e_xi5;      stderr 1-@{stopsignal};
var e_xi4;      stderr 1-@{stopsignal};
var e_xi3;      stderr 1-@{stopsignal};
var e_xi2;      stderr 1-@{stopsignal};
var e_xi1;      stderr 1-@{stopsignal};  
end;
stoch_simul(order=1, irf=40,nograph);