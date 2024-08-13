%% Households
robs_ann_target   = 2.25/4;
Rnom_ss           = exp(robs_ann_target/100);
cbeta             = 0.9994;

siggma            = 1.0001;          % Coefficient of relative risk aversion, \sigma in tex
%siggma           = 1.0079;     % in COMPASS we had this

varphi            = 2;          % 1/5=0.2 frisch elasticity, Gali 2015
%varphi           = 1.9707;     %  in COMPASS we had this
%varphi           = 0.5;        % ? sometimes you see this?
                                % 1/2 = 0.5 frisch ela?
chi               = 0;          % overwrite in ss file            
omega             = 0.25;       % Share of constrained worker households, ~25%

%bond_adj_u       = 0.0001;     % very small
bond_adj_u        = 0;          % don't even need it actually, NK is enough?

ppsi_ec           = 0.15;        % CES parameter for HH, nonenergy and energy Elas of subs

%alppha_uec        = 0.05;       % Energy share in consumption, unconstrained HH
%alppha_cec        = 0.05;        % Energy share in consumption, constrained HH

alppha_uec        = 0.000001;       % Energy share in consumption, unconstrained HH
alppha_cec        = 0.000001;        % Energy share in consumption, constrained HH

%% Firms
ppsi_ez           = 0.15;        % CES parameter, how to calibrate?
alppha_ez         = 0.05;       % Firm energy share in production

%phiw              = 0.75;       % Calvo: wage stickiness
phiw              = 0.92;       % Calvo: wage stickiness, higher under SGU
phiz              = 0.66;       % Calvo: price stickiness

xiw               = 0;          % Indexation of nominal wages
xiz               = 0;          % Indexation of final output prices

%% Monetary Policy
thetaPi           = 1.5;        % Monetary policy rule inflation response
thetaR            = 0.9;        % Monetary policy rule interest rate smoothing
thetaY            = 0.125;      % Monetary policy rule output gap response
Pistar            = 1.005;      % 2% inflation target

%% World Trade
epsilonf          = 0.35;       % Price elasticity of world demand for UK exports, from COMPASS

%% Shock parameters
rho_tfp           = 0.93;       % TFP forcing process persistence              
%sigma_tfp         = 6*0.01;    % TFP St dev, engineer a 4% inflation peak, comparible to energy shock of 100%                         
sigma_tfp         = 10*0.007;      % TFP St dev, engineer a 4% inflation peak, comparible to energy shock of 100%                         

rho_muz           = 0.9;        % Markup shock persistence
sigma_muz         = 10*0.01;    % Markup St dev, engineer a 4% inflation peak, comparible to energy shock of 100%                          

rho_pEf           = 0.8;        % Persistence of world export price forcing process
sigma_pEf         = 10*0.1;     % St dev of foreign export price shock   

rho_R             = 0.5;        % Monpol shock persistence
sigma_R           = 0.0008;     % cut 25bps                          


% study an energy shock that doubles the world energy price level, and then
% unwinds, down to ~50% after one year, ~25% after 2 years

%% STEADY STATE

N_ss            = 1; % pick a chi that gives that
pEf_ss          = 1;

omegagz_ss      = 0;   
omegaiz_ss      = 0; 
omegaxz_ss      = 0.25;      % 25% Export share 

%gammah_ss      = 1.0015;   % Population growth trend
gammah_ss       = 1;   % Population growth trend

% we are now calibrating all markups to 1.1, implying a 10% extra on firms mc
muz_ss          = 1.1; 
muw_ss          = 1.1;    

% all except the taumuv_ss are calibrated to 1
% the taumuv_ss has to adjust to the calibrated v-markup 
taumuz_ss       = 1; % correct inefficiency from mono-comp via setting = 1/muz_ss;
taumum_ss       = 1;












