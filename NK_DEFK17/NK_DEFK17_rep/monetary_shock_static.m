function [residual, g1, g2, g3] = monetary_shock_static(y, x, params)
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

residual = zeros( 40, 1);

%
% Model equations
%

T11 = y(9)^(-params(4));
T25 = 1+params(6)*(y(23)-y(24))/(y(24)-y(23)*params(7));
T33 = (y(25)+y(23)*(1-params(10)))/y(23);
T40 = (y(24)-y(23)*params(7))*(y(25)+y(23)*(1-params(10)));
T42 = 1+params(6)*(y(23)-y(24))*(y(25)+y(23)*(1-params(10))*y(40))/T40;
T82 = y(16)^params(8);
T86 = y(13)^(1-params(8));
T96 = (y(13)/y(16))^(1-params(8));
T103 = (y(16)/y(13))^params(8);
T124 = y(34)^(1/params(13));
T128 = (1-params(15)*T124)/(1-params(15));
T130 = T128^(-params(13));
T139 = y(34)^((1+params(13))/params(13));
T155 = y(30)^(1/params(12));
T165 = ((1-params(14)*T155)/(1-params(14)))^(-(params(12)+(1+params(12))*params(5)));
T175 = params(3)*params(14)*y(30)^((1+params(12))*(1+params(5))/params(12));
T197 = params(27)^(1-params(18));
T199 = T197*y(22)^params(18);
T201 = y(34)^params(16);
T202 = T199*T201;
T206 = (y(14)/params(22))^params(17);
T210 = T202*T206*exp(y(2));
lhs =T11;
rhs =T11*params(3)*y(27)*T25;
residual(1)= lhs-rhs;
lhs =T11;
rhs =T11*params(3)*T33*T42;
residual(2)= lhs-rhs;
lhs =(y(24)-y(23)*params(7))*y(10);
rhs =params(6)*((y(25)+y(23)*(1-params(10))*y(40))*y(17)+y(22)*y(19)*y(14)/y(34)-y(15));
residual(3)= lhs-rhs;
lhs =y(24);
rhs =1+y(11)+y(12)*y(10)/params(24);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =params(11)*(y(10)/params(24)-1)^2/2;
residual(5)= lhs-rhs;
lhs =y(12);
rhs =params(11)*(y(10)/params(24)-1);
residual(6)= lhs-rhs;
lhs =y(14)*y(37);
rhs =y(1)*T82*T86-params(9);
residual(7)= lhs-rhs;
lhs =y(26);
rhs =y(1)*params(8)*y(33)*T96;
residual(8)= lhs-rhs;
lhs =y(29);
rhs =y(1)*(1-params(8))*y(33)*T103;
residual(9)= lhs-rhs;
lhs =y(25)*y(16);
rhs =y(14)-y(13)*y(29)+y(10)*(y(24)-(1+y(11)));
residual(10)= lhs-rhs;
lhs =y(16);
rhs =y(17)+y(18);
residual(11)= lhs-rhs;
lhs =y(16);
rhs =y(10)+(1-params(10))*y(16);
residual(12)= lhs-rhs;
lhs =y(35);
rhs =y(36)*T130;
residual(13)= lhs-rhs;
lhs =y(35);
rhs =y(33)*y(14)*T11*(1+params(13))+y(35)*params(3)*params(15)*T139;
residual(14)= lhs-rhs;
lhs =y(36);
rhs =T11*y(14)+y(36)*T124*params(3)*params(15);
residual(15)= lhs-rhs;
lhs =y(31);
rhs =y(32)*T165;
residual(16)= lhs-rhs;
lhs =y(31);
rhs =(1+params(12))*y(13)^(1+params(5))+y(31)*T175;
residual(17)= lhs-rhs;
lhs =y(32);
rhs =y(13)*T11*y(29)+y(32)*T155*params(3)*params(14);
residual(18)= lhs-rhs;
lhs =y(34)*y(29);
rhs =y(29)*y(30);
residual(19)= lhs-rhs;
lhs =y(37);
rhs =T139*y(37)*params(15)+(1-params(15))*T128^(1+params(13));
residual(20)= lhs-rhs;
lhs =y(22);
rhs =T210;
residual(21)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(2)+x(3);
residual(22)= lhs-rhs;
lhs =y(18);
rhs =params(19)*(y(40)-params(35));
residual(23)= lhs-rhs;
lhs =y(19)*y(14);
rhs =params(33)*(y(14));
residual(24)= lhs-rhs;
lhs =y(22)*y(19)*y(14)/y(34)+y(23)*y(18);
rhs =y(19)*y(14)+y(15)+(y(25)+y(23)*(1-params(10)))*y(18);
residual(25)= lhs-rhs;
lhs =y(14);
rhs =y(9)+y(10)*(1+y(11));
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(22)/y(34);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =T33;
residual(28)= lhs-rhs;
lhs =y(39);
rhs =y(28)-y(27);
residual(29)= lhs-rhs;
lhs =y(38);
rhs =params(6)*(y(23)-y(24))/(y(24)-y(23)*params(7));
residual(30)= lhs-rhs;
lhs =y(20);
rhs =y(23)*y(16);
residual(31)= lhs-rhs;
lhs =y(21);
rhs =y(9)+y(24)*y(10);
residual(32)= lhs-rhs;
lhs =y(40);
rhs =params(35)*(1-params(21))+y(40)*params(21)+x(1);
residual(33)= lhs-rhs;
lhs =y(1);
rhs =(1-params(1))*params(34)+y(1)*params(1)+x(2);
residual(34)= lhs-rhs;
lhs =y(3);
rhs =100*log(y(14)/(y(14)));
residual(35)= lhs-rhs;
lhs =y(4);
rhs =100*(y(34)^4-1);
residual(36)= lhs-rhs;
lhs =y(5);
rhs =100*(y(22)^4-(y(22))^4);
residual(37)= lhs-rhs;
lhs =y(6);
rhs =100*log(y(9)/(y(9)));
residual(38)= lhs-rhs;
lhs =y(7);
rhs =100*log(y(10)/(y(10)));
residual(39)= lhs-rhs;
lhs =y(8);
rhs =100*log(y(1)/(y(1)));
residual(40)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(40, 40);

  %
  % Jacobian matrix
  %

