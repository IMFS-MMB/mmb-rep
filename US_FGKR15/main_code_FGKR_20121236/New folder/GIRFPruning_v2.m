% By Martin M. Andreasen, October 2013. This is version 2 of the technical
% appendix!
% This function computes closed-form expressions for the impulse response
% functions using the pruning method when using the following definition 
% of the impulse response function .
%
% impulse(x_t+l) = E_t[w_t|eps_t+1=shockSize for the disturbance]
%                 -E_t[w_t]
%
% Note that this definition is the one behind the 
% so-called Generalized Impulse Reponse Function (GIRF)
%
% OUTPUT:
% GIRFy =impulse response function for y = g(x,sig)
%        dimension = ny * length * 3
%        IRFy(:,:,1) = impulse responses at first order
%        IRFy(:,:,2) = impulse responses at second order
%        IRFy(:,:,3) = impulse responses at third order
% GIRFx =impulse response function for x = h(x,sig)
%        dimension = nx * length * 3
%        IRFx(:,:,1) = impulse responses at first order
%        IRFx(:,:,2) = impulse responses at second order
%        IRFx(:,:,3) = impulse responses at third order
% NOTE: if xf = [] and xs = [], then we use the default setting and apply
% the mean values of xf and xs.

function [GIRFy,GIRFx] = GIRFPruning_v2(gx,gxx,gss,gxxx,gssx,gsss,hx,hxx,hss,hxxx,hssx,hsss,eta,...
    shockSize,vectorMom3,xf,xs,order_app,IRFlength)


% The dimension of the model
[ny,nx] = size(gx);
ne      = size(eta,2);
sig     = 1;
GIRFy   = zeros(ny,IRFlength,3);
GIRFx   = zeros(nx,IRFlength,3);

% We construct the selection matrix S
S       = diag(shockSize ~= 0);

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
GIRFy1st = zeros(ny,IRFlength);
GIRFxf   = zeros(nx,IRFlength);
for k=1:IRFlength
    GIRFxf(:,k)   = hx^(k-1)*sigeta*shockSize;
    GIRFy1st(:,k) = gx*GIRFxf(:,k);
end
% Saving output
GIRFy(:,:,1) = GIRFy1st;
GIRFx(:,:,1) = GIRFxf;
if order_app == 1
    return
end

%% Impulse response functions at second order
GIRFy2nd = zeros(ny,IRFlength);
GIRFxs   = zeros(nx,IRFlength);
GIRFxfxf = zeros(nx^2,IRFlength);
consQ    = kron(sigeta*shockSize,sigeta*shockSize);
hx_hx    = kron(hx,hx);
I_ne     = eye(ne);
vecI_ne  = reshape(I_ne,ne^2,1);
LA       = (kron(sigeta*(I_ne-S),sigeta*(I_ne-S)) - kron(sigeta,sigeta))*vecI_ne; %Lambda

% Computing GIRFxfxf
for k=1:IRFlength
    GIRFxfxf(:,k) = kron(hx^k*xf,hx^(k-1)*sigeta*shockSize) + kron(hx^(k-1)*sigeta*shockSize,hx^k*xf) + ...
            hx_hx^(k-1)*(consQ + LA);
