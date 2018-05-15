function [residual, g1, g2, g3] = chen_replication_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 61, 1);

%
% Model equations
%

T75 = (1-params(11))/params(11);
T163 = params(25)^2;
T233 = (1+params(8))/params(8);
T234 = (1+params(28))*T233;
T260 = 1/params(8);
T278 = (1-params(12))/(1+params(28)*T233);
T296 = params(44)/params(40)/(params(20)-params(7));
T300 = params(2)^(-1);
T304 = T296*params(3)^(-1);
T315 = params(44)/params(40)*params(20)*(1-params(7)*exp((-params(6)))*params(49)^(-1))/(params(20)-params(7))/(params(20)-params(7));
T352 = params(20)*params(44)/params(40)/(params(20)-params(7))^2;
lhs =y(1);
rhs =params(1)*y(2)+(1-params(1))*y(5);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =y(5)-y(2)+y(8);
residual(2)= lhs-rhs;
lhs =y(9);
rhs =params(1)*y(7)+(1-params(1))*y(8);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =(1-params(2)*params(11))*(y(1)+y(9)+y(27)+y(24))+params(2)*params(11)*(y(10)+(1+params(9))/params(9)*y(18));
residual(4)= lhs-rhs;
lhs =y(11);
rhs =(1-params(11)*params(3))*(y(1)+y(24)+y(9)+y(28))+params(11)*params(3)*((1+params(9))/params(9)*y(18)+y(11));
residual(5)= lhs-rhs;
lhs =y(12);
rhs =(1-params(2)*params(11))*(y(9)+y(27))+params(2)*params(11)*(y(12)+y(18)*(-1)/params(9));
residual(6)= lhs-rhs;
lhs =y(13);
rhs =(1-params(11)*params(3))*(y(9)+y(28))+params(11)*params(3)*(y(18)*(-1)/params(9)+y(13));
residual(7)= lhs-rhs;
lhs =y(18);
rhs =T75*(y(10)*params(13)+y(11)*(1-params(13))-y(12)*params(13)-y(13)*(1-params(13)));
residual(8)= lhs-rhs;
lhs =y(7);
rhs =(-y(22))+y(19)+y(6);
residual(9)= lhs-rhs;
lhs =y(6);
rhs =(1-params(5))*exp((-params(6)))*(y(6)-y(22))+(1-(1-params(5))*exp((-params(6))))*(y(21)+y(20));
residual(10)= lhs-rhs;
lhs =y(2);
rhs =y(19)*params(18)/params(38);
residual(11)= lhs-rhs;
lhs =y(29);
rhs =exp((-params(6)))*params(4)*(y(2)*params(38)+(1-params(5))*y(29))-y(22)+params(24)*(y(27)*(1+params(10))/(1+params(24)*params(10))-y(27))+(1-params(24))*(y(28)*1/(1+params(24)*params(10))-y(28));
residual(12)= lhs-rhs;
lhs =0;
rhs =y(21)+y(29)-exp(2*params(6))*params(17)*(y(22)+y(20)-y(20))+(y(22)+y(20)-y(20))*params(17)*params(4)*exp(2*params(6));
residual(13)= lhs-rhs;
lhs =y(27);
rhs =1/(1-params(2)*params(25))*(y(25)-params(2)*params(25)*y(25)-params(26)/(1-params(25))*((1+params(2)*T163)*y(30)-params(2)*params(25)*y(30)-params(25)*y(30)));
residual(14)= lhs-rhs;
lhs =y(28);
rhs =1/(1-params(3)*params(25))*(y(26)-params(3)*params(25)*y(26)-params(27)/(1-params(25))*((1+params(3)*T163)*y(31)-params(3)*params(25)*y(31)-params(25)*y(31)));
residual(15)= lhs-rhs;
lhs =y(27);
rhs =y(27)+y(3)-y(22)-y(18);
residual(16)= lhs-rhs;
lhs =y(27)+y(32);
rhs =y(27)+params(20)/(params(20)-params(7))*y(4)-y(22)-y(18)-y(4)*params(7)/(params(20)-params(7));
residual(17)= lhs-rhs;
lhs =y(28);
rhs =y(28)+params(20)/(params(20)-params(7))*y(4)-y(22)-y(18)-y(4)*params(7)/(params(20)-params(7));
residual(18)= lhs-rhs;
lhs =y(14);
rhs =(1-params(2)*params(12))*(y(25)+y(23)+y(8)*(1+params(28))+y(5)*T234)+params(2)*params(12)*(y(14)+T234*(y(18)+y(22)));
residual(19)= lhs-rhs;
lhs =y(15);
rhs =(1-params(3)*params(12))*(y(5)*T234+y(8)*(1+params(28))+y(26)+y(23))+params(3)*params(12)*(T234*(y(18)+y(22))+y(15));
residual(20)= lhs-rhs;
lhs =y(16);
rhs =(1-params(2)*params(12))*(y(8)+y(27)+y(5)*T233)+params(2)*params(12)*(y(16)+T260*(y(22)-y(18)));
residual(21)= lhs-rhs;
lhs =y(17);
rhs =(1-params(3)*params(12))*(y(5)*T233+y(8)+y(28))+params(3)*params(12)*(T260*(y(22)-y(18))+y(17));
residual(22)= lhs-rhs;
lhs =y(5);
rhs =T278*(params(14)*(y(14)-y(16))+(1-params(14))*(y(15)-y(17)))+params(12)*(y(5)-y(18)-y(22));
residual(23)= lhs-rhs;
lhs =y(33)+T296*y(34);
rhs =T300*(y(3)+y(33))+y(34)*T304+y(4)*T315+params(45)/params(40)*y(35)-params(47)/params(40)*y(36)-(y(18)+y(22))*(T300+T304);
residual(24)= lhs-rhs;
lhs =y(38);
rhs =y(34)-params(20)/(params(20)-params(7))*y(4);
residual(25)= lhs-rhs;
lhs =y(38);
rhs =y(38)*params(31)+x(11);
residual(26)= lhs-rhs;
lhs =(y(36)-params(45)*y(35))/(params(48)-params(45));
rhs =y(38)*params(21)+x(10);
residual(27)= lhs-rhs;
residual(28) = y(33)+T296*y(34)-y(4)*T352-(1+T296)*y(39);
lhs =y(32);
rhs =params(19)*(y(38)-y(33))+y(37);
residual(29)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(32)+x(5);
residual(30)= lhs-rhs;
lhs =y(3);
rhs =x(6)+y(3)*params(34)+(1-params(34))*(y(18)*params(22)+params(23)*(y(22)+y(22)+y(22)+y(22)));
residual(31)= lhs-rhs;
lhs =y(9)*params(47);
rhs =params(45)*y(35)+y(30)*params(15)*params(42)+y(31)*params(16)*params(43)+y(20)*params(46)+y(19)*exp((-params(6)))*params(38)*params(51);
residual(32)= lhs-rhs;
lhs =y(22);
rhs =y(22)*params(35)+x(1);
residual(33)= lhs-rhs;
lhs =y(23);
rhs =y(23)*params(36)+x(2);
residual(34)= lhs-rhs;
lhs =y(24);
rhs =x(3);
residual(35)= lhs-rhs;
lhs =y(21);
rhs =y(21)*params(37)+x(4);
residual(36)= lhs-rhs;
lhs =y(25);
rhs =y(25)*params(29)+x(7);
residual(37)= lhs-rhs;
lhs =y(26);
rhs =y(26)*params(30)+x(8);
residual(38)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(33)+x(9);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(4)-y(3);
residual(40)= lhs-rhs;
lhs =y(27);
rhs =y(27)+params(39)/(params(39)-params(66))*y(41)-y(22)-y(18)-y(41)*params(66)/(params(39)-params(66));
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(4)-y(41);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(3)-y(18);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(4)-y(18);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(41)-y(18);
residual(45)= lhs-rhs;
residual(46) = y(46);
lhs =y(56);
rhs =y(9);
residual(47)= lhs-rhs;
lhs =y(47);
rhs =y(18);
residual(48)= lhs-rhs;
lhs =y(48);
rhs =y(3)*4;
residual(49)= lhs-rhs;
lhs =y(49);
rhs =y(4)*4;
residual(50)= lhs-rhs;
lhs =y(55);
rhs =y(42);
residual(51)= lhs-rhs;
lhs =y(50);
rhs =y(46);
residual(52)= lhs-rhs;
lhs =y(51);
rhs =y(9);
residual(53)= lhs-rhs;
lhs =y(52);
rhs =y(47);
residual(54)= lhs-rhs;
lhs =y(53);
rhs =y(48);
residual(55)= lhs-rhs;
lhs =y(54);
rhs =y(49);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(9);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(9);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(9);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(22);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(22);
residual(61)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(61, 61);

  %
  % Jacobian matrix
  %

