% For a DSGE model approximated up to second order, this function calculates 
% the unconditional first and second moments based on the the pruning
% scheme. The system reads
%     xf(t+1) = hx*xf(t) + sig*eta*eps(t);
%     xs(t+1) = hx*xs(t) + 0.5*reshape(hxx,nx,nx^2)*kron(xf(t),xf(t))+ 1/2*sig^2*hss;
%     y(t+1)  = gx*(xf(t+1)+xs(t+1)) + 0.5*reshape(gxx,ny,nx^2)*kron(xf(t+1),xf(t+1))+ 1/2*sig^2*gss
%
% IMPORTANT: Variances are computed by solving the Lyaponov system
%
% INPUTS:
% gx,...,sig : The second order approximation of the DSGE model
% vectorMom3 : vector with dimensions 1*ne with third moments of shocks
% vectorMom4 : vector with dimensions 1*ne with fourth moments of shocks
% auto_lag   : the lag lenght for the auto-covariances (they need to be divided
%              by the standard deviations to get the correlations)
%
% OUTPUTS: 
% E_xf         : mean of xf
% E_xs         : mean of xs
% E_y          : mean of y
% E_xf_xf      : mean of xf*xf'
% Var_xf       : variance of xf (same as E_xf_xf because E_xf = 0)
% Var_xs       : variance of xs
% Var_xf_xs    : covariance between xf and xs
% Var_xfxf     : variance of kron(xf,xf)
% Var_xs_xfxf  : variance of xs*kron(xf,xf)'
% Var_x        : variance of x
% Var_y        : variance of y
% Cov_xf       : the auto-covariances for xf, dimension nx*nx*auto_lag
% Cov_xs       : the auto-covariances for xs, dimension nx*nx*auto_lag
% Cov_x        : the auto-covariances for x,  dimension nx*nx*auto_lag
% Cov_y        : the auto-covariances for y,  dimension ny*ny*auto_lag
%
% By M. Andreasen, 2010

function [E_xf,E_xs,E_y,E_xf_xf,Var_xf,Var_xf_xs,Var_xs,Var_xfxf,Var_xs_xfxf,Var_x,Var_y,Cov_xf,Cov_xs,Cov_x,Cov_y] ...
    = UnconditionalMoments_2nd_Lyap(gx,gxx,gss,hx,hxx,hss,eta,sig,vectorMom3,vectorMom4,auto_lag);

% The dimensions
ny = size(gx,1);
[nx,ne] = size(eta);
sigeta  = sig*eta;

% The auxiliary system z=[xf xs kron(xf,xf)]
% The loading matrix
A = [hx                ,zeros(nx,nx)       ,zeros(nx,nx^2);
    zeros(nx,nx)       ,hx                 ,0.5*reshape(hxx,nx,nx*nx);
    zeros(nx*nx,nx)    ,zeros(nx*nx,nx)    ,kron(hx,hx)          ];
% The constant term
c = [zeros(nx,1);
    0.5*hss*sig^2;
    kron(sigeta,sigeta)*reshape(eye(ne),ne^2,1)];

% the mean value of the states in the auxiliary system
%E_z    = inv(eye(2*nx+nx^2)-A)*c;
E_z     = (eye(2*nx+nx^2)-A)\c;
E_xf    = E_z(1:nx,1);
E_xs    = E_z(nx+1:2*nx,1);
E_xf_xf = reshape(E_z(2*nx+1:2*nx+nx^2,1),nx,nx);


% The size of the variance of the innovations
Var_inov = zeros(2*nx+nx^2,2*nx+nx^2); 

% We compute Var_inov_11
Var_inov(1:nx,1:nx) = sigeta*sigeta';

% We compute Var_inov_13 Var_inov_31
E_eps_eps2 = zeros(ne,ne^2);
% any: 1 if any element of a vector is a nonzero number
if any(vectorMom3) == 1
    for phi1=1:ne
        index = 0;
        for phi2=1:ne
            for phi3=1:ne
                index = index + 1;
                if (phi1 == phi2 && phi1 == phi3)
                    E_eps_eps2(phi1,index) = vectorMom3(1,phi1);
                end
            end
        end
    end
