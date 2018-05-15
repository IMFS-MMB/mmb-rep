function [residual, g1, g2, g3] = NK_GLSV07_pclm_rep_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(10, 1);
T143 = 1/(1-params(4));
lhs =y(7);
rhs =params(6)*y(4)*(1-params(1))/(1-params(4))+(1-params(6)+params(6)*params(1)/(1-params(4)))*y(1)-params(6)*y(5)*params(3)/(1-params(4))-params(6)*y(9)/(1-params(4));
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(4)*params(12)*(params(1)+params(21))+params(2)*y(16)+y(5)*params(12)-params(1)*params(12)*y(1);
residual(2)= lhs-rhs;
lhs =y(5)-y(4)*params(9)+y(6)*params(19)/params(16);
rhs =y(9)*params(10)*params(18)*(params(15)-1)+y(15)+y(16)/params(16)-params(9)*y(14)+params(10)*params(17)*(y(8)-y(2));
residual(3)= lhs-rhs;
lhs =y(6)*params(19)*(1-params(4))*params(7)+y(4)*(1-params(1))-y(5)*params(3)-(1-params(4)-params(1))*y(1);
rhs =y(9)*(1-params(2)*params(15))+y(16)*(1-params(4))*params(7)+y(14)*(params(20)*(1+params(21))+(1-params(1))*params(2))+y(15)*(params(20)-params(3)*params(2))-y(7)*(params(20)+params(2)*(1-params(4)-params(1)));
residual(4)= lhs-rhs;
lhs =y(8);
rhs =y(9)*(1+params(14))*(1-params(18))+(1+params(14))*(1-params(17))*y(2);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =params(15)*y(3)+x(it_, 1);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =y(4)*(1-params(1))+params(1)*y(1);
residual(7)= lhs-rhs;
lhs =y(11);
rhs =y(5)+y(4)*params(21);
residual(8)= lhs-rhs;
lhs =y(12);
rhs =y(9)*params(18)+params(17)*y(2);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =y(1)+T143*(y(4)*(1-params(1))-y(5)*params(3)-y(9)-(1-params(4)-params(1))*y(1));
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 17);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-(params(6)*(1-params(1))/(1-params(4))));
  g1(1,5)=params(6)*params(3)/(1-params(4));
  g1(1,1)=(-(1-params(6)+params(6)*params(1)/(1-params(4))));
  g1(1,7)=1;
  g1(1,9)=params(6)/(1-params(4));
  g1(2,4)=(-(params(12)*(params(1)+params(21))));
  g1(2,5)=(-params(12));
  g1(2,6)=1;
  g1(2,16)=(-params(2));
  g1(2,1)=params(1)*params(12);
  g1(3,4)=(-params(9));
  g1(3,14)=params(9);
  g1(3,5)=1;
  g1(3,15)=(-1);
  g1(3,6)=params(19)/params(16);
  g1(3,16)=(-(1/params(16)));
  g1(3,2)=params(10)*params(17);
  g1(3,8)=(-(params(10)*params(17)));
  g1(3,9)=(-(params(10)*params(18)*(params(15)-1)));
  g1(4,4)=1-params(1);
  g1(4,14)=(-(params(20)*(1+params(21))+(1-params(1))*params(2)));
  g1(4,5)=(-params(3));
  g1(4,15)=(-(params(20)-params(3)*params(2)));
  g1(4,6)=params(19)*(1-params(4))*params(7);
  g1(4,16)=(-((1-params(4))*params(7)));
  g1(4,1)=(-(1-params(4)-params(1)));
  g1(4,7)=params(20)+params(2)*(1-params(4)-params(1));
  g1(4,9)=(-(1-params(2)*params(15)));
  g1(5,2)=(-((1+params(14))*(1-params(17))));
  g1(5,8)=1;
  g1(5,9)=(-((1+params(14))*(1-params(18))));
  g1(6,3)=(-params(15));
  g1(6,9)=1;
  g1(6,17)=(-1);
  g1(7,4)=(-(1-params(1)));
  g1(7,1)=(-params(1));
  g1(7,10)=1;
  g1(8,4)=(-params(21));
  g1(8,5)=(-1);
  g1(8,11)=1;
  g1(9,2)=(-params(17));
  g1(9,9)=(-params(18));
  g1(9,12)=1;
  g1(10,4)=(-((1-params(1))*T143));
  g1(10,5)=(-(T143*(-params(3))));
  g1(10,1)=(-(1+T143*(-(1-params(4)-params(1)))));
  g1(10,9)=T143;
  g1(10,13)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,289);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,4913);
end
end
