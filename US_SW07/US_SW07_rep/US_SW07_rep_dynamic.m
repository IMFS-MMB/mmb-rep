function [residual, g1, g2, g3] = US_SW07_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(43, 1);
T21 = 1/(params(10)/(1-params(10)));
T37 = 1/(1+params(41)*params(39));
T42 = params(39)^2;
T44 = T42*params(12);
T57 = params(15)/params(39);
T62 = (1-T57)/(params(14)*(1+T57));
T74 = (1-params(13))/(params(44)+1-params(13));
T90 = (params(14)-1)*params(53)/(params(14)*(1+T57));
T120 = 1/(1-T57);
T123 = T57/(1-T57);
T212 = 1/(1+params(41)*params(39)*params(21));
T227 = (1-params(22))*(1-params(41)*params(39)*params(22))/params(22)/(1+(params(18)-1)*params(3));
T236 = params(41)*params(39)/(1+params(41)*params(39));
T264 = (1-params(20))*(1-params(41)*params(39)*params(20))/((1+params(41)*params(39))*params(20))*1/(1+(params(24)-1)*params(1));
lhs =y(54);
rhs =params(9)*y(33)+(1-params(9))*y(40);
residual(1)= lhs-rhs;
lhs =y(32);
rhs =y(33)*T21;
residual(2)= lhs-rhs;
lhs =y(33);
rhs =y(40)+y(39)-y(34);
residual(3)= lhs-rhs;
lhs =y(34);
rhs =y(32)+y(19);
residual(4)= lhs-rhs;
lhs =y(37);
rhs =T37*(y(4)+params(41)*params(39)*y(69)+1/T44*y(35))+y(57);
residual(5)= lhs-rhs;
lhs =y(35);
rhs =(-y(41))+y(55)*1/T62+params(44)/(params(44)+1-params(13))*y(66)+T74*y(67);
residual(6)= lhs-rhs;
lhs =y(36);
rhs =y(55)+T57/(1+T57)*y(3)+1/(1+T57)*y(68)+T90*(y(39)-y(70))-y(41)*T62;
residual(7)= lhs-rhs;
lhs =y(38);
rhs =y(36)*params(51)+y(37)*params(50)+y(56)+y(32)*params(52);
residual(8)= lhs-rhs;
lhs =y(38);
rhs =params(18)*(y(54)+params(9)*y(34)+(1-params(9))*y(39));
residual(9)= lhs-rhs;
lhs =y(40);
rhs =y(39)*params(23)+y(36)*T120-y(3)*T123;
residual(10)= lhs-rhs;
lhs =y(61);
rhs =y(19)*(1-params(46))+y(37)*params(46)+y(57)*T44*params(46);
residual(11)= lhs-rhs;
lhs =y(42);
rhs =params(9)*y(44)+(1-params(9))*y(52)-y(54);
residual(12)= lhs-rhs;
lhs =y(43);
rhs =T21*y(44);
residual(13)= lhs-rhs;
lhs =y(44);
rhs =y(52)+y(50)-y(45);
residual(14)= lhs-rhs;
lhs =y(45);
rhs =y(43)+y(20);
residual(15)= lhs-rhs;
lhs =y(48);
rhs =y(57)+T37*(y(7)+params(41)*params(39)*y(74)+1/T44*y(46));
residual(16)= lhs-rhs;
lhs =y(46);
rhs =y(55)*1/T62+(-y(53))+y(76)+params(44)/(params(44)+1-params(13))*y(71)+T74*y(72);
residual(17)= lhs-rhs;
lhs =y(47);
rhs =y(55)+T57/(1+T57)*y(6)+1/(1+T57)*y(73)+T90*(y(50)-y(75))-T62*(y(53)-y(76));
residual(18)= lhs-rhs;
lhs =y(49);
rhs =y(56)+params(51)*y(47)+params(50)*y(48)+params(52)*y(43);
residual(19)= lhs-rhs;
lhs =y(49);
rhs =params(18)*(y(54)+params(9)*y(45)+(1-params(9))*y(50));
residual(20)= lhs-rhs;
lhs =y(51);
rhs =T212*(params(41)*params(39)*y(76)+params(21)*y(9)+y(42)*T227)+y(59);
residual(21)= lhs-rhs;
lhs =y(52);
rhs =T37*y(10)+T236*y(77)+y(9)*params(19)/(1+params(41)*params(39))-y(51)*(1+params(41)*params(39)*params(19))/(1+params(41)*params(39))+y(76)*T236+T264*(params(23)*y(50)+T120*y(47)-T123*y(6)-y(52))+y(60);
residual(22)= lhs-rhs;
lhs =y(53);
rhs =y(51)*params(26)*(1-params(29))+(1-params(29))*params(28)*(y(49)-y(38))+params(27)*(y(49)-y(38)-y(8)+y(5))+params(29)*y(11)+y(58);
residual(23)= lhs-rhs;
lhs =y(54);
rhs =params(30)*y(12)+x(it_, 1);
residual(24)= lhs-rhs;
lhs =y(55);
rhs =params(31)*y(13)+x(it_, 2);
residual(25)= lhs-rhs;
lhs =y(56);
rhs =params(32)*y(14)+x(it_, 4)+x(it_, 1)*params(2);
residual(26)= lhs-rhs;
lhs =y(57);
rhs =params(33)*y(15)+x(it_, 3);
residual(27)= lhs-rhs;
lhs =y(58);
rhs =params(34)*y(16)+x(it_, 5);
residual(28)= lhs-rhs;
lhs =y(59);
rhs =params(35)*y(17)+y(31)-params(8)*y(2);
residual(29)= lhs-rhs;
lhs =y(31);
rhs =x(it_, 6);
residual(30)= lhs-rhs;
lhs =y(60);
rhs =params(36)*y(18)+y(30)-params(7)*y(1);
residual(31)= lhs-rhs;
lhs =y(30);
rhs =x(it_, 7);
residual(32)= lhs-rhs;
lhs =y(62);
rhs =(1-params(46))*y(20)+params(46)*y(48)+y(57)*params(12)*T42*params(46);
residual(33)= lhs-rhs;
lhs =y(26);
rhs =y(49)-y(8)+params(37);
residual(34)= lhs-rhs;
lhs =y(27);
rhs =params(37)+y(47)-y(6);
residual(35)= lhs-rhs;
lhs =y(28);
rhs =params(37)+y(48)-y(7);
residual(36)= lhs-rhs;
lhs =y(29);
rhs =params(37)+y(52)-y(10);
residual(37)= lhs-rhs;
lhs =y(25);
rhs =y(51)+params(5);
residual(38)= lhs-rhs;
lhs =y(63);
rhs =y(51)+y(9)+y(21)+y(22);
residual(39)= lhs-rhs;
lhs =y(24);
rhs =y(53)+params(6);
residual(40)= lhs-rhs;
lhs =y(23);
rhs =y(50)+params(4);
residual(41)= lhs-rhs;
lhs =y(64);
rhs =y(9);
residual(42)= lhs-rhs;
lhs =y(65);
rhs =y(21);
residual(43)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(43, 84);

  %
  % Jacobian matrix
  %

  g1(1,33)=(-params(9));
  g1(1,40)=(-(1-params(9)));
  g1(1,54)=1;
  g1(2,32)=1;
  g1(2,33)=(-T21);
  g1(3,33)=1;
  g1(3,34)=1;
  g1(3,39)=(-1);
  g1(3,40)=(-1);
  g1(4,32)=(-1);
  g1(4,34)=1;
  g1(4,19)=(-1);
  g1(5,35)=(-(T37*1/T44));
  g1(5,4)=(-T37);
  g1(5,37)=1;
  g1(5,69)=(-(params(41)*params(39)*T37));
  g1(5,57)=(-1);
  g1(6,66)=(-(params(44)/(params(44)+1-params(13))));
  g1(6,35)=1;
  g1(6,67)=(-T74);
  g1(6,41)=1;
  g1(6,55)=(-(1/T62));
  g1(7,3)=(-(T57/(1+T57)));
  g1(7,36)=1;
  g1(7,68)=(-(1/(1+T57)));
  g1(7,39)=(-T90);
  g1(7,70)=T90;
  g1(7,41)=T62;
  g1(7,55)=(-1);
  g1(8,32)=(-params(52));
  g1(8,36)=(-params(51));
  g1(8,37)=(-params(50));
  g1(8,38)=1;
  g1(8,56)=(-1);
  g1(9,34)=(-(params(9)*params(18)));
  g1(9,38)=1;
  g1(9,39)=(-((1-params(9))*params(18)));
  g1(9,54)=(-params(18));
  g1(10,3)=T123;
  g1(10,36)=(-T120);
  g1(10,39)=(-params(23));
  g1(10,40)=1;
  g1(11,37)=(-params(46));
  g1(11,57)=(-(T44*params(46)));
  g1(11,19)=(-(1-params(46)));
  g1(11,61)=1;
  g1(12,42)=1;
  g1(12,44)=(-params(9));
  g1(12,52)=(-(1-params(9)));
  g1(12,54)=1;
  g1(13,43)=1;
  g1(13,44)=(-T21);
  g1(14,44)=1;
  g1(14,45)=1;
  g1(14,50)=(-1);
  g1(14,52)=(-1);
  g1(15,43)=(-1);
  g1(15,45)=1;
  g1(15,20)=(-1);
  g1(16,46)=(-(T37*1/T44));
  g1(16,7)=(-T37);
  g1(16,48)=1;
  g1(16,74)=(-(params(41)*params(39)*T37));
  g1(16,57)=(-1);
  g1(17,71)=(-(params(44)/(params(44)+1-params(13))));
  g1(17,46)=1;
  g1(17,72)=(-T74);
  g1(17,76)=(-1);
  g1(17,53)=1;
  g1(17,55)=(-(1/T62));
  g1(18,6)=(-(T57/(1+T57)));
  g1(18,47)=1;
  g1(18,73)=(-(1/(1+T57)));
  g1(18,50)=(-T90);
  g1(18,75)=T90;
  g1(18,76)=(-T62);
  g1(18,53)=T62;
  g1(18,55)=(-1);
  g1(19,43)=(-params(52));
  g1(19,47)=(-params(51));
  g1(19,48)=(-params(50));
  g1(19,49)=1;
  g1(19,56)=(-1);
  g1(20,45)=(-(params(9)*params(18)));
  g1(20,49)=1;
  g1(20,50)=(-((1-params(9))*params(18)));
  g1(20,54)=(-params(18));
  g1(21,42)=(-(T212*T227));
  g1(21,9)=(-(params(21)*T212));
  g1(21,51)=1;
  g1(21,76)=(-(params(41)*params(39)*T212));
  g1(21,59)=(-1);
  g1(22,6)=(-(T264*(-T123)));
  g1(22,47)=(-(T120*T264));
  g1(22,50)=(-(params(23)*T264));
  g1(22,9)=(-(params(19)/(1+params(41)*params(39))));
  g1(22,51)=(1+params(41)*params(39)*params(19))/(1+params(41)*params(39));
  g1(22,76)=(-T236);
  g1(22,10)=(-T37);
  g1(22,52)=1-(-T264);
  g1(22,77)=(-T236);
  g1(22,60)=(-1);
  g1(23,5)=(-params(27));
  g1(23,38)=(-((-((1-params(29))*params(28)))-params(27)));
  g1(23,8)=params(27);
  g1(23,49)=(-((1-params(29))*params(28)+params(27)));
  g1(23,51)=(-(params(26)*(1-params(29))));
  g1(23,11)=(-params(29));
  g1(23,53)=1;
  g1(23,58)=(-1);
  g1(24,12)=(-params(30));
  g1(24,54)=1;
  g1(24,78)=(-1);
  g1(25,13)=(-params(31));
  g1(25,55)=1;
  g1(25,79)=(-1);
  g1(26,14)=(-params(32));
  g1(26,56)=1;
  g1(26,78)=(-params(2));
  g1(26,81)=(-1);
  g1(27,15)=(-params(33));
  g1(27,57)=1;
  g1(27,80)=(-1);
  g1(28,16)=(-params(34));
  g1(28,58)=1;
  g1(28,82)=(-1);
  g1(29,2)=params(8);
  g1(29,31)=(-1);
  g1(29,17)=(-params(35));
  g1(29,59)=1;
  g1(30,31)=1;
  g1(30,83)=(-1);
  g1(31,1)=params(7);
  g1(31,30)=(-1);
  g1(31,18)=(-params(36));
  g1(31,60)=1;
  g1(32,30)=1;
  g1(32,84)=(-1);
  g1(33,48)=(-params(46));
  g1(33,57)=(-(params(12)*T42*params(46)));
  g1(33,20)=(-(1-params(46)));
  g1(33,62)=1;
  g1(34,26)=1;
  g1(34,8)=1;
  g1(34,49)=(-1);
  g1(35,27)=1;
  g1(35,6)=1;
  g1(35,47)=(-1);
  g1(36,28)=1;
  g1(36,7)=1;
  g1(36,48)=(-1);
  g1(37,29)=1;
  g1(37,10)=1;
  g1(37,52)=(-1);
  g1(38,25)=1;
  g1(38,51)=(-1);
  g1(39,9)=(-1);
  g1(39,51)=(-1);
  g1(39,63)=1;
  g1(39,21)=(-1);
  g1(39,22)=(-1);
  g1(40,24)=1;
  g1(40,53)=(-1);
  g1(41,23)=1;
  g1(41,50)=(-1);
  g1(42,9)=(-1);
  g1(42,64)=1;
  g1(43,21)=(-1);
  g1(43,65)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],43,7056);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],43,592704);
end
end
end
end
