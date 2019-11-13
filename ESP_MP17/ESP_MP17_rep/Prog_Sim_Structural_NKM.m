% This code solves and simulates the structural model. 

% ******FUNCTIONS********
% *Prog_Sim_Structural (main function): the structural model parameters
% are set, data is imported, model solving function is called and plotting
% function is called.

% *polf2ormap: maps time t-1 determined state variables
% into time t variables, given second order policy functions from dynare

% *sim_bg: simulates a series for bg, not used currently

% *figures: produces the figures. is called twice: for all plots and for
% PIGS plots only. Any desired changes to structural figures have to be
% implemented in that function directly

function varargout = Prog_Sim_Structural(varargin)
%%
% varargin = {'plot','version of counterf',end_year}

% Defining global variables to allow Dynare to be called inside this
% function.
global var_list_ oo_ M_;

% The fraction of debt relief increasing nfa is set on line 214
% Set greek debt relief line 192

    evalin('base','clear' ); 
    evalin('base', 'clc') ; 
    evalin('base','close all');
    
% Generate "varargin" by hand if run straight from here
%  varargin{1} = 'plot';
%  nargin = size(varargin,1);

    % Options
    
    % Append "par.Ny_app" years of simulation before the sample
    par.Ny_app = 1;
    
    par.xf_shock = 1 ; % switch on/off the foreign demand shock

    % set  string that is appended to the figure file name
    par.shock_string = 'bchmk';
       
    % Plots
    par.same_scale = 1 ; % all figures on same scale for a given variable
    par.save_figs  = 1 ; % save figures=1, don't save figures=0
    par.demean     = 1 ; % plot demeaned series
    
    
    % Data
    % Austria, Belgium, Finland, France, Germany, Greece, Ireland, Italy, Netherlands, Portugal, Spain
    % aut = 1; bel=2; deu=3; esp=4; fin=5; fra=6; gre=7; irl=8; ita=9; nld=10; prt=11;
    
    par.start_year = 2001 ; % don't change this one
    par.base_year = 2001 ;
    
	if nargin > 2
		par.end_year = varargin{3};
	else
		par.end_year = 2012;
    end
    par.data_end = 2012;
    par.years = par.end_year - par.start_year + 1;
    par.countries = 11;
    
    % To make it easier to work with the panel this function returns the row
    % number in the vector corresponding to each yeara
    yr = @(x) x - par.start_year + 1;
    
    % Just for convenience if want to pull data out of one of the tables
    % can refer to it by 3 letter country code: exp1.b(:,par.codes('ITA'))
    keySet =   {'AUT','BEL','DEU','ESP','FIN','FRA','GRE','IRL','ITA','NLD','PRT'};    
    %valueSet = linspace(1,par.countries,par.countries);
    par.names = keySet;
    %par.codes= containers.Map(keySet,valueSet);
   

    % Initialize which version of model to run
	% These are the default model options used if the code is run directly from here
    par.rho_counterfactual = 0;        
    par.compet_counterfactual = 0;        
    par.fiscal_counterfactual = 0;
    par.mp_counterfactual = 0;
    par.xf_counterfactual = 0;    
    par.fisc_dev_start = 2008;
    par.debt_relief = 0;
    par.debt_relief_fwd = 0;
    par.vat = 0;
    
    % If the structural code is called externally, this section of code selects which version of model (benchmark or counterfactual)
	% is being run and sets parameters accordingly
    if nargin > 1
        if strcmp(varargin{2},'benchmark')
            par.rho_counterfactual = 0;        
            par.fiscal_counterfactual = 0;
            par.mp_counterfactual = 0;
            par.compet_counterfactual = 0;
            par.vat = 0;
        elseif strcmp(varargin{2},'fiscal counterfactual')
            par.fiscal_counterfactual = 1;   
            par.shock_string = 'fisccf';
            par.demean = 0;
        elseif strcmp(varargin{2},'macroprudential counterfactual')
            par.mp_counterfactual = 1;
            par.shock_string = 'mpcf';
            par.demean = 0;
        elseif strcmp(varargin{2},'no segmentation counterfactual')
            par.rho_counterfactual = 1;
            par.shock_string = 'rhocf';
            par.demean = 0;
        elseif strcmp(varargin{2},'fiscal+mp counterfactual')
			par.mp_counterfactual = 1;
            par.fiscal_counterfactual = 1;	
            par.shock_string = 'fiscmpcf';
            par.demean = 0;            
        end  
    end
   
    % Economic parameters
    % Parameters different across countries, computed externally:
    % "alpha" was share spent on home goods. Now "open" is the share on foreign
                     % aut; bel;   deu; esp; fin;  fra;  gre;  irl;  ita;  nld;  prt;
    par.alpha_old = [0.713,0.664,0.774,0.76,0.732,0.773,0.759,0.628,0.787,0.697,0.71];
    par.open = 1-par.alpha_old;
    par.chi = [0.347,0.391,0.441,0.546,0.579,0.476,0.648,0.48,0.441,0.484,0.503] ; % fraction of impatient households
 
    % Parameters uniform across countries:
    par.ir = 0.02*ones(1,par.countries) ;               % fixed nominal interest rate
    par.beta = ones(1,par.countries) ./ (1 + par.ir) ;  % discount factor
    
    par.gamma   = 1 * ones(1,par.countries) ;       % elasticity between exports
    par.eta     = 1 * ones(1,par.countries) ;       % elasticity between home and foreign goods
    par.labc    = 1 * ones(1,par.countries) ;       % inverse labor supply elasticity
    par.crra    = 1 * ones(1,par.countries) ;       % risk aversion
    par.calvop  = 0.5 * ones(1,par.countries) ;     % price stickyness Calvo parameter
    par.elasp   = 6 * ones(1,par.countries) ;       % elasticity of substitution among price setters 
    par.calvow  = 0.5 * ones(1,par.countries) ;     % wage stickyness Calvo parameter
    par.elasw   = 6 * ones(1,par.countries) ;       % elasticity of substitution among wage setters 
    
    par.pimc    = (1-par.calvop).*(1-par.beta.*par.calvop)./par.calvop ;                             % coefficient in price Phillips curve
    par.wimrs   = ((1-par.calvow).*(1-par.beta.*par.calvow)./par.calvow)./(1+par.labc.*par.elasw) ;  % coefficient in wage Phillips curve
    
    
    par.rho_zbh = 0.9 * ones(1,par.countries) ;     % debt limit shock persistence 0.9
    par.rho_zr =  0.5 * ones(1,par.countries) ;     % interest rate shock persistence 0.5
    par.rho_zg =  0.75 * ones(1,par.countries) ;    % government spending shock persistence 0.75
    par.rho_ztrans = 0.9 * ones(1,par.countries) ;  % government transfers shock persistence 0.9
    par.rho_zcf = 0.8 * ones(1,par.countries) ;     % foreign demand shock persistence 0.8
    par.rho_zrecap  = 0.5 * ones(1,par.countries) ; % bank recapitalization shock persistence 0.5
    
    % Structural model coefficients
    % MacoPru counterfactual depends mostly on RECAP, RHOBH, GAMMA_GN
    % If gamma_gn is large, then MacroPru is undone by endogenous fiscal
    % shock
    
    par.gamma_gn        = -0.2 * ones(1,par.countries) ; % Gov exp/trans slope wrt labor -0.2
    par.gamma_grho      = -1.8 * ones(1,par.countries) ; % Gov exp/trans slope wrt rho -1.8
    par.coef_gbg        = -0.02 * ones(1,par.countries) ; % Gov exp/trans slope wrt nom gov debt
    
    par.lambda_bhrho    = -1.9 * ones(1,par.countries) ; % Private debt wrt spread -1.9
    
    par.lambda_rho0     = -2.8 * ones(1,par.countries) ; % (-2.3) Constant term in rho equation -2.3
    par.lambda_rhobg    = 2.1 * ones(1,par.countries) ; % (2.2) rho slope wrt gov debt 2.2
    par.lambda_rhobh    = 1.2 * ones(1,par.countries) ; % (1.0) rho slope wrt private debt 1.2
    par.lambda_rhorec   = 18.2 * ones(1,par.countries) ; % (18.5) rho slope wrt recap 18.5 
    
    par.coef_rhonfa     = -0.001 * ones(1,par.countries) ; % rho slope wrt nfa - for stability
   

    par.lambda_rhobg(1,7) = 3.0 ; % 3.5
    
    % Fraction of debt relief that goes into nfa:
    par.nfa_relief_frac = 0.0*ones(1,par.countries);
   
    
    % DRIFT TERMS
    par.drift = 1 ;
    % Start of expenditure and transfer drifts in 2001 or not. 
    % If set to 1, drifts in 2000 are zero, and start climbing in 2001. 
    % If not set to 1, drifts are zero in 2000 and 2001, start in 2002
    par.start_drift_2001 = 1 ;
    
                    % aut; bel; deu; esp; fin; fra; gre; irl; ita; nld; prt;
    par.g_drift_adj = [0   ,0   ,0   ,0.0 ,0   ,0   ,0.0 ,0.0 ,0   ,0   ,0    ]*par.drift/100;
    par.T_drift_adj = [0.5 ,1.0 ,-1  ,1.2 ,0   ,0   ,3.0 ,1.2 ,0   ,0   ,1.5  ]*par.drift/100;    
    
    step = 0.0000005 ;  % speed of drift reversal, 1 is same as increase
    
    % LABOR PRODUCTIVITY (in case one wants to add some differential
    % productivity shocks to the model. Not used in baseline)
    
    par.prod = 1 ;
    ESPPROD = 0.00*par.prod*ones(12+par.Ny_app,1) ;
    GREPROD = 0.00*par.prod*ones(12+par.Ny_app,1) ;
    IRLPROD = 0.01*par.prod*ones(12+par.Ny_app,1) ;
    PRTPROD = 0.00*par.prod*ones(12+par.Ny_app,1) ;

    
    if par.fiscal_counterfactual == 0
        par.g_gamma_drift = par.g_drift_adj ;
        par.T_gamma_drift = par.T_drift_adj ;
