function [] = make_irfs(yirf, which_, endogz_, fignum, print_name_)
% ----------------------------------------------------------
%  [] = make_irfs(yirf, which_, endogz_, fignum, print_name_)
%
% Plot impulse responses.
% - inputs:     - yirf_nogov: IRFs without gov spending shock.
%               - which_: name list of variables for which to plot the IRFs
%               - colorIRF_: color for this baseline
%               - endogz_: namelist of endogenous variables.
%               - fignum : number of figure
%               - print_name_ : name under which IRFs are stored
%
% - outputs:    - irfs and eps
%
% Keith Kuester, Oct 22 2009
% ----------------------------------------------------------
% -----------------------------
% Simulation choices (Simulation starts in period 1)
% -----------------------------
nperiod = 20;               % number of periods of the impulse responses
ncol    = 4; %3;                % number of columns of panels for the Figures
nrow    = 2; %ceil((size(which_,1))/ncol); %*npaths% resulting number of rows of panels

axisfontsize  = 10; %12; % fontsize for numbers on axes
titlefontsize = 1; %20; % fontsize for titles of individual panels
xtickstep     = 10;
suptitlefs    = 1; %16; % fontsize for titles of set of panels
linewid       = 1.5;
markersize    = 1; %4;
do_individualplot = 1;
time0       = 0;
colorIRF_   = 'k-';'k-';'ro-';'ms';'k-';'g*';'go'; 
% ----------------------------------------------------------
% plot response to all but gov spend shocks
% ----------------------------------------------------------
f1=figure(fignum);


X = yirf;

for jkl = 1:size(which_,1);
    name_  = deblank(which_(jkl,:));
    varpos = loc(endogz_, name_);

    figure(fignum)
    'k-';
    subplot(nrow,ncol,jkl);
    
    hold on
    x  =  X(varpos,1:nperiod);
    x  =  x.*(x>1.e-10|x<-1.e-10); 
               
    plot(1:nperiod,x,colorIRF_,'LineWidth',linewid,'MarkerSize',markersize);
    title(name_,'Fontsize', titlefontsize, 'VerticalAlignment', 'bottom');
    line(1:nperiod,0*[1:nperiod],'LineWidth', linewid, 'Color', 'k', 'LineStyle', ':')
    set(gca, 'XMinorTick','on');
    set(gca, 'YMinorTick','on');
    set(gca, 'Xtick',[1:xtickstep:nperiod]);
    set(gca, 'Xticklabel',num2str([time0:xtickstep:time0+(nperiod+1)]',2));
    set(gca,'fontsize', axisfontsize);
    %grid on
    axis tight
    hold off
    
    if do_individualplot==1
        % ------
        % plot individual figures
        % ------
        %figure(fignum+40+jkl)
        %hold on
        %plot(1:nperiod,x,colorIRF_,'LineWidth',linewid*2,'MarkerSize',markersize*2);
        % title(name_,'Fontsize', titlefontsize+30, 'VerticalAlignment', 'bottom');
        line(1:nperiod,0*[1:nperiod],'LineWidth', linewid, 'Color', 'k', 'LineStyle', ':')
        set(gca, 'XMinorTick','on');
        set(gca, 'YMinorTick','on');
        set(gca, 'Xtick',[1:xtickstep:nperiod]);
        set(gca, 'Xticklabel',num2str([time0:xtickstep:time0+(nperiod+1)]',2));
        set(gca,'fontsize', axisfontsize);%keyboard
        min_y_series = floor(100*(min(x)-max(abs(x))/3.70))/100;
        max_y_series = ceil(100*(max(x)+max(abs(x))/5))/100;
%         if jkl == 8 
%             max_y_series = 0.01 ;
%         end
%          if jkl == 6 
%              max_y_series = 10 ;
%          end
%          if jkl == 6 
%              min_y_series = -25 ;
%          end
         if jkl == 6 
             max_y_series = 30 ;
         end
         if jkl == 6 
             min_y_series = -10 ;
         end
%         if jkl == 2
%             max_y_series = 0.02 ;
%         end
%         if jkl == 3
%             max_y_series = 0.4 ;
%         end            
         if jkl == 7
             min_y_series = -10 ;
         end     
         if jkl == 7
             max_y_series = 60 ;
         end           
%         if jkl == 9
%             min_y_series = -0.1 ;
%         end            
%        if jkl == 4 
%            min_y_series = -0.30 ;
%        end
%        if jkl == 8 
%            min_y_series = -0.30 ;
%        end
        axis([1 nperiod min_y_series max_y_series])        
        % grid on;
        % axis tight
%         eval(['print -depsc ', name_, '_', print_name_, '.eps'])
        hold off
        %close
    end
end