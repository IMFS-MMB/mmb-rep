% *********************************************************************
% Program to summarize stochastic simulation design and results.
%
% Inputs:
%   expver -- expectational version of the model
%   mprule -- monetary policy rule
%   asymqtrs -- number of quarters that the prescriptions of the
%     ADUR or AAIT rule were imposed on the expected path of the
%     federal funds rate 
%   elb_imposed -- indicator of whether the ELB was imposed 
%   elb, elbqtrs -- value of the ELB and the number of quarters it
%     was imposed on the expected path of the federal funds rate
%     (required only if elb_imposed="yes") 
%   ctp_option -- indicator of whether the cyclical components of
%     the Treasury term premium equations were modified 
%   tax_gamma -- output gap coefficient in the TRPTS equation 
%   ecfs_option -- indicator of whether extreme-case fiscal
%     stabilization was used 
%   ecfs_floor -- minimum allowed floor on the projected output gap
%     imposed by ECFS (required only if ecfs_option="yes")
%   track_names -- names of variables for which simulation results
%     were saved
%   residuals_file -- name of the spreadsheet containing historical
%     residuals of the main behavioral equations 
%   sample_range -- historical residual sample period used to
%     construct stochastic shocks
%   draw_method -- method used for construction stochastic shocks
%     from historical behavioral equation residuals 
%   res_drop -- if defined, names of behavioral equation shocks
%     excluded from the stochastic simulations 
%   nreplic, nsimqtrs -- number of simulated stochastic outcomes,
%     each nsimqtrs long 
%   rescale_wpshocks -- indicator of whether pre-1983 wage-price
%     shocks are rescaled so that variance matches post-1982 shocks  
%   ysave -- nreplic by nsimqtrs matrix holding simulation results
%     for the tracked variables 
%   pathinfo -- nreplic by nsimqtrs matrix holding information
%     about the future path of the federal funds rate expected in
%     each quarter of each outcome, plus details about convergence
%     and solution methods (structure depends on solution method)
% *********************************************************************
  


% ************************************************************
% Construct table of LR summary statistics for tracked series
% ************************************************************

if nsimqtrs > 100
    % Generate basic statistics for tracked variables, with results
    % rounded to 2 significant digits for tabling purposes
    sim_results = zeros(10,ntrack);
    for itrack = 1:ntrack
        yy = zeros(nsimqtrs,nreplic);
        yy(:,:) = ysave(itrack,:,:);
        aaa = sprintf('%s %s',track_names(itrack),'_mat = yy;');
        aaa = erase(aaa,' ');
        eval(aaa);
        zz = yy(101:nsimqtrs,:);
        ww = [1:(nsimqtrs-100)*nreplic];
        ww = zz(ww);
        ww = sort(ww);
        n = size(ww,2);
        sim_results(1,itrack) = round(mean(ww),2);
        sim_results(2,itrack) = round(median(ww),2);
        sim_results(3,itrack) = round(std(ww),2);
        sim_results(4,itrack) = round(skewness(ww),2);
        sim_results(5,itrack) = round(ww(1,round(.025*n)),2);
        sim_results(6,itrack) = round(ww(1,round(.05*n)),2);
        sim_results(7,itrack) = round(ww(1,round(.15*n)),2);
        sim_results(8,itrack) = round(ww(1,round(.85*n)),2);
        sim_results(9,itrack) = round(ww(1,round(.95*n)),2);
        sim_results(10,itrack) = round(ww(1,round(.975*n)),2);
    end 
    sumtab = array2table(sim_results);
    sumtab.Properties.VariableNames(1:ntrack) = track_names;
    sumtab.Properties.RowNames(1) = "mean";
    sumtab.Properties.RowNames(2) = "median";
    sumtab.Properties.RowNames(3) = "standard deviation";
    sumtab.Properties.RowNames(4) = "skew";
    sumtab.Properties.RowNames(5) = "lower 95 percent";
    sumtab.Properties.RowNames(6) = "lower 90 percent";
    sumtab.Properties.RowNames(7) = "lower 70 percent";
    sumtab.Properties.RowNames(8) = "upper 70 percent";
    sumtab.Properties.RowNames(9) = "upper 90 percent";
    sumtab.Properties.RowNames(10) = "upper 95 percent";
    
