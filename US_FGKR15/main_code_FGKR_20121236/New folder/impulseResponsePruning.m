% By Martin M. Andreasen, 2012
% This function computes closed-form expressions for the impulse response
% functions using the pruning method when using the following definition 
% of the impulse response function.
%
% impulse(x_t+l) = E_t[w_t|eps_t+1=eps_t+1+shockSize, eps_t+2, eps_t+3, ..., eps_t+l]
%                 -E_t[w_t|eps_t+1=eps_t+1          , eps_t+2, eps_t+3, ..., eps_t+l]
%
% Note that this definition is slightly different from the one behind the 
% so-called Generalized Impulse Reponse Function (GIRF)
%
% OUTPUT:
% IRFy = impulse response function for y = g(x,sig)
%        dimension = ny * length * 3
%        IRFy(:,:,1) = impulse responses at first order
%        IRFy(:,:,2) = impulse responses at second order
%        IRFy(:,:,3) = impulse responses at third order
% IRFx = impulse response function for x = h(x,sig)
%        dimension = nx * length * 3
%        IRFx(:,:,1) = impulse responses at first order
%        IRFx(:,:,2) = impulse responses at second order
%        IRFx(:,:,3) = impulse responses at third order
% NOTE: if xf = [] and xs = [], then we use the default setting and apply
% the mean values of xf and xs.

function [IRFy,IRFx] = impulseResponsePruning(gx,gxx,gss,gxxx,gssx,gsss,hx,hxx,hss,hxxx,hssx,hsss,eta,shockSize,xf,xs,order_app,IRFlength)

% The dimension of the model
[ny,nx] = size(gx);
ne      = size(eta,2);
sig     = 1;
IRFy    = zeros(ny,IRFlength,3);
IRFx    = zeros(nx,IRFlength,3);

% Defining matrices
HHxxtil  = 1/2*reshape(hxx,nx,nx^2);
HHxxxtil = 1/6*reshape(hxxx,nx,nx^3);
GGxxtil  = 1/2*reshape(gxx,ny,nx^2);   
GGxxxtil = 1/6*reshape(gxxx,ny,nx^3);

% Checking on shockSize
[n1,n2] = size(shockSize);
% ensuring that we have a column vector
if n2 > n1
    shockSize = shockSize';
end
if size(shockSize,1) ~= ne
    error('lenght of shockSize must be equal to ne');
end

%% Computing the mean values for xf and xs
sigeta     = sig*eta;
eta_eta    = eta*eta';
AA          = (eye(nx)-hx)\eye(nx); %inv(eye(nx)-hx);
vec_var_xf = (eye(nx^2)-kron(hx,hx))\reshape(sig^2*eta_eta,nx^2,1); 
%vec_var_xf = inv(eye(nx^2)-kron(hx,hx))*reshape(sig^2*eta_eta,nx^2,1);
var_xf     = reshape(vec_var_xf,nx,nx);
mean_xfxf  = var_xf;
mean_xs    = AA*(0.5*reshape(hxx,nx,nx^2,1)*reshape(mean_xfxf,nx^2,1)+0.5*hss*sig^2);
if isempty(xf)
    xf = zeros(nx,1);
end
if isempty(xs)
    xs = mean_xs;
end

%% Impulse response functions at first order
IRFy1st = zeros(ny,IRFlength);
IRFxf   = zeros(nx,IRFlength);
for k=1:IRFlength
    IRFxf(:,k) = hx^(k-1)*sigeta*shockSize;
    IRFy1st(:,k) = gx*IRFxf(:,k);
end
% Saving output
IRFy(:,:,1) = IRFy1st;
IRFx(:,:,1) = IRFxf;
if order_app == 1
    return
end

%% Impulse response functions at second order
IRFy2nd = zeros(ny,IRFlength);
IRFxs   = zeros(nx,IRFlength);
IRFxfxf = zeros(nx^2,IRFlength);
consQ   = kron(sigeta*shockSize,sigeta*shockSize);
% Computing IRFxfxf
for k=1:IRFlength
    IRFxfxf(:,k) = kron(hx^k*xf,hx^(k-1)*sigeta*shockSize) + kron(hx^(k-1)*sigeta*shockSize,hx^k*xf) + ...
            kron(hx^(k-1),hx^(k-1))*consQ;
end
% Computing IRFxs and IRFy2nd
for k=1:IRFlength
    % The non-recursive version
    %for j=1:k-1
    %    IRFxs(:,k) = IRFxs(:,k) + hx^(k-1-j)*HHxxtil*(kron(hx^j*xf,hx^(j-1)*sigeta*shockSize) ...
    %        + kron(hx^(j-1)*sigeta*shockSize,hx^j*xf) ...
    %        + kron(hx^(j-1),hx^(j-1))*consQ); 
    %end
    if k > 1
        IRFxs(:,k) = hx*IRFxs(:,k-1) + HHxxtil*IRFxfxf(:,k-1);
    end
    IRFy2nd(:,k) = gx*(IRFxf(:,k)+IRFxs(:,k)) + GGxxtil*IRFxfxf(:,k);
end
% Saving output 
IRFy(:,:,2) = IRFy2nd;
IRFx(:,:,2) = IRFxf+IRFxs;
if order_app == 2
    return
end

