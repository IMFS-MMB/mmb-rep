function [residual, g1, g2, g3] = DEFK_nozlb_noint_static(y, x, params)
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

residual = zeros( 32, 1);

%
% Model equations
%

T11 = y(1)^(-params(2));
T25 = 1+params(4)*(y(15)-y(16))/(y(16)-y(15)*params(5));
T33 = (y(17)+y(15)*(1-params(8)))/y(15);
T40 = (y(16)-y(15)*params(5))*(y(17)+y(15)*(1-params(8)));
T42 = 1+params(4)*(y(15)-y(16))*(y(17)+y(15)*(1-params(8))*y(32))/T40;
T83 = params(32)*y(8)^params(6);
T86 = y(5)^(1-params(6));
T96 = (y(5)/y(8))^(1-params(6));
T103 = (y(8)/y(5))^params(6);
T124 = y(26)^(1/params(11));
T128 = (1-params(13)*T124)/(1-params(13));
T130 = T128^(-params(11));
T139 = y(26)^((1+params(11))/params(11));
T155 = y(22)^(1/params(10));
T165 = ((1-params(12)*T155)/(1-params(12)))^(-(params(10)+(1+params(10))*params(3)));
T175 = params(1)*params(12)*y(22)^((1+params(10))*(1+params(3))/params(10));
T197 = params(25)^(1-params(16));
T199 = T197*y(14)^params(16);
T201 = y(26)^params(14);
T202 = T199*T201;
T206 = (y(6)/params(20))^params(15);
lhs =T11;
rhs =T11*params(1)*y(19)*T25;
residual(1)= lhs-rhs;
lhs =T11;
rhs =T11*params(1)*T33*T42;
residual(2)= lhs-rhs;
lhs =(y(16)-y(15)*params(5))*y(2);
rhs =params(4)*((y(17)+y(15)*(1-params(8))*y(32))*y(9)+y(14)*y(11)*y(6)/y(26)-y(7));
residual(3)= lhs-rhs;
lhs =y(16);
rhs =1+y(3)+y(4)*y(2)/params(22);
residual(4)= lhs-rhs;
lhs =y(3);
rhs =params(9)*(y(2)/params(22)-1)^2/2;
residual(5)= lhs-rhs;
lhs =y(4);
rhs =params(9)*(y(2)/params(22)-1);
residual(6)= lhs-rhs;
lhs =y(6)*y(29);
rhs =T83*T86-params(7);
residual(7)= lhs-rhs;
lhs =y(18);
rhs =params(32)*params(6)*y(25)*T96;
residual(8)= lhs-rhs;
lhs =y(21);
rhs =params(32)*(1-params(6))*y(25)*T103;
residual(9)= lhs-rhs;
lhs =y(17)*y(8);
rhs =y(6)-y(5)*y(21)+y(2)*(y(16)-(1+y(3)));
residual(10)= lhs-rhs;
lhs =y(8);
rhs =y(9)+y(10);
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(2)+(1-params(8))*y(8);
residual(12)= lhs-rhs;
lhs =y(27);
rhs =y(28)*T130;
residual(13)= lhs-rhs;
lhs =y(27);
rhs =y(25)*y(6)*T11*(1+params(11))+y(27)*params(1)*params(13)*T139;
residual(14)= lhs-rhs;
lhs =y(28);
rhs =T11*y(6)+y(28)*T124*params(1)*params(13);
residual(15)= lhs-rhs;
lhs =y(23);
rhs =y(24)*T165;
residual(16)= lhs-rhs;
lhs =y(23);
rhs =(1+params(10))*y(5)^(1+params(3))+y(23)*T175;
residual(17)= lhs-rhs;
lhs =y(24);
rhs =y(5)*T11*y(21)+y(24)*T155*params(1)*params(12);
residual(18)= lhs-rhs;
lhs =y(26)*y(21);
rhs =y(21)*y(22);
residual(19)= lhs-rhs;
lhs =y(29);
rhs =T139*y(29)*params(13)+(1-params(13))*T128^(1+params(11));
residual(20)= lhs-rhs;
lhs =y(14);
rhs =T202*T206;
residual(21)= lhs-rhs;
residual(22) = y(10);
lhs =y(7);
rhs =params(30)+params(18)*(y(14)*y(11)*y(6)/y(26)-params(20)*params(25)*params(31)-y(15)*y(10));
residual(23)= lhs-rhs;
lhs =y(14)*y(11)*y(6)/y(26)+y(15)*y(10);
rhs =y(7)+(y(17)+y(15)*(1-params(8)))*y(10)+y(11)*y(6);
residual(24)= lhs-rhs;
lhs =y(6);
rhs =y(1)+y(2)*(1+y(3));
residual(25)= lhs-rhs;
lhs =y(19);
rhs =y(14)/y(26);
residual(26)= lhs-rhs;
lhs =y(20);
rhs =T33;
residual(27)= lhs-rhs;
lhs =y(31);
rhs =y(20)-y(19);
residual(28)= lhs-rhs;
lhs =y(30);
rhs =params(4)*(y(15)-y(16))/(y(16)-y(15)*params(5));
residual(29)= lhs-rhs;
lhs =y(12);
rhs =y(15)*y(8);
residual(30)= lhs-rhs;
lhs =y(13);
rhs =y(1)+y(16)*y(2);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =(1-params(19))*params(33)+y(32)*params(19)+x(1);
residual(32)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(32, 32);

  %
  % Jacobian matrix
  %

