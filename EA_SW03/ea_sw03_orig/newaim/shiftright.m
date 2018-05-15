function [y] = shiftright(x,n)

% [y] = shiftright(x,n)
%
%  Shift the rows of x to the right by n columns, leaving zeros in the
%  first n columns. 

[rows,cols] = size(x);

left  = 1:cols-n;
right = n+1:cols;

y = zeros(rows,cols);
y(:,right) = x(:,left);

return
