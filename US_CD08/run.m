% Run and plot IRFs of replication file 

clear all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/US_CD08_rep']);

% Run replication dynare file
dynare US_CD08_rep

%For interest rate shock
yirfint = [0; y_e_r]; % output
invirfint =  [0; i_e_r];  % investment
hirfint =  [0; h_e_r]; % hours
rirfint =  [0; r_e_r]; % nominal interest rate

%For money demand shock
yirfmon = [0; y_u_b]; % output
invirfmon =  [0; i_u_b];  % investment
hirfmon =  [0; h_u_b]; % hours
rirfmon =  [0; r_u_b]; % nominal interest rate

% Go back to original path
cd('..');


% Plot replicated IRFs
t = 0:1:length(yirfmon)-1;
t2 = 1:1:length(yirfmon);
zeroline = ones(length(t),1)*0;

figure1 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Monetary Policy Shock (unit shock)');
subplot(2,2,1);
plot(t2,yirfint,'LineWidth',2);
axis([1 10 -0.5 0.01]);
%xlabel('quarters','FontSize',8);
title('OUTPUT','FontSize',10);

subplot(2,2,2);
plot(t2,invirfint,'LineWidth',2);
axis([1 10 -1.2 0.01]);
%xlabel('quarters','FontSize',8);
title('INVESTMENT','FontSize',10);

subplot(2,2,3);
plot(t2,hirfint,'LineWidth',2);
axis([1 10 -0.8 0.01]);
%xlabel('quarters','FontSize',8);
title('HOURS','FontSize',10);

subplot(2,2,4);
plot(t2,rirfint,'LineWidth',2);
axis([1 10 0 0.15]);
%xlabel('quarters','FontSize',8);
title('NOM. INT. RATE','FontSize',10);

figure2 = figure('PaperSize',[20.98 29.68],...
    'Name','Impulse Responses to a Money Demand Shock (unit shock)');
subplot(2,2,1);
plot(t2,yirfmon,'LineWidth',2);
axis([1 10 -0.2 0.05]);
%xlabel('quarters','FontSize',8);
title('OUTPUT','FontSize',10);

subplot(2,2,2);
plot(t2,invirfmon,'LineWidth',2);
axis([1 10 -0.4 0.1]);
%xlabel('quarters','FontSize',8);
title('INVESTMENT','FontSize',10);

subplot(2,2,3);
plot(t2,hirfmon,'LineWidth',2);
axis([1 10 -0.35 0.1]);
%xlabel('quarters','FontSize',8);
title('HOURS','FontSize',10);

subplot(2,2,4);
plot(t2,rirfmon,'LineWidth',2);
axis([1 10 -0.05 0.15]);
%xlabel('quarters','FontSize',8);
title('NOM. INT. RATE','FontSize',10);
