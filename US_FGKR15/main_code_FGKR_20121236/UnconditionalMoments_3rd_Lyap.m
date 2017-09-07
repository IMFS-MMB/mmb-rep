% For a DSGE model approximated up to third order, this function calculates 
% the unconditional first and second moments based on the the pruning
% scheme. The system reads
%     xf(t+1)  = hx*xf(t)  + sig*eta*eps(t);
%     xs(t+1)  = hx*xs(t)  + 0.5*reshape(hxx,nx,nx^2)*kron(xf(t),xf(t))+ 1/2*sig^2*hss;
%     xrd(t+1) = hx*xrd(t) + 2*0.5*reshape(hxx,nx,nx^2)*kron(xf(t),xs(t))...
%                + 1/6*reshape(hxxx,nx,nx^3)*kron(xf(t),kron(xf(t),xf(t)))
%                + 3/6*hssx*sig^2*xf(t) + 1/6*sig^3*hsss;
%     y(t+1)  = gx*(xf(t+1)+xs(t+1)+xrd(t+1)) ...
%                + 0.5*reshape(gxx,ny,nx^2)*(kron(xf(t+1),xf(t+1)+2*kron(xf(t+1),xs(t+1))+ 1/2*sig^2*gss
%                + 1/6*reshape(gxxx,ny,nx^3)*(kron(xf(t+1),kron(xf(t+1),xf(t+1)))
%                + 3/6*gssx*sig^2*xf(t+1) + 1/6*sig^3*gsss;
%
% IMPORTANT: Here we allow for general shock distributions, i.e. they may be
% non-symmetric. Variances are computed by solving the Lyaponov system
%
% INPUTS:
% gx,...,sig : The second order approximation of the DSGE model
% vectorMom3 : vector with dimensions 1*ne with third moments of shocks
% vectorMom4 : vector with dimensions 1*ne with fourth moments of shocks
% vectorMom5 : vector with dimensions 1*ne with fifth moments of shocks
% vectorMom6 : vector with dimensions 1*ne with sixth moments of shocks
% auto_lag   : the lag lenght for the auto-covariances (they need to be divided
%              by the standard deviations to get the correlations)
%
% OUTPUTS: 
% E_xrd      : mean of xrd
% E_y        : mean of y
% Var_xrd    : variance of xrd
% Var_x      : variance of x
% Var_y      : variance of y
% Cov_xrd    : the auto-covariances for xrd
% Cov_x      : the auto-covariances for x
% Cov_y      : the auto-covariances for y
%
% By M. Andreasen, 2011

function [E_xrd,E_y,Var_xrd,Var_x,Var_y,Cov_xrd,Cov_x,Cov_y] ...
    = UnconditionalMoments_3rd_Lyap(gx,gxx,gss,gxxx,gssx,gsss,hx,hxx,hss,hxxx,hssx,hsss,eta,sig,...
      vectorMom3,vectorMom4,vectorMom5,vectorMom6,Var_xs,Var_xfxf,Var_xs_xfxf,auto_lag);

% The dimensions
ny      = size(gx,1);
[nx,ne] = size(eta);
sigeta  = sig*eta;

% The value of E_u
E_eps3 = zeros(ne^3,1);
index = 0;
for phi1=1:ne
    for phi2=1:ne
        for phi3=1:ne
            index = index + 1;
            if phi1 == phi2 && phi1 == phi3
                E_eps3(index,1) = vectorMom3(1,phi1);
            end
        end
    end
end
E_u = kron(sigeta,kron(sigeta,sigeta))*E_eps3;

% The auxiliary system z=[xf xs kron(xf,xf) xr kron(xf,xs) kron(xf,kron(xf,xf))]
% The loading matrix
A = [hx                    ,zeros(nx,nx)    ,zeros(nx,nx^2)          , zeros(nx,nx)  ,  zeros(nx,nx^2)            , zeros(nx,nx^3)  ;
    zeros(nx,nx)          ,hx              ,0.5*reshape(hxx,nx,nx^2), zeros(nx,nx)  ,  zeros(nx,nx^2)            , zeros(nx,nx^3)  ;
    zeros(nx^2,nx)        ,zeros(nx^2,nx)  ,kron(hx,hx)             , zeros(nx^2,nx),  zeros(nx^2,nx^2)          , zeros(nx^2,nx^3);
    3/6*hssx*sig^2        ,zeros(nx,nx)    ,zeros(nx,nx^2)          , hx            ,  2*0.5*reshape(hxx,nx,nx^2), 1/6*reshape(hxxx,nx,nx^3);
    kron(hx,0.5*hss*sig^2),zeros(nx^2,nx)  ,zeros(nx^2,nx^2)        , zeros(nx^2,nx),  kron(hx,hx)               , kron(hx,0.5*reshape(hxx,nx,nx^2));
    zeros(nx^3,nx)        ,zeros(nx^3,nx)  ,zeros(nx^3,nx^2)        , zeros(nx^3,nx),  zeros(nx^3,nx^2)          , kron(hx,kron(hx,hx))   ];
% The constant term
c = [zeros(nx,1);
    0.5*hss*sig^2;
    kron(sig*eta,sig*eta)*reshape(eye(ne),ne^2,1);
    1/6*hsss*sig^3;
    zeros(nx^2,1);
    E_u];

% the mean value in the auxiliary system
%E_z       = inv(sparse(eye(3*nx+2*nx^2+nx^3)-A))*c;
E_z        = (sparse((eye(3*nx+2*nx^2+nx^3)-A)))\c;
E_xs       = E_z(nx+1:2*nx,1);
E_xf_xf    = reshape(E_z(2*nx+1:2*nx+nx^2,1),nx,nx);
E_xrd      = E_z(2*nx+nx^2+1:3*nx+nx^2,1);
E_xf_xs    = reshape(E_z(3*nx+nx^2+1:3*nx+2*nx^2,1),nx,nx);
E_xf_xf_xf = reshape(E_z(3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3,1),nx,nx,nx);

% Computing variance of the innovations
Var_inov = Get_VarInov_3rd(hx,hxx,hss,sigeta,sig,...
    vectorMom3,vectorMom4,vectorMom5,vectorMom6,E_xs,E_xf_xf,E_xf_xs,E_xf_xf_xf,E_u,...
    Var_xs,Var_xfxf,Var_xs_xfxf,nx,ne);

% Computing B*cov(z_t,xi_t+1+s)
LeadS = 0;
BCov_xiLeadS_z = Get_BCov_xiLeadS_z(hx,hxx,hxxx,hssx,sigeta,sig,...
    E_xs,E_xf_xf,E_xf_xs,E_xf_xf_xf,Var_xfxf,Var_xs_xfxf,nx,ne,LeadS);

% Constant terms
const_term = Var_inov + BCov_xiLeadS_z*A' + A*BCov_xiLeadS_z';

% Computing the variances of the state variables, using the Lyaponov routine
%Var_z       = dlyap(A,const_term);
Var_z       = dlyap_doubling(A,const_term);
%Var_xf     = Var_z(1:nx,1:nx);
%Var_xs     = Var_z(nx+1:2*nx,nx+1:2*nx);
Var_xrd    = Var_z(2*nx+nx^2+1:3*nx+nx^2,2*nx+nx^2+1:3*nx+nx^2);
Var_x      = Var_z(1:nx,1:nx) + Var_z(nx+1:2*nx,nx+1:2*nx) + Var_xrd ...
             + Var_z(1:nx,nx+1:2*nx)...                   %Cov(xf,xs)
             + Var_z(nx+1:2*nx,1:nx)...                   %Cov(xs,xf)
             + Var_z(1:nx,2*nx+nx^2+1:3*nx+nx^2)...       %Cov(xf,xrd)
             + Var_z(2*nx+nx^2+1:3*nx+nx^2,1:nx)...       %Cov(xrd,xf)             
             + Var_z(nx+1:2*nx,2*nx+nx^2+1:3*nx+nx^2)...  %Cov(xs,xrd)
             + Var_z(2*nx+nx^2+1:3*nx+nx^2,nx+1:2*nx);    %Cov(xrd,xs)
        
% Computing the auto-covariances
Cov_z      = zeros(size(Var_z,1),size(Var_z,2),auto_lag);
for i=1:auto_lag
    if i == 1
        Cov_z(:,:,i) = A*Var_z+BCov_xiLeadS_z;
    else
        LeadS = i-1;
        BCov_xiLeadS_z = Get_BCov_xiLeadS_z(hx,hxx,hxxx,hssx,sigeta,sig,...
            E_xs,E_xf_xf,E_xf_xs,E_xf_xf_xf,Var_xfxf,Var_xs_xfxf,nx,ne,LeadS);
        Cov_z(:,:,i) = A*Cov_z(:,:,i-1)+BCov_xiLeadS_z;
    end
    Cov_xf      = Cov_z(1:nx,1:nx,i);
    Cov_xs      = Cov_z(nx+1:2*nx,nx+1:2*nx,i);
    Cov_xrd     = Cov_z(2*nx+nx^2+1:3*nx+nx^2,2*nx+nx^2+1:3*nx+nx^2,i);
    Cov_x(:,:,i)= Cov_xf + Cov_xs + Cov_xrd ...
        + Cov_z(1:nx,nx+1:2*nx)...                   %Cov(xf,xs)
        + Cov_z(nx+1:2*nx,1:nx)...                   %Cov(xs,xf)
        + Cov_z(1:nx,2*nx+nx^2+1:3*nx+nx^2)...       %Cov(xf,xrd)
        + Cov_z(2*nx+nx^2+1:3*nx+nx^2,1:nx)...       %Cov(xrd,xf)
        + Cov_z(nx+1:2*nx,2*nx+nx^2+1:3*nx+nx^2)...  %Cov(xs,xrd)
        + Cov_z(2*nx+nx^2+1:3*nx+nx^2,nx+1:2*nx);    %Cov(xrd,xs)   
end

% Moments of y: Recall y = D*z+d
D          = [gx+3/6*gssx*sig^2 gx 0.5*reshape(gxx,ny,nx^2) gx 2*0.5*reshape(gxx,ny,nx^2) 1/6*reshape(gxxx,ny,nx^3)];
d          = 0.5*gss*sig^2+1/6*gsss*sig^3;
E_y        = D*E_z+d;
Var_y      = D*Var_z*D';
Cov_y      = zeros(ny,ny,auto_lag);
for i=1:auto_lag
    Cov_y(:,:,i) = D*Cov_z(:,:,i)*D';
end





% For a DSGE model approximated up to third order, this function calculates 
% the variance of the innovations to the extended state space system. 
% By M. Andreasen, 2010.
function Var_inov = Get_VarInov_3rd(hx,hxx,hss,sigeta,sig,...
      vectorMom3,vectorMom4,vectorMom5,vectorMom6,E_xs,E_xf_xf,E_xf_xs,E_xf_xf_xf,E_u,...
      Var_xs,Var_xfxf,Var_xs_xfxf,nx,ne);

% The size of the variance of the innovations
Var_inov = zeros(3*nx+2*nx^2+nx^3,3*nx+2*nx^2+nx^3); 

% Useful matrices which are used often
hx_hx         = kron(hx,hx);
sigeta_hx     = kron(sigeta,hx);
hx_sigeta     = kron(hx,sigeta);
sigeta_sigeta = kron(sigeta,sigeta);
sigeta_Htilxx = kron(sigeta,0.5*reshape(hxx,nx,nx^2));

%% We compute Var_inov_11
Var_inov(1:nx,1:nx) = sigeta*sigeta';

%% We compute Var_inov_13 var_inov_31
E_eps_eps2 = zeros(ne,ne^2);
for phi1=1:ne
    index2 = 0;
    for phi2=1:ne
        for phi3=1:ne
            index2 = index2 + 1;
            if (phi1 == phi2 && phi1 == phi3) 
                E_eps_eps2(phi1,index2) = vectorMom3(1,phi1);
            end
        end
    end
end
Var_inov(1:nx,2*nx+1:2*nx+nx^2) = sigeta*E_eps_eps2*sigeta_sigeta';
Var_inov(2*nx+1:2*nx+nx^2,1:nx) = Var_inov(1:nx,2*nx+1:2*nx+nx^2)';

%% We compute Var_inov_33
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
                %Second moments of the innovations
                if (phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4)
                    E_eps2_eps2(index1,index2) = 1;
                elseif (phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2)
                    E_eps2_eps2(index1,index2) = 1;
                elseif (phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2)                    
                    E_eps2_eps2(index1,index2) = 1;
                %Fourth moments of the innovations
                elseif (phi1 == phi2 && phi1 == phi3 && phi1 == phi4)
                    E_eps2_eps2(index1,index2) = vectorMom4(1,phi1);
                end
            end
        end
    end
end                  
Var_inov(2*nx+1:2*nx+nx^2,2*nx+1:2*nx+nx^2) = ...
     hx_sigeta*(kron(E_xf_xf,eye(ne)))*hx_sigeta'...
    +hx_sigeta*E_xfeps_epsxf*sigeta_hx'...
    +sigeta_hx*E_xfeps_epsxf'*hx_sigeta'...
    +sigeta_hx*(kron(eye(ne),E_xf_xf))*sigeta_hx'...
    +sigeta_sigeta*(E_eps2_eps2-reshape(eye(ne),ne^2,1)*reshape(eye(ne),ne^2,1)')...
    *sigeta_sigeta';

%% We compute Var_inov_15 and Var_inov_51
Var_inov(1:nx,3*nx+nx^2+1:3*nx+2*nx^2) = ...
      sigeta*kron(eye(ne),E_xs')*sigeta_hx'...                                                  %1)
    + sigeta*kron(eye(ne),reshape(E_xf_xf,1,nx^2))*sigeta_Htilxx'...                            %2)
    + sigeta*kron(sigeta,0.5*hss*sig^2)';                                                       %3)
Var_inov(3*nx+nx^2+1:3*nx+2*nx^2,1:nx) = Var_inov(1:nx,3*nx+nx^2+1:3*nx+2*nx^2)';

%% We compute Var_inov_16 and Var_inov_61
% For 2) below
E_eps_xfepsxf = zeros(ne,nx*ne*nx);
for phi1=1:ne
    index2 = 0;
    for gama1 =1:nx
        for phi2=1:ne
            for gama2=1:nx
                index2 = index2 +1;
                if phi1 == phi2
                    E_eps_xfepsxf(phi1,index2) = E_xf_xf(gama1,gama2);
                end
            end
        end
    end
end

% For 4) below
E_eps_eps3 = zeros(ne,ne^3);
for phi1=1:ne
    index2 = 0;
    for phi2=1:ne
        for phi3=1:ne
            for phi4=1:ne
                index2 = index2 + 1;
                %Second moments of the innovations
                if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                    E_eps_eps3(phi1,index2) = 1;
                elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                    E_eps_eps3(phi1,index2) = 1;
                elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                    E_eps_eps3(phi1,index2) = 1;    
                %Fourth moments of the innovations
                elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                    E_eps_eps3(phi1,index2) = vectorMom4(1,phi1);
                end
            end
        end
    end
end          

Var_inov(1:nx,3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3) = ...
      sigeta*kron(reshape(E_xf_xf,1,nx^2),eye(ne))*kron(hx,hx_sigeta)'...         %1)
    + sigeta*E_eps_xfepsxf*kron(hx,sigeta_hx)'...                                 %2)
    + sigeta*kron(eye(ne),reshape(E_xf_xf,1,nx^2))*kron(sigeta,hx_hx)'...         %3)
    + sigeta*E_eps_eps3*kron(sigeta,sigeta_sigeta)';                              %4)
Var_inov(3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3,1:nx) = Var_inov(1:nx,3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3)';

%% We compute Var_inov_35 and Var_inov_53
E_xfeps_epsxs = zeros(nx*ne,ne*nx);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for phi2=1:ne
            for gama2=1:nx
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xfeps_epsxs(index1,index2) = E_xf_xs(gama1,gama2);
                end
            end
        end
    end
end

E_xfeps_epsxfxf = zeros(nx*ne,ne*nx^2);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for phi2=1:ne
            for gama2=1:nx
                for gama3=1:nx
                    index2 = index2 + 1;
                    if phi1 == phi2
                        E_xfeps_epsxfxf(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end
        
E_eps2_epsxs = zeros(ne^2,ne*nx);
index1 = 0;
for phi1=1:ne
    for phi2=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for phi3=1:ne
            for gama1=1:nx
                index2 = index2 + 1;
                if phi1 == phi2 && phi1 == phi3
                    E_eps2_epsxs(index1,index2) = E_xs(gama1,1)*vectorMom3(1,phi1);
                end
            end
        end
    end
end

E_eps2_eps = E_eps_eps2';
%E_eps2_eps = zeros(ne^2,ne);
%for phi2=1:ne
%    index1 = 0;
%    for phi1=1:ne
%        for phi3=1:ne
%            index1 = index1 + 1;
%            if phi1 == phi2 && phi1 == phi3
%                E_eps2_eps(index1,phi2) = vectorMom3(1,phi1);
%            end
%        end
%    end
%end

Var_inov(2*nx+1:2*nx+nx^2,3*nx+nx^2+1:3*nx+2*nx^2) = ...
      hx_sigeta*E_xfeps_epsxs*sigeta_hx'...                                                                     %1)
    + hx_sigeta*E_xfeps_epsxfxf*sigeta_Htilxx'...                                                               %2)
    + sigeta_hx*kron(eye(ne),E_xf_xs)*sigeta_hx'...                                                             %3)
    + sigeta_hx*kron(eye(ne),reshape(E_xf_xf_xf,nx,nx^2))*sigeta_Htilxx'...                                     %4)
    + sigeta_sigeta*E_eps2_epsxs*sigeta_hx'...                                                                  %5)
    + sigeta_sigeta*kron(E_eps2_eps,reshape(E_xf_xf,1,nx^2))*sigeta_Htilxx'...                                  %6)
    + sigeta_sigeta*E_eps2_eps*kron(sigeta,0.5*hss*sig^2)';                                                     %7)
Var_inov(3*nx+nx^2+1:3*nx+2*nx^2,2*nx+1:2*nx+nx^2) = Var_inov(2*nx+1:2*nx+nx^2,3*nx+nx^2+1:3*nx+2*nx^2)';

%% We compute Var_inov_36 and Var_inov_63
% To 2) below
E_xfeps_xfepsxf = zeros(nx*ne,nx*ne*nx);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for gama2=1:nx
            for phi2=1:ne
                for gama3=1:nx
                    index2 = index2 + 1;
                    if phi1 == phi2
                        E_xfeps_xfepsxf(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end

% To 4) below
%E_xfeps_epsxfxf = zeros(nx*ne,ne*nx*nx);
%index1 = 0;
%for gama1=1:nx
%    for phi1=1:ne
%        index1 = index1 + 1;
%        index2 = 0;
%        for phi2=1:ne
%           for gama2=1:nx
%                for gama3=1:nx
%                    index2 = index2 + 1;
%                    if phi1 == phi2
%                        E_xfeps_epsxfxf(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3);
%                    end
%               end
%            end
%        end
%    end
%end

% To 5) below
E_xfeps_epsxfeps = zeros(nx*ne,ne*nx*ne);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for phi2=1:ne
            for gama2=1:nx
                for phi3=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2 && phi1 == phi3
                        E_xfeps_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom3(1,phi1);
                    end
                end
            end
        end
    end
end

% To 6) below
E_xfeps_eps2xf = zeros(nx*ne,ne*ne*nx);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for phi2=1:ne
            for phi3=1:ne
                for gama2=1:nx
                    index2 = index2 + 1;
                    if phi1 == phi2 && phi1 == phi3
                        E_xfeps_eps2xf(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom3(1,phi1);
                    end
                end
            end
        end
    end
end

% To 7) below
E_epsxf_xfxfeps = zeros(ne*nx,nx^2*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for gama2=1:nx
            for gama3=1:nx
                for phi2=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2
                        E_epsxf_xfxfeps(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end

% To 8) below
E_epsxf_xfepsxf = zeros(ne*nx,nx*ne*nx);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for gama2=1:nx
            for phi2=1:ne
                for gama3=1:nx
                    index2 = index2 + 1;
                    if phi1 == phi2
                        E_epsxf_xfepsxf(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end

% To 9) below
E_epsxf_xfeps2 = zeros(ne*nx,nx*ne*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for gama2=1:nx
            for phi2=1:ne
                for phi3=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2 && phi1 == phi3
                        E_epsxf_xfeps2(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom3(1,phi1);
                    end
                end
            end
        end
    end
end

% 11) below
E_epsxf_epsxfeps = zeros(ne*nx,ne*nx*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for phi2=1:ne
            for gama2=1:nx
                for phi3=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2 && phi1 == phi3
                        E_epsxf_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom3(1,phi1);
                    end
                end
            end
        end
    end
end

% To 14) below
E_eps2_xfepsxf = zeros(ne*ne,nx*ne*nx);
index1 = 0;
for phi1=1:ne
    for phi2=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for gama1=1:nx
            for phi3=1:ne
                for gama2=1:nx
                    index2 = index2 + 1;
                    if phi1 == phi2 && phi1 == phi3
                        E_eps2_xfepsxf(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom3(1,phi1);
                    end
                end
            end
        end
    end
end

% To 16) below
E_eps2_eps3 = zeros(ne*ne,ne*ne*ne);
index1 = 0;
for phi1=1:ne
    for phi2=1:ne
        index1 = index1 + 1;
        index2 = 0;
        for phi3=1:ne
            for phi4=1:ne
                for phi5=1:ne
                    index2 = index2 + 1;
                    % Second order moments times third order moments
                    if     phi1 == phi2 && phi2 == phi3 && phi4 == phi5 && phi1 ~= phi4
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi1);
                    elseif phi1 == phi3 && phi3 == phi4 && phi2 == phi5 && phi1 ~= phi2
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi1);
                    elseif phi1 == phi4 && phi4 == phi5 && phi2 == phi3 && phi1 ~= phi2
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi1);
                    elseif phi3 == phi4 && phi4 == phi5 && phi1 == phi2 && phi1 ~= phi3                        
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi3);
                    elseif phi2 == phi3 && phi3 == phi4 && phi1 == phi5 && phi1 ~= phi2 
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi2);
                    elseif phi1 == phi3 && phi3 == phi5 && phi2 == phi4 && phi1 ~= phi2 
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi1);
                    elseif phi1 == phi2 && phi1 == phi4 && phi3 == phi5 && phi1 ~= phi3 
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi1);
                    elseif phi1 == phi2 && phi1 == phi5 && phi3 == phi4 && phi1 ~= phi3 
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi1);
                    elseif phi2 == phi4 && phi2 == phi5 && phi1 == phi3 && phi1 ~= phi2 
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi2);
                    elseif phi2 == phi3 && phi2 == phi5 && phi1 == phi4 && phi1 ~= phi2 
                        E_eps2_eps3(index1,index2) = vectorMom3(1,phi2);
                        
                    % Fifth order moments 
                    elseif phi1 == phi2 && phi2 == phi3 && phi3 == phi4 && phi4 == phi5 
                        E_eps2_eps3(index1,index2) = vectorMom5(1,phi1);
                    %else
                    %    [phi1,phi2,phi3,phi4,phi5]
                    end
                end
            end
        end
    end
