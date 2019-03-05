%% Monetary policy spillovers, global commodity prices and cooperation
% by A. Filardo, M. Lombardi, C. Montoro and M. Ferrari


%%
clear all;
clc;
close all;

% adjust path to folder where replication file is stored
cd([cd '/NK_FLMF18']);

%% IRFs with Taylor rule
dynare NK_FLMF18;

figure(1)
subplot(2,3,1)
plot(164*X_EZ)
title('Fringe Supply')
subplot(2,3,2)
plot(164*Q_EZ)
title('Commodity Price')
subplot(2,3,3)
plot(164*R_EZ)
title('Interest Rate')
subplot(2,3,4)
plot(164*PI_EZ)
title('Inflation')
subplot(2,3,5)
plot(164*Y_EZ)
title('Output')
subplot(2,3,6)
plot(164*Y_gap_EZ)
title('Output Gap')
saveas(1, '..\Supply_shock.png')

