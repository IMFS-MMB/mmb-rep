% q = SPCopy_w(q,w,js,iq,qrows)
%
%  Copy the eigenvectors corresponding to the largest roots into the
%  remaining empty rows and columns js of q 

function  q = SPCopy_w(q,w,js,iq,qrows)

if(iq < qrows)
   lastrows = iq+1:qrows;
   wrows    = 1:length(lastrows);
   q(lastrows,js) = w(:,wrows)';
end
