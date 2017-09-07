
function out = RunDynarePruning(opt,oo_,M_,f_11)

% ************************************************************************
% GENERAL INFORMATION: This function uses the fact that the Dynare
% solution can be considered as having linear innovations when extending the
% state vector appropriately. Hence, simulation and moment calculations 
% can be done using the derived formulas for the notation applied
% by Schmitt-Grohe and Uribe (2004).
%
% This function does the following:
%  1) solves a model using DYNARE up to third order
%  2) saves the solution in the form 
%       y_t   = g(x_t-1,u_t,sig)
%       x_t   = h(x_t-1,u_t,sig)
%       u_t   = eps_t
%     where v_t = [x_t-1,u_t]
%  3) simulates the model using a pruning scheme. 
%  4) computes first and second momnents based on closed-form expressions
%  for these moments for models solved up to third order. 
%  5) computes the generalized impulse response functions
% 
% INPUTS:
% - opt: a struct with options. If some options are not specified, then we use the default options
% - oo_: output from Dynare when the model is solved up to second and third order
% - M_ : model information from Dynare
% - f_11: the first-order solution as provided by Dynare
%
% INPUTS (optional)
% - opt.orderApp: the approximation order of the model (must be <= 3)
% - opt.numSim: the length of the simulated time series from the model
% - opt.seedNum: a number to initialize the random number generator
% - opt.ySelect: string of control variables. We only report the solution 
%   and simulate for these variables.
% - opt.computeMoments: 1 for computing moments, else 0
% - opt.autoLag: number of lags when computing second moments
% - opt.AntitheticShocks: 1 for Antithetic shocks in the simulation, else 0
% - opt.computeIRF: 1 for computing impulse response functions using GIRF, 2
%   for computing impulse response functions as in Andreasen (2012,EER), else 0
% - opt.shockSize: the size of the shock for the impulse response functions 
%   (the size of the shock is measured in standard deviations)
% - opt.IRFlength: the lenght of the impulse response functions;
% - opt.plotIRF: 1 for plotting impulse response functions, else 0
% 
%
% IMPORTANT: Running this function requires linking to the following three functions
%  1) Dynare_Unfold_Matrices.m
%  2) StateSpaceDynare_LinearInov.m
%  3) reduceControlsDynare.m
%  4) Simulate_Pruning_LinearInov.m
%  5) UnconditionalMoments_2nd_Lyap.m
%  6) UnconditionalMoments_3rd_Lyap.m
%  7) GIRFPruning.m
%  8) plotImpulseResponseDynare.m
%
% OUTPUTS
% - out.gSteadyState: the steady state values of y_t
%   Dimension: ny * 1
% - out.gv: the first order derivatives of y_t with respect to v_t = [x_t-1;u_t]
%   Dimension: ny * nv
% - out.gvv: the second order derivatives of y_t with respect to v_t = [x_t-1;u_t]
%   Dimension: ny * nv * nv
% - out.gss: the second order derivatives of y_t with respect to sig (the perturbation parameters)
%   Dimension: ny * 1
% - out.gvvv: the third order derivatives of y_t with respect to v_t = [x_t-1;u_t]
%   Dimension: ny * nv * nv * nv
% - out.gssv: the third order derivatives of y_t with respect to (sig,sig,v_t)
%   Dimension: ny * nv
% - out.gsss: the third order derivatives of y_t with respect to sig 
%   Dimension: ny * 1
%
% - out.hSteadyState: the steady state values of v_t
%   Dimension: nv * 1
% - out.hv: the first order derivatives of v_t with respect to v_t = [x_t-1;u_t]
%   Dimension: nv * nv
% - out.eta: the square root of the co-variance matrix to the innovations in the
%   extended state space system. 
%   Dimension: nv * nu
% - out.hvv: the second order derivatives of v_t with respect to v_t = [x_t-1;u_t]
%   Dimension: nv * nv * nv
% - out.hss: the second order derivatives of v_t with respect to sig (the perturbation parameters)
%   Dimension: nv * 1
% - out.hvvv: the third order derivatives of v_t with respect to v_t = [x_t-1;u_t]
%   Dimension: nv * nv * nv * nv
% - out.hssv: the third order derivatives of v_t with respect to (sig,sig,v_t)
%   Dimension: nv * nv
% - out.hsss: the third order derivatives of v_t with respect to sig 
%   Dimension: nv * 1
%
% - out.sigma: the square root of the covariance matrix for the structural innovations
%   Dimension: nu * nu
%
% - out.label_y: cell with the names of the variables in y_t
% - out.label_v: cell with the names of the variables in v_t
% - out.label_u: cell with the names of the variables in u_t
%
% - out.ySim: simulated sample path for the control variables. 
%   Dimension: ny * numSim
% - out.vSim: simulated sample path for the state variables and the structural innovations
%   Dimension: nv * numSim
% - out.Mean_y: the mean value of the control variables
%   Dimension: ny * 1
% - out.Var_y: the covariance matrix for the control variables
%   Dimension: ny * ny
% - out.Corr_y: the auto-correlation matrix for the control variables. That is
%   corr[y_t(i),y_t-k(j)]
%   Dimension: ny * ny * autoLag
% - out.Mean_v: the mean value of the states and the innovations
%   Dimension: nv * 1
% - out.Var_v: the auto co-variance for the states and the innovations
%   Dimension: nv * nv
% - out.Corr_v: the auto-correlation matrix for the states and innovations. That is
%   corr[v_t(i),v_t-k(j)]
%   Dimension: nv * nv * autoLag
%
% - out.GIRFy: the generalized impulse response functions (GIRF) for the
%   controls. GIRFy has four dimensions where the content is:
%   1. dim: the IRF for different control variables
%   2. dim: the time index in the impulse response functions
%   3. dim: the order of approximation. I.e. a "1" gives the IRF using a
%      first order approximation, a "2" for a second order approximation, and
%      a "3" for a third order approximation
%   4. dim: the different structural shocks in the model
%   Hence, the dimension of out.GIRFy is: ny * lengthIRF * 3 * nu
% - out.GIRFv: the generalized impulse response functions (GIRF) for the
%   state variables. Data is stored in a similar way as for GIRFy.
% By Martin M. Andreasen, April 18 - 2013

