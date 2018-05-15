% [nonsing,b] = SPReduced_form(q,qrows,qcols,bcols,neq,b,condn);
%
% Compute reduced-form coefficient matrix, b.

function [nonsing,b] = SPReduced_form(q,qrows,qcols,bcols,neq,condn);

qs=sparse(q);
left = 1:qcols-qrows;
right = qcols-qrows+1:qcols;
nonsing = rcond(full(qs(:,right))) > condn;
if(nonsing)
   qs(:,left) = -qs(:,right)\qs(:,left);
end
b = qs(1:neq,1:bcols);
b = full(b);