end
% Computing GIRFxs and GIRFy2nd
for k=1:IRFlength
    % The non-recursive version
    %for j=1:k-1
    %    IRFxs(:,k) = IRFxs(:,k) + hx^(k-1-j)*HHxxtil*(kron(hx^j*xf,hx^(j-1)*sigeta*shockSize) ...
    %        + kron(hx^(j-1)*sigeta*shockSize,hx^j*xf) ...
    %        + kron(hx^(j-1),hx^(j-1))*(consQ + LA); 
    %end
    if k > 1
        GIRFxs(:,k) = hx*GIRFxs(:,k-1) + HHxxtil*GIRFxfxf(:,k-1);
    end
    GIRFy2nd(:,k) = gx*(GIRFxf(:,k)+GIRFxs(:,k)) + GGxxtil*GIRFxfxf(:,k);
end
% Saving output 
GIRFy(:,:,2) = GIRFy2nd;
GIRFx(:,:,2) = GIRFxf+GIRFxs;
if order_app == 2
    return
end

%% Impulse response functions a third order
GIRFy3rd   = zeros(ny,IRFlength);
GIRFxrd    = zeros(nx,IRFlength);
GIRFxfxs   = zeros(nx^2,IRFlength);
GIRFxfxfxf = zeros(nx^3,IRFlength);
xf_xf      = kron(xf,xf);
m3_ne3     = zeros(ne^3,1);
idx        = 0;
for phi1=1:ne
    idx = idx + 1;
    for phi2=1:ne
        for phi3=1:ne
            if phi1 == phi2 && phi1 == phi3
                m3_ne3(idx,1) = vectorMom3(1,phi1);
            end
        end
    end
end              
% Computing GIRFxfxfxf
for k=1:IRFlength
    termA45 = zeros(nx^3,1);
    termA46 = zeros(nx^3,1);
    termA47 = zeros(nx^3,1);
    %if k > 1
    for j=2:k
        termA45 = termA45 + kron(hx^(k-1)*sigeta*shockSize,kron(hx^(k-j)*sigeta,hx^(k-j)*sigeta)*vecI_ne);
        termA46 = termA46 + kron(kron(hx^(k-j)*sigeta,hx^(k-j)*sigeta)*vecI_ne,hx^(k-1)*sigeta*shockSize);
        termA47 = termA47 + kron(kron(hx^(k-j)*sigeta,hx^(k-1)*sigeta*shockSize),hx^(k-j)*sigeta)*vecI_ne;
    end
    %end
    GIRFxfxfxf(:,k) = ...
        kron(hx^k*xf,kron(hx^(k-1)*sigeta*shockSize,hx^k*xf)) ...
        + kron(hx^(k-1)*sigeta*shockSize,hx_hx^k*xf_xf) ...             
        + kron(hx_hx^k*xf_xf,hx^(k-1)*sigeta*shockSize) ...
        + kron(hx_hx^(k-1)*(consQ+LA),hx^k*xf)                                                                                   ... %A1
        + kron(hx^k*xf,hx_hx^(k-1)*(consQ+LA))                                                                                   ... %A2
        + kron(hx^(k-1)*sigeta*shockSize,kron(hx^k*xf,hx^(k-1)*sigeta*shockSize))                                                ... %A3
        + (kron(hx^(k-1)*sigeta*(I_ne-S),kron(hx^k*xf,hx^(k-1)*sigeta*(I_ne-S))) ...
            - kron(hx^(k-1)*sigeta,kron(hx^k*xf,hx^(k-1)*sigeta)))*vecI_ne  ...               
        + kron(hx^(k-1)*sigeta*shockSize,kron(hx^(k-1)*sigeta*(I_ne-S),hx^(k-1)*sigeta*(I_ne-S)))*vecI_ne                        ... %A41
        + kron(kron(hx^(k-1)*sigeta*(I_ne-S),hx^(k-1)*sigeta*(I_ne-S)),hx^(k-1)*sigeta*shockSize)*vecI_ne                        ... %A42
        + kron(kron(hx^(k-1)*sigeta*(I_ne-S),hx^(k-1)*sigeta*shockSize),hx^(k-1)*sigeta*(I_ne-S))*vecI_ne                        ... %A43
        + kron(kron(hx^(k-1)*sigeta*(I_ne-S),hx^(k-1)*sigeta*(I_ne-S)),hx^(k-1)*sigeta*(I_ne-S))*m3_ne3                          ... %A44
        + termA45 ...
        + termA46 ...
        + termA47 ...
        - kron(kron(hx^(k-1)*sigeta,hx^(k-1)*sigeta),hx^(k-1)*sigeta)*m3_ne3;                                                       %A48
end

% Computing GIRFxsxf
hx_hsstil = kron(hx,0.5*hss*sig^2);
hx_HHxxtil= kron(hx,HHxxtil);
for k=1:IRFlength
    % non-recursive version
    %for i=1:k-1
    %    GIRFxfxs(:,k) = GIRFxfxs(:,k) ...
    %    + hx_hx^(k-1-i)*(hx_HHxxtil*GIRFxfxfxf(:,i) + hx_hsstil*GIRFxf(:,i));
    %end
    %GIRFxfxs(:,k) = GIRFxfxs(:,k)+ hx_hx^(k-1)*kron(sigeta*shockSize,hx*xs+HHxxtil*xf_xf+0.5*hss*sig^2);
    if k == 1
       GIRFxfxs(:,k) = kron(sigeta*shockSize,hx*xs+HHxxtil*xf_xf+0.5*hss*sig^2);
    elseif k > 1 
       GIRFxfxs(:,k) =  hx_hx*GIRFxfxs(:,k-1) + hx_HHxxtil*GIRFxfxfxf(:,k-1) + hx_hsstil*GIRFxf(:,k-1);
    end
end

% Computing GIRFxrd and GIRFy3rd
for k=1:IRFlength
    % Non-recursive version
    %for j=1:k-1
    %   GIRFxrd(:,k) =  GIRFxrd(:,k) ...
    %       + hx^(k-1-j)*(2*HHxxtil*GIRFxfxs(:,j) + 3/6*hssx*sig^2*GIRFxf(:,j) ... 
    %       + HHxxxtil*GIRFxfxfxf(:,j));
    %end
    if k > 1
        GIRFxrd(:,k) = hx*GIRFxrd(:,k-1) + 2*HHxxtil*GIRFxfxs(:,k-1) + 3/6*hssx*sig^2*GIRFxf(:,k-1) + ...
            HHxxxtil*GIRFxfxfxf(:,k-1);
    end
    GIRFy3rd(:,k) = gx*(GIRFxf(:,k) + GIRFxs(:,k) + GIRFxrd(:,k)) ...
        + GGxxtil*(GIRFxfxf(:,k) + 2*GIRFxfxs(:,k)) ...
        + GGxxxtil*GIRFxfxfxf(:,k) + 3/6*gssx*sig^2*GIRFxf(:,k);
end
% Saving output
GIRFy(:,:,3) = GIRFy3rd;
GIRFx(:,:,3) = GIRFxf + GIRFxs + GIRFxrd;
