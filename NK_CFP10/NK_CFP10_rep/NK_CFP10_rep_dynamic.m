function [residual, g1, g2, g3] = NK_CFP10_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(18, 1);
T42 = (1-params(5)*params(6))/(1+params(7));
T51 = (1+params(3))*(params(2)-1)/((1+params(7))*(params(2)+params(3)));
T71 = 1/params(1);
lhs =params(2)*y(6)+params(3)*y(16);
rhs =y(19);
residual(1)= lhs-rhs;
lhs =params(2)*y(6)+params(3)*y(17);
rhs =y(18);
residual(2)= lhs-rhs;
lhs =params(2)*(y(24)-y(6));
rhs =y(9)-y(26);
residual(3)= lhs-rhs;
lhs =y(12);
rhs =(1+params(3))/(1+params(7))*(y(25)-y(8))-T42*(y(27)-y(12))-T51*(y(28)-y(20))-1/(1+params(7))*y(29);
residual(4)= lhs-rhs;
lhs =y(13)+y(14);
rhs =y(6)+y(11)+y(12)*params(7);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =T71*(y(1)-y(8)*(params(2)+params(3))*params(4)*(1-params(1))+y(12)*(1+params(7)*params(1)-params(6)*(1-params(1))*params(5)*params(4))+y(22));
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(8)*(params(2)+params(3))+y(12)*params(5)*params(6);
residual(7)= lhs-rhs;
lhs =y(6);
rhs =y(20)+y(17)*(1-params(5))+y(16)*params(5);
residual(8)= lhs-rhs;
lhs =y(10);
rhs =y(11)*params(9)+y(26)*params(1)+params(9)*y(21);
residual(9)= lhs-rhs;
lhs =y(15);
rhs =y(6)-y(11)*(params(4)-1);
residual(10)= lhs-rhs;
lhs =y(12)*params(6);
rhs =y(6)+y(11)-y(19)-y(16);
residual(11)= lhs-rhs;
lhs =y(9);
rhs =y(10)*params(14)+y(8)*params(15)+y(23);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(20)*(1+params(3))/(params(2)+params(3));
residual(13)= lhs-rhs;
lhs =y(8);
rhs =y(6)-y(7);
residual(14)= lhs-rhs;
lhs =y(20);
rhs =params(10)*y(2)-x(it_, 1);
residual(15)= lhs-rhs;
lhs =y(21);
rhs =params(12)*y(3)+x(it_, 2);
residual(16)= lhs-rhs;
lhs =y(22);
rhs =params(13)*y(4)-x(it_, 3);
residual(17)= lhs-rhs;
lhs =y(23);
rhs =params(11)*y(5)-x(it_, 4);
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 33);

  %
  % Jacobian matrix
  %

  g1(1,6)=params(2);
  g1(1,16)=params(3);
  g1(1,19)=(-1);
  g1(2,6)=params(2);
  g1(2,17)=params(3);
  g1(2,18)=(-1);
  g1(3,6)=(-params(2));
  g1(3,24)=params(2);
  g1(3,9)=(-1);
  g1(3,26)=1;
  g1(4,8)=(1+params(3))/(1+params(7));
  g1(4,25)=(-((1+params(3))/(1+params(7))));
  g1(4,12)=1-T42;
  g1(4,27)=T42;
  g1(4,20)=(-T51);
  g1(4,28)=T51;
  g1(4,29)=1/(1+params(7));
  g1(5,6)=(-1);
  g1(5,11)=(-1);
  g1(5,12)=(-params(7));
  g1(5,13)=1;
  g1(5,14)=1;
  g1(6,8)=(-(T71*(-((params(2)+params(3))*params(4)*(1-params(1))))));
  g1(6,12)=(-(T71*(1+params(7)*params(1)-params(6)*(1-params(1))*params(5)*params(4))));
  g1(6,1)=(-T71);
  g1(6,13)=1;
  g1(6,22)=(-T71);
  g1(7,8)=(-(params(2)+params(3)));
  g1(7,11)=1;
  g1(7,12)=(-(params(5)*params(6)));
  g1(8,6)=1;
  g1(8,16)=(-params(5));
  g1(8,17)=(-(1-params(5)));
  g1(8,20)=(-1);
  g1(9,10)=1;
  g1(9,26)=(-params(1));
  g1(9,11)=(-params(9));
  g1(9,21)=(-params(9));
  g1(10,6)=(-1);
  g1(10,11)=params(4)-1;
  g1(10,15)=1;
  g1(11,6)=(-1);
  g1(11,11)=(-1);
  g1(11,12)=params(6);
  g1(11,16)=1;
  g1(11,19)=1;
  g1(12,8)=(-params(15));
  g1(12,9)=1;
  g1(12,10)=(-params(14));
  g1(12,23)=(-1);
  g1(13,7)=1;
  g1(13,20)=(-((1+params(3))/(params(2)+params(3))));
  g1(14,6)=(-1);
  g1(14,7)=1;
  g1(14,8)=1;
  g1(15,2)=(-params(10));
  g1(15,20)=1;
  g1(15,30)=1;
  g1(16,3)=(-params(12));
  g1(16,21)=1;
  g1(16,31)=(-1);
  g1(17,4)=(-params(13));
  g1(17,22)=1;
  g1(17,32)=1;
  g1(18,5)=(-params(11));
  g1(18,23)=1;
  g1(18,33)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,1089);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,35937);
end
end
