%t1 = cputime;

% setup everything 

nsh=3;
nlags=1;
nbeq=size(cofb,1)-nsh;
neq=nbeq+nsh;	

amat=cofb(1:nbeq,1:nbeq);
bmat=inv(scof(1:neq,nlags*neq+1:(nlags+1)*neq));
bmat=bmat(1:nbeq,nbeq+1:neq);

% variables to check in var-cov iterations

ntestmat=4;

% load varcov matrix for shocks

%load fmomega.dat;
%vcovmat=fmomega;

% setup B*V*B'

bigsig=bmat*vcovmat*bmat';

% compute unconditional variances using
% doubling algorithm 

alpha0=amat;
alpha1=alpha0;
gamma0=bigsig;

% anew1=a1;
% anew2=a2;

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

sdygap	= sqrt(c0(1,1));
sdpdot	= sqrt(c0(2,2));
sdrff	= sqrt(c0(3,3));
sddrff	= sqrt(c0(4,4));
sdindx	= sqrt(c0(5,5));

%sdpdot4	= sqrt(c0(33,33));
%sdpdot8	= sqrt(c0(34,34));
%sdpdot12= sqrt(c0(35,35));
%sdpdot16= sqrt(c0(36,36));
%sdpdot20= sqrt(c0(37,37));

%disp(['Elapsed time to compute covariances        = ',num2str(cputime-t1)])