T538 = (-(params(20)/(params(20)-params(7))-params(7)/(params(20)-params(7))));
  g1(1,1)=1;
  g1(1,2)=(-params(1));
  g1(1,5)=(-(1-params(1)));
  g1(2,2)=1;
  g1(2,5)=(-1);
  g1(2,7)=1;
  g1(2,8)=(-1);
  g1(3,7)=(-params(1));
  g1(3,8)=(-(1-params(1)));
  g1(3,9)=1;
  g1(4,1)=(-(1-params(2)*params(11)));
  g1(4,9)=(-(1-params(2)*params(11)));
  g1(4,10)=1-params(2)*params(11);
  g1(4,18)=(-(params(2)*params(11)*(1+params(9))/params(9)));
  g1(4,24)=(-(1-params(2)*params(11)));
  g1(4,27)=(-(1-params(2)*params(11)));
  g1(5,1)=(-(1-params(11)*params(3)));
  g1(5,9)=(-(1-params(11)*params(3)));
  g1(5,11)=1-params(11)*params(3);
  g1(5,18)=(-((1+params(9))/params(9)*params(11)*params(3)));
  g1(5,24)=(-(1-params(11)*params(3)));
  g1(5,28)=(-(1-params(11)*params(3)));
  g1(6,9)=(-(1-params(2)*params(11)));
  g1(6,12)=1-params(2)*params(11);
  g1(6,18)=(-(params(2)*params(11)*(-1)/params(9)));
  g1(6,27)=(-(1-params(2)*params(11)));
  g1(7,9)=(-(1-params(11)*params(3)));
  g1(7,13)=1-params(11)*params(3);
  g1(7,18)=(-(params(11)*params(3)*(-1)/params(9)));
  g1(7,28)=(-(1-params(11)*params(3)));
  g1(8,10)=(-(T75*params(13)));
  g1(8,11)=(-(T75*(1-params(13))));
  g1(8,12)=(-(T75*(-params(13))));
  g1(8,13)=(-(T75*(-(1-params(13)))));
  g1(8,18)=1;
  g1(9,6)=(-1);
  g1(9,7)=1;
  g1(9,19)=(-1);
  g1(9,22)=1;
  g1(10,6)=1-(1-params(5))*exp((-params(6)));
  g1(10,20)=(-(1-(1-params(5))*exp((-params(6)))));
  g1(10,21)=(-(1-(1-params(5))*exp((-params(6)))));
  g1(10,22)=(1-params(5))*exp((-params(6)));
  g1(11,2)=1;
  g1(11,19)=(-(params(18)/params(38)));
  g1(12,2)=(-(params(38)*exp((-params(6)))*params(4)));
  g1(12,22)=1;
  g1(12,27)=(-(params(24)*((1+params(10))/(1+params(24)*params(10))-1)));
  g1(12,28)=(-((1-params(24))*(1/(1+params(24)*params(10))-1)));
  g1(12,29)=1-(1-params(5))*exp((-params(6)))*params(4);
  g1(13,21)=(-1);
  g1(13,22)=(-(params(17)*params(4)*exp(2*params(6))+(-(exp(2*params(6))*params(17)))));
  g1(13,29)=(-1);
  g1(14,25)=(-((1-params(2)*params(25))*1/(1-params(2)*params(25))));
  g1(14,27)=1;
  g1(14,30)=(-(1/(1-params(2)*params(25))*(-(params(26)/(1-params(25))*(1+params(2)*T163-params(2)*params(25)-params(25))))));
  g1(15,26)=(-((1-params(3)*params(25))*1/(1-params(3)*params(25))));
  g1(15,28)=1;
  g1(15,31)=(-(1/(1-params(3)*params(25))*(-(params(27)/(1-params(25))*(1+params(3)*T163-params(3)*params(25)-params(25))))));
  g1(16,3)=(-1);
  g1(16,18)=1;
  g1(16,22)=1;
  g1(17,4)=T538;
  g1(17,18)=1;
  g1(17,22)=1;
  g1(17,32)=1;
  g1(18,4)=T538;
  g1(18,18)=1;
  g1(18,22)=1;
  g1(19,5)=(-((1-params(2)*params(12))*T234));
  g1(19,8)=(-((1-params(2)*params(12))*(1+params(28))));
  g1(19,14)=1-params(2)*params(12);
  g1(19,18)=(-(params(2)*params(12)*T234));
  g1(19,22)=(-(params(2)*params(12)*T234));
  g1(19,23)=(-(1-params(2)*params(12)));
  g1(19,25)=(-(1-params(2)*params(12)));
  g1(20,5)=(-(T234*(1-params(3)*params(12))));
  g1(20,8)=(-((1+params(28))*(1-params(3)*params(12))));
  g1(20,15)=1-params(3)*params(12);
  g1(20,18)=(-(T234*params(3)*params(12)));
  g1(20,22)=(-(T234*params(3)*params(12)));
  g1(20,23)=(-(1-params(3)*params(12)));
  g1(20,26)=(-(1-params(3)*params(12)));
  g1(21,5)=(-((1-params(2)*params(12))*T233));
  g1(21,8)=(-(1-params(2)*params(12)));
  g1(21,16)=1-params(2)*params(12);
  g1(21,18)=(-(params(2)*params(12)*(-T260)));
  g1(21,22)=(-(params(2)*params(12)*T260));
  g1(21,27)=(-(1-params(2)*params(12)));
  g1(22,5)=(-(T233*(1-params(3)*params(12))));
  g1(22,8)=(-(1-params(3)*params(12)));
  g1(22,17)=1-params(3)*params(12);
  g1(22,18)=(-(params(3)*params(12)*(-T260)));
  g1(22,22)=(-(params(3)*params(12)*T260));
  g1(22,28)=(-(1-params(3)*params(12)));
  g1(23,5)=1-params(12);
  g1(23,14)=(-(T278*params(14)));
  g1(23,15)=(-(T278*(1-params(14))));
  g1(23,16)=(-(T278*(-params(14))));
  g1(23,17)=(-(T278*(-(1-params(14)))));
  g1(23,18)=params(12);
  g1(23,22)=params(12);
  g1(24,3)=(-T300);
  g1(24,4)=(-T315);
  g1(24,18)=T300+T304;
  g1(24,22)=T300+T304;
  g1(24,33)=1-T300;
  g1(24,34)=T296-T304;
  g1(24,35)=(-(params(45)/params(40)));
  g1(24,36)=params(47)/params(40);
  g1(25,4)=params(20)/(params(20)-params(7));
  g1(25,34)=(-1);
  g1(25,38)=1;
  g1(26,38)=1-params(31);
  g1(27,35)=(-params(45))/(params(48)-params(45));
  g1(27,36)=1/(params(48)-params(45));
  g1(27,38)=(-params(21));
  g1(28,4)=(-T352);
  g1(28,33)=1;
  g1(28,34)=T296;
  g1(28,39)=(-(1+T296));
  g1(29,32)=1;
  g1(29,33)=params(19);
  g1(29,37)=(-1);
  g1(29,38)=(-params(19));
  g1(30,37)=1-params(32);
  g1(31,3)=1-params(34);
  g1(31,18)=(-((1-params(34))*params(22)));
  g1(31,22)=(-((1-params(34))*params(23)*4));
  g1(32,9)=params(47);
  g1(32,19)=(-(exp((-params(6)))*params(38)*params(51)));
  g1(32,20)=(-params(46));
  g1(32,30)=(-(params(15)*params(42)));
  g1(32,31)=(-(params(16)*params(43)));
  g1(32,35)=(-params(45));
  g1(33,22)=1-params(35);
  g1(34,23)=1-params(36);
  g1(35,24)=1;
  g1(36,21)=1-params(37);
  g1(37,25)=1-params(29);
  g1(38,26)=1-params(30);
  g1(39,35)=1-params(33);
  g1(40,3)=1;
  g1(40,4)=(-1);
  g1(40,40)=1;
  g1(41,18)=1;
  g1(41,22)=1;
  g1(41,41)=(-(params(39)/(params(39)-params(66))-params(66)/(params(39)-params(66))));
  g1(42,4)=(-1);
  g1(42,41)=1;
  g1(42,42)=1;
  g1(43,3)=(-1);
  g1(43,18)=1;
  g1(43,43)=1;
  g1(44,4)=(-1);
  g1(44,18)=1;
  g1(44,44)=1;
  g1(45,18)=1;
  g1(45,41)=(-1);
  g1(45,45)=1;
  g1(46,46)=1;
  g1(47,9)=(-1);
  g1(47,56)=1;
  g1(48,18)=(-1);
  g1(48,47)=1;
  g1(49,3)=(-4);
  g1(49,48)=1;
  g1(50,4)=(-4);
  g1(50,49)=1;
  g1(51,42)=(-1);
  g1(51,55)=1;
  g1(52,46)=(-1);
  g1(52,50)=1;
  g1(53,9)=(-1);
  g1(53,51)=1;
  g1(54,47)=(-1);
  g1(54,52)=1;
  g1(55,48)=(-1);
  g1(55,53)=1;
  g1(56,49)=(-1);
  g1(56,54)=1;
  g1(57,9)=(-1);
  g1(57,57)=1;
  g1(58,9)=(-1);
  g1(58,58)=1;
  g1(59,9)=(-1);
  g1(59,59)=1;
  g1(60,22)=(-1);
  g1(60,60)=1;
  g1(61,22)=(-1);
  g1(61,61)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],61,3721);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],61,226981);
end
end
end
end
