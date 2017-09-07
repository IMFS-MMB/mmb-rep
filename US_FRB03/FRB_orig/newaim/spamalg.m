%  [b,rts,ia,nexact,nnumeric,lgroots,aimcode] = ...
%                       SPAmalg(h,neq,nlag,nlead,condn,uprbnd)
%
%  Solve a linear perfect foresight model using the matlab eig
%  function to find the invariant subspace associated with the big
%  roots.  This procedure will fail if the companion matrix is
%  defective and does not have a linearly independent set of
%  eigenvectors associated with the big roots.
% 
%  Input arguments:
% 
%    h         Structural coefficient matrix (neq,neq*(nlag+1+nlead)).
%    neq       Number of equations.
%    nlag      Number of lags.
%    nlead     Number of leads.
%    condn     Zero tolerance used as a condition number test
%              by numeric_shift and reduced_form.
%    uprbnd    Inclusive upper bound for the modulus of roots
%              allowed in the reduced form.
% 
%  Output arguments:
% 
%    b         Reduced form coefficient matrix (neq,neq*nlag).
%    rts       Roots returned by eig.
%    ia        Dimension of companion matrix (number of non-trivial
%              elements in rts).
%    nexact    Number of exact shiftrights.
%    nnumeric  Number of numeric shiftrights.
%    lgroots   Number of roots greater in modulus than uprbnd.
%    aimcode     Return code: see function aimerr.

function [b,rts,ia,nexact,nnumeric,lgroots,aimcode] = ...
                        SPAmalg(h,neq,nlag,nlead,condn,uprbnd)

if(nlag<1 | nlead<1) 
    error('Aim_eig: model must have at least one lag and one lead.');
end

% Initialization.
nexact   = 0;
nnumeric = 0;
lgroots  = 0;
iq       = 0;
aimcode    = 0;
qrows = neq*nlead;
qcols = neq*(nlag+nlead);
bcols = neq*nlag;
q        = zeros(qrows,qcols);
rts      = zeros(qcols,1);

% Compute the auxiliary initial conditions and store them in q.

[h,q,iq,nexact] = SPExact_shift(h,q,iq,qrows,qcols,neq);
   if (iq>qrows) 
      aimcode = 61;
      return;
   end


[h,q,iq,nnumeric] = SPNumeric_shift(h,q,iq,qrows,qcols,neq,condn);
   if (iq>qrows) 
      aimcode = 62;
      return;
   end

%  Build the companion matrix.  Compute the stability conditions, and
%  combine them with the auxiliary initial conditions in q.  


[a,ia,js] = SPBuild_a(h,qcols,neq);

if (ia ~= 0)
   [w,rts,lgroots] = SPEigensystem(a,uprbnd);
   q = SPCopy_w(q,w,js,iq,qrows);
end

   test = nexact+nnumeric+lgroots;
       if (test > qrows) aimcode = 3;
   elseif (test < qrows) aimcode = 4;
   end

% If the right-hand block of q is invertible, compute the reduced form.

[nonsing,b] = SPReduced_form(q,qrows,qcols,bcols,neq,condn);


if ( nonsing & aimcode==0) aimcode =  1;
elseif (~nonsing & aimcode==0) aimcode =  5;
elseif (~nonsing & aimcode==3) aimcode = 35;
elseif (~nonsing & aimcode==4) aimcode = 45;
end




