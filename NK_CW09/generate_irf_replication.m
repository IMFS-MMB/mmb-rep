%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%generate_irf_replication.m
%          Calls dynare files and jointly plots impulse responses from
%          different models
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%addpath C:\dynare\4.3.3\matlab

dynare NK_CW09_FF
dynare NK_CW09_NoFF
dynare NK_CW09_RepHH

clear
zero = zeros(1,17);
x_axis = [0:16];

files = {'NK_CW09_FF_results','NK_CW09_NoFF_results','NK_CW09_RepHH_results'};
varnames = {'Output','Inflation','Deposit Rate','Spread','Debt'};



for i = 1:numel(files)

    load(files{i},'-mat');

irfs(1,:,i,1) = oo_.irfs.Y_hat_e_epsilon_m;
irfs(2,:,i,1) = oo_.irfs.Pi_hat_a_e_epsilon_m;
irfs(3,:,i,1) = oo_.irfs.i_d_hat_a_e_epsilon_m;
irfs(4,:,i,1) = oo_.irfs.omega_hat_a_e_epsilon_m;
irfs(5,:,i,1) = oo_.irfs.b_hat_e_epsilon_m;

irfs(1,:,i,2) = oo_.irfs.Y_hat_e_G;
irfs(2,:,i,2) = oo_.irfs.Pi_hat_a_e_G;
irfs(3,:,i,2) = oo_.irfs.i_d_hat_a_e_G;
irfs(4,:,i,2) = oo_.irfs.omega_hat_a_e_G;
irfs(5,:,i,2) = oo_.irfs.b_hat_e_G;

end


for l = 1:2
    figure(l);
    set(gcf,'PaperPositionMode','auto');
    set(gcf, 'Position', [0 0 851 585]);
    opengl software;

    for j = 1:length(varnames)
        subplot(3,2,j);
        plot(x_axis,zero,'k:','linewidth',1); hold on;
        sh1=plot(x_axis,irfs(j,:,1,l),'b','linewidth',1,'LineSmoothing','on'); hold on;
        sh2=plot(x_axis,irfs(j,:,2,l),'r--','linewidth',1,'LineSmoothing','on'); hold on;
        sh3=plot(x_axis,irfs(j,:,3,l),'k+--','linewidth',1,'LineSmoothing','on'); hold on;
    
        if j == 1
            legend([sh1,sh2,sh3],{'FF','NoFF','RepHH'}); 
        end
  
        xlim([0-0.001,16+0.001]);
        set(gca,'XTick',0:4:16);
        lowerbound = min([irfs(j,:,1,l),irfs(j,:,2,l),irfs(j,:,3,l),0]);
        upperbound = max([irfs(j,:,1,l),irfs(j,:,2,l),irfs(j,:,3,l),0]);
        range = abs(upperbound - lowerbound);
        
        if l == 1   %adds some space above largest (below smallest) value and avoids LineSmoothing (missing box lines) bug
            addspace = 0.077; 
            ylim([lowerbound-range*addspace, upperbound+range*addspace]);
        elseif l == 2
            addspace = 0.075;
            ylim([lowerbound-range*addspace, upperbound+range*addspace]);
        end
        
        title(varnames(j));
    end
end


