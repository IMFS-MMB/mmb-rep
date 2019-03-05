%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This program uses US_BKM12_**_rep to recover inflation simulations from       %
% bimonthly versions of SW (2007). It constructs reset price inflation as well. %
% - It then calculates some moments (std dev, ser corr) and                     %              
% 	impulse response functions of these time series.			                %
% - Note that moments and IRFs are calculated for several short			        %
%	simulations of model to get standard errors.				                %
% - If samperror == 1, calculates moments twice, w/ & w/o sampling error        %
%										                                        %
% BAM, 6/15/11, revised 8/10/11                                                 %
% Changnam Son, 26/04/18, revised as a file for MMB replication package       	%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
clear;
clc;
close all;

samperror = 0;

cd([cd '/US_BKM12_rep']);

%%%%%%%%%%% Run simulation (change to relevant model name) %%%%%%%%%%%

%dynare US_BKM12_41_rep;		                    %Modern sample (89-09) and consumption deflator [Table 4(1)];
%dynare US_BKM12_42_rep;		                %no price markup shocks [4(2)];
%dynare US_BKM12_43_rep; 		                %BLS frequency+no price indexation [4(3)];
dynare US_BKM12_44_5_61_rep;     	            %BLS frequency+no price indexation+no price markup shocks [4(4)(=5(1)), 5(2)(=6(1))]
%dynare US_BKM12_62_rep;                        %minus kinks for final goods and labor [6(2)];
%dynare US_BKM12_63_rep;                    	%minus (kinks for final goods and labor+wage indexation and sticky wages) [6(3)];


samperror = 1;				%Adds sampling error to (reset) inflation if = 1, no samp error if = 0;

%Slope of SR Phillips Curve (With indexing);
Slope1 = (1/(1+cbetabar*cgamma*cindp)) *((1-cprobp)*(1-cbetabar*cgamma*cprobp)/cprobp)/((cfc-1)*curvp+1) % This is for mc
%Slope2 = (1/(1+cbetabar*cgamma*cindp)) * cbetabar*cgamma  % This is for Pi(+1)
%Slope3 = (1/(1+cbetabar*cgamma*cindp)) * cindp            % This is for Pi(-1) 

%Slope of SR Phillips Curve (Without indexing);
%Slope1 = (1-cbetabar*cgamma*cprobp)*(1-cprobp*cpie^(1/(clandap-1)))^(clandap)/cprobp/(1-cprobp)^(clandap-1)/cpie^(1/(clandap-1))/((clandap-1)*curvp+1)
%Slope2 = cbetabar*cgamma* (cprobp + (1-cprobp*cpie^(1/(clandap-1)))^(clandap)/(1-cprobp)^(clandap-1)/cpie^(1+1/(clandap-1))) 

if (samperror == 1)
  % Variables used for data input
  %********************************
  cd([cd '/StatCFS']);
  outind = 0;
  s1 = 'StatCFS_';
  s3 =  '_se.txt';

 for ii = 1:10
  
    % Read in data to be filtered
    %********************************
  
    outind = outind + 1;
    s2 = int2str(outind);
    myinfile = strcat(s1,s2,s3);

    % open file
    in = fopen(myinfile,'rt');     % 'rt' means "read text"
    if (in < 0)
      error('could not open file myinfile');
    end;

    % read from file into table with 8 rows and 1 column per line
    tab = fscanf(in,'%g %g %g %g %g %g %g %g \n',[8,inf]);

    % close the file
    fclose(in);
    rtab = tab';          % convert to 8 columns and 1 row per line
    
    if (ii == 1)
	rtable = rtab;
    else
    	rtable = [rtable;rtab];
    end
  end
  clear outind s1 s3 s2 myinfile in tab rtab
  pi_se = rtable(:,3);
  pi_star_se = rtable(:,6);
end

cd('..');  
cd('..');
%Settings
l = 16; %length of IRF

%Recover inflation and marginal cost series
pi = pinf(2:end,1);
margc = mc(2:end,1);
pshock = spinf(2:end,1);
gy = y(2:end,1) - y(1:end-1,1);
%gy_flex = yf(2:end,1) - yf(1:end-1,1);
nomgy = pi + gy;

%Calculate pistar series
pi_old = [NaN; pi(1:end-1,1)];
pi_star = (pi - cprobp*pi_old)/(1-cprobp);  %(Note: If indexation, pi_star = pi.);

