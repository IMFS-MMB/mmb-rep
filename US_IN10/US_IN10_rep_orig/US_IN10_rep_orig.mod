//%------------------------------------------------------------
//% THIS DYNARE FILE SIMULATES AND ESTIMATES THE IACOVIELLO-NERI MODEL
//%
//% THIS PROGRAM WAS TESTED WITH (AND REQUIRES KNOWLEDGE OF)
//% 1) DYNARE 4.0.4 (http://www.cepremap.cnrs.fr/dynare/)
//% 2) MATLAB 7.6.0 (http://www.mathworks.com/)
//%
//% Notation and formulas as in Appendix A of our paper
//% available at http://www2.bc.edu/~iacoviel/research.htm
//%
//%   MATTEO IACOVIELLO
//%   BOSTON COLLEGE, DEPARTMENT OF ECONOMICS, 140 COMMONWEALTH AVENUE
//%   CHESTNUT HILL, MA 02467-3806, USA
//%   iacoviel@bc.edu
//%
//%   STEFANO NERI
//%   BANCA D'ITALIA, RESEARCH DEPARTMENT, VIA NAZIONALE 91
//%   00184 ROMA, ITALY
//%   stefano.neri@bancaditalia.it
//%
//% Thanks to Michel Juillard for his support
//%
//%------------------------------------------------------------
//% We have performed estimation using our own codes: these codes
//% are only meant to replicate some of the basic findings of our model.
//%------------------------------------------------------------
//% Note:
//% 1) NU,NU1 here is NU=-CSI in the main text
//%------------------------------------------------------------


//%------------------------------------------------------------
//% Declare endogenous and exogenous variables
//%------------------------------------------------------------

var
a_c a_h a_j a_k a_s a_t a_z b c c1
data_CC data_DP data_IH data_IK data_NC data_NH data_QQ data_RR data_WC data_WH
dp h h1 I kc kh lm nc nc1 nh nh1 q r rkc rkh
uc uc1 wc wc1 wh wh1 X xwc xwc1 xwh xwh1 Y zata_GDP zkc zkh;

varexo eps_c eps_e eps_h eps_j eps_k eps_p eps_s eps_t eps_z  ;


//%-----------------------------------------------------------------------
//% Declare model parameters
//%------------------------------------------------------------------------

parameters BETA BETA1 M JEI MUC MUH DKC DKH DH ETA ETA1 EC EC1 FIKC FIKH ALPHA 
TETA TAYLOR_R TAYLOR_Y TAYLOR_P X_SS LAGP 
RHO_AC RHO_AH RHO_AJ RHO_AK RHO_AM RHO_AT RHO_AZ RHO_AS
NU NU1 KAPPA XW_SS TETAWC TETAWH LAGWC LAGWH ZETAKC 
TREND_AC TREND_AH TREND_AK MUBB  ;
//% local model parameters: IKC_SS IKH_SS TRENDY TRENDK  TRENDH ; 
//% local model parameters: NC_SS NH_SS CC_SS IH_SS IK_SS QQ_SS


//% Calibrated parameters
X_SS = 1.15 ;
XW_SS = 1.15 ;
BETA = 0.9925 ;
BETA1 = 0.97 ;
JEI = 0.12; 
MUC = 0.35; 
MUH = 0.10; 
KAPPA = 0.10 ;
MUBB = 0.10 ;
DKC = 0.025 ; 
DKH = 0.03 ;
DH = 0.01;
M = 0.85 ;
RHO_AS = 0.975;

//% Estimated parameters (mean)
ALPHA	=	0.79343	;
EC	=	0.31423	;
EC1	=	0.56897	;
ETA	=	0.52381	;
ETA1	=	0.50602	;
FIKC	=	14.47013	;
FIKH	=	11.02808	;
LAGP	=	0.69106	;
LAGWC	=	0.08301	;
LAGWH	=	0.41186	;
NU	=	-0.6833	;
NU1	=	-0.96538	;
TAYLOR_P	=	1.40444	;
TAYLOR_R	=	0.59913	;
TAYLOR_Y	=	0.51261	;
TETA	=	0.83671	;
TETAWC	=	0.79204	;
TETAWH	=	0.91181	;
TREND_AC	=	0.0032	;
TREND_AH	=	0.0008	;
TREND_AK	=	0.00275	;
ZETAKC	=	0.70394	;