end            
                    
Var_inov(2*nx+1:2*nx+nx^2,3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3) = ...
    hx_sigeta*(kron(reshape(E_xf_xf_xf,nx,nx^2),eye(ne))*kron(hx,hx_sigeta)' ...                                 %1)
              + E_xfeps_xfepsxf*kron(hx,sigeta_hx)'...                                                           %2)
              + kron(E_xf_xf,E_eps_eps2)*kron(hx,sigeta_sigeta)'...                                              %3)
              + E_xfeps_epsxfxf*kron(sigeta,hx_hx)'...                                                           %4)
              + E_xfeps_epsxfeps*kron(sigeta,hx_sigeta)'...                                                      %5)
              + E_xfeps_eps2xf*kron(sigeta,sigeta_hx)' )...                                                      %6)
 + sigeta_hx*(E_epsxf_xfxfeps*kron(hx,hx_sigeta)'...                                                             %7)
              + E_epsxf_xfepsxf*kron(hx,sigeta_hx)'...                                                           %8)
              + E_epsxf_xfeps2*kron(hx,sigeta_sigeta)'...                                                        %9)
              + kron(eye(ne),reshape(E_xf_xf_xf,nx,nx^2))*kron(sigeta,hx_hx)'...                                 %10)
              + E_epsxf_epsxfeps*kron(sigeta,hx_sigeta)'...                                                      %11)
              + kron(E_eps_eps2,E_xf_xf)*kron(sigeta,sigeta_hx)' )...                                            %12)
 + sigeta_sigeta*(kron(reshape(E_xf_xf,1,nx^2),E_eps2_eps)*kron(hx,hx_sigeta)'...                                %13)
              + E_eps2_xfepsxf*kron(hx,sigeta_hx)'...                                                            %14)
              + kron(E_eps2_eps,reshape(E_xf_xf,1,nx^2))*kron(sigeta,hx_hx)'...                                 %15)
              + E_eps2_eps3*kron(sigeta,sigeta_sigeta)'...                                                       %16)
              - reshape(eye(ne),ne^2,1)*E_u' );                                                                  %17)

Var_inov(3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3,2*nx+1:2*nx+nx^2) = Var_inov(2*nx+1:2*nx+nx^2,3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3)';          

%% We compute Var_inov_55
% To 1) below
E_xs_xs = Var_xs+E_xs*E_xs';

% To 2) below
E_xs_xfxf = Var_xs_xfxf + E_xs*reshape(E_xf_xf,1,nx^2);

% To 5) below
E_xf_xf_xf_xf = reshape(Var_xfxf + reshape(E_xf_xf,nx^2,1)*reshape(E_xf_xf,1,nx^2),nx,nx,nx,nx);

