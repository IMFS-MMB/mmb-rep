% Run 

% Housekeeping.
    clear all;
    clc;
    close all;

% Adjust path to folder where replication file is stored
    cd([cd '/NK_GK13_rep']);

% Run replication dynare file
    dynare NK_GK13_rep

% Plots:
    IRF_len_gross = length(Ym);
    IRF_len_net = 500;
    IRF_max   =   (IRF_len_gross-1);
    IRF_min   =   ((IRF_len_gross-1)-IRF_len_net+1);
    Gamma_e_Gamma=Gamma(IRF_min:IRF_max);
    Y_e_Gamma=Y(IRF_min:IRF_max);
    infl_e_Gamma=infl(IRF_min:IRF_max);
    R_e_Gamma=R(IRF_min:IRF_max);
    Q_e_Gamma=Q(IRF_min:IRF_max);
    N_e_Gamma=N(IRF_min:IRF_max);
    prem_K_e_Gamma=prem_K(IRF_min:IRF_max);
    ir_e_Gamma=ir(IRF_min:IRF_max);

    figure ;
    subplot(2,4,1);
    plot(1:40,100*Gamma_e_Gamma(1:40),'black','LineWidth',1.5);
    title('Central bank purchases')
    ylabel('%\Delta from SS')
    subplot(2,4,2);
    plot(1:40,100*Y_e_Gamma(1:40),'black','LineWidth',1.5);
    title('Y')
    subplot(2,4,3);
    plot(1:40,400*infl_e_Gamma(1:40),'black','LineWidth',1.5);
    title('\pi')
    subplot(2,4,4);
    plot(1:40,400*ir_e_Gamma(1:40),'black','LineWidth',1.5);
    title('i')
    subplot(2,4,5);
    plot(1:40,400*R_e_Gamma(1:40),'black','LineWidth',1.5);
    title('R')
    ylabel('%\Delta from SS')
    subplot(2,4,6);
    plot(1:40,100*Q_e_Gamma(1:40),'black','LineWidth',1.5);
    title('Q')
    subplot(2,4,7);
    plot(1:40,100*N_e_Gamma(1:40),'black','LineWidth',1.5);
    title('N')
    subplot(2,4,8);
    plot(1:40,400*prem_K_e_Gamma(1:40),'black','LineWidth',1.5);
    title('E(R_k)-R')
    legend('Gov. bond purchases', 'Position', [211,14,2,2])