//% 2 - Shocks parameters (mean)
RHO_AC	=	0.94265	;
RHO_AH	=	0.99713	;
RHO_AJ	=	0.95875	;
RHO_AK	=	0.92384	;
RHO_AT	=	0.92158	;
RHO_AZ	=	0.96439	;
STDERR_AC	=	0.01011	;
STDERR_AE	=	0.00336	;
STDERR_AH	=	0.01942	;
STDERR_AJ	=	0.04094	;
STDERR_AK	=	0.01068	;
STDERR_AP	=	0.00457	;
STDERR_AS	=	0.00034*100	;
STDERR_AT	=	0.0252	;
STDERR_AZ	=	0.01711	;




//% Set DO_IRFS=1 to plot impulse responses
//% Set DO_ESTIMATION=1 to do estimation
DO_IRFS        = 1 ; 
DO_ESTIMATION  = 0 ; 


//%------------------------------------------------------------
//% Model equations
//%------------------------------------------------------------



model ;


# TRENDK = TREND_AC + 1/(1-MUC)*TREND_AK ;
# TRENDY = TREND_AC + MUC/(1-MUC)*TREND_AK;  
# TRENDH = (1-MUH-KAPPA-MUBB)*TREND_AH + (MUH+MUBB)*TREND_AC + MUC*(MUH+MUBB)/(1-MUC)*TREND_AK ;
# TRENDQ = (1-MUH-MUBB)*TREND_AC + MUC*(1-MUH-MUBB)/(1-MUC)*TREND_AK - (1-MUH-KAPPA-MUBB)*TREND_AH ;

# llEXPTRENDY = exp ( TRENDY ) ;  
# llEXPTRENDK = exp ( TRENDK ) ;
# llEXPTRENDQ = exp ( TRENDQ ) ;
# llEXPTRENDH = exp ( TRENDH ) ;
# llgamma_k = exp ( TREND_AK );

# llr = 1 / BETA ;
# llr1 =  llr / llEXPTRENDY - 1 ;

# llZETA0 = BETA*llEXPTRENDK*MUC/(llgamma_k-BETA*(1-DKC))/X_SS ;
# llZETA1 = BETA*llEXPTRENDY*MUH/(1-BETA*(1-DKH));
# llZETA2 = JEI/(1-BETA*llEXPTRENDQ*(1-DH)) ;
# llZETA3 = JEI/(1-BETA1*llEXPTRENDQ*(1-DH)-llEXPTRENDQ*(BETA-BETA1)*M) ;
# llZETA4 = (llr/llEXPTRENDY-1)*M*llEXPTRENDQ/llr ;

# llDH1 = 1 - (1-DH)/llEXPTRENDH ;
# llDKC1 = 1 - (1-DKC)/llEXPTRENDK ; 
# llDKH1 = 1 - (1-DKH)/llEXPTRENDY ;
  
# llCHI1 = 1+llDH1*llZETA2*(1-llr1*llZETA1-KAPPA-ALPHA*(1-MUH-KAPPA-MUBB)) ;
# llCHI2 = (llr1*llZETA1+KAPPA+ALPHA*(1-MUH-KAPPA-MUBB))*llDH1*llZETA3+llZETA4*llZETA3 ;
# llCHI3 = (X_SS-1+llr1*llZETA0*X_SS+ALPHA*(1-MUC))/X_SS ;
# llCHI4 = 1+llDH1*llZETA3*(1-(1-ALPHA)*(1-MUH-KAPPA-MUBB))+llZETA4*llZETA3 ;
# llCHI5 = (1-ALPHA)*(1-MUH-KAPPA-MUBB)*llDH1*llZETA2 ;
# llCHI6 = (1-ALPHA)*(1-MUC)/X_SS ;

# llCY = (llCHI3*llCHI4+llCHI2*llCHI6)/(llCHI1*llCHI4-llCHI2*llCHI5) ;
# llCYPRIME = (llCHI1*llCHI6+llCHI3*llCHI5)/(llCHI1*llCHI4-llCHI2*llCHI5) ;
# llQIY = llDH1*llZETA2*llCY + llDH1*llZETA3*llCYPRIME ;

