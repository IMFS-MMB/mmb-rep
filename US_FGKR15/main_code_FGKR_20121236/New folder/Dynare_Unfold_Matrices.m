function [f_ss,fv,fvv,fss,fvvv,fssv,fsss,sigma,nv,nu,nx,nz] = Dynare_Unfold_Matrices(orderApp,oo_,M_,f_11)
% This function unfolds the matrices reported by Dynare up to a third order approximation
% Our notation is as follows
% z_t = f([x_t-1;u_t])
% where 'x'    the state variables
%       'u'    the innovations 
% and v_t = [x_t-1;u_t]
% By Martin Andreasen

% Dimensions
nv = M_.nspred + M_.exo_nbr;
nu = M_.exo_nbr;                     % Number of innovations
nx = nv - nu;                                      % Number of state variables
nz = M_.endo_nbr; % Number of control variables + state variables

% The cholesky factorisation of the covariance matrix
[sigma,error_mes] = chol(M_.Sigma_e,'lower'); 
if error_mes ~= 0
    sigma = diag(sqrt(diag(M_.Sigma_e))); 
    disp('Simulation done for diagonal shock covariance matrix')
end

% Steady states
f_ss =  oo_.dr.ys;

% If computing only 2nd order, we have to transform ghxx ghxu and ghuu to
% the same level they are when computing 3rd order, hence we have to divide
% them by 2. We will multiply by 2 later.
if orderApp == 2
    % This bit can be improved!
    g_2 = [];
    for i = 1:nx
        g_2 = [g_2 1/2*oo_.dr.ghxx(:,nx*(i-1)+i:nx*i) 1/2*oo_.dr.ghxu(:,nu*(i-1)+1:nu*i) ];
    end
    for j = 1:nu
        g_2 = [g_2 1/2*oo_.dr.ghuu(:,nu*(j-1)+j:nu*j)];
    end
    oo_.dr.g_2 = g_2;  
end
if orderApp > 1
    f_2 = oo_.dr.g_2;
end
if orderApp > 2
    f_31 = oo_.dr.g_1;
    f_3  = oo_.dr.g_3;  % this matrix has exactly same order as Dynare++ 3rd order approximation (same levels too
                        % hence, we can use same block of the code.
end

% Decision rule for the linear approximation
fv = f_11;

% Decision rule for the 2nd order. 
% Given that g_2 are multiplied by 1/2, we multiply fvv by 2. See below.
if orderApp > 1
    fss = oo_.dr.ghs2;
    
    % we unfold the matrix f_22 and multiply by 2
    fvv = zeros(nz,nv,nv);
    index = 0;
    for alfa1=1:nv
        for alfa2=alfa1:nv
            index = index + 1;
            fvv(:,alfa1,alfa2) =  f_2(:,index);
            if alfa1 ~= alfa2
                fvv(:,alfa2,alfa1) =  f_2(:,index);
            end
        end
    end
    fvv = 2*fvv;
else
    fss = zeros(nz,1);
    fvv = zeros(nz,nv,nv);
end

% The third order terms are given by f_33 and by the difference between 
% f_31 and f_11. We multiply by 6 because the terms in Dynare++ are already
% multiplied by 1/6 (see below)
if orderApp > 2
    fssv = (6/3)*(f_31-f_11);     % The term f_31 is multiplied by 3/6 in Dynare ++ because there are
                                  % 3 combinations (fssz,fszs,fzss) in these third order terms
                                  
    % We unfold the matrix f_33 and multiply by 6
    fvvv = zeros(nz,nv,nv,nv);
    index = 0;
    for alfa1=1:nv
        for alfa2=alfa1:nv
            for alfa3=alfa2:nv
                index = index + 1;
                fvvv(:,alfa1,alfa2,alfa3) = f_3(:,index);
                % Using symmetry for alfa1 and alfa2
                if alfa1 == alfa2 && alfa2 ~= alfa3 %alfa1==alfa2~=alfa3
                    fvvv(:,alfa1,alfa3,alfa1) = fvvv(:,alfa1,alfa2,alfa3);
                    fvvv(:,alfa3,alfa1,alfa1) = fvvv(:,alfa1,alfa2,alfa3);                
                end
                % Using symmetry for alfa2 and alfa3            
                if alfa1 ~= alfa2 && alfa2 == alfa3  %alfa1~=alfa2==alfa3              
                    fvvv(:,alfa2,alfa1,alfa2) = fvvv(:,alfa1,alfa2,alfa3);                
                    fvvv(:,alfa2,alfa2,alfa1) = fvvv(:,alfa1,alfa2,alfa3);                                
                end            
                % Using symmetry for alfa1,alfa2, and alfa3            
                if alfa1 ~= alfa2 && alfa1 ~= alfa3 &&  alfa2 ~= alfa3 %alfa1~=alfa2~=alfa3
                    fvvv(:,alfa1,alfa3,alfa2) = fvvv(:,alfa1,alfa2,alfa3);
                    fvvv(:,alfa3,alfa1,alfa2) = fvvv(:,alfa1,alfa2,alfa3);
                    fvvv(:,alfa3,alfa2,alfa1) = fvvv(:,alfa1,alfa2,alfa3);
                    fvvv(:,alfa2,alfa3,alfa1) = fvvv(:,alfa1,alfa2,alfa3); 
                    fvvv(:,alfa2,alfa1,alfa3) = fvvv(:,alfa1,alfa2,alfa3);                 
                end
            end
        end
    end
    fvvv = 6*fvvv;
    fsss = zeros(nz,1);    %Dynare++ solves only for Gaussian shocks
else
    fsss = zeros(nz,1);
    fssv = zeros(nz,nv);
    fvvv = zeros(nz,nv,nv,nv);
end
end