Var_inov(3*nx+nx^2+1:3*nx+2*nx^2,3*nx+nx^2+1:3*nx+2*nx^2) = ...
 + sigeta_hx*(kron(eye(ne),E_xs_xs)*sigeta_hx'...                                                                %1)
              + kron(eye(ne),E_xs_xfxf)*sigeta_Htilxx'...                                                        %2)
              + kron(eye(ne),E_xs)*kron(sigeta,0.5*hss*sig^2)' )...                                              %3)
 + sigeta_Htilxx*(kron(eye(ne),E_xs_xfxf')*sigeta_hx'...                                                         %4)
              + kron(eye(ne),reshape(E_xf_xf_xf_xf,nx^2,nx^2))*sigeta_Htilxx'...                                 %5)
              + kron(eye(ne),reshape(E_xf_xf,nx^2,1))*kron(sigeta,0.5*hss*sig^2)' )...                           %6)
 + kron(sigeta,0.5*hss*sig^2)*(kron(eye(ne),E_xs')*sigeta_hx'...                                                 %7)
              + kron(eye(ne),reshape(E_xf_xf,1,nx^2))*sigeta_Htilxx'...                                          %8)
              + kron(sigeta,0.5*hss*sig^2)');                                                                    %9)

%% We compute Var_inov_56 and Var_inov_65
% To 1) below
E_xs_xf_xf      = reshape(E_xs_xfxf,nx,nx,nx);  
E_epsxs_xfxfeps = zeros(ne*nx,nx*nx*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for gama2=1:nx
            for gama3=1:nx
                for phi2=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2
                        E_epsxs_xfxfeps(index1,index2) = E_xs_xf_xf(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end
                    
% To 2) below
E_epsxs_xfepsxf = zeros(ne*nx,nx*ne*nx);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for gama2=1:nx
            for phi2=1:ne
                for gama3=1:nx
                    index2 = index2 + 1;
                    if phi1 == phi2
                        E_epsxs_xfepsxf(index1,index2) = E_xs_xf_xf(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end

% To 3) below
E_epsxs_xfeps2 = zeros(ne*nx,nx*ne*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for gama2=1:nx
            for phi2=1:ne
                for phi3=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2 && phi1 == phi3
                        E_epsxs_xfeps2(index1,index2) = E_xf_xs(gama2,gama1)*vectorMom3(1,phi1);
                    end
                end
            end
        end
    end
end

% To 5) below
E_epsxs_epsxfeps = zeros(ne*nx,ne*nx*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for phi2=1:ne
            for gama2=1:nx
                for phi3=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2 && phi1 == phi3
                        E_epsxs_epsxfeps(index1,index2) = E_xf_xs(gama2,gama1)*vectorMom3(1,phi1);
                    end
                end
            end
        end
    end
end

% To 8) below
E_epsxfxf_xfxfeps = zeros(ne*nx*nx,nx*nx*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for gama3=1:nx
                for gama4=1:nx
                    for phi2=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2
                            E_epsxfxf_xfxfeps(index1,index2) = E_xf_xf_xf_xf(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end

% To 9) below
E_epsxfxf_xfepsxf = zeros(ne*nx*nx,nx*ne*nx);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for gama3=1:nx
                for phi2=1:ne
                    for gama4=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2
                            E_epsxfxf_xfepsxf(index1,index2) = E_xf_xf_xf_xf(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end

% To 10) below
E_epsxfxf_xfeps2 = zeros(ne*nx*nx,nx*ne*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for gama3=1:nx
                for phi2=1:ne
                    for phi3=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_epsxfxf_xfeps2(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 12) below
E_epsxfxf_epsxfeps = zeros(ne*nx*nx,ne*nx*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for gama3=1:nx
                    for phi3=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_epsxfxf_epsxfeps(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

Var_inov(3*nx+nx^2+1:3*nx+2*nx^2,3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3) = ...
 + sigeta_hx*(E_epsxs_xfxfeps*kron(hx,hx_sigeta)'...                                                             %1)
              + E_epsxs_xfepsxf*kron(hx,sigeta_hx)'...                                                           %2)
              + E_epsxs_xfeps2*kron(hx,sigeta_sigeta)'...                                                        %3)
              + kron(eye(ne),E_xs_xfxf)*kron(sigeta,hx_hx)'...                                                   %4)
              + E_epsxs_epsxfeps*kron(sigeta,hx_sigeta)'...                                                     %5)
              + kron(E_eps_eps2,E_xf_xs')*kron(sigeta,sigeta_hx)'...                                            %6)
              + kron(E_eps_eps3,E_xs)*kron(sigeta,sigeta_sigeta)' )...                                           %7)
 + sigeta_Htilxx*(E_epsxfxf_xfxfeps*kron(hx,hx_sigeta)'...                                                       %8)
              + E_epsxfxf_xfepsxf*kron(hx,sigeta_hx)'...                                                         %9)
              + E_epsxfxf_xfeps2*kron(hx,sigeta_sigeta)'...                                                      %10)
              + kron(eye(ne),reshape(E_xf_xf_xf_xf,nx^2,nx^2))*kron(sigeta,hx_hx)'...                            %11)
              + E_epsxfxf_epsxfeps*kron(sigeta,hx_sigeta)'...                                                    %12)
              + kron(E_eps_eps2,reshape(E_xf_xf_xf,nx^2,nx))*kron(sigeta,sigeta_hx)'...                          %13)
              + kron(E_eps_eps3,reshape(E_xf_xf,nx^2,1))*kron(sigeta,sigeta_sigeta)' )...                        %14)
 + kron(sigeta,0.5*hss*sig^2)*(kron(reshape(E_xf_xf,1,nx^2),eye(ne))*kron(hx,hx_sigeta)'...                      %15)
              + E_eps_xfepsxf*kron(hx,sigeta_hx)'...                                                             %16)
              + kron(eye(ne),reshape(E_xf_xf,1,nx^2))*kron(sigeta,hx_hx)'...                                     %17)
              + E_eps_eps3*kron(sigeta,sigeta_sigeta)');                                                         %18)

Var_inov(3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3,3*nx+nx^2+1:3*nx+2*nx^2) = ...
    Var_inov(3*nx+nx^2+1:3*nx+2*nx^2,3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3)';          
%% We compute Var_inov_66

% To 1) below
E_xfxfeps_xfxfeps = zeros(nx*nx*ne,nx*nx*ne);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        for phi1=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for gama3=1:nx
                for gama4=1:nx
                    for phi2=1:ne
                        index2 = index2 + 1;
                        if phi1 ==  phi2
                            E_xfxfeps_xfxfeps(index1,index2) = E_xf_xf_xf_xf(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end

% To 2) below
E_xfxfeps_xfepsxf = zeros(nx*nx*ne,nx*ne*nx);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        for phi1=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for gama3=1:nx
                for phi2=1:ne
                    for gama4=1:nx
                        index2 = index2 + 1;
                        if phi1 ==  phi2
                            E_xfxfeps_xfepsxf(index1,index2) = E_xf_xf_xf_xf(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end

% To 3) below
E_xfxfeps_xfeps2 = zeros(nx*nx*ne,nx*ne*ne);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        for phi1=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for gama3=1:nx
                for phi2=1:ne
                    for phi3=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_xfxfeps_xfeps2(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 4) below
E_xfxfeps_epsxfxf = zeros(nx*nx*ne,ne*nx*nx);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        for phi1=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for gama3=1:nx
                    for gama4=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2
                            E_xfxfeps_epsxfxf(index1,index2) = E_xf_xf_xf_xf(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end

% To 5) below
E_xfxfeps_epsxfeps = zeros(nx*nx*ne,ne*nx*ne);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        for phi1=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for gama3=1:nx
                    for phi3=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_xfxfeps_epsxfeps(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 6) below
E_xfxfeps_eps2xf = zeros(nx*nx*ne,ne*ne*nx);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        for phi1=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for phi3=1:ne
                    for gama3=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_xfxfeps_eps2xf(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 7) below
E_xfxfeps_eps3 = zeros(nx*nx*ne,ne*ne*ne);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        for phi1=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for phi3=1:ne
                    for phi4=1:ne
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_xfxfeps_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_xfxfeps_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_xfxfeps_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_xfxfeps_eps3(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 8) below
E_xfepsxf_xfxfeps = E_xfxfeps_xfepsxf';

% To 9) below
E_xfepsxf_xfepsxf = zeros(nx*ne*nx,nx*ne*nx);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for gama3=1:nx
                for phi2=1:ne
                    for gama4=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2
                            E_xfepsxf_xfepsxf(index1,index2) = E_xf_xf_xf_xf(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end

% To 10) below
E_xfepsxf_xfeps2 = zeros(nx*ne*nx,nx*ne*ne);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for gama3=1:nx
                for phi2=1:ne
                    for phi3=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_xfepsxf_xfeps2(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 11) below 
E_xfepsxf_epsxfxf = zeros(nx*ne*nx,ne*nx*nx);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for gama3=1:nx
                    for gama4=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2
                            E_xfepsxf_epsxfxf(index1,index2) = E_xf_xf_xf_xf(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end

% To 12) below 
E_xfepsxf_epsxfeps = zeros(nx*ne*nx,ne*nx*ne);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for gama3=1:nx
                    for phi3=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_xfepsxf_epsxfeps(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 13) below
E_xfepsxf_eps2xf = zeros(nx*ne*nx,ne*ne*nx);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for phi3=1:ne
                    for gama3=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_xfepsxf_eps2xf(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 14) below
E_xfepsxf_eps3 = zeros(nx*ne*nx,ne*ne*ne);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for phi3=1:ne
                    for phi4=1:ne
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_xfepsxf_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_xfepsxf_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_xfepsxf_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_xfepsxf_eps3(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 15) below
E_xfeps2_xfxfeps = E_xfxfeps_xfeps2';

% To 16) below
E_xfeps2_xfepsxf = E_xfepsxf_xfeps2';

% To 17) below
E_xfeps2_xfeps2 = zeros(nx*ne*ne,nx*ne*ne);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for phi2=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for gama2=1:nx
                for phi3=1:ne
                    for phi4=1:ne
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_xfeps2_xfeps2(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_xfeps2_xfeps2(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_xfeps2_xfeps2(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_xfeps2_xfeps2(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 18) below
E_xfeps2_epsxfxf = zeros(nx*ne*ne,ne*nx*nx);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for phi2=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi3=1:ne
                for gama2=1:nx
                    for gama3=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_xfeps2_epsxfxf(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 19) below
E_xfeps2_epsxfeps = zeros(nx*ne*ne,ne*nx*ne);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for phi2=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi3=1:ne
                for gama2=1:nx
                    for phi4=1:ne
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_xfeps2_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_xfeps2_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_xfeps2_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_xfeps2_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 20) below 
E_xfeps2_eps2xf = zeros(nx*ne*ne,ne*ne*nx);
index1 = 0;
for gama1=1:nx
    for phi1=1:ne
        for phi2=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi3=1:ne
                for phi4=1:ne
                    for gama2=1:nx
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_xfeps2_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_xfeps2_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_xfeps2_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_xfeps2_eps2xf(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 21) below
%E_epsxfxf_xfxfeps = E_xfxfeps_epsxfxf'; 

% To 22) below 
%E_epsxfxf_xfepsxf = E_xfepsxf_epsxfxf';

% To 23) below 
%E_epsxfxf_xfeps2  = E_xfeps2_epsxfxf';

% To 24) below
E_epsxfxf_epsxfxf = zeros(ne*nx*nx,ne*nx*nx);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for gama3=1:nx
                    for gama4=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2 
                            E_epsxfxf_epsxfxf(index1,index2) = E_xf_xf_xf_xf(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end

% To 25) below 
%E_epsxfxf_epsxfeps = zeros(ne*nx*nx,ne*nx*ne);
%index1 = 0;
%for phi1=1:ne
%    for gama1=1:nx
%        for gama2=1:nx
%            index1 = index1 + 1;
%            index2 = 0;
%            for phi2=1:ne
%                for gama3=1:nx
%                    for phi3=1:ne
%                        index2 = index2 + 1;
%                        if phi1 == phi2 && phi1 == phi3
%                            E_epsxfxf_epsxfeps(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
%                        end
%                    end
%                end
%            end
%        end
%    end
%end

% To 26) below
E_epsxfxf_eps2xf = zeros(ne*nx*nx,ne*ne*nx);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for phi3=1:ne
                    for gama3=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2 && phi1 == phi3
                            E_epsxfxf_eps2xf(index1,index2) = E_xf_xf_xf(gama1,gama2,gama3)*vectorMom3(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 27) below 
E_epsxfxf_eps3 = zeros(ne*nx*nx,ne*ne*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for gama2=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi2=1:ne
                for phi3=1:ne
                    for phi4=1:ne
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_epsxfxf_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_epsxfxf_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_epsxfxf_eps3(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_epsxfxf_eps3(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 28) below
E_epsxfeps_xfxfeps = E_xfxfeps_epsxfeps';

% To 29) below
E_epsxfeps_xfepsxf = E_xfepsxf_epsxfeps';

% To 30) below
E_epsxfeps_xfeps2  = E_xfeps2_epsxfeps';

% To 31) below
E_epsxfeps_epsxfxf = E_epsxfxf_epsxfeps';

% To 32) below 
E_epsxfeps_epsxfeps = zeros(ne*nx*ne,ne*nx*ne);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for phi2=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi3=1:ne
                for gama2=1:nx
                    for phi4=1:ne
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_epsxfeps_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_epsxfeps_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_epsxfeps_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_epsxfeps_epsxfeps(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end

% To 33) below
E_epsxfeps_eps2xf = zeros(ne*nx*ne,ne*ne*nx);
index1 = 0;
for phi1=1:ne
    for gama1=1:nx
        for phi2=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi3=1:ne
                for phi4=1:ne
                    for gama2=1:nx
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_epsxfeps_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_epsxfeps_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_epsxfeps_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_epsxfeps_eps2xf(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end             

% To 34) below
E_eps2xf_xfxfeps = E_xfxfeps_eps2xf';

% To 35) below
E_eps2xf_xfepsxf = E_xfepsxf_eps2xf';

% To 36) below
E_eps2xf_xfeps2  = E_xfeps2_eps2xf';

% To 37) below
E_eps2xf_epsxfxf = E_epsxfxf_eps2xf';