end    



% ************************************************************
% Assemble model information
% ************************************************************

titles = 'Model information    ';
values = ' ';
titles = strvcat(titles,'  Expectational version   ');
values = strvcat(values,expvers);
titles = strvcat(titles,'  Monetary policy rule   ');
values = strvcat(values,mprule);

model_info.expvers = expvers;
model_info.mprule = mprule;

if mprule == "adur" | mprule == "aait"
    titles = strvcat(titles,'    Length of nonlinear rule constraint'); 
    values = strvcat(values,num2str(asymqtrs));
    model_info.asymqtrs = asymqtrs;
end

titles = strvcat(titles,'  ELB imposed?    ');
values = strvcat(values,elb_imposed);
model_info.elb_imposed = elb_imposed;
if find(strcmp(elb_imposed,"yes"))
    titles = strvcat(titles,'    ELB value    ');
    values = strvcat(values,num2str(elb));
    titles = strvcat(titles,'    Length of ELB constraint    ');
    values = strvcat(values,num2str(elbqtrs));
    model_info.elb = num2str(elb);
    model_info.elbqtrs = num2str(elbqtrs);
end

display_maxfgq = 0;
titles = strvcat(titles,'  Unemployment threshold?');
if uthresh_imposed == "yes" & uthresh < 9999
    values = strvcat(values,'yes');
    model_info.uthresh_imposed = "yes";
    titles = strvcat(titles,'    threshold value');
    values = strvcat(values,num2str(uthresh,'%.2f'));
    model_info.uthresh = uthresh;
    display_maxfgq = 1;
else    
    values = strvcat(values,'no');
    model_info.uthresh_imposed = "no";
end

titles = strvcat(titles,'  Inflation threshold?');
if pithresh_imposed == "yes" & pithresh > -9999
    values = strvcat(values,'yes');
    model_info.piuthresh_imposed = "yes";
    titles = strvcat(titles,'    threshold variable');
    values = strvcat(values,pithresh_var);
    model_info.pithresh_var = pithresh_var;
    titles = strvcat(titles,'    threshold value');
    values = strvcat(values,num2str(pithresh,'%.2f'));
    model_info.pithresh = pithresh;
    display_maxfgq = 1;
else    
    values = strvcat(values,'no');
    model_info.pithresh_imposed = "no";
end

if display_maxfgq == 1
    titles = strvcat(titles,'  Length thresholds policy in force');
    values = strvcat(values,num2str(maxfgq,'%.0f'));
    model_info.maxfgq = maxfgq;
end

    

titles = strvcat(titles,'  ECFS option?    ');
if find(strcmp(ecfs_option,"yes"))
    values = strvcat(values,'yes');
    model_info.ecfs_option = ecfs_option;
    titles = strvcat(titles,'    ECFS floor'    );
    values = strvcat(values,num2str(ecfs_floor,'%.2f'));
    model_info.ecfs_floor = ecfs_floor;
else
    values = strvcat(values,'no');
    model_info.ecfs_option = ecfs_option;
end


titles = strvcat(titles,'  Cyclical term premium effects');
if ctp_option==0
    values = strvcat(values,'standard');
    model_info.ctp_option = "standard";
end
if ctp_option==1
    values = strvcat(values,'suppressed');
    model_info.ctp_option = "suppressed";
end
if ctp_option==2
    values = strvcat(values,'alternative');
    model_info.ctp_option = "alternative";
end

titles = strvcat(titles,'  TRPTS output gap coefficient');
values = strvcat(values,num2str(tax_gamma,'%.5f'));
model_info.taxgamma = tax_gamma;


% ************************************************************
% Assemble information about stochastic simulation parameters  
% ************************************************************

titles = strvcat(titles,blanks(1));
values = strvcat(values,blanks(1));

titles = strvcat(titles,'Stochastic simulation parameters');
values = strvcat(values,blanks(1));

