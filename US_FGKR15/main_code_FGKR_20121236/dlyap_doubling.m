% This function solve the discrete time lyaponov system by a doubling
% algorithm. I.e. varx = A*varx*A' + B
% These codes are based on some work by S. Schmitt-Grohe and M. Uribe.
function [varx,error_mes] = dlyap_doubling(A,B)

% The doubling algorithm
error_mes = 0;
max_iter  = 500;
A_old     = A;
var_old   = B;
varx_old  = eye(size(A));
difference=.1;
index1    = 1;
while difference > 1e-25 && index1 < max_iter;
    varx       = A_old*varx_old*A_old'+var_old;
    difference = max(max(abs(varx-varx_old)));
    var_old    = A_old*var_old*A_old'+var_old;
    A_old      = A_old*A_old;
    varx_old   = varx;
    index1     = index1 + 1;
end
if index1 == max_iter
    error_mes = 1;
end

end
