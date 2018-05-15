function vibes(lambda, s)
 
%  Print the size and periods of oscillation of the non-zero elements
%  of lambda, the roots of a discrete-time system. If s~=0, sort the
%  roots by size from large to small.

epsi  = 1.e-8;              % used in zero comparison before division.

amp     = abs(lambda);
keep    = find(lambda);
lambda  = lambda(keep);
amp     = amp(keep);

n      = length(keep);
angel  = zeros(n,1);
period = zeros(n,1) + Inf;

if(s~=0)
   [amp,k] = sort(-amp);
   amp     = -amp;
   lambda  = lambda(k);
end

i = find(abs(lambda)>epsi);

for j = i
   angel(j) = abs(angle(lambda(j)));
end

k = find( angel>epsi );
if( ~isempty(k) ) period(k) = (2*pi)./angel(k);end

n=length(lambda);

space
disp('                 Roots               Amplitude       Period')
tabulate((1:n)', lambda, amp, period);

return