titles = strvcat(titles,'  Number of replications');
values = strvcat(values,num2str(nreplic));
stochsim_info.nreplic = nreplic;
titles = strvcat(titles,'  Number of simulation quarters');
values = strvcat(values,num2str(nsimqtrs));
stochsim_info.nsimqtrs = nsimqtrs;
titles = strvcat(titles,'  Historical residuals drawn from ');
values = strvcat(values,residuals_file);
stochsim_info.residuals_file = residuals_file;
titles = strvcat(titles,'  Residual sample range');
values = strvcat(values,strcat(sample_range(1)," - ",sample_range(2)));
stochsim_info.sample_range = strjoin([sample_range(1),"-",sample_range(2)]);

titles = strvcat(titles,'  Pre-1983 wage-price shocks rescaled');
if rescale_wpshocks == "yes"
    values = strvcat(values,'yes');
else
    values = strvcat(values,'no');
end
stochsim_info.rescale_wpshocks = rescale_wpshocks;


if exist('res_drop')
    titles = strvcat(titles,'  Excluded shocks');
    a = "";
    for i = 1:size(res_drop,2)
        a = a + res_drop(i) + " ";
    end
    values = strvcat(values,a);
    stochsim_info.res_drop = res_drop;
end

titles = strvcat(titles,'  Sampling method');
values = strvcat(values,draw_method);
stochsim_info.draw_method = draw_method;
if draw_method == "state"
    z = state_mat;
    norm_freq = 100*size(z(z==3),1)/size(z(z<9999),1);
    mrec_freq = 100*size(z(z==2),1)/size(z(z<9999),1);
    srec_freq = 100*size(z(z==1),1)/size(z(z<9999),1);
    titles = strvcat(titles,'    Normal state freq');
    values = strvcat(values,num2str(norm_freq,'%.2f'));
    titles = strvcat(titles,'    Mild recessionary state freq');
    values = strvcat(values, num2str(mrec_freq,'%.2f'));
    titles = strvcat(titles,'    Severe recessionary state freq');
    values = strvcat(values,num2str(srec_freq,'%.2f'));
    stochsim_info.norm_freq = norm_freq;
    stochsim_info.mrec_freq = mrec_freq;
    stochsim_info.srec_freq = srec_freq;
end
              
titles = strvcat(titles,blanks(1));
values = strvcat(values,blanks(1));

runtime = toc/60;
titles = strvcat(titles,'Run time in minutes');
values = strvcat(values,num2str(runtime,'%.2f'));




% ************************************************************
% Assemble information about expected funds rate paths
% ************************************************************

if elb_imposed == "yes"
    titles = strvcat(titles,blanks(1));
    values = strvcat(values,blanks(1));
    titles = strvcat(titles,'Expected paths:  ELB');
    values = strvcat(values,blanks(1));
    z = pathinfo(:,:,3);
    fconst = 100*size(z(z>0),1)/size(z(z<9999),1);
    mqconst = mean(z(z>0));
    titles = strvcat(titles,'  Percent of paths with binding ELB');
    values = strvcat(values,num2str(fconst,'%.2f'));
    exppaths_info.elb.fconst = fconst;
    titles = strvcat(titles,'  Mean ELB quarters along constrained paths');
    values = strvcat(values,num2str(mqconst,'%.2f'));
    exppaths_info.elb.mqconst = mqconst;
    z = pathinfo(:,:,4);
    nelbfails = size(z(z<-elb_epsi),1);
    freqfails = 100*nelbfails/(.01*fconst*nreplic*nsimqtrs);
    nbigfails = size(z(z<-.25),1);
    freqbigfails = 100*nbigfails/(.01*fconst*nreplic*nsimqtrs);
    titles = strvcat(titles,'  Percent of constrained paths with ELB violations ');
    values = strvcat(values,num2str(freqfails,'%.2f'));  
    exppaths_info.elb.freqfails = freqfails;
    if size(z(z<-elb_epsi),1) > 0
        melbfail = mean(z(z<-elb_epsi));
        titles = strvcat(titles,'  Mean ELB violation along constrained paths ');
	values = strvcat(values,num2str(melbfail,'%.2f')); 
        exppaths_info.elb.melbfail = melbfail;
    end
end



% ************************************************************
% Assemble convergence information 
% ************************************************************