end
Var_inov(1:nx,2*nx+1:2*nx+nx^2) = sig*eta*E_eps_eps2*(kron(sig*eta',sig*eta'));
Var_inov(2*nx+1:2*nx+nx^2,1:nx) = Var_inov(1:nx,2*nx+1:2*nx+nx^2)';

% We compute var_inov_33
E_xfeps_epsxf = zeros(nx*ne,nx*ne);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for phi2=1:ne
            for gama2=1:nx
                index2 = index2 + 1;
                if phi1 == phi2 
                    E_xfeps_epsxf(index1,index2) = E_xf_xf(gama1,gama2);
                end
            end
        end
    end
end

E_eps2_eps2 = zeros(ne^2,ne^2);
index1 = 0;
for phi4=1:ne
    for phi1=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for phi3=1:ne
            for phi2=1:ne
                index2 = index2 + 1;
                % The second moments
                if (phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4)
                    E_eps2_eps2(index1,index2) = 1;
                elseif (phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2)
                    E_eps2_eps2(index1,index2) = 1;
                elseif (phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2)                    
                    E_eps2_eps2(index1,index2) = 1;
                elseif (phi1 == phi2 && phi1 == phi3 && phi1 == phi4)
                    % The fourth moments
                    E_eps2_eps2(index1,index2) = vectorMom4(1,phi1);
                end
            end
        end
    end
end                  
Var_inov(2*nx+1:2*nx+nx^2,2*nx+1:2*nx+nx^2) = ...
     kron(hx,sig*eta)*(kron(E_xf_xf,eye(ne)))*kron(hx,sig*eta)'...
    +kron(hx,sig*eta)*E_xfeps_epsxf*kron(sig*eta,hx)'...
    +kron(sig*eta,hx)*E_xfeps_epsxf'*kron(hx,sig*eta)'...
    +kron(sig*eta,hx)*(kron(eye(ne),E_xf_xf))*kron(sig*eta,hx)'...
    +kron(sig*eta,sig*eta)*(E_eps2_eps2-reshape(eye(ne),ne^2,1)*reshape(eye(ne),ne^2,1)')...
    *kron(sig*eta,sig*eta)';

% Computing the variances of the state variables, using the Lyaponov routine
%Var_z       = dlyap(A,Var_inov);
Var_z       = dlyap_doubling(A,Var_inov);
Var_xf      = Var_z(1:nx,1:nx);
Var_xs      = Var_z(nx+1:2*nx,nx+1:2*nx);
Var_xf_xs   = Var_z(1:nx,nx+1:2*nx);
Var_xfxf    = Var_z(2*nx+1:2*nx+nx^2,2*nx+1:2*nx+nx^2);
Var_xs_xfxf = Var_z(nx+1:2*nx,2*nx+1:2*nx+nx^2);
Var_x       = Var_xf + Var_xs + Var_xf_xs + Var_xf_xs';

% Computing the autu-corelations 
Cov_z       = zeros(size(Var_z,1),size(Var_z,2),auto_lag);
Cov_xf      = zeros(nx,nx,auto_lag);
Cov_xs      = zeros(nx,nx,auto_lag);
Cov_x       = zeros(nx,nx,auto_lag);
for i=1:auto_lag
    Cov_z(:,:,i)  = A^i*Var_z;
    Cov_xf(:,:,i) = Cov_z(1:nx,1:nx,i);
    Cov_xs(:,:,i) = Cov_z(nx+1:2*nx,nx+1:2*nx,i);
    Cov_x(:,:,i)  = Cov_xf(:,:,i) + Cov_xs(:,:,i) + Cov_z(1:nx,nx+1:2*nx,i) + Cov_z(nx+1:2*nx,1:nx,i);
end

% Moments of y: Recall y = C*z+d
C          = [gx gx 0.5*reshape(gxx,ny,nx*nx)];
d          = 0.5*gss*sig^2;
E_y        = C*E_z+d;
Var_y      = C*Var_z*C';
Cov_y      = zeros(ny,ny,auto_lag);
for i=1:auto_lag
    Cov_y(:,:,i) = C*Cov_z(:,:,i)*C';
end
