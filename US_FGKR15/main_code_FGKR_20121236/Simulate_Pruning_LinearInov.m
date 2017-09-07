% By Martin M. Andreasen, April 22 2010
% This function simulates the model when solved up to third order. 
% The purning scheme is used and we apply the kronecker notation.
% The simulated state space system reads:
% 
% y_t   = g(x_t,sig)
% x_t+1 = h(x_t,sig) + sig*eta*shocks_t+1 
%
function [Y_sim,X_sim] = Simulate_Pruning_LinearInov(g_ss,gx,gxx,gss,gxxx,gssx,gsss,h_ss,hx,hxx,hss,hxxx,hssx,hsss,eta,numSim,seedNum,orderApp,AntitheticShocks);

% Some indices 
ny      = size(gx,1);        %Number of output variables
nx      = size(hx,1);        %Number of state variables
ne      = size(eta,2);       %Number of structural shocks
sig     = 1;                 %The perturbation parameter

% We set some dimensions
Y_sim   = zeros(ny,numSim);
Xf_sim  = zeros(nx,numSim);
Xs_sim  = zeros(nx,numSim);
Xrd_sim = zeros(nx,numSim);
X_sim   = zeros(nx,numSim);

% Antithetic shock generation - this reduces the Monte Carlo variation in the simulation 
randn('seed',seedNum);
if AntitheticShocks == 1
    numSim                 = 2*ceil(numSim/2);  %ensure that we have an even number for numSim
    shocks                 = randn(ne,numSim);
    shocks(:,numSim/2+1:numSim) = -shocks(:,1:numSim/2);
else
    shocks                 = randn(ne,numSim);
    for i=1:ne
        shocks(i,:) = (shocks(i,:) - mean(shocks(i,:)'))/std(shocks(i,:)');
    end
end

% The simulation
xf    = zeros(nx,1);    %The first order terms
xs    = zeros(nx,1);    %The second order terms
xrd   = zeros(nx,1);    %The third order terms
AA    = kron(xf,xf);
BB    = kron(xf,xs);

% Defining matrices
HHxxtil  = 1/2*reshape(hxx,nx,nx^2);
HHxxxtil = 1/6*reshape(hxxx,nx,nx^3);
GGxxtil  = 1/2*reshape(gxx,ny,nx^2);   
GGxxxtil = 1/6*reshape(gxxx,ny,nx^3);   

if orderApp == 1
   for t=1:numSim
      % The state variables
      xf_p  = hx*xf + sig*eta*shocks(:,t);
      X_sim(:,t) = xf_p;

      % The controls
      Y_sim(:,t) = gx*xf_p;
    
      % Updating xf
      xf  = xf_p;
   end
elseif orderApp == 2
   for t=1:numSim
      % The state variables
      xf_p  = hx*xf + sig*eta*shocks(:,t);
      xs_p  = hx*xs + HHxxtil*AA + 1/2*sig^2*hss;
      Xf_sim(:,t) = xf_p;
      Xs_sim(:,t) = xs_p;
      X_sim(:,t)  = xf_p+xs_p;

      % The controls
      AA = kron(xf_p,xf_p);
      Y_sim(:,t) = gx*(xf_p+xs_p) + GGxxtil*AA + 1/2*sig^2*gss;
    
      % Updating xf, xs
      xf  = xf_p;
      xs  = xs_p;        
   end
elseif orderApp == 3
   for t=1:numSim
      % The state variables
      xf_p  = hx*xf + sig*eta*shocks(:,t);
      xs_p  = hx*xs + HHxxtil*AA + 1/2*sig^2*hss;
      xrd_p = hx*xrd + 2*HHxxtil*BB + HHxxxtil*kron(xf,AA)+ 3/6*hssx*sig^2*xf + 1/6*sig^3*hsss;
      Xf_sim(:,t) = xf_p;    
      Xs_sim(:,t) = xs_p;    
      Xrd_sim(:,t)= xrd_p;    
      X_sim(:,t)  = xf_p + xs_p + xrd_p;    
      
      % The controls
      AA    = kron(xf_p,xf_p);
      BB    = kron(xf_p,xs_p);
      Y_sim(:,t) = gx*(xf_p+xs_p+xrd_p) + GGxxtil*(AA+2*BB) + 1/2*sig^2*gss + ...
                   GGxxxtil*kron(xf_p,AA) + 3/6*gssx*sig^2*xf_p + 1/6*sig^3*gsss;
        
      % Updating xf, xs, xrd
      xf  = xf_p;
      xs  = xs_p;        
      xrd = xrd_p;        
   end
end
end