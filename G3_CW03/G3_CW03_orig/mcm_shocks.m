%***********************************************************
%
% MCM_shocks.m
%
% Compute the historical shocks by running gcsimulate.m 
%
% By: Guenter Coenen. 12 September 2001
%
%***********************************************************

clear all
clc

% ----------------------
% solve model for observable structure
% ----------------------

modfile = ' MCM_mod.txt';
parnam  = 'MCM_par';

parseflag = 1;
solveflag = 1;

if solveflag == 1
   vwsolve
end

clc
clc

% ----------------------
% get historical data 
% ----------------------

eval('load j:\mcm\data\data74q1_eu.asc')
eval('load j:\mcm\data\data74q1_ja.asc')
eval('load j:\mcm\data\data74q1_us.asc')

% data available from 1974:Q1 to 1998:Q4

t_max = size(data74q1_eu,1)-12;                        

pi1_eu = data74q1_eu(1:t_max,1)/4;      % inflation in deviation from linear trend
q_eu   = data74q1_eu(1:t_max,2);        % output in deviation from log-linear trend
pi1_ja = data74q1_ja(1:t_max,1)/4;      % inflation
q_ja   = data74q1_ja(1:t_max,2);        % output gap measure based on OECD data
pi1_us = data74q1_us(1:t_max,1)/4;      % inflation
q_us   = data74q1_us(1:t_max,2);        % output gap measure based on OECD data
one    = ones(t_max,1);

pi1_eu = pi1_eu-mean(pi1_eu);
q_eu   = q_eu-mean(q_eu);
pi1_ja = pi1_ja-mean(pi1_ja);
q_ja   = q_ja-mean(q_ja);
pi1_us = pi1_us-mean(pi1_us);
q_us   = q_us-mean(q_us);

% ----------------------
% define exogenous variables
% ----------------------

exog = vwnamelist('q_eu','pi1_eu', ...
                  'q_ja','pi1_ja', ...
                  'q_us','pi1_us', ...
                  'one');

% add blanks to make endog_ a namelist (8 cols)

[endrow, endcol] = size(endog_);
for ee = 1:endrow
   endogx(ee,:) = '        ';
end
endogx(:,1:endcol) = endog_;
endog_ = endogx;

% ----------------------
% initialize exogenous and endogenous variables
% ----------------------

xdat = zeros(t_max,neq);

% read exogenous variables

xdat(:,loc(endog_,'q_eu'))   = q_eu;
xdat(:,loc(endog_,'pi1_eu')) = pi1_eu;
xdat(:,loc(endog_,'q_ja'))   = q_ja;
xdat(:,loc(endog_,'pi1_ja')) = pi1_ja;
xdat(:,loc(endog_,'q_us'))   = q_us;
xdat(:,loc(endog_,'pi1_us')) = pi1_us;
xdat(:,loc(endog_,'one'))    = one;

% set initial values for unobserved endogenous variables

xdat(:,loc(endog_,'cwp_eu'))   = (f1_eu+2*f2_eu+3*f3_eu)*pitarget_eu/4;
xdat(:,loc(endog_,'pi4_eu'))   = pitarget_eu;
xdat(:,loc(endog_,'is_eu'))    = rlbar_eu+pitarget_eu;
xdat(:,loc(endog_,'il_eu'))    = rlbar_eu+pitarget_eu;
xdat(:,loc(endog_,'rl_eu'))    = rlbar_eu;
xdat(:,loc(endog_,'reer_eu'))  = 0;

xdat(:,loc(endog_,'cwp_ja'))   = (f1_ja+2*f2_ja+3*f3_ja)*pitarget_ja/4;
xdat(:,loc(endog_,'pi4_ja'))   = pitarget_ja;
xdat(:,loc(endog_,'is_ja'))    = rlbar_ja+pitarget_ja;
xdat(:,loc(endog_,'il_ja'))    = rlbar_ja+pitarget_ja;
xdat(:,loc(endog_,'rl_ja'))    = rlbar_ja;
xdat(:,loc(endog_,'reer_ja'))  = 0;

xdat(:,loc(endog_,'cwp_us'))   = (f1_us+2*f2_us+3*f3_us)*pitarget_us/4;
xdat(:,loc(endog_,'index_us')) = (f1_us+2*f2_us+3*f3_us)*pitarget_us/4;
xdat(:,loc(endog_,'pi4_us'))   = pitarget_us;
xdat(:,loc(endog_,'is_us'))    = rlbar_us+pitarget_us;
xdat(:,loc(endog_,'il_us'))    = rlbar_us+pitarget_us;
xdat(:,loc(endog_,'rl_us'))    = rlbar_us;
xdat(:,loc(endog_,'reer_us'))  = 0;

xdat(:,loc(endog_,'rer_euja')) = 0;
xdat(:,loc(endog_,'rer_euus')) = 0;
xdat(:,loc(endog_,'rer_jaus')) = 0;


% ----------------------
% simulate the model to generate data for variables determined 
% through identities (cwp_j, index_us, pi4_j, is_j, rl_j, reer_j, 
% rer_ij) and shocks (e_d_j, e_cw_j) for i,j = eu, ja, us, i ~=j
% ----------------------