if elb_imposed == "yes"
    titles = strvcat(titles,blanks(1));
    values = strvcat(values,blanks(1));
    titles = strvcat(titles,'Expected paths:  convergence information');
    values = strvcat(values,blanks(1));
    z = pathinfo(:,:,5);
    if uthresh_imposed == "no" & pithresh_imposed == "no"
        z0 = z(z~=-9999);
        z1 = z0((z0>0)&(z0<1000));
        z2 = z0(z0>1000);
        z3 = z0(z0==(-1000));
        ols_freq = 100*size(z1,1)/size(z0,1);
        molsiter = mean(z1);
        nneg_freq = 100*size(z2,1)/size(z0,1);
        nconv_freq = 100*size(z3,1)/size(z0,1);
        titles = strvcat(titles,'  Mean iterations for adjusted paths');
        values = strvcat(values,num2str(molsiter,'%.2f'));
        titles = strvcat(titles,'  For paths with ELB forces the percent:');
        values = strvcat(values,blanks(1));
	exppaths_info.convergence.ols_freq = ols_freq;
        titles = strvcat(titles,'    Solved by OLS');
        values = strvcat(values,num2str(ols_freq,'%.2f'));
	exppaths_info.convergence.ols_freq = ols_freq;
        titles = strvcat(titles,'    Solved by LSQNONNEG');
        values = strvcat(values,num2str(nneg_freq,'%.2f'));
	exppaths_info.convergence.nneg_freq = nneg_freq;
        titles = strvcat(titles,'    Failed to converge');
        values = strvcat(values,num2str(nconv_freq,'%.2f'));
	exppaths_info.convergence.nconv_freq = nconv_freq;
    else
        zall = z(z~=-9999);
        z0 = zall(zall==0);
        z1 = zall(zall==1);
        z2 = zall(zall==2);
        z3 = zall(zall==3);
        case0_freq = 100*size(z0,1)/size(zall,1);
        case1_freq = 100*size(z1,1)/size(zall,1);
        case2_freq = 100*size(z2,1)/size(zall,1);
        case3_freq = 100*size(z3,1)/size(zall,1);
        titles = strvcat(titles,['  For paths with threshold forces, the percent with:']);
        values = strvcat(values,blanks(1));
        titles = strvcat(titles,'    A clean liftoff point');
        values = strvcat(values,num2str(case0_freq,'%.2f'));
	exppaths_info.convergence.case0_freq = case0_freq;
        titles = strvcat(titles,'    A fuzzy liftoff point');
        values = strvcat(values,num2str(case2_freq,'%.2f'));
	exppaths_info.convergence.case2_freq = case2_freq;
        titles = strvcat(titles,'    All quarters forced w/o thresholds satisfied');
        values = strvcat(values,num2str(case1_freq,'%.2f'));
	exppaths_info.convergence.case1_freq = case1_freq;
        titles = strvcat(titles,'    Convergence failure');
        values = strvcat(values,num2str(case3_freq,'%.2f'));
	exppaths_info.convergence.case3_freq = case3_freq;
    end
end

if mprule == "aait" | mprule == "adur"
    z1 = pathinfo(:,:,7);
    z2 = pathinfo(:,:,8);
    asymterm_fail_freq = 100*size(z1(z1==0),1)/size(z1(z1>-9999),1);
    titles = strvcat(titles,'  For paths with AAIT/ADUR rule adjs, percent that:');
    values = strvcat(values,blanks(1));
    titles = strvcat(titles,'    Converged');
    values = strvcat(values,num2str(100-asymterm_fail_freq,'%.2f')); 
    titles = strvcat(titles,'    Failed to converge');
    values = strvcat(values,num2str(asymterm_fail_freq,'%.2f'));
    exppaths_info.convergence.asymterm_fail_freq = asymterm_fail_freq;
    if size(z1(z1==0),1) > 0
        masymterm_miss = mean(z2(z1==0));
        titles = strvcat(titles,'      (mean max abs discrepency)');
        values = strvcat(values,num2str(masymterm_miss,'%.2f'));
        exppaths_info.convergence.masymterm_miss = masymterm_miss;
    end
end

