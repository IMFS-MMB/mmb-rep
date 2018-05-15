function [residual, g1, g2, g3] = US_FV15_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(36, 1);
T14 = y(21)^(-1);
T35 = y(57)^(-1);
T54 = y(58)^(-1);
T55 = T35*params(2)*y(59)/y(24)*T54;
T66 = params(4)/2;
T70 = (1-params(5))*y(64)+y(61)*y(63)-(params(3)*(y(63)-1)+T66*(y(63)-1)^2);
T74 = params(6)/2;
T83 = 1-T74*(y(21)*y(28)/y(5)-params(26))^2;
T86 = y(28)*params(6)*(y(21)*y(28)/y(5)-params(26))/y(5);
T94 = params(6)*T35*y(59)*params(2)*y(64)/y(24);
T98 = y(57)*y(62)/y(28)-params(26);
T99 = T94*T98;
T100 = (y(57)*y(62)/y(28))^2;
T111 = (params(7)-1)/params(7)*y(34)^(1-params(7));
T123 = y(26)^params(11)/y(60);
T125 = params(2)*params(14)*T123^(1-params(7));
T128 = y(57)*y(66)/y(34);
T129 = T128^(params(7)-1);
T144 = y(35)^((-params(7))*(1+params(10)));
T146 = y(32)^(1+params(10));
T149 = params(2)*params(14)*T123^((-params(7))*(1+params(10)));
T151 = T128^(params(7)*(1+params(10)));
T165 = y(26)^params(12)/y(60);
T183 = y(36)*params(2)*params(13)*T165^(1-params(8))/y(67);
T197 = params(15)/(1-params(15));
T199 = y(33)*T197/y(27);
T204 = 1/(1-params(15));
T208 = T204^(1-params(15))*(1/params(15))^params(15);
T210 = T208*y(33)^(1-params(15));
T215 = y(4)^params(11);
T216 = T215/y(26);
T218 = params(14)*T216^(1-params(7));
T221 = T14*y(6)/y(33);
T222 = T221^(1-params(7));
T230 = y(4)^params(12)/y(26);
T243 = (y(3)/params(16))^params(18);
T249 = (y(26)/params(17))^(params(19)*y(52));
T255 = y(21)*y(39)/y(7)/exp(params(27));
T259 = T255^(params(20)*y(53));
T262 = (T249*T259)^(1-params(18));
T269 = exp(x(it_, 5))^(params(32)*y(51));
T278 = params(3)*(y(29)-1)+T66*(y(29)-1)^2;
T287 = y(32)^(1-params(15));
T307 = T215*T221/y(26);
T389 = (1-params(33)^2)^0.5*params(40);
T403 = (1-params(34)^2)^0.5*params(41);
T417 = (1-params(35)^2)^0.5*params(42);
T431 = (1-params(36)^2)^0.5*params(43);
T445 = (1-params(37)^2)^0.5*params(44);
T459 = (1-params(38)^2)^0.5*params(45);
T473 = (1-params(39)^2)^0.5*params(46);
T487 = (y(29)*y(8))^params(15);
T511 = getPowerDeriv(y(20)-params(1)*y(2)*T14,(-1),1);
T516 = getPowerDeriv(y(56)*y(57)-y(20)*params(1),(-1),1);
T523 = getPowerDeriv(y(21),(-1),1);
T528 = 2*(y(21)*y(28)/y(5)-params(26));
T543 = getPowerDeriv(T221,1-params(7),1);
T547 = y(39)/y(7)/exp(params(27));
T548 = getPowerDeriv(T255,params(20)*y(53),1);
T551 = getPowerDeriv(T249*T259,1-params(18),1);
T567 = getPowerDeriv(T307,(-params(7)),1);
T582 = getPowerDeriv(y(57),(-1),1);
T602 = getPowerDeriv(T128,params(7)-1,1);
T607 = getPowerDeriv(T128,params(7)*(1+params(10)),1);
T688 = getPowerDeriv(y(4),params(12),1)/y(26);
T705 = getPowerDeriv(y(26),params(11),1)/y(60);
T719 = getPowerDeriv(y(26),params(12),1)/y(60);
T740 = (-(y(4)^params(12)))/(y(26)*y(26));
T768 = (-(y(26)^params(11)))/(y(60)*y(60));
T780 = (-(y(26)^params(12)))/(y(60)*y(60));
T1001 = y(21)*(-y(39))/(y(7)*y(7))/exp(params(27));
T1013 = y(21)*1/y(7)/exp(params(27));
lhs =y(19)*(y(20)-params(1)*y(2)*T14)^(-1)-params(1)*params(2)*y(55)*(y(56)*y(57)-y(20)*params(1))^(-1);
rhs =y(24);
residual(1)= lhs-rhs;
lhs =y(24);
rhs =params(2)*y(59)*T35/y(60)*y(25);
residual(2)= lhs-rhs;
lhs =y(27);
rhs =params(3)+params(4)*(y(29)-1);
residual(3)= lhs-rhs;
lhs =y(30);
rhs =T55*T70;
residual(4)= lhs-rhs;
lhs =1;
rhs =y(30)*(T83-y(21)*T86)+T99*T100;
residual(5)= lhs-rhs;
lhs =y(31);
rhs =y(24)*T111*y(33)^params(7)*y(32)+T125*T129*y(65);
residual(6)= lhs-rhs;
lhs =y(31);
rhs =y(19)*params(9)*y(45)*T144*T146+y(65)*T149*T151;
residual(7)= lhs-rhs;
lhs =y(37);
rhs =y(24)*y(40)*y(39)+params(2)*params(13)*T165^(-params(8))*y(68);
residual(8)= lhs-rhs;
lhs =y(38);
rhs =y(39)*y(24)*y(36)+T183*y(69);
residual(9)= lhs-rhs;
lhs =y(37)*params(8);
rhs =y(38)*(params(8)-1);
residual(10)= lhs-rhs;
lhs =y(29)*y(8)/y(32);
rhs =y(21)*T199*y(22);
residual(11)= lhs-rhs;
lhs =y(40);
rhs =T210*y(27)^params(15);
residual(12)= lhs-rhs;
lhs =1;
rhs =T218*T222+(1-params(14))*y(35)^(1-params(7));
residual(13)= lhs-rhs;
lhs =1;
rhs =params(13)*T230^(1-params(8))+(1-params(13))*y(36)^(1-params(8));
residual(14)= lhs-rhs;
lhs =y(25)/params(16);
rhs =T243*T262*T269;
residual(15)= lhs-rhs;
lhs =y(39);
rhs =y(20)+y(28)+T14*y(22)^(-1)*T278*y(8);
residual(16)= lhs-rhs;
lhs =y(39);
rhs =(T287*T14*y(23)*T487-params(21))/y(42);
residual(17)= lhs-rhs;
lhs =y(44);
rhs =y(32)*y(43);
residual(18)= lhs-rhs;
lhs =y(42);
rhs =params(13)*T230^(-params(8))*y(9)+(1-params(13))*y(36)^(-params(8));
residual(19)= lhs-rhs;
lhs =y(43);
rhs =params(14)*T307^(-params(7))*y(10)+(1-params(14))*y(35)^(-params(7));
residual(20)= lhs-rhs;
residual(21) = y(22)*y(21)*y(41)-(1-params(5))*y(8)-y(28)*T83*y(21)*y(22);
lhs =y(46);
rhs =y(39)-y(32)*y(33)*T204;
residual(22)= lhs-rhs;
lhs =y(35);
rhs =y(34)/y(33);
residual(23)= lhs-rhs;
lhs =log(y(19));
rhs =params(22)*log(y(1))+params(28)*y(47)*x(it_, 1);
residual(24)= lhs-rhs;
lhs =log(y(45));
rhs =params(23)*log(y(11))+params(29)*y(48)*x(it_, 2);
residual(25)= lhs-rhs;
lhs =log(y(22));
rhs =params(24)+params(30)*y(49)*x(it_, 3);
residual(26)= lhs-rhs;
lhs =log(y(23));
rhs =params(25)+params(31)*y(50)*x(it_, 4);
residual(27)= lhs-rhs;
lhs =y(21);
rhs =y(23)^T204*y(22)^T197;
residual(28)= lhs-rhs;
lhs =log(y(47));
rhs =params(33)*log(y(12))+T389*x(it_, 6);
residual(29)= lhs-rhs;
lhs =log(y(48));
rhs =params(34)*log(y(13))+T403*x(it_, 7);
residual(30)= lhs-rhs;
lhs =log(y(49));
rhs =params(35)*log(y(14))+T417*x(it_, 8);
residual(31)= lhs-rhs;
lhs =log(y(50));
rhs =params(36)*log(y(15))+T431*x(it_, 9);
residual(32)= lhs-rhs;
lhs =log(y(51));
rhs =params(37)*log(y(16))+T445*x(it_, 10);
residual(33)= lhs-rhs;
lhs =log(y(52));
rhs =params(38)*log(y(17))+T459*x(it_, 11);
residual(34)= lhs-rhs;
lhs =log(y(53));
rhs =params(39)*log(y(18))+T473*x(it_, 12);
residual(35)= lhs-rhs;
lhs =y(54);
rhs =T255;
residual(36)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(36, 81);

  %
  % Jacobian matrix
  %

  g1(1,19)=(y(20)-params(1)*y(2)*T14)^(-1);
  g1(1,55)=(-(params(1)*params(2)*(y(56)*y(57)-y(20)*params(1))^(-1)));
  g1(1,2)=y(19)*(-(params(1)*T14))*T511;
  g1(1,20)=y(19)*T511-params(1)*params(2)*y(55)*(-params(1))*T516;
  g1(1,56)=(-(params(1)*params(2)*y(55)*y(57)*T516));
  g1(1,21)=y(19)*T511*(-(params(1)*y(2)*T523));
  g1(1,57)=(-(params(1)*params(2)*y(55)*y(56)*T516));
  g1(1,24)=(-1);
  g1(2,57)=(-(y(25)*params(2)*y(59)*T582/y(60)));
  g1(2,24)=1;
  g1(2,59)=(-(y(25)*params(2)*T35/y(60)));
  g1(2,25)=(-(params(2)*y(59)*T35/y(60)));
  g1(2,60)=(-(y(25)*(-(params(2)*y(59)*T35))/(y(60)*y(60))));
  g1(3,27)=1;
  g1(3,29)=(-params(4));
  g1(4,57)=(-(T70*T54*params(2)*y(59)/y(24)*T582));
  g1(4,58)=(-(T70*T35*params(2)*y(59)/y(24)*getPowerDeriv(y(58),(-1),1)));
  g1(4,24)=(-(T70*T54*T35*(-(params(2)*y(59)))/(y(24)*y(24))));
  g1(4,59)=(-(T70*T54*T35*params(2)/y(24)));
  g1(4,61)=(-(T55*y(63)));
  g1(4,63)=(-(T55*(y(61)-(params(3)+T66*2*(y(63)-1)))));
  g1(4,30)=1;
  g1(4,64)=(-(T55*(1-params(5))));
  g1(5,21)=(-(y(30)*((-(T74*y(28)/y(5)*T528))-(T86+y(21)*y(28)*params(6)*y(28)/y(5)/y(5)))));
  g1(5,57)=(-(T100*(T98*params(6)*y(59)*params(2)*y(64)/y(24)*T582+T94*y(62)/y(28))+T99*y(62)/y(28)*2*y(57)*y(62)/y(28)));
  g1(5,24)=(-(T100*T98*params(6)*T35*(-(y(59)*params(2)*y(64)))/(y(24)*y(24))));
  g1(5,59)=(-(T100*T98*params(6)*T35*params(2)*y(64)/y(24)));
  g1(5,5)=(-(y(30)*((-(T74*T528*y(21)*(-y(28))/(y(5)*y(5))))-y(21)*(y(5)*y(28)*params(6)*y(21)*(-y(28))/(y(5)*y(5))-y(28)*params(6)*(y(21)*y(28)/y(5)-params(26)))/(y(5)*y(5)))));
  g1(5,28)=(-(y(30)*((-(T74*T528*y(21)*1/y(5)))-y(21)*(params(6)*(y(21)*y(28)/y(5)-params(26))+y(28)*params(6)*y(21)*1/y(5))/y(5))+T100*T94*y(57)*(-y(62))/(y(28)*y(28))+T99*2*y(57)*y(62)/y(28)*y(57)*(-y(62))/(y(28)*y(28))));
  g1(5,62)=(-(T100*T94*y(57)*1/y(28)+T99*2*y(57)*y(62)/y(28)*y(57)*1/y(28)));
  g1(5,30)=(-(T83-y(21)*T86));
  g1(5,64)=(-(T100*T98*T35*params(2)*y(59)/y(24)*params(6)));
  g1(6,57)=(-(y(65)*T125*y(66)/y(34)*T602));
  g1(6,24)=(-(y(32)*T111*y(33)^params(7)));
  g1(6,26)=(-(y(65)*T129*params(2)*params(14)*T705*getPowerDeriv(T123,1-params(7),1)));
  g1(6,60)=(-(y(65)*T129*params(2)*params(14)*getPowerDeriv(T123,1-params(7),1)*T768));
  g1(6,31)=1;
  g1(6,65)=(-(T125*T129));
  g1(6,32)=(-(y(24)*T111*y(33)^params(7)));
  g1(6,33)=(-(y(32)*y(24)*T111*getPowerDeriv(y(33),params(7),1)));
  g1(6,34)=(-(y(32)*y(33)^params(7)*y(24)*(params(7)-1)/params(7)*getPowerDeriv(y(34),1-params(7),1)+y(65)*T125*T602*y(57)*(-y(66))/(y(34)*y(34))));
  g1(6,66)=(-(y(65)*T125*T602*y(57)*1/y(34)));
  g1(7,19)=(-(T146*T144*params(9)*y(45)));
  g1(7,57)=(-(y(65)*T149*y(66)/y(34)*T607));
  g1(7,26)=(-(y(65)*T151*params(2)*params(14)*T705*getPowerDeriv(T123,(-params(7))*(1+params(10)),1)));
  g1(7,60)=(-(y(65)*T151*params(2)*params(14)*getPowerDeriv(T123,(-params(7))*(1+params(10)),1)*T768));
  g1(7,31)=1;
  g1(7,65)=(-(T149*T151));
  g1(7,32)=(-(y(19)*params(9)*y(45)*T144*getPowerDeriv(y(32),1+params(10),1)));
  g1(7,34)=(-(y(65)*T149*T607*y(57)*(-y(66))/(y(34)*y(34))));
  g1(7,66)=(-(y(65)*T149*T607*y(57)*1/y(34)));
  g1(7,35)=(-(T146*y(19)*params(9)*y(45)*getPowerDeriv(y(35),(-params(7))*(1+params(10)),1)));
  g1(7,45)=(-(T146*y(19)*params(9)*T144));
  g1(8,24)=(-(y(40)*y(39)));
  g1(8,26)=(-(y(68)*params(2)*params(13)*T719*getPowerDeriv(T165,(-params(8)),1)));
  g1(8,60)=(-(y(68)*params(2)*params(13)*getPowerDeriv(T165,(-params(8)),1)*T780));
  g1(8,37)=1;
  g1(8,68)=(-(params(2)*params(13)*T165^(-params(8))));
  g1(8,39)=(-(y(24)*y(40)));
  g1(8,40)=(-(y(24)*y(39)));
  g1(9,24)=(-(y(39)*y(36)));
  g1(9,26)=(-(y(69)*y(36)*params(2)*params(13)*T719*getPowerDeriv(T165,1-params(8),1)/y(67)));
  g1(9,60)=(-(y(69)*y(36)*params(2)*params(13)*getPowerDeriv(T165,1-params(8),1)*T780/y(67)));
  g1(9,36)=(-(y(24)*y(39)+y(69)*params(2)*params(13)*T165^(1-params(8))/y(67)));
  g1(9,67)=(-(y(69)*(-(y(36)*params(2)*params(13)*T165^(1-params(8))))/(y(67)*y(67))));
  g1(9,38)=1;
  g1(9,69)=(-T183);
  g1(9,39)=(-(y(24)*y(36)));
  g1(10,37)=params(8);
  g1(10,38)=(-(params(8)-1));
  g1(11,21)=(-(T199*y(22)));
  g1(11,22)=(-(y(21)*T199));
  g1(11,27)=(-(y(22)*y(21)*(-(y(33)*T197))/(y(27)*y(27))));
  g1(11,29)=y(8)/y(32);
  g1(11,32)=(-(y(29)*y(8)))/(y(32)*y(32));
  g1(11,33)=(-(y(22)*y(21)*T197/y(27)));
  g1(11,8)=y(29)/y(32);
  g1(12,27)=(-(T210*getPowerDeriv(y(27),params(15),1)));
  g1(12,33)=(-(y(27)^params(15)*T208*getPowerDeriv(y(33),1-params(15),1)));
  g1(12,40)=1;
  g1(13,21)=(-(T218*y(6)/y(33)*T523*T543));
  g1(13,4)=(-(T222*params(14)*getPowerDeriv(y(4),params(11),1)/y(26)*getPowerDeriv(T216,1-params(7),1)));
  g1(13,26)=(-(T222*params(14)*getPowerDeriv(T216,1-params(7),1)*(-T215)/(y(26)*y(26))));
  g1(13,6)=(-(T218*T543*T14*1/y(33)));
  g1(13,33)=(-(T218*T543*T14*(-y(6))/(y(33)*y(33))));
  g1(13,35)=(-((1-params(14))*getPowerDeriv(y(35),1-params(7),1)));
  g1(14,4)=(-(params(13)*T688*getPowerDeriv(T230,1-params(8),1)));
  g1(14,26)=(-(params(13)*getPowerDeriv(T230,1-params(8),1)*T740));
  g1(14,36)=(-((1-params(13))*getPowerDeriv(y(36),1-params(8),1)));
  g1(15,21)=(-(T269*T243*T249*T547*T548*T551));
  g1(15,3)=(-(T269*T262*1/params(16)*getPowerDeriv(y(3)/params(16),params(18),1)));
  g1(15,25)=1/params(16);
  g1(15,26)=(-(T269*T243*T551*T259*1/params(17)*getPowerDeriv(y(26)/params(17),params(19)*y(52),1)));
  g1(15,7)=(-(T269*T243*T551*T249*T548*T1001));
  g1(15,39)=(-(T269*T243*T551*T249*T548*T1013));
  g1(15,51)=(-(T243*T262*T269*params(32)*log(exp(x(it_, 5)))));
  g1(15,52)=(-(T269*T243*T551*T259*T249*params(19)*log(y(26)/params(17))));
  g1(15,53)=(-(T269*T243*T551*T249*T259*params(20)*log(T255)));
  g1(15,74)=(-(T243*T262*exp(x(it_, 5))*getPowerDeriv(exp(x(it_, 5)),params(32)*y(51),1)));
  g1(16,20)=(-1);
  g1(16,21)=(-(y(8)*T278*y(22)^(-1)*T523));
  g1(16,22)=(-(y(8)*T278*T14*getPowerDeriv(y(22),(-1),1)));
  g1(16,28)=(-1);
  g1(16,29)=(-(y(8)*T14*y(22)^(-1)*(params(3)+T66*2*(y(29)-1))));
  g1(16,39)=1;
  g1(16,8)=(-(T14*y(22)^(-1)*T278));
  g1(17,21)=(-(T287*T487*y(23)*T523/y(42)));
  g1(17,23)=(-(T287*T14*T487/y(42)));
  g1(17,29)=(-(T287*T14*y(23)*y(8)*getPowerDeriv(y(29)*y(8),params(15),1)/y(42)));
  g1(17,32)=(-(T14*y(23)*T487*getPowerDeriv(y(32),1-params(15),1)/y(42)));
  g1(17,39)=1;
  g1(17,8)=(-(T287*T14*y(23)*y(29)*getPowerDeriv(y(29)*y(8),params(15),1)/y(42)));
  g1(17,42)=(-((-(T287*T14*y(23)*T487-params(21)))/(y(42)*y(42))));
  g1(18,32)=(-y(43));
  g1(18,43)=(-y(32));
  g1(18,44)=1;
  g1(19,4)=(-(y(9)*params(13)*T688*getPowerDeriv(T230,(-params(8)),1)));
  g1(19,26)=(-(y(9)*params(13)*getPowerDeriv(T230,(-params(8)),1)*T740));
  g1(19,36)=(-((1-params(13))*getPowerDeriv(y(36),(-params(8)),1)));
  g1(19,9)=(-(params(13)*T230^(-params(8))));
  g1(19,42)=1;
  g1(20,21)=(-(y(10)*params(14)*T215*y(6)/y(33)*T523/y(26)*T567));
  g1(20,4)=(-(y(10)*params(14)*T567*T221*getPowerDeriv(y(4),params(11),1)/y(26)));
  g1(20,26)=(-(y(10)*params(14)*T567*(-(T215*T221))/(y(26)*y(26))));
  g1(20,6)=(-(y(10)*params(14)*T567*T215*T14*1/y(33)/y(26)));
  g1(20,33)=(-(y(10)*params(14)*T567*T215*T14*(-y(6))/(y(33)*y(33))/y(26)));
  g1(20,35)=(-((1-params(14))*getPowerDeriv(y(35),(-params(7)),1)));
  g1(20,10)=(-(params(14)*T307^(-params(7))));
  g1(20,43)=1;
  g1(21,21)=y(41)*y(22)-y(28)*(y(21)*y(22)*(-(T74*y(28)/y(5)*T528))+T83*y(22));
  g1(21,22)=y(21)*y(41)-y(28)*y(21)*T83;
  g1(21,5)=(-(y(28)*y(21)*y(22)*(-(T74*T528*y(21)*(-y(28))/(y(5)*y(5))))));
  g1(21,28)=(-(T83*y(21)*y(22)+y(28)*y(21)*y(22)*(-(T74*T528*y(21)*1/y(5)))));
  g1(21,8)=(-(1-params(5)));
  g1(21,41)=y(21)*y(22);
  g1(22,32)=y(33)*T204;
  g1(22,33)=y(32)*T204;
  g1(22,39)=(-1);
  g1(22,46)=1;
  g1(23,33)=(-((-y(34))/(y(33)*y(33))));
  g1(23,34)=(-(1/y(33)));
  g1(23,35)=1;
  g1(24,1)=(-(params(22)*1/y(1)));
  g1(24,19)=1/y(19);
  g1(24,47)=(-(params(28)*x(it_, 1)));
  g1(24,70)=(-(params(28)*y(47)));
  g1(25,11)=(-(params(23)*1/y(11)));
  g1(25,45)=1/y(45);
  g1(25,48)=(-(params(29)*x(it_, 2)));
  g1(25,71)=(-(params(29)*y(48)));
  g1(26,22)=1/y(22);
  g1(26,49)=(-(params(30)*x(it_, 3)));
  g1(26,72)=(-(params(30)*y(49)));
  g1(27,23)=1/y(23);
  g1(27,50)=(-(params(31)*x(it_, 4)));
  g1(27,73)=(-(params(31)*y(50)));
  g1(28,21)=1;
  g1(28,22)=(-(y(23)^T204*getPowerDeriv(y(22),T197,1)));
  g1(28,23)=(-(y(22)^T197*getPowerDeriv(y(23),T204,1)));
  g1(29,12)=(-(params(33)*1/y(12)));
  g1(29,47)=1/y(47);
  g1(29,75)=(-T389);
  g1(30,13)=(-(params(34)*1/y(13)));
  g1(30,48)=1/y(48);
  g1(30,76)=(-T403);
  g1(31,14)=(-(params(35)*1/y(14)));
  g1(31,49)=1/y(49);
  g1(31,77)=(-T417);
  g1(32,15)=(-(params(36)*1/y(15)));
  g1(32,50)=1/y(50);
  g1(32,78)=(-T431);
  g1(33,16)=(-(params(37)*1/y(16)));
  g1(33,51)=1/y(51);
  g1(33,79)=(-T445);
  g1(34,17)=(-(params(38)*1/y(17)));
  g1(34,52)=1/y(52);
  g1(34,80)=(-T459);
  g1(35,18)=(-(params(39)*1/y(18)));
  g1(35,53)=1/y(53);
  g1(35,81)=(-T473);
  g1(36,21)=(-T547);
  g1(36,7)=(-T1001);
  g1(36,39)=(-T1013);
  g1(36,54)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],36,6561);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],36,531441);
end
end
