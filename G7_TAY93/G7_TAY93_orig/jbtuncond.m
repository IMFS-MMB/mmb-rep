%t1 = cputime;

bigsig=bmat*vcovmat*bmat';

% compute unconditional variances using
% doubling algorithm 

alpha0=amat;
alpha1=alpha0;
gamma0=bigsig;

diff=5;  
ijk=1;

while diff > 1e-10,

  alpha1=alpha0*alpha0;

  c0=gamma0+alpha0*gamma0*alpha0';
  testmat=abs(c0(1:ntestmat,1:ntestmat)-gamma0(1:ntestmat,1:ntestmat));
  diff=max(max(testmat));
%  [ijk,cputime-t1,diff]
  gamma0=c0;
  alpha0=alpha1;

  ijk=ijk+1; 

   if ijk > 100,
     zerror=1;
     disp(['Final covariance matrix change        = ',num2str(diff)])
     diff=0;     
     disp('Program did not converge.')
   end
end


%disp(['Elapsed time to compute covariances        = ',num2str(cputime-t1)])
