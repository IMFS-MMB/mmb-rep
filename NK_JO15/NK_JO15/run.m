%*****************************************************************
% impulse response functions for Tae-Seok Jang, Eiji Okano (2015) for:
% a foreign productivity policy shock 
%*****************************************************************

clear all;
clc;

%adjust path to folder where replication file is stored
cd([cd '/NK_JO15_rep']);

%%%%%%%%%%%%%%
%run mod-files 
%%%%%%%%%%%%%%

dynare NK_JO15_lt_rep;
p_star_lt = oo_.irfs.p_star_xi_star';
e_lt = oo_.irfs.e_xi_star';
s_lt = oo_.irfs.s_xi_star';
q_lt = oo_.irfs.q_xi_star';


save('results.mat', 'p_star_lt', 'e_lt', 's_lt', 'q_lt' );

dynare NK_JO15_ht_rep;
p_star_ht = oo_.irfs.p_star_xi_star';
e_ht = oo_.irfs.e_xi_star';
s_ht = oo_.irfs.s_xi_star';
q_ht = oo_.irfs.q_xi_star';


save('results.mat', 'p_star_ht', 'e_ht', 's_ht', 'q_ht' );


load('results.mat');
nul=zeros(40,1);
t=1:1:40;


% foreign productivity shock

figure1= figure('name','Low level of trade','numbertitle','off')
subplot(2,2,1);
plot(t,p_star_lt,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
title('p star');

subplot(2,2,2);
plot(t,e_lt,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('e');

subplot(2,2,3);
plot(t,s_lt,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('s');

subplot(2,2,4);
plot(t,q_lt,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('q');


figure2= figure('name', 'High level of trade','numbertitle','off')
subplot(2,2,1);
plot(t,p_star_ht,'b','LineWidth',1.5);           hold on          
plot(t,nul,'r');
title('p star');

subplot(2,2,2);
plot(t,e_ht,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('e');

subplot(2,2,3);
plot(t,s_ht,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('s');

subplot(2,2,4);
plot(t,q_ht,'b','LineWidth',1.5);              hold on
plot(t,nul,'r');
title('q');



