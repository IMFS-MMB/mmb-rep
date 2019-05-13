clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/NK_GHP16_rep']);

dynare NK_GHP16_rep

%%

b_1_all     =   [0.000001 3/4]; 

Y_b_1   = [];
%C_m_b_1   = zeros(4,20);
%h_m_b_1   = zeros(4,20);
%I_b_1   = zeros(4,20);

for i = 1:size(b_1_all,2);
b_1     =   b_1_all(i);
save parameterfile b_1
dynare NK_GHP16_rep;
Y_b_1(1,i) = oo_.irfs.Y_e_g(1,1)
C_m_b_1(1,i) = oo_.irfs.C_m_e_g(1,1)*C_m_ss/Y_ss
h_m_b_1(1,i) = oo_.irfs.h_m_e_g(1,1) % not multiplied by h_m_ss/Y_ss
I_b_1(1,i) = oo_.irfs.I_e_g(1,1)*I_ss/Y_ss
end;

%%
elast_title = 1./(1-b_1_all);
elast_title = elast_title';

x=[2.75 2.75];
y_Y=[0.8 1.4];
y_C_m=[-0.1 0.4];
y_h_m=[0.8 1.4];
y_I=[-0.15 0.05];

figure (2)
subplot(2,2,1);
plot(elast_title,Y_b_1(1,:)','k-','LineWidth',2)
hold on;
line(x,y_Y,'Color','red','LineStyle','--');
grid on
axis([1.5 4 -Inf Inf])
title('GDP')

subplot(2,2,2);
plot(elast_title,C_m_b_1(1,:)','k-','LineWidth',2)
hold on;
line(x,y_C_m,'Color','red','LineStyle','--');
grid on
axis([1.5 4 -Inf Inf])
title('Market Consumption')

subplot(2,2,3);
plot(elast_title,h_m_b_1(1,:)','k-','LineWidth',2)
hold on;
line(x,y_h_m,'Color','red','LineStyle','--');
grid on
axis([1.5 4 -Inf Inf])
title('Market Hours')
xlabel('$\displaystyle \frac{1}{1-b_1}$','Interpreter','Latex')

subplot(2,2,4);
plot(elast_title,I_b_1(1,:)','k-','LineWidth',2)
hold on;
line(x,y_I,'Color','red','LineStyle','--');
grid on
axis([1.5 4 -Inf Inf])
title('Investment')
xlabel('$\displaystyle \frac{1}{1-b_1}$','Interpreter','Latex')