clear; clc; close all; warning off; tic

thispath = cd;


solve_path = horzcat(thispath,'\newaim'); % path of sp_solve directory on your machine
addpath(solve_path);
dirnam= horzcat(' ',thispath,'\'); % directory of this example 

addpath(thispath)
horzcat('dos('' del ', thispath, '\compute_aim_matrices.m '' ',')')

% setup aim inputs

modnam='taylorfl20';
parnam='jbtpar';

cofintintb1 =  0.76;
cofintinf0 = 0.6;
cofintout = 1.18; cofintoutb1 = -0.97;

%dirnam='johnw/taylor88';
%parseflag=0;

% setup simulation parameters

nsh=98+7;			% # of stochastic equations
nlags=2;		% maximum # of lags            
nbeq=219;
neq=nbeq+nsh;	

ntestmat=10;

% read shocks

load fvcov;
jbtvarcov0=fvcov*fvcov';

load gres.dat;
gvarcov=cov(gres);

jbtvarcov = zeros(nsh,nsh);
jbtvarcov(1:98,1:98)=jbtvarcov0;
jbtvarcov(99:105,99:105)=gvarcov;
clear jbtvarcov0;
clear gvarcov;

jbtvarcov(1:nsh,1)=zeros(nsh,1);
jbtvarcov(1,1:nsh)=zeros(1,nsh);

 vcovmat=jbtvarcov;

 
% initial policy rule coefficients

%tayr10	=	.755226
%tayp00	=       (.602691 -(1-tayr10))/4;
%tayp10	=       tayp00;
%tayp20  =       tayp00;
%tayp30	=       tayp00;

%tayx00	=       1.17616
%tayx10	=       -.972390
    
tayr10 = 0;	
tayx00 = 0;	
tayx10 = 0;	
tayp00 = 0;   
tayp10 = 0;    
tayp20 = 0;    
tayp30 = 0;    

% Solve model
parseflag = 1;
solveflag = 1;

% change by VW 16.8.06
%if solveflag == 1
%   vwsolve
%end
if solveflag == 1
   spsolve
end


   %mysolvenew;

  if aimcode>1,
    disp('Error in aim: check results.')
  else

% Compute VAR reduced form of solution
% ----------------------
% set up system matrices for dynamic simulations
% ----------------------

   amat1=sparse(cofb(1:nbeq,1*neq+1:1*neq+nbeq));
   amat2=sparse(cofb(1:nbeq,0*neq+1:0*neq+nbeq));

   bmat1=inv(scof(1:neq,nlags*neq+1:(nlags+1)*neq));   
   bmat1=bmat1(1:nbeq,nbeq+1:neq);
    
   
   bmat2=zeros(nlags*nbeq,nsh);
   bmat2(1:nbeq,1:nsh)=bmat1;

% drop US funds rate shocks

   bmat2=bmat2(:,1:nsh);

% model reduction

amatnew=zeros(2*nbeq,nbeq);
killsum=0;
killvar2=zeros(nbeq,1);
for ii=1:nbeq,
  if max(abs(amat2(:,ii))) < 1e-8,
    killsum=killsum+1;
    killvar2(killsum,1)=ii;
  else    
    amatnew(1:nbeq,ii-killsum)=amat2(1:nbeq,ii);
    amatnew(nbeq+ii-killsum,ii)=1;
  end  
end

  nnew=nlags*nbeq-killsum;
  amat=zeros(nnew,nnew);
  amat(1:nbeq,1:nbeq)=amat1;
  amat(1:nbeq,nbeq+1:nnew)=amatnew(1:nbeq,1:nnew-nbeq);
  amat(nbeq+1:nnew,1:nbeq)=amatnew(nbeq+1:nnew,1:nbeq);
  amat=sparse(amat);


  
  bmat=sparse(bmat2(1:nnew,:));

  jbtuncond;

  sdygap=sqrt(c0(1,1));
  sdpdot=sqrt(c0(2,2));
  sdrff=sqrt(c0(3,3));
  sddrff=sqrt(c0(4,4));

  [100*sdygap,100*sdpdot,100*sddrff]

   %**********************************************************************
 %Compute autocorrelations similar to kuesterwieland
 % ----------------------
% set up system matrices for dynamic simulations
% ----------------------

%neq = size(cofb,1);
%neq

%amat = cofb(1:neq,1:neq);  

%bmat = inv(scof(1:neq,1*neq+1:2*neq));
%bmat = bmat(1:neq,1:neq);

[sdpdot,sdygap,sdrff]

Omega = vcovmat; 
% ---------------------
% Autocorrelation functions
% ---------------------
index = [loc(endog_,'pdot0'),loc(endog_,'ygap0'),loc(endog_,'rs0')];
%[COR, Std]   = autocorrelation_2(amat,bmat(:,end-13:end),80,Omega,index) 
[COR, Std]   = autocorrelation_2(amat,bmat,80,Omega,index,ntestmat) 
%save AWM_autocorr endog_ index COR Std rule
%**********************************************************************
  
  end


  % ----------------------
% set parameters for the plot
% ----------------------

horizon = 16;


rule=3;

% bmat=inv(scof(1:neq,nlags*neq+1:(nlags+1)*neq));  % get the transition of matrix
% bmat=bmat(1:nbeq,nbeq+1:neq);                     % sort how state variable (rows) react to shocks (columns)
% 
% bmat2=zeros(nbeq,nsh);
% %bmat2=zeros(nlags*nbeq,nsh);                      % rows = 2 * #state variables, columns = # of shocks
% bmat2(1:nbeq,1:nsh)=bmat;                        % rows state variables, columns shocks ; 2nd round rows zeros, 2nd round shocks zeros == useless?
% 
% %nnew=nlags*nbeq-killsum;
% %bmat=sparse(bmat2(1:nnew,:));
% 
% amat=cofb(1:nbeq,1*neq+1:1*neq+nbeq);              % rows state variables, colums: reaction to first lag (ordered last) of state variables
% 
% 
% %  amat1=sparse(cofb(1:nbeq,1*neq+1:1*neq+nbeq));
% %    amat2=sparse(cofb(1:nbeq,0*neq+1:0*neq+nbeq));
% % 
% %    amatnew=zeros(2*nbeq,nbeq);
% % killsum=0;
% % killvar2=zeros(nbeq,1);
% % for ii=1:nbeq,
% %   if max(abs(amat2(:,ii))) < 1e-8,
% %     killsum=killsum+1;
% %     killvar2(killsum,1)=ii;
% %   else    
% %     amatnew(1:nbeq,ii-killsum)=amat2(1:nbeq,ii);
% %     amatnew(nbeq+ii-killsum,ii)=1;
% %   end  
% % end
% % 
% %   nnew=nlags*nbeq-killsum;
% %   amat=zeros(nnew,nnew);
% %   amat(1:nbeq,1:nbeq)=amat1;
% %   amat(1:nbeq,nbeq+1:nnew)=amatnew(1:nbeq,1:nnew-nbeq);
% %   amat(nbeq+1:nnew,1:nbeq)=amatnew(nbeq+1:nnew,1:nbeq);
% %   amat=sparse(amat);
  
  
   
% number of periods
np = horizon+3;

% ----------------------
% initial conditions for endogenous variables
% ----------------------

%x = zeros(np,nbeq);
x = zeros(np,nnew);


 
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

%e = zeros(np,neq);
e = zeros(np,nsh);
if rule ==1
e(:,loc(endog_,'rs0'))    = estn*1.0322;
elseif rule ==2
e(:,loc(endog_,'rs0'))    = estn*1.0185;
elseif rule ==3
e(:,loc(endog_,'rs0_')-nbeq)    = estn* 1.0124*1.0238;
end

% ----------------------
% dynamic simulation from initial conditions
% ----------------------

for i = nstart:np
%   x1 = x(i-1,1:neq)';
   x1 = x(i-1,:)';   
   ee = e(i,:)';
   xc = amat*x1+bmat*ee;
%   x(i,1:neq) = xc';
   x(i,:) = xc';
end


% ----------------------
% preparation for plotting and printout
% ----------------------

nprint = np;

n = nstart:nprint;

irpinf = x(nstart-1:nprint-1,loc(endog_,'pdot0'));%*400;
irq    = x(nstart-1:nprint-1,loc(endog_,'ygap0'));%*100;
irr    = x(nstart-1:nprint-1,loc(endog_,'rs0'));%*100*4; % to scale from quarterly to annual percent, 



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
                
                
                
 figure
subplot(1,3,1);hold on; plot1=plot(n,ACpinf,'.-'); 
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
                
subplot(1,3,2);hold on; plot2=plot(n,ACq,'.-');
title('Output Gap','Fontsize', 16, 'VerticalAlignment', 'bottom')

                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
                       axis tight; %axis([1 21 -.3 0.4]);
                xlabel('Quarters', 'Fontsize', 9); 
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
                hold off;

                
subplot(1,3,3);hold on; plot3=plot(n,ACr,'.-');  
title('Nominal Rate','Fontsize', 16, 'VerticalAlignment', 'bottom')
                line('XData',[nstart, nprint],'YData',[0, 0], 'LineStyle','-.'),  
                        axis tight;%axis([1 21 -.6 0.025]);
                xlabel('Quarters', 'Fontsize', 9);
                set(gca,'XTick', [nstart:5:200], ...
                    'XTickLabel', num2str([0:5:200]'), 'FontSize', 10)
                hold off; 
  
toc