% scof = SPObstruct(cof,cofb,neq,nlag,nlead)
%
% Construct the coefficients in the observable structure.
%    
%   Input arguments:
%
%            cof    structural coefficients
%            cofb   reduced form
%            neq    number of equations
%            nlag   number of lags
%            nlead  number of leads
%
%   Output arguments:
%
%            scof  observable structure coefficients

function scof = SPObstruct(cof,cofb,neq,nlag,nlead)


% Append the negative identity to cofb

cofb = [cofb, -eye(neq)];
scof = zeros(neq,neq*(nlag+1));
q    = zeros(neq*nlead, neq*(nlag+nlead));
[rc,cc] = size(cofb);
qs=sparse(q);
qs(1:rc,1:cc) = sparse(cofb);
qcols = neq*(nlag+nlead);

if( nlead > 1 ) 
   for i = 1:nlead-1
      rows = i*neq + (1:neq);
      qs(rows,:) = shiftright( qs((rows-neq),:), neq );
   end
end

l = (1: neq*nlag);
r = (neq*nlag+1: neq*(nlag+nlead));

 qs(:,l) = - qs(:,r) \ qs(:,l);

minus =              1:       neq*(nlag+1);
plus  = neq*(nlag+1)+1: neq*(nlag+1+nlead);

cofs=sparse(cof);
scof(:,neq+1:neq*(nlag+1)) = cofs(:,plus)*qs(:,l);
scof = scof + cofs(:,minus);
