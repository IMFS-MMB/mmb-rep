
clear all
%close all
clc
cd('replication')
dynare US_LTW17_rep

nStates = M_.endo_nbr;
nInnovations = M_.exo_nbr;
vEndoNames = M_.endo_names;
invDRorder = oo_.dr.inv_order_var;

iSmin = M_.nstatic + 1;
iSmax = M_.nstatic + M_.nspred;
AA0 = zeros(nStates,nStates);
AA0(:,iSmin:iSmax) = oo_.dr.ghx;
AA = AA0(invDRorder,invDRorder);
BB0 = oo_.dr.ghu(invDRorder,:);

oSigma2 = M_.Sigma_e;
BB = BB0*oSigma2*BB0';

%The (V)AR(1)-form solution looks as follows:
%x_t = C + Gmatrix*x_{t-1} + Wmatrix*shocks
%in our case C=oo_.dr.ys, see also below
Gmatrix=AA;
Wmatrix=BB0;


nvar=49;
nexog=8;
steps=80;

    imf = zeros(nvar,nexog,steps);	
    imf(:,:,1) = Wmatrix;
    for t = 2:steps
        imf(:,:,t) = Gmatrix*imf(:,:,t-1);
    end
    imf = imf(:,:,1:steps);
    %eliminate very small responses
    for i = 1:nvar
        for j = 1:nexog
             for k = 1:steps
                if abs(imf(i,j,k))<10^-10
                    imf(i,j,k) = 0;
                end
             end
        end
    end                               
                               
% -------------------------------------------------------------------------
% Convert government spending shock to present-value multipliers 
% -------------------------------------------------------------------------
    shock_pos = 1;  % government spending shock ordered first
    r = Rss; gc= gcss; c=css; y=yss; inv=invss;
    % Initializations
    rtemp_ugc = zeros(steps,1);
    GCtemp_ugc = zeros(steps,1);
    Ctemp_ugc = zeros(steps,1);
    Ytemp_ugc = zeros(steps,1);
    Itemp_ugc = zeros(steps,1);
 
    rtemp_ugc(:,1) = r*(1+0.01*imf(20,shock_pos,:));
    GCtemp_ugc(:,1) = gc*(0.01*imf(9,shock_pos,:));
    Ctemp_ugc(:,1) = c*(0.01*imf(10,shock_pos,:));
    Ytemp_ugc(:,1) = y*0.01*(imf(8,shock_pos,:));
    Itemp_ugc(:,1) = inv*0.01*(imf(4,shock_pos,:));

    disc = zeros(steps,1);
    %Construct discount factor
    disc(1,1) = 1;
    for i =2:steps
        disc(i,1) = disc(i-1,1)*rtemp_ugc(i,1);
    end

    discC_ugc = zeros(steps,1);
    discI_ugc = zeros(steps,1);
    discY_ugc = zeros(steps,1);
    discGC_ugc = zeros(steps,1);

    %convert imuplse responses in goods units to PV
    for i=1:steps
        discC_ugc(i,1) = Ctemp_ugc(i,1)/disc(i,1);
        discI_ugc(i,1) = Itemp_ugc(i,1)/disc(i,1);
        discY_ugc(i,1) = Ytemp_ugc(i,1)/disc(i,1);
        discGC_ugc(i,1) = GCtemp_ugc(i,1)/disc(i,1);
    end
   
    multi_ugc = zeros(steps,3);
    for i = 1:steps
        cumy_ugc = sum(discY_ugc(1:i,:))/sum(discGC_ugc(1:i,:));
        cumc_ugc = sum(discC_ugc(1:i,:))/sum(discGC_ugc(1:i,:));
        cumi_ugc = sum(discI_ugc(1:i,:))/sum(discGC_ugc(1:i,:));
        multi_ugc(i,:) = [cumy_ugc cumc_ugc cumi_ugc];
    end

    imf(8,shock_pos,1:steps) = multi_ugc(1:steps,1)';
    imf(10,shock_pos,1:steps) = multi_ugc(1:steps,2)';
    imf(4,shock_pos,1:steps) = multi_ugc(1:steps,3)';
    
    cd('..')
%% Make figure
figure(1)
m = 3;
n = 4;
Time = 1:steps;
subplot(m,n,1)
x1 = squeeze(imf(8,shock_pos,1:steps));
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Output Multiplier','FontSize',11,'FontWeight','bold')

subplot(m,n,2)
x1 = squeeze(imf(10,shock_pos,1:steps));
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Consumption Multiplier','FontSize',11,'FontWeight','bold')

subplot(m,n,3)
x1 = squeeze(imf(4,shock_pos,1:steps));
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Investment Multiplier','FontSize',11,'FontWeight','bold')

subplot(m,n,4)
x1 = squeeze(imf(3,shock_pos,1:steps))*400;
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Nominal Interest Rate','FontSize',11,'FontWeight','bold')

subplot(m,n,5)
x1 = squeeze(imf(14,shock_pos,1:steps))*400;
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Inflation','FontSize',11,'FontWeight','bold')

subplot(m,n,6)
x1 = squeeze(imf(20,shock_pos,1:steps))*400;
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Real Interest Rate','FontSize',11,'FontWeight','bold')

subplot(m,n,7)
x1 = squeeze(imf(15,shock_pos,1:steps));
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Mkt Value Debt','FontSize',11,'FontWeight','bold')

subplot(m,n,8)
x1 = squeeze(imf(27,shock_pos,1:steps))*400;
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Long-Run Inflation','FontSize',11,'FontWeight','bold')

subplot(m,n,9)
x1 = squeeze(imf(28,shock_pos,1:steps))*400;
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Long-Run Real Rate','FontSize',11,'FontWeight','bold')

subplot(m,n,10)
x1 = squeeze(imf(13,shock_pos,1:steps));
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Real Wage','FontSize',11,'FontWeight','bold')

subplot(m,n,11)
x1 = squeeze(imf(7,shock_pos,1:steps));
plot(Time,x1,'g-','Linewidth',1.5);
axis tight
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Labor','FontSize',11,'FontWeight','bold')

subplot(m,n,12)
x1 = squeeze(imf(29,shock_pos,1:steps));
plot(Time,x1,'g-','Linewidth',1.5);
yPos = 0.0;
hold on
plot(get(gca,'xlim'),[yPos yPos],'k:'); % Adapts to x limits of current axes
hold off
title('Primary Surplus','FontSize',11,'FontWeight','bold')
