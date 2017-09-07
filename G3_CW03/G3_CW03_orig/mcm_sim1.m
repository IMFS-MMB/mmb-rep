%--------------------------------------------------------------
%
% MCM_sim.m
%
% Simulate the dynamic response of the model to specific shocks
%
% by: Guenter Coenen, 5 September 2001 
%
%--------------------------------------------------------------

% ----------------------
% solve model for observable structure
% (only needs to be done once to create cofb and 
% other model variables)
% ----------------------

modfile = ' MCM_mod.txt';
parnam  = 'MCM_par';

parseflag = 1;
solveflag = 1;

if solveflag == 1
   vwsolve
end

% ----------------------
% set up matrices for dynamic simulation
% ----------------------

[neq,neqnlag] = size(cofb);

amat1 = cofb(1:neq,2*neq+1:3*neq);
amat2 = cofb(1:neq,neq+1:2*neq);
amat3 = cofb(1:neq,1:neq);

bmat = inv(scof(1:neq,3*neq+1:4*neq));
bmat = bmat(1:neq,1:neq);

% number of periods
np = 32;

% ----------------------
% initial conditions for endogenous variables
% ----------------------

x = zeros(np,neq);
x(:,loc(endog_,'q_eu'))     = 0;
x(:,loc(endog_,'cwp_eu'))   = 0;
x(:,loc(endog_,'pi1_eu'))   = 0;
x(:,loc(endog_,'pi4_eu'))   = 0;
x(:,loc(endog_,'is_eu'))    = 0;
x(:,loc(endog_,'il_eu'))    = 0;
x(:,loc(endog_,'rl_eu'))    = 0;
x(:,loc(endog_,'reer_eu'))  = 0;
x(:,loc(endog_,'q_ja'))     = 0;
x(:,loc(endog_,'cwp_ja'))   = 0;
x(:,loc(endog_,'pi1_ja'))   = 0;
x(:,loc(endog_,'pi4_ja'))   = 0;
x(:,loc(endog_,'is_ja'))    = 0;
x(:,loc(endog_,'il_ja'))    = 0;
x(:,loc(endog_,'rl_ja'))    = 0;
x(:,loc(endog_,'reer_ja'))  = 0;
x(:,loc(endog_,'q_us'))     = 0;
x(:,loc(endog_,'cwp_us'))   = 0;
x(:,loc(endog_,'index_us')) = 0;
x(:,loc(endog_,'pi1_us'))   = 0;
x(:,loc(endog_,'pi4_us'))   = 0;
x(:,loc(endog_,'is_us'))    = 0;
x(:,loc(endog_,'il_us'))    = 0;
x(:,loc(endog_,'rl_us'))    = 0;
x(:,loc(endog_,'reer_us'))  = 0;
x(:,loc(endog_,'rer_euja')) = 0;
x(:,loc(endog_,'rer_euus')) = 0;
x(:,loc(endog_,'rer_jaus')) = 0;
x(:,loc(endog_,'one'))      = 1;
x(:,loc(endog_,'e_d_eu'))   = 0;
x(:,loc(endog_,'e_cw_eu'))  = 0;
x(:,loc(endog_,'e_d_ja'))   = 0;
x(:,loc(endog_,'e_cw_ja'))  = 0;
x(:,loc(endog_,'e_d_us'))   = 0;
x(:,loc(endog_,'e_cw_us'))  = 0;

% ----------------------
% initial conditions for exogenous shocks
% ----------------------

e_d_eu0  = zeros(np,1);
e_cw_eu0 = zeros(np,1);
e_d_ja0  = zeros(np,1);
e_cw_ja0 = zeros(np,1); 
e_d_us0  = zeros(np,1);
e_cw_us0 = zeros(np,1);

%---------------------
% option to simulate dynamic
% response to one specific shock
%---------------------

label = ['Simulate impulse response to:\n', ...
         '\n', ...
         '  1:  demand shock - eu\n', ...
         '  2:  contract wage shock - eu\n', ...  
         '  3:  disinflation - eu\n', ...
         '  4:  demand shock - ja\n', ...
         '  5:  contract wage shock - ja\n', ...
         '  6:  disinflation - ja\n' ...
         '  7:  demand shock - us\n', ...
         '  8:  contract wage shock - us\n', ...
         '  9:  disinflation - us\n', ...
         '\n', ...
         'Scenario (1-9):  '];
 
type = 0;               
while ~ismember(type,[1:9])
   clc
   disp(' ')
   type = input(label);
   disp(' ')
end  
               

% -----------------------
% simulations start in period nstart
% a shock occurs in period nshock
% -----------------------

