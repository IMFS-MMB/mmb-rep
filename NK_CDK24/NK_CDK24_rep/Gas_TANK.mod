%===================================================================================================
% Dynare Code for Small Open-Economy Gas-TANK Model without capital
% Authors: Chan, Diz, Kanngiesser
% April 2023 
%===================================================================================================
%===================================================================================================

% Decide whether to use cobb-douglas production function
% use CES
@#ifndef CES
    @#define CES_yes = 1
@#endif 

% use COBBD
@#ifndef COBBD
    @#define CES_yes = 0
@#endif 

% do Ramsey
@#ifndef Ramsey
    @#define ramsey_yes = 1
@#endif 

% do Taylor
@#ifndef Taylor
    @#define ramsey_yes = 0
@#endif 


@#define cobb_douglas_yes = 0


%===================================================================================================
% VARIABLES
%===================================================================================================

var


% New Variables ------------------------------------------------------------------------------------

CES_u          $CES_{u,}$              (long_name='CES bundle, unconstrained HH')
CES_u_flex     $CES_{u,flex,}$         (long_name='CES bundle, unconstrained HH, flexP')
CES_c          $CES_{c,}$              (long_name='CES bundle constrained HH')
CES_c_flex     $CES_{c,flex,}$         (long_name='CES bundle constrained HH, flexP')

E_h_u          $E^h_{u,}$              (long_name='Energy consumed by unconstrained HH')
E_h_u_flex     $E^h_{u,flex,}$         (long_name='Energy consumed by unconstrained HH, flexP')
E_h_c          $E^h_{c,}$              (long_name='Energy consumed by constrained HH')
E_h_c_flex     $E^h_{c,flex,}$         (long_name='Energy consumed by constrained HH, flexP')
E_h            $E^h_{c,}$              (long_name='Energy consumed by HH')
E_h_flex       $E^h_{c,flex,}$         (long_name='Energy consumed by HH, flexP')

pCES_u         $p^{CES_u}$             (long_name='Price of CES bundle, unconstrained HH')
pCES_u_flex    $p^{CES_u}_{flex,}$     (long_name='Price of CES bundle, unconstrained HH, flexP')
pCES_c         $p^{CES_c}$             (long_name='Price of CES bundle, constrained HH')
pCES_c_flex    $p^{CES_c}_{flex,}$     (long_name='Price of CES bundle, constrained HH, flexP')
pCPI           $p^{CPI}$               (long_name='CPI')
pCPI_flex      $p^{CPI}_{flex,}$       (long_name='CPI, flexP')

Pi_CPI         ${\Pi}^{CPI}$           (long_name='CPI Inflation')
Pi_CPI_lag1    ${\Pi}^{CPI,lag1}$      (long_name='CPI Inflation, lag1')
Pi_CPI_lag2    ${\Pi}^{CPI,lag2}$      (long_name='CPI Inflation, lag2')
Pi_CPI_ann     ${\Pi}^{CPI,ann}$       (long_name='CPI Inflation, annual')

Pi_CPI_flex     ${\Pi}^{CPI,flex}$     (long_name='CPI Inflation')
Pi_CPI_lag1_flex${\Pi}^{CPI,lag1,flex}$(long_name='CPI Inflation, lag1')
Pi_CPI_lag2_flex${\Pi}^{CPI,lag2,flex}$(long_name='CPI Inflation, lag2')
Pi_CPI_ann_flex ${\Pi}^{CPI,ann,flex}$ (long_name='CPI Inflation, annual')


Pi_CES_u       $\Pi^{CES_u}$           (long_name='Price inflation of CES bundle, unconstrained HH')
Pi_CES_u_flex  $\Pi^{CES_u}_{flex}$    (long_name='Price inflation of CES bundle, unconstrained HH, flexP')

% Key Variables ------------------------------------------------------------------------------------

mrs_c          $mrs_{c,}$              (long_name='MRS constrained HH')
mrs_c_flex     $mrs_{c,flex,}$         (long_name='FlexP MRS between c and l, constrained HH')
mrs_u          $mrs_{u,}$              (long_name='MRS unconstrained HH')
mrs_u_flex     $mrs_{u,flex,}$         (long_name='FlexP MRS between c and l, unconstrained HH')

C_u            $C_{u,}$                (long_name='Consumption, unconstrained HH')
C_u_flex       $C_{u,flex,}$           (long_name='FlexP Consumption of optimisers')
C_c            $C_{c,}$                (long_name='Consumption, constrained HH')
C_c_flex       $C_{c,flex,}$           (long_name='FlexP Consumption of rule of thumb hh')
C              $C$                     (long_name='Consumption, total')
C_flex         $C_{flex}$              (long_name='FlexP Total Consumption')

N_c            $N_{c,}	$              (long_name='Hours worked, constrained HH')
N_c_flex       $N_{c,flex,}$           (long_name='FlexP Hours worked, constrained HH')
N_u            $N_{u,}	$              (long_name='Hours worked, unconstrained HH')
N_u_flex       $N_{u,flex,}$           (long_name='FlexP Hours worked, unconstrained HH')
N              $N$                     (long_name='Hours worked, total')
N_flex         $N_{flex,}$             (long_name='FlexP Hours worked, total')

UN_c           $U^{N}_{c,}$            (long_name='MU of Labour, constrained HHs')
UN_c_flex      $U^{N}_{c,flex,}$       (long_name='FlexP Marginal Utility of Labour, constrained HH')
UN_u           $U^{N}_{u,}$            (long_name='MU of Labour, capitaist')
UN_u_flex      $U^{N}_{u,flex,}$       (long_name='FlexP Marginal Utility of Labour, unconstrained HH')

NFA            ${NFA }$                (long_name='NFA')
NFA_flex       ${NFAflex}$             (long_name='NFA flex')

LAMBDA         ${\Lambda }$            (long_name='SDF, aggregate')
LAMBDA_flex    ${\Lambda_{flex,}}$     (long_name='SDF flex, aggregate')
LAMBDA_u       ${\Lambda}_{u,}$        (long_name='SDF, unconstrained HH')
LAMBDA_u_flex  ${\Lambda_{u,flex,}}$   (long_name='Flex SDF, unconstrained HH')

lambda_u       ${\lambda_{u,}}$        (long_name='MU of Consumption, unconstrained HH')
lambda_u_flex  ${\lambda_{u,flex,}}$   (long_name='FlexP Marginal Utility of Consumption, unconstrained HH')
lambda_c       ${\lambda_{c,}}$        (long_name='MU of Consumption, constrained HH')
lambda_c_flex  ${\lambda_{c,flex,}}$   (long_name='FlexP Marginal Utility of Consumption, constrained HH')

