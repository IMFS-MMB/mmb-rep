%********************************************************
%Run and plot IRFs to unanticipated and anticipated components of the risk shock in Figigure 2. in
%Christiano, L. J., Motto, R., Rostagno, M., 2014. Risk shocks. American Economic Review 104 (1), 27–65.
%Code are mainly based on the package available under https://www.aeaweb.org/articles.php?doi=10.1257/aer.104.1.27.
%Last edited: 2016/02/24 by M. Kuete.

%********************************************************

clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/US_CMR14_rep']);

%run replication dynare file
dynare US_CMR14_rep;

yr      = 100 * cumsum(gdp_obs_e_sigma);
cr      = 100 * cumsum(consumption_obs_e_sigma);
ir      = 100 * cumsum(investment_obs_e_sigma);
creditr = 100 * cumsum(credit_obs_e_sigma);
netwr   = 100 * cumsum(networth_obs_e_sigma);
sloper  = 40000 * Spread1_obs_e_sigma;
premr   = 40000 * premium_obs_e_sigma;
riskr   = sigma_e_sigma;
inflr   = 400 * inflation_obs_e_sigma;%

gg = 1:16;

ss = 0:(length(gg) - 1);
%
cr8      = 100 * cumsum(consumption_obs_e_xi8);
yr8      = 100 * cumsum(gdp_obs_e_xi8);
ir8      = 100 * cumsum(investment_obs_e_xi8);
creditr8 = 100 * cumsum(credit_obs_e_xi8);
netwr8   = 100 * cumsum(networth_obs_e_xi8);
sloper8  = 40000 * Spread1_obs_e_xi8;
premr8   = 40000 * premium_obs_e_xi8;
riskr8   = sigma_e_xi8;
inflr8   = 400 * inflation_obs_e_xi8;%

dd=sqrt(sum(premium_obs_e_sigma.^2)*sum(gdp_obs_e_sigma.^2));
dd8=sqrt(sum(premium_obs_e_xi8.^2)*sum(gdp_obs_e_xi8.^2));

for ii = 1:16
    t1=[ii:length(premium_obs_e_sigma)];
    t2=[1:length(premium_obs_e_sigma)-(ii-1)];
    rhoplusk(ii)=sum(gdp_obs_e_sigma(t1).*premium_obs_e_sigma(t2))/dd;
    rhox8plusk(ii)=sum(gdp_obs_e_xi8(t1).*premium_obs_e_xi8(t2))/dd8;
    rhominusk(ii)=sum(gdp_obs_e_sigma(t2).*premium_obs_e_sigma(t1))/dd;
    rhox8minusk(ii)=sum(gdp_obs_e_xi8(t2).*premium_obs_e_xi8(t1))/dd8;
end

rho=[rhominusk([end:-1:1]) rhoplusk([2:end])];
rhox8=[rhox8minusk([end:-1:1]) rhox8plusk([2:end])];

orient landscape
ia = 3;
ib = 3;
aa=riskr(1)/max(riskr8);
subplot(ia, ib, 6)

plot(ss, cr(gg), ss, cr8(gg)*aa, 'o-');
hold on;
ll = legend('Response to unanticipated risk shock, \xi_{0,0}', ...
    'Response to anticipated risk shock, \xi_{8,0}');
pos = get(ll,'position');
set(ll,'position', [.72, .15 0.2 0.15])
title('F: Consumption')
ylabel({'Percent Deviation';'from Steady State'})
axis tight
subplot(ia, ib, 4)
plot(ss, yr(gg), ss, yr8(gg)*aa, 'o-')
title('D. Output')
ylabel({'Percent Deviation';'from Steady State'})
axis tight
subplot(ia, ib, 8)
plot(ss, riskr(gg), ss, riskr8(gg)*aa, 'o-')
title('H. Risk Shock, \sigma_{t}')
ylabel('Deviation from Steady State')
axis tight
subplot(ia, ib, 1)
plot(ss, premr(gg), ss, premr8(gg)*aa, 'o-')
title('A. Interest Rate Spread')
ylabel('Annual Basis Points')
axis tight
subplot(ia, ib, 3)
plot(ss, ir(gg), ss, ir8(gg)*aa, 'o-')
title('C. Investment')
ylabel({'Percent Deviation';'from Steady State'})
axis tight
subplot(ia, ib, 2)
plot(ss, creditr(gg), ss, creditr8(gg)*aa, 'o-')
title('B. Credit')
ylabel({'Percent Deviation';'from Steady State'})
axis tight
subplot(ia, ib, 5)
plot(ss, netwr(gg), ss, netwr8(gg)*aa, 'o-')
title('E. Net Worth')
ylabel({'Percent Deviation';'from Steady State'})
axis tight
subplot(ia, ib, 7)
plot(ss, sloper(gg), ss, sloper8(gg)*aa, 'o-')
title('G. Slope of Term Structure')
ylabel('Annual Basis Points')
axis tight

str = ['Figure 2. Dynamic Responses to Unanticipated '...
    'and Anticipated Components of the Risk Shock'];
hout = suptitle(str); 
cd ..
saveas(gcf, 'Figure2', 'pdf') %Save figure