%--------------------------------------------------------------
%
% MCM_sim_eu_ja_us.m
%
% Simulate the dynamic response of the model to specific shocks
%
% by: Guenter Coenen, 5 September 2001 
%
%--------------------------------------------------------------

clear all
clc

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

%---------------------
% option to simulate dynamic
% response to one class of shocks
%---------------------
   
label = ['Simulate impulse response to:\n', ...
         '\n', ...
         '  1:  demand shock\n', ...
         '  2:  contract wage shock\n', ...
         '  3:  disinflation\n', ...
         '\n', ...
         'Scenario (1-3):  '];
 
type = 0;               
while ~ismember(type,[1:3])
   clc
   disp(' ')
   type = input(label);
   disp(' ')
end  

if type == 1
  index = [7 1 4];
elseif type == 2
  index = [8 2 5];
elseif type == 3
  index = [9 3 6];
end  
    
for country = [3 1 2]
    
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
  np = 40;

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
             
  % ----------------------- 
  % simulations start in period nstart
  % a shock occurs in period nshock
  % -----------------------

  nstart = 5+1;   
  nshock = 5+1;
  
  % Note: effective starting period is period 5
  %       since plots start with period 0
              
  %---------------------
  % define shocks
  %---------------------

  if index(country) == 1
     e_d_eu0(nshock) = 0.005/sigma_e_d_eu;
  elseif index(country) == 2
     e_cw_eu0(nshock) = 1.00;
  elseif index(country) == 3
     pitarget_eu_t0 = 0.02;
     for i = 1:nstart-1
        x(i,loc(endog_,'cwp_eu')) = (f1_eu+2*f2_eu+3*f3_eu)*pitarget_eu_t0/4;
        x(i,loc(endog_,'pi1_eu')) = pitarget_eu_t0/4;
        x(i,loc(endog_,'pi4_eu')) = pitarget_eu_t0;
        x(i,loc(endog_,'is_eu'))  = pitarget_eu_t0;
        x(i,loc(endog_,'il_eu'))  = pitarget_eu_t0;
    end
  elseif index(country) == 4
     e_d_ja0(nshock) = 0.005/sigma_e_d_ja;
  elseif index(country) == 5
     e_cw_ja0(nshock) = 1.00;
  elseif index(country) == 6
     pitarget_ja_t0 = 0.02;
     for i = 1:nstart-1
        x(i,loc(endog_,'cwp_ja')) = (f1_ja+2*f2_ja+3*f3_ja)*pitarget_ja_t0/4;
        x(i,loc(endog_,'pi1_ja')) = pitarget_ja_t0/4;
        x(i,loc(endog_,'pi4_ja')) = pitarget_ja_t0;
        x(i,loc(endog_,'is_ja'))  = pitarget_ja_t0;
        x(i,loc(endog_,'il_ja'))  = pitarget_ja_t0;
    end  
  elseif index(country) == 7
     e_d_us0(nshock) = 0.005/sigma_e_d_us;
  elseif index(country) == 8
     e_cw_us0(nshock) = 1.00;
  elseif index(country) == 9
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
  nprint = 30;

  % x axis, for time series plots
  n = 0:nprint;

  % dynamic paths of endogenous variables
  q_eu    = x(1:nprint+1,loc(endog_,'q_eu'));
  pi4_eu  = x(1:nprint+1,loc(endog_,'pi4_eu'));
  is_eu   = x(1:nprint+1,loc(endog_,'is_eu'));
  reer_eu = x(1:nprint+1,loc(endog_,'reer_eu'));
  q_ja    = x(1:nprint+1,loc(endog_,'q_ja'));
  pi4_ja  = x(1:nprint+1,loc(endog_,'pi4_ja'));
  is_ja   = x(1:nprint+1,loc(endog_,'is_ja'));
  reer_ja = x(1:nprint+1,loc(endog_,'reer_ja'));
  q_us    = x(1:nprint+1,loc(endog_,'q_us'));
  pi4_us  = x(1:nprint+1,loc(endog_,'pi4_us'));
  is_us   = x(1:nprint+1,loc(endog_,'is_us'));
  reer_us = x(1:nprint+1,loc(endog_,'reer_us'));

  orient landscape

  subplot(3,4,(country-1)*4+1);
  plot(n,q_us,'k-', ...  
       n,q_eu,'k--', ...
       n,q_ja,'k-.')
  if country == 1
    title('Output Gap', ...
          'Fontsize', 10)  
  end
  if (type == 1) | (type == 2)
     axis([0 nprint -0.005 0.01])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.005; 0.000; 0.005; 0.010], ...
             'YTickLabel', ['-0.5'; ' 0.0'; ' 0.5'; ' 1.0'], ...
             'FontSize', 10)
  elseif (type == 3) & (index(country) ~= 9)
     axis([0 nprint -0.004 0.004])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.004; -0.002; 0.000; 0.002; 0.004], ...
             'YTickLabel', ['-0.4'; '-0.2'; ' 0.0'; ' 0.2'; ' 0.4'], ...
             'FontSize', 10)
  elseif (type == 3) & (index(country) == 9)
     axis([0 nprint -0.008 0.008])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.008; -0.004; 0.000; 0.004; 0.008], ...
             'YTickLabel', ['-0.8'; '-0.4'; ' 0.0'; ' 0.4'; ' 0.8'], ...
             'FontSize', 10)
  end
  if (type == 1) | (type == 2)
    if country == 1
       text(-15.0,0.0035,'United','Fontsize',10)
       text(-15.0,0.0020,'States','Fontsize',10)
    elseif (country-1)*4+1 == 5
       text(-15.0,0.0035,'Euro','Fontsize',10)
       text(-15.0,0.0020,'Area','Fontsize',10)
    elseif (country-1)*4+1 == 9
       text(-15.0,0.00275,'Japan','Fontsize',10)
    end   
  elseif type == 3
    if country == 1
       text(-15.0, 0.0009,'United','Fontsize',10)
       text(-15.0,-0.0009,'States','Fontsize',10)
    elseif (country-1)*4+1 == 5
       text(-15.0, 0.00045,'Euro','Fontsize',10)
       text(-15.0,-0.00045,'Area','Fontsize',10)
    elseif (country-1)*4+1 == 9
       text(-15.0, 0.0000,'Japan','Fontsize',10)
    end   
  end  
  if (country == 3)
     xlabel('Quarters', ...
            'Fontsize', 9)       
  end   
 
  subplot(3,4,(country-1)*4+2);
  plot(n,pi4_us,'k-', ...  
       n,pi4_eu,'k--', ...
       n,pi4_ja,'k-.')
  if country == 1
    title('Annual Inflation', ...
        'Fontsize', 10)
  end  
  if (type == 1) | (type == 2)
     axis([0 nprint -0.005 0.01])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.005; 0.000; 0.005; 0.010], ...
             'YTickLabel', ['-0.5'; ' 0.0'; ' 0.5'; ' 1.0'], ...
             'FontSize', 10)
  elseif (type == 3) 
     axis([0 nprint -0.01 0.03])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.01; 0.00; 0.01; 0.02; 0.03], ...
             'YTickLabel', ['-1.0'; ' 0.0'; ' 1.0'; ' 2.0'; ' 3.0'], ...
             'FontSize', 10)
  end
  if (country == 3)
     xlabel('Quarters', ...
            'Fontsize', 9)       
  end
    
  subplot(3,4,(country-1)*4+3);
  plot(n,is_us,'k-', ...  
       n,is_eu,'k--', ...
       n,is_ja,'k-.')
  if country == 1
    title('Short-Term Nominal Interest Rate', ...
          'Fontsize', 10)
  end    
  if (type == 1) | (type == 2) & (index(country) ~= 5)
     axis([0 nprint -0.005 0.01])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.005; 0.000; 0.005; 0.010], ...
             'YTickLabel', ['-0.5'; ' 0.0'; ' 0.5'; ' 1.0'], ...
             'FontSize', 10)
  elseif (type == 2) & (index(country) == 5)
     axis([0 nprint -0.007 0.014])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.007; 0.000; 0.007; 0.014], ...
             'YTickLabel', ['-0.7'; ' 0.0'; ' 0.7'; ' 1.4'], ...
             'FontSize', 10)
  elseif (type == 3)
     axis([0 nprint -0.01 0.03])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.01; 0.00; 0.01; 0.02; 0.03], ...
             'YTickLabel', ['-1.0'; ' 0.0'; ' 1.0'; ' 2.0'; ' 3.0'], ...
             'FontSize', 10)
  end
  if (country == 3)
     xlabel('Quarters', ...
            'Fontsize', 9)       
  end
    
  subplot(3,4,(country-1)*4+4);
  plot(n,reer_us,'k-', ...  
       n,reer_eu,'k--', ...
       n,reer_ja,'k-.')
  if country == 1
    title('Real Effective Exchange Rate', ...
          'Fontsize', 10)
  end    
  if (type == 1) | (type == 2)
     axis([0 nprint -0.025 0.050])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.025; 0.000; 0.025; 0.050], ...
             'YTickLabel', ['-2.5'; ' 0.0'; ' 2.5'; ' 5.0'], ...
             'FontSize', 10)
  elseif (type == 3)
     axis([0 nprint -0.05 0.05])
     set(gca,'XTick', [0; 5; 10; 15; 20; 25; 30], ...
             'XTickLabel', [' 0'; ' 5'; '10'; '15'; '20'; '25'; '30'], ...
             'YTick', [-0.050; -0.025; 0.000; 0.025; 0.050], ...
             'YTickLabel', ['-5.0'; '-2.5'; ' 0.0'; ' 2.5'; ' 5.0'], ...
             'FontSize', 10)
  end
  if (country == 3)
     xlabel('Quarters', ...
            'Fontsize', 9)       
  end      
  
end

if type == 1
  print ad_shock.eps -deps
elseif type == 2  
  print cw_shock.eps -deps
elseif type == 3
  print disinflation.eps -deps
end

pause
close