T320 = getPowerDeriv(y(9),(-params(4)),1);
T368 = getPowerDeriv(y(13)/y(16),1-params(8),1);
T375 = getPowerDeriv(y(16)/y(13),params(8),1);
T453 = (params(6)*(y(24)-y(23)*params(7))-params(6)*(y(23)-y(24))*(-params(7)))/((y(24)-y(23)*params(7))*(y(24)-y(23)*params(7)));
T484 = ((y(24)-y(23)*params(7))*(-params(6))-params(6)*(y(23)-y(24)))/((y(24)-y(23)*params(7))*(y(24)-y(23)*params(7)));
T514 = getPowerDeriv(y(30),1/params(12),1);
T544 = getPowerDeriv(y(34),1/params(13),1);
T552 = getPowerDeriv(y(34),(1+params(13))/params(13),1);
  g1(1,9)=T320-T25*y(27)*params(3)*T320;
  g1(1,23)=(-(T11*params(3)*y(27)*T453));
  g1(1,24)=(-(T11*params(3)*y(27)*T484));
  g1(1,27)=(-(T11*params(3)*T25));
  g1(2,9)=T320-T42*T33*params(3)*T320;
  g1(2,23)=(-(T42*T11*params(3)*(y(23)*(1-params(10))-(y(25)+y(23)*(1-params(10))))/(y(23)*y(23))+T11*params(3)*T33*(T40*(params(6)*(y(25)+y(23)*(1-params(10))*y(40))+params(6)*(y(23)-y(24))*(1-params(10))*y(40))-params(6)*(y(23)-y(24))*(y(25)+y(23)*(1-params(10))*y(40))*((y(25)+y(23)*(1-params(10)))*(-params(7))+(y(24)-y(23)*params(7))*(1-params(10))))/(T40*T40)));
  g1(2,24)=(-(T11*params(3)*T33*(T40*(y(25)+y(23)*(1-params(10))*y(40))*(-params(6))-(y(25)+y(23)*(1-params(10)))*params(6)*(y(23)-y(24))*(y(25)+y(23)*(1-params(10))*y(40)))/(T40*T40)));
  g1(2,25)=(-(T42*T11*params(3)*1/y(23)+T11*params(3)*T33*(params(6)*(y(23)-y(24))*T40-(y(24)-y(23)*params(7))*params(6)*(y(23)-y(24))*(y(25)+y(23)*(1-params(10))*y(40)))/(T40*T40)));
  g1(2,40)=(-(T11*params(3)*T33*params(6)*(y(23)-y(24))*y(23)*(1-params(10))/T40));
  g1(3,10)=y(24)-y(23)*params(7);
  g1(3,14)=(-(params(6)*y(22)*y(19)/y(34)));
  g1(3,15)=params(6);
  g1(3,17)=(-(params(6)*(y(25)+y(23)*(1-params(10))*y(40))));
  g1(3,19)=(-(params(6)*y(22)*y(14)/y(34)));
  g1(3,22)=(-(params(6)*y(19)*y(14)/y(34)));
  g1(3,23)=y(10)*(-params(7))-params(6)*(1-params(10))*y(40)*y(17);
  g1(3,24)=y(10);
  g1(3,25)=(-(params(6)*y(17)));
  g1(3,34)=(-(params(6)*(-(y(22)*y(19)*y(14)))/(y(34)*y(34))));
  g1(3,40)=(-(params(6)*y(23)*(1-params(10))*y(17)));
  g1(4,10)=(-(y(12)*1/params(24)));
  g1(4,11)=(-1);
  g1(4,12)=(-(y(10)/params(24)));
  g1(4,24)=1;
  g1(5,10)=(-(params(11)*1/params(24)*2*(y(10)/params(24)-1)/2));
  g1(5,11)=1;
  g1(6,10)=(-(params(11)*1/params(24)));
  g1(6,12)=1;
  g1(7,1)=(-(T82*T86));
  g1(7,13)=(-(y(1)*T82*getPowerDeriv(y(13),1-params(8),1)));
  g1(7,14)=y(37);
  g1(7,16)=(-(T86*y(1)*getPowerDeriv(y(16),params(8),1)));
  g1(7,37)=y(14);
  g1(8,1)=(-(params(8)*y(33)*T96));
  g1(8,13)=(-(y(1)*params(8)*y(33)*1/y(16)*T368));
  g1(8,16)=(-(y(1)*params(8)*y(33)*T368*(-y(13))/(y(16)*y(16))));
  g1(8,26)=1;
  g1(8,33)=(-(T96*y(1)*params(8)));
  g1(9,1)=(-((1-params(8))*y(33)*T103));
  g1(9,13)=(-(y(1)*(1-params(8))*y(33)*(-y(16))/(y(13)*y(13))*T375));
  g1(9,16)=(-(y(1)*(1-params(8))*y(33)*T375*1/y(13)));
  g1(9,29)=1;
  g1(9,33)=(-(T103*y(1)*(1-params(8))));
  g1(10,10)=(-(y(24)-(1+y(11))));
  g1(10,11)=y(10);
  g1(10,13)=y(29);
  g1(10,14)=(-1);
  g1(10,16)=y(25);
  g1(10,24)=(-y(10));
  g1(10,25)=y(16);
  g1(10,29)=y(13);
  g1(11,16)=1;
  g1(11,17)=(-1);
  g1(11,18)=(-1);
  g1(12,10)=(-1);
  g1(12,16)=1-(1-params(10));
  g1(13,34)=(-(y(36)*(-(params(15)*T544))/(1-params(15))*getPowerDeriv(T128,(-params(13)),1)));
  g1(13,35)=1;
  g1(13,36)=(-T130);
  g1(14,9)=(-(y(33)*y(14)*(1+params(13))*T320));
  g1(14,14)=(-(y(33)*T11*(1+params(13))));
  g1(14,33)=(-(y(14)*T11*(1+params(13))));
  g1(14,34)=(-(y(35)*params(3)*params(15)*T552));
  g1(14,35)=1-params(3)*params(15)*T139;
  g1(15,9)=(-(y(14)*T320));
  g1(15,14)=(-T11);
  g1(15,34)=(-(y(36)*params(3)*params(15)*T544));
  g1(15,36)=1-T124*params(3)*params(15);
  g1(16,30)=(-(y(32)*(-(params(14)*T514))/(1-params(14))*getPowerDeriv((1-params(14)*T155)/(1-params(14)),(-(params(12)+(1+params(12))*params(5))),1)));
  g1(16,31)=1;
  g1(16,32)=(-T165);
  g1(17,13)=(-((1+params(12))*getPowerDeriv(y(13),1+params(5),1)));
  g1(17,30)=(-(y(31)*params(3)*params(14)*getPowerDeriv(y(30),(1+params(12))*(1+params(5))/params(12),1)));
  g1(17,31)=1-T175;
  g1(18,9)=(-(y(13)*y(29)*T320));
  g1(18,13)=(-(T11*y(29)));
  g1(18,29)=(-(T11*y(13)));
  g1(18,30)=(-(y(32)*params(3)*params(14)*T514));
  g1(18,32)=1-T155*params(3)*params(14);
  g1(19,29)=y(34)-y(30);
  g1(19,30)=(-y(29));
  g1(19,34)=y(29);
  g1(20,34)=(-(y(37)*params(15)*T552+(1-params(15))*(-(params(15)*T544))/(1-params(15))*getPowerDeriv(T128,1+params(13),1)));
  g1(20,37)=1-params(15)*T139;
  g1(21,2)=(-T210);
  g1(21,14)=(-(exp(y(2))*T202*1/params(22)*getPowerDeriv(y(14)/params(22),params(17),1)));
  g1(21,22)=1-exp(y(2))*T206*T201*T197*getPowerDeriv(y(22),params(18),1);
  g1(21,34)=(-(exp(y(2))*T206*T199*getPowerDeriv(y(34),params(16),1)));
  g1(22,2)=1-params(2);
  g1(23,18)=1;
  g1(23,40)=(-params(19));
  g1(24,14)=y(19)-params(33);
  g1(24,19)=y(14);
  g1(25,14)=y(22)*y(19)/y(34)-y(19);
  g1(25,15)=(-1);
  g1(25,18)=y(23)-(y(25)+y(23)*(1-params(10)));
  g1(25,19)=y(22)*y(14)/y(34)-y(14);
  g1(25,22)=y(19)*y(14)/y(34);
  g1(25,23)=y(18)-(1-params(10))*y(18);
  g1(25,25)=(-y(18));
  g1(25,34)=(-(y(22)*y(19)*y(14)))/(y(34)*y(34));
  g1(26,9)=(-1);
  g1(26,10)=(-(1+y(11)));
  g1(26,11)=(-y(10));
  g1(26,14)=1;
  g1(27,22)=(-(1/y(34)));
  g1(27,27)=1;
  g1(27,34)=(-((-y(22))/(y(34)*y(34))));
  g1(28,23)=(-((y(23)*(1-params(10))-(y(25)+y(23)*(1-params(10))))/(y(23)*y(23))));
  g1(28,25)=(-(1/y(23)));
  g1(28,28)=1;
  g1(29,27)=1;
  g1(29,28)=(-1);
  g1(29,39)=1;
  g1(30,23)=(-T453);
  g1(30,24)=(-T484);
  g1(30,38)=1;
  g1(31,16)=(-y(23));
  g1(31,20)=1;
  g1(31,23)=(-y(16));
  g1(32,9)=(-1);
  g1(32,10)=(-y(24));
  g1(32,21)=1;
  g1(32,24)=(-y(10));
  g1(33,40)=1-params(21);
  g1(34,1)=1-params(1);
  g1(35,3)=1;
  g1(35,14)=(-(100*((y(14))-y(14))/((y(14))*(y(14)))/(y(14)/(y(14)))));
  g1(36,4)=1;
  g1(36,34)=(-(100*4*y(34)^3));
  g1(37,5)=1;
  g1(37,22)=(-(100*(4*y(22)^3-4*(y(22))^3)));
  g1(38,6)=1;
  g1(38,9)=(-(100*((y(9))-y(9))/((y(9))*(y(9)))/(y(9)/(y(9)))));
  g1(39,7)=1;
  g1(39,10)=(-(100*((y(10))-y(10))/((y(10))*(y(10)))/(y(10)/(y(10)))));
  g1(40,1)=(-(100*((y(1))-y(1))/((y(1))*(y(1)))/(y(1)/(y(1)))));
  g1(40,8)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],40,1600);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],40,64000);
end
end
end
end
