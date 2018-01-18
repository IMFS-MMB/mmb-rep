function [residual, g1, g2, g3] = US_FV10_rep_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(29, 1);
T14 = y(14)^(-1);
T35 = y(43)^(-1);
T54 = y(44)^(-1);
T55 = T35*params(2)*y(45)/y(17)*T54;
T66 = params(4)/2;
T70 = (1-params(5))*y(50)+y(47)*y(49)-(params(3)*(y(49)-1)+T66*(y(49)-1)^2);
T74 = params(6)/2;
T83 = 1-T74*(y(14)*y(21)/y(5)-params(26))^2;
T86 = y(21)*params(6)*(y(14)*y(21)/y(5)-params(26))/y(5);
T94 = params(6)*T35*y(45)*params(2)*y(50)/y(17);
T98 = y(43)*y(48)/y(21)-params(26);
T99 = T94*T98;
T100 = (y(43)*y(48)/y(21))^2;
T111 = (params(7)-1)/params(7)*y(27)^(1-params(7));
T123 = y(19)^params(11)/y(46);
T125 = params(2)*params(14)*T123^(1-params(7));
T128 = y(43)*y(52)/y(27);
T129 = T128^(params(7)-1);
T144 = y(28)^((-params(7))*(1+params(10)));
T146 = y(25)^(1+params(10));
T149 = params(2)*params(14)*T123^((-params(7))*(1+params(10)));
T151 = T128^(params(7)*(1+params(10)));
T165 = y(19)^params(12)/y(46);
T183 = y(29)*params(2)*params(13)*T165^(1-params(8))/y(53);
T197 = params(15)/(1-params(15));
T199 = y(26)*T197/y(20);
T204 = 1/(1-params(15));
T208 = T204^(1-params(15))*(1/params(15))^params(15);
T210 = T208*y(26)^(1-params(15));
T215 = y(4)^params(11);
T216 = T215/y(19);
T218 = params(14)*T216^(1-params(7));
T221 = T14*y(6)/y(26);
T222 = T221^(1-params(7));
T230 = y(4)^params(12)/y(19);
T243 = (y(3)/params(16))^params(18);
T247 = (y(19)/params(17))^params(19);
T253 = y(14)*y(32)/y(7)/exp(params(27));
T258 = (T247*T253^params(20))^(1-params(18));
T263 = exp(x(it_, 5))^params(32);
T272 = params(3)*(y(22)-1)+T66*(y(22)-1)^2;
T281 = y(25)^(1-params(15));
T301 = T215*T221/y(19);
T374 = (y(22)*y(8))^params(15);
T398 = getPowerDeriv(y(13)-params(1)*y(2)*T14,(-1),1);
T403 = getPowerDeriv(y(42)*y(43)-y(13)*params(1),(-1),1);
T410 = getPowerDeriv(y(14),(-1),1);
T415 = 2*(y(14)*y(21)/y(5)-params(26));
T430 = getPowerDeriv(T221,1-params(7),1);
T434 = y(32)/y(7)/exp(params(27));
T438 = getPowerDeriv(T247*T253^params(20),1-params(18),1);
T454 = getPowerDeriv(T301,(-params(7)),1);
T469 = getPowerDeriv(y(43),(-1),1);
T489 = getPowerDeriv(T128,params(7)-1,1);
T494 = getPowerDeriv(T128,params(7)*(1+params(10)),1);
T575 = getPowerDeriv(y(4),params(12),1)/y(19);
T592 = getPowerDeriv(y(19),params(11),1)/y(46);
T606 = getPowerDeriv(y(19),params(12),1)/y(46);
T627 = (-(y(4)^params(12)))/(y(19)*y(19));
T655 = (-(y(19)^params(11)))/(y(46)*y(46));
T667 = (-(y(19)^params(12)))/(y(46)*y(46));
T888 = y(14)*(-y(32))/(y(7)*y(7))/exp(params(27));
T900 = y(14)*1/y(7)/exp(params(27));
lhs =y(12)*(y(13)-params(1)*y(2)*T14)^(-1)-params(1)*params(2)*y(41)*(y(42)*y(43)-y(13)*params(1))^(-1);
rhs =y(17);
residual(1)= lhs-rhs;
lhs =y(17);
rhs =params(2)*y(45)*T35/y(46)*y(18);
residual(2)= lhs-rhs;
lhs =y(20);
rhs =params(3)+params(4)*(y(22)-1);
residual(3)= lhs-rhs;
lhs =y(23);
rhs =T55*T70;
residual(4)= lhs-rhs;
lhs =1;
rhs =y(23)*(T83-y(14)*T86)+T99*T100;
residual(5)= lhs-rhs;
lhs =y(24);
rhs =y(17)*T111*y(26)^params(7)*y(25)+T125*T129*y(51);
residual(6)= lhs-rhs;
lhs =y(24);
rhs =y(12)*params(9)*y(38)*T144*T146+y(51)*T149*T151;
residual(7)= lhs-rhs;
lhs =y(30);
rhs =y(17)*y(33)*y(32)+params(2)*params(13)*T165^(-params(8))*y(54);
residual(8)= lhs-rhs;
lhs =y(31);
rhs =y(32)*y(17)*y(29)+T183*y(55);
residual(9)= lhs-rhs;
lhs =y(30)*params(8);
rhs =y(31)*(params(8)-1);
residual(10)= lhs-rhs;
lhs =y(22)*y(8)/y(25);
rhs =y(14)*T199*y(15);
residual(11)= lhs-rhs;
lhs =y(33);
rhs =T210*y(20)^params(15);
residual(12)= lhs-rhs;
lhs =1;
rhs =T218*T222+(1-params(14))*y(28)^(1-params(7));
residual(13)= lhs-rhs;
lhs =1;
rhs =params(13)*T230^(1-params(8))+(1-params(13))*y(29)^(1-params(8));
residual(14)= lhs-rhs;
lhs =y(18)/params(16);
rhs =T243*T258*T263;
residual(15)= lhs-rhs;
lhs =y(32);
rhs =y(13)+y(21)+T14*y(15)^(-1)*T272*y(8);
residual(16)= lhs-rhs;
lhs =y(32);
rhs =(T281*T14*y(16)*T374-params(21))/y(35);
residual(17)= lhs-rhs;
lhs =y(37);
rhs =y(25)*y(36);
residual(18)= lhs-rhs;
lhs =y(35);
rhs =params(13)*T230^(-params(8))*y(9)+(1-params(13))*y(29)^(-params(8));
residual(19)= lhs-rhs;
lhs =y(36);
rhs =params(14)*T301^(-params(7))*y(10)+(1-params(14))*y(28)^(-params(7));
residual(20)= lhs-rhs;
residual(21) = y(15)*y(14)*y(34)-(1-params(5))*y(8)-y(21)*T83*y(14)*y(15);
lhs =y(39);
rhs =y(32)-y(25)*y(26)*T204;
residual(22)= lhs-rhs;
lhs =y(28);
rhs =y(27)/y(26);
residual(23)= lhs-rhs;
lhs =log(y(12));
rhs =params(22)*log(y(1))+params(28)*x(it_, 1);
residual(24)= lhs-rhs;
lhs =log(y(38));
rhs =params(23)*log(y(11))+params(29)*x(it_, 2);
residual(25)= lhs-rhs;
lhs =log(y(15));
rhs =params(24)+params(30)*x(it_, 3);
residual(26)= lhs-rhs;
lhs =log(y(16));
rhs =params(25)+params(31)*x(it_, 4);
residual(27)= lhs-rhs;
lhs =y(14);
rhs =y(16)^T204*y(15)^T197;
residual(28)= lhs-rhs;
lhs =y(40);
rhs =T253;
residual(29)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(29, 60);

  %
  % Jacobian matrix
  %

  g1(1,12)=(y(13)-params(1)*y(2)*T14)^(-1);
  g1(1,41)=(-(params(1)*params(2)*(y(42)*y(43)-y(13)*params(1))^(-1)));
  g1(1,2)=y(12)*(-(params(1)*T14))*T398;
  g1(1,13)=y(12)*T398-params(1)*params(2)*y(41)*(-params(1))*T403;
  g1(1,42)=(-(params(1)*params(2)*y(41)*y(43)*T403));
  g1(1,14)=y(12)*T398*(-(params(1)*y(2)*T410));
  g1(1,43)=(-(params(1)*params(2)*y(41)*y(42)*T403));
  g1(1,17)=(-1);
  g1(2,43)=(-(y(18)*params(2)*y(45)*T469/y(46)));
  g1(2,17)=1;
  g1(2,45)=(-(y(18)*params(2)*T35/y(46)));
  g1(2,18)=(-(params(2)*y(45)*T35/y(46)));
  g1(2,46)=(-(y(18)*(-(params(2)*y(45)*T35))/(y(46)*y(46))));
  g1(3,20)=1;
  g1(3,22)=(-params(4));
  g1(4,43)=(-(T70*T54*params(2)*y(45)/y(17)*T469));
  g1(4,44)=(-(T70*T35*params(2)*y(45)/y(17)*getPowerDeriv(y(44),(-1),1)));
  g1(4,17)=(-(T70*T54*T35*(-(params(2)*y(45)))/(y(17)*y(17))));
  g1(4,45)=(-(T70*T54*T35*params(2)/y(17)));
  g1(4,47)=(-(T55*y(49)));
  g1(4,49)=(-(T55*(y(47)-(params(3)+T66*2*(y(49)-1)))));
  g1(4,23)=1;
  g1(4,50)=(-(T55*(1-params(5))));
  g1(5,14)=(-(y(23)*((-(T74*y(21)/y(5)*T415))-(T86+y(14)*y(21)*params(6)*y(21)/y(5)/y(5)))));
  g1(5,43)=(-(T100*(T98*params(6)*y(45)*params(2)*y(50)/y(17)*T469+T94*y(48)/y(21))+T99*y(48)/y(21)*2*y(43)*y(48)/y(21)));
  g1(5,17)=(-(T100*T98*params(6)*T35*(-(y(45)*params(2)*y(50)))/(y(17)*y(17))));
  g1(5,45)=(-(T100*T98*params(6)*T35*params(2)*y(50)/y(17)));
  g1(5,5)=(-(y(23)*((-(T74*T415*y(14)*(-y(21))/(y(5)*y(5))))-y(14)*(y(5)*y(21)*params(6)*y(14)*(-y(21))/(y(5)*y(5))-y(21)*params(6)*(y(14)*y(21)/y(5)-params(26)))/(y(5)*y(5)))));
  g1(5,21)=(-(y(23)*((-(T74*T415*y(14)*1/y(5)))-y(14)*(params(6)*(y(14)*y(21)/y(5)-params(26))+y(21)*params(6)*y(14)*1/y(5))/y(5))+T100*T94*y(43)*(-y(48))/(y(21)*y(21))+T99*2*y(43)*y(48)/y(21)*y(43)*(-y(48))/(y(21)*y(21))));
  g1(5,48)=(-(T100*T94*y(43)*1/y(21)+T99*2*y(43)*y(48)/y(21)*y(43)*1/y(21)));
  g1(5,23)=(-(T83-y(14)*T86));
  g1(5,50)=(-(T100*T98*T35*params(2)*y(45)/y(17)*params(6)));
  g1(6,43)=(-(y(51)*T125*y(52)/y(27)*T489));
  g1(6,17)=(-(y(25)*T111*y(26)^params(7)));
  g1(6,19)=(-(y(51)*T129*params(2)*params(14)*T592*getPowerDeriv(T123,1-params(7),1)));
  g1(6,46)=(-(y(51)*T129*params(2)*params(14)*getPowerDeriv(T123,1-params(7),1)*T655));
  g1(6,24)=1;
  g1(6,51)=(-(T125*T129));
  g1(6,25)=(-(y(17)*T111*y(26)^params(7)));
  g1(6,26)=(-(y(25)*y(17)*T111*getPowerDeriv(y(26),params(7),1)));
  g1(6,27)=(-(y(25)*y(26)^params(7)*y(17)*(params(7)-1)/params(7)*getPowerDeriv(y(27),1-params(7),1)+y(51)*T125*T489*y(43)*(-y(52))/(y(27)*y(27))));
  g1(6,52)=(-(y(51)*T125*T489*y(43)*1/y(27)));
  g1(7,12)=(-(T146*T144*params(9)*y(38)));
  g1(7,43)=(-(y(51)*T149*y(52)/y(27)*T494));
  g1(7,19)=(-(y(51)*T151*params(2)*params(14)*T592*getPowerDeriv(T123,(-params(7))*(1+params(10)),1)));
  g1(7,46)=(-(y(51)*T151*params(2)*params(14)*getPowerDeriv(T123,(-params(7))*(1+params(10)),1)*T655));
  g1(7,24)=1;
  g1(7,51)=(-(T149*T151));
  g1(7,25)=(-(y(12)*params(9)*y(38)*T144*getPowerDeriv(y(25),1+params(10),1)));
  g1(7,27)=(-(y(51)*T149*T494*y(43)*(-y(52))/(y(27)*y(27))));
  g1(7,52)=(-(y(51)*T149*T494*y(43)*1/y(27)));
  g1(7,28)=(-(T146*y(12)*params(9)*y(38)*getPowerDeriv(y(28),(-params(7))*(1+params(10)),1)));
  g1(7,38)=(-(T146*y(12)*params(9)*T144));
  g1(8,17)=(-(y(33)*y(32)));
  g1(8,19)=(-(y(54)*params(2)*params(13)*T606*getPowerDeriv(T165,(-params(8)),1)));
  g1(8,46)=(-(y(54)*params(2)*params(13)*getPowerDeriv(T165,(-params(8)),1)*T667));
  g1(8,30)=1;
  g1(8,54)=(-(params(2)*params(13)*T165^(-params(8))));
  g1(8,32)=(-(y(17)*y(33)));
  g1(8,33)=(-(y(17)*y(32)));
  g1(9,17)=(-(y(32)*y(29)));
  g1(9,19)=(-(y(55)*y(29)*params(2)*params(13)*T606*getPowerDeriv(T165,1-params(8),1)/y(53)));
  g1(9,46)=(-(y(55)*y(29)*params(2)*params(13)*getPowerDeriv(T165,1-params(8),1)*T667/y(53)));
  g1(9,29)=(-(y(17)*y(32)+y(55)*params(2)*params(13)*T165^(1-params(8))/y(53)));
  g1(9,53)=(-(y(55)*(-(y(29)*params(2)*params(13)*T165^(1-params(8))))/(y(53)*y(53))));
  g1(9,31)=1;
  g1(9,55)=(-T183);
  g1(9,32)=(-(y(17)*y(29)));
  g1(10,30)=params(8);
  g1(10,31)=(-(params(8)-1));
  g1(11,14)=(-(T199*y(15)));
  g1(11,15)=(-(y(14)*T199));
  g1(11,20)=(-(y(15)*y(14)*(-(y(26)*T197))/(y(20)*y(20))));
  g1(11,22)=y(8)/y(25);
  g1(11,25)=(-(y(22)*y(8)))/(y(25)*y(25));
  g1(11,26)=(-(y(15)*y(14)*T197/y(20)));
  g1(11,8)=y(22)/y(25);
  g1(12,20)=(-(T210*getPowerDeriv(y(20),params(15),1)));
  g1(12,26)=(-(y(20)^params(15)*T208*getPowerDeriv(y(26),1-params(15),1)));
  g1(12,33)=1;
  g1(13,14)=(-(T218*y(6)/y(26)*T410*T430));
  g1(13,4)=(-(T222*params(14)*getPowerDeriv(y(4),params(11),1)/y(19)*getPowerDeriv(T216,1-params(7),1)));
  g1(13,19)=(-(T222*params(14)*getPowerDeriv(T216,1-params(7),1)*(-T215)/(y(19)*y(19))));
  g1(13,6)=(-(T218*T430*T14*1/y(26)));
  g1(13,26)=(-(T218*T430*T14*(-y(6))/(y(26)*y(26))));
  g1(13,28)=(-((1-params(14))*getPowerDeriv(y(28),1-params(7),1)));
  g1(14,4)=(-(params(13)*T575*getPowerDeriv(T230,1-params(8),1)));
  g1(14,19)=(-(params(13)*getPowerDeriv(T230,1-params(8),1)*T627));
  g1(14,29)=(-((1-params(13))*getPowerDeriv(y(29),1-params(8),1)));
  g1(15,14)=(-(T263*T243*T247*T434*getPowerDeriv(T253,params(20),1)*T438));
  g1(15,3)=(-(T263*T258*1/params(16)*getPowerDeriv(y(3)/params(16),params(18),1)));
  g1(15,18)=1/params(16);
  g1(15,19)=(-(T263*T243*T438*T253^params(20)*1/params(17)*getPowerDeriv(y(19)/params(17),params(19),1)));
  g1(15,7)=(-(T263*T243*T438*T247*getPowerDeriv(T253,params(20),1)*T888));
  g1(15,32)=(-(T263*T243*T438*T247*getPowerDeriv(T253,params(20),1)*T900));
  g1(15,60)=(-(T243*T258*exp(x(it_, 5))*getPowerDeriv(exp(x(it_, 5)),params(32),1)));
  g1(16,13)=(-1);
  g1(16,14)=(-(y(8)*T272*y(15)^(-1)*T410));
  g1(16,15)=(-(y(8)*T272*T14*getPowerDeriv(y(15),(-1),1)));
  g1(16,21)=(-1);
  g1(16,22)=(-(y(8)*T14*y(15)^(-1)*(params(3)+T66*2*(y(22)-1))));
  g1(16,32)=1;
  g1(16,8)=(-(T14*y(15)^(-1)*T272));
  g1(17,14)=(-(T281*T374*y(16)*T410/y(35)));
  g1(17,16)=(-(T281*T14*T374/y(35)));
  g1(17,22)=(-(T281*T14*y(16)*y(8)*getPowerDeriv(y(22)*y(8),params(15),1)/y(35)));
  g1(17,25)=(-(T14*y(16)*T374*getPowerDeriv(y(25),1-params(15),1)/y(35)));
  g1(17,32)=1;
  g1(17,8)=(-(T281*T14*y(16)*y(22)*getPowerDeriv(y(22)*y(8),params(15),1)/y(35)));
  g1(17,35)=(-((-(T281*T14*y(16)*T374-params(21)))/(y(35)*y(35))));
  g1(18,25)=(-y(36));
  g1(18,36)=(-y(25));
  g1(18,37)=1;
  g1(19,4)=(-(y(9)*params(13)*T575*getPowerDeriv(T230,(-params(8)),1)));
  g1(19,19)=(-(y(9)*params(13)*getPowerDeriv(T230,(-params(8)),1)*T627));
  g1(19,29)=(-((1-params(13))*getPowerDeriv(y(29),(-params(8)),1)));
  g1(19,9)=(-(params(13)*T230^(-params(8))));
  g1(19,35)=1;
  g1(20,14)=(-(y(10)*params(14)*T215*y(6)/y(26)*T410/y(19)*T454));
  g1(20,4)=(-(y(10)*params(14)*T454*T221*getPowerDeriv(y(4),params(11),1)/y(19)));
  g1(20,19)=(-(y(10)*params(14)*T454*(-(T215*T221))/(y(19)*y(19))));
  g1(20,6)=(-(y(10)*params(14)*T454*T215*T14*1/y(26)/y(19)));
  g1(20,26)=(-(y(10)*params(14)*T454*T215*T14*(-y(6))/(y(26)*y(26))/y(19)));
  g1(20,28)=(-((1-params(14))*getPowerDeriv(y(28),(-params(7)),1)));
  g1(20,10)=(-(params(14)*T301^(-params(7))));
  g1(20,36)=1;
  g1(21,14)=y(34)*y(15)-y(21)*(y(14)*y(15)*(-(T74*y(21)/y(5)*T415))+T83*y(15));
  g1(21,15)=y(14)*y(34)-y(21)*y(14)*T83;
  g1(21,5)=(-(y(21)*y(14)*y(15)*(-(T74*T415*y(14)*(-y(21))/(y(5)*y(5))))));
  g1(21,21)=(-(T83*y(14)*y(15)+y(21)*y(14)*y(15)*(-(T74*T415*y(14)*1/y(5)))));
  g1(21,8)=(-(1-params(5)));
  g1(21,34)=y(14)*y(15);
  g1(22,25)=y(26)*T204;
  g1(22,26)=y(25)*T204;
  g1(22,32)=(-1);
  g1(22,39)=1;
  g1(23,26)=(-((-y(27))/(y(26)*y(26))));
  g1(23,27)=(-(1/y(26)));
  g1(23,28)=1;
  g1(24,1)=(-(params(22)*1/y(1)));
  g1(24,12)=1/y(12);
  g1(24,56)=(-params(28));
  g1(25,11)=(-(params(23)*1/y(11)));
  g1(25,38)=1/y(38);
  g1(25,57)=(-params(29));
  g1(26,15)=1/y(15);
  g1(26,58)=(-params(30));
  g1(27,16)=1/y(16);
  g1(27,59)=(-params(31));
  g1(28,14)=1;
  g1(28,15)=(-(y(16)^T204*getPowerDeriv(y(15),T197,1)));
  g1(28,16)=(-(y(15)^T197*getPowerDeriv(y(16),T204,1)));
  g1(29,14)=(-T434);
  g1(29,7)=(-T888);
  g1(29,32)=(-T900);
  g1(29,40)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],29,3600);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],29,216000);
end
end
