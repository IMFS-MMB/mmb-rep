% This function sets up an alternative state space representation 
% for a model solved up to third order where innovations only enter linearly.
% That is we transform the solution form
% z_t = f(x_t-1,u_t,sig)
% to 
% y_t   = g(x_t-1,u_t,sig)
% x_t   = h(x_t-1,u_t,sig)
% u_t   = eps_t
% where v_t = [x_t-1,u_t]
% By Martin M. Andreasen. 

function [g_ss,gv,gvv,gss,gvvv,gssv,gsss,h_ss,hv,hvv,hss,hvvv,hssv,hsss,eta,ny,label_y,label_v,label_u] ...
    = StateSpaceDynare_LinearInov(f_ss,fv,fvv,fss,fvvv,fssv,fsss,sigma,nv,nx,nz,M_,oo_)

% We setup the function h. The dimensions are
h_ss    = zeros(nv,1); %the steady state level
hv      = zeros(nv,nv);
hvv     = zeros(nv,nv,nv);
hss     = zeros(nv,1);
hvvv    = zeros(nv,nv,nv,nv);
hssv    = zeros(nv,nv);
hsss    = zeros(nv,1);
label_u = cellstr(M_.exo_names);
nu      = size(label_u,1);
eta     = zeros(nv,nu);

% This index keeps account of the variables from the f function which are put in the h function 
index_f = zeros(1,nz);

% Setting eta
eta(nx+1:nv,1:nu) = sigma;

% We construct the h function
if ~isfield(M_,'nspred')
   M_.nspred = M_.npred + M_.nboth;
end
npred          = M_.nspred;
nstatic        = M_.nstatic;
ordered        = M_.endo_names(oo_.dr.order_var,:);
label_v        = [cellstr(ordered(nstatic+1:nstatic+npred,:)); label_u];
dyn_state_vars = label_v;
dyn_vars       = cellstr(M_.endo_names(oo_.dr.order_var,:));
label_x        = cell(nx,1);
for i=1:nx
    for j=1:nz
        if strcmp(cellstr(dyn_state_vars(i,:)),cellstr(dyn_vars(j,:))) == 1
            index_f(1,j)  = 1;
            label_x(i,:)  = dyn_state_vars(i,:);
            h_ss(i,1)     = f_ss(oo_.dr.order_var(j),1);
            hv(i,:)       = fv(j,:);
            hvv(i,:,:)    = fvv(j,:,:);            
            hss(i,1)      = fss(j,1);
            hvvv(i,:,:,:) = fvvv(j,:,:,:);            
            hssv(i,:)     = fssv(j,:);    
            hsss(i,1)     = fsss(j,1);    
        end
    end
end
% The label for v
label_v = [label_x;label_u];

% We construct the g function. The dimensions are
ny      = nz-nx;
g_ss    = zeros(ny,1); %the steady state level
gv      = zeros(ny,nv);
gvv     = zeros(ny,nv,nv);
gss     = zeros(ny,1);
gvvv    = zeros(ny,nv,nv,nv);
gssv    = zeros(ny,nv);
gsss    = zeros(ny,1);   
label_y = cell(ny,1);
i = 0;
for j=1:nz
    if index_f(1,j) == 0
        i = i + 1;
        index_f(1,j) = 1; %To indicate that we have used this position
        g_ss(i,1)     = f_ss(oo_.dr.order_var(j),1);
        label_y(i,:)  = dyn_vars(j,:);
        gv(i,:)       = fv(j,:);
        gvv(i,:,:)    = fvv(j,:,:);
        gss(i,1)      = fss(j,1);
        gvvv(i,:,:,:) = fvvv(j,:,:,:);
        gssv(i,:)     = fssv(j,:);
        gsss(i,1)     = fsss(j,1);
    end
end
