% --------------------------------------------
% Extract_shocks.m
% 
% Extract_shocks for the simple model
% Keith Küster 
% --------------------------------------------


clear
addpath c:\wieland_project\simple_comm_bayes
dos('del c:\wieland_project\diagnostics\compute_aim_matrices.m')

modfile = ' c:\Wieland_project\diagnostics\simple_model_filter.txt'
parnam  = ' simple_model_par'

rule = 3;       % 1: Taylor, 2: with smoothing, 3: Gerdesmeier, Roffia
% ----------------------
% set policy rule
% ----------------------
if rule ==1
    rho     = 0;
    alpha   = 1.5;
    beta    = 0.5;
elseif rule==2
    rho     = .79;
    alpha   = (1-.79)*2.2;
    beta    = (1-.79)*1.33;
elseif rule==3
    rho     =  .87^3;
    alpha   =  (1-.87^3)*1.93;
    beta    =  (1-.87^3)*.28;
else
    error('specify a rule between 1 and 3')
end


% ----------------------
% solve model for observable structure
% ----------------------

parseflag = 1;
solveflag = 1;

if solveflag == 1
   vwsolve
end

% ----------------------
% set up system matrices for dynamic simulations
% ----------------------

neq = size(cofb,1);

amat = cofb(1:neq,1:neq);  

bmat = inv(scof(1:neq,1*neq+1:2*neq));
bmat = bmat(1:neq,1:neq);

% -----------------------------
% Define variables
% -----------------------------

indexendog = 1:3;
indexrho   = 5:7;
indexinno  = 8:10;

% -----------------------------
% load data file
% -----------------------------

load c:\ecb\awm\data_2000\awmvaluesnew 
%yer=yer(3:end);
%pipcd=pipcd(3:end);
%stn=stn(3:end);
X   = [yer(1);pipcd(1)*4;stn(1)/100];
Rho = [.1;.1;.1]; % These do not matter from period 3 on anyway.
U   = [0;0;0];

% -----------------------------
% start iteration
% -----------------------------

for jkl=2:length(stn)
    X = [X,[yer(jkl);pipcd(jkl)*4;stn(jkl)/100]];
    U = [U, inv(bmat(indexendog,indexinno))...
            *(X(:,end)-amat(indexendog,indexendog)*X(:,end-1)...
             - amat(indexendog,indexrho)*Rho(:,end)...
             - amat(indexendog,indexinno)*U(:,end))];
    Rho = [Rho, amat(indexrho,indexrho)*Rho(:,end)+U(:,end)];
end
   

if sum(sum(amat(indexrho,indexendog)))~=0 | sum(sum(amat(indexrho,indexinno)))~=0
    error('wrong assumptions')
end
    
%Omega = cov(U(:,3:end)');
Omega = diag(diag(cov(U(:,3:end)')));
Omega(end,:)=0; Omega(:,end)=0;




% -------------------------------------
% Save only the covariance matrix without
% monetary shock
% ------------------------------------

[sdpinf, sdygap, sdr, sddr] = simple_model_var(scof, cofb, endog_, Omega)

figure(1)
autocorr(U(1,3:end)');
figure(2)
autocorr(U(2,3:end)');
figure(3)
autocorr(U(3,3:end)');



Omega = Omega(1:2,1:2);

save Omega_simple Omega