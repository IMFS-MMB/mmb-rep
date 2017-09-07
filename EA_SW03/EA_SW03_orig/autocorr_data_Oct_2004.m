% ---------------------------------------------
% Obtain the autocorrelation functions
% for annual inflation, the output gap and dr
% ---------------------------------------------
clear
%load c:\wieland_project\data_2000\awm_2000
load c:\wieland_project\data_2002q4\data_awm_2002q4

% ---------------------------------------------
% Extract the inflation, output gap and 
% interest rate series
% ---------------------------------------------
%pipcd = awm.pipcd.dat;
%yer   = awm.yer.dat;
%stn   = awm.stn.dat;

% ---------------------------------------------
% Plot the series
% ---------------------------------------------

start = 60; %9: This 1972q1; 60: 1985q1
figure(1)
subplot(3,1,1)
plot(pipcd(start:end))
title('pipcd')
axis tight
subplot(3,1,2)
plot(yer(start:end))
title('yer')
axis tight
subplot(3,1,3)
plot(stn(start:end))
title('stn')
axis tight


% ---------------------------------------------
% Give the time span of data
% ---------------------------------------------
%wm.pipcd.crst
%awm.yer.crst
%awm.stn.crst

% ---------------------------------------------
% Construct data without detrending
% ---------------------------------------------
% Annual inflation

pipcda = pipcd(1:end-3)+pipcd(2:end-2)+pipcd(3:end-1)+pipcd(4:end);
yer    = yer(start:end);
dstn   = (stn(start:end)-stn(start-1:end-1));%100;

% ---------------------------------------------
% Cut to sample size
% ---------------------------------------------
pipcda = pipcda(start:end);


N_pi   = length(pipcda);
N_yer  = length(yer);
N_dstn = length(dstn);

% ---------------------------------------------
% Compute std deviations
% ---------------------------------------------
stdpi   = std(pipcda)
stdyer  = std(yer)
stddstn = std(dstn)
% ---------------------------------------------
% Compute autocorrelations
% bounds are based on MA(max_q)(std_num std de-
% viations)
% ---------------------------------------------
max_q   = 0;
std_num = 2;

[autopi] = autocorr_compute(pipcda',41,0);
autopi   = [1,autopi];
boundspi = bounds_AC(autopi', N_pi,std_num,max_q);


[autoy]  = autocorr_compute(yer',41,0);
autoy    = [1,autoy];
boundsy  = bounds_AC(autoy', N_yer,std_num,max_q);

[autodr] = autocorr_compute(dstn',41,0);
autodr   = [1,autodr];
boundsdr = bounds_AC(autodr', N_dstn,std_num,max_q);


% --------------------------------------------------
% Plot the results
% --------------------------------------------------
figure(2)
clf
subplot(4,1,1)
hold on
plot(autopi)
plot(boundspi(1,:))
plot(boundspi(2,:))
title('autopi')
hold off
axis tight

subplot(4,1,3)
hold on
plot(autoy)
plot(boundsy(1,:))
plot(boundsy(2,:))
title('autoy')
axis tight

subplot(4,1,4)
hold on
plot(autodr)
plot(boundsdr(1,:))
plot(boundsdr(2,:))
title('autodr')
axis tight

% ----------------------------------------------
% Now do the same thing but detrend inflation
% ----------------------------------------------
X    = [ones(N_pi,1),[0:N_pi-1]'];
Beta = inv(X'*X)*X'*pipcda;
pipcda_detrend = pipcda-X*Beta;

stdpi_detrend = std(pipcda_detrend)

[autopi_detrend] = autocorr_compute(pipcda_detrend',41,0);
autopi_detrend   = [1,autopi_detrend];
boundspi_detrend = bounds_AC(autopi_detrend', N_pi,std_num,max_q);



subplot(4,1,2)
hold on
plot(autopi_detrend)
plot(boundspi_detrend(1,:))
plot(boundspi_detrend(2,:))
title('autopidetrended')
hold off
axis tight

% ---------------------------------------------
% Select detrended inflation for joint_AC plot
% ---------------------------------------------
autopi   = autopi_detrend;
boundspi = boundspi_detrend;
save data_ac autopi autoy boundspi boundsy %autodr boundsdr