# llRATION = (1-MUH-KAPPA-MUBB)/(1-MUC)*X_SS*llQIY  ;
# llNHNC = llRATION^(1/(1-NU)) ;
# llNHNC1 = llRATION^(1/(1-NU1)) ;

# llnc = ( ((1-MUC)*ALPHA/llCY/X_SS/XW_SS)/(1+llRATION)^((ETA+NU)/(1-NU)) )^(1/(1+ETA)) ;
# llnh = llNHNC*llnc ;

# llnc1 = ( ((1-MUC)*(1-ALPHA)/llCYPRIME/X_SS/XW_SS)/(1+llRATION)^((ETA1+NU1)/(1-NU1)) )^(1/(1+ETA1)) ;
# llnh1 = llNHNC1*llnc1 ;

# llY = (llnc^ALPHA)*(llnc1^(1-ALPHA)) *  llZETA0^(MUC/(1-MUC)) / llEXPTRENDK^(MUC/(1-MUC)) ;

# llI = (llnh^(ALPHA*(1-MUH-KAPPA-MUBB))) * (llnh1^((1-ALPHA)*(1-MUH-KAPPA-MUBB))) * llZETA1^MUH 
* (llY*llQIY)^MUH / llEXPTRENDY^(MUH) * (MUBB*llY*llQIY)^MUBB ;

# llq = llQIY*llY / llI ;

# llQI = llQIY*llY ;

# llkc = llZETA0*llY ;

# llkh = llZETA1*llQI ;

# llc = llCY*llY ;
# llc1 = llCYPRIME*llY ;

# llh = llZETA2*llc/llq ;
# llh1 = llZETA3*llc1/llq ;

# llb = M*llq*llEXPTRENDQ*llh1/llr ;

# llCC = llc + llc1 ;
# llIH = llI  ;
# llIK = llDKC1 * llkc + llDKH1* llkh  ;

# llikc = llDKC1 * llkc ;
# llikh = llDKH1 * llkh ;
# IKC_SS = log(llikc) ;
# IKH_SS = log(llikh) ;

# BB_SS = log(llb) ;
# CC_SS = log(llCC) ;
# IH_SS = log(llIH) ;
# IK_SS = log(llIK) ;
# QQ_SS = log(llq) ;
# RR_SS = log(llr) ;
# NC_SS = ALPHA*log(llnc) + (1-ALPHA)*log(llnc1) ;
# NH_SS = ALPHA*log(llnh) + (1-ALPHA)*log(llnh1) ;

//% Patient households

//% 1
exp(c) + exp(kc)/exp(a_k) + exp(kh)  + exp(q+h) + exp(b) = 
(1-DH)*exp(q+h(-1)-TRENDH) + exp(wc+nc) + exp(wh+nh) + (1-1/exp(X))*exp(Y) + exp(r(-1)-dp+b(-1)-TRENDY) 
+ (exp(rkc+zkc)+(1-DKC)/exp(a_k))*exp(kc(-1)-TRENDK) + (exp(rkh+zkh)+(1-DKH))*exp(kh(-1)-TRENDY) + KAPPA*exp(q)*exp(I);

//% 2
exp(q+uc) = exp(a_z+a_j-h)*JEI + 
BETA*exp(TRENDY)*(1-DH)*exp(q(+1)+TRENDQ+uc(+1)-TRENDY);

//% 3
exp(uc) = BETA*exp(TRENDY)*exp(r-dp(+1)+uc(+1)-TRENDY) ;

//% 4
exp(uc)/exp(a_k) * ( 1 + FIKC*(exp(kc-kc(-1))-1 ) ) = 
BETA*exp(TRENDY) * exp(uc(+1)-TRENDK) 
* ( exp(rkc(+1)+zkc(+1)) + (1-DKC)/exp(a_k(+1)) + FIKC/2*exp(TRENDK)*(exp(kc(+1))^2/(exp(kc))^2-1) ) ;



