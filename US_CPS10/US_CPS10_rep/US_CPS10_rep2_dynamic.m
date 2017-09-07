function [residual, g1, g2, g3] = US_CPS10_rep2_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(18, 1);
T32 = (1-params(22)*params(9))*(1-params(9))/((1+params(22)*params(3))*params(9)*(1+params(1)*(1+1/params(2))));
T68 = params(25)^2+params(22)*params(8)^2;
T120 = (1-params(12))*params(10)/4;
lhs =y(11)-params(22)/(1+params(22)*params(3))*y(29)-y(17)-T32*y(14);
rhs =params(3)/(1+params(22)*params(3))*y(1);
residual(1)= lhs-rhs;
residual(2) = y(22);
lhs =(params(25)-params(22)*params(8))*(params(25)-params(8))*y(13)-(params(25)-params(8))*(params(25)-params(22)*params(8)*params(15))*y(19)-(params(25)*params(22)*params(8)*params(13)-params(25)*params(8))*y(16)+T68*y(12)-params(25)*params(22)*params(8)*y(30);
rhs =params(25)*params(8)*y(2);
residual(3)= lhs-rhs;
lhs =(params(25)-params(22)*params(8))*(params(25)-params(8))*y(21)-(params(25)-params(8))*(params(25)-params(22)*params(8)*params(15))*y(19)-(params(25)*params(22)*params(8)*params(13)-params(25)*params(8))*y(16)+T68*y(20)-params(25)*params(22)*params(8)*y(32);
rhs =params(25)*params(8)*y(8);
residual(4)= lhs-rhs;
residual(5) = y(29)+y(13)-y(15)-y(31)+params(13)*y(16);
residual(6) = params(13)*y(16)+y(21)-y(23)-y(33);
residual(7) = y(13)+y(14)-y(19)-params(1)*y(12);
residual(8) = y(21)+y(22)-y(19)-params(1)*y(20);
lhs =y(15)-y(11)*T120+(1-params(12))*params(10)*y(18)-y(12)*(1-params(12))*params(11)+y(20)*(1-params(12))*params(11);
rhs =x(it_, 1)+params(12)*y(3)+y(1)*T120+T120*y(9)+T120*y(10);
residual(9)= lhs-rhs;
lhs =y(16);
rhs =params(13)*y(4)+x(it_, 2);
residual(10)= lhs-rhs;
lhs =y(17);
rhs =params(14)*y(5)+x(it_, 3);
residual(11)= lhs-rhs;
lhs =y(18);
rhs =params(4)*y(6)+x(it_, 4);
residual(12)= lhs-rhs;
lhs =y(19);
rhs =params(15)*y(7)+x(it_, 5);
residual(13)= lhs-rhs;
lhs =y(24);
rhs =y(11)-y(18);
residual(14)= lhs-rhs;
lhs =y(25);
rhs =y(15)-y(11);
residual(15)= lhs-rhs;
lhs =y(26);
rhs =y(12)-y(20);
residual(16)= lhs-rhs;
lhs =y(27);
rhs =y(1);
residual(17)= lhs-rhs;
lhs =y(28);
rhs =y(9);
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 38);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(3)/(1+params(22)*params(3))));
  g1(1,11)=1;
  g1(1,29)=(-(params(22)/(1+params(22)*params(3))));
  g1(1,14)=(-T32);
  g1(1,17)=(-1);
  g1(2,22)=1;
  g1(3,2)=(-(params(25)*params(8)));
  g1(3,12)=T68;
  g1(3,30)=(-(params(25)*params(22)*params(8)));
  g1(3,13)=(params(25)-params(22)*params(8))*(params(25)-params(8));
  g1(3,16)=(-(params(25)*params(22)*params(8)*params(13)-params(25)*params(8)));
  g1(3,19)=(-((params(25)-params(8))*(params(25)-params(22)*params(8)*params(15))));
  g1(4,16)=(-(params(25)*params(22)*params(8)*params(13)-params(25)*params(8)));
  g1(4,19)=(-((params(25)-params(8))*(params(25)-params(22)*params(8)*params(15))));
  g1(4,8)=(-(params(25)*params(8)));
  g1(4,20)=T68;
  g1(4,32)=(-(params(25)*params(22)*params(8)));
  g1(4,21)=(params(25)-params(22)*params(8))*(params(25)-params(8));
  g1(5,29)=1;
  g1(5,13)=1;
  g1(5,31)=(-1);
  g1(5,15)=(-1);
  g1(5,16)=params(13);
  g1(6,16)=params(13);
  g1(6,21)=1;
  g1(6,33)=(-1);
  g1(6,23)=(-1);
  g1(7,12)=(-params(1));
  g1(7,13)=1;
  g1(7,14)=1;
  g1(7,19)=(-1);
  g1(8,19)=(-1);
  g1(8,20)=(-params(1));
  g1(8,21)=1;
  g1(8,22)=1;
  g1(9,1)=(-T120);
  g1(9,11)=(-T120);
  g1(9,12)=(-((1-params(12))*params(11)));
  g1(9,3)=(-params(12));
  g1(9,15)=1;
  g1(9,18)=(1-params(12))*params(10);
  g1(9,20)=(1-params(12))*params(11);
  g1(9,34)=(-1);
  g1(9,9)=(-T120);
  g1(9,10)=(-T120);
  g1(10,4)=(-params(13));
  g1(10,16)=1;
  g1(10,35)=(-1);
  g1(11,5)=(-params(14));
  g1(11,17)=1;
  g1(11,36)=(-1);
  g1(12,6)=(-params(4));
  g1(12,18)=1;
  g1(12,37)=(-1);
  g1(13,7)=(-params(15));
  g1(13,19)=1;
  g1(13,38)=(-1);
  g1(14,11)=(-1);
  g1(14,18)=1;
  g1(14,24)=1;
  g1(15,11)=1;
  g1(15,15)=(-1);
  g1(15,25)=1;
  g1(16,12)=(-1);
  g1(16,20)=1;
  g1(16,26)=1;
  g1(17,1)=(-1);
  g1(17,27)=1;
  g1(18,9)=(-1);
  g1(18,28)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,1444);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,54872);
end
end
