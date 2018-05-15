function [residual, g1, g2, g3] = NK_KW16_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(40, 1);
T69 = exp(y(28))*params(6)*exp(y(17))/exp(y(5))+exp(y(27))*exp(y(25))*(1-params(3));
T78 = exp(y(26))*(exp(y(5))*exp(y(27)))^params(6);
T94 = exp(y(23))/exp(y(4));
T95 = T94-1;
T98 = 1-params(5)/2*T95^2;
T107 = exp(y(58))/exp(y(23));
T109 = params(5)*params(1)*exp(y(57))*(T107-1);
T110 = T107^2;
T115 = exp(y(25))*T109*T110/exp(y(60));
T145 = (1-params(7)*exp(y(29))^(params(8)-1))/(1-params(7));
T164 = exp(y(57))*params(1)*params(7)*exp(y(61))^params(8)*exp(y(62));
T173 = exp(y(57))*params(1)*params(7)*exp(y(61))^(params(8)-1)*exp(y(63));
T181 = exp(y(29))*exp(y(31))*params(8)/(params(8)-1)/exp(y(32));
T200 = exp(y(25))*exp(y(24));
T204 = exp(y(60))*params(13)*exp(y(59))/T200*exp(y(68));
T206 = params(1)*exp(y(57))*((exp(y(65))-exp(y(64)))*(1-params(13))+T204);
T224 = params(1)*exp(y(57))*((1-params(13))*(exp(y(66))-exp(y(64)))+params(13)*exp(y(71))/exp(y(55))*exp(y(69)));
T239 = params(1)*exp(y(57))*(exp(y(64))*(1-params(13))+params(13)*exp(y(67))/exp(y(45))*exp(y(70)));
T335 = exp(y(10))^params(16);
T339 = params(56)*exp(y(29))^params(9);
T343 = (y(16)/y(1))^params(10);
T344 = T339*T343;
T374 = getPowerDeriv(y(16)/y(1),params(10),1);
T377 = getPowerDeriv(T344,1-params(16),1);
T393 = (-(exp(y(28))*params(6)*exp(y(17))/exp(y(5))/exp(y(6))));
T394 = (-(exp(y(17))*exp(y(28))*(1-params(6))/exp(y(18))));
T437 = (-(exp(y(23))*exp(y(4))))/(exp(y(4))*exp(y(4)));
T463 = (-(exp(y(23))*exp(y(58))))/(exp(y(23))*exp(y(23)));
T496 = (-(exp(y(18))^(1-params(6))*exp(y(26))*exp(y(5))*exp(y(27))*getPowerDeriv(exp(y(5))*exp(y(27)),params(6),1)));
T504 = (-(params(1)*exp(y(57))*exp(y(68))*(-(exp(y(60))*params(13)*exp(y(59))*T200))/(T200*T200)));
T514 = (-(exp(y(27))*exp(y(25))*(1-params(3))/exp(y(6))));
T620 = (-(params(1)*exp(y(57))*params(13)*exp(y(67))/exp(y(45))*exp(y(70))));
T637 = (-(params(1)*exp(y(57))*params(13)*exp(y(71))/exp(y(55))*exp(y(69))));
lhs =exp(y(21));
rhs =(exp(y(20))-params(2)*exp(y(2)))^(-1)-params(2)*params(1)*(exp(y(56))-exp(y(20))*params(2))^(-1);
residual(1)= lhs-rhs;
lhs =exp(y(22));
rhs =exp(y(21))/exp(y(3));
residual(2)= lhs-rhs;
lhs =params(1)*exp(y(64))*exp(y(57));
rhs =1;
residual(3)= lhs-rhs;
lhs =exp(y(18))^params(4);
rhs =exp(y(21))*exp(y(19));
residual(4)= lhs-rhs;
lhs =exp(y(36));
rhs =T69/exp(y(6));
residual(5)= lhs-rhs;
lhs =exp(y(17));
rhs =T78*exp(y(18))^(1-params(6));
residual(6)= lhs-rhs;
lhs =exp(y(19));
rhs =exp(y(17))*exp(y(28))*(1-params(6))/exp(y(18));
residual(7)= lhs-rhs;
lhs =1/exp(y(25));
rhs =T98-exp(y(23))*params(5)*T95/exp(y(4))+T115;
residual(8)= lhs-rhs;
lhs =exp(y(24));
rhs =exp(y(5))*exp(y(27))*(1-params(3))+exp(y(23))*T98;
residual(9)= lhs-rhs;
lhs =exp(y(17));
rhs =exp(y(16))*exp(y(33));
residual(10)= lhs-rhs;
lhs =exp(y(33));
rhs =params(7)*exp(y(9))*exp(y(29))^params(8)+(1-params(7))*T145^((-params(8))/(1-params(8)));
residual(11)= lhs-rhs;
lhs =exp(y(31));
rhs =exp(y(28))*exp(y(16))+T164;
residual(12)= lhs-rhs;
lhs =exp(y(32));
rhs =exp(y(16))+T173;
residual(13)= lhs-rhs;
lhs =exp(y(30));
rhs =T181;
residual(14)= lhs-rhs;
lhs =exp(y(29))^(1-params(8));
rhs =params(7)+(1-params(7))*exp(y(30))^(1-params(8));
residual(15)= lhs-rhs;
lhs =exp(y(48));
rhs =T206;
residual(16)= lhs-rhs;
lhs =exp(y(49));
rhs =T224;
residual(17)= lhs-rhs;
lhs =exp(y(50));
rhs =T239;
residual(18)= lhs-rhs;
lhs =exp(y(48));
rhs =exp(y(49));
residual(19)= lhs-rhs;
lhs =exp(y(43));
rhs =exp(y(50))/(params(14)-exp(y(48)));
residual(20)= lhs-rhs;
lhs =exp(y(45));
rhs =params(13)*(exp(y(34))+(exp(y(38))-exp(y(34)))*exp(y(11)))*exp(y(12))+exp(y(12))*params(15);
residual(21)= lhs-rhs;
lhs =exp(y(45))+exp(y(47));
rhs =T200+exp(y(55));
residual(22)= lhs-rhs;
lhs =exp(y(44));
rhs =T200+exp(y(55));
residual(23)= lhs-rhs;
lhs =T200;
rhs =exp(y(45))*exp(y(43))*exp(y(46));
residual(24)= lhs-rhs;
lhs =exp(y(55));
rhs =exp(y(45))*exp(y(43))*(1-exp(y(46)));
residual(25)= lhs-rhs;
lhs =exp(y(39));
rhs =exp(y(65));
residual(26)= lhs-rhs;
lhs =exp(y(40));
rhs =exp(y(66));
residual(27)= lhs-rhs;
lhs =exp(y(41));
rhs =exp(y(65))-exp(y(64));
residual(28)= lhs-rhs;
lhs =exp(y(42));
rhs =exp(y(66))-exp(y(64));
residual(29)= lhs-rhs;
lhs =exp(y(38));
rhs =exp(y(36))*exp(y(13))+exp(y(37))*(1-exp(y(13)));
residual(30)= lhs-rhs;
lhs =exp(y(55));
rhs =exp(y(37))*exp(y(15))+exp(y(51))-exp(y(54));
residual(31)= lhs-rhs;
lhs =exp(y(51));
rhs =params(33)*exp(y(52));
residual(32)= lhs-rhs;
lhs =exp(y(54));
rhs =params(41);
residual(33)= lhs-rhs;
lhs =exp(y(53));
rhs =exp(y(51))/params(25);
residual(34)= lhs-rhs;
lhs =exp(y(16));
rhs =exp(y(23))+exp(y(20))+exp(y(51));
residual(35)= lhs-rhs;
lhs =exp(y(10));
rhs =exp(y(29))*exp(y(34));
residual(36)= lhs-rhs;
lhs =exp(y(35));
rhs =T335*T344^(1-params(16))*exp((-x(it_, 3)));
residual(37)= lhs-rhs;
lhs =y(26);
rhs =params(18)*y(7)-x(it_, 4);
residual(38)= lhs-rhs;
lhs =y(27);
rhs =params(17)*y(8)-x(it_, 1);
residual(39)= lhs-rhs;
lhs =y(52);
rhs =params(19)*y(14)+x(it_, 2);
residual(40)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(40, 76);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-((-(params(2)*exp(y(2))))*getPowerDeriv(exp(y(20))-params(2)*exp(y(2)),(-1),1)));
  g1(1,20)=(-(exp(y(20))*getPowerDeriv(exp(y(20))-params(2)*exp(y(2)),(-1),1)-params(2)*params(1)*(-(exp(y(20))*params(2)))*getPowerDeriv(exp(y(56))-exp(y(20))*params(2),(-1),1)));
  g1(1,56)=params(2)*params(1)*exp(y(56))*getPowerDeriv(exp(y(56))-exp(y(20))*params(2),(-1),1);
  g1(1,21)=exp(y(21));
  g1(2,3)=(-((-(exp(y(21))*exp(y(3))))/(exp(y(3))*exp(y(3)))));
  g1(2,21)=(-(exp(y(21))/exp(y(3))));
  g1(2,22)=exp(y(22));
  g1(3,57)=params(1)*exp(y(64))*exp(y(57));
  g1(3,64)=params(1)*exp(y(64))*exp(y(57));
  g1(4,18)=exp(y(18))*getPowerDeriv(exp(y(18)),params(4),1);
  g1(4,19)=(-(exp(y(21))*exp(y(19))));
  g1(4,21)=(-(exp(y(21))*exp(y(19))));
  g1(5,17)=T393;
  g1(5,5)=(-((-(exp(y(28))*params(6)*exp(y(17))*exp(y(5))))/(exp(y(5))*exp(y(5)))/exp(y(6))));
  g1(5,6)=(-((-(T69*exp(y(6))))/(exp(y(6))*exp(y(6)))));
  g1(5,25)=T514;
  g1(5,27)=T514;
  g1(5,28)=T393;
  g1(5,36)=exp(y(36));
  g1(6,17)=exp(y(17));
  g1(6,18)=(-(T78*exp(y(18))*getPowerDeriv(exp(y(18)),1-params(6),1)));
  g1(6,5)=T496;
  g1(6,26)=(-(T78*exp(y(18))^(1-params(6))));
  g1(6,27)=T496;
  g1(7,17)=T394;
  g1(7,18)=(-((-(exp(y(18))*exp(y(17))*exp(y(28))*(1-params(6))))/(exp(y(18))*exp(y(18)))));
  g1(7,19)=exp(y(19));
  g1(7,28)=T394;
  g1(8,57)=(-T115);
  g1(8,4)=(-((-(params(5)/2*T437*2*T95))-(exp(y(4))*exp(y(23))*params(5)*T437-exp(y(4))*exp(y(23))*params(5)*T95)/(exp(y(4))*exp(y(4)))));
  g1(8,23)=(-((-(params(5)/2*T94*2*T95))-(exp(y(23))*params(5)*T95+exp(y(23))*params(5)*T94)/exp(y(4))+exp(y(25))*(T110*params(5)*params(1)*exp(y(57))*T463+T109*T463*2*T107)/exp(y(60))));
  g1(8,58)=(-(exp(y(25))*(T110*params(5)*params(1)*exp(y(57))*T107+T109*T107*2*T107)/exp(y(60))));
  g1(8,25)=(-exp(y(25)))/(exp(y(25))*exp(y(25)))-T115;
  g1(8,60)=(-((-(exp(y(25))*T109*T110*exp(y(60))))/(exp(y(60))*exp(y(60)))));
  g1(9,4)=(-(exp(y(23))*(-(params(5)/2*T437*2*T95))));
  g1(9,23)=(-(exp(y(23))*T98+exp(y(23))*(-(params(5)/2*T94*2*T95))));
  g1(9,5)=(-(exp(y(5))*exp(y(27))*(1-params(3))));
  g1(9,24)=exp(y(24));
  g1(9,27)=(-(exp(y(5))*exp(y(27))*(1-params(3))));
  g1(10,16)=(-(exp(y(16))*exp(y(33))));
  g1(10,17)=exp(y(17));
  g1(10,33)=(-(exp(y(16))*exp(y(33))));
  g1(11,29)=(-(params(7)*exp(y(9))*exp(y(29))*getPowerDeriv(exp(y(29)),params(8),1)+(1-params(7))*(-(params(7)*exp(y(29))*getPowerDeriv(exp(y(29)),params(8)-1,1)))/(1-params(7))*getPowerDeriv(T145,(-params(8))/(1-params(8)),1)));
  g1(11,9)=(-(params(7)*exp(y(9))*exp(y(29))^params(8)));
  g1(11,33)=exp(y(33));
  g1(12,16)=(-(exp(y(28))*exp(y(16))));
  g1(12,57)=(-T164);
  g1(12,28)=(-(exp(y(28))*exp(y(16))));
  g1(12,61)=(-(exp(y(62))*exp(y(57))*params(1)*params(7)*exp(y(61))*getPowerDeriv(exp(y(61)),params(8),1)));
  g1(12,31)=exp(y(31));
  g1(12,62)=(-T164);
  g1(13,16)=(-exp(y(16)));
  g1(13,57)=(-T173);
  g1(13,61)=(-(exp(y(63))*exp(y(57))*params(1)*params(7)*exp(y(61))*getPowerDeriv(exp(y(61)),params(8)-1,1)));
  g1(13,32)=exp(y(32));
  g1(13,63)=(-T173);
  g1(14,29)=(-T181);
  g1(14,30)=exp(y(30));
  g1(14,31)=(-T181);
  g1(14,32)=(-(exp(y(29))*(-(exp(y(32))*exp(y(31))*params(8)/(params(8)-1)))/(exp(y(32))*exp(y(32)))));
  g1(15,29)=exp(y(29))*getPowerDeriv(exp(y(29)),1-params(8),1);
  g1(15,30)=(-((1-params(7))*exp(y(30))*getPowerDeriv(exp(y(30)),1-params(8),1)));
  g1(16,57)=(-T206);
  g1(16,24)=T504;
  g1(16,59)=(-(params(1)*exp(y(57))*T204));
  g1(16,25)=T504;
  g1(16,60)=(-(params(1)*exp(y(57))*T204));
  g1(16,64)=(-(params(1)*exp(y(57))*(1-params(13))*(-exp(y(64)))));
  g1(16,65)=(-(params(1)*exp(y(57))*exp(y(65))*(1-params(13))));
  g1(16,48)=exp(y(48));
  g1(16,68)=(-(params(1)*exp(y(57))*T204));
  g1(17,57)=(-T224);
  g1(17,64)=(-(params(1)*exp(y(57))*(1-params(13))*(-exp(y(64)))));
  g1(17,66)=(-(params(1)*exp(y(57))*(1-params(13))*exp(y(66))));
  g1(17,49)=exp(y(49));
  g1(17,69)=T637;
  g1(17,55)=(-(params(1)*exp(y(57))*exp(y(69))*(-(params(13)*exp(y(71))*exp(y(55))))/(exp(y(55))*exp(y(55)))));
  g1(17,71)=T637;
  g1(18,57)=(-T239);
  g1(18,64)=(-(params(1)*exp(y(57))*exp(y(64))*(1-params(13))));
  g1(18,45)=(-(params(1)*exp(y(57))*exp(y(70))*params(13)*(-(exp(y(67))*exp(y(45))))/(exp(y(45))*exp(y(45)))));
  g1(18,67)=T620;
  g1(18,50)=exp(y(50));
  g1(18,70)=T620;
  g1(19,48)=exp(y(48));
  g1(19,49)=(-exp(y(49)));
  g1(20,43)=exp(y(43));
  g1(20,48)=(-((-(exp(y(50))*(-exp(y(48)))))/((params(14)-exp(y(48)))*(params(14)-exp(y(48))))));
  g1(20,50)=(-(exp(y(50))/(params(14)-exp(y(48)))));
  g1(21,34)=(-(exp(y(12))*params(13)*(exp(y(34))+exp(y(11))*(-exp(y(34))))));
  g1(21,38)=(-(exp(y(12))*params(13)*exp(y(38))*exp(y(11))));
  g1(21,11)=(-(exp(y(12))*params(13)*(exp(y(38))-exp(y(34)))*exp(y(11))));
  g1(21,12)=(-(params(13)*(exp(y(34))+(exp(y(38))-exp(y(34)))*exp(y(11)))*exp(y(12))+exp(y(12))*params(15)));
  g1(21,45)=exp(y(45));
  g1(22,24)=(-T200);
  g1(22,25)=(-T200);
  g1(22,45)=exp(y(45));
  g1(22,47)=exp(y(47));
  g1(22,55)=(-exp(y(55)));
  g1(23,24)=(-T200);
  g1(23,25)=(-T200);
  g1(23,44)=exp(y(44));
  g1(23,55)=(-exp(y(55)));
  g1(24,24)=T200;
  g1(24,25)=T200;
  g1(24,43)=(-(exp(y(45))*exp(y(43))*exp(y(46))));
  g1(24,45)=(-(exp(y(45))*exp(y(43))*exp(y(46))));
  g1(24,46)=(-(exp(y(45))*exp(y(43))*exp(y(46))));
  g1(25,43)=(-(exp(y(45))*exp(y(43))*(1-exp(y(46)))));
  g1(25,45)=(-(exp(y(45))*exp(y(43))*(1-exp(y(46)))));
  g1(25,46)=(-(exp(y(45))*exp(y(43))*(-exp(y(46)))));
  g1(25,55)=exp(y(55));
  g1(26,65)=(-exp(y(65)));
  g1(26,39)=exp(y(39));
  g1(27,66)=(-exp(y(66)));
  g1(27,40)=exp(y(40));
  g1(28,64)=exp(y(64));
  g1(28,65)=(-exp(y(65)));
  g1(28,41)=exp(y(41));
  g1(29,64)=exp(y(64));
  g1(29,66)=(-exp(y(66)));
  g1(29,42)=exp(y(42));
  g1(30,36)=(-(exp(y(36))*exp(y(13))));
  g1(30,37)=(-(exp(y(37))*(1-exp(y(13)))));
  g1(30,38)=exp(y(38));
  g1(30,13)=(-(exp(y(36))*exp(y(13))+exp(y(37))*(-exp(y(13)))));
  g1(31,37)=(-(exp(y(37))*exp(y(15))));
  g1(31,51)=(-exp(y(51)));
  g1(31,54)=exp(y(54));
  g1(31,15)=(-(exp(y(37))*exp(y(15))));
  g1(31,55)=exp(y(55));
  g1(32,51)=exp(y(51));
  g1(32,52)=(-(params(33)*exp(y(52))));
  g1(33,54)=exp(y(54));
  g1(34,51)=(-(exp(y(51))/params(25)));
  g1(34,53)=exp(y(53));
  g1(35,16)=exp(y(16));
  g1(35,20)=(-exp(y(20)));
  g1(35,23)=(-exp(y(23)));
  g1(35,51)=(-exp(y(51)));
  g1(36,29)=(-(exp(y(29))*exp(y(34))));
  g1(36,34)=(-(exp(y(29))*exp(y(34))));
  g1(36,10)=exp(y(10));
  g1(37,1)=(-(exp((-x(it_, 3)))*T335*T339*(-y(16))/(y(1)*y(1))*T374*T377));
  g1(37,16)=(-(exp((-x(it_, 3)))*T335*T377*T339*T374*1/y(1)));
  g1(37,29)=(-(exp((-x(it_, 3)))*T335*T377*T343*params(56)*exp(y(29))*getPowerDeriv(exp(y(29)),params(9),1)));
  g1(37,10)=(-(exp((-x(it_, 3)))*T344^(1-params(16))*exp(y(10))*getPowerDeriv(exp(y(10)),params(16),1)));
  g1(37,35)=exp(y(35));
  g1(37,74)=(-(T335*T344^(1-params(16))*(-exp((-x(it_, 3))))));
  g1(38,7)=(-params(18));
  g1(38,26)=1;
  g1(38,75)=1;
  g1(39,8)=(-params(17));
  g1(39,27)=1;
  g1(39,72)=1;
  g1(40,14)=(-params(19));
  g1(40,52)=1;
  g1(40,73)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],40,5776);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],40,438976);
end
end