//% 5
exp(uc) * ( 1 + FIKH*(exp(kh-kh(-1))-1 ) ) =
BETA*exp(TRENDY) * exp(uc(+1)-TRENDY) 
* ( exp(rkh(+1)+zkh(+1)) + (1-DKH) + FIKH/2*exp(TRENDY)*(exp(kh(+1))^2/(exp(kh))^2-1) ) ;



//% 6
 exp(a_t) * exp(a_z) * ( exp(nc)^(1-NU) + exp(nh)^(1-NU) )^((ETA+NU)/(1-NU)) * exp(nc)^(-NU)
= exp(wc+uc-xwc)  ;

//% 7
 exp(a_t) * exp(a_z) * ( exp(nc)^(1-NU) + exp(nh)^(1-NU) )^((ETA+NU)/(1-NU)) * exp(nh)^(-NU)
= exp(wh+uc-xwh)  ;


//% Impatient households

//% 8
exp(c1) + exp(q+h1) - (1-DH)*exp(q+h1(-1)-TRENDH) = exp(wc1+nc1) + exp(wh1+nh1) +
exp(b) - exp(r(-1)-dp+b(-1)-TRENDY) ;

//% 9
exp(q+uc1) = exp(a_z+a_j-h1)*JEI +
BETA1*exp(TRENDY)*(1-DH)*exp(q(+1)+TRENDQ+uc1(+1)-TRENDY) +
M*exp(lm+(q(+1)+ TRENDQ -r+dp(+1))) ;


//% 10
b = log(M) + (q(+1)+TRENDQ) + h1  - r + dp(+1)  ;

//% 11
exp(uc1) = BETA1*exp(TRENDY)*exp(r-dp(+1)+uc1(+1)-TRENDY) + exp(lm) ;

//% 12
  exp(a_t) * exp(a_z) *  ( exp(nc1)^(1-NU1) + exp(nh1)^(1-NU1) )^((ETA1+NU1)/(1-NU1)) * (exp(nc1))^(-NU1)
= exp(wc1+uc1-xwc1)  ;

//% 13
 exp(a_t) * exp(a_z) * ( exp(nc1)^(1-NU1) + exp(nh1)^(1-NU1) )^((ETA1+NU1)/(1-NU1)) * (exp(nh1))^(-NU1)
= exp(wh1+uc1-xwh1)  ;


//% Firms

//% 14
Y = (1-MUC)*(a_c) + (1-MUC)*ALPHA*nc + (1-MUC)*(1-ALPHA)*nc1 + MUC*(kc(-1)+zkc-TRENDK) ;
 
//% 15
I = (1-MUH-MUBB-KAPPA)*(a_h) + MUBB*(log(MUBB) + q + I) 
+ (1-MUH-MUBB-KAPPA)*ALPHA*nh + (1-MUH-MUBB-KAPPA)*(1-ALPHA)*nh1 + MUH*(kh(-1)+zkh-TRENDY) ;


//% 16
log(1-MUC) + log(ALPHA) + Y - X - nc = wc ;

//% 17
log(1-MUC) + log(1-ALPHA) + Y - X - nc1 = wc1 ;

//% 18
log(1-MUH-KAPPA-MUBB) + log(ALPHA) + q + I - nh = wh ;

//% 19
log(1-MUH-KAPPA-MUBB) + log(1-ALPHA) + q + I - nh1 = wh1 ;

//% 20
log(MUC) + Y - X - kc(-1) + TRENDK = rkc + zkc ;

//% 21
log(MUH) + q + I - kh(-1) + TRENDY = rkh + zkh  ;

//% 22
dp - LAGP*dp(-1) = BETA*exp(TRENDY)*(dp(1) - LAGP*dp) -
((1-TETA)*(1-BETA*exp(TRENDY)*TETA)/TETA)*(X-log(X_SS)) + eps_p ;

//% 23
r = TAYLOR_R*r(-1) + (1-TAYLOR_R)*(TAYLOR_P)*dp + 
(1-TAYLOR_R)*TAYLOR_Y*(zata_GDP-zata_GDP(-1)) +
(1-TAYLOR_R)*log(1/BETA) + eps_e - a_s/100 ;

//% 24
exp(h) + exp(h1) = (1-DH)*exp(h(-1)-TRENDH) + (1-DH)*exp(h1(-1)-TRENDH) + exp(I) ;


