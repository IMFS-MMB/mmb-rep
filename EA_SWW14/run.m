% Adjust path to folder where replication file is stored
cd([cd '/EA_SWW14_rep']);
dynare EA_SWW14_rep

close all;

%% Figure 2 replication
linewidth = 1.5;
b=zeros(21,1);
figure(1)
plot(0:20,oo_.irfs.y_etab,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.y_etag, '-g','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.y_etar, '-b','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.y_etaq, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k');
hold on
plot(0:20,(b+0.5),':k');
hold on
ylim([-0.5 1])
legend('risk premium','exogenenous spending','monetary policy','investment-specific')
title('Output')

figure(2)
plot(0:20,oo_.irfs.piyear_etab,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.piyear_etag, '-g','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.piyear_etar, '-b','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.piyear_etaq, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k');
hold on
plot(0:20,(b+0.05),':k');
hold on
plot(0:20,(b+0.1),':k');
hold on
ylim([-0.05 0.15])
title('Inflation')

figure(3)
plot(0:20,oo_.irfs.ryear_etab,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ryear_etag, '-g','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ryear_etar, '-b','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ryear_etaq, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k');
hold on
ylim([-0.5 0.5])
title('Interest Rate')

figure(4)
plot(0:20,oo_.irfs.e_etab,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.e_etag, '-g','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.e_etar, '-b','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.e_etaq, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k');
hold on
plot(0:20,(b+0.3),':k');
hold on
plot(0:20,(b+0.2),':k');
hold on
plot(0:20,(b+0.1),':k');
hold on
ylim([-0.1 0.4])
title('Employment')

figure(5)
plot(0:20,oo_.irfs.u_etab,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.u_etag, '-g','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.u_etar, '-b','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.u_etaq, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k');
hold on
plot(0:20,(b-0.1),':k');
hold on
plot(0:20,(b-0.2),':k');
hold on
plot(0:20,(b-0.3),':k');
hold on
ylim([-0.4 0.1])
title('Unemployment')

figure(6)
plot(0:20,oo_.irfs.ygap_etab,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ygap_etag, '-g','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ygap_etar, '-b','LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ygap_etaq, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k');
hold on
plot(0:20,(b+0.5),':k');
hold on
ylim([-0.5 1])
title('Output Gap')

%% Figure 3 replication
linewidth = 1.5;
b=zeros(21,1);
figure(7)
plot(0:20,oo_.irfs.y_etaa,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.y_etap, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b+0.5),':k')
hold on
ylim([-0.5 1])
legend('productivity','price markup')
title('Output')


figure(8)
plot(0:20,oo_.irfs.piyear_etaa,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.piyear_etap, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b-0.1),':k')
hold on
plot(0:20,(b-0.2),':k')
hold on
plot(0:20,(b-0.3),':k')
hold on
ylim([-0.4 0.1])
title('Inflation')


figure(9)
plot(0:20,oo_.irfs.ryear_etaa,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ryear_etap, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b-0.1),':k')
hold on
plot(0:20,(b-0.2),':k')
hold on
ylim([-0.3 0.11])
title('Interest Rate')


figure(10)
plot(0:20,oo_.irfs.e_etaa,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.e_etap, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b-0.05),':k')
hold on
plot(0:20,(b+0.05),':k')
hold on
ylim([-0.1 0.1])
title('Employment')

figure(11)
plot(0:20,oo_.irfs.u_etaa,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.u_etap, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b-0.05),':k')
hold on
plot(0:20,(b+0.05),':k')
hold on
ylim([-0.1 0.1])
title('Unemployment')

figure(12)
plot(0:20,oo_.irfs.ygap_etaa,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ygap_etap, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b-0.2),':k')
hold on
plot(0:20,(b-0.4),':k')
hold on
plot(0:20,(b-0.6),':k')
hold on
ylim([-0.8 0.2])
title('Output Gap')

%% Figure 4 replication
linewidth = 1.5;
b=zeros(21,1);
figure(13)
plot(0:20,oo_.irfs.y_etaw,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.y_etas, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b-0.1),':k')
hold on
plot(0:20,(b-0.2),':k')
hold on
ylim([-0.3 0.11])
legend('wage markup','labor supply')
title('Output')


figure(14)
plot(0:20,oo_.irfs.piyear_etaw,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.piyear_etas, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b+0.05),':k')
hold on
plot(0:20,(b+0.1),':k')
hold on
plot(0:20,(b+0.15),':k')
hold on
ylim([0 0.2])
title('Inflation')

figure(15)
plot(0:20,oo_.irfs.ryear_etaw,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ryear_etas, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b+0.1),':k')
hold on
plot(0:20,(b+0.05),':k')
hold on
ylim([-0.05 0.15])
title('Interest Rate')

figure(16)
plot(0:20,oo_.irfs.e_etaw,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.e_etas, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b-0.05),':k')
hold on
plot(0:20,(b-0.15),':k')
hold on
plot(0:20,(b-0.1),':k')
hold on
ylim([-0.2 0])
title('Employment')



figure(17)
plot(0:20,oo_.irfs.u_etaw,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.u_etas, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b-0.1),':k')
hold on
plot(0:20,(b+0.1),':k')
hold on
ylim([-0.2 0.2])
title('Unemployment')

figure(18)
plot(0:20,oo_.irfs.ygap_etaw,'-k', 'LineWidth',linewidth)
hold on
plot(0:20,oo_.irfs.ygap_etas, '-r','LineWidth',linewidth)
hold on
plot(0:20,b,'-k')
hold on
plot(0:20,(b+0.1),':k')
hold on
plot(0:20,(b+0.05),':k')
hold on
plot(0:20,(b-0.05),':k')
hold on
ylim([-0.1 0.15])
title('Output Gap')