%% Inputs 
% ************************************************************************
% Default options
defopt.orderApp         = 2;
defopt.numSim           = 1e4;
defopt.seedNum          = 1;
defopt.ySelect          = 'all';
defopt.computeMoments   = 1;
defopt.autoLag          = 4;
defopt.AntitheticShocks = 0;
defopt.computeIRF       = 1;
defopt.shockSize        = 1;
defopt.IRFlength        = 20;
defopt.plotIRF          = 1;

% Check if default options are overwritten by opts
opt = updateOptions(opt,defopt);

%% Transformation of the approximated solution
% We load and unfold the output from Dynare
[f_ss,fv,fvv,fss,fvvv,fssv,fsss,sigma,nv,nu,nx,nz] = Dynare_Unfold_Matrices(opt.orderApp,oo_,M_,f_11);

% We set up the alternative state space representation
[gSteadyState_tmp,gv_tmp,gvv_tmp,gss_tmp,gvvv_tmp,gssv_tmp,gsss_tmp,hSteadyState,hv,hvv,hss,hvvv,hssv,hsss,eta,ny_tmp,label_y_tmp,label_v,label_u] = ...
    StateSpaceDynare_LinearInov(f_ss,fv,fvv,fss,fvvv,fssv,fsss,sigma,nv,nx,nz,M_,oo_);

% We only use the selected variables in g(v)
[ny,label_y,gSteadyState,gv,gvv,gss,gvvv,gssv,gsss] = ...
    reduceControlsDynare(opt,nv,ny_tmp,label_y_tmp,gSteadyState_tmp,gv_tmp,gvv_tmp,gss_tmp,gvvv_tmp,gssv_tmp,gsss_tmp);
clear gSteadyState_tmp gv_tmp gvv_tmp gss_tmp gvvv_tmp gssv_tmp gsss_tmp ny_tmp label_y_tmp

%% Simulation
% Simulation of the model using pruning based on the representation with only linear innovations
[ySim,vSim] = Simulate_Pruning_LinearInov(gSteadyState,gv,gvv,gss,gvvv,gssv,gsss,hSteadyState,hv,hvv,hss,hvvv,hssv,hsss,eta,...
    opt.numSim,opt.seedNum,opt.orderApp,opt.AntitheticShocks);