nstart = 5;
nshock = 5;
              
%---------------------
% define shocks
%---------------------

if type == 1
   e_d_eu0(nshock) = 0.005/sigma_e_d_eu;
elseif type == 2
   e_cw_eu0(nshock) = 1.00;
elseif type == 3
   pitarget_eu_t0 = 0.02;
   for i = 1:nstart-1
      x(i,loc(endog_,'cwp_eu')) = (f1_eu+2*f2_eu+3*f3_eu)*pitarget_eu_t0/4;
      x(i,loc(endog_,'pi1_eu')) = pitarget_eu_t0/4;
      x(i,loc(endog_,'pi4_eu')) = pitarget_eu_t0;
      x(i,loc(endog_,'is_eu'))  = pitarget_eu_t0;
      x(i,loc(endog_,'il_eu'))  = pitarget_eu_t0;
  end
elseif type == 4
   e_d_ja0(nshock) = 0.005/sigma_e_d_ja;
elseif type == 5
   e_cw_ja0(nshock) = 1.00;
elseif type == 6
   pitarget_ja_t0 = 0.02;
   for i = 1:nstart-1
      x(i,loc(endog_,'cwp_ja')) = (f1_ja+2*f2_ja+3*f3_ja)*pitarget_ja_t0/4;
      x(i,loc(endog_,'pi1_ja')) = pitarget_ja_t0/4;
      x(i,loc(endog_,'pi4_ja')) = pitarget_ja_t0;
      x(i,loc(endog_,'is_ja'))  = pitarget_ja_t0;
      x(i,loc(endog_,'il_ja'))  = pitarget_ja_t0;
  end  
elseif type == 7
   e_d_us0(nshock) = 0.005/sigma_e_d_us;
elseif type == 8
   e_cw_us0(nshock) = 1.00;
elseif type == 9
   pitarget_us_t0 = 0.02;
   for i = 1:nstart-1
      x(i,loc(endog_,'cwp_us'))   = (f1_us+2*f2_us+3*f3_us)*pitarget_us_t0/4;
      x(i,loc(endog_,'index_us')) = (f1_us+2*f2_us+3*f3_us)*pitarget_us_t0/4;
      x(i,loc(endog_,'pi1_us'))   = pitarget_us_t0/4;
      x(i,loc(endog_,'pi4_us'))   = pitarget_us_t0;
      x(i,loc(endog_,'is_us'))    = pitarget_us_t0;
      x(i,loc(endog_,'il_us'))    = pitarget_us_t0;
  end
end   

e = zeros(np,neq);
e(:,loc(endog_,'e_d_eu'))  = e_d_eu0;
e(:,loc(endog_,'e_cw_eu')) = e_cw_eu0;
e(:,loc(endog_,'e_d_ja'))  = e_d_ja0;
e(:,loc(endog_,'e_cw_ja')) = e_cw_ja0;
e(:,loc(endog_,'e_d_us'))  = e_d_us0;
e(:,loc(endog_,'e_cw_us')) = e_cw_us0;

% ----------------------
% dynamic simulation from initial conditions
% ----------------------

for i = nstart:np
   x1 = x(i-1,1:neq)';
   x2 = x(i-2,1:neq)';
   x3 = x(i-3,1:neq)';
   ee = e(i,:)';
   xc = amat1*x1+amat2*x2+amat3*x3+bmat*ee;
   x(i,1:neq) = xc';
end

% ----------------------
% preparation for plotting and printout
% ----------------------

% number of periods for printout
nprint = np;

% x axis, for time series plots
n = 1:nprint;

% dynamic paths of endogenous variables
q_eu    = x(1:nprint,loc(endog_,'q_eu'));
pi4_eu  = x(1:nprint,loc(endog_,'pi4_eu'));
is_eu   = x(1:nprint,loc(endog_,'is_eu'));
reer_eu = x(1:nprint,loc(endog_,'reer_eu'));
q_ja    = x(1:nprint,loc(endog_,'q_ja'));
pi4_ja  = x(1:nprint,loc(endog_,'pi4_ja'));
is_ja   = x(1:nprint,loc(endog_,'is_ja'));
reer_ja = x(1:nprint,loc(endog_,'reer_ja'));
q_us    = x(1:nprint,loc(endog_,'q_us'));
pi4_us  = x(1:nprint,loc(endog_,'pi4_us'));
is_us   = x(1:nprint,loc(endog_,'is_us'));
reer_us = x(1:nprint,loc(endog_,'reer_us'));

subplot(2,2,1);
plot(n,q_us,'k-', ...  
     n,q_eu,'k--', ...
     n,q_ja,'k-.')
title('Output Gap', ...
      'Fontsize', 10)
