function [ output_args ] = goodness_fit_table( input_args )
%GOODNESS_FIT_TABLE 

% Writes file "fit_table_struct_demean.csv" for goodness of model fit R^2
% measures, all countries and all variables in "fields" below
% Also writes file "fit_table_struct_demean_tex.txt" with content in .tex
% format for PIGS and exactly the variables in Table 5

    %% Structural fit (computed in demeaned levels)
    [structural,par,data,data_dev] = Prog_Sim_Structural_NKM('no plot','benchmark');   
    fields = {'y','n','w','bh','bg','rho','g','trans','netx','cf'};
    N = numel(fields);
    
    % As in the counterfactual code, because the labeling in 
    % the model simulation does not perfectly line up with the 
    % nominal data labeling, need to adjust:
    structural.bg = structural.bg_nom;
    structural.bh_real = structural.bh;
    structural.bh = structural.bh_nom;
    structural.y_real = structural.y;
    structural.y = structural.y_nom;
    structural.g_real = structural.g;
    structural.g = structural.g_nom;
    structural.trans_real = structural.trans;
    structural.trans = structural.trans_nom;
    structural.w = structural.w;
    
    % And also adjust for the name of transfers and foreign demand in the data
    data.trans = data.T;
    data.cf = data.exp;
    
    % And we also need to translate the model output data back into levels
        structural_lev.bg  = repmat(par.BGoY,par.years,1).*(1+structural.bg);
        structural_lev.bh  = repmat(par.BHoY,par.years,1).*(1+structural.bh);
        structural_lev.n   = 1 + structural.n;
        structural_lev.y   = 1 + structural.y;
        structural_lev.g   = repmat(par.GoY,par.years,1).*(1+structural.g);
        structural_lev.trans   = repmat(par.ToY,par.years,1).*(1+structural.trans);
        structural_lev.rho = structural.rho;
        structural_lev.w   = 1 + structural.w;
        structural_lev.netx   = structural.netx;
        structural_lev.cf   = repmat(data.cf(1,:),par.years,1).*(1+structural.cf);
     
    
    %% Structural fit demeaned
    
    tss_data = zeros(N,par.countries);
    tss_model = zeros(N,par.countries);
    rss = zeros(N,par.countries);
    R2  = zeros(N,par.countries);
    
    for i = 1:N       
        tss_data(i,:) = sum((data.(fields{i})-repmat(mean(data.(fields{i})),par.years,1)).^2);
        tss_model(i,:) = sum((structural_lev.(fields{i})-repmat(mean(structural_lev.(fields{i})),par.years,1)).^2);
        rss(i,:) = sum((data.(fields{i})-repmat(mean(data.(fields{i})),par.years,1)-structural_lev.(fields{i})+repmat(mean(structural_lev.(fields{i})),par.years,1)).^2);
        R2(i,:) = 1-2*rss(i,:)./(tss_data(i,:)+tss_model(i,:));
    end      
    
    % Write CSV for all countries and all variables in "fields"
    fileID=fopen('fit_table_struct_demean.csv','w');    
    wstr = '';
    for i = 1:par.countries
       wstr = [wstr ',' par.names{i}];        
    end
    wstr = [wstr '\r\n'];       
    fprintf(fileID, wstr); 

    for i = 1:N       
        wstr = fields{i};
        for j = 1:par.countries
            wstr = [wstr ',' num2str(R2(i,j))];
        end
        wstr = [wstr '\r\n']; 
        fprintf(fileID,wstr);    
    end

    fclose(fileID);
    
    % Write .txt for .tex code and only PIGS and variables in first draft
    % Table 5
    
    pigs_ind = [4,7,8,11];
    vars_ind = [1,2,3,5,6,9];
    
    fileID=fopen('fit_table_struct_demean_tex.txt','w');    
    wstr = '';
    for i = pigs_ind
       wstr = [wstr ' & ' par.names{i}];        
    end
    wstr = [wstr '\r\n'];       
    fprintf(fileID, wstr); 
    
    for i = vars_ind     
        wstr = fields{i};
        for j = pigs_ind
            wstr = [wstr ' & ' num2str(R2(i,j))];
        end
        wstr = [wstr '\\' '\\' '\r\n']; 
        fprintf(fileID,wstr);    
    end

    fclose(fileID);    
    

end

