function [residual, g1, g2, g3] = NK_GM05_DIT_SD_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(14, 1);
T11 = params(1)^(-1);
lhs =y(8);
rhs =y(22)-T11*(y(12)-y(21)-y(11));
residual(1)= lhs-rhs;
lhs =y(11);
rhs =(-params(1))*params(3)*(1-params(11))*y(19)+params(1)*params(4)*(params(5)+params(6))*(params(12)-1)*y(18);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(21)*params(7)+y(8)*params(8);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =params(3)*y(19)+y(18)*params(4)*params(6);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =y(9)-y(10);
residual(5)= lhs-rhs;
residual(6) = y(7);
lhs =y(9);
rhs =y(18)+T11*y(13);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =y(7)+params(4)*(y(13)-y(1));
residual(8)= lhs-rhs;
lhs =y(14);
rhs =y(15)-y(2);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =y(16)-y(3);
residual(10)= lhs-rhs;
lhs =y(13);
rhs =y(1)+y(17)-y(4)+y(20)-y(7);
residual(11)= lhs-rhs;
residual(12) = y(20);
lhs =y(19);
rhs =params(11)*y(6)+x(it_, 2);
residual(13)= lhs-rhs;
lhs =y(18);
rhs =params(12)*y(5)+x(it_, 1);
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 24);

%
% Jacobian matrix
%

g1(1,21)=(-T11);
g1(1,8)=1;
g1(1,22)=(-1);
g1(1,11)=(-T11);
g1(1,12)=T11;
g1(2,11)=1;
g1(2,18)=(-(params(1)*params(4)*(params(5)+params(6))*(params(12)-1)));
g1(2,19)=(-((-params(1))*params(3)*(1-params(11))));
g1(3,7)=1;
g1(3,21)=(-params(7));
g1(3,8)=(-params(8));
g1(4,10)=1;
g1(4,18)=(-(params(4)*params(6)));
g1(4,19)=(-params(3));
g1(5,8)=1;
g1(5,9)=(-1);
g1(5,10)=1;
g1(6,7)=1;
g1(7,9)=1;
g1(7,13)=(-T11);
g1(7,18)=(-1);
g1(8,7)=(-1);
g1(8,1)=params(4);
g1(8,13)=(-params(4));
g1(8,14)=1;
g1(9,14)=1;
g1(9,2)=1;
g1(9,15)=(-1);
g1(10,7)=1;
g1(10,3)=1;
g1(10,16)=(-1);
g1(11,7)=1;
g1(11,1)=(-1);
g1(11,13)=1;
g1(11,4)=1;
g1(11,17)=(-1);
g1(11,20)=(-1);
g1(12,20)=1;
g1(13,6)=(-params(11));
g1(13,19)=1;
g1(13,24)=(-1);
g1(14,5)=(-params(12));
g1(14,18)=1;
g1(14,23)=(-1);
end
if nargout >= 3,
%
% Hessian matrix
%

  g2 = sparse([],[],[],14,576);
end
if nargout >= 4,
%
% Third order derivatives
%

  g3 = sparse([],[],[],14,13824);
end
end
