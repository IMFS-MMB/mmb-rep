function [COR, Std] = autocorrelation_2(A,B,horizon, Omega, index)

% ------------------------------------
% autocorrelation_2.m
% Model: y(t) = A y(t-1) + B u(t)
% u~WN(0,Omega)
% This is used to produce the autocorrelation
% functions in the Kuester and Wieland (2004) paper
% ------------------------------------

% -------------------------------------------------------------
% Calculate unconditional variances
% -------------------------------------------------------------

diff    = 999;
beta0   = A;
gamma0  = B*Omega*B';

ijk     =    0;
diff    = 1000;


while diff>10e-10
    ijk=ijk+1;
    
    beta1   = beta0*beta0;
    gamma1  = gamma0 + beta0*gamma0*beta0';
    diff    = max(max([abs(gamma0-gamma1)]));
    beta0   = beta1;   
    gamma0  = gamma1;
    if ijk > 100
        zerror = 1;
        disp(['Final covariance matrix change        = ',num2str(diff)])
        diff = 0;     
        disp('Program did not converge.')
    end
    
end

VAR = gamma1; % Variance Covariance Matrix

SIG = inv(diag(sqrt(diag(VAR(index,index)))));


COV = VAR;
COR = diag(SIG*COV(index,index)*SIG);

for jkl=1:horizon
    COV     =A^jkl*VAR;
    CORnew  = diag(SIG*COV(index,index)*SIG);
    COR     = [COR,CORnew];
end

Std = sqrt(diag(VAR(index,index)));
    