b              $b$                     (long_name='Bonds, aggregate')
b_flex         $b_{flex}$              (long_name='FlexP Bonds, aggregate')
bf             $b^*$                   (long_name='Bonds (forgeign)')
bf_flex        $b^{*}_{flex,}$         (long_name='FlexP Bonds (foreign)')

Z              $Z$                     (long_name='Final Output')
Z_flex         $Z_{flex,}$             (long_name='FlexP Final Output')
E_z            $E^z$                   (long_name='Firm Energy Imports')
E_z_flex       $E^z_{flex,}$           (long_name='Firm Energy FlexP Imports')
X              $X$                     (long_name='Exports')
X_flex         $X_{flex,}$             (long_name='FlexP Exports')

Y_gap          $\hat{Y}$               (long_name='Output Gap')

Q              $\mathcal{Q}$           (long_name='Real Exchange Rate')
Q_flex         $\mathcal{Q}_{flex,}$   (long_name='FlexP Real Exchange Rate')

R_nom          $R	$                  (long_name='Gross Nominal Interest Rate')
R_nom_flex     $R_{flex,}$             (long_name='FlexP Gross Nominal Interest Rate')
R_real         $R^r	$                  (long_name='Gross Real Interest Rate')

w              $w	$                  (long_name='Real Wage (Labor Cost for firms)')
w_flex         $w^{flex}$              (long_name='FlexP Real Wage (factor cost of	labor for va firms)')
wh             $w^h$                   (long_name='Real Wage (received by HHs)')
wh_flex        $w^{h,flex}$            (long_name='FlexP Real Wage received by household')

mcw            $mc^{W}$                (long_name='Real Marginal Cost of Labour Unions')
mcw_flex       $mc^{W,flex}$           (long_name='FlexP Marginal Cost of Labour Unions')
mcz            $mc^{Z}$                (long_name='Real Marginal Cost of Final Output Firms')
mcz_flex       $mc^{Z,flex}$           (long_name='FlexP Marginal Cost of Final Output Firms')

Pi_w           ${\Pi^{W}}$             (long_name='Wage Inflation')
Pi_w_flex      ${\Pi^{W,flex}}$        (long_name='FlexP Wage Inflation')
Pi_w_ann       ${\Pi^{W,ann}}$         (long_name='Wage Inflation,	annualised')
Pi_w_lag1      $piw_lag1$              (long_name='Wage Inflation, lag1')
Pi_w_lag2      $piw_lag2$              (long_name='Wage Inflation, lag2')

Pi_z           ${\Pi^{Z}}$             (long_name='Final Output Good Inflation')
Pi_z_flex      ${\Pi^{Z,flex}}$        (long_name='FlexP Final Output Good Inflation')

Pi_z_ann       ${\Pi^{Z,ann}}$         (long_name='Final Output Inflation,	annualised')
Pi_z_lag1      $piz_lag1$              (long_name='Final Output Inflation, lag1')
Pi_z_lag2      $piz_lag2$              (long_name='Final Output Inflation, lag2')

                                      
pE             $p^{E}$                 (long_name='Price of imports in terms of final output')
pE_flex        $p^{E,flex}$            (long_name='FlexP Price of imports in terms of final output')
pEf            $p^{E^{*}}$             (long_name='Foreign Energy Good Price')
pExp           $p^{EXP}$               (long_name='Domestic Export Good Price (in frgn crrncy)')
pExp_flex      $p^{EXP,flex}$          (long_name='FlexP Domestic Export Good Price (in frgn crrncy)')
pX             $p^X$                   (long_name='Domestic Export Good Price (in dom crrncy)')
pC             $p^C$                   (long_name='Domestic Consumption Good Price (in dom crrncy)')
pC_flex        $p^{C,flex}$            (long_name='Domestic Consumption Good Price (in dom crrncy), flex price')

f1w            ${\mathcal{F}_1^W}$     (long_name='Def - Optimal Wage Setting, Num')
f2w            ${\mathcal{F}_2^W}$     (long_name='Def - Optimal Wage Setting, Denom')
f1z            ${\mathcal{F}_1^Z}$     (long_name='Def - Optimal Final Output Price Setting, Num')
f2z            ${\mathcal{F}_2^Z}$     (long_name='Def - Optimal Final Output Price Setting, Denom')
dispw          ${Disp^W}$              (long_name='Wage Dispersion')
dispz          ${Disp^V}$              (long_name='Final Output Price Dispersion')
zetaw          ${\zeta^{W}}$           (long_name='Def - Wage Inflation deviation from index')
zetaz          ${\zeta^{Z}}$           (long_name='Def - Final Output Inflation deviation from index')

div_F          ${div^F}$               (long_name='Firm Profits, total')
div_F_flex     ${div^{F,total,flex}}$  (long_name='FlexP total Firm Profit from Mono Comp, total')
div_Z          ${div^{Z}}$             (long_name='Firm Z Profit from Mono Comp, Z')
div_Z_flex     ${div^{Z,flex}}$        (long_name='FlexP Firm Z Profit from Mono Comp, Z')
div_L          ${div^{L}}$             (long_name='Labour Union Profits from Mono Comp, W')
div_L_flex     ${div^{L,flex}}$        (long_name='FlexP Profit from Mono Comp, W')

t_F            $t^F$                   (long_name='Lump-sum tax to subside for total firm profits')
t_F_flex       $t^{F,flex}$            (long_name='Lump-sum tax to subside for total firm profits, flex prices')
t_Z            $t^Z$                   (long_name='Lump-sum tax to subside for Z firm profits')
t_Z_flex       $t^{Z,flex}$            (long_name='Lump-sum tax to subside for Z firm profits, flex prices')
t_L            $t^L$                   (long_name='Lump-sum tax to subside for lab unrion profits')
t_L_flex       $t^{L,flex}$            (long_name='Lump-sum tax to subside for lab unrion profits, flex prices')

C_gap          $\Gamma$                (long_name='Consumption gap') 
C_gap_flex     $\Gamma^{flex}$         (long_name='Consumption gap, flex prices')
I_gap          $\hat{I}$               (long_name='Income gap') 

C_gap_CES      $\Gamma^{CES}$          (long_name='CES Consumption gap') 