% To 38) below
E_eps2xf_epsxfeps = E_epsxfeps_eps2xf';

% To 39) below
E_eps2xf_eps2xf = zeros(ne*ne*nx,ne*ne*nx);
index1 = 0;
for phi1=1:ne
    for phi2=1:ne
        for gama1=1:nx
            index1 = index1 + 1;
            index2 = 0;
            for phi3=1:ne
                for phi4=1:ne
                    for gama2=1:nx
                        index2 = index2 + 1;
                        %Second moments of the innovations
                        if phi1 == phi2 && phi3 == phi4 && phi1 ~= phi4
                            E_eps2xf_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi3 && phi2 == phi4 && phi1 ~= phi2
                            E_eps2xf_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                        elseif phi1 == phi4 && phi2 == phi3 && phi1 ~= phi2
                            E_eps2xf_eps2xf(index1,index2) = E_xf_xf(gama1,gama2);
                            %Fourth moments of the innovations
                        elseif phi1 == phi2 && phi3 == phi4 && phi1 == phi4
                            E_eps2xf_eps2xf(index1,index2) = E_xf_xf(gama1,gama2)*vectorMom4(1,phi1);
                        end
                    end
                end
            end
        end
    end
end             

% To 40) below
E_eps3_xfxfeps = E_xfxfeps_eps3';

