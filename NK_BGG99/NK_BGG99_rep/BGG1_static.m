function [residual, g1, g2] = BGG1_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 18, 1);

%
% Model equations
%

T113 = (1-params(19))*(1-params(18))*params(16)/params(1);
lhs =y(10);
rhs =params(7)*y(1)+params(9)*y(14)+params(10)*y(12)+params(8)*y(15);
residual(1)= lhs-rhs;
lhs =y(1);
rhs =y(1)-y(4);
residual(2)= lhs-rhs;
lhs =y(14);
rhs =y(8);
residual(3)= lhs-rhs;
lhs =y(9)-y(4);
rhs =(-params(17))*(y(8)-(y(6)+y(7)));
residual(4)= lhs-rhs;
lhs =y(9);
rhs =(1-params(28))*(y(10)-y(11)-y(7))+y(6)*params(28)-y(6);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =params(25)*(y(12)-y(7));
residual(6)= lhs-rhs;
lhs =y(10);
rhs =y(13)+y(7)*params(19)+(1-params(19))*params(18)*y(2);
residual(7)= lhs-rhs;
lhs =y(10)-y(2)-y(11)-y(1);
rhs =y(2)*params(29)^(-1);
residual(8)= lhs-rhs;
lhs =y(16);
rhs =y(11)*(-params(26))+params(20)*y(18);
residual(9)= lhs-rhs;
lhs =y(3);
rhs =y(16);
residual(10)= lhs-rhs;
lhs =y(7);
rhs =y(12)*params(24)+y(7)*(1-params(24));
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(9)*params(22)*params(4)*params(6)-y(4)*params(6)*params(22)*params(2)+(y(6)+y(7))*params(6)*params(22)*(params(4)-params(2))+params(22)*params(2)*(y(4)+y(8))+(y(10)-y(11))*T113;
residual(12)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(32)+x(1);
residual(13)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(33)+x(2);
residual(14)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(31)+y(3)*params(30)-x(3);
residual(15)= lhs-rhs;
lhs =y(5);
rhs =y(4)+y(3);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(9)-y(4);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(3);
residual(18)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(18, 18);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-params(7));
  g1(1,10)=1;
  g1(1,12)=(-params(10));
  g1(1,14)=(-params(9));
  g1(1,15)=(-params(8));
  g1(2,4)=1;
  g1(3,8)=(-1);
  g1(3,14)=1;
  g1(4,4)=(-1);
  g1(4,6)=(-params(17));
  g1(4,7)=(-params(17));
  g1(4,8)=params(17);
  g1(4,9)=1;
  g1(5,6)=(-(params(28)-1));
  g1(5,7)=1-params(28);
  g1(5,9)=1;
  g1(5,10)=(-(1-params(28)));
  g1(5,11)=1-params(28);
  g1(6,6)=1;
  g1(6,7)=params(25);
  g1(6,12)=(-params(25));
  g1(7,2)=(-((1-params(19))*params(18)));
  g1(7,7)=(-params(19));
  g1(7,10)=1;
  g1(7,13)=(-1);
  g1(8,1)=(-1);
  g1(8,2)=(-1)-params(29)^(-1);
  g1(8,10)=1;
  g1(8,11)=(-1);
  g1(9,11)=params(26);
  g1(9,16)=1;
  g1(9,18)=(-params(20));
  g1(10,3)=1;
  g1(10,16)=(-1);
  g1(11,7)=1-(1-params(24));
  g1(11,12)=(-params(24));
  g1(12,4)=(-(params(22)*params(2)+(-(params(6)*params(22)*params(2)))));
  g1(12,6)=(-(params(6)*params(22)*(params(4)-params(2))));
  g1(12,7)=(-(params(6)*params(22)*(params(4)-params(2))));
  g1(12,8)=1-params(22)*params(2);
  g1(12,9)=(-(params(22)*params(4)*params(6)));
  g1(12,10)=(-T113);
  g1(12,11)=T113;
  g1(13,13)=1-params(32);
  g1(14,15)=1-params(33);
  g1(15,3)=(-params(30));
  g1(15,5)=1-params(31);
  g1(16,3)=(-1);
  g1(16,4)=(-1);
  g1(16,5)=1;
  g1(17,4)=1;
  g1(17,9)=(-1);
  g1(17,17)=1;
  g1(18,3)=(-1);
  g1(18,18)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,324);
end
end
