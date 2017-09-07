function [sdpinf, sdygap, sdr, sddr] = FuhrerMoore_var(scof, cofb,  endog_,Omega)

% ----------------------------------------------------------------------------
% FuhrerMoore_var.m 
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
%
% Keith Küster, 4 August 2003
% ----------------------------------------------------------------------------

neq = size(cofb,1);
nsh = 2;
A = cofb(1:neq,1:neq);
bmat = inv(scof(1:neq,1*neq+1:2*neq));
bmat = bmat(1:neq,1:neq);

% set up companion form

Sigma = zeros(neq,neq);
Sigma(neq-nsh+1:neq,neq-nsh+1:neq) = Omega;
Sigma = bmat*Sigma*bmat';

% variables to check in vcovmat iterations
index = [loc(endog_,'q')
         loc(endog_,'pi1')
         loc(endog_,'is')
         loc(endog_,'dis')];

% compute unconditional variance covariance matrix using
% doubling algorithm 

beta0  = A;
gamma0 = Sigma;

ijk  = 0;
diff = 999;  
while diff > 1e-10
  ijk    = ijk+1; 
  beta1  = beta0*beta0;
  gamma1 = gamma0+beta0*gamma0*beta0';
  diff   = max(max(abs(gamma1(index,index)-gamma0(index,index))));
  beta0  = beta1;
  gamma0 = gamma1;
  if ijk > 100
    zerror = 1;
    disp(['Final covariance matrix change        = ',num2str(diff)])
    diff = 0;     
    disp('Program did not converge.')
  end
end

sdpinf = sqrt(gamma0(loc(endog_,'pi4'),loc(endog_,'pi4')))*100;
%sdpinf = sqrt(gamma0(loc(endog_,'pi1'),loc(endog_,'pi1')))*400;

sdygap = sqrt(gamma0(loc(endog_,'q'),  loc(endog_,'q')))*100;
sdr    = sqrt(gamma0(loc(endog_,'is'), loc(endog_,'is')))*100;
sddr   = sqrt(gamma0(loc(endog_,'dis'),loc(endog_,'dis')))*100;