//% DEFINITIONS OF MARGINAL UTILITY OF CONSUMPTION 

//% 25
exp(uc) = exp(a_z) * ( ((exp(TRENDY)-EC)/(exp(TRENDY)-BETA*EC*exp(TRENDY))) *
( 1 / ( exp(c) - EC*exp(c(-1)-TRENDY)  ) - BETA*EC*exp(TRENDY)  / ( exp(c(+1)+TRENDY) - EC*exp(c)  ) ) ) ;

//% 26 
exp(uc1) = exp(a_z) * ( ((exp(TRENDY)-EC1)/(exp(TRENDY)-BETA1*EC1*exp(TRENDY))) *
( 1 / ( exp(c1) - EC1*exp(c1(-1)-TRENDY) ) - BETA1*EC1*exp(TRENDY) / ( exp(c1(+1)+TRENDY) - EC1*exp(c1) ) ) ) ;



//% WAGE EQUATIONS

wc = (1/(1+BETA*exp(TRENDY)))*wc(-1) + (1-(1/(1+BETA*exp(TRENDY))))*(wc(1)+dp(+1))  
- (1+BETA*exp(TRENDY)*LAGWC)/(1+BETA*exp(TRENDY))*dp + LAGWC/(1+BETA*exp(TRENDY))*dp(-1) 
- ((1-TETAWC)*(1-BETA*exp(TRENDY)*TETAWC)/TETAWC)/(1+BETA*exp(TRENDY))*(xwc-log(XW_SS))  ;

wc1 = (1/(1+BETA1*exp(TRENDY)))*wc1(-1) + (1-(1/(1+BETA1*exp(TRENDY))))*(wc1(1)+dp(+1))  
- (1+BETA1*exp(TRENDY)*LAGWC)/(1+BETA1*exp(TRENDY))*dp + LAGWC/(1+BETA1*exp(TRENDY))*dp(-1) 
- ((1-TETAWC)*(1-BETA1*exp(TRENDY)*TETAWC)/TETAWC)/(1+BETA1*exp(TRENDY))*(xwc1-log(XW_SS))  ;

wh = (1/(1+BETA*exp(TRENDY)))*wh(-1) + (1-(1/(1+BETA*exp(TRENDY))))*(wh(1)+dp(+1))  
- (1+BETA*exp(TRENDY)*LAGWH)/(1+BETA*exp(TRENDY))*dp + LAGWH/(1+BETA*exp(TRENDY))*dp(-1) 
- ((1-TETAWH)*(1-BETA*exp(TRENDY)*TETAWH)/TETAWH)/(1+BETA*exp(TRENDY))*(xwh-log(XW_SS))  ;

wh1 = (1/(1+BETA1*exp(TRENDY)))*wh1(-1) + (1-(1/(1+BETA1*exp(TRENDY))))*(wh1(1)+dp(+1))  
- (1+BETA1*exp(TRENDY)*LAGWH)/(1+BETA1*exp(TRENDY))*dp + LAGWH/(1+BETA1*exp(TRENDY))*dp(-1) 
- ((1-TETAWH)*(1-BETA1*exp(TRENDY)*TETAWH)/TETAWH)/(1+BETA1*exp(TRENDY))*(xwh1-log(XW_SS))  ;


//% CAPACITY

exp(rkc+a_k) / ( (1/BETA)*exp(TREND_AK)-(1-DKC) ) = ZETAKC/(1-ZETAKC)*exp(zkc) + (1-ZETAKC/(1-ZETAKC));
exp(rkh) / ( (1/BETA)-(1-DKH) ) = ZETAKC/(1-ZETAKC)*exp(zkh) + (1-ZETAKC/(1-ZETAKC));


//% DEFINITION OF VARIABLES TAKEN TO THE DATA
data_CC = log(exp(c) + exp(c1)) - CC_SS + TRENDY ;
data_DP = dp  ;
data_IH = I -  IH_SS + TRENDH ;
data_IK = log ( exp(kc) - (1-DKC)*exp(kc(-1)-TRENDK) + 
          exp(kh) - (1-DKH)*exp(kh(-1)-TRENDY) ) - IK_SS + TRENDK ;
