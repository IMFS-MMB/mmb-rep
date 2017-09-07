function [normalvec]    = normrndvec(MU, SIG, T)

% -----------------------------------------------------
% normrndvec.m
% Generate a sequence of T normal random vectors with
% mean MU and joint variance SIGMA:
% x(t)~N(MU, SIG)
% output : T x length(MU) matrix of jointly normal random
%          numbers
% Keith Küster 18.08.2003
% -----------------------------------------------------

% --------------------
% Check for errors
% --------------------

if nargin<3
    T=1;
end
if nargin<2
    error('You need to specify MU and SIGMA')
end
if (length(MU)~=size(SIG,1)) | (length(MU)~=size(SIG,2)) 
    error('length(MU)~=size(SIG,1) or  ~= size(SIG,2)')
end

% ---------------------------------------------------
% Generate independent standard normal random numbers
% ---------------------------------------------------
randn('state',sum(100*clock));
Stdvec = randn(T,length(MU));

% ----------------------------------------------------
% Cholesky factorize the SIG matrix. R'*R = SIG
% and set up the process such that in each period
% normalvec(jkl,:)' = MU+R'*Stdvec
% ----------------------------------------------------
if size(MU,1)~=length(MU)
    MU = MU';
end
MUvec = ones(T,1)*MU';
R = chol(SIG);
normalvec = MUvec + Stdvec*R;

