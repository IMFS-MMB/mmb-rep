clear; clc; close all; warning off; tic

thispath = cd;


solve_path = horzcat(thispath,'\newaim'); % path of sp_solve directory on your machine
addpath(solve_path);
dirnam= horzcat(' ',thispath,'\'); % directory of this example 

addpath(thispath)
horzcat('dos('' del ', thispath, '\compute_aim_matrices.m '' ',')')

modnam='frbus97f';
parnam='frbuspar_new';


nsh=53;			% # of stochastic equations
nlags=2;		% maximum # of lags            

nbehav = 274 ; 

nbeq=nbehav;
neq=nbeq+nsh;

load hresd.dat;

ntestmat=4;
hresd(:,nsh-3:nsh)=zeros(120,4);
vcovmat=cov(hresd);

% Solve model
parseflag = 1;
solveflag = 1;
spsolve;
    
if aimcode>5,
   aimcode
   disp('Error in aim: check results.')
end
      amat1=sparse(cofb(1:nbeq,1*neq+1:1*neq+nbeq));
      amat2=sparse(cofb(1:nbeq,0*neq+1:0*neq+nbeq));

      bmat1=inv(scof(1:neq,nlags*neq+1:(nlags+1)*neq));
      bmat1=bmat1(1:nbeq,nbeq+1:neq);

      bmat2=zeros(nlags*nbeq,nsh);
      bmat2(1:nbeq,1:nsh)=bmat1;

      bmat2=bmat2(:,1:nsh);

% model reduction

      amatnew=zeros(2*nbeq,nbeq);
      killsum=0;
      killvar2=zeros(nbeq,1);
      for ii=1:nbeq,
        if max(abs(amat2(:,ii))) < 1e-8,
          killsum=killsum+1;
          killvar2(killsum,1)=ii;
        else    
          amatnew(1:nbeq,ii-killsum)=amat2(1:nbeq,ii);
          amatnew(nbeq+ii-killsum,ii)=1;
       end  
      end

      nnew=nlags*nbeq-killsum;
      amat=zeros(nnew,nnew);
      amat(1:nbeq,1:nbeq)=amat1;
      amat(1:nbeq,nbeq+1:nnew)=amatnew(1:nbeq,1:nnew-nbeq);
      amat(nbeq+1:nnew,1:nbeq)=amatnew(nbeq+1:nnew,1:nbeq);

      amat=sparse(amat);
      bmat=sparse(bmat2(1:nnew,:));

      frbusuncond;

      sdygap=sqrt(c0(1,1));
      sdpdot=sqrt(c0(2,2));
      sdrff=sqrt(c0(3,3));
      sddrff=sqrt(c0(4,4));

      [tayr1,tayp0,tayx0,sdygap,sdpdot,sddrff]


disp(['Elapsed time to compute covariances        = ',num2str(cputime-t1)])