if ecfs_option == "yes"
    z1 = pathinfo(:,:,11);
    z2 = pathinfo(:,:,12);
    fshockfail_freq = 100*size(z2(z2==0),1)/size(z1(z1>0),1);
    titles = strvcat(titles,'  For paths with ECFS shocks, the percent that:');
    values = strvcat(values,blanks(1));
    titles = strvcat(titles,'    Converged');
    values = strvcat(values,num2str(100-fshockfail_freq,'%.2f'));
    titles = strvcat(titles,'    Failed to converge');
    values = strvcat(values,num2str(fshockfail_freq,'%.2f'));
    exppaths_info.convergence.fshockfail_freq = fshockfail_freq;
end
    

% ************************************************************
% Assemble LR statistics
% ************************************************************

if nsimqtrs > 100

    titles = strvcat(titles,' '); 
    values = strvcat(values,' ');

    titles = strvcat(titles,strcat("Actual paths:  long-run statistics (qtrs 101-",num2str(nsimqtrs),")"));
    values = strvcat(values,blanks(1));

    % Loss
    z1 = xgap2_mat(101:nsimqtrs,:);
    z2 = pic4_mat(101:nsimqtrs,:);
    loss = sum(sum(z1.^2+z2.^2))/(nreplic*(nsimqtrs-100));
    titles = strvcat(titles,'  Loss');
    values = strvcat(values,string(num2str(loss,'%.2f')));
    longrun_info.loss = loss;

    % Simulated ELB frequency
    if elb_imposed == "yes"
        rtest_mat = rff_mat(101:nsimqtrs,:) - elb;
        binding = (rtest_mat<=elb_epsi & rtest_mat>=-elb_epsi);
        elbfreq = 100*mean(mean(binding));
        a = '  Percent of all quarters funds rate at the ELB';
        titles = strvcat(titles,a);
        values = strvcat(values,string(num2str(elbfreq,'%.2f')));
        longrun_info.elbfreq = elbfreq;
    end

   % Average duration of ELB episodes
    if elb_imposed == "yes"
        elbdur = [1:nreplic]*0;
        nelb = [1:nreplic]*0;
        for ireplic = 1:nreplic
            nelb(ireplic) = 0;
            z = find(binding(:,ireplic)==1);
            nz = size(z,1);
            if nz > 0
                nelb(ireplic) = 1;
                for i = 2:nz
                    if z(i) > z(i-1)+1
                        nelb(ireplic) = nelb(ireplic) + 1;
                    end
                end
            end
            if nelb(ireplic) > 0
                elbdur(ireplic) = sum(binding(:,ireplic))/nelb(ireplic);
            end
        end
        melbdur = mean(elbdur);
        a = "  Mean duration of ELB episodes ";
        titles = strvcat(titles,a);
        values = strvcat(values,string(num2str(melbdur,'%.2f')));
        longrun_info.melbdur = melbdur;
    end	

    
    % Simulated LR frequency of ECFS shocks
    if ecfs_option == "yes"
        z = pathinfo(:,101:nsimqtrs,11);
        fshockfreq = 100*size(z(z>0),1)/size(z(z<9999),1);
        mfshock = mean(z(z>0));
        a = '  Percent of all quarters with an ECFS shock';
        titles = strvcat(titles,a);
        values = strvcat(values,num2str(fshockfreq,'%.2f')); 
        titles = strvcat(titles,'      Mean ECFS shock');
        values = strvcat(values,num2str(mfshock,'%.2f'));
        longrun_info.fshockfreq = fshockfreq;
        longrun_info.mfshock = mfshock;
    end
       
    % Simulated frequency of recessions, defined as 2 or more
    % consecutive quarters of negative LEP growth
    gneg = -1.0/400;
    n = nsimqtrs;
    recess = zeros(n-101,nreplic);
    z1 = lep_l_mat(101:n-1,:)-lep_l_mat(100:n-2,:);
    z2 = lep_l_mat(100:n-2,:)-lep_l_mat( 99:n-3,:);
    z3 = lep_l_mat(102:n,  :)-lep_l_mat(101:n-1,:);
    for ireplic = 1:nreplic
        for iqtr = 1:n-101
            i = iqtr;
            j = ireplic;
            if z1(i,j)<gneg & (z2(i,j)<gneg | z3(i,j)<gneg) 
                recess(iqtr,ireplic) = 1;
            end
        end
    end
    recess_freq = 100*mean(mean(recess));
    a = "  Percent of all quarters in recession";
    titles = strvcat(titles,a);
    values = strvcat(values,string(num2str(recess_freq,'%.2f')));
    longrun_info.recess_freq = recess_freq;

    % Average duration of simulated recessions
    dur = [1:nreplic]*0;
    for ireplic = 1:nreplic
        nrecess = 0;
        z = find(recess(:,ireplic)==1);
        nz = size(z,1);
        if nz > 0
            nrecess = 1;
            for i = 2:nz
                if z(i) > z(i-1)+1
                    nrecess = nrecess + 1;
                end
            end
        end
        if nrecess > 0
            dur(ireplic) = sum(recess(:,ireplic))/nrecess;
        end
    end
    mdur = mean(dur);
    a = "  Mean duration of recessions ";
    titles = strvcat(titles,a);
    values = strvcat(values,string(num2str(mdur,'%.2f')));
    longrun_info.mdur = mdur;
    
    % Average depth of simulated recessions
    mxmin = [1:nreplic]*0-9999;
    mumax = [1:nreplic]*0-9999;
    for ireplic = 1:nreplic
        z = find(recess(:,ireplic)==1);
        nz = size(z,1);
        if nz > 0
            n = 1;
            fini = 0;
            nrecess = 1;
            while fini < 1 
                sq = z(n);
                eq = z(n);
                tn = n;
                gotn = 0;
                while gotn < 1
                    tn = tn + 1;
                    if tn <=nz
                        if z(tn) > z(tn-1)+1
                            eq = z(tn-1);
                            gotn = 1;
                        end
                        if z(tn) == z(tn-1)+1 & tn == nz
                            eq = z(tn);
                            gotn = 1;
                        end
                    else
                        gotn = 1;
                    end
                end
                if nrecess == 1
                    xmin = min(xgap2_mat(100+sq:100+eq,ireplic));
                    umax = max(ugap_mat(100+sq:100+eq,ireplic));
                else
                    xmin = [xmin,min(xgap2_mat(100+sq:100+eq,ireplic))];
                    umax = [umax,max(ugap_mat(100+sq:100+eq,ireplic))];
                end
                n = tn;
                if n <= nz
                    nrecess = nrecess + 1;
                else
                    fini = 1;
                end
            end
            mxmin(ireplic) = mean(xmin);
            mumax(ireplic) = mean(umax);
        end
    end
    mdepth1 = mean(mxmin(find(mxmin>-9999)));
    mdepth2 = mean(mumax(find(mumax>-9999)));
    a = "  Average minimum output gap in recessions";
    titles = strvcat(titles,a);
    values = strvcat(values,string(num2str(mdepth1,'%.2f')));
    longrun_info.mdepth1 = mdepth1;
    a = "  Average maximum unemployment gap in recessions     ";
    titles = strvcat(titles,a);
    values = strvcat(values,string(num2str(mdepth2,'%.2f')));
    longrun_info.mdepth1 = mdepth2;
    
