% Calling program for 2 parameter rule optimization
% by John C. Williams (10/27/97)
%

%
% Declare model file, parameter file, and directory name for AIM
%

clear; clc; close all; warning off; tic

thispath = cd;


solve_path = horzcat(thispath,'\newaim'); % path of sp_solve directory on your machine
addpath(solve_path);
dirnam= horzcat(' ',thispath,'\'); % directory of this example 

addpath(thispath)
horzcat('dos('' del ', thispath, '\compute_aim_matrices.m '' ',')')

% setup aim inputs

modnam='ms97jcw_CHANGE_MAIK';
parnam='mspar2';

cofintintb1 =  0.755226; 
cofintinf0 = 0.1507; 
cofintinfb1 = 0.1507; 
cofintinfb2 = 0.1507; 
cofintinfb3 = 0.1507; 
cofintout = 1.17616; 
cofintoutb1 = -0.972390; 

parseflag=0;

wt1=0;
wt3=0;

% load varcov matrix for shocks

load shocks97;

% Zero out funds rate, foreign shocks

shocks97(:,1)=0*shocks97(:,1);
%shocks97(:,6)=0*shocks97(:,6);

vcovmat=cov(shocks97(:,1:7));
clear shocks97;

% shocks:
%  1:  rffsh  
%  2:  ecsh   
%  3:  efish  
%  4:  eiish  
%  5:  egsh   
%  6:  exsh   
%  7:  cwsh   



%mysolvenewmod;
% Solve model
parseflag = 1;
solveflag = 1;

if solveflag == 1
   spsolve
end

nlags=1;
nsh=length(find(eqtype_==0));
nbeq=size(cofb,1)-nsh;
neq=nbeq+nsh;	

amat=cofb(1:nbeq,1:nbeq);
bmat=inv(scof(1:neq,nlags*neq+1:(nlags+1)*neq));
bmat=bmat(1:nbeq,nbeq+1:neq);

Omega = vcovmat; 
% ---------------------
% Autocorrelation functions
% ---------------------

ntestmat = 46;

index = [loc(endog_,'pdot'),loc(endog_,'ygap'),loc(endog_,'rff')];
%[COR, Std]   = autocorrelation_2(amat,bmat(:,end-13:end),80,Omega,index) 
[COR, Std]   = autocorrelation_2(amat,bmat,80,Omega,index,ntestmat) 
%save AWM_autocorr endog_ index COR Std rule
%**********************************************************************


horizon = 16;



rule=3;
% number of periods
np = horizon+3;

% ----------------------
% initial conditions for endogenous variables
% ----------------------

x = zeros(np,nbeq);
%x = zeros(np,neq);


 
% ----------------------
% initial conditions for exogenous shocks
% ----------------------

estn    = zeros(np,1);

%---------------------
% option to simulate dynamic
% response to one specific shock
%---------------------

not=0;
if not==0;
label = ['Simulate impulse response to:\n', ...
         '\n', ...
         '  1:  monetary shock\n', ...
         '\n', ...
         'Scenario (1-1):  '];
 
%  types = 0;               
% while (~ismember(types,[1:11]) & isempty(types)) | ~ismember(types,[1:11])
%    
%    disp(' ')
%    types = str2num(input(label,'s'));
%    disp(' ')
% end                

types = 1;

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
   estn(nshock) = 1.0;
end   


e = zeros(np,nsh);
if rule ==1
e(:,loc(endog_,'rff'))    = estn*1.0322;
elseif rule ==2
e(:,loc(endog_,'rff'))    = estn*1.0185;
elseif rule ==3
e(:,1)    = estn;%* 1.0124*1.0238; 
end

% ----------------------
% dynamic simulation from initial conditions
% ----------------------

for i = nstart:np
   x1 = x(i-1,:)';   
   ee = e(i,:)';
   xc = amat*x1+bmat*ee;
   x(i,:) = xc';
end


% ----------------------
% preparation for plotting and printout
% ----------------------

nprint = np;

n = nstart:nprint;

irpinf = x(nstart-1:nprint-1,loc(endog_,'pdot'));
irq    = x(nstart-1:nprint-1,loc(endog_,'ygap'));
irr    = x(nstart-1:nprint-1,loc(endog_,'rff'));



figure
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

                
                hold off;
                
subplot(1,3,2);hold on; plot2=plot(n,irq,'.-');
title('Output Gap','Fontsize', 16, 'VerticalAlignment', 'bottom')

                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
                       axis tight; %axis([1 21 -.3 0.4]);
                xlabel('Quarters', 'Fontsize', 9); 
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
                hold off;

                
subplot(1,3,3);hold on; plot3=plot(n,irr,'.-');  
title('Nominal Rate','Fontsize', 16, 'VerticalAlignment', 'bottom')
                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
                        axis tight;%axis([1 21 -.6 0.025]);
                xlabel('Quarters', 'Fontsize', 9);
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
                hold off;
                 
                
       

ACpinf = COR(1,1:nprint-1);
ACq    = COR(2,1:nprint-1);
ACr    = COR(3,1:nprint-1);
                
                
                
%  figure
% subplot(1,3,1);hold on; plot1=plot(n,ACpinf,'.-'); 
% title('Annual Inflation','Fontsize', 16, 'VerticalAlignment', 'bottom')
%                 line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'), 
%                 axis tight;
%                 xlabel('Quarters', 'Fontsize', 9);    
%                 set(gca,'XTick', [nstart:5:200], ...
%                     'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
%                 % ----------------------------------
%                 % Depending on the rule chosen, set 
%                 % the bounds of the graphs
%                 % ----------------------------------
% 
%                 
%                 hold off;
%                 
% subplot(1,3,2);hold on; plot2=plot(n,ACq,'.-');
% title('Output Gap','Fontsize', 16, 'VerticalAlignment', 'bottom')
% 
%                 line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
%                        axis tight; %axis([1 21 -.3 0.4]);
%                 xlabel('Quarters', 'Fontsize', 9); 
%                 set(gca,'XTick', [nstart:5:200], ...
%                     'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
%                 hold off;
% 
%                 
% subplot(1,3,3);hold on; plot3=plot(n,ACr,'.-');  
% title('Nominal Rate','Fontsize', 16, 'VerticalAlignment', 'bottom')
%                 line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
%                         axis tight;%axis([1 21 -.6 0.025]);
%                 xlabel('Quarters', 'Fontsize', 9);
%                 set(gca,'XTick', [nstart:5:200], ...
%                     'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
%                 hold off; 
%   
toc

