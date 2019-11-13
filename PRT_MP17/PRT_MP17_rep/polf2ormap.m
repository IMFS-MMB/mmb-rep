function [ out ] = polf2ormap( py, state, sh )
%POLF2ORMAP Uses DYNARE generated policy functions to map
% "state" - which is the vector of t-1 values of ALL model variables, except shocks -
% - and shocks "sh" into time t model outcomes
% "py" is a structure that contains the DYNARE computed policy function,
% with all second order terms: ".ys" - the steady state values, ".ghs" - the
% constant shifter in policies arising from precautionary motives
% ".ghx", ".ghu" - first order term coefficients
% ".ghxx", ".ghuu", ".ghxu" - second order term coefficients
% "py.stvar_or" - contains the locations of all state variables in the
% declaration order
% NOTE: The "state" and "sh" must be in declaration order, as in the
% .mod-file.

    out = zeros(size(py.ghx,1),1);

    out = py.ys + 0.5*py.ghs + py.ghx*(state(py.stvar_or)-py.ys(py.stvar_or)) +...
    0.5*py.ghxx*vec(kron(state(py.stvar_or)-py.ys(py.stvar_or),state(py.stvar_or)-py.ys(py.stvar_or))) +...
    0.5*py.ghuu*vec(kron(sh,sh)) +...
    py.ghxu*vec(kron(state(py.stvar_or)-py.ys(py.stvar_or),sh)) +...
    py.ghu*sh;


end