data_NC = ALPHA*nc + (1-ALPHA)*nc1 - NC_SS ;
data_NH = ALPHA*nh + (1-ALPHA)*nh1 - NH_SS ;
data_QQ = q  - QQ_SS + TRENDQ ;
data_RR = r - log(1/BETA)  ;
data_WC = log(exp(wc)+exp(wc1)) - log(exp(wc(-1))+exp(wc1(-1))) + dp ;
data_WH = log(exp(wh)+exp(wh1)) - log(exp(wh(-1))+exp(wh1(-1))) + dp ;

zata_GDP = (exp(CC_SS)/(exp(CC_SS)+exp(QQ_SS+IH_SS)+exp(IK_SS)))*(data_CC-TRENDY) +
(exp(IK_SS)/(exp(CC_SS)+exp(QQ_SS+IH_SS)+exp(IK_SS)))*(data_IK-TRENDK) +
(exp(QQ_SS+IH_SS)/(exp(CC_SS)+exp(QQ_SS+IH_SS)+exp(IK_SS)))*(data_IH-TRENDH) ;


//% STOCHASTIC PROCESSES FOR THE SHOCKS
a_c = RHO_AC * a_c(-1) + eps_c ;
a_h = RHO_AH * a_h(-1) + eps_h ;
a_j = RHO_AJ * a_j(-1) + eps_j ;
a_k = RHO_AK * a_k(-1) + eps_k ;
a_t = RHO_AT * a_t(-1) + eps_t ;
a_s = RHO_AS * a_s(-1) + eps_s ;
a_z = RHO_AZ * a_z(-1) + eps_z ;


end ;









//%------------------------------------------------------------
//% Call steady state
//%------------------------------------------------------------


steady;

//%------------------------------------------------------------
//% Declare shocks
//%------------------------------------------------------------

shocks;
var eps_c ; stderr STDERR_AC  ;
var eps_h ; stderr STDERR_AH  ;
var eps_k ; stderr STDERR_AK  ;
var eps_j ; stderr STDERR_AJ  ;
var eps_e ; stderr STDERR_AE  ;
var eps_z ; stderr STDERR_AZ  ;
var eps_t ; stderr STDERR_AT  ;
var eps_p ; stderr STDERR_AP  ;
var eps_s ; stderr STDERR_AS  ;
end;



//%******************************************************************
//%
//%          %%%  %%%  %    % %  %%%  %
//%          %    % %  %    % %  %    %
//%          %%%  % %  %    % %  %%%  %
//%            %  % %  %    % %  %
//%          %%%  %%%  %%%   %   %%%  %
//%
//%******************************************************************



//%------------------------------------------------------------
//% TO SEE PROPERTIES OF MODEL
//%------------------------------------------------------------


if DO_IRFS==1;

stoch_simul(order=1,irf=20) data_CC data_IK data_IH data_QQ zata_GDP data_RR ;

end;