% auxiliary-------
C_lag1         $C^{lag1}$              (long_name='Lag1 of Total Consumption')
C_u_lag1       $C^{u,lag1}$            (long_name='Lag1 of unconstrained Consumption')
C_c_lag1       $C^{c,lag1}$            (long_name='Lag1 of constrained Consumption')

% measurements-------
dlnckp         $dlnckp$                (long_name='Consumption growth') 
dlnhrs         $dlnhrs$                (long_name='Hours worked growth')       
dlnhrs_u       $dlnhrs$                (long_name='Hours worked growth, u')       
dlnhrs_c       $dlnhrs$                (long_name='Hours worked growth, c')       

dlnzkp         $dlnzkp$                (long_name='Final Output Z growth')       
dlnckp_c       $dlnckp^c$              (long_name='Constrained Consumption growth')        
dlnckp_u       $dlnckp^u$              (long_name='Unconstrained Consumption growth')        
dlneer         $dlneer$                (long_name='Real Exchange rate growth')
dlnxkp         $dlnxkp$                (long_name='Export growth')
dlnmkp         $dlnmkp$                (long_name='Import growth')
output_gap     $OG$                    (long_name='Output gap')
dlnNFA         $dlnNFA$                (long_name='NFA growth')

dlnehkp           
dlnehkp_c          
dlnehkp_u        
dlnezkp     

dlnCESkp_c        
dlnCESkp_u          

dlnMarkup_Z     
dlnMarkup_W

wh_logdev
w_logdev

dlnDiv_Z

dlnw
dlnwh

markup_Z
%markup_W


inc_u
inc_c

I_gap_component      
Borrowing_component 
Hours_credit_component

Expected_Pi_CES_u

Pi_E     
Pi_E_lag1     
Pi_E_lag2     
Pi_E_ann     

Expected_Pi_E  
pE_over_w

z_hat
n_hat
z_minus_n_hat

Pi_w_over_Pi_z

markup_Z_effective     
dlnMarkup_Z_effective  


% Forcing Processes --------------------------------------------------------------------------------
eps_tfp        ${\varepsilon}^{TFP}$     (long_name='TFP forcing process')                      
eps_pEf        ${\varepsilon}^{P^{X^F}}$ (long_name='World Export Price level forcing process')
eps_muz        ${\varepsilon}^{MZ}$      (long_name='Price Markup forcing process')      
eps_R          ${\varepsilon}^{R}$       (long_name='Monetary Policy forcing process')              
;

%===================================================================================================
% EXO VARIABLES
%===================================================================================================

varexo 
eta_tfp        $\eta^{TFP}$             (long_name='TFP Shock')
eta_pEf        $\eta^{P^{F}_{X}}$       (long_name='World energy/export price Shock') 
eta_muz        $\eta^{\mathcal{M}}$     (long_name='Price Markup Z Shock')
eta_R          $\eta^{\mathcal{M}}$     (long_name='Monetary Policy Shock')

eta_pEf_news   $\eta^{P^{E}_{*}}$       (long_name='World energy/export price NEWS Shock') 
;

%===================================================================================================
% PARAMETERS
%===================================================================================================

parameters 

% New parameters ----------------------------------------------------------------------------
ppsi_ec       $\psi_{ec}$              (long_name='Elas of sub beteen Non-energy and Energy in cons, CES')
alppha_uec    $\alpha_{u,ec}$          (long_name='Energy Share in consumption, unconstrained HH')
alppha_cec    $\alpha_{c,ec}$          (long_name='Energy Share in consumption, constrained HH')


% Structural parameters ----------------------------------------------------------------------------
ppsi_ez       $\psi_{ez}$              (long_name='Elas of sub beteen Lab and Energy in prod, CES')
alppha_ez     $\alpha_{ez}$            (long_name='Firm Energy Share in production')



bond_adj_u    $\vartheta_u^*$          (long_name='Worker bond adjustment cost')    
cbeta         $\beta$                  (long_name='Households subjective discount factor')                      
siggma        $\sigma$                 (long_name='Coefficient of relative risk-aversion')           
varphi        $\varphi$                (long_name='Inverse of Frisch elasticity')                    
chi_u         $\chi$                   (long_name='Disutility of labour')                                       
chi_c         $\chi$                   (long_name='Disutility of labour')                                       


epsilonf      $\varsigma^*$            (long_name='Price elasticity of world demand for UK exports') 
omega         $\omega$                 (long_name='Share of constrained HH households')              

phiw          $\phi_{W}$               (long_name='Wage adjustment costs')                           
phiz          $\phi_{Z}$               (long_name='Final output price adjustment cost')              
xiw           ${\xi_{W}}$              (long_name='Indexation of nominal wages')                     
xiz           ${\xi_{Z}}$              (long_name='Indexation of final output prices')               
Pistar        ${\Pi^{*}}$              (long_name='Quarterly inflation target')                      
thetaPi       $\theta^{\Pi}$           (long_name='Monetary policy response to inflation')           
thetaR        $\theta^{R}$             (long_name='Interest rate smoothing')                         
thetaY        $\theta^{Y}$             (long_name='Monetary policy response of output gap')          

% Shock parameters ---------------------------------------------------------------------------------
sigma_tfp      ${\sigma_{tfp}}$         (long_name='StDev of tfp forcing process')
sigma_pEf      ${\sigma_{{E^{*}}}}$     (long_name='StDev of energy forcing process')
sigma_muz      ${\sigma_{\mathcal{M}}}$ (long_name='StDev of markup forcing process')
sigma_R        ${\sigma_{R}}$           (long_name='StDev of mon pol forcing process')

rho_tfp        ${\rho_{tfp}}$           (long_name='Pers of tfp forcing proces')
rho_pEf        ${\rho_{{E^{*}}}}$       (long_name='Pers of energy forcing process')        
rho_muz        ${\rho_{\mathcal{M}}}$   (long_name='Pers of markup forcing proces')
rho_R          ${\rho_{R}}$             (long_name='Pers of mon pol forcing proces')