T255 = getPowerDeriv(y(1),(-params(2)),1);
T291 = getPowerDeriv(y(5)/y(8),1-params(6),1);
T298 = getPowerDeriv(y(8)/y(5),params(6),1);
T367 = (params(4)*(y(16)-y(15)*params(5))-params(4)*(y(15)-y(16))*(-params(5)))/((y(16)-y(15)*params(5))*(y(16)-y(15)*params(5)));
T401 = ((y(16)-y(15)*params(5))*(-params(4))-params(4)*(y(15)-y(16)))/((y(16)-y(15)*params(5))*(y(16)-y(15)*params(5)));
T430 = getPowerDeriv(y(22),1/params(10),1);
T457 = (-(y(14)*y(11)*y(6)))/(y(26)*y(26));
T460 = getPowerDeriv(y(26),1/params(11),1);
T468 = getPowerDeriv(y(26),(1+params(11))/params(11),1);
  g1(1,1)=T255-T25*y(19)*params(1)*T255;
  g1(1,15)=(-(T11*params(1)*y(19)*T367));
  g1(1,16)=(-(T11*params(1)*y(19)*T401));
  g1(1,19)=(-(T11*params(1)*T25));
  g1(2,1)=T255-T42*T33*params(1)*T255;
  g1(2,15)=(-(T42*T11*params(1)*(y(15)*(1-params(8))-(y(17)+y(15)*(1-params(8))))/(y(15)*y(15))+T11*params(1)*T33*(T40*(params(4)*(y(17)+y(15)*(1-params(8))*y(32))+params(4)*(y(15)-y(16))*(1-params(8))*y(32))-params(4)*(y(15)-y(16))*(y(17)+y(15)*(1-params(8))*y(32))*((y(17)+y(15)*(1-params(8)))*(-params(5))+(y(16)-y(15)*params(5))*(1-params(8))))/(T40*T40)));
  g1(2,16)=(-(T11*params(1)*T33*(T40*(y(17)+y(15)*(1-params(8))*y(32))*(-params(4))-(y(17)+y(15)*(1-params(8)))*params(4)*(y(15)-y(16))*(y(17)+y(15)*(1-params(8))*y(32)))/(T40*T40)));
  g1(2,17)=(-(T42*T11*params(1)*1/y(15)+T11*params(1)*T33*(params(4)*(y(15)-y(16))*T40-(y(16)-y(15)*params(5))*params(4)*(y(15)-y(16))*(y(17)+y(15)*(1-params(8))*y(32)))/(T40*T40)));
  g1(2,32)=(-(T11*params(1)*T33*params(4)*(y(15)-y(16))*y(15)*(1-params(8))/T40));
  g1(3,2)=y(16)-y(15)*params(5);
  g1(3,6)=(-(params(4)*y(14)*y(11)/y(26)));
  g1(3,7)=params(4);
  g1(3,9)=(-(params(4)*(y(17)+y(15)*(1-params(8))*y(32))));
  g1(3,11)=(-(params(4)*y(14)*y(6)/y(26)));
  g1(3,14)=(-(params(4)*y(11)*y(6)/y(26)));
  g1(3,15)=y(2)*(-params(5))-params(4)*(1-params(8))*y(32)*y(9);
  g1(3,16)=y(2);
  g1(3,17)=(-(params(4)*y(9)));
  g1(3,26)=(-(params(4)*T457));
  g1(3,32)=(-(params(4)*y(15)*(1-params(8))*y(9)));
  g1(4,2)=(-(y(4)*1/params(22)));
  g1(4,3)=(-1);
  g1(4,4)=(-(y(2)/params(22)));
  g1(4,16)=1;
  g1(5,2)=(-(params(9)*1/params(22)*2*(y(2)/params(22)-1)/2));
  g1(5,3)=1;
  g1(6,2)=(-(params(9)*1/params(22)));
  g1(6,4)=1;
  g1(7,5)=(-(T83*getPowerDeriv(y(5),1-params(6),1)));
  g1(7,6)=y(29);
  g1(7,8)=(-(T86*params(32)*getPowerDeriv(y(8),params(6),1)));
  g1(7,29)=y(6);
  g1(8,5)=(-(params(32)*params(6)*y(25)*1/y(8)*T291));
  g1(8,8)=(-(params(32)*params(6)*y(25)*T291*(-y(5))/(y(8)*y(8))));
  g1(8,18)=1;
  g1(8,25)=(-(T96*params(32)*params(6)));
  g1(9,5)=(-(params(32)*(1-params(6))*y(25)*(-y(8))/(y(5)*y(5))*T298));
  g1(9,8)=(-(params(32)*(1-params(6))*y(25)*T298*1/y(5)));
  g1(9,21)=1;
  g1(9,25)=(-(T103*params(32)*(1-params(6))));
  g1(10,2)=(-(y(16)-(1+y(3))));
  g1(10,3)=y(2);
  g1(10,5)=y(21);
  g1(10,6)=(-1);
  g1(10,8)=y(17);
  g1(10,16)=(-y(2));
  g1(10,17)=y(8);
  g1(10,21)=y(5);
  g1(11,8)=1;
  g1(11,9)=(-1);
  g1(11,10)=(-1);
  g1(12,2)=(-1);
  g1(12,8)=1-(1-params(8));
  g1(13,26)=(-(y(28)*(-(params(13)*T460))/(1-params(13))*getPowerDeriv(T128,(-params(11)),1)));
  g1(13,27)=1;
  g1(13,28)=(-T130);
  g1(14,1)=(-(y(25)*y(6)*(1+params(11))*T255));
  g1(14,6)=(-(y(25)*T11*(1+params(11))));
  g1(14,25)=(-(y(6)*T11*(1+params(11))));
  g1(14,26)=(-(y(27)*params(1)*params(13)*T468));
  g1(14,27)=1-params(1)*params(13)*T139;
  g1(15,1)=(-(y(6)*T255));
  g1(15,6)=(-T11);
  g1(15,26)=(-(y(28)*params(1)*params(13)*T460));
  g1(15,28)=1-T124*params(1)*params(13);
  g1(16,22)=(-(y(24)*(-(params(12)*T430))/(1-params(12))*getPowerDeriv((1-params(12)*T155)/(1-params(12)),(-(params(10)+(1+params(10))*params(3))),1)));
  g1(16,23)=1;
  g1(16,24)=(-T165);
  g1(17,5)=(-((1+params(10))*getPowerDeriv(y(5),1+params(3),1)));
  g1(17,22)=(-(y(23)*params(1)*params(12)*getPowerDeriv(y(22),(1+params(10))*(1+params(3))/params(10),1)));
  g1(17,23)=1-T175;
  g1(18,1)=(-(y(5)*y(21)*T255));
  g1(18,5)=(-(T11*y(21)));
  g1(18,21)=(-(T11*y(5)));
  g1(18,22)=(-(y(24)*params(1)*params(12)*T430));
  g1(18,24)=1-T155*params(1)*params(12);
  g1(19,21)=y(26)-y(22);
  g1(19,22)=(-y(21));
  g1(19,26)=y(21);
  g1(20,26)=(-(y(29)*params(13)*T468+(1-params(13))*(-(params(13)*T460))/(1-params(13))*getPowerDeriv(T128,1+params(11),1)));
  g1(20,29)=1-params(13)*T139;
  g1(21,6)=(-(T202*1/params(20)*getPowerDeriv(y(6)/params(20),params(15),1)));
  g1(21,14)=1-T206*T201*T197*getPowerDeriv(y(14),params(16),1);
  g1(21,26)=(-(T206*T199*getPowerDeriv(y(26),params(14),1)));
  g1(22,10)=1;
  g1(23,6)=(-(params(18)*y(14)*y(11)/y(26)));
  g1(23,7)=1;
  g1(23,10)=(-(params(18)*(-y(15))));
  g1(23,11)=(-(params(18)*y(14)*y(6)/y(26)));
  g1(23,14)=(-(params(18)*y(11)*y(6)/y(26)));
  g1(23,15)=(-(params(18)*(-y(10))));
  g1(23,26)=(-(params(18)*T457));
  g1(24,6)=y(14)*y(11)/y(26)-y(11);
  g1(24,7)=(-1);
  g1(24,10)=y(15)-(y(17)+y(15)*(1-params(8)));
  g1(24,11)=y(14)*y(6)/y(26)-y(6);
  g1(24,14)=y(11)*y(6)/y(26);
  g1(24,15)=y(10)-(1-params(8))*y(10);
  g1(24,17)=(-y(10));
  g1(24,26)=T457;
  g1(25,1)=(-1);
  g1(25,2)=(-(1+y(3)));
  g1(25,3)=(-y(2));
  g1(25,6)=1;
  g1(26,14)=(-(1/y(26)));
  g1(26,19)=1;
  g1(26,26)=(-((-y(14))/(y(26)*y(26))));
  g1(27,15)=(-((y(15)*(1-params(8))-(y(17)+y(15)*(1-params(8))))/(y(15)*y(15))));
  g1(27,17)=(-(1/y(15)));
  g1(27,20)=1;
  g1(28,19)=1;
  g1(28,20)=(-1);
  g1(28,31)=1;
  g1(29,15)=(-T367);
  g1(29,16)=(-T401);
  g1(29,30)=1;
  g1(30,8)=(-y(15));
  g1(30,12)=1;
  g1(30,15)=(-y(8));
  g1(31,1)=(-1);
  g1(31,2)=(-y(16));
  g1(31,13)=1;
  g1(31,16)=(-y(2));
  g1(32,32)=1-params(19);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],32,1024);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],32,32768);
end
end
end
end
