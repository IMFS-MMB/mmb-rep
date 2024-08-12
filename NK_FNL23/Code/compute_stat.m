%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This code business cycle statistics in the euro area



clc 
clear 
close all

load eadata_cp               
dates=(1999:0.25:2019.75)';
T=length(dates);
t0=1;
y=log(y(t0:T)); 
c=log(c(t0:T)); 
i=log(i(t0:T)); 
pi=(pi(t0:T));

%% HP Filter
lambda=1600;
[ytrend,ycycle] = hpfilter(y,lambda);
[ctrend,ccycle] = hpfilter(c,lambda);
[itrend,icycle] = hpfilter(i,lambda);
[pitrend,picycle] = hpfilter(pi,lambda);


% Statistics
sy=var(ycycle)^0.5;
sc=(var(ccycle)^0.5)/sy;
si=(var(icycle)^0.5)/sy; 
spi=(var(picycle)^0.5)/sy; 
rhoyc=corr(ycycle,ccycle);
rhoypi=corr(ycycle,picycle);
rhoyi=corr(ycycle,icycle);
rhoy1=corr(ycycle(2:end),ycycle(1:end-1));
rhoc1=corr(ccycle(2:end),ccycle(1:end-1));
rhoi1=corr(icycle(2:end),icycle(1:end-1));
rhopi1=corr(picycle(2:end),picycle(1:end-1));

HP=[sy*100,sc*sy*100,si*sy*100,spi*sy*100;1,sc,si,spi;1,rhoyc,rhoyi,rhoypi;rhoy1,rhoc1,rhoi1,rhopi1];



save stat HP