% Steady State parameters --------------------------------------------------------------------------
R_nomf_ss     $\bar{R}^{*}$            (long_name='SS taumuw')
Pivf_ss       $\bar{\Pi}^{*}$          (long_name='SS taumuw')
muz_ss        $\mathcal{M}^{Z}_{ss}$   (long_name='SS taumuw')
muw_ss        $\mathcal{M}^{W}_{ss}$   (long_name='SS taumuw')
pEf_ss        $pxf_{ss}$               (long_name='pxf ss')
vf_ss         $vf_{ss}$                (long_name='vf ss')
kappaf_ss     $kappaf_{ss}$            (long_name='kappaf ss')
N_ss          $N_{ss}$                 (long_name='N')
omegaxz_ss    $\omega^{xz}_{ss}$       (long_name='omegaxz')
taumuw_ss     $\tau^{{M}^W}_{ss}$      (long_name='SS taumuw')
taumuz_ss     $\tau^{{M}^Z}_{ss}$      (long_name='SS taumuz')
trans_c       $\mathcal{T}_c$          (long_name='transc')
trans_u       $\mathcal{T}_u$          (long_name='transu')

gammah_ss     $\Gamma^H$               (long_name='Population trend growth')

CES_scale      $CES$                   (long_name='CES')
CD_yes_para    $CD$                    (long_name='CD')
ramsey_yes_para$ramsey$                (long_name='ramsey')
;

%===================================================================================================
% CALIBRATION
%===================================================================================================

@#include "set_parameters.m"

@#if CES_yes == 0
ppsi_ez=0.999;
@#endif

% overwrite this in ss file
CES_scale=0; R_nomf_ss=0;
Pivf_ss=0; vf_ss=0; kappaf_ss=0; taumuw_ss=0; trans_c=0; trans_u=0;

@#if cobb_douglas_yes == 1
CD_yes_para=1;
@#else
CD_yes_para=0;
@#endif

@#if ramsey_yes == 1
ramsey_yes_para=1;
@#else
ramsey_yes_para=0;
@#endif


%===================================================================================================
% MODEL EQUATIONS
%===================================================================================================

model;
         
























%% -------------------------------------------------------------------------------------------------
%% Households --------------------------------------------------------------------------------------

% Unconstrained HHs ------------------------------------


% EQUATION 1
[name='C demand, unconstrained HH']
C_u           = (pC/pCES_u)^(-ppsi_ec)*(1-alppha_uec)*CES_u;
C_u_flex      = (pC_flex/pCES_u_flex)^(-ppsi_ec)*(1-alppha_uec)*CES_u_flex;

% EQUATION 2
[name='E demand, unconstrained HH']
E_h_u         = (pE/pCES_u)^(-ppsi_ec)*(alppha_uec)*CES_u;
E_h_u_flex    = (pE_flex/pCES_u_flex)^(-ppsi_ec)*(alppha_uec)*CES_u_flex;

% EQUATION 3
[name='CES bundle price, unconstrained HH']
pCES_u        = ((1-alppha_uec)*pC^(1-ppsi_ec)     +(alppha_uec)*pE^(1-ppsi_ec)  )^(1/(1-ppsi_ec));
pCES_u_flex   = ((1-alppha_uec)*pC_flex^(1-ppsi_ec)+(alppha_uec)*pE_flex^(1-ppsi_ec))^(1/(1-ppsi_ec));

% EQUATION 4
[name='HH Lambda C, unconstrained HH']
lambda_u       = ((CES_u)     )^(-siggma);
lambda_u_flex  = ((CES_u_flex))^(-siggma);

% EQUATION 5
[name='MRS definition, unconstrained HH']
mrs_u          = -UN_u/(lambda_u/pCES_u);  
mrs_u_flex     = -UN_u_flex/(lambda_u_flex/pCES_u_flex);  

% EQUATION 6
[name='Marginal utility of lab supply definition, unconstrained HH']
UN_u      = (-chi_u*((dispw)*(N_u))^varphi);          
UN_u_flex = (-chi_u*((N_u_flex))^varphi); 

% EQUATION 7
[name='Consumption Euler equation, unconstrained HH'] 
1 = LAMBDA_u(+1)     *(R_nom     /(Pi_CES_u(+1)))    ; 
1 = LAMBDA_u_flex(+1)*(R_nom_flex/(Pi_CES_u_flex(+1))); 

% EQUATION 8
[name='CES bundle price inflation definition, unconstrained HH'] 
Pi_CES_u      = pCES_u/pCES_u(-1)*Pi_z;
Pi_CES_u_flex = pCES_u_flex/pCES_u_flex(-1)*Pi_z_flex;

% EQUATION 9
[name='UIP condition, unconstrained HH']
1-bond_adj_u*(bf/(1-omega)*Q-STEADY_STATE(bf)/(1-omega))           
= LAMBDA_u(+1)     /Pi_CES_u(+1)     *(   R_nomf_ss  *Pi_z(+1)    /(Pivf_ss)     * (Q(+1)/Q)          );
1-bond_adj_u*(bf_flex/(1-omega)*Q_flex-STEADY_STATE(bf)/(1-omega)) 
= LAMBDA_u_flex(+1)/Pi_CES_u_flex(+1)*(   R_nomf_ss  *Pi_z_flex(+1)/(Pivf_ss)    * (Q_flex(+1)/Q_flex)  );
%Q=1;
%Q_flex=1;

% EQUATION 10
[name='SDF, unconstrained HH']
LAMBDA_u      = cbeta     * (lambda_u/lambda_u(-1));
LAMBDA_u_flex = cbeta     * (lambda_u_flex/lambda_u_flex(-1));

% EQUATION 11
[name='Budget, unconstrained HH']
pC*C_u          = w*(N_u)  
                +( (bf*Q)-(R_nomf_ss*(bf(-1))*Q)/(Pivf_ss*gammah_ss)+(div_F-t_F))/(1-omega) 
                -bond_adj_u/(2*(1-omega)^2)*(Q*bf-STEADY_STATE(bf))^2 -trans_u - pE*E_h_u;
pC_flex*C_u_flex= w_flex*N_u_flex      
                +( Q_flex*bf_flex-(R_nomf_ss*(bf_flex(-1))*Q_flex)/(Pivf_ss*gammah_ss)+(div_F_flex-t_F_flex))/(1-omega)
                -bond_adj_u/(2*(1-omega)^2)*(Q_flex*bf_flex-STEADY_STATE(bf))^2-trans_u - pE_flex*E_h_u_flex;

% EQUATION 12
[name='Profits from Firm Ownership, unconstrained HH']
div_F      = div_Z    ;
div_F_flex = div_Z_flex;

% Workers ------------------------------------

% EQUATION 13
[name='C demand, constrained HH']
C_c           = (pC/pCES_c)^(-ppsi_ec)*(1-alppha_cec)*CES_c;
C_c_flex      = (pC_flex/pCES_c_flex)^(-ppsi_ec)*(1-alppha_cec)*CES_c_flex;

