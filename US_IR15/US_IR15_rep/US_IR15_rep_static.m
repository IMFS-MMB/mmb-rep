function [residual, g1, g2] = US_IR15_rep_static(y, x, params)
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
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
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

lhs =y(6);
rhs =params(45)*y(1)+params(46)*y(2)+params(47)*y(3)+params(48)*y(4)+params(49)*y(5);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =y(1)*params(50)+y(2)*params(51)+y(3)*params(52)+y(4)*params(53)+y(5)*params(54);
residual(2)= lhs-rhs;
lhs =y(8);
rhs =y(1)*params(55)+y(2)*params(56)+y(3)*params(57)+y(4)*params(58)+y(5)*params(59);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(1)*params(60)+y(2)*params(61)+y(3)*params(62)+y(4)*params(63)+y(5)*params(64)+params(32)*x(6);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(1)*params(65)+y(2)*params(66)+y(3)*params(67)+y(4)*params(68)+y(5)*params(69)+params(33)*x(7);
residual(5)= lhs-rhs;
lhs =y(11);
rhs =y(1)*params(70)+y(2)*params(71)+y(3)*params(72)+y(4)*params(73)+y(5)*params(74);
residual(6)= lhs-rhs;
lhs =y(12);
rhs =y(1)*params(75)+y(2)*params(76)+y(3)*params(77)+y(4)*params(78)+y(5)*params(79)+params(34)*x(8);
residual(7)= lhs-rhs;
lhs =y(13);
rhs =y(1)*params(80)+y(2)*params(81)+y(3)*params(82)+y(4)*params(83)+y(5)*params(84);
residual(8)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(85)+y(2)*params(86)+y(3)*params(87)+y(4)*params(88)+y(5)*params(89)+params(135)*x(1)+params(136)*x(2)+params(137)*x(3)+params(138)*x(4)+params(139)*x(5);
residual(9)= lhs-rhs;
lhs =y(2);
rhs =y(1)*params(90)+y(2)*params(91)+y(3)*params(92)+y(4)*params(93)+y(5)*params(94)+x(1)*params(140)+x(2)*params(141)+x(3)*params(142)+x(4)*params(143)+x(5)*params(144);
residual(10)= lhs-rhs;
lhs =y(3);
rhs =y(1)*params(95)+y(2)*params(96)+y(3)*params(97)+y(4)*params(98)+y(5)*params(99)+x(1)*params(145)+x(2)*params(146)+x(3)*params(147)+x(4)*params(148)+x(5)*params(149);
residual(11)= lhs-rhs;
lhs =y(4);
rhs =y(1)*params(100)+y(2)*params(101)+y(3)*params(102)+y(4)*params(103)+y(5)*params(104)+x(1)*params(150)+x(2)*params(151)+x(3)*params(152)+x(4)*params(153)+x(5)*params(154);
residual(12)= lhs-rhs;
lhs =y(5);
rhs =y(1)*params(105)+y(2)*params(106)+y(3)*params(107)+y(4)*params(108)+y(5)*params(109)+x(1)*params(155)+x(2)*params(156)+x(3)*params(157)+x(4)*params(158)+x(5)*params(159);
residual(13)= lhs-rhs;
lhs =y(31);
rhs =y(3);
residual(14)= lhs-rhs;
lhs =y(32);
rhs =y(7)*4;
residual(15)= lhs-rhs;
lhs =y(14);
rhs =y(9)*4-y(6);
residual(16)= lhs-rhs;
lhs =y(15);
rhs =y(10)*4-y(6);
residual(17)= lhs-rhs;
lhs =y(16);
rhs =y(11)*4-y(6);
residual(18)= lhs-rhs;
lhs =y(17);
rhs =y(12)*4-y(6);
residual(19)= lhs-rhs;
lhs =y(18);
rhs =y(13)*4-y(6);
residual(20)= lhs-rhs;
lhs =y(19);
rhs =y(9)*4;
residual(21)= lhs-rhs;
lhs =y(20);
rhs =4*(y(1)*params(110)+y(2)*params(111)+y(3)*params(112)+y(4)*params(113)+y(5)*params(114));
residual(22)= lhs-rhs;
lhs =y(21);
rhs =y(2)*4;
residual(23)= lhs-rhs;
lhs =y(22);
rhs =y(10)*4;
residual(24)= lhs-rhs;
lhs =y(23);
rhs =4*(y(1)*params(115)+y(2)*params(116)+y(3)*params(117)+y(4)*params(118)+y(5)*params(119));
residual(25)= lhs-rhs;
lhs =y(24);
rhs =y(6)*4;
residual(26)= lhs-rhs;
lhs =y(25);
rhs =y(11)*4;
residual(27)= lhs-rhs;
lhs =y(26);
rhs =4*(y(1)*params(120)+y(2)*params(121)+y(3)*params(122)+y(4)*params(123)+y(5)*params(124));
residual(28)= lhs-rhs;
lhs =y(27);
rhs =y(12)*4;
residual(29)= lhs-rhs;
lhs =y(28);
rhs =4*(y(1)*params(125)+y(2)*params(126)+y(3)*params(127)+y(4)*params(128)+y(5)*params(129));
residual(30)= lhs-rhs;
lhs =y(29);
rhs =y(13)*4;
residual(31)= lhs-rhs;
lhs =y(30);
rhs =4*(y(1)*params(130)+y(2)*params(131)+y(3)*params(132)+y(4)*params(133)+y(5)*params(134));
residual(32)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(32, 32);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-params(45));
  g1(1,2)=(-params(46));
  g1(1,3)=(-params(47));
  g1(1,4)=(-params(48));
  g1(1,5)=(-params(49));
  g1(1,6)=1;
  g1(2,1)=(-params(50));
  g1(2,2)=(-params(51));
  g1(2,3)=(-params(52));
  g1(2,4)=(-params(53));
  g1(2,5)=(-params(54));
  g1(2,7)=1;
  g1(3,1)=(-params(55));
  g1(3,2)=(-params(56));
  g1(3,3)=(-params(57));
  g1(3,4)=(-params(58));
  g1(3,5)=(-params(59));
  g1(3,8)=1;
  g1(4,1)=(-params(60));
  g1(4,2)=(-params(61));
  g1(4,3)=(-params(62));
  g1(4,4)=(-params(63));
  g1(4,5)=(-params(64));
  g1(4,9)=1;
  g1(5,1)=(-params(65));
  g1(5,2)=(-params(66));
  g1(5,3)=(-params(67));
  g1(5,4)=(-params(68));
  g1(5,5)=(-params(69));
  g1(5,10)=1;
  g1(6,1)=(-params(70));
  g1(6,2)=(-params(71));
  g1(6,3)=(-params(72));
  g1(6,4)=(-params(73));
  g1(6,5)=(-params(74));
  g1(6,11)=1;
  g1(7,1)=(-params(75));
  g1(7,2)=(-params(76));
  g1(7,3)=(-params(77));
  g1(7,4)=(-params(78));
  g1(7,5)=(-params(79));
  g1(7,12)=1;
  g1(8,1)=(-params(80));
  g1(8,2)=(-params(81));
  g1(8,3)=(-params(82));
  g1(8,4)=(-params(83));
  g1(8,5)=(-params(84));
  g1(8,13)=1;
  g1(9,1)=1-params(85);
  g1(9,2)=(-params(86));
  g1(9,3)=(-params(87));
  g1(9,4)=(-params(88));
  g1(9,5)=(-params(89));
  g1(10,1)=(-params(90));
  g1(10,2)=1-params(91);
  g1(10,3)=(-params(92));
  g1(10,4)=(-params(93));
  g1(10,5)=(-params(94));
  g1(11,1)=(-params(95));
  g1(11,2)=(-params(96));
  g1(11,3)=1-params(97);
  g1(11,4)=(-params(98));
  g1(11,5)=(-params(99));
  g1(12,1)=(-params(100));
  g1(12,2)=(-params(101));
  g1(12,3)=(-params(102));
  g1(12,4)=1-params(103);
  g1(12,5)=(-params(104));
  g1(13,1)=(-params(105));
  g1(13,2)=(-params(106));
  g1(13,3)=(-params(107));
  g1(13,4)=(-params(108));
  g1(13,5)=1-params(109);
  g1(14,3)=(-1);
  g1(14,31)=1;
  g1(15,7)=(-4);
  g1(15,32)=1;
  g1(16,6)=1;
  g1(16,9)=(-4);
  g1(16,14)=1;
  g1(17,6)=1;
  g1(17,10)=(-4);
  g1(17,15)=1;
  g1(18,6)=1;
  g1(18,11)=(-4);
  g1(18,16)=1;
  g1(19,6)=1;
  g1(19,12)=(-4);
  g1(19,17)=1;
  g1(20,6)=1;
  g1(20,13)=(-4);
  g1(20,18)=1;
  g1(21,9)=(-4);
  g1(21,19)=1;
  g1(22,1)=(-(4*params(110)));
  g1(22,2)=(-(4*params(111)));
  g1(22,3)=(-(4*params(112)));
  g1(22,4)=(-(4*params(113)));
  g1(22,5)=(-(4*params(114)));
  g1(22,20)=1;
  g1(23,2)=(-4);
  g1(23,21)=1;
  g1(24,10)=(-4);
  g1(24,22)=1;
  g1(25,1)=(-(4*params(115)));
  g1(25,2)=(-(4*params(116)));
  g1(25,3)=(-(4*params(117)));
  g1(25,4)=(-(4*params(118)));
  g1(25,5)=(-(4*params(119)));
  g1(25,23)=1;
  g1(26,6)=(-4);
  g1(26,24)=1;
  g1(27,11)=(-4);
  g1(27,25)=1;
  g1(28,1)=(-(4*params(120)));
  g1(28,2)=(-(4*params(121)));
  g1(28,3)=(-(4*params(122)));
  g1(28,4)=(-(4*params(123)));
  g1(28,5)=(-(4*params(124)));
  g1(28,26)=1;
  g1(29,12)=(-4);
  g1(29,27)=1;
  g1(30,1)=(-(4*params(125)));
  g1(30,2)=(-(4*params(126)));
  g1(30,3)=(-(4*params(127)));
  g1(30,4)=(-(4*params(128)));
  g1(30,5)=(-(4*params(129)));
  g1(30,28)=1;
  g1(31,13)=(-4);
  g1(31,29)=1;
  g1(32,1)=(-(4*params(130)));
  g1(32,2)=(-(4*params(131)));
  g1(32,3)=(-(4*params(132)));
  g1(32,4)=(-(4*params(133)));
  g1(32,5)=(-(4*params(134)));
  g1(32,30)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],32,1024);
end
end
