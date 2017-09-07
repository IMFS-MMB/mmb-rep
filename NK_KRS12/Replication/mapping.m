%%Replicating the impulse response graphs in Kannan et al.(2012)

clear all;
close all;
clc;


dynare macro5.mod;
dynare macro6.mod;
dynare macro7.mod;
load('taylor.mat');
load('augtaylor.mat');
load('prudaugtaylor.mat');
%Financial shocks
% con=[0.5*(taylor.c_eps_v'+taylor.cB_eps_v') 0.5*(augtaylor.c_eps_v'+augtaylor.cB_eps_v') 0.5*(prudaugtaylor.c_eps_v'+prudaugtaylor.cB_eps_v')];
% inv=[0.5*(taylor.i_eps_v'+taylor.iB_eps_v') 0.5*(augtaylor.i_eps_v'+augtaylor.iB_eps_v') 0.5*(prudaugtaylor.i_eps_v'+prudaugtaylor.iB_eps_v')];
con=[taylor.yC_eps_v' augtaylor.yC_eps_v' prudaugtaylor.yC_eps_v'];
inv=[taylor.yD_eps_v' augtaylor.yD_eps_v' prudaugtaylor.yD_eps_v'];
gdp=[taylor.y_eps_v' augtaylor.y_eps_v' prudaugtaylor.y_eps_v'];
cpi=[taylor.deltapC_eps_v' augtaylor.deltapC_eps_v' prudaugtaylor.deltapC_eps_v'];
housp=[taylor.deltapD_eps_v' augtaylor.deltapD_eps_v' prudaugtaylor.deltapD_eps_v'];
outputgap=[taylor.y_eps_v'-taylor.ystar_eps_v' augtaylor.y_eps_v'-augtaylor.ystar_eps_v' prudaugtaylor.y_eps_v'-prudaugtaylor.ystar_eps_v'];
r=[taylor.r_eps_v' augtaylor.r_eps_v' prudaugtaylor.r_eps_v'];
rL=[taylor.rL_eps_v' augtaylor.rL_eps_v' prudaugtaylor.rL_eps_v'];
debt=[taylor.deltabB_eps_v' augtaylor.deltabB_eps_v' prudaugtaylor.deltabB_eps_v'];

figure('name','Financial Shock','NumberTitle','off')
subplot(3,3,1); plot(con);title('Consumption');axis([0 30 -0.1 0.3]);
subplot(3,3,2); plot(inv);title('Res. Inv.');axis([0 30 -0.5 1]);
subplot(3,3,3); plot(gdp);title('Real GDP');axis([0 30 -0.1 0.3]);
subplot(3,3,4); plot(cpi);title('CPI Inflation');axis([0 30 -0.1 0.3]);
subplot(3,3,5); plot(housp);title('Nom. House Price Infl.');axis([0 30 -0.1 0.3]);
subplot(3,3,6); plot(outputgap);title('Output Gap');axis([0 30 -0.1 0.3]);
subplot(3,3,7); plot(r);title('Policy Rate');axis([0 30 -0.05 0.2]);
subplot(3,3,8); plot(rL); title('Lending Rate');axis([0 30 -0.3 0.1]);
subplot(3,3,9); plot(debt);title('Nominal Debt Growth');axis([0 30 -0.2 0.8]);
legend('Taylor','Aug.Taylor','Aug.Taylor+Reg.');


%Housing Demand Preference shock
% con2=[0.5*(taylor.c_eps_D'+taylor.cB_eps_D') 0.5*(augtaylor.c_eps_D'+augtaylor.cB_eps_D') 0.5*(prudaugtaylor.c_eps_D'+prudaugtaylor.cB_eps_D')];
% inv2=[0.5*(taylor.i_eps_D'+taylor.iB_eps_D') 0.5*(augtaylor.i_eps_D'+augtaylor.iB_eps_D') 0.5*(prudaugtaylor.i_eps_D'+prudaugtaylor.iB_eps_D')];
con2=[taylor.yC_eps_D' augtaylor.yC_eps_D' prudaugtaylor.yC_eps_D'];
inv2=[taylor.yD_eps_D' augtaylor.yD_eps_D' prudaugtaylor.yD_eps_D'];
gdp2=[taylor.y_eps_D' augtaylor.y_eps_D' prudaugtaylor.y_eps_D'];
cpi2=[taylor.deltapC_eps_D' augtaylor.deltapC_eps_D' prudaugtaylor.deltapC_eps_D'];
housp2=[taylor.deltapD_eps_D' augtaylor.deltapD_eps_D' prudaugtaylor.deltapD_eps_D'];
outputgap2=[taylor.y_eps_D'-taylor.ystar_eps_D' augtaylor.y_eps_D'-augtaylor.ystar_eps_D' prudaugtaylor.y_eps_D'-prudaugtaylor.ystar_eps_D'];
r2=[taylor.r_eps_D' augtaylor.r_eps_D' prudaugtaylor.r_eps_D'];
rL2=[taylor.rL_eps_D' augtaylor.rL_eps_D' prudaugtaylor.rL_eps_D'];
debt2=[taylor.deltabB_eps_D' augtaylor.deltabB_eps_D' prudaugtaylor.deltabB_eps_D'];

figure('name','Housing Demand Shock','NumberTitle','off')
subplot(3,3,1); plot(con2);title('Consumption');axis([0 30 -0.01 0.01]);
subplot(3,3,2); plot(inv2);title('Res. Inv.');axis([0 30 0 2.5]);
subplot(3,3,3); plot(gdp2);title('Real GDP');axis([0 30 0 0.25]);
subplot(3,3,4); plot(cpi2);title('CPI Inflation');axis([0 30 -0.02 0.02]);
subplot(3,3,5); plot(housp2);title('Nom. House Price Infl.');axis([0 30 -0.2 0.6]);
subplot(3,3,6); plot(outputgap2);title('Output Gap');axis([0 30 -0.1 0.15]);
subplot(3,3,7); plot(r2);title('Policy Rate');axis([0 30 -0.005 0.025]);
subplot(3,3,8); plot(rL2); title('Lending Rate');axis([0 30 -0.025 0.005]);
subplot(3,3,9); plot(debt2);title('Nominal Debt Growth');axis([0 30 -0.05 0.15]);
legend('Taylor','Aug.Taylor','Aug.Taylor+Reg.');

%Productivity shocks
% con1=[0.5*(taylor.c_eps_A'+taylor.cB_eps_A') 0.5*(augtaylor.c_eps_A'+augtaylor.cB_eps_A') 0.5*(prudaugtaylor.c_eps_A'+prudaugtaylor.cB_eps_A')];
% inv1=[0.5*(taylor.i_eps_A'+taylor.iB_eps_A') 0.5*(augtaylor.i_eps_A'+augtaylor.iB_eps_A') 0.5*(prudaugtaylor.i_eps_A'+prudaugtaylor.iB_eps_A')];
con1=[taylor.yC_eps_A' augtaylor.yC_eps_A' prudaugtaylor.yC_eps_A'];
inv1=[taylor.yD_eps_A' augtaylor.yD_eps_A' prudaugtaylor.yD_eps_A'];
gdp1=[taylor.y_eps_A' augtaylor.y_eps_A' prudaugtaylor.y_eps_A'];
cpi1=[taylor.deltapC_eps_A' augtaylor.deltapC_eps_A' prudaugtaylor.deltapC_eps_A'];
housp1=[taylor.deltapD_eps_A' augtaylor.deltapD_eps_A' prudaugtaylor.deltapD_eps_A'];
outputgap1=[taylor.y_eps_A'-taylor.ystar_eps_A' augtaylor.y_eps_A'-augtaylor.ystar_eps_A' prudaugtaylor.y_eps_A'-prudaugtaylor.ystar_eps_A'];
r1=[taylor.r_eps_A' augtaylor.r_eps_A' prudaugtaylor.r_eps_A'];
rL1=[taylor.rL_eps_A' augtaylor.rL_eps_A' prudaugtaylor.rL_eps_A'];
debt1=[taylor.deltabB_eps_A' augtaylor.deltabB_eps_A' prudaugtaylor.deltabB_eps_A'];

figure('Name','Productivity Shock','NumberTitle','off')
subplot(3,3,1); plot(con1);title('Consumption');axis([0 30 0 1.5]);
subplot(3,3,2); plot(inv1);title('Res. Inv.');axis([0 30 -1 2]);
subplot(3,3,3); plot(gdp1);title('Real GDP');axis([0 30 0 1.5]);
subplot(3,3,4); plot(cpi1);title('CPI Inflation');axis([0 30 -0.3 0.1]);
subplot(3,3,5); plot(housp1);title('Nom. House Price Infl.');axis([0 30 -0.4 0.6]);
subplot(3,3,6); plot(outputgap1);title('Output Gap');axis([0 30 -0.2 0.05]);
subplot(3,3,7); plot(r1);title('Policy Rate');axis([0 30 -0.2 0.05]);
subplot(3,3,8); plot(rL1); title('Lending Rate');axis([0 30 -0.2 0.2]);
subplot(3,3,9); plot(debt1);title('Nominal Debt Growth');axis([0 30 -0.2 0.6]);
legend('Taylor','Aug.Taylor','Aug.Taylor+Reg.');

