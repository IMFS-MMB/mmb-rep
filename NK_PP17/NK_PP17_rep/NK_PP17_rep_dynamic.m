function [residual, g1, g2, g3] = NK_PP17_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(14, 1);
T35 = (1+params(4))/(params(2)+params(4));
T36 = params(2)*T35;
T53 = 1/(1+params(7)*params(6));
lhs =y(14);
rhs =params(10)*((params(2)+params(4))*y(12)+params(3)*(y(13)+params(9)*y(15))+y(22))+params(1)*y(26);
residual(1)= lhs-rhs;
lhs =y(13);
rhs =y(26)+params(2)*(y(25)-y(12))+T36*(y(28)-y(20));
residual(2)= lhs-rhs;
lhs =y(16);
rhs =y(3)+y(1)-y(14)+T53*(params(7)*params(6)*y(4)+params(6)*y(2)+(params(6)-1)*y(5))+y(21);
residual(3)= lhs-rhs;
lhs =y(16)+y(17);
rhs =y(12)*(params(4)+1+params(2))+T35*y(20)-(y(13)+params(9)*y(15))*(1-params(3));
residual(4)= lhs-rhs;
lhs =y(17)+y(24);
rhs =y(15)*params(6)+(params(6)-1)*y(18)+params(1)*((1+params(7)*params(6))*y(27)+y(29));
residual(5)= lhs-rhs;
residual(6) = y(18);
lhs =y(13);
rhs =y(14)*params(16)+y(12)*params(17)+y(23);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =y(11)-T35*y(20);
residual(8)= lhs-rhs;
lhs =y(19);
rhs =params(10)*((params(2)+params(4))*y(12)+params(3)*(y(13)+params(9)*y(15)));
residual(9)= lhs-rhs;
lhs =y(20);
rhs =params(11)*y(6)-x(it_, 1);
residual(10)= lhs-rhs;
lhs =y(22);
rhs =params(12)*y(8)+x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(21);
rhs =params(13)*y(7)-x(it_, 3);
residual(12)= lhs-rhs;
lhs =y(23);
rhs =params(14)*y(9)-x(it_, 4);
residual(13)= lhs-rhs;
lhs =y(24);
rhs =params(15)*y(10)+x(it_, 5);
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 34);

  %
  % Jacobian matrix
  %

  g1(1,12)=(-(params(10)*(params(2)+params(4))));
  g1(1,13)=(-(params(10)*params(3)));
  g1(1,14)=1;
  g1(1,26)=(-params(1));
  g1(1,15)=(-(params(10)*params(3)*params(9)));
  g1(1,22)=(-params(10));
  g1(2,12)=params(2);
  g1(2,25)=(-params(2));
  g1(2,13)=1;
  g1(2,26)=(-1);
  g1(2,20)=T36;
  g1(2,28)=(-T36);
  g1(3,1)=(-1);
  g1(3,14)=1;
  g1(3,2)=(-(params(6)*T53));
  g1(3,3)=(-1);
  g1(3,16)=1;
  g1(3,4)=(-(params(7)*params(6)*T53));
  g1(3,5)=(-(T53*(params(6)-1)));
  g1(3,21)=(-1);
  g1(4,12)=(-(params(4)+1+params(2)));
  g1(4,13)=1-params(3);
  g1(4,15)=params(9)*(1-params(3));
  g1(4,16)=1;
  g1(4,17)=1;
  g1(4,20)=(-T35);
  g1(5,15)=(-params(6));
  g1(5,17)=1;
  g1(5,27)=(-(params(1)*(1+params(7)*params(6))));
  g1(5,18)=(-(params(6)-1));
  g1(5,24)=1;
  g1(5,29)=(-params(1));
  g1(6,18)=1;
  g1(7,12)=(-params(17));
  g1(7,13)=1;
  g1(7,14)=(-params(16));
  g1(7,23)=(-1);
  g1(8,11)=(-1);
  g1(8,12)=1;
  g1(8,20)=T35;
  g1(9,12)=(-(params(10)*(params(2)+params(4))));
  g1(9,13)=(-(params(10)*params(3)));
  g1(9,15)=(-(params(10)*params(3)*params(9)));
  g1(9,19)=1;
  g1(10,6)=(-params(11));
  g1(10,20)=1;
  g1(10,30)=1;
  g1(11,8)=(-params(12));
  g1(11,22)=1;
  g1(11,31)=(-1);
  g1(12,7)=(-params(13));
  g1(12,21)=1;
  g1(12,32)=1;
  g1(13,9)=(-params(14));
  g1(13,23)=1;
  g1(13,33)=1;
  g1(14,10)=(-params(15));
  g1(14,24)=1;
  g1(14,34)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,1156);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,39304);
end
end
