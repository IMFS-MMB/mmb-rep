%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%generate_irf_spreadsheet.m
%           extracts irf's from dynare and generates Excel Spreadsheet 
%           with the data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dynare NK_CW09_FF
dynare NK_CW09_NoFF
dynare NK_CW09_RepHH

clear

files = {'NK_CW09_FF_results','NK_CW09_NoFF_results','NK_CW09_RepHH_results'};
var = {'Output','Inflation','Deposit Rate','Spread','Debt'};
shocks = {'MP','A','G','C_s','b_g','mu_w','C_b','chi_tilde'};


for l = 1:numel(files)
    load(files{l},'-mat');
    for i = 1:numel(shocks)
       for j= 1:numel(var)
           var_shocks((i-1)*numel(var) + j) = strcat(var(j),'_',shocks(i));
       end
    end
        fields = fieldnames(oo_.irfs);

    for i = 1:numel(fields)
        irf(i,:)=oo_.irfs.(fields{i});
    end

xlswrite('NK_CW09',var_shocks,strcat('Tabelle',num2str(l)));
xlswrite('NK_CW09',irf',strcat('Tabelle',num2str(l)),'A2');

end