% EQUATION 14
[name='E demand, constrained HH']
E_h_c         = (pE/pCES_c)^(-ppsi_ec)*(alppha_cec)*CES_c;
E_h_c_flex    = (pE_flex/pCES_c_flex)^(-ppsi_ec)*(alppha_cec)*CES_c_flex;

% EQUATION 15
[name='CES bundle price, constrained HH']
pCES_c        = ((1-alppha_cec)*pC^(1-ppsi_ec)     +(alppha_cec)*pE^(1-ppsi_ec)  )^(1/(1-ppsi_ec));
pCES_c_flex   = ((1-alppha_cec)*pC_flex^(1-ppsi_ec)+(alppha_cec)*pE_flex^(1-ppsi_ec))^(1/(1-ppsi_ec));

% EQUATION 16
[name='Marginal utility of consumption, constrained HH']
lambda_c      = ((CES_c)     )^(-siggma);
lambda_c_flex = ((CES_c_flex) )^(-siggma);

% EQUATION 17
[name='MRS, constrained HH']
(mrs_c)      = -UN_c/(lambda_c/pCES_c);  
(mrs_c_flex) = -UN_c_flex/(lambda_c_flex/pCES_c_flex);  

% EQUATION 18
[name='marginal utility of lab supply, constrained HH']
UN_c     = (-chi_c*((dispw)*(N_c))^varphi);          
UN_c_flex = (-chi_c*((N_c_flex))^varphi); 

% EQUATION 19
[name='Budget, constrained HH']
pC*C_c           = w*(N_c)          + trans_c-pE*E_h_c;         
pC_flex*C_c_flex = w_flex*(N_c_flex)+ trans_c-pE_flex*E_h_c_flex; 

% Auxiliary Household Equations -------------------------------------------
            
% EQUATION 20
[name='Firm subsidy components']
t_F        = t_Z;                                             
t_F_flex   = t_Z_flex;

% EQUATION 21
[name='Final output firm subsidy']
t_Z        = (1-taumuz_ss*eps_muz)*(w*N+pE*E_z);                     
t_Z_flex   = (1-taumuz_ss*eps_muz)*(w_flex*N_flex+pE_flex*E_z_flex);

% EQUATION 22
[name='Union subsidy']
t_L        = (1-taumuw_ss)*wh*N;                     
t_L_flex   = (1-taumuw_ss)*wh_flex*N_flex;

% Aggregation and Market Clearing ------------------------------------

% EQUATION 23
[name='Aggregate nonenergy consumption']
(C)      = omega*C_c      + (1-omega)*(C_u)    ; 
(C_flex) = omega*C_c_flex + (1-omega)*(C_u_flex); 

% EQUATION 24
[name='Aggregate HH Energy consumption']
E_h           = omega*E_h_c      + (1-omega)*E_h_u;
E_h_flex      = omega*E_h_c_flex + (1-omega)*E_h_u_flex;

% EQUATION 25
[name='Aggregate employment']
N      = (1-omega)*(N_u)      + (omega)*(N_c); 
N_flex = (1-omega)*(N_u_flex) + (omega)*(N_c_flex); 

% EQUATION 26
[name='Aggregate SDF (for union problem)']
LAMBDA      = (1-omega)*(LAMBDA_u)      ; 
LAMBDA_flex = (1-omega)*(LAMBDA_u_flex) ; 

% EQUATION 27
[name='CPI']
pCPI          = omega*pCES_c      + (1-omega)*pCES_u;
pCPI_flex     = omega*pCES_c_flex + (1-omega)*pCES_u_flex;

% EQUATION 28
[name='Domestic Bond/GovDebt in zero net supply']%[name='Fiscal Rule'] 
b      = 0; %(t-t_ss)/z_ss=phi_t*(t(-1)-t_ss)/z_ss+phi_b*(b(-1)-b_ss)/z_ss+phi_g*(g-g_ss)/z_ss;
b_flex = 0; %(t_flex-t_ss)/z_ss=phi_t*(t_flex(-1)-t_ss)/z_ss+phi_b*(b_flex(-1)-b_ss)/z_ss+phi_g*(g-g_ss)/z_ss;

% EQUATION 29
[name='Goods market clearing']
Z     =pC*C          +pX*X     +(1-omega)*bond_adj_u/2*(Q*bf/(1-omega)          -STEADY_STATE(bf)/(1-omega))^2 ; 
Z_flex=pC_flex*C_flex+pX*X_flex+(1-omega)*bond_adj_u/2*(Q_flex*bf_flex/(1-omega)-STEADY_STATE(bf)/(1-omega))^2; 

% EQUATION 30
[name='NFA']
NFA      = -bf     *Q       + (R_nomf_ss*(bf(-1))*Q)          /(Pivf_ss*gammah_ss);
NFA_flex = -bf_flex*Q_flex  + (R_nomf_ss*(bf_flex(-1))*Q_flex)/(Pivf_ss*gammah_ss);
%NFA=STEADY_STATE(NFA);
%NFA_flex=STEADY_STATE(NFA);

% EQUATION 31
[name='Consumption Gap']
C_gap      = (CES_u/CES_c);% unconstrained over constrained, 100*log diff, approx percent difference
C_gap_flex = (CES_u_flex/CES_c_flex); 

% EQUATION 32-34
[name='Income Gap']
inc_u      = w*(N_u)+(div_F-t_F)/(1-omega)-trans_u;
inc_c      = w*(N_c)+trans_c;
I_gap      = inc_u/inc_c;
%I_gap      = 100*log((w*(dispw)*(N_u)+(div_F-t_F)/(1-omega)-trans_u/(1-omega))/ (w*(dispw)*(N_c) + trans_c/(omega)));

% decomposition for C gap, page A-6 in appendix
I_gap_component     = I_gap;
Borrowing_component = C_gap-I_gap;

Hours_credit_component = -omega*steady_state(C)/steady_state(Z)*log((C_u/C_c)/(steady_state(C_u)/steady_state(C_c)));


%% ------------------------------------------------------------------------------------------------
%% Labour Union -----------------------------------------------------------------------------------

% EQUATION 35
[name='Marginal cost of providing labour']
(mcw)      = taumuw_ss*(omega*mrs_c      +(1-omega)*mrs_u);
(mcw_flex) = taumuw_ss*(omega*mrs_c_flex +(1-omega)*mrs_u_flex);