legend('\fontsize{7}United States','\fontsize{7}Euro Area','\fontsize{7}Japan',1)
if (type == 1) | (type == 2) | (type == 4) | (type == 5) | (type == 7) | (type == 8)
   axis([1 nprint -0.005 0.01])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.005; 0.000; 0.005; 0.010], ...
           'YTickLabel', ['-0.5'; ' 0.0'; ' 0.5'; ' 1.0'], ...
           'FontSize', 10)
elseif (type == 3) | (type == 6)
   axis([1 nprint -0.004 0.004])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.004; -0.002; 0.000; 0.002; 0.004], ...
           'YTickLabel', ['-0.4'; '-0.2'; ' 0.0'; ' 0.2'; ' 0.4'], ...
           'FontSize', 10)
elseif (type == 9)
   axis([1 nprint -0.008 0.008])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.008; -0.004; 0.000; 0.004; 0.008], ...
           'YTickLabel', ['-0.8'; '-0.4'; ' 0.0'; ' 0.4'; ' 0.8'], ...
           'FontSize', 10)
end

subplot(2,2,2);
plot(n,pi4_us,'k-', ...  
     n,pi4_eu,'k--', ...
     n,pi4_ja,'k-.')
title('Annual Inflation', ...
      'Fontsize', 10)
legend('\fontsize{7}United States','\fontsize{7}Euro Area','\fontsize{7}Japan',1)
if (type == 1) | (type == 2) | (type == 4) | (type == 5) | (type == 7) | (type == 8)
   axis([1 nprint -0.005 0.01])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.005; 0.000; 0.005; 0.010], ...
           'YTickLabel', ['-0.5'; ' 0.0'; ' 0.5'; ' 1.0'], ...
           'FontSize', 10)
elseif (type == 3) | (type == 6) | (type == 9)
   axis([1 nprint -0.01 0.03])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.01; 0.00; 0.01; 0.02; 0.03], ...
           'YTickLabel', ['-1.0'; ' 0.0'; ' 1.0'; ' 2.0'; ' 3.0'], ...
           'FontSize', 10)
end

subplot(2,2,3);
plot(n,is_us,'k-', ...  
     n,is_eu,'k--', ...
     n,is_ja,'k-.')
title('Short-Term Nominal Interest Rate', ...
      'Fontsize', 10)
legend('\fontsize{7}United States','\fontsize{7}Euro Area','\fontsize{7}Japan',1)
if (type == 1) | (type == 2) | (type == 4) | (type == 7) | (type == 8)
   axis([1 nprint -0.005 0.01])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.005; 0.000; 0.005; 0.010], ...
           'YTickLabel', ['-0.5'; ' 0.0'; ' 0.5'; ' 1.0'], ...
           'FontSize', 10)
elseif (type == 5)
   axis([1 nprint -0.008 0.016])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.008; 0.000; 0.008; 0.016], ...
           'YTickLabel', ['-0.8'; ' 0.0'; ' 0.8'; ' 1.6'], ...
           'FontSize', 10)
elseif (type == 3) | (type == 6) | (type == 9)
   axis([1 nprint -0.01 0.03])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.01; 0.00; 0.01; 0.02; 0.03], ...
           'YTickLabel', ['-1.0'; ' 0.0'; ' 1.0'; ' 2.0'; ' 3.0'], ...
           'FontSize', 10)
end

subplot(2,2,4);
plot(n,reer_us,'k-', ...  
     n,reer_eu,'k--', ...
     n,reer_ja,'k-.')
title('Real Effective Exchange Rate', ...
      'Fontsize', 10)
legend('\fontsize{7}United States','\fontsize{7}Euro Area','\fontsize{7}Japan',1)
if (type == 1) | (type == 2) | (type == 4) | (type == 5) | (type == 7) | (type == 8)
   axis([1 nprint -0.025 0.050])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.025; 0.000; 0.025; 0.050], ...
           'YTickLabel', ['-2.5'; ' 0.0'; ' 2.5'; ' 5.0'], ...
           'FontSize', 10)
elseif (type == 3) | (type == 6) | (type == 9)
   axis([1 nprint -0.05 0.05])
   set(gca,'XTick', [5; 10; 15; 20; 25; 30], ...
           'XTickLabel', [' 5'; '10'; '15'; '20'; '25'; '30'], ...
           'YTick', [-0.050; -0.025; 0.000; 0.025; 0.050], ...
           'YTickLabel', ['-5.0'; '-2.5'; ' 0.0'; ' 2.5'; ' 5.0'], ...
           'FontSize', 10)
end

% print disinflation.eps -deps

pause
close