pi_star = pi_star(2:end,1);
pi = pi(2:end,1);
margc = margc(2:end,1);
pshock = pshock(2:end,1);
gy = gy(2:end,1);
%gy_flex = gy_flex(2:end,1);
nomgy = nomgy(2:end,1);

[n,z] = size(pi);

%%% Split data into nsamp samples, each of nobs observations;
nsamp = 100;
nobs = 119;
for j=1:nsamp,
    pitemp(:,j) = pi(201+(j-1)*nobs:200+j*nobs,1);
    pi_startemp(:,j) = pi_star(201+(j-1)*nobs:200+j*nobs,1);
    mctemp(:,j) = margc(201+(j-1)*nobs:200+j*nobs,1); 	
    pstemp(:,j) = pshock(201+(j-1)*nobs:200+j*nobs,1); 	
    gytemp(:,j) = gy(201+(j-1)*nobs:200+j*nobs,1); 	
%    gyftemp(:,j) = gy_flex(201+(j-1)*nobs:200+j*nobs,1); 	
    nomgytemp(:,j) = nomgy(201+(j-1)*nobs:200+j*nobs,1); 	
end
pi = pitemp; % nobs x nsamp matrix;
pi_star = pi_startemp; % nobs x nsamp matrix;
margc = mctemp; % nobs x nsamp matrix;
pshock = pstemp; % nobs x nsamp matrix;
gy = gytemp; % nobs x nsamp matrix;
%gy_flex = gyftemp; % nobs x nsamp matrix;
nomgy = nomgytemp; % nobs x nsamp matrix;