% EQUATION 36
[name='Wage equals MRS, unconstrained HH']
wh             = (omega*mrs_c      +(1-omega)*mrs_u) ;         
wh_flex        = (omega*mrs_c_flex +(1-omega)*mrs_u_flex) ;   

% EQUATION 37
[name='homogenous labour supply']
(N_c)          = (N_u);
(N_c_flex)     = (N_u_flex);

% EQUATION 38
[name='Profits W']
div_L      = w*N-mcw*N;
div_L_flex = w_flex*N_flex-mcw_flex*N_flex;

% EQUATION 39
[name='Wage Phillips Curve']
(f1w)*muw_ss/(f2w)     = ((1-phiw*((zetaw)^(1/(muw_ss-1))))/(1-phiw))^(1-muw_ss);
(1/(w_flex)*(mcw_flex))*muw_ss = 1;

% EQUATION 40
[name='Wage Phillips Curve, auxiliary term F1W']
(f1w) = mcw/w*N + phiw* LAMBDA_u(+1)*(Pi_w(+1))/(Pi_CES_u(+1))*(zetaw(+1))^(muw_ss/(muw_ss-1))*(f1w(+1));

% EQUATION 41
[name='Wage Phillips Curve, auxiliary term F2W']
(f2w) = (N) + phiw* LAMBDA_u(+1)*(Pi_w(+1))/(Pi_CES_u(+1))*(zetaw(+1))^(1/(muw_ss-1))*(f2w(+1));

% EQUATION 42
[name='Deviations of wage inflation from trend']
(zetaw)=(Pi_w)/( ( (STEADY_STATE(Pi_w)^(1-xiw))* ((Pi_w(-1))^xiw) ) ); 

% EQUATION 43
[name='Wages and Wage Inflation']
w      = ((Pi_w))/((Pi_z)*(1))*(w(-1)); 
w_flex = ((Pi_w_flex))/((Pi_z_flex)*1)*(w_flex(-1)); 

% EQUATION 44
[name='Wage Dispersion']
dispw = (1-phiw)*( (1-phiw*(zetaw)^(1/(muw_ss-1)))/(1-phiw))^(muw_ss)+phiw*(zetaw)^(muw_ss/(muw_ss-1))*(dispw(-1));   

%% Final output ----------------------------------------------------------------------------------

% EQUATION 45
[name='Final output production function'] 
@#if cobb_douglas_yes == 1
    (dispz)*(Z) = eps_tfp * CES_scale*(N)^(1-alppha_ez)*(E_z)^(alppha_ez);% CES_scale=(alppha_ez).^(-(alppha_ez))*(1-alppha_ez).^(-(1-alppha_ez))
    (Z_flex)    = eps_tfp * CES_scale*(N_flex)^(1-alppha_ez)*(E_z_flex)^(alppha_ez);% we have to scale the CD, in order to compare with CES
@#else
    (dispz)*(Z) = eps_tfp * ( (1-alppha_ez)^(1/ppsi_ez)*N^((ppsi_ez-1)/ppsi_ez) + (alppha_ez)^(1/ppsi_ez)*E_z^((ppsi_ez-1)/ppsi_ez) )^(ppsi_ez/(ppsi_ez-1)); 
    (Z_flex)    = eps_tfp * ( (1-alppha_ez)^(1/ppsi_ez)*N_flex^((ppsi_ez-1)/ppsi_ez) + (1-(1-alppha_ez))^(1/ppsi_ez)*E_z_flex^((ppsi_ez-1)/ppsi_ez) )^(ppsi_ez/(ppsi_ez-1)); 
@#endif

% EQUATION 46
[name='Demand for labour']
@#if cobb_douglas_yes == 1
    w      = (1-alppha_ez)*(mcz/(taumuz_ss*eps_muz))*(dispz*Z)/N/eps_tfp;
    w_flex = (1-alppha_ez)*(mcz_flex)/(taumuz_ss*eps_muz)*(Z_flex)/(N_flex)/eps_tfp;
@#else
    w      = (1-alppha_ez)^(1/ppsi_ez)*(mcz/(taumuz_ss*eps_muz))*(((dispz*Z)/N)^(1/ppsi_ez))*((eps_tfp)^((ppsi_ez-1)/ppsi_ez));
    w_flex = (1-alppha_ez)^(1/ppsi_ez)*(mcz_flex/(taumuz_ss*eps_muz))*(((Z_flex)/N_flex)^(1/ppsi_ez))*((eps_tfp)^((ppsi_ez-1)/ppsi_ez));
@#endif

% EQUATION 47
[name='Demand for m']
@#if cobb_douglas_yes == 1
    (pE)      = (alppha_ez)*(mcz)/(((taumuz_ss*eps_muz)))*((dispz)*(Z))/(E_z)/eps_tfp;
    (pE_flex) = (alppha_ez)*(mcz_flex)/((taumuz_ss*eps_muz))*(Z_flex)/(E_z_flex)/eps_tfp;
@#else
    (pE)      = (alppha_ez)^(1/ppsi_ez)*(mcz)/(((taumuz_ss*eps_muz)))*(((dispz)*(Z)/E_z)^(1/ppsi_ez))*((eps_tfp)^((ppsi_ez-1)/ppsi_ez));
    (pE_flex) = (alppha_ez)^(1/ppsi_ez)*(mcz_flex)/(((taumuz_ss*eps_muz)))*(((Z_flex)/E_z_flex)^(1/ppsi_ez))*((eps_tfp)^((ppsi_ez-1)/ppsi_ez));
@#endif

% EQUATION 48
[name='Profits Z']
div_Z      = Z      - ((taumuz_ss*eps_muz))*(w*N + pE*E_z);
div_Z_flex = Z_flex - ((taumuz_ss*eps_muz))*(w_flex*N_flex + pE_flex*E_z_flex);

% EQUATION 49
[name='Final Output Phillips Curve']
(f1z)*muz_ss/(f2z) = ((1-phiz*((zetaz)^(1/(muz_ss-1))))/(1-phiz))^(1-muz_ss);
(mcz_flex)                 = 1/muz_ss;

% EQUATION 50
[name='Final Output Phillips Curve, auxiliary term F1Z']
(f1z) = (mcz)*(Z) + phiz*LAMBDA_u(+1)*(Pi_z(+1))/(Pi_CES_u(+1))*((zetaz(+1)))^(muz_ss/(muz_ss-1))*(f1z(+1));

