%*****************************************************************
% impulse response functions for Poutineau, J.C. and Vermandel, G. (2015) for:
% a productivity shock in core countries
% a net wealth shock in core countries
% a liabilities shock in core countries
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/EA_PV15_rep']);

%%%%%%%%%%%%%%
%run mod-file 
%%%%%%%%%%%%%%

dynare EA_PV15_bg_rep;

y_h_bg_a = y_h_e_a_h;
c_h_bg_a = c_h_e_a_h;
y_ea_bg_a = y_ea_e_a_h;
y_f_bg_a = y_f_e_a_h;
c_f_bg_a = c_f_e_a_h;

y_h_bg_nw = y_h_e_n_h;
c_h_bg_nw = c_h_e_n_h;
y_ea_bg_nw = y_ea_e_n_h;
y_f_bg_nw = y_f_e_n_h;
c_f_bg_nw = c_f_e_n_h;

y_h_bg_l = y_h_e_ib_h;
c_h_bg_l = c_h_e_ib_h;
y_ea_bg_l = y_ea_e_ib_h;
y_f_bg_l = y_f_e_ib_h;
c_f_bg_l = c_f_e_ib_h;

save('results.mat', 'y_h_bg_a', 'c_h_bg_a', 'y_ea_bg_a', 'y_f_bg_a', 'c_f_bg_a', 'y_h_bg_nw', 'c_h_bg_nw', 'y_ea_bg_nw', 'y_f_bg_nw', 'c_f_bg_nw', 'y_h_bg_l','c_h_bg_l','y_ea_bg_l','y_f_bg_l','c_f_bg_l');

dynare EA_PV15_a_rep;

y_h_a_a = y_h_e_a_h;
c_h_a_a = c_h_e_a_h;
y_ea_a_a = y_ea_e_a_h;
y_f_a_a = y_f_e_a_h;
c_f_a_a = c_f_e_a_h;

y_h_a_nw = y_h_e_n_h;
c_h_a_nw = c_h_e_n_h;
y_ea_a_nw = y_ea_e_n_h;
y_f_a_nw = y_f_e_n_h;
c_f_a_nw = c_f_e_n_h;

y_h_a_l = y_h_e_ib_h;
c_h_a_l = c_h_e_ib_h;
y_ea_a_l = y_ea_e_ib_h;
y_f_a_l = y_f_e_ib_h;
c_f_a_l = c_f_e_ib_h;

save('results.mat', 'y_h_a_a', 'c_h_a_a', 'y_ea_a_a', 'y_f_a_a', 'c_f_a_a', 'y_h_a_nw', 'c_h_a_nw', 'y_ea_a_nw', 'y_f_a_nw', 'c_f_a_nw','y_h_a_l','c_h_a_l','y_ea_a_l','y_f_a_l','c_f_a_l', '-append' );


load('results.mat');
nul=zeros(24,1);
t=1:1:24;


% productivity shock
figure1= figure('name','IRFs to a productivity shock in core countries','numbertitle','off')
subplot(3,2,1),
hold on  
plot(t,y_h_bg_a,'b','LineWidth',1.5);  
plot(t,y_h_a_a,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
legend('With cross-border banking','Banking autarky')
hold off
title('Production core');

subplot(3,2,2);
hold on  
plot(t,c_h_bg_a,'b','LineWidth',1.5);  
plot(t,c_h_a_a,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Consumption core');

subplot(3,2,3);
hold on  
plot(t,y_ea_bg_a,'b','LineWidth',1.5);  
plot(t,y_ea_a_a,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Production EA');

subplot(3,2,4);
hold on  
plot(t,y_f_bg_a,'b','LineWidth',1.5);  
plot(t,y_f_a_a,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Production periphery');

subplot(3,2,5);
hold on  
plot(t,c_f_bg_a,'b','LineWidth',1.5);  
plot(t,c_f_a_a,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Consumption periphery');


% net wealth shock
figure2= figure('name','IRFs to a net wealth shock in core countries','numbertitle','off')

subplot(3,2,1),
hold on  
plot(t,y_h_bg_nw,'b','LineWidth',1.5);  
plot(t,y_h_a_nw,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
legend('With cross-border banking','Banking autarky')
hold off
title('Production core');

subplot(3,2,2);
hold on  
plot(t,c_h_bg_nw,'b','LineWidth',1.5);  
plot(t,c_h_a_nw,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Consumption core');

subplot(3,2,3);
hold on  
plot(t,y_ea_bg_nw,'b','LineWidth',1.5);  
plot(t,y_ea_a_nw,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Production EA');

subplot(3,2,4);
hold on  
plot(t,y_f_bg_nw,'b','LineWidth',1.5);  
plot(t,y_f_a_nw,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Production periphery');

subplot(3,2,5);
hold on  
plot(t,c_f_bg_nw,'b','LineWidth',1.5);  
plot(t,c_f_a_nw,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Consumption periphery');

% shock in liabilities
figure3= figure('name','IRFs to a liabilities shock in core countries','numbertitle','off')
subplot(3,2,1),
hold on  
plot(t,y_h_bg_l,'b','LineWidth',1.5);  
plot(t,y_h_a_l,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
legend('With cross-border banking','Banking autarky')
hold off
title('Production core');

subplot(3,2,2);
hold on  
plot(t,c_h_bg_l,'b','LineWidth',1.5);  
plot(t,c_h_a_l,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Consumption core');

subplot(3,2,3);
hold on  
plot(t,y_ea_bg_l,'b','LineWidth',1.5);  
plot(t,y_ea_a_l,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Production EA');

subplot(3,2,4);
hold on  
plot(t,y_f_bg_l,'b','LineWidth',1.5);  
plot(t,y_f_a_l,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Production periphery');

subplot(3,2,5);
hold on  
plot(t,c_f_bg_l,'b','LineWidth',1.5);  
plot(t,c_f_a_l,'.-r','LineWidth',1.5);                   
plot(t,nul,'r');
hold off
title('Consumption periphery');