%         if par.mp_counterfactual == 1
%             par.g_gamma_drift = 0.75*par.g_drift_adj ; % this is to avoid unrealistic increase in govt spending
%             par.T_gamma_drift = 0.75*par.T_drift_adj ; % that may happen in the MP counterfactual
%         end
    else
        par.g_gamma_drift = zeros(1,par.countries);
        par.T_gamma_drift = zeros(1,par.countries);
        %par.T_gamma_drift = par.T_drift_adj/100000 ;
        %par.g_gamma_drift = par.g_drift_adj/100000 ;
        % to run a counterfactual fiscal adjustment (lowering G and T in the boom by 1% of GDP each year
        %par.T_gamma_drift = [0   ,0   ,0   ,-1.0 ,0   ,0   ,-1.0 ,-1 ,0   ,0   ,-1]./100; 
        %par.g_gamma_drift = [0   ,0   ,0   ,-1.0 ,0   ,0   ,-1.0 ,-1 ,0   ,0   ,-1]./100;
    end
    
    par.TPOST = - 1*par.T_gamma_drift ;
    par.GPOST = - 1*par.g_gamma_drift ;
    par.TDROP = - 0*par.T_gamma_drift ;
    
    % Debt relief
    data.debt_relief = zeros(par.years,par.countries);
    if par.fiscal_counterfactual == 0
        %if par.debt_relief == 0
            data.debt_relief(yr(2010),7) = -0.0; %-0.0
            data.debt_relief(yr(2011),7) = -0.2; %-0.1
            data.debt_relief(yr(2012),7) = -0.3; %-0.4
        %else
        %    cf_debtrelief = par.debt_relief_size;
        %    data.debt_relief(yr(2010),7) = cf_debtrelief(1);
        %    data.debt_relief(yr(2011),7) = cf_debtrelief(2);
        %    data.debt_relief(yr(2012),7) = cf_debtrelief(3);
        %    par.rho_bg = 1*par.rho_bg ;
        %    par.TDROP(7) = - 2*par.T_gamma_drift(7) ;
        %end
    end
    
    % Adjust macroprudential rule
    if par.mp_counterfactual == 1
        par.macroprudential = 1000; % divide by this number the growth rate of bh prior to crisis start
    else
        par.macroprudential = 1;
    end
    
    % Load data
    data_in = csvread('DATA_rebased.csv');
    
    % Write to data variables. Year 2000 data read into data.t0.* and then
    % dropped   
    
    % Nominal output
    data.y = reshape(data_in(:,2),par.years+1,par.countries);
    data.t0.y = data.y(1,:);
    data.y(1,:) = [];    
    
    % Employment
    data.n = reshape(data_in(:,3),par.years+1,par.countries);
    data.t0.n = data.n(1,:);
    data.n(1,:) = [];
    
    % Nominal expenditures
    data.x = reshape(data_in(:,4),par.years+1,par.countries);
    data.t0.x = data.x(1,:);
    data.x(1,:) = [];
    
    % Wage/price level
    %data.w = reshape(data_in(:,24),par.years+1,par.countries);
    % if use hicp rather than ulcs (:;24); if use average hicp-ulc (:;26) then 
    data.w = reshape(data_in(:,26),par.years+1,par.countries);
    data.t0.w = data.w(1,:);
    data.w(1,:) = [];
    data.p = data.w;
    
    % Nominal interest rate spread = r_t for theoretical model
    data.rho = reshape(data_in(:,15),par.years+1,par.countries);
    data.t0.rho = data.rho(1,:);
    data.rho(1,:) = [];    
    
    % this command returns the median value of each row (year)
    data.rho_median = median(data.rho,2);
    
    % Interest rates
    data.rj = repmat(par.ir, par.years, 1) + data.rho;
    data.t0.rj = par.ir + data.t0.rho;
    
    % Nominal aggregate household debt
    data.b = reshape(data_in(:,6),par.years+1,par.countries);   
    data.t0.b = data.b(1,:);
    % data missing for ireland, set b_2000 = b_2001
    data.t0.b(8) = data.b(2,8);
    data.b(1,:) = [];
    
    % Computing nominal household debt per patient consumer
    data.bh = data.b ./ repmat(par.chi, par.years, 1);
    data.t0.bh = data.t0.b ./ par.chi;
    
    % Nominal government debt
    data.bg = reshape(data_in(:,7),par.years+1,par.countries);
    data.t0.bg = data.bg(1,:);
    data.bg(1,:) = [];
    
    % Nominal government expenditures
    data.g = reshape(data_in(:,8),par.years+1,par.countries);
    data.t0.g = data.g(1,:);
    data.g(1,:) = [];
    
    % Nominal government transfers
    data.T = reshape(data_in(:,9),par.years+1,par.countries);
    data.t0.T = data.T(1,:);
    data.T(1,:) = [];
    
    % Nominal gross exports
    data.exp = reshape(data_in(:,19),par.years+1,par.countries) ;
    data.exp(1,:) = []; 
    
    % Nominal net exports
    data.netx = reshape(data_in(:,10),par.years+1,par.countries);    
    data.netx(1,:) = [];
    
    % Nominal current account  
    data.ca = reshape(data_in(:,11),par.years+1,par.countries);
    data.ca(1,:) = [];    
    
    % Nominal NFA
    data.nfa = reshape(data_in(:,12),par.years+1,par.countries);
    data.t0.nfa = data.nfa(1,:);
    data.nfa(1,:) = [];
    
    % Nominal government interest payments
    data.ipayg = reshape(data_in(:,13),par.years+1,par.countries);
    data.t0.ipayg = data.ipayg(1,:);
    data.ipayg(1,:) = [];    
    
    % Nominal households' interest payments
    data.ipayh = reshape(data_in(:,14),par.years+1,par.countries);
    data.ipayh(1,:) = [];
    
    % Nominal tax revenues
    data.taxr = reshape(data_in(:,16),par.years+1,par.countries);
    data.taxr(1,:) = []; 
    
    % Normalizing variable y_hat
    data.yhat = reshape(data_in(:,17),par.years+1,par.countries);
    data.t0.yhat = data.yhat(1,:);
    data.yhat(1,:) = []; 
    
    % Nominal recapitalization costs
    data.recap = reshape(data_in(:,18),par.years+1,par.countries);
    data.recap(1,:) = [];  
    
    % Read in structural shocks
    struct.bhat = reshape(data_in(:,22),par.years+1,par.countries);
    % missing irish data
    struct.bhat(1,8) = struct.bhat(2,8);
    struct.bhath = struct.bhat ./ repmat(par.chi, par.years+1, 1);
    struct.sigma = reshape(data_in(:,23),par.years+1,par.countries); 
    
    % This is not done in previous version of code:
    struct.t0.bhat = struct.bhat(1,:);
    struct.t0.bhath = struct.bhath(1,:);
    struct.bhat(1,:) = [];
    struct.bhath(1,:) = [];
    struct.t0.sigma = struct.sigma(1,:); 
    struct.sigma(1,:) = [];
    
    
    % The bhath series actually used as shock in model
    % Create bh series for counterfactual with macroprudential policy - growth
    % of bh divided by par.macroprudential, starting with 02 as base year
    struct.bhath_used(1:yr(par.base_year),:) = struct.bhath(1:yr(par.base_year),:);
    for ii = yr(par.base_year)+1:par.years
        struct.bhath_used(ii,:) = struct.bhath(yr(par.base_year),:) + (1/par.macroprudential) * (struct.bhath(ii,:) - struct.bhath(yr(par.base_year),:));
    end

    % Create simulated bg data    
    data.sim_bg = sim_bg(data, par);
        
    % Create data in log- and level deviations from par.base_year value
    % Data in log deviations from par.base_year value
    par.varnames_logdev = {'y','n','x','w','p','b','bg','g','T','exp','ipayg','ipayh','taxr','yhat','bh','sim_bg'};
    % Data in level deviations from par.base_year value
    par.varnames_levdev = {'netx','ca','nfa','recap'};
    % All saved into one "data_dev" structure
    
    % log deviations
    for jj = 1:size(par.varnames_logdev,2)
        data_dev.(par.varnames_logdev{jj}) = log( data.(par.varnames_logdev{jj}) ./ repmat(data.(par.varnames_logdev{jj})(yr(par.base_year),:),par.years,1) );
    end
    
    
    % Add spread rho = the log deviation of gross nominal rate in model
    data_dev.rho = data.rho;
    
    % level deviations
    for jj = 1:size(par.varnames_levdev,2)
        data_dev.(par.varnames_levdev{jj}) = data.(par.varnames_levdev{jj}) - repmat(data.(par.varnames_levdev{jj})(yr(par.base_year),:),par.years,1) ;
    end
    
    % And similarly for the exogenous shock processes in "struct"
    par.structnames_logdev = {'bhat','bhath','bhath_used'};
    par.structnames_levdev = {'sigma'};
    
    for jj = 1:size(par.structnames_logdev,2)
        struct_dev.(par.structnames_logdev{jj}) = log( struct.(par.structnames_logdev{jj}) ./ repmat(struct.(par.structnames_logdev{jj})(yr(par.base_year),:),par.years,1) );
    end
    for jj = 1:size(par.structnames_levdev,2)
        struct_dev.(par.structnames_levdev{jj}) = struct.(par.structnames_levdev{jj}) - repmat(struct.(par.structnames_levdev{jj})(yr(par.base_year),:),par.years,1) ;
    end
    
    % Instead of log deviations, take data in percentage deviations
    for jj = 1:size(par.varnames_logdev,2)
        data_dev.(par.varnames_logdev{jj}) = data.(par.varnames_logdev{jj}) ./ repmat(data.(par.varnames_logdev{jj})(yr(par.base_year),:),par.years,1) - 1 ;
    end
    for jj = 1:size(par.structnames_logdev,2)
        struct_dev.(par.structnames_logdev{jj}) = struct.(par.structnames_logdev{jj}) ./ repmat(struct.(par.structnames_logdev{jj})(yr(par.base_year),:),par.years,1) - 1 ;
    end
    
    % Choose which government debt variable to use
    data.bg_used = data.bg; 
    data_dev.bg_used = data_dev.bg;
    
    % Compute steady state expenditure ratios (parameters in model), based on par.base_year (price level normalized to 1)
    par.GoY = data.g(yr(par.base_year),:); % G/Y
    par.ToY = data.T(yr(par.base_year),:); % T/Y
    par.BHoY = data.bh(yr(par.base_year),:); % Bh/Y
    par.BGoY = data.bg_used(yr(par.base_year),:); % Bg/Y
    par.tau = par.GoY + par.ToY + (1-par.beta).*par.BGoY; % tax rate based on model steady state government budget  
       
    
    % Compile/create the time series for the exognous AR(1) processes:
    % [zbh_nom, zr, zg_nom, ztrans_nom, zcf, zrecap]
    shocks.zbh_nom = struct_dev.bhath_used ;
    shocks.zr = struct_dev.sigma; 
    shocks.zcf = data_dev.exp;
    shocks.zrecap = data_dev.recap;
    
    % Create fiscal policy drifts
 
    
    shocks.zg_nom = zeros(par.years,par.countries);
    shocks.ztrans_nom = zeros(par.years,par.countries);
    % Create dummy matrix for growth terms in trends
    
    temp_grmat = [ repmat((1:(2008-par.base_year))',1,par.countries);repmat((7-yr(par.base_year)+1-step:-step:7-yr(par.base_year)+1-4*step)',1,par.countries) ] ;
    
    shocks.zg_nom(yr(par.base_year)+1:end,:) =  temp_grmat.*repmat(par.g_gamma_drift./par.GoY,par.years-yr(par.base_year),1) ; 
    shocks.ztrans_nom(yr(par.base_year)+1:end,:) =  temp_grmat.*repmat(par.T_gamma_drift./par.ToY,par.years-yr(par.base_year),1) ; 
    
    % If start drifts earlier, need to "shift tent up" in 2001-2012
    if par.start_drift_2001 == 1
        shocks.zg_nom = shocks.zg_nom + repmat(par.g_gamma_drift./par.GoY,par.years,1);
        shocks.ztrans_nom = shocks.ztrans_nom + repmat(par.T_gamma_drift./par.ToY,par.years,1);
    end    
    % Append years to the beginning of drift processes
    shocks.zg_nom = [zeros(par.Ny_app,par.countries); shocks.zg_nom];
    shocks.ztrans_nom = [zeros(par.Ny_app,par.countries); shocks.ztrans_nom];
    
    
    % The 'no segmentation counterfactual'
    if par.rho_counterfactual == 1;
        shocks.zr(yr(2008):end,:) = repmat(shocks.zr(yr(2007),:),par.end_year-2007,1);
    end
       

    % Override the par.years for now
    par.years_main = par.years;
    par.years = par.years + par.Ny_app;
    
    % Append years to the other exogenous variables
    shocks.zbh_nom      = [zeros(par.Ny_app,par.countries); shocks.zbh_nom];
    shocks.zr           = [zeros(par.Ny_app,par.countries); shocks.zr];
    shocks.zcf          = [zeros(par.Ny_app,par.countries); shocks.zcf];
    shocks.zrecap       = [zeros(par.Ny_app,par.countries); shocks.zrecap];
    
    % Append years to debt relief (used in simulation)
    data.debt_relief = [zeros(par.Ny_app,par.countries); data.debt_relief];
    
    % Set values of zbh and wage in the initial period (first of all added periods) here
    % par.w_init is applied in initializing simulation below (line 569)
    % Period 1 is 2000, used to initialize the model.
    % Period 2 is 2001, first year of reported simulation
    % EMPLOYMENT depends on zbh_nom(1)
    % If you set zbh_nom(1)>0, then model will interprete 2001 as negative shock
    % so it will start economy in recession in 2001. 
    % OUTPUT is not much affected by zbh(1)
    % if real wage is>0, there will be inflation
    
    shocks.zbh_nom(1,:) = zeros(1,11) ;
   
    par.w_init = zeros(1,11) ; 
                        %  aut;  bel;  deu;  esp;  fin;  fra;  gre;  irl;  ita;  nld;  prt ;
     shocks.zbh_nom(1,:) = [0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.05,  0.0,  0.0,  0.0,  -.1 ] ;
     par.w_init          = [0.0,  0.0,  0.0,  -.1,  0.0,  0.0,  -.05,   -.1,  0.0,  0.0,  0.0 ] ;

  
     
    %% Also, for DYNARE policy function, need to back out the "epsilon"-s in
    % the above AR(1) processes
    shocks.ee_zbh_nom = zeros(par.years,par.countries);
    shocks.ee_zbh_nom(yr(par.base_year+1):end,:) = shocks.zbh_nom(yr(par.base_year+1):end,:) - repmat(par.rho_zbh,par.years-yr(par.base_year),1).*shocks.zbh_nom(yr(par.base_year):end-1,:);
    
    shocks.ee_zr = zeros(par.years,par.countries);
    shocks.ee_zr(yr(par.base_year+1):end,:) = shocks.zr(yr(par.base_year+1):end,:) - repmat(par.rho_zr,par.years-yr(par.base_year),1).*shocks.zr(yr(par.base_year):end-1,:);
    
    shocks.ee_zg_nom = zeros(par.years,par.countries);
    shocks.ee_zg_nom(yr(par.base_year+1):end,:) = shocks.zg_nom(yr(par.base_year+1):end,:) - repmat(par.rho_zg,par.years-yr(par.base_year),1).*shocks.zg_nom(yr(par.base_year):end-1,:);
    
    shocks.ee_ztrans_nom = zeros(par.years,par.countries);
    shocks.ee_ztrans_nom(yr(par.base_year+1):end,:) = shocks.ztrans_nom(yr(par.base_year+1):end,:) - repmat(par.rho_ztrans,par.years-yr(par.base_year),1).*shocks.ztrans_nom(yr(par.base_year):end-1,:);
    
    shocks.ee_zcf = zeros(par.years,par.countries);
    shocks.ee_zcf(yr(par.base_year+1):end,:) = shocks.zcf(yr(par.base_year+1):end,:) - repmat(par.rho_zcf,par.years-yr(par.base_year),1).*shocks.zcf(yr(par.base_year):end-1,:);
    
    shocks.ee_zrecap = zeros(par.years,par.countries);
    shocks.ee_zrecap(yr(par.base_year+1):end,:) = shocks.zrecap(yr(par.base_year+1):end,:) - repmat(par.rho_zrecap,par.years-yr(par.base_year),1).*shocks.zrecap(yr(par.base_year):end-1,:);
    
    shocks.ee_zprod = zeros(par.years,par.countries);
    % Wrong lengths after appending years in front:
    shocks.ee_zprod(:,4) = ESPPROD ;
    shocks.ee_zprod(:,7) = GREPROD ;
    shocks.ee_zprod(:,8) = IRLPROD ;
    shocks.ee_zprod(:,11) = PRTPROD ;
   
    
    % First, run DYNARE once with arbitrary parameters to generate model
    % solution.
    dynare ESP_MP17_rep noclearall;
    
    %
    % Indices of all state variables in declaration order
    stvar_or = [10,13,14,15,16,17,18,19,20,21,22,23];
    
    % Simulate the model for each country
    sim.title = 'sim';
    sim.fig1 = 'dgandt';
    par.paramnames = {'beta', 'open', 'gamma', 'eta',...
        'labc', 'crra', 'calvop', 'elasp', 'calvow', 'elasw',...
        'chi', 'pimc', 'wimrs', 'rho_zbh', 'rho_zr', 'rho_zg',...
        'rho_ztrans', 'rho_zcf', 'BHoY', 'GoY', 'ToY', 'BGoY', 'tau', 'lambda_bhrho',...
        'gamma_gn', 'gamma_grho', 'lambda_rho0', 'lambda_rhobg', 'lambda_rhobh', 'coef_rhonfa', 'coef_gbg',...
        'rho_zrecap', 'lambda_rhorec'};    
    %
    for jj = 1:par.countries
        % Set country parameter values to be loaded by dynare        
         for pp = 1:size(par.paramnames,2)
             set_param_value(par.paramnames{pp},par.(par.paramnames{pp})(1,jj))
         end  
        
        % Call dynare and store the policy function for country jj:
        stoch_simul(var_list_);
        
        par.varnames_dyn = cellstr(M_.endo_names);
        
        pol_temp.stvar_or = stvar_or;
        pol_temp.ys = oo_.dr.ys;
        
        pol_temp.ghx = oo_.dr.ghx(oo_.dr.inv_order_var,:);
        pol_temp.ghu = oo_.dr.ghu(oo_.dr.inv_order_var,:);
        
        pol_temp.ghs = oo_.dr.ghs2(oo_.dr.inv_order_var,:);
        pol_temp.ghxx = oo_.dr.ghxx(oo_.dr.inv_order_var,:);
        pol_temp.ghuu = oo_.dr.ghuu(oo_.dr.inv_order_var,:);
        pol_temp.ghxu = oo_.dr.ghxu(oo_.dr.inv_order_var,:);
        
        % Time runs left to right in sim_data_jj temporarily
        sim_data_jj = zeros(size(pol_temp.ghx,1),par.years );

        % Set the wage (13th endogenous variable in Dynare) in initial
        % period by hand - specified above
        sim_data_jj(13,1) = par.w_init(1,jj);
        
        % Note that simulation assumes that the first year is steady state
        % and simulation starts from the SECOND YEAR - no matter how many
        % years appended in front
        for tt = 2:par.years
            % Adjust recaps for macroprudential
            if par.mp_counterfactual == 1 & (tt - par.Ny_app > 7)
                shocks.zrecap(tt,jj) = max(data.recap(tt-par.Ny_app,jj)*(1-0.25*((-par.chi(1,jj)*par.BHoY(1,jj)*(1+sim_data_jj(10,par.Ny_app + yr(2007))+sim_data_jj(14,par.Ny_app + yr(2007)))+data.b(yr(2007),jj))/(sum(data.recap(:,jj))))),0);
                shocks.ee_zrecap(tt,jj) = shocks.zrecap(tt,jj) - par.rho_zrecap(1,jj)*shocks.zrecap(tt-1,jj);
            end            
            
            eps_temp = [shocks.ee_zbh_nom(tt,jj);...
                shocks.ee_zr(tt,jj);...
                shocks.ee_zg_nom(tt,jj);...
                shocks.ee_ztrans_nom(tt,jj);...
                shocks.ee_zcf(tt,jj);...
                shocks.ee_zrecap(tt,jj);...
                shocks.ee_zprod(tt,jj)];
            state_temp_jj = sim_data_jj(:,tt-1);
            % Add debt relief to bg
            state_temp_jj(15,1) = state_temp_jj(15,1) + data.debt_relief(tt,jj)/par.BGoY(1,jj);
            % Add debt relief to nfa
            state_temp_jj(16,1) = state_temp_jj(16,1) - par.nfa_relief_frac(1,jj)*data.debt_relief(tt,jj);
            % Simulate time t variables
            sim_data_jj(:,tt) = polf2ormap(pol_temp,state_temp_jj,eps_temp);
            
        end
        
        
        % Save relevant data into "sim" structure
        sim.y(:,jj) = sim_data_jj(1,:)';
        sim.n(:,jj) = sim_data_jj(3,:)';
        sim.c(:,jj) = sim_data_jj(2,:)';
        sim.ph(:,jj) = -sim_data_jj(14,:)';
        sim.p(:,jj) = (1-par.open(1,jj))*sim.ph(:,jj) ;
        sim.cs(:,jj) = sim_data_jj(5,:)';
        sim.cs_nom(:,jj) = sim.cs(:,jj) + sim.p(:,jj);
        sim.pih(:,jj) = sim_data_jj(7,:)';
        sim.bh_nom(:,jj) = sim_data_jj(10,:)'+sim.ph(:,jj);
        %sim.bh(:,jj) = sim.bh_nom(:,jj)-sim.ph(:,jj);
        sim.bh(:,jj) = sim_data_jj(10,:)';
        sim.g(:,jj) = sim_data_jj(11,:)';
        sim.g_nom(:,jj) = sim.g(:,jj) + sim.ph(:,jj);
        sim.trans(:,jj) = sim_data_jj(12,:)';
        sim.trans_nom(:,jj) = sim.trans(:,jj) + sim.ph(:,jj);
        sim.rho(:,jj) = sim_data_jj(4,:)';        
        sim.zr(:,jj) = sim_data_jj(18,:)';
        sim.w(:,jj) = sim_data_jj(13,:)';
        sim.cf(:,jj) = sim_data_jj(21,:)'; % Nominal foreign demand
        sim.netx(:,jj) = exp(sim.cf(:,jj))*(1-par.GoY(1,jj))*par.open(1,jj) - exp(sim.c(:,jj)+par.eta(1,jj)*sim.p(:,jj))*(1-par.GoY(1,jj))*par.open(1,jj) ; % Net exports in levels
        sim.bg_nom(:,jj) = sim_data_jj(15,:)';
        sim.nfa(:,jj) = sim_data_jj(16,:)';
        sim.rho_calc(:,jj) = shocks.zr(:,jj).*(repmat(par.lambda_rho0(1,jj),par.years,1) + repmat(par.lambda_rhobg(1,jj),par.years,1).*repmat(par.BGoY(1,jj),par.years,1).*(1+sim.bg_nom(:,jj)) + repmat(par.lambda_rhobh(1,jj),par.years,1).*repmat(par.chi(1,jj),par.years,1).*repmat(par.BHoY(1,jj),par.years,1).*(1+sim.bh(:,jj) + sim.ph(:,jj) ) + repmat(par.lambda_rhorec(1,jj),par.years,1).*shocks.zrecap(:,jj) ) + repmat(par.coef_rhonfa(1,jj),par.years,1).*sim.nfa(:,jj) ;
    end
    
     sim.rates = repmat(par.ir, par.years,1) + sim.rho;
     sim.y_nom = sim.y + sim.ph;
     sim.w_nom = sim.w + sim.p;  
     
	clear beta open gamma eta...
        labc crra calvop elasp calvow elasw...
        chi pimc wimrs rho_zbh rho_zr rho_zg...
        rho_ztrans rho_zcf BHoY GoY ToY BGoY tau lambda_bhrho...
        gamma_gn gamma_grho lambda_rho0 lambda_rhobg...
        lambda_rhobh coef_rhonfa coef_gbg...
        rho_zrecap lambda_rhorec;       
    
    %% Remove par.Ny_app years from all of the simulated data
    
    % Switch back to par.years_main
    par.years = par.years_main;
    % And make simulated data correct length again
    sim_varnames = fields(sim);
    sim_varnames = sim_varnames(3:end);
    for ii = 1:size(sim_varnames,1)
        dat_temp = sim.(sim_varnames{ii});
        sim.(sim_varnames{ii}) = dat_temp(par.Ny_app+1:end,:);
    end
    
    % And normalize base year values to zero
    for ii = 1:size(sim_varnames,1)
        base_year_val_temp = sim.(sim_varnames{ii});
        base_year_val_temp = base_year_val_temp(yr(par.base_year),:);
        sim.(sim_varnames{ii}) = sim.(sim_varnames{ii}) - repmat(base_year_val_temp,par.years,1);
    end    
    
    %% Plot PIGS graphs
    % figures(data,data_dev,sim,par,'pigs');
    

  	
	%%  assign to base so these are preserved at end of program
    assignin('base','struct',struct);
    assignin('base','struct_dev',struct_dev);
    assignin('base','data',data);
    assignin('base','data_dev',data_dev);
    assignin('base','data_in',data_in);
    assignin('base','par',par);     
    assignin('base',sim.title,sim);     
    

    %% Call plotting function
    if nargin > 0 
        if strcmp(varargin{1},'plot')
            figures(data,data_dev,sim,par,'all'); 
        elseif strcmp(varargin{1},'pigs')
            figures(data,data_dev,sim,par,'pigs'); 
        elseif strcmp(varargin{1},'both')
            figures(data,data_dev,sim,par,'all');
            figures(data,data_dev,sim,par,'pigs');
        end
    else
        figures(data,data_dev,sim,par,'all');   
        figures(data,data_dev,sim,par,'pigs');   
    end
    
    %% Return
    varargout{1} = sim;
    varargout{2} = par;
    varargout{3} = data;
    varargout{4} = data_dev;
        
end


%%

    
