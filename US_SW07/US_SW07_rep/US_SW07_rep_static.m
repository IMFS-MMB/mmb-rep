function [residual, g1, g2, g3] = US_SW07_rep_static(y, x, params)
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

residual = zeros( 43, 1);

%
% Model equations
%

T21 = 1/(params(10)/(1-params(10)));
T37 = 1/(1+params(41)*params(39));
T40 = params(39)^2;
T42 = T40*params(12);
T55 = params(15)/params(39);
T60 = (1-T55)/(params(14)*(1+T55));
T71 = (1-params(13))/(params(44)+1-params(13));
T190 = 1/(1+params(41)*params(39)*params(21));
T204 = (1-params(22))*(1-params(41)*params(39)*params(22))/params(22)/(1+(params(18)-1)*params(3));
T212 = params(41)*params(39)/(1+params(41)*params(39));
T239 = (1-params(20))*(1-params(41)*params(39)*params(20))/((1+params(41)*params(39))*params(20))*1/(1+(params(24)-1)*params(1));
lhs =y(32);
rhs =params(9)*y(11)+(1-params(9))*y(18);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =y(11)*T21;
residual(2)= lhs-rhs;
lhs =y(11);
rhs =y(18)+y(17)-y(12);
residual(3)= lhs-rhs;
lhs =y(12);
rhs =y(10)+y(39);
residual(4)= lhs-rhs;
lhs =y(15);
rhs =T37*(y(15)+y(15)*params(41)*params(39)+1/T42*y(13))+y(35);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =(-y(19))+y(33)*1/T60+y(11)*params(44)/(params(44)+1-params(13))+y(13)*T71;
residual(6)= lhs-rhs;
lhs =y(14);
rhs =y(33)+y(14)*T55/(1+T55)+y(14)*1/(1+T55)-y(19)*T60;
residual(7)= lhs-rhs;
lhs =y(16);
rhs =y(14)*params(51)+y(15)*params(50)+y(34)+y(10)*params(52);
residual(8)= lhs-rhs;
lhs =y(16);
rhs =params(18)*(y(32)+params(9)*y(12)+(1-params(9))*y(17));
residual(9)= lhs-rhs;
lhs =y(18);
rhs =y(17)*params(23)+y(14)*1/(1-T55)-y(14)*T55/(1-T55);
residual(10)= lhs-rhs;
lhs =y(39);
rhs =y(39)*(1-params(46))+y(15)*params(46)+y(35)*T42*params(46);
residual(11)= lhs-rhs;
lhs =y(20);
rhs =params(9)*y(22)+(1-params(9))*y(30)-y(32);
residual(12)= lhs-rhs;
lhs =y(21);
rhs =T21*y(22);
residual(13)= lhs-rhs;
lhs =y(22);
rhs =y(30)+y(28)-y(23);
residual(14)= lhs-rhs;
lhs =y(23);
rhs =y(21)+y(40);
residual(15)= lhs-rhs;
lhs =y(26);
rhs =y(35)+T37*(y(26)+params(41)*params(39)*y(26)+1/T42*y(24));
residual(16)= lhs-rhs;
lhs =y(24);
rhs =y(33)*1/T60+(-y(31))+y(29)+params(44)/(params(44)+1-params(13))*y(22)+T71*y(24);
residual(17)= lhs-rhs;
lhs =y(25);
rhs =y(33)+T55/(1+T55)*y(25)+1/(1+T55)*y(25)-T60*(y(31)-y(29));
residual(18)= lhs-rhs;
lhs =y(27);
rhs =y(34)+params(51)*y(25)+params(50)*y(26)+params(52)*y(21);
residual(19)= lhs-rhs;
lhs =y(27);
rhs =params(18)*(y(32)+params(9)*y(23)+(1-params(9))*y(28));
residual(20)= lhs-rhs;
lhs =y(29);
rhs =T190*(params(41)*params(39)*y(29)+y(29)*params(21)+y(20)*T204)+y(37);
residual(21)= lhs-rhs;
lhs =y(30);
rhs =T37*y(30)+y(30)*T212+y(29)*params(19)/(1+params(41)*params(39))-y(29)*(1+params(41)*params(39)*params(19))/(1+params(41)*params(39))+y(29)*T212+T239*(params(23)*y(28)+1/(1-T55)*y(25)-T55/(1-T55)*y(25)-y(30))+y(38);
residual(22)= lhs-rhs;
lhs =y(31);
rhs =y(29)*params(26)*(1-params(29))+(1-params(29))*params(28)*(y(27)-y(16))+params(27)*(y(16)+y(27)-y(16)-y(27))+y(31)*params(29)+y(36);
residual(23)= lhs-rhs;
lhs =y(32);
rhs =y(32)*params(30)+x(1);
residual(24)= lhs-rhs;
lhs =y(33);
rhs =y(33)*params(31)+x(2);
residual(25)= lhs-rhs;
lhs =y(34);
rhs =y(34)*params(32)+x(4)+x(1)*params(2);
residual(26)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(33)+x(3);
residual(27)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(34)+x(5);
residual(28)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(35)+y(9)-y(9)*params(8);
residual(29)= lhs-rhs;
lhs =y(9);
rhs =x(6);
residual(30)= lhs-rhs;
lhs =y(38);
rhs =y(38)*params(36)+y(8)-y(8)*params(7);
residual(31)= lhs-rhs;
lhs =y(8);
rhs =x(7);
residual(32)= lhs-rhs;
lhs =y(40);
rhs =(1-params(46))*y(40)+params(46)*y(26)+y(35)*params(12)*T40*params(46);
residual(33)= lhs-rhs;
lhs =y(4);
rhs =params(37);
residual(34)= lhs-rhs;
lhs =y(5);
rhs =params(37);
residual(35)= lhs-rhs;
lhs =y(6);
rhs =params(37);
residual(36)= lhs-rhs;
lhs =y(7);
rhs =params(37);
residual(37)= lhs-rhs;
lhs =y(3);
rhs =y(29)+params(5);
residual(38)= lhs-rhs;
lhs =y(41);
rhs =y(29)+y(29)+y(29)+y(29);
residual(39)= lhs-rhs;
lhs =y(2);
rhs =y(31)+params(6);
residual(40)= lhs-rhs;
lhs =y(1);
rhs =y(28)+params(4);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(29);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(29);
residual(43)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(43, 43);

  %
  % Jacobian matrix
  %

