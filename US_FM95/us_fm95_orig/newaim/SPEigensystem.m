%  [w,rts,lgroots] = SPEigensystem(a,uprbnd)
%
%  Compute the roots and the left eigenvectors of the companion
%  matrix, sort the roots from large-to-small, and sort the
%  eigenvectors conformably.  Map the eigenvectors into the real
%  domain. Count the roots bigger than uprbnd.

function [w,rts,lgroots] = SPEigensystem(a,uprbnd) 

[w,d]   = eig(a');
rts     = diag(d);
mag     = abs(rts);
[mag,k] = sort(-mag);
rts     = rts(k);

ws=sparse(w);
ws       = ws(:,k);

%  Given a complex conjugate pair of vectors W = [w1,w2], there is a
%  nonsingular matrix D such that W*D = real(W) + imag(W).  That is to
%  say, W and real(W)+imag(W) span the same subspace, which is all
%  that aim cares about. 

ws = real(ws) + imag(ws);

lgroots = sum(abs(rts) > uprbnd);

w=full(ws);

