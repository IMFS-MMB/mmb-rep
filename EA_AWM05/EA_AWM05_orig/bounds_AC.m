function bounds = bounds_AC(autopi, N,std_num,max_q);

% -----------------------------------------
% Bounds_AC.m
%
% computes the std_num standard deviation
% bounds for the autocorrelation
% series autopi computed on the basis of N observations
% max_q: maximum MA(q) order assumed
% -----------------------------------------

if nargin<3
    error('Need at least 3 inputs')
end
if nargin<4
    max_q=N;
end
% --------------------------------
% Transpose so autopi is columnvec
% --------------------------------
[nr,nc]=size(autopi);
if nr>1 & nc>1
    error('autopi needs to be time-series')
elseif nc>2
    autopi = autopi';
end
% -----------------------------------------
% Add the first observation if it does 
% not equal 1
% -----------------------------------------
if autopi(1)~=1;
    autopi = [1;autopi];
end
bounds = [1;1];
bounds = [bounds,autopi(2)+[std_num;-std_num]*sqrt(1/N)];
if max_q == 0
    for jkl = 3:size(autopi)    % follows Hamilton p.111 [4.8.8]
        bounds = [bounds, autopi(jkl)+[std_num;-std_num].*(sqrt(1/N))];
    end
else
    for jkl = 3:size(autopi)    % follows Hamilton p.111 [4.8.8]
        bounds = [bounds, autopi(jkl)+[std_num;-std_num].*(sqrt(1/N*(1+2*autopi(2:min(jkl-1,max_q+1))'*autopi(2:min(jkl-1,max_q+1)))))];
    end
end
