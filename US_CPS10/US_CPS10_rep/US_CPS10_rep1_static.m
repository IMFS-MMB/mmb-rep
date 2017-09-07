function [residual, g1, g2] = US_CPS10_rep1_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 18, 1);

%
% Model equations
%

T31 = (1-params(22)*params(9))*(1-params(9))/((1+params(22)*params(3))*params(9)*(1+params(1)*(1+1/params(2))));
T66 = params(25)^2+params(22)*params(8)^2;
T112 = (1-params(12))*params(10)/4;
lhs =y(1)-y(1)*params(22)/(1+params(22)*params(3))-y(7)-T31*y(4);
rhs =y(1)*params(3)/(1+params(22)*params(3));
residual(1)= lhs-rhs;
residual(2) = y(12);
lhs =(params(25)-params(22)*params(8))*(params(25)-params(8))*y(3)-(params(25)-params(8))*(params(25)-params(22)*params(8)*params(15))*y(9)-(params(25)*params(22)*params(8)*params(13)-params(25)*params(8))*y(6)+T66*y(2)-params(25)*params(22)*params(8)*y(2);
rhs =params(25)*params(8)*y(2);
residual(3)= lhs-rhs;
lhs =(params(25)-params(22)*params(8))*(params(25)-params(8))*y(11)-(params(25)-params(8))*(params(25)-params(22)*params(8)*params(15))*y(9)-(params(25)*params(22)*params(8)*params(13)-params(25)*params(8))*y(6)+T66*y(10)-params(25)*params(22)*params(8)*y(10);
rhs =params(25)*params(8)*y(10);
residual(4)= lhs-rhs;
residual(5) = y(1)+y(3)-y(5)-y(3)+params(13)*y(6);
residual(6) = params(13)*y(6)+y(11)-y(13)-y(11);
residual(7) = y(3)+y(4)-y(9)-params(1)*y(2);
residual(8) = y(11)+y(12)-y(9)-params(1)*y(10);
lhs =y(5)-y(1)*T112+(1-params(12))*params(10)*y(8)-y(2)*(1-params(12))*params(11)+y(10)*(1-params(12))*params(11);
rhs =x(1)+y(1)*T112+y(5)*params(12)+T112*y(17)+T112*y(18);
residual(9)= lhs-rhs;
lhs =y(6);
rhs =params(13)*y(6)+x(2);
residual(10)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(14)+x(3);
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(4)+x(4);
residual(12)= lhs-rhs;
lhs =y(9);
rhs =params(15)*y(9)+x(5);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(1)-y(8);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(5)-y(1);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(2)-y(10);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(1);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(17);
residual(18)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(18, 18);

  %
  % Jacobian matrix
  %

  g1(1,1)=1-params(22)/(1+params(22)*params(3))-params(3)/(1+params(22)*params(3));
  g1(1,4)=(-T31);
  g1(1,7)=(-1);
  g1(2,12)=1;
  g1(3,2)=T66-params(25)*params(22)*params(8)-params(25)*params(8);
  g1(3,3)=(params(25)-params(22)*params(8))*(params(25)-params(8));
  g1(3,6)=(-(params(25)*params(22)*params(8)*params(13)-params(25)*params(8)));
  g1(3,9)=(-((params(25)-params(8))*(params(25)-params(22)*params(8)*params(15))));
  g1(4,6)=(-(params(25)*params(22)*params(8)*params(13)-params(25)*params(8)));
  g1(4,9)=(-((params(25)-params(8))*(params(25)-params(22)*params(8)*params(15))));
  g1(4,10)=T66-params(25)*params(22)*params(8)-params(25)*params(8);
  g1(4,11)=(params(25)-params(22)*params(8))*(params(25)-params(8));
  g1(5,1)=1;
  g1(5,5)=(-1);
  g1(5,6)=params(13);
  g1(6,6)=params(13);
  g1(6,13)=(-1);
  g1(7,2)=(-params(1));
  g1(7,3)=1;
  g1(7,4)=1;
  g1(7,9)=(-1);
  g1(8,9)=(-1);
  g1(8,10)=(-params(1));
  g1(8,11)=1;
  g1(8,12)=1;
  g1(9,1)=(-T112)-T112;
  g1(9,2)=(-((1-params(12))*params(11)));
  g1(9,5)=1-params(12);
  g1(9,8)=(1-params(12))*params(10);
  g1(9,10)=(1-params(12))*params(11);
  g1(9,17)=(-T112);
  g1(9,18)=(-T112);
  g1(10,6)=1-params(13);
  g1(11,7)=1-params(14);
  g1(12,8)=1-params(4);
  g1(13,9)=1-params(15);
  g1(14,1)=(-1);
  g1(14,8)=1;
  g1(14,14)=1;
  g1(15,1)=1;
  g1(15,5)=(-1);
  g1(15,15)=1;
  g1(16,2)=(-1);
  g1(16,10)=1;
  g1(16,16)=1;
  g1(17,1)=(-1);
  g1(17,17)=1;
  g1(18,17)=(-1);
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
