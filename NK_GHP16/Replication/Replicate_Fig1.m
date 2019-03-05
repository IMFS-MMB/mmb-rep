clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/NK_GHP16_rep']);


b_1_all     =   [0.000001 1/3 0.636 3/4];  
C_m_b_1   = zeros(4,20);
Y_b_1   = zeros(4,20);
h_m_b_1   = zeros(4,20);
W_b_1   = zeros(4,20);

for i = 1:4;
b_1     =   b_1_all(i);
save parameterfile b_1
dynare simple_model;
C_m_b_1(i,:) = oo_.irfs.C_m_e_g*C_m_ss/Y_ss
Y_b_1(i,:) = oo_.irfs.Y_e_g
h_m_b_1(i,:) = oo_.irfs.h_m_e_g
W_b_1(i,:) = oo_.irfs.W_e_g
end;

%%
figure (1)
subplot(2,2,1);
plot(C_m_b_1(1,:),'ko-')
hold on
plot(C_m_b_1(2,:), 'k.-')
hold on
plot(C_m_b_1(3,:), 'k*-')
hold on
plot(C_m_b_1(4,:), 'kd-')
hold on
grid on
title('Market Consumption')

subplot(2,2,2);
plot(Y_b_1(1,:),'ko-')
hold on
plot(Y_b_1(2,:), 'k.-')
hold on
plot(Y_b_1(3,:), 'k*-')
hold on
plot(Y_b_1(4,:), 'kd-')
hold on
grid on
title('GDP')

subplot(2,2,3);
plot(h_m_b_1(1,:),'ko-')
hold on
plot(h_m_b_1(2,:), 'k.-')
hold on
plot(h_m_b_1(3,:), 'k*-')
hold on
plot(h_m_b_1(4,:), 'kd-')
hold on
grid on
title('Market hours')
xlabel('Quarters')

subplot(2,2,4);
plot(W_b_1(1,:),'ko-')
hold on
plot(W_b_1(2,:), 'k.-')
hold on
plot(W_b_1(3,:), 'k*-')
hold on
plot(W_b_1(4,:), 'kd-')
hold on
grid on
title('Real Wages')
xlabel('Quarters')

legend('(1-b_1)^{-1}=1','(1-b_1)^{-1}=1.5','(1-b_1)^{-1}=2.75','(1-b_1)^{-1}=4')