% To 41) below
E_eps3_xfepsxf = E_xfepsxf_eps3';

% To 42) below
E_eps3_epsxfxf = E_epsxfxf_eps3';

% To 43) below
E_eps3_eps3 = zeros(ne^3,ne^3);
index1 = 0;
for phi1=1:ne
    for phi2=1:ne
        for phi3=1:ne
            index1 = index1 + 1;
            index2 = 0;
            for phi4=1:ne
                for phi5=1:ne
                    for phi6=1:ne
                        index2 = index2 + 1;
                        % Second order moemnts
                        if     phi1 == phi2 && phi3 == phi4 && phi5 == phi6 && phi1 ~= phi3 && phi1 ~= phi5 && phi3 ~= phi5
                            E_eps3_eps3(index1,index2) = 1;
                        elseif phi1 == phi3 && phi2 == phi4 && phi5 == phi6 && phi1 ~= phi2 && phi1 ~= phi5 && phi2 ~= phi5
                            E_eps3_eps3(index1,index2) = 1;
                        elseif phi1 == phi4 && phi2 == phi3 && phi5 == phi6 && phi1 ~= phi2 && phi1 ~= phi5 && phi2 ~= phi5                            
                            E_eps3_eps3(index1,index2) = 1;

                        % Third order moments
                        elseif phi1 == phi2 && phi1 == phi3 && phi4 == phi5 && phi4 == phi6 && phi1 ~= phi4 
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi4);
                        elseif phi1 == phi2 && phi1 == phi4 && phi3 == phi5 && phi3 == phi6 && phi1 ~= phi3                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi3);                            
                        elseif phi1 == phi2 && phi1 == phi5 && phi3 == phi4 && phi3 == phi6 && phi1 ~= phi3                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi3);                            
                        elseif phi1 == phi2 && phi1 == phi6 && phi3 == phi4 && phi3 == phi5 && phi1 ~= phi3                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi3);                            
                        elseif phi1 == phi3 && phi1 == phi4 && phi2 == phi5 && phi2 == phi6 && phi1 ~= phi2                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi2);                            
                        elseif phi1 == phi4 && phi1 == phi6 && phi2 == phi3 && phi2 == phi5 && phi1 ~= phi2                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi2);                            
                        elseif phi1 == phi5 && phi1 == phi6 && phi2 == phi3 && phi2 == phi4 && phi1 ~= phi2                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi2);                            
                        elseif phi1 == phi3 && phi1 == phi5 && phi2 == phi4 && phi2 == phi6 && phi1 ~= phi2                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi2);                            
                        elseif phi1 == phi3 && phi1 == phi6 && phi2 == phi4 && phi2 == phi5 && phi1 ~= phi2                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi2);                            
                        elseif phi1 == phi4 && phi1 == phi5 && phi2 == phi3 && phi2 == phi6 && phi1 ~= phi2                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi2);                            
                        elseif phi1 == phi3 && phi1 == phi6 && phi2 == phi4 && phi2 == phi6 && phi1 ~= phi2                             
                            E_eps3_eps3(index1,index2) = vectorMom3(1,phi1)*vectorMom3(1,phi2);                            
                            
                        % Fourth order moments
                        elseif phi1 == phi2 && phi2 == phi3 && phi3 == phi4 && phi5 == phi6 && phi1 ~= phi5 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi1 == phi2 && phi2 == phi3 && phi3 == phi5 && phi4 == phi6 && phi1 ~= phi4 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi1 == phi2 && phi2 == phi3 && phi3 == phi6 && phi4 == phi5 && phi1 ~= phi4 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi1 == phi2 && phi1 == phi4 && phi1 == phi5 && phi3 == phi6 && phi1 ~= phi3 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi1 == phi2 && phi1 == phi4 && phi1 == phi6 && phi3 == phi5 && phi1 ~= phi3 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi1 == phi2 && phi1 == phi5 && phi1 == phi6 && phi3 == phi4 && phi1 ~= phi3 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi3 == phi4 && phi3 == phi5 && phi3 == phi6 && phi1 == phi2 && phi3 ~= phi1 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi3);                                        
                        elseif phi1 == phi3 && phi1 == phi4 && phi1 == phi5 && phi2 == phi6 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi1 == phi3 && phi1 == phi4 && phi1 == phi6 && phi2 == phi5 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi1 == phi3 && phi1 == phi5 && phi1 == phi6 && phi2 == phi4 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi2 == phi4 && phi2 == phi5 && phi2 == phi6 && phi1 == phi3 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi2);                                        
                        elseif phi1 == phi4 && phi1 == phi5 && phi1 == phi6 && phi2 == phi3 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi1);                                        
                        elseif phi2 == phi3 && phi2 == phi5 && phi2 == phi6 && phi1 == phi4 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi2);                                        
                        elseif phi2 == phi3 && phi2 == phi4 && phi2 == phi6 && phi1 == phi5 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi2);                                        
                        elseif phi2 == phi3 && phi2 == phi4 && phi2 == phi5 && phi1 == phi6 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi2);                                        
                        elseif phi2 == phi3 && phi2 == phi4 && phi2 == phi5 && phi1 == phi6 && phi1 ~= phi2 
                            E_eps3_eps3(index1,index2) = vectorMom4(1,phi2);                                        
                            
                        % Fixth order moments
                        elseif phi1 == phi2 && phi2 == phi3 && phi3 == phi4 && phi4 == phi5 && phi5 == phi6 
                            E_eps3_eps3(index1,index2) = vectorMom6(1,phi1);
                        %else
                        %    [phi1,phi2,phi3,phi4,phi5,phi6]
                        end
                    end
                end
            end
        end
    end