end


% ************************************************************
% Combine all information in the infotab character array
% ************************************************************

j1 = numel(titles);
infotab = horzcat(titles,values);
disp("  ");
disp("  ");
disp(infotab)


if nsimqtrs > 100
    disp("  ");
    disp("  ");
    disp(strcat("Long-Run Distributional Statistics (qtrs 101-",num2str(nsimqtrs),")"));
    disp("*************************************************");
    disp(sumtab)
else
    disp("No long-run statistics computed (nsimqtrs<=100)")
end


%***********************************************************
% optionally save stochastic simulation information to disk
%***********************************************************

if save_option == "full" | save_option == "limited"
    fname = save_name;
    disp(compose("Writing output to: %s",fname));
    save(fname,'runtime');
    save(fname,'model_info','-append');
    save(fname,'stochsim_info','-append');
    if exist('exppaths_info')
        save(fname,'exppaths_info','-append');
    end  
    save(fname,'longrun_info','-append');
    save(fname,'sumtab','-append');
    save(fname,'infotab','-append');
    save(fname,'sim_results','-append');
    save(fname,'track_names','-append');
end

if save_option == "full"
    for i = 1:numel(track_names)
        aaa = strcat(track_names(i),'_mat');
        save(fname,aaa,'-append');
    end
end