% EQUATION 51
[name='Final Output Phillips Curve, auxiliary term F2Z']
(f2z) = (Z) + phiz*LAMBDA_u(+1)*(Pi_z(+1))/(Pi_CES_u(+1))*(zetaz(+1))^(1/(muz_ss-1))*(f2z(+1));

% EQUATION 52
[name='Deviations of Z inflation from trend']
(zetaz)   = (Pi_z)/((STEADY_STATE(Pi_z)^(1-xiz)*(Pi_z(-1))^(xiz)) ); 

% EQUATION 53
[name='Final Output price Dispersion']
(dispz)   = (1-phiz)*( (1-phiz*(zetaz)^(1/(muz_ss-1)))/(1-phiz))^(muz_ss)+phiz*(zetaz)^(muz_ss/(muz_ss-1))*(dispz(-1));   

%% Importers under perfect comp and flex prices---------------------------------------------------

% EQUATION 54
[name='Marginal cost of importers']
pE      = pEf*Q; 
pE_flex = pEf*Q_flex;% in the flexible price world, the importer can always charge the desired markup

% EQUATION 55
[name='Foreign Export Price error correction process']
((pEf)/pEf_ss)=((pEf(-1))/pEf_ss)^rho_pEf*(eps_pEf); 

%% Exporters -------------------------------------------------------------------------------------

% EQUATION 56
[name='Export Phillips Curve']
pExp*Q           = pX;
pExp_flex*Q_flex = pX;

%% Retailers -------------------------------------------------------------------------------------

% EQUATION 57
[name='Export Price (in domestic real terms)']
pX = 1;

% EQUATION 58
[name='Consumption Price']
pC      = 1;
pC_flex = 1;

%% Monetary Policy Block -------------------------------------------------------------------------

% EQUATION 59
@#if ramsey_yes == 0
[name='Taylor rule'] % we take out the domestic taylor rule for the ramsey case
((R_nom)/STEADY_STATE(R_nom))     
=((R_nom(-1))/STEADY_STATE(R_nom))^(thetaR)*((Pi_CPI_ann)/STEADY_STATE(Pi_CPI_ann))^(((thetaPi/4)*(1-thetaR)))*((Y_gap))^((thetaY*(1-thetaR)))*eps_R; 
@#endif
Pi_CPI_ann_flex = STEADY_STATE(Pi_CPI_ann);

% EQUATION 60
[name='CPI Inflation Definition'] 
Pi_CPI          = pCPI/pCPI(-1)*Pi_z;
Pi_CPI_flex     = pCPI_flex/pCPI_flex(-1)*Pi_z_flex;

% EQUATION 61
[name='CPI Inflation Definition, ann'] 
Pi_CPI_ann      = (Pi_CPI)*(Pi_CPI_lag1)*(Pi_CPI_lag2)*(Pi_CPI_lag2(-1)); 
Pi_CPI_ann_flex = (Pi_CPI_flex)*(Pi_CPI_lag1_flex)*(Pi_CPI_lag2_flex)*(Pi_CPI_lag2_flex(-1)); 

% EQUATION 62
[name='CPI Inflation Definition, lag1'] 
Pi_CPI_lag1     = Pi_CPI(-1); 
Pi_CPI_lag1_flex= Pi_CPI_flex(-1); 

% EQUATION 63
[name='CPI Inflation Definition, lag2'] 
Pi_CPI_lag2     = Pi_CPI_lag1(-1);
Pi_CPI_lag2_flex= Pi_CPI_lag1_flex(-1);

% EQUATION 64
[name='Output gap']
(Y_gap)=N/N_flex;   % domestically, we care about value-added, not this: %(ygap)=z/z_flex; 

%%---------------------------------------------------------------------------------------
%% World Block --------------------------------------------------------------------------

% World Trade -------------------------------------------------------------

% EQUATION 65
[name='Export demand']
(X)      = (kappaf_ss)*((pExp)/(pEf_ss))^(-epsilonf)*(vf_ss);  
(X_flex) = (kappaf_ss)*((pExp_flex)/(pEf_ss))^(-epsilonf)*(vf_ss);  
 

%% Shocks ----------------------------------------------------------------------------------------

[name='TFP forcing process']
%log((eps_tfp)) = rho_tfp*log((eps_tfp(-1)))-(1-rho_tfp^2)^(1/2)*sigma_tfp*eta_tfp; 
log((eps_tfp)) = rho_tfp*log((eps_tfp(-1)))-sigma_tfp*eta_tfp; 

[name='Price Markup forcing process']
%log((eps_muz)) = rho_muz*log((eps_muz(-1)))+(1-rho_muz^2)^(1/2)*sigma_muz*eta_muz; 
log((eps_muz)) = rho_muz*log((eps_muz(-1)))+sigma_muz*eta_muz; 

[name='World export prices forcing process']
%log((eps_pEf)) = (1-rho_pEf^2)^(1/2)*sigma_pEf*eta_pEf; 
log((eps_pEf)) = sigma_pEf*(eta_pEf+eta_pEf_news(-1)); 

[name='Monetary Policy forcing process']
log((eps_R)) = rho_R*log((eps_R(-1)))-sigma_R*eta_R; 

%% Aux -------------------------------------------------------------------------------------------




R_real            = (R_nom     /(Pi_CES_u(+1)));
Expected_Pi_CES_u = (Pi_CES_u(+1));
Pi_E              = pE/pE(-1);
Expected_Pi_E     = (Pi_E(+1));
C_gap_CES  = 100*log(CES_u/CES_c);% unconstrained over constrained, 100*log diff, approx percent difference
pE_over_w  = pE/w;
C_lag1     = C(-1);
C_u_lag1   = C_u(-1);
C_c_lag1   = C_c(-1);

dlnckp       = 100*(log(C/C(-1)));       
dlnckp_c     = 100*(log(C_c/C_c(-1)));       
dlnckp_u     = 100*(log(C_u/C_u(-1)));       

dlnCESkp_c   = 100*(log(CES_c/CES_c(-1)));       
dlnCESkp_u   = 100*(log(CES_u/CES_u(-1)));       

dlnehkp      = 100*(log(E_h/E_h(-1)));       
dlnehkp_c    = 100*(log(E_h_c/E_h_c(-1)));       
dlnehkp_u    = 100*(log(E_h_u/E_h_u(-1)));       
dlnezkp      = 100*(log(E_z/E_z(-1)));       

