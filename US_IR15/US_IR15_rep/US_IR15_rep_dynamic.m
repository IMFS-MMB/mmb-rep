function [residual, g1, g2, g3] = US_IR15_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(32, 1);
lhs =y(11);
rhs =params(45)*y(6)+params(46)*y(7)+params(47)*y(8)+params(48)*y(9)+params(49)*y(10);
residual(1)= lhs-rhs;
lhs =y(12);
rhs =y(6)*params(50)+y(7)*params(51)+y(8)*params(52)+y(9)*params(53)+y(10)*params(54);
residual(2)= lhs-rhs;
lhs =y(13);
rhs =y(6)*params(55)+y(7)*params(56)+y(8)*params(57)+y(9)*params(58)+y(10)*params(59);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =y(6)*params(60)+y(7)*params(61)+y(8)*params(62)+y(9)*params(63)+y(10)*params(64)+params(32)*x(it_, 6);
residual(4)= lhs-rhs;
lhs =y(15);
rhs =y(6)*params(65)+y(7)*params(66)+y(8)*params(67)+y(9)*params(68)+y(10)*params(69)+params(33)*x(it_, 7);
residual(5)= lhs-rhs;
lhs =y(16);
rhs =y(6)*params(70)+y(7)*params(71)+y(8)*params(72)+y(9)*params(73)+y(10)*params(74);
residual(6)= lhs-rhs;
lhs =y(17);
rhs =y(6)*params(75)+y(7)*params(76)+y(8)*params(77)+y(9)*params(78)+y(10)*params(79)+params(34)*x(it_, 8);
residual(7)= lhs-rhs;
lhs =y(18);
rhs =y(6)*params(80)+y(7)*params(81)+y(8)*params(82)+y(9)*params(83)+y(10)*params(84);
residual(8)= lhs-rhs;
lhs =y(6);
rhs =params(85)*y(1)+params(86)*y(2)+params(87)*y(3)+params(88)*y(4)+params(89)*y(5)+params(135)*x(it_, 1)+params(136)*x(it_, 2)+params(137)*x(it_, 3)+params(138)*x(it_, 4)+params(139)*x(it_, 5);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =y(1)*params(90)+y(2)*params(91)+y(3)*params(92)+y(4)*params(93)+y(5)*params(94)+x(it_, 1)*params(140)+x(it_, 2)*params(141)+x(it_, 3)*params(142)+x(it_, 4)*params(143)+x(it_, 5)*params(144);
residual(10)= lhs-rhs;
lhs =y(8);
rhs =y(1)*params(95)+y(2)*params(96)+y(3)*params(97)+y(4)*params(98)+y(5)*params(99)+x(it_, 1)*params(145)+x(it_, 2)*params(146)+x(it_, 3)*params(147)+x(it_, 4)*params(148)+x(it_, 5)*params(149);
residual(11)= lhs-rhs;
lhs =y(9);
rhs =y(1)*params(100)+y(2)*params(101)+y(3)*params(102)+y(4)*params(103)+y(5)*params(104)+x(it_, 1)*params(150)+x(it_, 2)*params(151)+x(it_, 3)*params(152)+x(it_, 4)*params(153)+x(it_, 5)*params(154);
residual(12)= lhs-rhs;
lhs =y(10);
rhs =y(1)*params(105)+y(2)*params(106)+y(3)*params(107)+y(4)*params(108)+y(5)*params(109)+x(it_, 1)*params(155)+x(it_, 2)*params(156)+x(it_, 3)*params(157)+x(it_, 4)*params(158)+x(it_, 5)*params(159);
residual(13)= lhs-rhs;
lhs =y(36);
rhs =y(8);
residual(14)= lhs-rhs;
lhs =y(37);
rhs =y(12)*4;
residual(15)= lhs-rhs;
lhs =y(19);
rhs =y(14)*4-y(11);
residual(16)= lhs-rhs;
lhs =y(20);
rhs =y(15)*4-y(11);
residual(17)= lhs-rhs;
lhs =y(21);
rhs =y(16)*4-y(11);
residual(18)= lhs-rhs;
lhs =y(22);
rhs =y(17)*4-y(11);
residual(19)= lhs-rhs;
lhs =y(23);
rhs =y(18)*4-y(11);
residual(20)= lhs-rhs;
lhs =y(24);
rhs =y(14)*4;
residual(21)= lhs-rhs;
lhs =y(25);
rhs =4*(y(6)*params(110)+y(7)*params(111)+y(8)*params(112)+y(9)*params(113)+y(10)*params(114));
residual(22)= lhs-rhs;
lhs =y(26);
rhs =y(7)*4;
residual(23)= lhs-rhs;
lhs =y(27);
rhs =y(15)*4;
residual(24)= lhs-rhs;
lhs =y(28);
rhs =4*(y(6)*params(115)+y(7)*params(116)+y(8)*params(117)+y(9)*params(118)+y(10)*params(119));
residual(25)= lhs-rhs;
lhs =y(29);
rhs =y(11)*4;
residual(26)= lhs-rhs;
lhs =y(30);
rhs =y(16)*4;
residual(27)= lhs-rhs;
lhs =y(31);
rhs =4*(y(6)*params(120)+y(7)*params(121)+y(8)*params(122)+y(9)*params(123)+y(10)*params(124));
residual(28)= lhs-rhs;
lhs =y(32);
rhs =y(17)*4;
residual(29)= lhs-rhs;
lhs =y(33);
rhs =4*(y(6)*params(125)+y(7)*params(126)+y(8)*params(127)+y(9)*params(128)+y(10)*params(129));
residual(30)= lhs-rhs;
lhs =y(34);
rhs =y(18)*4;
residual(31)= lhs-rhs;
lhs =y(35);
rhs =4*(y(6)*params(130)+y(7)*params(131)+y(8)*params(132)+y(9)*params(133)+y(10)*params(134));
residual(32)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(32, 45);

  %
  % Jacobian matrix
  %

  g1(1,6)=(-params(45));
  g1(1,7)=(-params(46));
  g1(1,8)=(-params(47));
  g1(1,9)=(-params(48));
  g1(1,10)=(-params(49));
  g1(1,11)=1;
  g1(2,6)=(-params(50));
  g1(2,7)=(-params(51));
  g1(2,8)=(-params(52));
  g1(2,9)=(-params(53));
  g1(2,10)=(-params(54));
  g1(2,12)=1;
  g1(3,6)=(-params(55));
  g1(3,7)=(-params(56));
  g1(3,8)=(-params(57));
  g1(3,9)=(-params(58));
  g1(3,10)=(-params(59));
  g1(3,13)=1;
  g1(4,6)=(-params(60));
  g1(4,7)=(-params(61));
  g1(4,8)=(-params(62));
  g1(4,9)=(-params(63));
  g1(4,10)=(-params(64));
  g1(4,14)=1;
  g1(4,43)=(-params(32));
  g1(5,6)=(-params(65));
  g1(5,7)=(-params(66));
  g1(5,8)=(-params(67));
  g1(5,9)=(-params(68));
  g1(5,10)=(-params(69));
  g1(5,15)=1;
  g1(5,44)=(-params(33));
  g1(6,6)=(-params(70));
  g1(6,7)=(-params(71));
  g1(6,8)=(-params(72));
  g1(6,9)=(-params(73));
  g1(6,10)=(-params(74));
  g1(6,16)=1;
  g1(7,6)=(-params(75));
  g1(7,7)=(-params(76));
  g1(7,8)=(-params(77));
  g1(7,9)=(-params(78));
  g1(7,10)=(-params(79));
  g1(7,17)=1;
  g1(7,45)=(-params(34));
  g1(8,6)=(-params(80));
  g1(8,7)=(-params(81));
  g1(8,8)=(-params(82));
  g1(8,9)=(-params(83));
  g1(8,10)=(-params(84));
  g1(8,18)=1;
  g1(9,1)=(-params(85));
  g1(9,6)=1;
  g1(9,2)=(-params(86));
  g1(9,3)=(-params(87));
  g1(9,4)=(-params(88));
  g1(9,5)=(-params(89));
  g1(9,38)=(-params(135));
  g1(9,39)=(-params(136));
  g1(9,40)=(-params(137));
  g1(9,41)=(-params(138));
  g1(9,42)=(-params(139));
  g1(10,1)=(-params(90));
  g1(10,2)=(-params(91));
  g1(10,7)=1;
  g1(10,3)=(-params(92));
  g1(10,4)=(-params(93));
  g1(10,5)=(-params(94));
  g1(10,38)=(-params(140));
  g1(10,39)=(-params(141));
  g1(10,40)=(-params(142));
  g1(10,41)=(-params(143));
  g1(10,42)=(-params(144));
  g1(11,1)=(-params(95));
  g1(11,2)=(-params(96));
  g1(11,3)=(-params(97));
  g1(11,8)=1;
  g1(11,4)=(-params(98));
  g1(11,5)=(-params(99));
  g1(11,38)=(-params(145));
  g1(11,39)=(-params(146));
  g1(11,40)=(-params(147));
  g1(11,41)=(-params(148));
  g1(11,42)=(-params(149));
  g1(12,1)=(-params(100));
  g1(12,2)=(-params(101));
  g1(12,3)=(-params(102));
  g1(12,4)=(-params(103));
  g1(12,9)=1;
  g1(12,5)=(-params(104));
  g1(12,38)=(-params(150));
  g1(12,39)=(-params(151));
  g1(12,40)=(-params(152));
  g1(12,41)=(-params(153));
  g1(12,42)=(-params(154));
  g1(13,1)=(-params(105));
  g1(13,2)=(-params(106));
  g1(13,3)=(-params(107));
  g1(13,4)=(-params(108));
  g1(13,5)=(-params(109));
  g1(13,10)=1;
  g1(13,38)=(-params(155));
  g1(13,39)=(-params(156));
  g1(13,40)=(-params(157));
  g1(13,41)=(-params(158));
  g1(13,42)=(-params(159));
  g1(14,8)=(-1);
  g1(14,36)=1;
  g1(15,12)=(-4);
  g1(15,37)=1;
  g1(16,11)=1;
  g1(16,14)=(-4);
  g1(16,19)=1;
  g1(17,11)=1;
  g1(17,15)=(-4);
  g1(17,20)=1;
  g1(18,11)=1;
  g1(18,16)=(-4);
  g1(18,21)=1;
  g1(19,11)=1;
  g1(19,17)=(-4);
  g1(19,22)=1;
  g1(20,11)=1;
  g1(20,18)=(-4);
  g1(20,23)=1;
  g1(21,14)=(-4);
  g1(21,24)=1;
  g1(22,6)=(-(4*params(110)));
  g1(22,7)=(-(4*params(111)));
  g1(22,8)=(-(4*params(112)));
  g1(22,9)=(-(4*params(113)));
  g1(22,10)=(-(4*params(114)));
  g1(22,25)=1;
  g1(23,7)=(-4);
  g1(23,26)=1;
  g1(24,15)=(-4);
  g1(24,27)=1;
  g1(25,6)=(-(4*params(115)));
  g1(25,7)=(-(4*params(116)));
  g1(25,8)=(-(4*params(117)));
  g1(25,9)=(-(4*params(118)));
  g1(25,10)=(-(4*params(119)));
  g1(25,28)=1;
  g1(26,11)=(-4);
  g1(26,29)=1;
  g1(27,16)=(-4);
  g1(27,30)=1;
  g1(28,6)=(-(4*params(120)));
  g1(28,7)=(-(4*params(121)));
  g1(28,8)=(-(4*params(122)));
  g1(28,9)=(-(4*params(123)));
  g1(28,10)=(-(4*params(124)));
  g1(28,31)=1;
  g1(29,17)=(-4);
  g1(29,32)=1;
  g1(30,6)=(-(4*params(125)));
  g1(30,7)=(-(4*params(126)));
  g1(30,8)=(-(4*params(127)));
  g1(30,9)=(-(4*params(128)));
  g1(30,10)=(-(4*params(129)));
  g1(30,33)=1;
  g1(31,18)=(-4);
  g1(31,34)=1;
  g1(32,6)=(-(4*params(130)));
  g1(32,7)=(-(4*params(131)));
  g1(32,8)=(-(4*params(132)));
  g1(32,9)=(-(4*params(133)));
  g1(32,10)=(-(4*params(134)));
  g1(32,35)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],32,2025);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],32,91125);
end
end