ySim = ySim + repmat(gSteadyState,1,opt.numSim);
vSim = vSim + repmat(hSteadyState,1,opt.numSim);

%% Moment computations
% Compute first and second moments 
if opt.computeMoments == 1
    % Moments for normal innovations
    vectorMom3 = zeros(1,nu);
    vectorMom4 = ones(1,nu)*3;
    vectorMom5 = zeros(1,nu);
    vectorMom6 = ones(1,nu)*15;
    sig        = 1;
    if opt.orderApp  == 1
        [E_vf,E_vs,E_y,E_vf_vf,Var_vf,Var_vf_xs,Var_vs,Var_vfvf,Var_vs_vfvf,Var_v,Var_y,Cov_vf,Cov_vs,Cov_v,Cov_y] ...
            = UnconditionalMoments_2nd_Lyap(gv,gvv*0,gss*0,hv,hvv*0,hss*0,eta,sig,vectorMom3,vectorMom4,opt.autoLag);
        % The mean of the states and the controls
        E_v = hSteadyState + E_vf;
        E_y = gSteadyState + E_y;
    elseif opt.orderApp == 2
        [E_vf,E_vs,E_y,E_vf_vf,Var_vf,Var_vf_vs,Var_vs,Var_vfvf,Var_vs_vfvf,Var_v,Var_y,Cov_vf,Cov_vs,Cov_v,Cov_y] ...
            = UnconditionalMoments_2nd_Lyap(gv,gvv,gss,hv,hvv,hss,eta,sig,vectorMom3,vectorMom4,opt.autoLag);
        % The mean of the states and the controls
        E_v = hSteadyState + E_vf + E_vs;
        E_y = gSteadyState + E_y;
    elseif opt.orderApp == 3
        [E_vf,E_vs,E_y,E_vf_vf,Var_vf,Var_vf_vs,Var_vs,Var_vfvf,Var_vs_vfvf,Var_v,Var_y,Cov_vf,Cov_vs,Cov_v,Cov_y] ...
            = UnconditionalMoments_2nd_Lyap(gv,gvv,gss,hv,hvv,hss,eta,sig,vectorMom3,vectorMom4,opt.autoLag);
        
        [E_vrd,E_y,Var_vrd,Var_v,Var_y,Cov_vrd,Cov_v,Cov_y] ...
            = UnconditionalMoments_3rd_Lyap(gv,gvv,gss,gvvv,gssv,gsss,hv,hvv,hss,hvvv,hssv,hsss,eta,sig,...
            vectorMom3,vectorMom4,vectorMom5,vectorMom6,Var_vs,Var_vfvf,Var_vs_vfvf,opt.autoLag);
        % The mean of the states and the controls
        E_v = hSteadyState + E_vf + E_vs + E_vrd;
        E_y = gSteadyState + E_y;
    end
    
    % Computing auto-correlation from the covariances
    Corr_y = zeros(ny,ny,opt.autoLag);
    for k=1:opt.autoLag
        for i1=1:ny
            for i2=1:ny
                if Var_y(i1,i1) == 0 || Var_y(i2,i2) == 0
                    Corr_y(i1,i2,k) = 0;
                else
                    Corr_y(i1,i2,k) = Cov_y(i1,i2,k)/(sqrt(Var_y(i1,i1))*sqrt(Var_y(i2,i2)));
                end
            end
        end
    end
    Corr_v = zeros(nv,nv,opt.autoLag);
    for k=1:opt.autoLag
        for i1=1:nv
            for i2=1:nv
                if Var_v(i1,i1) == 0 || Var_v(i2,i2) == 0
                    Corr_v(i1,i2,k) = 0;
                else
                    Corr_v(i1,i2,k) =  Cov_v(i1,i2,k)/(sqrt(Var_v(i1,i1))*sqrt(Var_v(i2,i2)));
                end
            end
        end
    end