nstart = nlag+1;

sx = gcsimulate(scof,xdat,endog_,exog,nstart,'d');
for i = 1:neq
   eval([endog_(i,:),' = sx(:,loc(endog_,endog_(',num2str(i),',:)));']);
end


% ----------------------
% print historical shocks and set of variables
% ----------------------

orient landscape

figure(1)

subplot(2,3,1)
plot(1:t_max,e_d_eu,'-')
title('demand shock (eu)')
xlabel('time')
grid on

subplot(2,3,2)
plot(1:t_max,e_cw_eu,'-')
title('contract wage shock (eu)')
xlabel('time')
grid on

subplot(2,3,3)
plot(1:t_max,pi4_eu,'-', ...
     1:t_max,q_eu,'--')
title('y-o-y inflation and output gap (eu)')
xlabel('time')
legend('pi4','q',4)
grid on

subplot(2,3,4)
plot(1:t_max,pi1_eu,'-', ...
     1:t_max,cwp_eu,'--')
title('q-o-q inflation and real contract wage (eu)')
xlabel('time')
legend('pi1','cwp',4)
grid on

subplot(2,3,5)
plot(1:t_max,is_eu,'-', ...
     1:t_max,rl_eu,'--')
title('interest rates (eu)')
xlabel('time')
legend('is','rl',4)
grid on

subplot(2,3,6)
plot(1:t_max,reer_eu,'-')
title('real effective exchange rate (eu)')
xlabel('time')
legend('reer',4)
grid on

orient landscape

figure(2)

subplot(2,3,1)
plot(1:t_max,e_d_ja,'-')
title('demand shock (ja)')
xlabel('time')
grid on

subplot(2,3,2)
plot(1:t_max,e_cw_ja,'-')
title('contract wage shock (ja)')
xlabel('time')
grid on

subplot(2,3,3)
plot(1:t_max,pi4_ja,'-', ...
     1:t_max,q_ja,'--')
title('y-o-y inflation and output gap (ja)')
xlabel('time')
legend('pi4','q',4)
grid on

subplot(2,3,4)
plot(1:t_max,pi1_ja,'-', ...
     1:t_max,cwp_ja,'--')
title('q-o-q inflation and real contract wage (ja)')
xlabel('time')
legend('pi1','cwp',4)
grid on

subplot(2,3,5)
plot(1:t_max,is_ja,'-', ...
     1:t_max,rl_ja,'--')
title('interest rates (eu)')
xlabel('time')
legend('is','rl',4)
grid on

subplot(2,3,6)
plot(1:t_max,reer_ja,'-')
title('real effective exchange rate (ja)')
xlabel('time')
legend('reer',4)
grid on

orient landscape

figure(3)

subplot(2,3,1)
plot(1:t_max,e_d_us,'-')
title('demand shock (us)')
xlabel('time')
grid on

subplot(2,3,2)
plot(1:t_max,e_cw_us,'-')
title('contract wage shock (us)')
xlabel('time')
grid on

subplot(2,3,3)
plot(1:t_max,pi4_us,'-', ...
     1:t_max,q_us,'--')
title('y-o-y inflation and output gap (us)')
xlabel('time')
legend('pi4','q',4)
grid on

subplot(2,3,4)
plot(1:t_max,pi1_us,'-', ...
     1:t_max,cwp_us,'--', ...
     1:t_max,index_us,':')
title('q-o-q inflation, real contract wage and index (us)')
xlabel('time')
legend('pi1','cwp','index',4)
grid on

subplot(2,3,5)
plot(1:t_max,is_us,'-', ...
     1:t_max,rl_us,'--')
title('interest rates (us)')
xlabel('time')
legend('is','rl',4)
grid on

subplot(2,3,6)
plot(1:t_max,reer_us,'-')
title('real effective exchange rate (us)')
xlabel('time')
legend('reer',4)
grid on


% ----------------------
% calculate covariance matrix of historical shocks
% ----------------------

% set t_end different from t_max and t_begin different 
% from t = 1 if dropping initial shocks

t_begin = nlag+1;         % 74q4 - 98q4
t_end   = t_max-nlag;

t_begin = 25;            % 80q1 - 98q4
t_end   = t_max-24;

disp(['Historical shocks, periods ',int2str(t_begin),' through ',int2str(t_max),'.']);
                
shocks      = zeros(t_max-t_begin+1,6);
shocks(:,1) = e_d_eu(t_begin:t_max,1);
shocks(:,2) = e_cw_eu(t_begin:t_max,1);
shocks(:,3) = e_d_ja(t_begin:t_max,1);
shocks(:,4) = e_cw_ja(t_begin:t_max,1);
shocks(:,5) = e_d_us(t_begin:t_max,1);
shocks(:,6) = e_cw_us(t_begin:t_max,1);

shocks_cov = cov(shocks);
shocks_std = std(shocks)
shocks_cor = corrcoef(shocks)

%save shocks_74q4_98q4 shocks shocks_cov shocks_std shocks_cor
save shocks_80q1_98q4 shocks shocks_cov shocks_std shocks_cor


