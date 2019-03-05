%*****************************************************************
% Impulse Responses for:
% Simon Gilchrist, Raphael Schoenle, Jae Sim, and Egon Zakrajsek
% "Inflation Dynamics during the Financial Crisis"
% American Economic Review 2017, 107(3): 785–823
%*****************************************************************

clear all;
close all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/NK_GSSZ17_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare NK_GSSZ17_rep.mod noclearall nostrict;

figure(1)
subplot(3,3,1)
plot(-y_eD/oo_.mean(6)*100,'r-','LineWidth',2.0);hold on
plot(zeros(size(y_eA,1),1),'k:','LineWidth',1.0)
title('(a) output, %')
subplot(3,3,2)
plot(-h_eD/oo_.mean(7)*100,'r-','LineWidth',2.0);hold on
plot(zeros(size(y_eA,1),1),'k:','LineWidth',1.0)
title('(b) hours, %')
subplot(3,3,3)
plot(-pii_eD*400,'r-','LineWidth',2.0); hold on
plot(zeros(size(y_eA,1),1),'k:','LineWidth',1.0)
title('(c) inflation, p.p')
subplot(3,3,4)
plot(-w_eD/oo_.mean(11)*100,'r-','LineWidth',2.0);hold on
plot(zeros(size(y_eA,1),1),'k:','LineWidth',1.0)
title('(d) wage, %')
subplot(3,3,5)
plot(-mu_eD*100,'r-','LineWidth',2.0);hold on
plot(-zeros(size(y_eA,1),1),'k:')
title('(e) markup, p.p.')      
subplot(3,3,6)
plot(-xi_eD*100,'r-','LineWidth',2.0);hold on
plot(zeros(size(y_eA,1),1),'k:')
title('(f) value of intnl. funds, p.p.')
subplot(3,3,7)
plot(-v_eD/v(1)*100,'r-','LineWidth',2.0);hold on
plot(zeros(size(y_eA,1),1),'k:')
title('(g) value of sales, %')
subplot(3,3,8)
plot(-R_eD*400,'r-','LineWidth',2.0);hold on
plot(zeros(size(y_eA,1),1),'k:')
title('(h) risk free rate, p.p.')
 
subplot(3,3,1)
axis([0 20 -1.8 0.3])
subplot(3,3,2)
axis([0 20 -1.5 0.3])
subplot(3,3,3)
axis([0 20 -0.25 0.25])
subplot(3,3,4)
axis([0 20 -0.2 0.2])
subplot(3,3,5)
axis([0 20 -0.2 0.4])
subplot(3,3,6)
axis([0 20 -0.8 2.4])
subplot(3,3,7)
axis([0 20 -0.5 1.5])
subplot(3,3,8)
axis([0 20 -0.2 0.1])

print('NK_GSSZ17_irf_d','-dpdf','-fillpage')

cd ../