end


Var_inov(3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3,3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3) = ...
 + kron(hx,hx_sigeta)*(E_xfxfeps_xfxfeps*kron(hx,hx_sigeta)'...                                                  %1)
             + E_xfxfeps_xfepsxf*kron(hx,sigeta_hx)'...                                                          %2)
             + E_xfxfeps_xfeps2*kron(hx,sigeta_sigeta)'...                                                       %3)
             + E_xfxfeps_epsxfxf*kron(sigeta,hx_hx)'...                                                         %4)
             + E_xfxfeps_epsxfeps*kron(sigeta,hx_sigeta)'...                                                     %5)
             + E_xfxfeps_eps2xf*kron(sigeta,sigeta_hx)'...                                                       %6)
             + E_xfxfeps_eps3*kron(sigeta,sigeta_sigeta)' )...                                                   %7)
 + kron(hx,sigeta_hx)*(E_xfepsxf_xfxfeps*kron(hx,hx_sigeta)'...                                                  %8)
             + E_xfepsxf_xfepsxf*kron(hx,sigeta_hx)'...                                                          %9)
             + E_xfepsxf_xfeps2*kron(hx,sigeta_sigeta)'...                                                       %10)
             + E_xfepsxf_epsxfxf*kron(sigeta,hx_hx)'...                                                          %11)
             + E_xfepsxf_epsxfeps*kron(sigeta,hx_sigeta)'...                                                     %12)
             + E_xfepsxf_eps2xf*kron(sigeta,sigeta_hx)'...                                                       %13)
             + E_xfepsxf_eps3*kron(sigeta,sigeta_sigeta)' )...                                                   %14)
 + kron(hx,sigeta_sigeta)*(E_xfeps2_xfxfeps*kron(hx,hx_sigeta)'...                                              %15)
             + E_xfeps2_xfepsxf*kron(hx,sigeta_hx)'...                                                           %16)
             + E_xfeps2_xfeps2*kron(hx,sigeta_sigeta)'...                                                       %17)
             + E_xfeps2_epsxfxf*kron(sigeta,hx_hx)'...                                                           %18)
             + E_xfeps2_epsxfeps*kron(sigeta,hx_sigeta)'...                                                      %19)
             + E_xfeps2_eps2xf*kron(sigeta,sigeta_hx)' )...                                                      %20)
 + kron(sigeta,hx_hx)*(E_epsxfxf_xfxfeps*kron(hx,hx_sigeta)'...                                                  %21)
             + E_epsxfxf_xfepsxf*kron(hx,sigeta_hx)'...                                                         %22)
             + E_epsxfxf_xfeps2*kron(hx,sigeta_sigeta)'...                                                       %23)
             + E_epsxfxf_epsxfxf*kron(sigeta,hx_hx)'...                                                          %24)
             + E_epsxfxf_epsxfeps*kron(sigeta,hx_sigeta)'...                                                     %25)
             + E_epsxfxf_eps2xf*kron(sigeta,sigeta_hx)'...                                                      %26)
             + E_epsxfxf_eps3*kron(sigeta,sigeta_sigeta)' )...                                                  %27)
 + kron(sigeta,hx_sigeta)*(E_epsxfeps_xfxfeps*kron(hx,hx_sigeta)'...                                             %28)
             + E_epsxfeps_xfepsxf*kron(hx,sigeta_hx)'...                                                         %29)
             + E_epsxfeps_xfeps2*kron(hx,sigeta_sigeta)'...                                                      %30)
             + E_epsxfeps_epsxfxf*kron(sigeta,hx_hx)'...                                                         %31)
             + E_epsxfeps_epsxfeps*kron(sigeta,hx_sigeta)'...                                                    %32)
             + E_epsxfeps_eps2xf*kron(sigeta,sigeta_hx)' )...                                                    %33)
 + kron(sigeta,sigeta_hx)*(E_eps2xf_xfxfeps*kron(hx,hx_sigeta)'...                                               %34)
             + E_eps2xf_xfepsxf*kron(hx,sigeta_hx)'...                                                           %35)
             + E_eps2xf_xfeps2*kron(hx,sigeta_sigeta)'...                                                        %36)
             + E_eps2xf_epsxfxf*kron(sigeta,hx_hx)'...                                                           %37)
             + E_eps2xf_epsxfeps*kron(sigeta,hx_sigeta)'...                                                      %38)
             + E_eps2xf_eps2xf*kron(sigeta,sigeta_hx)' )...                                                      %39)
 + kron(sigeta,sigeta_sigeta)*(E_eps3_xfxfeps*kron(hx,hx_sigeta)'...                                             %40)
             + E_eps3_xfepsxf*kron(hx,sigeta_hx)'...                                                             %41)
             + E_eps3_epsxfxf*kron(sigeta,hx_hx)'...                                                             %42)
             + E_eps3_eps3*kron(sigeta,sigeta_sigeta)')...                                                       %43)
 -E_u*E_u';
