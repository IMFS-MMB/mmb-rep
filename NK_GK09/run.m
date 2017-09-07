% Replication file NK_GK09

% prepared by Tong Wang and Xiaobei He, Goethe University Frankfurt

clear all;
close all;
clc;

% Adjust path to folder where replication file is stored
cd([cd '/NK_GK09_rep']);

dynare NK_GK09_rep.mod


t=1:1:40;

figure
subplot (4,3,1),plot (t,epsilon_e_epsilon),title('xi')
subplot (4,3,2),plot (t,r_e_epsilon*4),title('R')
axis([1 40 -0.05 0.05])
axis([1 40 -0.05 0.05])
subplot (4,3,3),plot (t,efp_e_epsilon*4),title('Rk-R')
subplot (4,3,4),plot (t,y_e_epsilon),title('Y')
axis([1 40 -0.07 0.05])
subplot (4,3,5),plot (t,c_e_epsilon),title('C')
axis([1 40 -0.06 0])
subplot (4,3,6),plot (t,i_e_epsilon),title('I')
axis([1 40 -0.3 0.2])

subplot (4,3,7),plot (t,k_e_epsilon),title('K')
axis([1 40 -0.2 0])
subplot (4,3,8),plot (t,l_e_epsilon),title('L')
axis([1 40 -0.04 0.04])
subplot (4,3,9),plot (t,q_e_epsilon),title('Q')
axis([1 40 -0.1 0.1])
subplot (4,3,10),plot (t,n_e_epsilon),title('N')
axis([1 40 -1 0])
subplot (4,3,11),plot (t,pi_e_epsilon*4),title('PI')
axis([1 40 -0.05 0.05])
subplot (4,3,12),plot (t,rn_e_epsilon*4),title('i')
axis([1 40 -0.07 0.05])

