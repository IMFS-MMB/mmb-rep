function [residual, g1, g2, g3] = chen_replication_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(61, 1);
T80 = (1-params(11))/params(11);
T171 = 1/(1-params(2)*params(25));
T178 = params(26)/(1-params(25));
T179 = params(25)^2;
T196 = 1/(1-params(3)*params(25));
T202 = params(27)/(1-params(25));
T255 = (1+params(8))/params(8);
T256 = (1+params(28))*T255;
T284 = 1/params(8);
T305 = (1-params(12))/(1+params(28)*T255);
T324 = params(44)/params(40)/(params(20)-params(7));
T328 = params(2)^(-1);
T334 = T324*params(3)^(-1);
T346 = params(44)/params(40)*params(20)*(1-params(7)*exp((-params(6)))*params(49)^(-1))/(params(20)-params(7))/(params(20)-params(7));
T385 = params(20)*params(44)/params(40)/(params(20)-params(7))^2;
lhs =y(23);
rhs =params(1)*y(24)+(1-params(1))*y(27);
residual(1)= lhs-rhs;
lhs =y(29);
rhs =y(27)-y(24)+y(30);
residual(2)= lhs-rhs;
lhs =y(31);
rhs =params(1)*y(29)+(1-params(1))*y(30);
residual(3)= lhs-rhs;
lhs =y(32);
rhs =(1-params(2)*params(11))*(y(23)+y(31)+y(49)+y(46))+params(2)*params(11)*((1+params(9))/params(9)*y(94)+y(86));
residual(4)= lhs-rhs;
lhs =y(33);
rhs =(1-params(11)*params(3))*(y(23)+y(46)+y(31)+y(50))+params(11)*params(3)*((1+params(9))/params(9)*y(94)+y(87));
residual(5)= lhs-rhs;
lhs =y(34);
rhs =(1-params(2)*params(11))*(y(31)+y(49))+params(2)*params(11)*(y(94)*(-1)/params(9)+y(88));
residual(6)= lhs-rhs;
lhs =y(35);
rhs =(1-params(11)*params(3))*(y(31)+y(50))+params(11)*params(3)*(y(94)*(-1)/params(9)+y(89));
residual(7)= lhs-rhs;
lhs =y(40);
rhs =T80*(y(32)*params(13)+y(33)*(1-params(13))-y(34)*params(13)-y(35)*(1-params(13)));
residual(8)= lhs-rhs;
lhs =y(29);
rhs =(-y(44))+y(41)+y(3);
residual(9)= lhs-rhs;
lhs =y(28);
rhs =(1-params(5))*exp((-params(6)))*(y(3)-y(44))+(1-(1-params(5))*exp((-params(6))))*(y(43)+y(42));
residual(10)= lhs-rhs;
lhs =y(24);
rhs =y(41)*params(18)/params(38);
residual(11)= lhs-rhs;
lhs =y(51);
rhs =exp((-params(6)))*params(4)*(params(38)*y(84)+(1-params(5))*y(101))-y(96)+params(24)*((1+params(10))/(1+params(24)*params(10))*y(99)-y(49))+(1-params(24))*(1/(1+params(24)*params(10))*y(100)-y(50));
residual(12)= lhs-rhs;
lhs =0;
rhs =y(43)+y(51)-exp(2*params(6))*params(17)*(y(44)+y(42)-y(5))+params(17)*params(4)*exp(2*params(6))*(y(96)+y(95)-y(42));
residual(13)= lhs-rhs;
lhs =y(49);
rhs =T171*(y(47)-params(2)*params(25)*y(97)-T178*((1+params(2)*T179)*y(52)-params(2)*params(25)*y(102)-params(25)*y(11)));
residual(14)= lhs-rhs;
lhs =y(50);
rhs =T196*(y(48)-params(3)*params(25)*y(98)-T202*((1+params(3)*T179)*y(53)-params(3)*params(25)*y(103)-params(25)*y(12)));
residual(15)= lhs-rhs;
lhs =y(49);
rhs =y(99)+y(25)-y(96)-y(94);
residual(16)= lhs-rhs;
lhs =y(49)+y(54);
rhs =y(99)+params(20)/(params(20)-params(7))*y(26)-y(96)-y(94)-params(7)/(params(20)-params(7))*y(85);
residual(17)= lhs-rhs;
lhs =y(50);
rhs =y(100)+params(20)/(params(20)-params(7))*y(26)-y(96)-y(94)-params(7)/(params(20)-params(7))*y(85);
residual(18)= lhs-rhs;
lhs =y(36);
rhs =(1-params(2)*params(12))*(y(47)+y(45)+y(30)*(1+params(28))+y(27)*T256)+params(2)*params(12)*(T256*(y(94)+y(96))+y(90));
residual(19)= lhs-rhs;
lhs =y(37);
rhs =(1-params(3)*params(12))*(y(27)*T256+y(30)*(1+params(28))+y(48)+y(45))+params(3)*params(12)*(T256*(y(94)+y(96))+y(91));
residual(20)= lhs-rhs;
lhs =y(38);
rhs =(1-params(2)*params(12))*(y(30)+y(49)+y(27)*T255)+params(2)*params(12)*(y(92)+T284*(y(96)-y(94)));
residual(21)= lhs-rhs;
lhs =y(39);
rhs =(1-params(3)*params(12))*(y(27)*T255+y(30)+y(50))+params(3)*params(12)*(y(93)+T284*(y(96)-y(94)));
residual(22)= lhs-rhs;
lhs =y(27);
rhs =T305*(params(14)*(y(36)-y(38))+(1-params(14))*(y(37)-y(39)))+params(12)*(y(2)-y(40)-y(44));
residual(23)= lhs-rhs;
lhs =y(55)+T324*y(56);
rhs =T328*(y(13)+y(1))+T334*y(14)+y(26)*T346+params(45)/params(40)*y(57)-params(47)/params(40)*y(58)-(T328+T334)*(y(40)+y(44));
residual(24)= lhs-rhs;
lhs =y(60);
rhs =y(56)-params(20)/(params(20)-params(7))*y(26);
residual(25)= lhs-rhs;
lhs =y(60);
rhs =params(31)*y(17)+x(it_, 11);
residual(26)= lhs-rhs;
lhs =(y(58)-params(45)*y(57))/(params(48)-params(45));
rhs =y(17)*params(21)+x(it_, 10);
residual(27)= lhs-rhs;
residual(28) = y(55)+T324*y(56)-y(26)*T385-(1+T324)*y(61);
lhs =y(54);
rhs =params(19)*(y(60)-y(55))+y(59);
residual(29)= lhs-rhs;
lhs =y(59);
rhs =params(32)*y(16)+x(it_, 5);
residual(30)= lhs-rhs;
lhs =y(25);
rhs =x(it_, 6)+y(1)*params(34)+(1-params(34))*(y(40)*params(22)+params(23)*(y(7)+y(44)+y(31)-y(20)+y(21)+y(22)));
residual(31)= lhs-rhs;
lhs =y(31)*params(47);
rhs =params(45)*y(57)+y(52)*params(15)*params(42)+y(53)*params(16)*params(43)+y(42)*params(46)+y(41)*exp((-params(6)))*params(38)*params(51);
residual(32)= lhs-rhs;
lhs =y(44);
rhs =y(7)*params(35)+x(it_, 1);
residual(33)= lhs-rhs;
lhs =y(45);
rhs =params(36)*y(8)+x(it_, 2);
residual(34)= lhs-rhs;
lhs =y(46);
rhs =x(it_, 3);
residual(35)= lhs-rhs;
lhs =y(43);
rhs =params(37)*y(6)+x(it_, 4);
residual(36)= lhs-rhs;
lhs =y(47);
rhs =params(29)*y(9)+x(it_, 7);
residual(37)= lhs-rhs;
lhs =y(48);
rhs =params(30)*y(10)+x(it_, 8);
residual(38)= lhs-rhs;
lhs =y(57);
rhs =params(33)*y(15)+x(it_, 9);
residual(39)= lhs-rhs;
lhs =y(62);
rhs =y(26)-y(25);
residual(40)= lhs-rhs;
lhs =y(49);
rhs =y(99)+params(39)/(params(39)-params(66))*y(63)-y(96)-y(94)-params(66)/(params(39)-params(66))*y(104);
residual(41)= lhs-rhs;
lhs =y(64);
rhs =y(26)-y(63);
residual(42)= lhs-rhs;
lhs =y(65);
rhs =y(25)-y(94);
residual(43)= lhs-rhs;
lhs =y(66);
rhs =y(26)-y(94);
residual(44)= lhs-rhs;
lhs =y(67);
rhs =y(63)-y(94);
residual(45)= lhs-rhs;
lhs =y(68);
rhs =4*(y(31)-y(4));
residual(46)= lhs-rhs;
lhs =y(78);
rhs =y(31);
residual(47)= lhs-rhs;
lhs =y(69);
rhs =y(40);
residual(48)= lhs-rhs;
lhs =y(70);
rhs =y(25)*4;
residual(49)= lhs-rhs;
lhs =y(71);
rhs =y(26)*4;
residual(50)= lhs-rhs;
lhs =y(77);
rhs =y(64);
residual(51)= lhs-rhs;
lhs =y(72);
rhs =y(68);
residual(52)= lhs-rhs;
lhs =y(73);
rhs =y(31);
residual(53)= lhs-rhs;
lhs =y(74);
rhs =y(69);
residual(54)= lhs-rhs;
lhs =y(75);
rhs =y(70);
residual(55)= lhs-rhs;
lhs =y(76);
rhs =y(71);
residual(56)= lhs-rhs;
lhs =y(79);
rhs =y(4);
residual(57)= lhs-rhs;
lhs =y(80);
rhs =y(18);
residual(58)= lhs-rhs;
lhs =y(81);
rhs =y(19);
residual(59)= lhs-rhs;
lhs =y(82);
rhs =y(7);
residual(60)= lhs-rhs;
lhs =y(83);
rhs =y(21);
residual(61)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(61, 115);

  %
  % Jacobian matrix
  %

  g1(1,23)=1;
  g1(1,24)=(-params(1));
  g1(1,27)=(-(1-params(1)));
  g1(2,24)=1;
  g1(2,27)=(-1);
  g1(2,29)=1;
  g1(2,30)=(-1);
  g1(3,29)=(-params(1));
  g1(3,30)=(-(1-params(1)));
  g1(3,31)=1;
  g1(4,23)=(-(1-params(2)*params(11)));
  g1(4,31)=(-(1-params(2)*params(11)));
  g1(4,32)=1;
  g1(4,86)=(-(params(2)*params(11)));
  g1(4,94)=(-(params(2)*params(11)*(1+params(9))/params(9)));
  g1(4,46)=(-(1-params(2)*params(11)));
  g1(4,49)=(-(1-params(2)*params(11)));
  g1(5,23)=(-(1-params(11)*params(3)));
  g1(5,31)=(-(1-params(11)*params(3)));
  g1(5,33)=1;
  g1(5,87)=(-(params(11)*params(3)));
  g1(5,94)=(-((1+params(9))/params(9)*params(11)*params(3)));
  g1(5,46)=(-(1-params(11)*params(3)));
  g1(5,50)=(-(1-params(11)*params(3)));
  g1(6,31)=(-(1-params(2)*params(11)));
  g1(6,34)=1;
  g1(6,88)=(-(params(2)*params(11)));
  g1(6,94)=(-(params(2)*params(11)*(-1)/params(9)));
  g1(6,49)=(-(1-params(2)*params(11)));
  g1(7,31)=(-(1-params(11)*params(3)));
  g1(7,35)=1;
  g1(7,89)=(-(params(11)*params(3)));
  g1(7,94)=(-(params(11)*params(3)*(-1)/params(9)));
  g1(7,50)=(-(1-params(11)*params(3)));
  g1(8,32)=(-(T80*params(13)));
  g1(8,33)=(-(T80*(1-params(13))));
  g1(8,34)=(-(T80*(-params(13))));
  g1(8,35)=(-(T80*(-(1-params(13)))));
  g1(8,40)=1;
  g1(9,3)=(-1);
  g1(9,29)=1;
  g1(9,41)=(-1);
  g1(9,44)=1;
  g1(10,3)=(-((1-params(5))*exp((-params(6)))));
  g1(10,28)=1;
  g1(10,42)=(-(1-(1-params(5))*exp((-params(6)))));
  g1(10,43)=(-(1-(1-params(5))*exp((-params(6)))));
  g1(10,44)=(1-params(5))*exp((-params(6)));
  g1(11,24)=1;
  g1(11,41)=(-(params(18)/params(38)));
  g1(12,84)=(-(params(38)*exp((-params(6)))*params(4)));
  g1(12,96)=1;
  g1(12,49)=params(24);
  g1(12,99)=(-(params(24)*(1+params(10))/(1+params(24)*params(10))));
  g1(12,50)=1-params(24);
  g1(12,100)=(-((1-params(24))*1/(1+params(24)*params(10))));
  g1(12,51)=1;
  g1(12,101)=(-((1-params(5))*exp((-params(6)))*params(4)));
  g1(13,5)=(-(exp(2*params(6))*params(17)));
  g1(13,42)=(-((-(exp(2*params(6))*params(17)))-params(17)*params(4)*exp(2*params(6))));
  g1(13,95)=(-(params(17)*params(4)*exp(2*params(6))));
  g1(13,43)=(-1);
  g1(13,44)=exp(2*params(6))*params(17);
  g1(13,96)=(-(params(17)*params(4)*exp(2*params(6))));
  g1(13,51)=(-1);
  g1(14,47)=(-T171);
  g1(14,97)=(-(T171*(-(params(2)*params(25)))));
  g1(14,49)=1;
  g1(14,11)=(-(T171*(-(T178*(-params(25))))));
  g1(14,52)=(-(T171*(-(T178*(1+params(2)*T179)))));
  g1(14,102)=(-(T171*(-(T178*(-(params(2)*params(25)))))));
  g1(15,48)=(-T196);
  g1(15,98)=(-(T196*(-(params(3)*params(25)))));
  g1(15,50)=1;
  g1(15,12)=(-(T196*(-(T202*(-params(25))))));
  g1(15,53)=(-(T196*(-(T202*(1+params(3)*T179)))));
  g1(15,103)=(-(T196*(-(T202*(-(params(3)*params(25)))))));
  g1(16,25)=(-1);
  g1(16,94)=1;
  g1(16,96)=1;
  g1(16,49)=1;
  g1(16,99)=(-1);
  g1(17,26)=(-(params(20)/(params(20)-params(7))));
  g1(17,85)=params(7)/(params(20)-params(7));
  g1(17,94)=1;
  g1(17,96)=1;
  g1(17,49)=1;
  g1(17,99)=(-1);
  g1(17,54)=1;
  g1(18,26)=(-(params(20)/(params(20)-params(7))));
  g1(18,85)=params(7)/(params(20)-params(7));
  g1(18,94)=1;
  g1(18,96)=1;
  g1(18,50)=1;
  g1(18,100)=(-1);
  g1(19,27)=(-((1-params(2)*params(12))*T256));
  g1(19,30)=(-((1-params(2)*params(12))*(1+params(28))));
  g1(19,36)=1;
  g1(19,90)=(-(params(2)*params(12)));
  g1(19,94)=(-(params(2)*params(12)*T256));
  g1(19,96)=(-(params(2)*params(12)*T256));
  g1(19,45)=(-(1-params(2)*params(12)));
  g1(19,47)=(-(1-params(2)*params(12)));
  g1(20,27)=(-(T256*(1-params(3)*params(12))));
  g1(20,30)=(-((1+params(28))*(1-params(3)*params(12))));
  g1(20,37)=1;
  g1(20,91)=(-(params(3)*params(12)));
  g1(20,94)=(-(T256*params(3)*params(12)));
  g1(20,96)=(-(T256*params(3)*params(12)));
  g1(20,45)=(-(1-params(3)*params(12)));
  g1(20,48)=(-(1-params(3)*params(12)));
  g1(21,27)=(-((1-params(2)*params(12))*T255));
  g1(21,30)=(-(1-params(2)*params(12)));
  g1(21,38)=1;
  g1(21,92)=(-(params(2)*params(12)));
  g1(21,94)=(-(params(2)*params(12)*(-T284)));
  g1(21,96)=(-(params(2)*params(12)*T284));
  g1(21,49)=(-(1-params(2)*params(12)));
  g1(22,27)=(-(T255*(1-params(3)*params(12))));
  g1(22,30)=(-(1-params(3)*params(12)));
  g1(22,39)=1;
  g1(22,93)=(-(params(3)*params(12)));
  g1(22,94)=(-(params(3)*params(12)*(-T284)));
  g1(22,96)=(-(params(3)*params(12)*T284));
  g1(22,50)=(-(1-params(3)*params(12)));
  g1(23,2)=(-params(12));
  g1(23,27)=1;
  g1(23,36)=(-(T305*params(14)));
  g1(23,37)=(-(T305*(1-params(14))));
  g1(23,38)=(-(T305*(-params(14))));
  g1(23,39)=(-(T305*(-(1-params(14)))));
  g1(23,40)=params(12);
  g1(23,44)=params(12);
  g1(24,1)=(-T328);
  g1(24,26)=(-T346);
  g1(24,40)=T328+T334;
  g1(24,44)=T328+T334;
  g1(24,13)=(-T328);
  g1(24,55)=1;
  g1(24,14)=(-T334);
  g1(24,56)=T324;
  g1(24,57)=(-(params(45)/params(40)));
  g1(24,58)=params(47)/params(40);
  g1(25,26)=params(20)/(params(20)-params(7));
  g1(25,56)=(-1);
  g1(25,60)=1;
  g1(26,17)=(-params(31));
  g1(26,60)=1;
  g1(26,115)=(-1);
  g1(27,57)=(-params(45))/(params(48)-params(45));
  g1(27,58)=1/(params(48)-params(45));
  g1(27,17)=(-params(21));
  g1(27,114)=(-1);
  g1(28,26)=(-T385);
  g1(28,55)=1;
  g1(28,56)=T324;
  g1(28,61)=(-(1+T324));
  g1(29,54)=1;
  g1(29,55)=params(19);
  g1(29,59)=(-1);
  g1(29,60)=(-params(19));
  g1(30,16)=(-params(32));
  g1(30,59)=1;
  g1(30,109)=(-1);
  g1(31,1)=(-params(34));
  g1(31,25)=1;
  g1(31,31)=(-((1-params(34))*params(23)));
  g1(31,40)=(-((1-params(34))*params(22)));
  g1(31,7)=(-((1-params(34))*params(23)));
  g1(31,44)=(-((1-params(34))*params(23)));
  g1(31,110)=(-1);
  g1(31,20)=(-((1-params(34))*(-params(23))));
  g1(31,21)=(-((1-params(34))*params(23)));
  g1(31,22)=(-((1-params(34))*params(23)));
  g1(32,31)=params(47);
  g1(32,41)=(-(exp((-params(6)))*params(38)*params(51)));
  g1(32,42)=(-params(46));
  g1(32,52)=(-(params(15)*params(42)));
  g1(32,53)=(-(params(16)*params(43)));
  g1(32,57)=(-params(45));
  g1(33,7)=(-params(35));
  g1(33,44)=1;
  g1(33,105)=(-1);
  g1(34,8)=(-params(36));
  g1(34,45)=1;
  g1(34,106)=(-1);
  g1(35,46)=1;
  g1(35,107)=(-1);
  g1(36,6)=(-params(37));
  g1(36,43)=1;
  g1(36,108)=(-1);
  g1(37,9)=(-params(29));
  g1(37,47)=1;
  g1(37,111)=(-1);
  g1(38,10)=(-params(30));
  g1(38,48)=1;
  g1(38,112)=(-1);
  g1(39,15)=(-params(33));
  g1(39,57)=1;
  g1(39,113)=(-1);
  g1(40,25)=1;
  g1(40,26)=(-1);
  g1(40,62)=1;
  g1(41,94)=1;
  g1(41,96)=1;
  g1(41,49)=1;
  g1(41,99)=(-1);
  g1(41,63)=(-(params(39)/(params(39)-params(66))));
  g1(41,104)=params(66)/(params(39)-params(66));
  g1(42,26)=(-1);
  g1(42,63)=1;
  g1(42,64)=1;
  g1(43,25)=(-1);
  g1(43,94)=1;
  g1(43,65)=1;
  g1(44,26)=(-1);
  g1(44,94)=1;
  g1(44,66)=1;
  g1(45,94)=1;
  g1(45,63)=(-1);
  g1(45,67)=1;
  g1(46,4)=4;
  g1(46,31)=(-4);
  g1(46,68)=1;
  g1(47,31)=(-1);
  g1(47,78)=1;
  g1(48,40)=(-1);
  g1(48,69)=1;
  g1(49,25)=(-4);
  g1(49,70)=1;
  g1(50,26)=(-4);
  g1(50,71)=1;
  g1(51,64)=(-1);
  g1(51,77)=1;
  g1(52,68)=(-1);
  g1(52,72)=1;
  g1(53,31)=(-1);
  g1(53,73)=1;
  g1(54,69)=(-1);
  g1(54,74)=1;
  g1(55,70)=(-1);
  g1(55,75)=1;
  g1(56,71)=(-1);
  g1(56,76)=1;
  g1(57,4)=(-1);
  g1(57,79)=1;
  g1(58,18)=(-1);
  g1(58,80)=1;
  g1(59,19)=(-1);
  g1(59,81)=1;
  g1(60,7)=(-1);
  g1(60,82)=1;
  g1(61,21)=(-1);
  g1(61,83)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],61,13225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],61,1520875);
end
end
end
end