%%% Calculate mean and standard deviation of standard deviation of pi, pi_star, mc, price shocks, and output growth;
Pi_sd = std(pi);
Pi_sd_m = mean(Pi_sd')
Pi_sd_sd = std(Pi_sd')
rPi_sd = std(pi_star);
rPi_sd_m = mean(rPi_sd')
rPi_sd_sd = std(rPi_sd')
mc_sd = std(margc);
mc_sd_m = mean(mc_sd')
mc_sd_sd = std(mc_sd')
ps_sd = std(pshock);
ps_sd_m = mean(ps_sd')
ps_sd_sd = std(ps_sd')
gy_sd = std(gy);
gy_sd_m = mean(gy_sd')
gy_sd_sd = std(gy_sd')
%gy_flex_sd = std(gy_flex);
%gy_flex_sd_m = mean(gy_flex_sd')
%gy_flex_sd_sd = std(gy_flex_sd')
nomgy_sd = std(nomgy);
nomgy_sd_m = mean(nomgy_sd')
nomgy_sd_sd = std(nomgy_sd')

%%% Calculate mean and standard deviation of serial correlation of pi, pi_star;
for j=1:nsamp,
  temp1 = corrcoef(pi(1:end-1,j),pi(2:end,j));
  Pi_sc(j,1) = temp1(1,2);
  temp2 = corrcoef(pi_star(1:end-1,j),pi_star(2:end,j));
  rPi_sc(j,1) = temp2(1,2);
  temp3 = corrcoef(margc(1:end-1,j),margc(2:end,j));
  mc_sc(j,1) = temp3(1,2);
  temp4 = corrcoef(pshock(1:end-1,j),pshock(2:end,j));
  ps_sc(j,1) = temp4(1,2);
end
clear temp1 temp2 temp3 temp4;
Pi_sc_m = mean(Pi_sc)
Pi_sc_sd = std(Pi_sc)
rPi_sc_m = mean(rPi_sc)
rPi_sc_sd = std(rPi_sc)
mc_sc_m = mean(mc_sc)
mc_sc_sd = std(mc_sc)
ps_sc_m = mean(ps_sc)
ps_sc_sd = std(ps_sc)

%%% Calculate impulse response function (and standard errors) for pi, pi_star;

%Run ARMA(6,6) for each of nsamp samples;
for j=1:nsamp,

  %Demean and set the pi data as a time series object
  tseries = pi(:,j) - mean(pi(:,j));
  data = iddata(tseries,[],1);

  %Estimate the ARMA(6,6) and calculate the constant
  m = armax(data,[6 6]);
  constant(:,j) = sum(m.A)*mean(pi(:,j));
  ARcoeff(:,j) = m.A';
  MAcoeff(:,j) = m.C';

  %Demean and set the pi_star data as a time series object
  tseries = pi_star(:,j) - mean(pi_star(:,j));
  data = iddata(tseries,[],1);

  %Estimate the ARMA(6,6) and calculate the constant
  mstar = armax(data,[6 6]);
  constantstar(:,j) = sum(mstar.A)*mean(pi_star(:,j));
  ARcoeffstar(:,j) = mstar.A';
  MAcoeffstar(:,j) = mstar.C';
end

%Calculate and plot IRF from ARMA(6,6)
series = zeros(l+1,nsamp);
ps_series = zeros(l+1,nsamp);

for j=1:nsamp,
	
	e_t(j) = 1;
	e_tl1(j) = 0;
	e_tl2(j) = 0;
	e_tl3(j) = 0;
	e_tl4(j) = 0;
	e_tl5(j) = 0;
	e_tl6(j) = 0;

	y_t(j) = 1;
	y_tl1(j) = 0;
	y_tl2(j) = 0;
	y_tl3(j) = 0;
	y_tl4(j) = 0;
	y_tl5(j) = 0;
	y_tl6(j) = 0;
  	series(2,j) = y_t(j);

	ps_e_t(j) = 1;
	ps_e_tl1(j) = 0;
	ps_e_tl2(j) = 0;
	ps_e_tl3(j) = 0;
	ps_e_tl4(j) = 0;
	ps_e_tl5(j) = 0;
	ps_e_tl6(j) = 0;

	ps_y_t(j) = 1;
	ps_y_tl1(j) = 0;
	ps_y_tl2(j) = 0;
	ps_y_tl3(j) = 0;
	ps_y_tl4(j) = 0;
	ps_y_tl5(j) = 0;
	ps_y_tl6(j) = 0;
  	ps_series(2,j) = ps_y_t(j);

  	for i=3:l+1
    	  e_tl6(j) = e_tl5(j);
    	  e_tl5(j) = e_tl4(j);
    	  e_tl4(j) = e_tl3(j);
    	  e_tl3(j) = e_tl2(j);
    	  e_tl2(j) = e_tl1(j);
    	  e_tl1(j) = e_t(j);
    	  e_t(j) = 0;

    	  y_tl6(j) = y_tl5(j);
    	  y_tl5(j) = y_tl4(j);
    	  y_tl4(j) = y_tl3(j);
    	  y_tl3(j) = y_tl2(j);
    	  y_tl2(j) = y_tl1(j);
    	  y_tl1(j) = y_t(j);

    	  y_t(j) = [e_t(j),e_tl1(j),e_tl2(j),e_tl3(j),e_tl4(j),e_tl5(j),e_tl6(j)]*MAcoeff(:,j) - [y_tl1(j),y_tl2(j),y_tl3(j),y_tl4(j),y_tl5(j),y_tl6(j)]*ARcoeff(2:end,j);
    	  series(i,j) = y_t(j);

    	  ps_e_tl6(j) = ps_e_tl5(j);
    	  ps_e_tl5(j) = ps_e_tl4(j);
    	  ps_e_tl4(j) = ps_e_tl3(j);
    	  ps_e_tl3(j) = ps_e_tl2(j);
    	  ps_e_tl2(j) = ps_e_tl1(j);
    	  ps_e_tl1(j) = ps_e_t(j);
    	  ps_e_t(j) = 0;

    	  ps_y_tl6(j) = ps_y_tl5(j);
    	  ps_y_tl5(j) = ps_y_tl4(j);
    	  ps_y_tl4(j) = ps_y_tl3(j);
    	  ps_y_tl3(j) = ps_y_tl2(j);
    	  ps_y_tl2(j) = ps_y_tl1(j);
    	  ps_y_tl1(j) = ps_y_t(j);

    	  ps_y_t(j) = [ps_e_t(j),ps_e_tl1(j),ps_e_tl2(j),ps_e_tl3(j),ps_e_tl4(j),ps_e_tl5(j),ps_e_tl6(j)]*MAcoeffstar(:,j) - [ps_y_tl1(j),ps_y_tl2(j),ps_y_tl3(j),ps_y_tl4(j),ps_y_tl5(j),ps_y_tl6(j)]*ARcoeffstar(2:end,j);
    	  ps_series(i,j) = ps_y_t(j);
  	end

  	%figure(2*i+2);
  	%plot(1:l+1,series)
  	%title(['IRF of ARMA(6,6) on ' char(A(i)) ' Simulated from SW (2007)'])
end
cumseries = cumsum(series);
ps_cumseries = cumsum(ps_series);

%Calculate average and standard deviation of cumulative IRFs
mean_irf_pi = mean(cumseries,2)
std_irf_pi = std(cumseries,0,2)
mean_irf_pi_star = mean(ps_cumseries,2)
std_irf_pi_star = std(ps_cumseries,0,2)

%%If adding sampling error
if (samperror == 1)

 %Recover inflation series
 pi = pinf(2:end,1);
 
 %Calculate pistar series
 pi_old = [NaN; pi(1:end-1,1)];
 pi_star = (pi - cprobp*pi_old)/(1-cprobp);  %(Note: If indexation, pi_star = pi.); 

 pi_star = pi_star(2:end,1);
 pi = pi(2:end,1); 
 
 factor = 0.0329*var(pi(end-11999:end,1))/(0.9671*var(pi_se))
 temp = [sqrt(factor)*pi_se, pi(end-11999:end,1)];
 stats = cov(temp)
 relvar = stats(1,1)/(stats(1,1)+stats(2,2))
 pi_star = pi_star(end-11999:end,1) + sqrt(factor)*pi_star_se;
 pi = pi(end-11999:end,1) + sqrt(factor)*pi_se;
 clear factor temp stats relvar
 
 [n,z] = size(pi);

 %%% Split data into nsamp samples, each of nobs observations;
 nsamp = 100;
 nobs = 119;
 for j=1:nsamp,
     pitemp(:,j) = pi(101+(j-1)*nobs:100+j*nobs,1);
     pi_startemp(:,j) = pi_star(101+(j-1)*nobs:100+j*nobs,1);
 end
 pi = pitemp; % nobs x nsamp matrix;
 pi_star = pi_startemp; % nobs x nsamp matrix;
 
 %%% Calculate mean and standard deviation of standard deviation of pi, pi_star;
 Pi_sd = std(pi);
 Pi_sd_m = mean(Pi_sd')
 Pi_sd_sd = std(Pi_sd')
 rPi_sd = std(pi_star);
 rPi_sd_m = mean(rPi_sd')
 rPi_sd_sd = std(rPi_sd')
 
 %%% Calculate mean and standard deviation of serial correlation of pi, pi_star;
 for j=1:nsamp,
   temp1 = corrcoef(pi(1:end-1,j),pi(2:end,j));
   Pi_sc(j,1) = temp1(1,2);
   temp2 = corrcoef(pi_star(1:end-1,j),pi_star(2:end,j));
   rPi_sc(j,1) = temp2(1,2);
 end
 clear temp1 temp2;
 Pi_sc_m = mean(Pi_sc)
 Pi_sc_sd = std(Pi_sc)
 rPi_sc_m = mean(rPi_sc)
 rPi_sc_sd = std(rPi_sc)
 
 %%% Calculate impulse response function (and standard errors) for pi, pi_star;

 %Run ARMA(6,6) for each of nsamp samples;
 for j=1:nsamp,
 
   %Demean and set the pi data as a time series object
   tseries = pi(:,j) - mean(pi(:,j));
   data = iddata(tseries,[],1);
 
   %Estimate the ARMA(6,6) and calculate the constant
   m = armax(data,[6 6]);
   constant(:,j) = sum(m.A)*mean(pi(:,j));
   ARcoeff(:,j) = m.A';
   MAcoeff(:,j) = m.C';
 
   %Demean and set the pi_star data as a time series object
   tseries = pi_star(:,j) - mean(pi_star(:,j));
   data = iddata(tseries,[],1);
 
   %Estimate the ARMA(6,6) and calculate the constant
   mstar = armax(data,[6 6]);
   constantstar(:,j) = sum(mstar.A)*mean(pi_star(:,j));
   ARcoeffstar(:,j) = mstar.A';
   MAcoeffstar(:,j) = mstar.C';
 end

 %Calculate and plot IRF from ARMA(6,6)
 series = zeros(l+1,nsamp);
 ps_series = zeros(l+1,nsamp);
 
 for j=1:nsamp,
	
	e_t(j) = 1;
	e_tl1(j) = 0;
	e_tl2(j) = 0;
	e_tl3(j) = 0;
	e_tl4(j) = 0;
	e_tl5(j) = 0;
	e_tl6(j) = 0;

	y_t(j) = 1;
	y_tl1(j) = 0;
	y_tl2(j) = 0;
	y_tl3(j) = 0;
	y_tl4(j) = 0;
	y_tl5(j) = 0;
	y_tl6(j) = 0;
  	series(2,j) = y_t(j);

	ps_e_t(j) = 1;
	ps_e_tl1(j) = 0;
	ps_e_tl2(j) = 0;
	ps_e_tl3(j) = 0;
	ps_e_tl4(j) = 0;
	ps_e_tl5(j) = 0;
	ps_e_tl6(j) = 0;

	ps_y_t(j) = 1;
	ps_y_tl1(j) = 0;
	ps_y_tl2(j) = 0;
	ps_y_tl3(j) = 0;
	ps_y_tl4(j) = 0;
	ps_y_tl5(j) = 0;
	ps_y_tl6(j) = 0;
  	ps_series(2,j) = ps_y_t(j);

  	for i=3:l+1
    	  e_tl6(j) = e_tl5(j);
    	  e_tl5(j) = e_tl4(j);
    	  e_tl4(j) = e_tl3(j);
    	  e_tl3(j) = e_tl2(j);
    	  e_tl2(j) = e_tl1(j);
    	  e_tl1(j) = e_t(j);
    	  e_t(j) = 0;

    	  y_tl6(j) = y_tl5(j);
    	  y_tl5(j) = y_tl4(j);
    	  y_tl4(j) = y_tl3(j);
    	  y_tl3(j) = y_tl2(j);
    	  y_tl2(j) = y_tl1(j);
    	  y_tl1(j) = y_t(j);

    	  y_t(j) = [e_t(j),e_tl1(j),e_tl2(j),e_tl3(j),e_tl4(j),e_tl5(j),e_tl6(j)]*MAcoeff(:,j) - [y_tl1(j),y_tl2(j),y_tl3(j),y_tl4(j),y_tl5(j),y_tl6(j)]*ARcoeff(2:end,j);
    	  series(i,j) = y_t(j);

    	  ps_e_tl6(j) = ps_e_tl5(j);
    	  ps_e_tl5(j) = ps_e_tl4(j);
    	  ps_e_tl4(j) = ps_e_tl3(j);
    	  ps_e_tl3(j) = ps_e_tl2(j);
    	  ps_e_tl2(j) = ps_e_tl1(j);
    	  ps_e_tl1(j) = ps_e_t(j);
    	  ps_e_t(j) = 0;

    	  ps_y_tl6(j) = ps_y_tl5(j);
    	  ps_y_tl5(j) = ps_y_tl4(j);
    	  ps_y_tl4(j) = ps_y_tl3(j);
    	  ps_y_tl3(j) = ps_y_tl2(j);
    	  ps_y_tl2(j) = ps_y_tl1(j);
    	  ps_y_tl1(j) = ps_y_t(j);

    	  ps_y_t(j) = [ps_e_t(j),ps_e_tl1(j),ps_e_tl2(j),ps_e_tl3(j),ps_e_tl4(j),ps_e_tl5(j),ps_e_tl6(j)]*MAcoeffstar(:,j) - [ps_y_tl1(j),ps_y_tl2(j),ps_y_tl3(j),ps_y_tl4(j),ps_y_tl5(j),ps_y_tl6(j)]*ARcoeffstar(2:end,j);
    	  ps_series(i,j) = ps_y_t(j);
  	end

  	%figure(2*i+2);
  	%plot(1:l+1,series)
  	%title(['IRF of ARMA(6,6) on ' char(A(i)) ' Simulated from SW (2007)'])
 end
 cumseries = cumsum(series);
 ps_cumseries = cumsum(ps_series);
 
 %Calculate average and standard deviation of cumulative IRFs
 mean_irf_pi = mean(cumseries,2)
 std_irf_pi = std(cumseries,0,2)
 mean_irf_pi_star = mean(ps_cumseries,2)
 std_irf_pi_star = std(ps_cumseries,0,2)

end
