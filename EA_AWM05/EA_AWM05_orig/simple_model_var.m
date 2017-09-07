function [sdpinf, sdygap, sdr, sddr] = simple_model_var(scof, cofb, endog_, Omega)

% ----------------------------------------------------------------------------
% simple_model_var.m 
% compute unconditional variance covariance of simple New Keynesian model
% using the doubling algorithm 
% inputs:   - scof: structural coefficient matrix
%           - cofb: companion matrix (reduced form)
%           - endog_: string vector of variable names
%           - Omega: variance covariance matrix of shocks (2x2)
% outputs:  - sdpinf: annual(ized) std deviation of inflation (in % terms)
%           - sdygap: std deviation of the output gap (in % terms)
%           - sdr:    std deviation of short term annualized rate (in % terms)
%           - sddr: first difference of sdr    
% Keith Küster, 4 August 2003
% ----------------------------------------------------------------------------

% set up system matrices 
neq = size(cofb,1);
A = - inv(scof(:, 1*neq+1:2*neq))*scof(:,1:neq);
bmat = inv(scof(1:neq,1*neq+1:2*neq));
if max(sort(abs(eig(A))))>1 % If the system is not covariance stationary: Punish
     display('Roots outside the unit circle');
     sdpinf  =   1000; 
     sdygap  =   1000;        
     sddr    =   1000;
     sdr     =   1000;
     return;
 end


% ----------------------------------------------------------------------
% The model is y(t+1)=A *y(t) + bmat* e(t+1)
% Hence SIGMA_y = A SIGMA_y A' + bmat SIGMA_e bmat'
% After iterating: gamma0 = SIGMA_y
% ----------------------------------------------------------------------

Sigma_e                         = zeros(neq,neq);                       
Sigma_e(end-2:end,end-2:end)    = Omega;
diff    = 999;
beta0   = A;
gamma0  = bmat*Sigma_e*bmat';

ijk     =    0;
diff    = 1000;
% ----------------------------------------
% Do not iterate until the entire covariance matrix converges
% but just until convergence of a few variances
% Otherwise things take ages
% Convergence criterion: 6 digits after the comma
% ----------------------------------------


sdpinf0  =   100; 
sdygap0  =   100;  
sdr0     =   100;
sddr0    =   100;



while diff>10e-6
    ijk=ijk+1;
    
    beta1   = beta0*beta0;
    gamma1  = gamma0 + beta0*gamma0*beta0';
    sdpinf  =   sqrt(gamma0(loc(endog_,'pipcd'),loc(endog_,'pipcd')))*100; % inflation rate in annual terms
    sdygap  =   sqrt(gamma0(loc(endog_,'yer'),loc(endog_,'yer')))*100; 
    sdr     =   sqrt(gamma0(loc(endog_,'stn'),loc(endog_,'stn')))*100;
    %sddr    =   sqrt(gamma0(loc(endog_,'dstn'), loc(endog_,'dstn')));
    diff    = max([abs(sdpinf-sdpinf0), abs(sdr-sdr0),abs(sdygap-sdygap0)]);
    sdygap0 = sdygap;
    sdpinf0 = sdpinf;
    sdr0    = sdr;
    beta0   = beta1;   
    gamma0  = gamma1;
    if ijk > 100
        zerror = 1;
        disp(['Final covariance matrix change        = ',num2str(diff)])
        diff = 0;     
        disp('Program did not converge.')
    end
    
end

sdpinf  =   sqrt(gamma0(loc(endog_,'pipcd'),loc(endog_,'pipcd')))*100; % inflation rate in annual terms
sdygap  =   sqrt(gamma0(loc(endog_,'yer'),loc(endog_,'yer')))*100; 
sdr     =   sqrt(gamma0(loc(endog_,'stn'),loc(endog_,'stn')))*100;
sddr    =   sqrt(gamma0(loc(endog_,'dstn'), loc(endog_,'dstn')))*100;

