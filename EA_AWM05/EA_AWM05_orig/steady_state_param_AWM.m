%------------------------------------------------------------
% steady_state_param_new
% Defines steady state values for the AWM
% and calculates model consistent steady
% state values for the ratios and parameters
% in the AWM linear version
%
% Keith Kuester 08.Feb.2003
% Parameter values have been checked to be in line
% although not necessarily equal to sim0fl and sim00base
% databases in troll (using files 'check steady state.inp'
% and 'steady state ratios new.inp' on 08.Feb.2003
%------------------------------------------------------------

URTBAR          =   0.09104;
PIBAR           =   0.004939;                       % This is del(log(yfd)) at 2470q1. inft is 0.004951;
STNBAR          =   4.998913;
STRQBAR         =   (1+STNBAR/100)^(.25)-1-PIBAR;
LTNRESBAR       =   0.011645;
EXPLTNRESBAR    =   exp(LTNRESBAR);

YETGBAR         =   0.005723;                       % This is del(log(yfd)) at 2470q1. YET.growth.target is 0.005713;

atransfer       =   1;2;      % in the TROLL model atransfer=1; %governs transfers and hence TRN__YENBAR
atdn_yen        =   1;0.95;   % governs responsiveness of tdn_yen on gln_yen, =1 in the TROLL model

%------------------------------------------------------------
% These ratios are exogenous and need to be specified
%------------------------------------------------------------

GDN__DIS__YEN     =   0.00384;
GIN__OTHER__YEN   =   0.001461;
GIN__YEN          =   0.023805;
GLN__YEN__TARGET  =  -0.01269;
INN__YEN          =   0.045118;
PYN__DIS__YEN     =  -0.118294;
SSN__YEN          =   0.182356;
TIN__YEN          =   0.114078;
TDN__YEN__DIS     =   -0.001829;
TRN__FIRMS__YEN   =   0.021759;
TRN__OTHER__YEN   =   0.014037;
TRN__YEN__DIS     =   0.204491;
OGN__YEN           =   0.033095;
IGN__ADJ          =   -2.065267;
XTD__RES          =   0.0025;
MTD__RES          =   0.0025;
ITD__RES          =   -0.001925;
PCD__RES          =   -0.000492;
LSR__RES          =   0.029983;
MTR__RES          =   0.0025;

TRN__YEN__DISBAR  =   0.204491;

%------------------------------------------------------------
%----- Specify ratios of real exogenous demand components over YER in steady state                
%----- These are in levels - not in logs                                                          
%------------------------------------------------------------

GCR__YERBAR       =   0.138826;                     % = GCR/YER
YWR__YERBAR       =   8.52024841e-005;              % = YWR/YER

%------------------------------------------------------------
%----- Specify ratios of foreign (exogenous) deflators over YFD in steady state                  
%----- These are in levels - not in logs                                                         
%------------------------------------------------------------

YWDEEN__YFDBAR    =  0.684308;                      % = YWD*EEN/YFD
COMPREEN__YFDBAR  =  55.345606;                     % = COMPR*EEN/YFD


%------------------------------------------------------------
% Since XTR does not have a closed form solution in terms indep. variables, we need to define the following two
% Note that there is a (numerical) solution for XTR_yerbar in terms of fundamentals not involving the Taylor
% rule parameters. Hence this also holds for pcr_yerbar.
% In order to be model consistent, either take all components of GDP from simulations or let XTR__YERBAR take the
% gap as XTR__YERBAR=1-PCR__YERBAR-GCR__YERBAR-SCR__YERBAR-ITR__YERBAR+MTR__YERBAR; after determining MTR__YERBAR below.
% We opted for exactly this. The only thing to define then remains PCR__YERBAR.
%------------------------------------------------------------

PCR__YERBAR       = 0.685502;.70;.6;


%------------------------------------------------------------
%----- DON'T TOUCH BELOW HERE -------------------------------
%------------------------------------------------------------

%------------------------------------------------------------
%----- Define deflator ratios (over yfd) consistently                                              
%----- Assume log(ywd*een/yfd) and log(compr*een/yfd) known in steady state, i.e. specified above. 
%----- Then the ratios drop out of examining eqns YED, PCD, ITD, MTD and XTD in steady state       
%------------------------------------------------------------

YED__YFDBAR         =   1/(1-TIN__YEN);
XTD__YFDBAR         =   exp( .7*log(YED__YFDBAR)+.3*log(YWDEEN__YFDBAR)-1/XTD__ECM*( XTD__CST+XTD__RES...
                                + (-1+XTD__DLXTD1+XTD__DLYED+XTD__DLMTD)*PIBAR) );
MTD__YFDBAR         =   exp( .65*log(XTD__YFDBAR)+.25*log(COMPREEN__YFDBAR)+.1*log(YWDEEN__YFDBAR)...
                                - 1/MTD__ECM*( MTD__CST+MTD__RES+ ( -1 +MTD__DLMTD1+MTD__DLYWDX+MTD__DLCOMPR+MTD__DLCOMPR1 )*PIBAR ) ) ;
ITD__YFDBAR         =   exp( ITD__ECM2/(ITD__ECM1+ITD__ECM2)*log(MTD__YFDBAR) - (ITD__CST+ITD__RES)/(ITD__ECM1+ITD__ECM2) ) ;
PCD__YFDBAR         =   exp( PCD__ECM__LYED*log(YED__YFDBAR)+PCD__ECM__LMTD*log(MTD__YFDBAR)...
                                - 1/PCD__ECM*( PCD__CST+PCD__RES...
                                                +(-1+PCD__DLPCD4+PCD__DLYED+PCD__DLYED1+PCD__DLMTD+PCD__DLMTD1+PCD__DLCOMPREEN)*PIBAR ) ); 

%------------------------------------------------------------
%---- Government block and some more definitions                            
%---- All ratios are in levels (equation numbers refer to stnchange
%------------------------------------------------------------

GCN__YENBAR        =   GCR__YERBAR;                                                                     % since YED=GED 
GLN__YENBAR        =   -(TDN__YEN__DIS)*2/TDN__GLN+GLN__YEN__TARGET ;                                   % 58
TRN__YENBAR        =   0.2*atransfer*URTBAR+TRN__YEN__DIS;                                                        % 64 
GDN__YENBAR        =   (1+YETGBAR)*(1+PIBAR)/((1+YETGBAR)*(1+PIBAR)-1)*(-GLN__YENBAR/4+GDN__DIS__YEN);  % 85
LTNBAR             =   EXPLTNRESBAR*(100+STNBAR)-100;                                                   % 55
INN__YENBAR        =   4/100*(1/2*LTNBAR+IGN__ADJ)*GDN__YENBAR*( (1+YETGBAR)*(1+PIBAR) )^(-1);          % 100,101 
GSN__YENBAR        =   GLN__YENBAR+GIN__YEN;                                                            % 84 neglecting GLN__DIS/YEN which is tiny
GYN__YENBAR        =   GSN__YENBAR+GCN__YENBAR;                                                         % 83  
TDN__YENBAR        =   GYN__YENBAR-SSN__YEN-TIN__YEN-OGN__YEN+INN__YENBAR+TRN__YENBAR+TRN__OTHER__YEN+GIN__OTHER__YEN; % 82
YIN__YENBAR        =   1;                                                                               % 51 
YFN__YENBAR        =   (1-TIN__YEN);                                                                    % 52

%------------------------------------------------------------
%---- Real Components of GDP                                                
%---- All ratios are in levels                                                
%---- XTR__YERBAR captures any discrepancies resulting from the definition  
%---- of PCR__YERBAR above.                                                 
%------------------------------------------------------------

KSR__YERBAR        =   ( (STRQBAR+DELTA+ITR__ADJ)/BETA )^(-1);                                          % LR: MPK=user cost of capital 
ITR__YERBAR        =   (1-(1-DELTA)/(1+YETGBAR))*KSR__YERBAR ;                                          % ECM term of eq 16 or eq 17
LSR__YERBAR        =   exp(- ( LSR__CST+YETGBAR*(-1+.5*LSR__DYER1+LSR__DYER2+LSR__DLSR1)+LSR__RES+LSR__ECM*0.2425)/LSR__ECM); % 28 
SCR__YERBAR        =   YETGBAR/(1+YETGBAR)*LSR__YERBAR;                                                 % 29 
MTR__YERBAR        =   ( exp(1/MTR__ECM*(MTR__CST+MTR__RES-MTR__ECM__TIME*MTR__ECM*112 ...
                                        -MTR__ECM*MTR__ECM__LMTDYED*log(MTD__YFDBAR/YED__YFDBAR)...
                                        +YETGBAR*(-1+MTR__DLFDD)))-1)^(-1) ;                            % 31, using FDD=YER+MTR
XTR__YERBAR        =    1-PCR__YERBAR-GCR__YERBAR-SCR__YERBAR-ITR__YERBAR+MTR__YERBAR;                  % 36 

%------------------------------------------------------------
%---- Some ratios of the SS ratios above    
%------------------------------------------------------------

GYN__GSNBAR         =   GYN__YENBAR/GSN__YENBAR; 
TDN__GYNBAR         =   TDN__YENBAR/GYN__YENBAR;  
SSN__GYNBAR         =   SSN__YEN/GYN__YENBAR; 
TIN__GYNBAR         =   TIN__YEN/GYN__YENBAR; 
OGN__GYNBAR         =   OGN__YEN/GYN__YENBAR; 
INN__GYNBAR         =   INN__YENBAR/GYN__YENBAR; 
TRN__GYNBAR         =   TRN__YENBAR/GYN__YENBAR; 
TRN__OTHER__GYNBAR   =  TRN__OTHER__YEN /GYN__YENBAR; 
GIN__OTHER__GYNBAR   =  GIN__OTHER__YEN/GYN__YENBAR; 

GSN__GLNBAR         =   GSN__YENBAR/GLN__YENBAR; 
GLN__GDNBAR         =   GLN__YENBAR/GDN__YENBAR; 
GDN__DIS__GDNBAR    =   GDN__DIS__YEN/GDN__YENBAR; 
YFN__YINBAR         =   YFN__YENBAR/YIN__YENBAR; 

%------------------------------------------------------------
%---- This is solved using steady state price ratios and MTR__YERBAR,  
%---- XTR__YERBAR, PCR__YERBAR, SCR__YERBAR, LSR__YERBAR         
%------------------------------------------------------------

YWDX__YFDBAR        =   YWDEEN__YFDBAR^(.4)*XTD__YFDBAR^(.6);                                           % 34
TBR__YERBAR         =   XTR__YERBAR-MTR__YERBAR;                                                        % 35
YWRX__YERBAR        =   YWR__YERBAR^(.4)*(1-TBR__YERBAR)^(0.6);                                         % 33
XTR__TBRBAR         =   XTR__YERBAR/TBR__YERBAR;

%------------------------------------------------------------
%---- Steady state ratios of domestic demand        
%------------------------------------------------------------

FDD__YERBAR         =   1+MTR__YERBAR;                                                                  % 32
PCR__FDDBAR         =   PCR__YERBAR/FDD__YERBAR; 
GCR__FDDBAR         =   GCR__YERBAR/FDD__YERBAR; 
ITR__FDDBAR         =   ITR__YERBAR/FDD__YERBAR; 
SCR__FDDBAR         =   SCR__YERBAR/FDD__YERBAR; 
XTR__FDDBAR         =   XTR__YERBAR/FDD__YERBAR; 

%------------------------------------------------------------
%---- Some more nominal ratios 
%------------------------------------------------------------

PCN__YENBAR         =   PCR__YERBAR*PCD__YFDBAR/YED__YFDBAR;                                            % 38
ITN__YENBAR         =   ITR__YERBAR*ITD__YFDBAR/YED__YFDBAR;                                            % 39
XTN__YENBAR         =   XTR__YERBAR*XTD__YFDBAR/YED__YFDBAR;
MTN__YENBAR         =   MTR__YERBAR*MTD__YFDBAR/YED__YFDBAR; 
TBN__YENBAR         =   XTN__YENBAR-MTN__YENBAR; 

%------------------------------------------------------------
%---- The following three ratios use eqns 44 45 46, with AUX being auxiliary defs of params 
%------------------------------------------------------------

AUXa                =   1-NFN__NFN/(1+PIBAR)/(1+YETGBAR);
AUXb                =   -NFN__NFA*( 1/(1+PIBAR)/(1+YETGBAR)+1/(1+PIBAR)^2/(1+YETGBAR)^2 );
AUXc                =   1-1/(1+YETGBAR)/(1+PIBAR);
NFN__YENBAR         =   (AUXa-AUXb/AUXc)^(-1)*AUXb/AUXc*TBN__YENBAR;
CAN__YENBAR         =   TBN__YENBAR+NFN__YENBAR;  
NFA__YENBAR         =   1/AUXc*CAN__YENBAR; 


PYN__YENBAR         =   (1-TIN__YEN)-GYN__YENBAR+TIN__YEN+NFN__YENBAR+PYN__DIS__YEN; %47
TBN__CANBAR         =   TBN__YENBAR/CAN__YENBAR; 
YFN__PYNBAR         =   YFN__YENBAR/PYN__YENBAR; 
PYN__DIS__PYNBAR    =   PYN__DIS__YEN/PYN__YENBAR;  
NFN__PYNBAR         =   NFN__YENBAR/PYN__YENBAR; 
TIN__PYNBAR         =   TIN__YEN/PYN__YENBAR; 
GYN__PYNBAR         =   GYN__YENBAR/PYN__YENBAR; 

WLN__YENBAR         =   NFA__YENBAR+KSR__YERBAR*ITD__YFDBAR/YED__YFDBAR+4*GDN__YENBAR;  %50
NFA__WLNBAR         =   NFA__YENBAR/WLN__YENBAR; 
KSRITD__WLNBAR      =   KSR__YERBAR*ITD__YFDBAR/YED__YFDBAR / WLN__YENBAR; 
GDN__WLNBAR         =   GDN__YENBAR/WLN__YENBAR; 

XTN__TBNBAR         =   XTN__YENBAR/TBN__YENBAR;
TBN__CANBAR         =   TBN__YENBAR/CAN__YENBAR;



