function employment_change_table(varargin)
% This program produces a table that records employment changes in data,
% the structural model, and each of the counterfactuals for
% 2008-2012

%
% If function argument is 'pigs', generate "table_pigs.txt" only for PIGS.
% For any other function argument, or no argument, generate table for all.
%

    
    % By default, generate table for all countries
	c_set = 1:11;
	table_label = 'table.txt';

    if nargin == 1 & strcmp(varargin{1},'pigs');
        c_set = [4,7,8,11];
        table_label = 'table_pigs.txt';
    end

    [structural,~,data,data_dev] = Prog_Sim_Structural_NKM('no plot','benchmark');
    
    % Compare against 2012 employment in structural
    persistent data_chg;
    data_chg = data.n(end,c_set)-data.n(8,c_set) ;
    persistent struct_chg;
    struct_chg = structural.n(end,c_set)-structural.n(8,c_set) ;
    persistent cf_chg;
    
    dlmwrite( table_label, data_chg ) ;
    dlmwrite( table_label, struct_chg ,'-append') ;
    
    % Fiscal counterfactual
    [cf,~,~,~] = Prog_Sim_Structural_NKM('no plot','fiscal counterfactual');
    cf_chg = (cf.n(end,c_set)-cf.n(8,c_set))./struct_chg.*data_chg ;
    dlmwrite( table_label, cf_chg ,'-append') ;
    
    % Macroprudential counterfactual
    [cf,~,~,~] = Prog_Sim_Structural_NKM('no plot','macroprudential counterfactual');
    cf_chg = (cf.n(end,c_set)-cf.n(8,c_set))./struct_chg.*data_chg ;
    dlmwrite( table_label, cf_chg ,'-append') ;
    
    % Fiscal+macroprudential counterfactual
    [cf,~,~,~] = Prog_Sim_Structural_NKM('no plot','fiscal+mp counterfactual');
    cf_chg = (cf.n(end,c_set)-cf.n(8,c_set))./struct_chg.*data_chg ;
    dlmwrite( table_label, cf_chg ,'-append') ;
    
    % No financial segmentation after 2008 counterfactual
    [cf,~,~,~] = Prog_Sim_Structural_NKM('no plot','no segmentation counterfactual');
    cf_chg = (cf.n(end,c_set)-cf.n(8,c_set))./struct_chg.*data_chg ;
    dlmwrite( table_label, cf_chg ,'-append') ;    
    
end

