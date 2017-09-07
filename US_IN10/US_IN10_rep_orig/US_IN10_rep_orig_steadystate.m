
function [ys,check]=jules1_d4_steadystate(junk,ys);

BETA      =   get_param_by_name('BETA');
BETA1     =   get_param_by_name('BETA1');
M         =   get_param_by_name('M');
JEI       =   get_param_by_name('JEI');
MUC       =   get_param_by_name('MUC');
MUH       =   get_param_by_name('MUH');
DKC       =   get_param_by_name('DKC');
DKH       =   get_param_by_name('DKH');
DH        =   get_param_by_name('DH');
ETA       =   get_param_by_name('ETA');
ETA1      =   get_param_by_name('ETA1');
ALPHA     =   get_param_by_name('ALPHA');
X_SS      =   get_param_by_name('X_SS');
NU        =   get_param_by_name('NU');
NU1       =   get_param_by_name('NU1');
KAPPA     =   get_param_by_name('KAPPA');
XW_SS     =   get_param_by_name('XW_SS');
TREND_AC  =   get_param_by_name('TREND_AC');
TREND_AH  =   get_param_by_name('TREND_AH');
TREND_AK  =   get_param_by_name('TREND_AK');
MUBB      =   get_param_by_name('MUBB');



TRENDY = TREND_AC + MUC/(1-MUC)*TREND_AK;  
TRENDH = (MUH+MUBB)*TREND_AC + (1-MUH-KAPPA-MUBB)*TREND_AH + MUC*(MUH+MUBB)/(1-MUC)*TREND_AK ;
TRENDK = TREND_AC + 1/(1-MUC)*TREND_AK ;
TRENDQ = (1-MUH-MUBB)*TREND_AC + MUC*(1-MUH-MUBB)/(1-MUC)*TREND_AK - (1-MUH-KAPPA-MUBB)*TREND_AH ;


% equations DEFINING CAPITAL TO PRODUCTION RATIOS (1) to (6) in "Steady state"
check=0;

% Trends
EXPTRENDY = exp ( TRENDY ) ;  
EXPTRENDK = exp ( TRENDK ) ;
EXPTRENDQ = exp ( TRENDQ ) ;
EXPTRENDH = exp ( TRENDH ) ;
gamma_k = exp ( TREND_AK );


% Interest rates
r = 1 / BETA ;
rkc = r*gamma_k - (1-DKC) ;
rkh = r - (1-DKH) ;
r1 =  r / EXPTRENDY - 1 ;

ZETA0 = BETA*EXPTRENDK*MUC/(gamma_k-BETA*(1-DKC))/X_SS ;
ZETA1 = BETA*EXPTRENDY*MUH/(1-BETA*(1-DKH));
ZETA2 = JEI/(1-BETA*EXPTRENDQ*(1-DH)) ;
ZETA3 = JEI/(1-BETA1*EXPTRENDQ*(1-DH)-EXPTRENDQ*(BETA-BETA1)*M) ;
ZETA4 = (r/EXPTRENDY-1)*M*EXPTRENDQ/r ;


% Usual...
R_SS = 1 / BETA ;
R1 = R_SS-1;

DH1 = 1 - (1-DH)/EXPTRENDH ;
DKC1 = 1 - (1-DKC)/EXPTRENDK ; 
DKH1 = 1 - (1-DKH)/EXPTRENDY ;

CHI1 = 1+DH1*ZETA2*(1-r1*ZETA1-KAPPA-ALPHA*(1-MUH-KAPPA-MUBB)) ;
CHI2 = (r1*ZETA1+KAPPA+ALPHA*(1-MUH-KAPPA-MUBB))*DH1*ZETA3+ZETA4*ZETA3 ;
CHI3 = (X_SS-1+r1*ZETA0*X_SS+ALPHA*(1-MUC))/X_SS ;
CHI4 = 1+DH1*ZETA3*(1-(1-ALPHA)*(1-MUH-KAPPA-MUBB))+ZETA4*ZETA3 ;
CHI5 = (1-ALPHA)*(1-MUH-KAPPA-MUBB)*DH1*ZETA2 ;
CHI6 = (1-ALPHA)*(1-MUC)/X_SS ;


CY = (CHI3*CHI4+CHI2*CHI6)/(CHI1*CHI4-CHI2*CHI5) ;
CYPRIME = (CHI1*CHI6+CHI3*CHI5)/(CHI1*CHI4-CHI2*CHI5) ;
QIY = DH1*ZETA2*CY + DH1*ZETA3*CYPRIME ;

RATION = (1-MUH-KAPPA-MUBB)/(1-MUC)*X_SS*QIY  ;
NHNC = RATION^(1/(1-NU)) ;
NHNC1 = RATION^(1/(1-NU1)) ;

