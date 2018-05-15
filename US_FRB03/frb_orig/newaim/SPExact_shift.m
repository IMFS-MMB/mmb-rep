% [h,q,iq,nexact] = exact_shift(h,q,iq,qrows,qcols,neq)
%
% Compute the exact shiftrights and store them in q.

function [h,q,iq,nexact] = SPExact_shift(h,q,iq,qrows,qcols,neq)

hs=sparse(h);
nexact = 0;
left   = 1:qcols;
right  = qcols+1:qcols+neq;
zerorows = find( sum(abs( hs(:,right)' ))==0 );

while( any(zerorows) & iq <= qrows )
   nz = length(zerorows);
   q(iq+1:iq+nz,:) = hs(zerorows,left);
   hs(zerorows,:)   = shiftright(hs(zerorows,:),neq);
   iq     = iq + nz;
   nexact = nexact + nz;
   zerorows = find( sum(abs( hs(:,right)' ))==0 );
end
h=full(hs);