%% Impulse response functions a third order
IRFy3rd   = zeros(ny,IRFlength);
IRFxrd    = zeros(nx,IRFlength);
IRFxfxs   = zeros(nx^2,IRFlength);
IRFxfxfxf = zeros(nx^3,IRFlength);
xf_xf     = kron(xf,xf);

etaEps_etaEps = zeros(nx^2,1);
idx = 0;
for gama2=1:nx
    for gama1=1:nx
        idx = idx + 1;
        etaEps_etaEps(idx,1) = eta(gama2,:)*eta(gama1,:)'*sig^2;
    end
end
% Computing IRFxfxfxf
for k=1:IRFlength
    term1 = zeros(nx^3,1);
    term2 = zeros(nx^3,1);
    term3 = zeros(nx^3,1);
    hxlm1 = sig*hx^(k-1);
    for j=1:k
        omegaj = zeros(nx^3,1);
        hxlmj = sig*hx^(k-j);
        idx = 0;
        for gama3=1:nx
            for gama2=1:nx
                for gama1=1:nx
                    idx = idx + 1;
                    %for phi1=1:ne
                    %    omegaj(idx,1) = omegaj(idx,1) + hxlmj(gama3,:)*sigeta(:,phi1)...
                    %        *hxlm1(gama2,:)*sigeta*shockSize...
                    %        *hxlmj(gama1,:)*sigeta(:,phi1);
                    %end
                    omegaj(idx,1) = sig^2*hxlmj(gama3,:)*eta_eta*hxlmj(gama1,:)'...
                            *hxlm1(gama2,:)*sigeta*shockSize;
                end
            end
        end
        term1 = term1 + omegaj(:,1);
        term2 = term2 + kron(kron(hx^(k-j),hx^(k-j))*etaEps_etaEps,hx^(k-1)*sigeta*shockSize);
        term3 = term3 + kron(hx^(k-1)*sigeta*shockSize,kron(hx^(k-j),hx^(k-j))*etaEps_etaEps);
    end
    IRFxfxfxf(:,k) = kron(hx^k*xf,kron((hx^k*xf+hx^(k-1)*sigeta*shockSize),hx^(k-1)*sigeta*shockSize)) ...
        + kron(hx^k*xf,kron(hx^(k-1)*sigeta*shockSize,hx^k*xf)) ...
        + kron(hx^(k-1)*sigeta*shockSize,kron((hx^k*xf+hx^(k-1)*sigeta*shockSize),hx^k*xf)) ...
        + kron(hx^(k-1)*sigeta*shockSize,kron(hx^k*xf,hx^(k-1)*sigeta*shockSize)) ... 
        + term1 ...
        + term2 ...
        + term3 ...
        + kron(hx^(k-1)*sigeta*shockSize,kron(hx^(k-1)*sigeta*shockSize,hx^(k-1)*sigeta*shockSize)); 
end

% Computing IRFxsxf
hx_hx     = kron(hx,hx);
hx_hsstil = kron(hx,0.5*hss*sig^2);
hx_HHxxtil= kron(hx,HHxxtil);

for k=1:IRFlength
    % non-recursive version
    %for i=1:k-1
    %    IRFxfxs(:,k) = IRFxfxs(:,k) ...
    %    + hx_hx^(k-1-i)*(hx_HHxxtil*IRFxfxfxf(:,i) + hx_hsstil*IRFxf(:,i));
    %end
    %IRFxfxs(:,k) = IRFxfxs(:,k)+ hx_hx^(k-1)*kron(sigeta*shockSize,hx*xs+HHxxtil*xf_xf+0.5*hss*sig^2);
    if k == 1
       IRFxfxs(:,k) = kron(sigeta*shockSize,hx*xs+HHxxtil*xf_xf+0.5*hss*sig^2);
    elseif k > 1 
       IRFxfxs(:,k) =  hx_hx*IRFxfxs(:,k-1) + hx_HHxxtil*IRFxfxfxf(:,k-1) + hx_hsstil*IRFxf(:,k-1);
    end
end
% Computing IRFxrd and IRFy3rd
for k=1:IRFlength
    % Non-recursive version
    %for j=1:k-1
    %   IRFxrd(:,k) =  IRFxrd(:,k) ...
    %       + hx^(k-1-j)*(2*HHxxtil*IRFxfxs(:,j) + 3/6*hssx*sig^2*IRFxf(:,j) ... 
    %       + HHxxxtil*IRFxfxfxf(:,j));
    %end
    if k > 1
        IRFxrd(:,k) = hx*IRFxrd(:,k-1) + 2*HHxxtil*IRFxfxs(:,k-1) + 3/6*hssx*sig^2*IRFxf(:,k-1) + ...
            HHxxxtil*IRFxfxfxf(:,k-1);
    end
    IRFy3rd(:,k) = gx*(IRFxf(:,k) + IRFxs(:,k) + IRFxrd(:,k)) ...
        + GGxxtil*(IRFxfxf(:,k) + 2*IRFxfxs(:,k)) ...
        + GGxxxtil*IRFxfxfxf(:,k) + 3/6*gssx*sig^2*IRFxf(:,k);
end
% Saving output
IRFy(:,:,3) = IRFy3rd;
IRFx(:,:,3) = IRFxf + IRFxs + IRFxrd;
