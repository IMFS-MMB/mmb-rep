function [residual, g1, g2, g3] = BGG1_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(18, 1);
T122 = (1-params(19))*(1-params(18))*params(16)/params(1);
lhs =y(18);
rhs =params(7)*y(9)+params(9)*y(22)+params(10)*y(20)+params(8)*y(23);
residual(1)= lhs-rhs;
lhs =y(9);
rhs =y(27)-y(12);
residual(2)= lhs-rhs;
lhs =y(22);
rhs =y(16);
residual(3)= lhs-rhs;
lhs =y(29)-y(12);
rhs =(-params(17))*(y(16)-(y(14)+y(15)));
residual(4)= lhs-rhs;
lhs =y(17);
rhs =(1-params(28))*(y(18)-y(19)-y(4))+y(14)*params(28)-y(3);
residual(5)= lhs-rhs;
lhs =y(14);
rhs =params(25)*(y(20)-y(4));
residual(6)= lhs-rhs;
lhs =y(18);
rhs =y(21)+y(4)*params(19)+(1-params(19))*params(18)*y(10);
residual(7)= lhs-rhs;
lhs =y(18)-y(10)-y(19)-y(9);
rhs =y(10)*params(29)^(-1);
residual(8)= lhs-rhs;
lhs =y(24);
rhs =(-params(26))*y(30)+params(20)*y(31);
residual(9)= lhs-rhs;
lhs =y(11);
rhs =y(8);
residual(10)= lhs-rhs;
lhs =y(15);
rhs =y(20)*params(24)+y(4)*(1-params(24));
residual(11)= lhs-rhs;
lhs =y(16);
rhs =y(17)*params(22)*params(4)*params(6)-params(6)*params(22)*params(2)*y(1)+params(6)*params(22)*(params(4)-params(2))*(y(4)+y(3))+params(22)*params(2)*(y(1)+y(5))+(y(18)-y(19))*T122;
residual(12)= lhs-rhs;
lhs =y(21);
rhs =params(32)*y(6)+x(it_, 1);
residual(13)= lhs-rhs;
lhs =y(23);
rhs =params(33)*y(7)+x(it_, 2);
residual(14)= lhs-rhs;
lhs =y(13);
rhs =params(31)*y(2)+y(11)*params(30)-x(it_, 3);
residual(15)= lhs-rhs;
lhs =y(13);
rhs =y(12)+y(28);
residual(16)= lhs-rhs;
lhs =y(25);
rhs =y(29)-y(12);
residual(17)= lhs-rhs;
lhs =y(26);
rhs =y(28);
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 34);

  %
  % Jacobian matrix
  %

  g1(1,9)=(-params(7));
  g1(1,18)=1;
  g1(1,20)=(-params(10));
  g1(1,22)=(-params(9));
  g1(1,23)=(-params(8));
  g1(2,9)=1;
  g1(2,27)=(-1);
  g1(2,12)=1;
  g1(3,16)=(-1);
  g1(3,22)=1;
  g1(4,12)=(-1);
  g1(4,14)=(-params(17));
  g1(4,15)=(-params(17));
  g1(4,16)=params(17);
  g1(4,29)=1;
  g1(5,3)=1;
  g1(5,14)=(-params(28));
  g1(5,4)=1-params(28);
  g1(5,17)=1;
  g1(5,18)=(-(1-params(28)));
  g1(5,19)=1-params(28);
  g1(6,14)=1;
  g1(6,4)=params(25);
  g1(6,20)=(-params(25));
  g1(7,10)=(-((1-params(19))*params(18)));
  g1(7,4)=(-params(19));
  g1(7,18)=1;
  g1(7,21)=(-1);
  g1(8,9)=(-1);
  g1(8,10)=(-1)-params(29)^(-1);
  g1(8,18)=1;
  g1(8,19)=(-1);
  g1(9,30)=params(26);
  g1(9,24)=1;
  g1(9,31)=(-params(20));
  g1(10,11)=1;
  g1(10,8)=(-1);
  g1(11,4)=(-(1-params(24)));
  g1(11,15)=1;
  g1(11,20)=(-params(24));
  g1(12,1)=(-(params(22)*params(2)+(-(params(6)*params(22)*params(2)))));
  g1(12,3)=(-(params(6)*params(22)*(params(4)-params(2))));
  g1(12,4)=(-(params(6)*params(22)*(params(4)-params(2))));
  g1(12,5)=(-(params(22)*params(2)));
  g1(12,16)=1;
  g1(12,17)=(-(params(22)*params(4)*params(6)));
  g1(12,18)=(-T122);
  g1(12,19)=T122;
  g1(13,6)=(-params(32));
  g1(13,21)=1;
  g1(13,32)=(-1);
  g1(14,7)=(-params(33));
  g1(14,23)=1;
  g1(14,33)=(-1);
  g1(15,11)=(-params(30));
  g1(15,2)=(-params(31));
  g1(15,13)=1;
  g1(15,34)=1;
  g1(16,28)=(-1);
  g1(16,12)=(-1);
  g1(16,13)=1;
  g1(17,12)=1;
  g1(17,29)=(-1);
  g1(17,25)=1;
  g1(18,28)=(-1);
  g1(18,26)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,1156);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,39304);
end
end