nc = ( ((1-MUC)*ALPHA/CY/X_SS/XW_SS)/(1+RATION)^((ETA+NU)/(1-NU)) )^(1/(1+ETA)) ;
nh = NHNC*nc ;

nc1 = ( ((1-MUC)*(1-ALPHA)/CYPRIME/X_SS/XW_SS)/(1+RATION)^((ETA1+NU1)/(1-NU1)) )^(1/(1+ETA1)) ;
nh1 = NHNC1*nc1 ;

Y = (nc^ALPHA)*(nc1^(1-ALPHA)) *  ZETA0^(MUC/(1-MUC)) / EXPTRENDK^(MUC/(1-MUC)) ;


I = (nh^(ALPHA*(1-MUH-KAPPA-MUBB))) *  ...
    (nh1^((1-ALPHA)*(1-MUH-KAPPA-MUBB))) * ZETA1^MUH * (Y*QIY)^MUH / EXPTRENDY^(MUH) * (MUBB*Y*QIY)^MUBB ;

q = QIY*Y / I ;

QI = QIY*Y ;

kc = ZETA0*Y ;

kh = ZETA1*QI ;

BRI = MUBB*QI ;

c = CY*Y ;
c1 = CYPRIME*Y ;

h = ZETA2*c/q ;
h1 = ZETA3*c1/q ;


b = M*q*EXPTRENDQ*h1/r ;

lm = (1-BETA1/BETA)/c1 ;

uc = 1/c;
uc1 = 1/c1;
uh = JEI/h;
uh1 = JEI/h1;

CC = c + c1 ;
IH = I  ;
IK = DKC1 * kc + DKH1* kh  ;

YY_SS = CC + IK + BRI ;
QI_SS = q*I ;

WEALTH = (kc+kh) + q*(h+h1) ;

BB_SS = log(b) ;
CC_SS = log(CC) ;
IH_SS = log(IH) ;
IK_SS = log(IK) ;
QQ_SS = log(q) ;
RR_SS = log(R_SS) ;

NC_SS = ALPHA*log(nc) + (1-ALPHA)*log(nc1) ;
NH_SS = ALPHA*log(nh) + (1-ALPHA)*log(nh1) ;


dp = 1 ;

wc = ALPHA*(1-MUC)*Y/X_SS/nc ;
wh = ALPHA*(1-MUH-KAPPA-MUBB)*QI/nh ;
wc1 = (1-ALPHA)*(1-MUC)*Y/X_SS/nc1 ;
wh1 = (1-ALPHA)*(1-MUH-KAPPA-MUBB)*QI/nh1 ;

WC_SS = log(wc) ;
WC1_SS = log(wc1) ;
WH_SS = log(wh) ;
WH1_SS = log(wh1) ;


rr = 1 ;
c_ss = c ;

H_SS = log(h) ;
H1_SS = log(h1) ;

v = uh/uc*h/(h+h1) + uh1/uc1*h1/(h+h1) ;
V_SS = log(v) ;



xwc = XW_SS;
xwc1 = XW_SS;
xwh = XW_SS;
xwh1 = XW_SS;

WP_SS = log(wc + wh + wc1 + wh1) ;



% X = X_SS;
% data_CC = EXPTRENDY;
% data_DP = 1        ;
% data_GDP = 1       ;
% data_IH = EXPTRENDH;
% data_IK = EXPTRENDK;
% data_NC = 1        ;
% data_NH = 1        ;
% data_QQ = EXPTRENDQ;
% data_RR = 1        ;
% data_WC = 1        ;
% data_WH = 1        ;

xxx = [ 1     
1
1
1
1
1
1
b  
c  
c1 
EXPTRENDY^1 % C
1   % dp
EXPTRENDH^1 % IH
EXPTRENDK^1 % IK
1   % NC
1   % NH
EXPTRENDQ^1 % q
1   % r
1 % data_WW
1 % data_WW
dp
h  
h1 
I  
kc 
kh 
lm 
nc 
nc1
nh 
nh1
q  
r  
rkc
rkh
uc 
uc1
wc 
wc1
wh
wh1
X_SS
xwc
xwc1
xwh
xwh1
Y   
1
1
1 ];


if (any(xxx<=0))
  % if the steady state does not exist, make penalty from negative
  % numbers and return check=-1, this is handled in resol.m, and the
  % penalty is put to info(2)
  penalty = sum(xxx(find(xxx <= 0)).^2);
  ys = zeros(size(xxx));
  ys(1) = penalty;
  check = -1;
else
  logxxx = log(xxx) ;
  ys = logxxx ;
end