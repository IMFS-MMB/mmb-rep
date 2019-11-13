function figures(in1,in2,bigdata,P,plot_option)

    top = get(0,'screensize');
    top = top(4);   
    menu_height = 80;
    next_top = top - menu_height;       

    labels = P.labels;

    counter = max(size(bigdata));

     ylims = zeros(counter,2);
     for jj = 1:counter
         ylims(jj,1) = max(max(max(bigdata{jj}))) + 0.01;
         ylims(jj,2) = min(min(min(bigdata{jj}))) - 0.01;
     end
    
     if strcmp(plot_option,'pigs')
         plot_grid = [4,7,8,11];
         plot_dim = [2;2];
         all_figs = 0;         
     elseif strcmp(plot_option,'Greece')
         plot_grid = 7;
         plot_dim = [1;1];         
         all_figs = 0;         
     else
         plot_grid = 1:P.countries;
         plot_dim = [4;3];
         all_figs = 1;
     end

    for jj = 1:counter
        curr_data = bigdata{jj};
        figure('name',strcat(labels{jj},' (',in1.label,')'))
        loc = get(gcf,'Position');
        loc(2) = next_top - loc(4);
        next_top = next_top - menu_height/3;
        set(gcf,'Position',loc);        
        counter=0;
        for ii = plot_grid
            counter=counter+1;
            hold on
            subplot(plot_dim(1),plot_dim(2),counter);        
            plot(P.start_year:1:P.end_year,curr_data(:,ii),'-',P.start_year:1:P.end_year,curr_data(:,ii + P.countries),'--','LineWidth',1.5);
            xlim([P.start_year P.end_year])
            if P.same_scale == 1
                ylim([ylims(jj,2) ylims(jj,1)])                    
            else
                ylim('auto')
                if jj==3
                     ylim([0.89 1.11])
                end
                if jj==4
                     ylim([0.75 1.25])
                end                    
            end    
            set(gca,'XTick',P.start_year:1:P.end_year)          
            if P.end_year > 2012
                set(gca,'XTickLabel',{'2001','','','2004','','','','2008','','','','2012','','','','2016','','','','2020'})                
            else
                set(gca,'XTickLabel',{'2001','','','2004','','','','2008','','','','2012'})                
            end
            title(P.names{ii})
            %title(P.names{ii},'FontSize',13); 
            % Adjust figure positions and sizes for PIGS
            if all_figs == 0
                pos = get(gca, 'Position');
                if ii == plot_grid(1)
                    pos(1) = 0.065;
                    pos(2) = 0.58;
                end
                if ii == plot_grid(2)
                    %pos(1) = 0.06;
                    pos(2) = 0.58;
                end                
                if ii == plot_grid(3)
                    pos(1) = 0.065;
                    pos(2) = 0.08;
                end   
                if ii == plot_grid(4)
                    %pos(1) = 0.06;
                    pos(2) = 0.08;
                end                   
                pos(3) = 0.395;
                pos(4) = 0.38;                
                %pos(3) = 0.9;
                set(gca, 'Position', pos)
                title(P.names{ii});                    
                hold off
            end                      
            xlabel('year')
            hold off
        end  
        h=legend(in1.label,in2.label); 
        if all_figs == 1
            set(h, 'Position',[0.7,0.1,0.15,0.15]);
        end        
        legend boxoff
        set(h,'Location','Best')
        %set(h,'Location','Best','FontSize',11);
        set(gcf, 'PaperPosition', [0 0 8 8*5.3/6])
        set(gcf, 'PaperSize', [8 8*5.3/6])
        % Font size
        set(findall(gcf,'type','axes'),'fontsize',13)
        set(findall(gcf,'type','text'),'fontSize',14) 
        
        if P.save_figs == 1
            if P.end_year > 2012
                print('-depsc','-tiff',strcat(P.path,P.fig_label,'_',P.plot_vars{jj},'_',plot_option,'_',num2str(P.end_year)));
            else
                print('-depsc','-tiff',strcat(P.path,P.fig_label,'_',P.plot_vars{jj},'_',plot_option));
                %print('-dpng',strcat(P.path,P.fig_label,'_',P.plot_vars{jj},'_',plot_option));
            end
        end

    end

    
end