end
%% Impulse response functions
if opt.computeIRF > 0
    if ~isfield(opt,'vf')
        opt.vf= zeros(nv,1); %The mean of vf
    end
    if ~isfield(opt,'vs')
        vecVar_vf = (eye(nv^2)-kron(hv,hv))\reshape(eta*eta',nv^2,1);
        opt.vs = (eye(nv)-hv)\(0.5*hss+0.5*reshape(hvv,nv,nv^2)*vecVar_vf); % The mean of vs
    end
    IRFy = zeros(ny,opt.IRFlength,3,nu);
    IRFv = zeros(nv,opt.IRFlength,3,nu);
    vectorMom3 = zeros(1,nu);
    for i=1:nu
        vectorShockSize = zeros(nu,1);
        vectorShockSize(i,1) = opt.shockSize;
        if opt.computeIRF == 1
            [IRFy(:,:,:,i),IRFv(:,:,:,i)] = GIRFPruning_v2(gv,gvv,gss,gvvv,gssv,gsss,hv,hvv,hss,hvvv,hssv,hsss,eta,...
                vectorShockSize,vectorMom3,opt.vf,opt.vs,opt.orderApp,opt.IRFlength);
        elseif opt.computeIRF == 2
            [IRFy(:,:,:,i),IRFv(:,:,:,i)] = impulseResponsePruning(gv,gvv,gss,gvvv,gssv,gsss,hv,hvv,hss,hvvv,hssv,hsss,eta,...
                vectorShockSize,opt.vf,opt.vs,opt.orderApp,opt.IRFlength);
        end
        % Plot the impulse response functions
        if opt.plotIRF == 1
            plotImpulseResponseDynare(IRFy(:,:,:,i),IRFv(:,:,:,i),label_y,label_v,label_u(i,1),opt.shockSize,opt.orderApp);
        end
    end
end


%% The output is packaged into the struct "out"
% The approximated solution
out.gSteadyState = gSteadyState;
out.gv           = gv;
out.gvv          = gvv;
out.gss          = gss;
out.gvvv         = gvvv;
out.gssv         = gssv;
out.gsss         = gsss;
out.hSteadyState = hSteadyState;
out.hv           = hv;
out.eta          = eta;
out.hvv          = hvv;
out.hss          = hss;
out.hvvv         = hvvv;
out.hssv         = hssv;
out.hsss         = hsss;
out.sigma        = sigma;
out.label_y      = label_y;
out.label_v      = label_v;
out.label_u      = label_u;
% The simulated time series
out.ySim         = ySim;
out.vSim         = vSim;
% The unconditional moments
if opt.computeMoments == 1
    out.Mean_y       = E_y;
    out.Var_y        = Var_y;
    out.Corr_y       = Corr_y;
    out.Mean_v       = E_v;
    out.Var_v        = Var_v;
    out.Corr_v       = Corr_v;
end
% The impulse response functions
if opt.computeIRF > 0
    out.IRFy        = IRFy;
    out.IRFv        = IRFv;
end
% The options used for the computations
out.opt          = opt;

end

function opt = updateOptions(opt,defopt)
if ~isfield(opt,'orderApp')
    opt.orderApp = defopt.orderApp;
end
if ~isfield(opt,'numSim')
    opt.numSim = defopt.numSim;
end
if ~isfield(opt,'seedNum')
    opt.seedNum = defopt.seedNum;
end
if ~isfield(opt,'ySelect')
    opt.ySelect = defopt.ySelect;
end    
if ~isfield(opt,'computeMoments')
    opt.computeMoments= defopt.computeMoments;
end     
if ~isfield(opt,'autoLag')
    opt.autoLag= defopt.autoLag;
end     
if ~isfield(opt,'AntitheticShocks')
    opt.AntitheticShocks= defopt.AntitheticShocks;
end     
if ~isfield(opt,'computeIRF')
    opt.computeIRF = defopt.computeIRF;
end     
if ~isfield(opt,'shockSize')
    opt.shockSize = defopt.shockSize ;
end     
if ~isfield(opt,'IRFlength')
    opt.IRFlength = defopt.IRFlength;
end     
if ~isfield(opt,'plotIRF')
    opt.plotIRF= defopt.plotIRF;
end     
if ~isfield(opt,'computeMoments')
    opt.computeMoments= defopt.computeMoments;
end     

end