dlnhrs       = 100*(log(N/N(-1)));
dlnhrs_u     = 100*(log(N_u/N_u(-1)));       
dlnhrs_c     = 100*(log(N_c/N_c(-1)));       
       
dlnzkp       = 100*(log(Z/Z(-1)));   
dlnxkp       = 100*(log(X/X(-1)));   
dlnmkp       = 100*(log(E_z/E_z(-1)));   

%dlneer       = 100*(log(Q/Q(-1)))  ; 
dlneer       = 100*(log(Q(-1)/Q))  ;  % if this goes up, our currency appreciates, more intuitive like this

output_gap   = 100*log(N/N_flex);
dlnNFA       = 100*(log(NFA/NFA(-1)));   

dlnw         = 100*(log(w/w(-1)));
dlnwh        = 100*(log(wh/wh(-1)));

dlnDiv_Z     = 100*(log(div_Z/div_Z(-1))); 

Pi_w_ann     = (Pi_w)*(Pi_w_lag1)*(Pi_w_lag2)*(Pi_w_lag2(-1)); 
Pi_w_lag1    = (Pi_w(-1)) ; 
Pi_w_lag2    = (Pi_w_lag1(-1)) ; 

Pi_z_ann     = (Pi_z)*(Pi_z_lag1)*(Pi_z_lag2)*(Pi_z_lag2(-1)); 
Pi_z_lag1    = (Pi_z(-1)) ; 
Pi_z_lag2    = (Pi_z_lag1(-1)) ; 

Pi_E_ann     = (Pi_E)*(Pi_E_lag1)*(Pi_E_lag2)*(Pi_E_lag2(-1)); 
Pi_E_lag1    = (Pi_E(-1)) ; 
Pi_E_lag2    = (Pi_E_lag1(-1)) ; 

markup_Z     = 1/mcz;
%markup_W     = 1/(wh-w);

dlnMarkup_Z  = 100*(log(markup_Z/markup_Z(-1)));
dlnMarkup_W  = w_logdev-wh_logdev;

wh_logdev     = log(wh/steady_state(wh));
w_logdev      = log(w/steady_state(w));

z_hat         = log(Z/steady_state(Z));
n_hat         = log(N/steady_state(N));
z_minus_n_hat = 1/ppsi_ez*(z_hat-n_hat);


Pi_w_over_Pi_z = (Pi_w)/(Pi_z); 



markup_Z_effective     = (taumuz_ss*eps_muz)/mcz; % effective markup definition
dlnMarkup_Z_effective  = 100*(log(markup_Z_effective/markup_Z_effective(-1)));




end;


steady;
check;


%===================================================================================================
% SPECIFY SHOCKS
%===================================================================================================

shocks;
var      eta_tfp;          stderr 1;    %  TFP shock
var      eta_muz;          stderr 1;    %  Price Markup shock
var      eta_pEf;          stderr 1;    %  World export price level shock (supply)
var      eta_pEf_news;     stderr 1;    %   
var      eta_R;            stderr 1;    %   
end;

%===================================================================================================
% SOLUTION, STOCHASTIC SIMULATION, IRFs
%===================================================================================================


%%---------------------------
%% TANK Case
@#if ramsey_yes == 1
    initval;
    R_nom = Pistar/cbeta;
    end;
  
% objective 1
    planner_objective 
    ( ((1-omega)*
    (
    ((((1-alppha_uec)^(1/ppsi_ec)*(C_u)^((ppsi_ec-1)/ppsi_ec))+((alppha_uec)^(1/ppsi_ec)*(E_h_u)^((ppsi_ec-1)/ppsi_ec)))^(ppsi_ec/(ppsi_ec-1)))
    )^(1-siggma)-1)/(1-siggma) - chi_u*( (1-omega)*(dispw*N_u)^(1+varphi))/(1+varphi) ) 
    +    ( (omega*(
    ((((1-alppha_cec)^(1/ppsi_ec)*(C_c)^((ppsi_ec-1)/ppsi_ec))+((alppha_cec)^(1/ppsi_ec)*(E_h_c)^((ppsi_ec-1)/ppsi_ec)))^(ppsi_ec/(ppsi_ec-1)))
    )^(1-siggma)-1)/(1-siggma) - chi_c*( omega*(dispw*N_c)^(1+varphi))/(1+varphi) )
    ;  

%CES_u    = (((1-alppha_uec)^(1/ppsi_ec)*(C_u)^((ppsi_ec-1)/ppsi_ec))+((alppha_uec)^(1/ppsi_ec)*(E_h_u)^((ppsi_ec-1)/ppsi_ec)))^(ppsi_ec/(ppsi_ec-1))

% objective 2
%    planner_objective 
%    (1-omega)* ( ((CES_u)^(1-siggma))/(1-siggma) - chi_u*( (N_u)^(1+varphi))/(1+varphi) ) 
%    + omega*   ( ((CES_c)^(1-siggma))/(1-siggma) - chi_c*( (N_c)^(1+varphi))/(1+varphi) )
%    ;  

% objective 3
%    planner_objective 
%     ( (((1-omega)*CES_u+omega*CES_c)^(1-siggma))/(1-siggma) 
%     - ((1-omega)*chi_u+omega*chi_c)*( (N)^(1+varphi))/(1+varphi) ) 
%    ;  

% choice of planner objective does not make a big difference


    //set up Ramsey optimal policy problem with interest rate R as the instrument,...
    // defining the discount factor in the planner objective to be the one of private agents        
    ramsey_model(instruments=(R_nom),planner_discount=cbeta);   
    //conduct stochastic simulations of the Ramsey problem
    stoch_simul(order=1,irf=2000,nograph,periods=10000); 
    oo_TANK_Ramsey_=oo_;
    M_TANK_Ramsey_=M_;
    evaluate_planner_objective;
@#else
    initval;
    R_nom = Pistar/cbeta;
    end;
    steady;
    check;
    %TANK case
    %set_param_value('omega',0.7) % 30% unconstrained HHs, 70% constrained HHs
    %set_param_value('omega',0.5) % 30% unconstrained HHs, 70% constrained HHs
    stoch_simul(order=1,irf=2000,nograph,periods=10000); 
    oo_TANK_Taylor_=oo_;
    M_TANK_Taylor_=M_;
@#endif














%MODEL_DIAGNOSTICS;
%model_diagnostics(M_,options_,oo_);
write_latex_dynamic_model;
write_latex_static_model;
write_latex_definitions;
options_.TeX=1;
write_latex_dynamic_model;
write_latex_parameter_table;





