%--------------------------------------------------------------
%
% SWEAR_par.m
%
% sets parameters of the SWEAR model under
% estimated policy rule
%
% by: Guenter Coenen, 21 January 2003 
%
%--------------------------------------------------------------


% ---------------------------------------------------------------------------------
% 1. parameter estimates: mode and median of posterior distribution
% ---------------------------------------------------------------------------------

xparam1 = [0.5978  0.624
           0.0165  0.025
           0.3361  0.392
           0.3247  0.333
           3.5197  3.674
           0.0851  0.105
           0.0808  0.089
           0.8232  0.815
           0.8545  0.842
           0.9493  0.945
           0.8894  0.891
           0.9273  0.913
           6.7711  6.920
           1.3533  1.371
           0.5732  0.595
           0.7367  0.742
           2.3995  2.491
           0.9082  0.905
           0.7627  0.745
           0.4694  0.472
           1.6841  1.688
           0.1398  0.151
           0.9613  0.958
           0.0988  0.095
           0.1586  0.156
           0.6043  0.608
           0.1602  0.164
           0.2892  0.295
           1.4077  1.407
           0.5990  0.598
           0.1690  0.175
           0.9238  0.865];

       
% ---------------------------------------------------------------------------------
% 2. set parameters equal to mode or median of posterior distribution
% ---------------------------------------------------------------------------------

type = 1;  %  1 : mode of posterior distribution
           %  2 : median of posterior distribution

xparam = zeros(42,1);

xparam( 1) = xparam1( 1,type);
xparam( 2) = xparam1( 2,type);
xparam( 3) = xparam1( 3,type);
xparam( 4) = xparam1( 4,type);
xparam( 5) = xparam1( 5,type);
xparam( 6) = xparam1( 6,type);
xparam( 7) = 0;
xparam( 8) = xparam1( 7,type);
xparam( 9) = xparam1( 8,type);
xparam(10) = xparam1( 9,type);
xparam(11) = xparam1(10,type);
xparam(12) = xparam1(11,type);
xparam(13) = xparam1(12,type);
xparam(14) = 0;
xparam(15) = xparam1(31,type);
xparam(16) = xparam1(13,type);
xparam(17) = xparam1(14,type);
xparam(18) = xparam1(15,type);
xparam(19) = xparam1(16,type);
xparam(20) = xparam1(17,type);
xparam(21) = xparam1(18,type);
xparam(22) = xparam1(19,type);
xparam(23) = xparam1(20,type);
xparam(24) = xparam1(21,type);
xparam(25) = xparam1(22,type);
xparam(26) = xparam1(23,type);
xparam(27) = xparam1(24,type);
xparam(28) = xparam1(25,type);
xparam(29) = 0;
xparam(30) = xparam1(26,type);
xparam(31) = 0;
xparam(32) = 0;
xparam(33) = xparam1(27,type);
xparam(34) = xparam1(28,type);
xparam(35) = 0;
xparam(36) = 0;
xparam(37) = xparam1(30,type);
xparam(38) = 0;
xparam(39) = 0;
xparam(40) = 0;
xparam(41) = xparam1(29,type);
xparam(42) = xparam1(32,type);


% ---------------------------------------------------------------------------------
% 3. set coefficients for model file
% ---------------------------------------------------------------------------------

calfa       = 0.3;
ctou        = 0.025;
cbeta       = 0.99;
chab        = 0;
ccs         = 0.6;
cinvs       = 0.22;
crelwage    = 0;
chabw       = 0;
clabeff     = 0;
chlab       = 0;

csadjcost   = xparam(16);
csigma      = xparam(17);
%chabb       = xparam(18);
cprobw      = xparam(19);
clandaw     = 1.5;
csigl       = xparam(20);
cprobp      = xparam(21);
%cindw       = xparam(22);
%cindp       = xparam(23);
cfc         = xparam(41);
%cinvdyn     = 1;
czcap       = xparam(15);
csadjlab    = xparam(37);

% reaction function
crpi        = xparam(24);
crdpi       = xparam(25);
crr         = xparam(26);
cry         = xparam(27);
crdy        = xparam(28);

% AR(1) shocks
crhoa       = xparam( 9);
crhoas      = xparam(42);
crhob       = xparam(10);
crhog       = xparam(11);
crhols      = xparam(12);
crhoqs      = xparam(13);
crhops      = xparam(14);
crhoms      = 0;
crhoy       = 0;
crhocons    = 0;
crhoinv     = 0;
crhopinf    = 0;
crhow       = 0;
crholab     = 0;

% scaling factor of the innovations
cscaleea    = xparam( 1);
cscaleeas   = xparam( 2);
cscaleeb    = xparam( 3);
cscaleeg    = xparam( 4);
cscaleels   = xparam( 5);
cscaleeqs   = xparam( 6);
cscaleeps   = 0;
cscaleem    = xparam( 8);
cscaleecons = 0;
cscaleeinv  = xparam(30);
cscaleey    = 0;
cscaleelab  = 0;
cscaleepinf = xparam(33);
cscaleew    = xparam(34);