if(DO_ESTIMATION==1);



    estimated_params ;
    
    //%            START VALUES          &           PRIORS
    stderr eps_c    ,    0.0100,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    stderr eps_e    ,    0.0032,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    stderr eps_h    ,    0.0193,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    stderr eps_j    ,    0.0390,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    stderr eps_k    ,    0.0115,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    stderr eps_p    ,    0.0045,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    stderr eps_s    ,    0.0300,  0    ,  Inf  ,        inv_gamma_pdf,   0.100   ,   1.00 ;  
    stderr eps_t    ,    0.0230,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    stderr eps_z    ,    0.0170,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;      
    stderr data_NH  ,    0.1211,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    stderr data_WH  ,    0.0070,  0    ,  Inf  ,        inv_gamma_pdf,   0.001   ,   0.01 ;  
    ALPHA           ,    0.7970,  0    ,   1   ,        beta_pdf   ,   0.65    ,   0.05 ;      
    EC              ,    0.3117,  0    , 0.99  ,        beta_pdf   ,   0.50    ,   0.075 ;      
    EC1             ,    0.5749,  0    , 0.99  ,        beta_pdf   ,   0.50    ,   0.075 ;    
    ETA             ,    0.4789,  0    ,  Inf  ,        gamma_pdf  ,   0.50    ,   0.1  ;    
    ETA1            ,    0.4738,  0    ,  Inf  ,        gamma_pdf  ,   0.50    ,   0.1  ;    
    FIKC            ,   16.0126,  0    ,  Inf  ,        gamma_pdf  ,   10      ,   2.5  ;  
    FIKH            ,   10.0026,  0    ,  Inf  ,        gamma_pdf  ,   10      ,   2.5  ;  
    LAGP            ,    0.6961,  0    ,   1   ,        beta_pdf   ,   0.5     ,   0.2  ;  
    LAGWC           ,    0.0656,  0    ,   1   ,        beta_pdf   ,   0.5     ,   0.2  ;  
    LAGWH           ,    0.4134,  0    ,   1   ,        beta_pdf   ,   0.5     ,   0.2  ;      
    NU              ,   -0.7523,       ,       ,        normal_pdf ,   -1      ,   0.10  ;  
    NU1             ,   -0.9790,       ,       ,        normal_pdf ,   -1      ,   0.10  ;        
    RHO_AC          ,    0.9480,       ,       ,        beta_pdf   ,   0.80    ,   0.10 ; 
    RHO_AH          ,    0.9980,       ,       ,        beta_pdf   ,   0.80    ,   0.09 ;
    RHO_AJ          ,    0.9604,       ,       ,        beta_pdf   ,   0.80    ,   0.10 ;    
    RHO_AK          ,    0.9256,       ,       ,        beta_pdf   ,   0.80    ,   0.10 ;      
    RHO_AT          ,    0.9259,       ,       ,        beta_pdf   ,   0.80    ,   0.10 ;  
    RHO_AZ          ,    0.9714,       ,       ,        beta_pdf   ,   0.80    ,   0.10 ;  
    TAYLOR_P        ,    1.3743,   0   , Inf   ,        normal_pdf ,   1.5     ,   0.1  ; 
    TAYLOR_R        ,    0.6071,   0   , Inf   ,        beta_pdf   ,   0.75    ,   0.1  ;      
    TAYLOR_Y        ,    0.4938,   0   , Inf   ,        normal_pdf ,   0       ,   0.1  ;      
    TETA            ,    0.8393,   0   , 0.999 ,        beta_pdf   ,   0.667   ,   0.05 ;      
    TETAWC          ,    0.7901,   0   , 0.999 ,        beta_pdf   ,   0.667   ,   0.05 ;      
    TETAWH          ,    0.9218,   0   , 0.999 ,        beta_pdf   ,   0.667   ,   0.05 ;      
    TREND_AC        ,    0.0032,       ,       ,        normal_pdf ,   0.005   ,   0.01 ;   
    TREND_AH        ,    0.0008,       ,       ,        normal_pdf ,   0.005   ,   0.01 ;
    TREND_AK        ,    0.0027,       ,       ,        normal_pdf ,   0.005   ,   0.01 ;
    ZETAKC          ,    0.7469,  0    , 0.999 ,        beta_pdf   ,   0.50    ,   0.20 ;   

    end;


varobs data_CC data_DP data_IH data_IK data_NC data_NH data_QQ data_RR data_WC data_WH ;

observation_trends;
  data_CC (TREND_AC + MUC/(1-MUC)*TREND_AK) ;
  data_IH ( (MUH+MUBB)*TREND_AC + (1-MUH-MUBB-KAPPA)*TREND_AH +(MUH+MUBB)*MUC/(1-MUC)*TREND_AK) ;
  data_IK (TREND_AC + 1/(1-MUC)*TREND_AK) ;
  data_QQ ((1-MUH-MUBB)*TREND_AC + MUC*(1-MUH-MUBB)/(1-MUC)*TREND_AK - (1-MUH-MUBB-KAPPA)*TREND_AH) ;
end;

  

//% 10,000 runs of Metropolis in 8 minutes

estimation(datafile=US_data_65Q106Q4,
bayesian_irf,irf=20,
conf_sig=0.95,
smoother,
mh_jscale=0.2, 
mode_compute=4,
presample=4, 
prior_trunc=1e-100,
mh_replic=5000,  
mh_nblocks=1, 
lik_init=1)
data_CC data_IK data_IH zata_GDP data_QQ data_RR  ;


end;