T379 = 1-(T55/(1+T55)+1/(1+T55));
T381 = 1/(1-T55)-T55/(1-T55);
  g1(1,11)=(-params(9));
  g1(1,18)=(-(1-params(9)));
  g1(1,32)=1;
  g1(2,10)=1;
  g1(2,11)=(-T21);
  g1(3,11)=1;
  g1(3,12)=1;
  g1(3,17)=(-1);
  g1(3,18)=(-1);
  g1(4,10)=(-1);
  g1(4,12)=1;
  g1(4,39)=(-1);
  g1(5,13)=(-(T37*1/T42));
  g1(5,15)=1-(1+params(41)*params(39))*T37;
  g1(5,35)=(-1);
  g1(6,11)=(-(params(44)/(params(44)+1-params(13))));
  g1(6,13)=1-T71;
  g1(6,19)=1;
  g1(6,33)=(-(1/T60));
  g1(7,14)=T379;
  g1(7,19)=T60;
  g1(7,33)=(-1);
  g1(8,10)=(-params(52));
  g1(8,14)=(-params(51));
  g1(8,15)=(-params(50));
  g1(8,16)=1;
  g1(8,34)=(-1);
  g1(9,12)=(-(params(9)*params(18)));
  g1(9,16)=1;
  g1(9,17)=(-((1-params(9))*params(18)));
  g1(9,32)=(-params(18));
  g1(10,14)=(-T381);
  g1(10,17)=(-params(23));
  g1(10,18)=1;
  g1(11,15)=(-params(46));
  g1(11,35)=(-(T42*params(46)));
  g1(11,39)=1-(1-params(46));
  g1(12,20)=1;
  g1(12,22)=(-params(9));
  g1(12,30)=(-(1-params(9)));
  g1(12,32)=1;
  g1(13,21)=1;
  g1(13,22)=(-T21);
  g1(14,22)=1;
  g1(14,23)=1;
  g1(14,28)=(-1);
  g1(14,30)=(-1);
  g1(15,21)=(-1);
  g1(15,23)=1;
  g1(15,40)=(-1);
  g1(16,24)=(-(T37*1/T42));
  g1(16,26)=1-(1+params(41)*params(39))*T37;
  g1(16,35)=(-1);
  g1(17,22)=(-(params(44)/(params(44)+1-params(13))));
  g1(17,24)=1-T71;
  g1(17,29)=(-1);
  g1(17,31)=1;
  g1(17,33)=(-(1/T60));
  g1(18,25)=T379;
  g1(18,29)=(-T60);
  g1(18,31)=T60;
  g1(18,33)=(-1);
  g1(19,21)=(-params(52));
  g1(19,25)=(-params(51));
  g1(19,26)=(-params(50));
  g1(19,27)=1;
  g1(19,34)=(-1);
  g1(20,23)=(-(params(9)*params(18)));
  g1(20,27)=1;
  g1(20,28)=(-((1-params(9))*params(18)));
  g1(20,32)=(-params(18));
  g1(21,20)=(-(T190*T204));
  g1(21,29)=1-T190*(params(41)*params(39)+params(21));
  g1(21,37)=(-1);
  g1(22,25)=(-(T239*T381));
  g1(22,28)=(-(params(23)*T239));
  g1(22,29)=(-(T212+params(19)/(1+params(41)*params(39))-(1+params(41)*params(39)*params(19))/(1+params(41)*params(39))));
  g1(22,30)=1-(T37+T212-T239);
  g1(22,38)=(-1);
  g1(23,16)=(1-params(29))*params(28);
  g1(23,27)=(-((1-params(29))*params(28)));
  g1(23,29)=(-(params(26)*(1-params(29))));
  g1(23,31)=1-params(29);
  g1(23,36)=(-1);
  g1(24,32)=1-params(30);
  g1(25,33)=1-params(31);
  g1(26,34)=1-params(32);
  g1(27,35)=1-params(33);
  g1(28,36)=1-params(34);
  g1(29,9)=(-(1-params(8)));
  g1(29,37)=1-params(35);
  g1(30,9)=1;
  g1(31,8)=(-(1-params(7)));
  g1(31,38)=1-params(36);
  g1(32,8)=1;
  g1(33,26)=(-params(46));
  g1(33,35)=(-(params(12)*T40*params(46)));
  g1(33,40)=1-(1-params(46));
  g1(34,4)=1;
  g1(35,5)=1;
  g1(36,6)=1;
  g1(37,7)=1;
  g1(38,3)=1;
  g1(38,29)=(-1);
  g1(39,29)=(-4);
  g1(39,41)=1;
  g1(40,2)=1;
  g1(40,31)=(-1);
  g1(41,1)=1;
  g1(41,28)=(-1);
  g1(42,29)=(-1);
  g1(42,42)=1;
  g1(43,29)=(-1);
  g1(43,43)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],43,1849);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],43,79507);
end
end
end
end
