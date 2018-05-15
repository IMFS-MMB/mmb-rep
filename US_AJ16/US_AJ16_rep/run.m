%% This File runs the baseline simulation for
%% Andrea Ajello "Financial Intermediation, Investment Dynamics, and
%% Business Cycle Fluctuations", AER 2016
%% and plots adjusted impulse response functions for permanent and transitory shocks. 
%% It also allows to plot IRFs for the technology shock taking the rescaling into
%% account necessary to make the model stationary. 
%% Maximilian Mayer - 11.03.2018 (adapted from author's code)
%---------------------------------------------------------------------------%
%---------------------------------------------------------------------------%
%---------------------- Read and prepare data ------------------------------%
%---------------------------------------------------------------------------%
clear all;
dynare baseline
results = load('baseline_results.mat'); 
results = results.oo_ ;
% Get the impulse responses (IRF) at the median, 5th and 95th percentiles. 
IRF = results.irfs;
%---------------------------------------------------------------------------%
%----------------------------------- SCALING -------------------------------%
%---------------------------------------------------------------------------%
% Scale variables appropriately (make inflation and interest rates, (pi and i)
% annual (these are already scaled up by 100 in the .mod file), and scale
% the other observables up by 100 as well. 
IRFnames = fieldnames(IRF);
toScale = {'pi_ob_t', 'i_ob_t' 'GDP_t', 'Ihat', 'chat', 'what_t'};
scale   = [       4 ,       4,     100,    100,    100,       100];
for var = 1:length(toScale)
    for i = 1:numel(IRFnames)
        if ~isempty(strfind(IRFnames{i}, toScale{var})) & strfind(IRFnames{i}, toScale{var}) == 1
            IRF.(IRFnames{i}) =  IRF.(IRFnames{i}) * scale(var); 
        end
    end
end
%%
%--------------------------------------------------------------------------%
%------------------- Account for TFP trend in TFP Shock -------------------%
%--------------------------------------------------------------------------%
periods = 30; 
A = NaN(periods+1,1);
z = IRF.z_t_eps_z;
A(1) = 1;
    
for t = 2:periods+1
    A(t) = A(t-1) * exp(z(t-1));
end
A = A(2:end);
    
vars    = {'GDP_t', 'Ihat', 'chat', 'what_t'};
    
for v = 1:length(vars)
    eval(['xhat = IRF.' vars{v} '_eps_z;']);
	x = 100*(exp(xhat/100).* A' -1); 
	eval(['IRF.' vars{v}    '_eps_z = x;']);            
end 

%%
%--------------------------------------------------------------------------------------%
%--- Find the minimum and maximum response of FGS and Share IRFs, for setting axes ----%
%--------------------------------------------------------------------------------------%
% Shocks to plot
shocks   = {'eps_tau', 'eps_z', 'eps_g', 'eps_i', 'eps_beta', 'eps_p', 'eps_w', ...
            'eps_tau_trans'}; 
% Variables for which we will set the y-axis limits
toscale  = {'Spread_ob_t','FGS_obs'}; 

% Store the axis limits here
ymin = Inf(size(toscale));
ymax = -Inf(size(toscale));

% Find the minimum and maximum responses. 
for v = 1:length(toscale)
    for s = 1:length(shocks)
        shock = [toscale{v} '_' shocks{s}]; 
        ymin(v) = min(ymin(v), min(IRF.(shock)));
        ymax(v) = max(ymax(v), max(IRF.(shock)));
    end
    % Add a padding around the IRF 
    ymin(v) = ymin(v) - .05*abs(ymin(v)); 
    ymax(v) = ymax(v) + .05*abs(ymax(v));     
end

%%
%--------------------------------------------------------------------------------------%
%----------------------------------- PLOTTING -----------------------------------------%
%--------------------------------------------------------------------------------------%
% Shocks to plot
%shocks = {'eps_tau', 'eps_z', 'eps_g', 'eps_i', 'eps_beta', 'eps_p', 'eps_w', ...
%            'eps_tau_trans'}; 
shocks = {'eps_tau', 'eps_tau_trans'}
% Variables to plot 
vars   = {'GDP_t', 'Ihat', 'chat', 'what_t', 'pi_ob_t', 'i_ob_t',  'l_ob_t', ...
        'Spread_ob_t', 'FGS_obs'};

% Titles for each subplot
varnames = {'GDP', 'Investment', 'Consumption', 'Wages', 'Inflation', 'FFR', ...
            'Log Hours', 'Spread', 'Financial Gap Share'};    
% Output file names
outfile = {'figure4','figure5'}; 

% Loop for plotting. 
for sh = 1:length(shocks)
    f = figure;
    plotno = 1;
    for v = 1:length(vars)
        subplot(3,3,plotno);
        %Get the variables to plot
        eval(['varmed = IRF.' vars{v} '_' shocks{sh} ';']); 
        %X-axis (Points are on t+.5, rather than t, so that there is symmetric padding 
        %        on each side of the plots)
        %Plot the shaded areas
        %Draw gray lines to border the gray areas, blue lines to do the same, red line for 
        % zero and black line for median
        x = .5:length(varmed);
        %Plot the shaded areas
        plot(x, varmed, 'k-', 'LineWidth', 2.5);
        hold on
        plot(x, 0*varmed, 'r-', 'LineWidth', 1.5);        
        %Bring the axes forward
        box on ; set(gca, 'Layer', 'top');
        %Set the title
        title(varnames{v}, 'FontSize',12);
        %Make sure the 0 line is visible by adding a padding around it to the axis
        if ismember(vars{v}, toscale)
            idx = find(ismember(cellstr(toscale),vars{v}));
            ylim([ymin(idx) ymax(idx)]);
        end
        yrange = get(gca, 'YLim'); 
        tick = abs(yrange(1) - yrange(2));         
        if min(yrange) == 0; ylim([-tick/10, max(yrange)]); 
        elseif max(yrange) == 0; ylim([min(yrange), tick/10]); end        
        % Set the x-axis limits
        xlim([0 periods])
        hold off;
        plotno = plotno + 1;
    end
        % Save the pdf file
      set(gcf, 'PaperSize', [8 6], 'PaperPositionMode', 'manual', ...
               'PaperPosition',[0 0 8 6]);
      print(f, outfile{sh}, '-dpdf'); 

end

