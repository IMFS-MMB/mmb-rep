function  Prog_Sim_Counterfactual( varargin )
% This function runs the requested counterfactual exercise.
% The arguments given to the function are:
% 1. 'PL'   - if =='plot', plots graphs for all countries
%           - if =='pigs' or any other string, plots graphs for PIGS only
% 2. 'S'    - if == 'save', save figures to drive
% 3. 'N'    - a string that will be the prefix of the filenames of the
%               counterfactual plots saved
% 4. 'CF'   - a string indicating which counterfactual is being run. Must
%           be one of the following:
%               i. 'fiscal counterfactual'
%               ii. 'macroprudential counterfactual'
%               iii. 'no segmentation counterfactual'
%               iv. 'fiscal+mp counterfactual'
    
    evalin('base','clear' ); 
    evalin('base', 'clc') ; 
    evalin('base','close all');

    if nargin > 1		
    % If the counterfactual code is called from an external program, the values 
    % are set in this block
		plot_figs = varargin{1};
		save_figs = strcmp(varargin{2},'save');
        fig_label = varargin{3};
        cf_name = varargin{4};
    else
    % By default, PIGS figures are produced and saved, and the fiscal
    % counterfactual is run
		save_figs = 1;
		plot_figs = 'pigs';
        fig_label = 'cf_fiscal';
        cf_name = 'fiscal counterfactual';
    end   
    
    % Run the structural model for the given counterfactual
    [cf,par,~] = Prog_Sim_Structural_NKM('no plot',cf_name);
    % Run the benchmark model and save the input data "data" and "data_dev"
    [structural,~,data,data_dev] = Prog_Sim_Structural_NKM('no plot','benchmark');
    
    %clearvars -except cf par structural data data_dev save_figs...
    %    plot_figs fig_label cf_name;
    
    % List of vars to plot - must have data counterpart. If adding variables to plot, make sure you add a corresponding label also and 
	% that the variable has exactly the same name in the data, cf and structural data structures
	par.plot_vars = {'bg','bh','n','y','g','rho','p'};
    par.labels = {'govt debt','household debt','employment','GDP','government spending','spread','prices'};        
    par.fig_label = fig_label;
	par.save_figs = save_figs;  
    
    % Because the labeling in the model simulation does not perfectly line
    % up with the nominal data labeling, need to adjust:
    cf.bg = cf.bg_nom;
    cf.bh_real = cf.bh;
    cf.bh = cf.bh_nom;
    cf.y_real = cf.y;
    cf.y = cf.y_nom;
    cf.g_real = cf.g;
    cf.g = cf.g_nom;
    cf.p = cf.ph;
    structural.bg = structural.bg_nom;
    structural.bh_real = structural.bh;
    structural.bh = structural.bh_nom;
    structural.y_real = structural.y;
    structural.y = structural.y_nom;
    structural.g_real = structural.g;
    structural.g = structural.g_nom;
    structural.p = structural.ph;
    
    % And we also need to translate the model output data back into levels
        cf_lev.bg  = repmat(par.BGoY,par.years,1).*(1+cf.bg);
        cf_lev.bh  = repmat(par.BHoY,par.years,1).*(1+cf.bh);
        cf_lev.n   = 1 + cf.n;
        cf_lev.y   = 1 + cf.y;
        cf_lev.g   = repmat(par.GoY,par.years,1).*(1+cf.g);
        cf_lev.rho = cf.rho;
        cf_lev.p   = 1 + cf.p;
        structural_lev.bg  = repmat(par.BGoY,par.years,1).*(1+structural.bg);
        structural_lev.bh  = repmat(par.BHoY,par.years,1).*(1+structural.bh);
        structural_lev.n   = 1 + structural.n;
        structural_lev.y   = 1 + structural.y;
        structural_lev.g   = repmat(par.GoY,par.years,1).*(1+structural.g);
        structural_lev.rho = structural.rho;
        structural_lev.p   = 1 + structural.p;
        
    % 
    
    % Generate data for plots
    top = length(par.plot_vars);
    for i = 1:top
        varr = par.plot_vars{i};
        eval(['data_plus.' varr '=' 'data.' varr  '+' 'cf_lev.' varr '-' 'structural_lev.' varr]);
    end
    
    data_plus.label = cf_name;
    data.label = 'data';      
    par.path = 'Figs_CounterFact/';
    data_plot = {[data.bg,data_plus.bg],[data.bh,data_plus.bh],[data.n,data_plus.n],[data.y,data_plus.y],[data.g,data_plus.g],[data.rho,data_plus.rho],[data.p,data_plus.p]};
    
    if strcmp(varargin{1},'plot');
        figures_cf(data,data_plus,data_plot,par,'plot');
    else
        figures_cf(data,data_plus,data_plot,par,'pigs');
    end
    

end

