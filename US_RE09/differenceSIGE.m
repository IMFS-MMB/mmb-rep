%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file reproduces figure 1 in:  

% Ricardo Reis
% A Sticky-Information General-Equilibrium Model for Policy Analysis.
% In: Monetary Policy under Uncertainty and Learning, edited by K. Schmidt-Heubel, C. Walsh and N. Loayza, Central Bank of Chile, Santiago, 2009

% and the IRFs resulting from Dynare

% Written by: Fabio Verona (fabio.verona@bof.fi) 
%             and
%             Maik H. Wolters (maik.wolters.ifw-kiel.de)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_IRF_SIGE;

MR_SIGE_inflation_mp=IRF(:,1);MR_SIGE_inflation_a=IRF(:,2);MR_SIGE_inflation_g=IRF(:,3);MR_SIGE_inflation_nu=IRF(:,4);MR_SIGE_inflation_gam=IRF(:,5);
MR_SIGE_ir_mp=IRF(:,6);MR_SIGE_ir_a=IRF(:,7);MR_SIGE_ir_g=IRF(:,8);MR_SIGE_ir_nu=IRF(:,9);MR_SIGE_ir_gam=IRF(:,10);
MR_SIGE_hours_mp=IRF(:,11);MR_SIGE_hours_a=IRF(:,12);MR_SIGE_hours_g=IRF(:,13);MR_SIGE_hours_nu=IRF(:,14);MR_SIGE_hours_gam=IRF(:,15);
MR_SIGE_outputgap_mp=IRF(:,16);MR_SIGE_outputgap_a=IRF(:,17);MR_SIGE_outputgap_g=IRF(:,18);MR_SIGE_outputgap_nu=IRF(:,19);MR_SIGE_outputgap_gam=IRF(:,20);


tim=T;
tim=20;
tt=tim;

figure('color','w')
subplot(2,2,1)
plot(1:tt,pi_e_eps(1:tt)','-mo','LineWidth',2,'MarkerSize',10); hold on
plot(1:tt,pi_e_deltaa(1:tt)','-bo','LineWidth',2,'MarkerSize',10);hold on
plot(1:tt,pi_e_g(1:tt)','-ro','LineWidth',2,'MarkerSize',10);hold on
plot(1:tt,pi_e_nuu(1:tt)','-.co','LineWidth',2,'MarkerSize',10);hold on
plot(1:tt,pi_e_gam(1:tt)','--go','LineWidth',2,'MarkerSize',10); hold on
plot(1:tim,MR_SIGE_inflation_mp(1:tim),'-mx','LineWidth',2,'MarkerSize',10);hold on
plot(1:tim,MR_SIGE_inflation_a(1:tim),'-bx','LineWidth',2,'MarkerSize',10);hold on
plot(1:tim,MR_SIGE_inflation_g(1:tim),'-rx','LineWidth',2,'MarkerSize',10);hold on
plot(1:tim,MR_SIGE_inflation_nu(1:tim),'-.cx','LineWidth',2,'MarkerSize',10);hold on
plot(1:tim,MR_SIGE_inflation_gam(1:tim),'--gx','LineWidth',2,'MarkerSize',10);hold on
axis([1 tt -0.2 0.1]);
set(gca,'XTick',2:2:tt,'FontName','Palatino Linotype','FontSize',20)
title('Inflation','FontSize',20,'FontName','Palatino Linotype','FontWeight','Bold');

subplot(2,2,2)
plot(1:tim,MR_SIGE_ir_mp(1:tim),'-mx','LineWidth',2,'MarkerSize',10);hold on
plot(1:tim,MR_SIGE_ir_a(1:tim),'-bx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_ir_g(1:tim),'-rx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_ir_nu(1:tim),'-.cx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_ir_gam(1:tim),'--gx','LineWidth',2,'MarkerSize',10);
plot(1:tt,i_e_eps(1:tt)','-mo','LineWidth',2,'MarkerSize',10); 
plot(1:tt,i_e_deltaa(1:tt)','-bo','LineWidth',2,'MarkerSize',10);
plot(1:tt,i_e_g(1:tt)','-ro','LineWidth',2,'MarkerSize',10);
plot(1:tt,i_e_nuu(1:tt)','-.co','LineWidth',2,'MarkerSize',10);
plot(1:tt,i_e_gam(1:tt)','--go','LineWidth',2,'MarkerSize',10); 
axis([1 tt -0.4 0.1]);
set(gca,'XTick',2:2:tt,'FontName','Palatino Linotype','FontSize',20)
title('Nominal Interest Rate','FontSize',20,'FontName','Palatino Linotype','FontWeight','Bold');

subplot(2,2,3)
plot(1:tt,l_e_eps(1:tt)','-mo','LineWidth',2,'MarkerSize',10); hold on
plot(1:tt,l_e_deltaa(1:tt)','-bo','LineWidth',2,'MarkerSize',10);
plot(1:tt,l_e_g(1:tt)','-ro','LineWidth',2,'MarkerSize',10);
plot(1:tt,l_e_nuu(1:tt)','-.co','LineWidth',2,'MarkerSize',10);
plot(1:tt,l_e_gam(1:tt)','--go','LineWidth',2,'MarkerSize',10); 
plot(1:tim,MR_SIGE_hours_mp(1:tim),'-mx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_hours_a(1:tim),'-bx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_hours_g(1:tim),'-rx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_hours_nu(1:tim),'-.cx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_hours_gam(1:tim),'--gx','LineWidth',2,'MarkerSize',10);
axis([1 tt -1 1.5]);
set(gca,'XTick',2:2:tt,'FontName','Palatino Linotype','FontSize',20)
title('Hours','FontSize',20,'FontName','Palatino Linotype','FontWeight','Bold');

subplot(2,2,4)
plot(1:tt,outputgap_e_eps(1:tt)','-mo','LineWidth',2,'MarkerSize',10); hold on
plot(1:tt,outputgap_e_deltaa(1:tt)','-bo','LineWidth',2,'MarkerSize',10);
plot(1:tt,outputgap_e_g(1:tt)','-ro','LineWidth',2,'MarkerSize',10);
plot(1:tt,outputgap_e_nuu(1:tt)','-.co','LineWidth',2,'MarkerSize',10);
plot(1:tt,outputgap_e_gam(1:tt)','--go','LineWidth',2,'MarkerSize',10); 
plot(1:tim,MR_SIGE_outputgap_mp(1:tim),'-mx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_outputgap_a(1:tim),'-bx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_outputgap_g(1:tim),'-rx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_outputgap_nu(1:tim),'-.cx','LineWidth',2,'MarkerSize',10);
plot(1:tim,MR_SIGE_outputgap_gam(1:tim),'--gx','LineWidth',2,'MarkerSize',10);
axis([1 tt -0.8 0.4]);
set(gca,'XTick',2:2:tt,'FontName','Palatino Linotype','FontSize',20)
title('Output Gap','FontSize',20,'FontName','Palatino Linotype','FontWeight','Bold');
legend('Monetary VW14','Productvity VW14','Demand VW14','Goods Markup WV14','Wage Markup VW14','Monetary R09','Producitivty R09','Demand R09','Goods Markup WV14','Wage Markup VW14');


