function bg_sim = sim_bg(data,par)
    
    bg_sim = zeros(par.years, par.countries);
    %bg_sim(1,:) = data.t0.bg;
    bg_sim(1,:) = data.t0.bg;% .* data.t0.yhat ./ data.yhat(1,:);
    
    taxr = data.taxr;
    ipayg = data.ipayg;
    g = data.g;
    T = data.T;
    
%     if par.g_shock == 0
%         g = repmat(data.g(2,:), par.years, 1);        
%     else
%         g = data.g;
%     end
%     
%     if par.T_shock == 0
%         T = repmat(data.T(2,:), par.years, 1);   
%     else
%         T = data.T;
%     end
%     
%     if (par.T_shock == 0) && (par.g_shock == 0)
% 
%     if par.rates_shock == 0
%         rates = par.ir * ones(par.years, par.countries);
%      else
%         rates = par.ir + data.rho/par.dampen ;
%     end        
%         
%         ipayg = rates(1,:) .* bg_sim(1,:);
%         ipayg = repmat(ipayg, par.years, 1);  
%         taxr = g + T + ipayg;
%         
%     end    
%     
           
    for i = 2:par.years       
        % bg_sim(i,:) = bg_sim(i-1,:) + g(i-1,:) + T(i-1,:) + ipayg(i,:) - taxr(i-1,:); 
        bg_sim(i,:) = data.yhat(i-1,:)./data.yhat(i,:).*(bg_sim(i-1,:) + g(i-1,:) + T(i-1,:) + ipayg(i,:) - taxr(i-1,:)) + data.debt_relief(i,:); 
    end

    
end
