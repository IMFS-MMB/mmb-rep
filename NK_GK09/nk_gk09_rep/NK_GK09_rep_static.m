function [residual, g1, g2] = NK_GK09_rep_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 37, 1);

%
% Model equations
%

T212 = params(52)*params(17)*params(23)^(params(20)*(1-params(18)));
T233 = params(23)^((1-params(18))*(params(17)-1))*params(17)*params(20)/(1-params(17))*((1-params(17)*params(23)^((1-params(18))*(params(17)-1)))/(1-params(17)))^((-params(20))/(1-params(17)));
T264 = params(54)*params(47)*params(2)*params(17)*params(23)^(params(18)-1);
lhs =params(30)*y(1);
rhs =(1-params(1))*params(2)*(params(33)*y(2)-params(28)*y(3))+(1-params(1))*params(2)*(params(33)-params(28))*y(27)+params(30)*params(1)*params(2)*params(32)*(y(1)+y(27)+y(6));
residual(1)= lhs-rhs;
lhs =params(29)*y(5);
rhs =params(28)*(1-params(1))*params(2)*params(47)*(y(3)+y(27))+params(29)*params(1)*params(2)*params(31)*(y(5)+y(27)+y(7));
residual(2)= lhs-rhs;
lhs =params(3)*params(26)*y(8)-params(30)*params(26)*(y(1)+y(8));
rhs =params(29)*y(5);
residual(3)= lhs-rhs;
lhs =params(31)*y(7);
rhs =params(28)*y(3)+(params(33)*y(2)-params(28)*y(3))*params(26)+y(8)*(params(33)-params(28))*params(26);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =y(7);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =params(43)/params(42)*y(10)+params(44)/params(42)*y(11)-x(4);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =y(7)+y(9);
residual(7)= lhs-rhs;
lhs =y(11);
rhs =y(12)+y(13)+y(23);
residual(8)= lhs-rhs;
lhs =params(33)*params(40)*(y(13)+y(2)+y(12));
rhs =params(5)*params(19)*params(41)*(y(25)+y(34))+params(40)*(y(13)+y(12)+y(23))-params(40)*params(34)*(y(13)+y(23)+y(14));
residual(9)= lhs-rhs;
lhs =y(34);
rhs =y(24)+params(5)*y(15)+y(23)*params(5)+y(13)*params(5)+(1-params(5))*y(16);
residual(10)= lhs-rhs;
lhs =y(14)*params(34)/(params(34)-params(6));
rhs =y(15)*(1+params(8));
residual(11)= lhs-rhs;
lhs =y(25)+y(34)-y(15);
rhs =y(13)+y(23)+y(15)*params(8);
residual(12)= lhs-rhs;
lhs =y(37);
rhs =params(22)*y(18)-params(40)*params(34)*(y(14)+y(13)+y(23));
residual(13)= lhs-rhs;
residual(14) = y(12);
lhs =y(13)*params(40);
rhs =y(37)+y(13)*params(40)+y(23)*params(40);
residual(15)= lhs-rhs;
lhs =y(4);
rhs =(-1)/((1-params(2)*params(21))*(1-params(21)))*(y(19)-params(21)*y(19)-params(2)*params(21)*(y(19)-params(21)*y(19)));
residual(16)= lhs-rhs;
residual(17) = y(27);
residual(18) = y(3)+y(27);
lhs =params(41)*y(17);
rhs =params(22)*y(18)+y(19)*params(45);
residual(19)= lhs-rhs;
lhs =y(25)+y(34)-y(16);
rhs =(-y(4))+y(16)*params(11);
residual(20)= lhs-rhs;
lhs =y(25);
rhs =y(20)-y(21);
residual(21)= lhs-rhs;
lhs =y(35);
rhs =(-y(25));
residual(22)= lhs-rhs;
lhs =y(17);
rhs =y(34)+y(36);
residual(23)= lhs-rhs;
lhs =y(36)*params(52);
rhs =T212*(y(36)+y(21)*params(20)*(-params(18))+y(21)*params(20))+T233*(y(21)*(params(17)-1)+y(21)*params(18)*(1-params(17)));
residual(24)= lhs-rhs;
lhs =params(53)*y(31);
rhs =params(19)*params(41)*(y(25)+y(17))+params(53)*params(47)*params(2)*params(17)*(y(31)+y(21)*params(20)+y(27)-y(21)*params(20)*params(18));
residual(25)= lhs-rhs;
lhs =params(54)*y(32);
rhs =params(41)*y(17)+T264*(y(32)+y(27)+y(21)*params(18)*(1-params(20))-y(21)*(1-params(20)));
residual(26)= lhs-rhs;
lhs =y(33);
rhs =y(21)+y(31)-y(32);
residual(27)= lhs-rhs;
lhs =y(21);
rhs =y(21)*params(17)*params(18)+(1-params(17))*y(33);
residual(28)= lhs-rhs;
lhs =y(22);
rhs =y(3)+y(21);
residual(29)= lhs-rhs;
lhs =y(22);
rhs =y(22)*params(14)+(1-params(14))*(y(21)*params(15)+y(35)*params(16))+x(1);
residual(30)= lhs-rhs;
lhs =y(26);
rhs =y(2)-y(3);
residual(31)= lhs-rhs;
lhs =y(24);
rhs =y(24)*params(12)-x(2);
residual(32)= lhs-rhs;
lhs =y(23);
rhs =y(23)*params(13)-x(3);
residual(33)= lhs-rhs;
lhs =y(28);
rhs =y(2);
residual(34)= lhs-rhs;
lhs =params(48)*y(29);
rhs =y(26)*(-params(49))*params(27);
residual(35)= lhs-rhs;
lhs =y(12)+y(13);
rhs =y(9)+y(30);
residual(36)= lhs-rhs;
lhs =y(29)+y(30);
rhs =y(8);
residual(37)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(37, 37);

  %
  % Jacobian matrix
  %

  g1(1,1)=params(30)-params(30)*params(1)*params(2)*params(32);
  g1(1,2)=(-((1-params(1))*params(2)*params(33)));
  g1(1,3)=(-((1-params(1))*params(2)*(-params(28))));
  g1(1,6)=(-(params(30)*params(1)*params(2)*params(32)));
  g1(1,27)=(-((1-params(1))*params(2)*(params(33)-params(28))+params(30)*params(1)*params(2)*params(32)));
  g1(2,3)=(-(params(28)*(1-params(1))*params(2)*params(47)));
  g1(2,5)=params(29)-params(29)*params(1)*params(2)*params(31);
  g1(2,7)=(-(params(29)*params(1)*params(2)*params(31)));
  g1(2,27)=(-(params(28)*(1-params(1))*params(2)*params(47)+params(29)*params(1)*params(2)*params(31)));
  g1(3,1)=(-(params(30)*params(26)));
  g1(3,5)=(-params(29));
  g1(3,8)=params(3)*params(26)-params(30)*params(26);
  g1(4,2)=(-(params(33)*params(26)));
  g1(4,3)=(-(params(28)+params(26)*(-params(28))));
  g1(4,7)=params(31);
  g1(4,8)=(-((params(33)-params(28))*params(26)));
  g1(5,6)=1;
  g1(5,7)=(-1);
  g1(6,9)=1;
  g1(6,10)=(-(params(43)/params(42)));
  g1(6,11)=(-(params(44)/params(42)));
  g1(7,7)=(-1);
  g1(7,9)=(-1);
  g1(7,10)=1;
  g1(8,11)=1;
  g1(8,12)=(-1);
  g1(8,13)=(-1);
  g1(8,23)=(-1);
  g1(9,2)=params(33)*params(40);
  g1(9,12)=params(33)*params(40)-params(40);
  g1(9,13)=params(33)*params(40)-(params(40)-params(40)*params(34));
  g1(9,14)=params(40)*params(34);
  g1(9,23)=(-(params(40)-params(40)*params(34)));
  g1(9,25)=(-(params(5)*params(19)*params(41)));
  g1(9,34)=(-(params(5)*params(19)*params(41)));
  g1(10,13)=(-params(5));
  g1(10,15)=(-params(5));
  g1(10,16)=(-(1-params(5)));
  g1(10,23)=(-params(5));
  g1(10,24)=(-1);
  g1(10,34)=1;
  g1(11,14)=params(34)/(params(34)-params(6));
  g1(11,15)=(-(1+params(8)));
  g1(12,13)=(-1);
  g1(12,15)=(-1)-params(8);
  g1(12,23)=(-1);
  g1(12,25)=1;
  g1(12,34)=1;
  g1(13,13)=params(40)*params(34);
  g1(13,14)=params(40)*params(34);
  g1(13,18)=(-params(22));
  g1(13,23)=params(40)*params(34);
  g1(13,37)=1;
  g1(14,12)=1;
  g1(15,23)=(-params(40));
  g1(15,37)=(-1);
  g1(16,4)=1;
  g1(16,19)=(-((-1)/((1-params(2)*params(21))*(1-params(21)))*(1-params(21)-params(2)*params(21)*(1-params(21)))));
  g1(17,27)=1;
  g1(18,3)=1;
  g1(18,27)=1;
  g1(19,17)=params(41);
  g1(19,18)=(-params(22));
  g1(19,19)=(-params(45));
  g1(20,4)=1;
  g1(20,16)=(-1)-params(11);
  g1(20,25)=1;
  g1(20,34)=1;
  g1(21,20)=(-1);
  g1(21,21)=1;
  g1(21,25)=1;
  g1(22,25)=1;
  g1(22,35)=1;
  g1(23,17)=1;
  g1(23,34)=(-1);
  g1(23,36)=(-1);
  g1(24,21)=(-(T212*(params(20)+params(20)*(-params(18)))+T233*(params(17)-1+params(18)*(1-params(17)))));
  g1(24,36)=params(52)-T212;
  g1(25,17)=(-(params(19)*params(41)));
  g1(25,21)=(-(params(53)*params(47)*params(2)*params(17)*(params(20)-params(20)*params(18))));
  g1(25,25)=(-(params(19)*params(41)));
  g1(25,27)=(-(params(53)*params(47)*params(2)*params(17)));
  g1(25,31)=params(53)-params(53)*params(47)*params(2)*params(17);
  g1(26,17)=(-params(41));
  g1(26,21)=(-(T264*(params(18)*(1-params(20))-(1-params(20)))));
  g1(26,27)=(-T264);
  g1(26,32)=params(54)-T264;
  g1(27,21)=(-1);
  g1(27,31)=(-1);
  g1(27,32)=1;
  g1(27,33)=1;
  g1(28,21)=1-params(17)*params(18);
  g1(28,33)=(-(1-params(17)));
  g1(29,3)=(-1);
  g1(29,21)=(-1);
  g1(29,22)=1;
  g1(30,21)=(-((1-params(14))*params(15)));
  g1(30,22)=1-params(14);
  g1(30,35)=(-((1-params(14))*params(16)));
  g1(31,2)=(-1);
  g1(31,3)=1;
  g1(31,26)=1;
  g1(32,24)=1-params(12);
  g1(33,23)=1-params(13);
  g1(34,2)=(-1);
  g1(34,28)=1;
  g1(35,26)=(-((-params(49))*params(27)));
  g1(35,29)=params(48);
  g1(36,9)=(-1);
  g1(36,12)=1;
  g1(36,13)=1;
  g1(36,30)=(-1);
  g1(37,8)=(-1);
  g1(37,29)=1;
  g1(37,30)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],37,1369);
end
end
