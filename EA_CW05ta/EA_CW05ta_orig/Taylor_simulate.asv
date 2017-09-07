%--------------------------------------------------------------
%
% Taylor_simulate.m
%
% Simulate the dynamic response of the model to specific shocks
%
% by: Keith Küster August 2003
% This program has been checked and compared to Günter's IRs
%--------------------------------------------------------------
% clear
% clear

% -----------------------------------------
% Define the parameter name and modelfile
% -----------------------------------------

thispath = cd;


solve_path = horzcat(thispath,'\newaim'); % path of sp_solve directory on your machine
addpath(solve_path);
dirnam= horzcat(' ',thispath,'\'); % directory of this example 

addpath(thispath)
horzcat('dos('' del ', thispath, '\compute_aim_matrices.m '' ',')')

modnam = 'Taylor.txt'
parnam  = ' Taylor_par'

rule = 3;       % 1: Taylor, 2: with smoothing, 3: Gerdesmeier, Roffia
% ----------------------
% set policy rule
% ----------------------
if rule ==1
    rho     = 0;
    alpha   = 1.5;
    beta    = 0.5;
elseif rule==2
    rho     = .79;
    alpha   = (1-.79)*2.2;
    beta    = (1-.79)*1.33;
elseif rule==3
    rho     =  .87^3;
    alpha   =  (1-.87^3)*1.93;
    beta    =  (1-.87^3)*.28;
else
    error('specify a rule between 1 and 3')
end


% ----------------------
% set parameters for the plot
% ----------------------

horizon = 50;
% ----------------------
% solve model for observable structure
% ----------------------




parseflag = 1;
solveflag = 1;

if solveflag == 1
   spsolve
end

% ----------------------
% set up system matrices for dynamic simulations
% ----------------------

neq = size(cofb,1);

amat = cofb(1:neq,1:neq);  

bmat = inv(scof(1:neq,1*neq+1:2*neq));
bmat = bmat(1:neq,1:neq);

% ---------------------
% Autocorrelation functions
% ---------------------
index = [loc(endog_,'pi4'),loc(endog_,'q'),loc(endog_,'dis')];
[COR, Std]   = autocorrelation_2(amat,bmat(:,end-1:end),80,Omega,index) ;
save Taylor_autocorr endog_ index COR Std rule


% number of periods
np = horizon+3;

% ----------------------
% initial conditions for endogenous variables
% ----------------------

x = zeros(np,neq);

 
% ----------------------
% initial conditions for exogenous shocks
% ----------------------

e_cw    = zeros(np,1);
e_d    = zeros(np,1);
e_m    = zeros(np,1);

%---------------------
% option to simulate dynamic
% response to one specific shock
%---------------------

label = ['Simulate impulse response to:\n', ...
         '\n', ...
         '  1:  price shock\n', ...
         '  2:  demand shock\n', ...
         '  3:  monetary shock\n', ...
         '\n', ...
         'Scenario (1-3):  '];
 
types = 0;               
while (~ismember(types,[1:3]) & isempty(types)) | ~ismember(types,[1:3])
   
   disp(' ')
   types = str2num(input(label,'s'));
   disp(' ')
end                


% -----------------------
% simulations start in period nstart, >=2
% a shock occurs in period nshock, >= nstart
% -----------------------

nstart = 2;
nshock = 2;
              
%---------------------
% define shocks
%---------------------

if types == 1
   e_cw(nshock) = 1;
elseif types == 2
   e_d(nshock) = 1.00;
elseif types == 3
   e_m(nshock) = .01;
end   

e = zeros(np,neq);
e(:,loc(endog_,'e_cw'))    = e_cw;
e(:,loc(endog_,'e_d'))     = e_d;
e(:,loc(endog_,'is'))      = e_m;


% ----------------------
% dynamic simulation from initial conditions
% ----------------------

for i = nstart:np
   x1 = x(i-1,1:neq)';
   ee = e(i,:)';
   xc = amat*x1+bmat*ee;
   x(i,1:neq) = xc';
end


% ----------------------
% preparation for plotting and printout
% ----------------------

nprint = np;

n = nstart:nprint;

irpinf = x(nstart-1:nprint-1,loc(endog_,'pi4'))*100;
irq    = x(nstart-1:nprint-1,loc(endog_,'q'))*100;
irr    = x(nstart-1:nprint-1,loc(endog_,'is'))*100; % first 100 to scale from .01 to 1 percent


% clf;
figure;
subplot(1,3,1);hold on; plot1=plot(n,irpinf,'.-'); 
title('Annual Inflation','Fontsize', 16, 'VerticalAlignment', 'bottom')
                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'), 
                axis tight;
                xlabel('Quarters', 'Fontsize', 9);    
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
                % ----------------------------------
                % Depending on the rule chosen, set 
                % the bounds of the graphs
                % ----------------------------------
                if rule==1
                    set(gca,'YTick', [-0.04:.01:.04], ...
                    'YTickLabel', num2str([-0.04:.01:.04]'), 'FontSize', 10)
                    axis([n(1) n(end) -.02 0.011])
                end
                
                hold off;
                
subplot(1,3,2);hold on; plot2=plot(n,irq,'.-');
title('Output Gap','Fontsize', 16, 'VerticalAlignment', 'bottom')

                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
                       axis tight; %axis([1 21 -.3 0.4]);
                xlabel('Quarters', 'Fontsize', 9); 
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
                hold off;
                if rule==1
                     set(gca,'YTick', [-0.04:.01:.04], ...
                    'YTickLabel', num2str([-0.04:.01:.04]'), 'FontSize', 10)
                    axis([n(1) n(end) -.02 0.011])
                end
                
subplot(1,3,3);hold on; plot3=plot(n,irr,'.-');  
title('Nominal Rate','Fontsize', 16, 'VerticalAlignment', 'bottom')
                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
                        axis tight;%axis([1 21 -.6 0.025]);
                xlabel('Quarters', 'Fontsize', 9);
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
                hold off;
                if rule==1
                     set(gca,'YTick', [-10:10:100], ...
                    'YTickLabel', num2str([-10:10:100]'), 'FontSize', 10)
                    axis([n(1) n(end) -10 100])
                end

if      rule==1 & types==3
    irpinf_Taylor = irpinf;
    irq_Taylor    = irq;
    irr_Taylor    = irr;
    %save c:\wieland_project\impulse_data\Taylor_Taylor_IR irpinf_Taylor irq_Taylor irr_Taylor
elseif rule==2 & types==3
    irpinf_Taylor = irpinf;
    irq_Taylor    = irq;
    irr_Taylor    = irr;
    %save c:\wieland_project\impulse_data\Taylor_smooth_IR irpinf_Taylor irq_Taylor irr_Taylor
elseif rule==3 & types==3
    irpinf_Taylor = irpinf;
    irq_Taylor    = irq;
    irr_Taylor    = irr;
    %save c:\wieland_project\impulse_data\Taylor_Gerdes_IR irpinf_Taylor irq_Taylor irr_Taylor
end

%rmpath c:\wieland_project\simple_comm_bayes
