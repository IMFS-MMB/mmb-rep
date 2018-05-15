function [residual, g1, g2, g3] = NK_GK13_rep_static(y, x, params)
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

residual = zeros( 75, 1);

%
% Model equations
%

T17 = (exp(params(73))-exp(params(73))*params(3))^(1+params(2));
T25 = params(2)*exp(params(73))/T17+exp(params(73))*params(2)*params(1)*params(3)^2/T17;
T78 = exp(params(76))*exp(params(90))*exp(params(67))*(params(8)-1)/exp(params(71));
T79 = params(56)*params(4)*exp(params(71))*exp(params(71))^(params(4)-1)-T78;
T111 = exp(params(75));
T115 = exp(params(78))-T111*(params(9)-1);
T117 = exp(params(120))*T115/T111;
T118 = exp(params(82))-T117;
T127 = exp(params(86))+exp(params(84))*exp(params(86))/(params(55)-exp(params(84)));
T130 = 1+params(6)*T127-params(6);
T131 = params(1)*y(11)*T118*T130;
T148 = (params(55)-exp(params(84)))^2;
T150 = exp(params(84))*exp(params(86))/(params(55)-exp(params(84)))+exp(params(86))*exp(2*params(84))/T148;
T184 = exp(params(83));
T187 = exp(params(123));
T189 = (params(62)+T184)/(T184*T187);
T190 = exp(params(82))-T189;
T192 = T130*params(1)*y(11)*T190;
T251 = 1+params(7)*exp(params(88));
T311 = (params(55)-exp(params(84)))*T251*(params(125)-1)^2;
T323 = (params(55)-exp(params(84)))*(params(125)-1)*T251^2;
T425 = exp(params(69));
T488 = exp(params(71))^(1-params(8));
T490 = (exp(params(120))*T425)^params(8);
T497 = exp(params(71))^params(8);
T504 = (exp(params(120))*T425)^(params(8)-1);
T558 = T187^(params(18)-1);
T562 = T187^((params(18)-1)*params(19));
T568 = ((params(18)*T558/T562-1)/(params(18)-1))^(params(17)/(params(18)-1)-1);
T574 = T187^(params(17)-1);
T577 = T187^(params(17)*params(19));
T579 = T187*params(17)*params(18)*T187^(params(18)-2)*T568/T562-T187*exp(params(68))*params(17)*params(18)*T574/T577;
T585 = T187^params(17);
T588 = T187^(1+params(17)*params(19));
T596 = T187*exp(params(68))*params(17)*params(18)*params(19)*T585/T588-T568*T558*T187*params(17)*params(18)*params(19)/T187^(1+(params(18)-1)*params(19));
T658 = T187^(params(19)*(params(17)-1));
T670 = T187^(params(17)-2);
T682 = T187^(1+params(19)*(params(17)-1));
T714 = exp(params(124))^params(17);
T866 = exp(params(71))^params(4);
T951 = T184*params(57)+T111*T425;
T959 = T951^2;
T961 = T111*params(125)*T425/T951-params(125)*exp(2*params(69))*exp(2*params(75))/T959;
T985 = params(126)*params(57)^2*exp(2*params(83))/T959-T184*params(57)*params(126)/T951;
T1081 = exp(params(120))^(params(16)-1);
T1148 = exp(params(106))*params(53)*exp(params(111))/T425;
T1149 = T111*exp(params(106))*(params(53)-1)-T1148;
T1198 = exp(params(106))*(params(53)-1)-T1148;
T1205 = exp(params(106))*params(53)*exp(params(111))/(T425*T1198)-exp(params(106))*params(53)*exp(params(111))*T1149/(T425*T1198^2);
residual(1) = y(8)*T25+y(11)*exp(params(76))-exp(params(73))*params(2)*y(8)*params(3)/T17-exp(params(73))*params(2)*params(3)*y(8)*params(1)/T17;
residual(2) = exp(params(82))*params(1)*y(11)+params(1)*y(18)*exp(params(82))-exp(params(82))*params(1)*y(11);
residual(3) = y(12)*exp(params(77));
residual(4) = y(6)*T79+(params(8)-1)*exp(params(76))*exp(params(67))*exp(params(90))*y(26)/exp(params(71))+(params(8)-1)*exp(params(76))*exp(params(67))*exp(params(90))*y(2)/exp(params(71))+(params(8)-1)*exp(params(76))*exp(params(67))*y(11)*exp(params(90))/exp(params(71));
residual(5) = T131+y(20)*exp(params(84))-T131+params(1)*y(18)*exp(params(82))*T130+T130*(params(9)-1)*exp(params(120))*params(1)*y(10)+T118*params(6)*params(1)*y(20)*T150+T127*T118*params(6)*params(1)*y(22)-T130*exp(params(120))*exp(params(78))*params(1)*y(13)/T111+T130*T115*exp(params(120))*params(1)*y(10)/T111-T130*T115*exp(params(120))*params(1)*y(56)/T111;
residual(6) = params(1)*y(18)*exp(params(82))*T130+T192+y(21)*exp(params(85))-T192-T130*params(1)*y(19)/T187+T150*params(6)*params(1)*y(20)*T190+T127*params(6)*params(1)*y(22)*T190+T130*(params(62)+T184)*params(1)*y(59)/(T184*T187)+T130*(params(62)+T184)*params(1)*y(19)/(T184*T187);
residual(7) = exp(params(86))*y(22)-params(1)*y(18)*exp(params(82))*T130+exp(params(82))*params(1)*y(11)*T130-exp(params(82))*params(1)*y(11)*T130-T150*exp(params(82))*params(6)*params(1)*y(20)-T127*exp(params(82))*params(6)*params(1)*y(22);
residual(8) = exp(params(84))*y(20)*params(7)-y(21)*exp(params(85));
residual(9) = y(25)*exp(params(89))-exp(params(86))*params(6)*y(22)+exp(params(84))*params(6)*y(61)*exp(params(87))*T251+T251*exp(params(87))*exp(params(84))*y(20)*params(6)*(params(125)-1)+T251*(params(125)-1)*exp(params(87))*exp(params(84))*params(6)*y(23)+(params(125)-1)*exp(params(88))*exp(params(87))*exp(params(84))*params(6)*params(7)*y(24);
residual(10) = exp(params(88))*y(24)-T184*y(43)*exp(params(107))/(T111*exp(params(106)))+T184*exp(params(107))*y(42)/(T111*exp(params(106)))+T184*y(10)*exp(params(107))/(T111*exp(params(106)))-T184*y(19)*exp(params(107))/(T111*exp(params(106)));
residual(11) = exp(params(87))*y(23)+exp(params(86))*y(22)/((params(55)-exp(params(84)))*T251*(params(125)-1))-exp(params(86))*y(61)/T311+y(20)*exp(params(84))*exp(params(86))/(T148*T251*(params(125)-1))-exp(params(88))*exp(params(86))*params(7)*y(24)/T323;
residual(12) = T111*exp(params(106))*y(42)+T111*y(10)*exp(params(106))+exp(params(87))*y(61)*exp(params(105))+(params(125)-1)*exp(params(87))*exp(params(105))*y(41)+(params(125)-1)*exp(params(87))*y(23)*exp(params(105));
residual(13) = exp(params(105))*y(41)-y(14)*exp(params(79))-y(15)*exp(params(80));
residual(14) = y(14)*exp(params(79))-exp(params(105))*params(6)*y(41)*(exp(params(82))+T251*(params(125)-1)*exp(params(87))*(exp(params(82))-exp(params(63))))/exp(x(4))+(exp(params(82))+T251*(params(125)-1)*exp(params(87))*(exp(params(82))-exp(params(63))))*exp(params(105))*params(6)*x(4)/exp(x(4))-exp(params(105))*y(18)*params(6)*(exp(params(82))+T251*(params(125)-1)*exp(params(82))*exp(params(87)))/exp(x(4))-T251*(exp(params(82))-exp(params(63)))*exp(params(87))*params(6)*y(61)*exp(params(105))/exp(x(4))+T251*(params(125)-1)*exp(params(87))*exp(params(63))*exp(params(105))*params(6)*y(16)/exp(x(4))-T251*(params(125)-1)*(exp(params(82))-exp(params(63)))*exp(params(87))*params(6)*y(23)*exp(params(105))/exp(x(4))-(params(125)-1)*(exp(params(82))-exp(params(63)))*exp(params(88))*exp(params(87))*params(6)*params(7)*y(24)*exp(params(105))/exp(x(4));
residual(15) = y(15)*exp(params(80));
residual(16) = exp(params(78))*y(13)+exp(params(90))*params(8)*y(4)*exp(params(66))/(exp(params(120))*T425)-exp(params(66))*exp(params(90))*params(8)*y(26)/(exp(params(120))*T425)-exp(params(66))*exp(params(90))*params(8)*y(1)/(exp(params(120))*T425)+exp(params(66))*exp(params(90))*params(8)*y(56)/(exp(params(120))*T425);
residual(17) = exp(params(63))*y(16)+(params(9)-1)*exp(params(120))*y(10)-exp(params(120))*exp(params(78))*y(13)/T111+T115*exp(params(120))*y(10)/T111-T115*exp(params(120))*y(56)/T111;
residual(18) = y(17)*exp(params(81))-y(19)/T187+(params(62)+T184)*y(59)/(T184*T187)+(params(62)+T184)*y(19)/(T184*T187);
residual(19) = y(31)*exp(params(95))+params(62)*y(19)/T184;
residual(20) = exp(params(66))*y(1)-y(55)*exp(params(119))*T488*T490+T490*(params(8)-1)*exp(params(119))*y(6)*exp(params(71))/T497-T488*exp(params(120))*exp(params(119))*params(8)*y(4)*T425*T504-T504*T488*exp(params(120))*exp(params(119))*T425*params(8)*y(56);
residual(21) = y(7)*params(11)+T111*y(10)-y(7)*(params(11)+params(1)*params(11))+params(11)*params(1)*y(7);
residual(22) = y(4)*T425-y(7)*exp(params(72))+(params(9)-1)*exp(params(120))*y(56)*T425+(params(9)-1)*exp(params(120))*y(4)*T425;
residual(23) = exp(params(66))*y(1)-exp(params(67))*y(3)*exp(params(68))-exp(params(67))*y(2)*exp(params(68));
residual(24) = y(3)*exp(params(68))+y(59)*T579+y(59)*T596-T585*exp(params(68))*y(3)*params(18)/T577;
residual(25) = y(27)*exp(params(91))+y(26)/exp(params(90));
residual(26) = y(28)*exp(params(92))-exp(params(67))*exp(params(90))*y(26)-exp(params(67))*exp(params(90))*y(2)-T585*exp(params(92))*params(18)*params(1)*y(28)/T577+T585*exp(params(92))*y(11)*params(1)*params(18)/T577-T585*exp(params(92))*y(11)*params(1)*params(18)/T577-T574*T187*exp(params(92))*y(59)*params(18)*params(1)*params(17)/T577+T585*T187*exp(params(92))*y(59)*params(19)*params(18)*params(1)*params(17)/T588;
residual(27) = y(29)*exp(params(93))-exp(params(67))*y(2)-T574*exp(params(93))*params(18)*params(1)*y(29)/T658+T574*y(11)*params(1)*params(18)*exp(params(93))/T658-T574*y(11)*params(1)*params(18)*exp(params(93))/T658-(params(17)-1)*T187*exp(params(93))*y(59)*params(1)*params(18)*T670/T658+(params(17)-1)*T574*T187*exp(params(93))*y(59)*params(19)*params(1)*params(18)/T682;
residual(28) = y(60)*exp(params(124))-T187*exp(params(92))*params(17)*y(28)/((params(17)-1)*exp(params(93)))+T187*exp(params(92))*params(17)*y(29)/((params(17)-1)*exp(params(93)))-T187*exp(params(92))*y(59)*params(17)/((params(17)-1)*exp(params(93)));
residual(29) = (params(17)-1)*T187*y(59)*params(18)*params(19)/T682-(params(18)-1)*(params(17)-1)*y(60)*exp(params(124))/T714-(params(17)-1)*T187*y(59)/T585;
residual(30) = y(30)*exp(params(94))-T187*y(18)*exp(params(82))-T187*exp(params(82))*y(59);
residual(31) = y(9)*exp(params(74))-exp(params(74))*y(57)*exp(params(121));
lhs =y(30);
rhs =(1-y(69))*y(53);
residual(32)= lhs-rhs;
residual(33) = y(61)-y(63)-y(61)*params(50)-y(18)*params(48)*(params(50)-1)+(params(50)-1)*y(16)*params(48);
residual(34) = y(62)-y(64)-y(62)*params(51)-y(18)*params(49)*(params(51)-1)+(params(51)-1)*y(17)*params(49);
residual(35) = exp(params(67))*y(2)-y(9)*exp(params(74))-y(7)*exp(params(72))-y(8)*exp(params(73))-T425*y(61)*params(52)-T425*params(52)*params(125)*y(4);
residual(36) = y(55)+x(1)-y(55)*params(30);
residual(37) = y(56)+x(2)-y(56)*params(28);
residual(38) = y(57)+x(3)-y(57)*params(32);
residual(39) = y(63)-x(6)-y(63)*params(37)-y(63)*params(38);
residual(40) = y(64)-x(7)-y(64)*params(42)-y(64)*params(43);
residual(41) = y(58)-x(5)-y(58)*params(47);
residual(42) = y(5)*exp(params(70))-exp(params(120))*y(4)*T425-exp(params(120))*y(56)*T425;
residual(43) = y(34)*exp(params(98))-(params(8)-1)*exp(params(67))*y(6)*exp(params(90))/exp(params(71))+(params(8)-1)*exp(params(67))*exp(params(90))*y(26)/exp(params(71))+(params(8)-1)*exp(params(67))*exp(params(90))*y(2)/exp(params(71));
residual(44) = y(54)-params(1)*y(54)-y(8)*exp(params(73))/(exp(params(73))-exp(params(73))*params(3))+exp(params(71))*y(6)*params(56)*T866+exp(params(73))*y(8)*params(3)/(exp(params(73))-exp(params(73))*params(3));
residual(45) = y(32)*exp(params(96))+(params(9)-1)*exp(params(120))*y(10)/exp(params(82))-exp(params(120))*exp(params(78))*y(13)/(exp(params(82))*T111)+T115*exp(params(120))*y(10)/(exp(params(82))*T111)+T115*y(18)*exp(params(120))/(exp(params(82))*T111)-T115*exp(params(120))*y(56)/(exp(params(82))*T111);
residual(46) = y(33)*exp(params(97))-y(19)/(exp(params(82))*T187)+y(18)*(params(62)+T184)/(T184*exp(params(82))*T187)+(params(62)+T184)*y(59)/(T184*exp(params(82))*T187)+(params(62)+T184)*y(19)/(T184*exp(params(82))*T187);
residual(47) = y(65)-T111*y(61)*T425/(exp(params(67))*4)-T111*T425*params(125)*y(4)/(exp(params(67))*4)-T111*T425*y(10)*params(125)/(exp(params(67))*4)+T111*T425*y(2)*params(125)/(exp(params(67))*4);
residual(48) = y(66)-T184*y(62)*params(57)/(exp(params(67))*4)+T184*y(2)*params(57)*params(126)/(exp(params(67))*4)-T184*y(19)*params(57)*params(126)/(exp(params(67))*4);
residual(49) = y(67)-y(4)*T961-y(10)*T961-T111*y(61)*T425/T951+T184*T111*T425*y(19)*params(125)*params(57)/T959;
residual(50) = y(68)+y(19)*T985-T184*y(62)*params(57)/T951+T184*T111*T425*y(4)*params(57)*params(126)/T959+T184*T111*T425*y(10)*params(57)*params(126)/T959;
residual(51) = y(35)*exp(params(99))+y(30)*(params(62)+exp(params(99)))/exp(params(94))-y(35)*exp(params(99))/exp(params(94));
residual(52) = y(36)*exp(params(100))+params(62)*y(35)/exp(params(99));
residual(53) = y(37)*exp(params(101))-y(31)*exp(params(95))/exp(params(100))+exp(params(95))*y(36)/exp(params(100));
residual(54) = y(39)*exp(params(103))+y(17)*(params(62)+exp(params(103)))/exp(params(81))-y(39)*exp(params(103))/exp(params(81));
residual(55) = y(38)*exp(params(102))+params(62)*y(39)/exp(params(103));
residual(56) = y(40)*exp(params(104))-T184*y(19)*params(57);
residual(57) = exp(params(106))*y(42)+y(61)*T425+(params(125)-1)*y(4)*T425-exp(params(82))*params(1)*y(18)*params(14)+exp(params(63))*params(14)*params(1)*y(16)+(exp(params(82))-exp(params(63)))*y(11)*params(1)*params(14)-(exp(params(82))-exp(params(63)))*y(11)*params(1)*params(14)+exp(params(120))*y(56)*params(58)*params(16)*T1081;
residual(58) = y(43)*exp(params(107))+y(62)*params(57)+(exp(params(82))-exp(params(63)))*y(11)*params(1)*params(7)*params(15)-(exp(params(82))-exp(params(63)))*y(11)*params(1)*params(7)*params(15)-exp(params(82))*params(15)*params(1)*y(18)*params(7)+exp(params(63))*params(15)*params(1)*params(7)*y(16);
residual(59) = exp(params(106))*y(42)-y(4)*T425+y(51)*exp(params(115));
residual(60) = y(43)*exp(params(107))+y(52)*exp(params(116));
residual(61) = exp(params(105))*y(41)+y(44)*exp(params(108))-T111*exp(params(106))*y(42)-T111*y(10)*exp(params(106))-T184*y(43)*exp(params(107))-T184*y(19)*exp(params(107));
residual(62) = y(44)*exp(params(108))-y(19)*(T184*exp(params(107))*params(53)-T184*exp(params(107))*(params(53)-1))-y(43)*(T184*exp(params(107))*params(53)-T184*exp(params(107))*(params(53)-1))+y(45)*exp(params(109))+y(42)*T1149+T111*y(10)*exp(params(106))*(params(53)-1)+exp(params(111))*exp(params(106))*y(4)*params(53)/T425-exp(params(111))*exp(params(106))*params(53)*y(47)/T425;
residual(63) = y(46)*exp(params(110))-y(44)*exp(params(108))/exp(params(109))+exp(params(108))*y(45)/exp(params(109));
residual(64) = exp(params(111))*y(47)-y(7)*exp(params(72))+(params(9)-1)*exp(params(111))*y(47);
residual(65) = (params(9)-1)*y(48)-exp(params(78))*y(13)/exp(params(112))+y(48)*(exp(params(78))-(params(9)-1)*exp(params(112)))/exp(params(112));
residual(66) = y(49)*exp(params(113))-y(4)*T1205+y(47)*T1205-T111*y(10)*exp(params(106))*(params(53)-1)/T1198;
residual(67) = y(50)*exp(params(114))+(params(53)-1)*T184*y(19);
lhs =y(53);
rhs =y(30)*params(26)+(1-params(26))*(y(59)*params(20)+y(27)*params(22));
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(69)+x(8)-y(73);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =x(8);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(70);
residual(71)= lhs-rhs;
lhs =y(72);
rhs =y(71);
residual(72)= lhs-rhs;
lhs =y(73);
rhs =y(72);
residual(73)= lhs-rhs;
lhs =y(74);
rhs =y(63);
residual(74)= lhs-rhs;
lhs =y(75);
rhs =y(64);
residual(75)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(75, 75);

  %
  % Jacobian matrix
  %

T1260 = exp(params(66))*exp(params(90))*params(8)/(exp(params(120))*T425);
T1267 = exp(params(90))*exp(params(67))*(params(8)-1)/exp(params(71));
T1327 = T184*exp(params(107))/(T111*exp(params(106)));
T1331 = exp(params(120))*T115/(exp(params(82))*T111);
T1385 = (params(62)+T184)/(T184*exp(params(82))*T187);
  g1(1,8)=T25-exp(params(73))*params(2)*params(3)/T17-exp(params(73))*params(2)*params(3)*params(1)/T17;
  g1(1,11)=exp(params(76));
  g1(2,18)=params(1)*exp(params(82));
  g1(3,12)=exp(params(77));
  g1(4,2)=T78;
  g1(4,6)=T79;
  g1(4,11)=T78;
  g1(4,26)=T78;
  g1(5,10)=T130*(params(9)-1)*params(1)*exp(params(120))+T130*T115*params(1)*exp(params(120))/T111;
  g1(5,13)=(-(T130*exp(params(120))*params(1)*exp(params(78))/T111));
  g1(5,18)=T130*params(1)*exp(params(82));
  g1(5,20)=exp(params(84))+T150*T118*params(1)*params(6);
  g1(5,22)=T127*T118*params(1)*params(6);
  g1(5,56)=(-(T130*T115*params(1)*exp(params(120))/T111));
  g1(6,18)=T130*params(1)*exp(params(82));
  g1(6,19)=(-(params(1)*T130/T187))+T130*params(1)*(params(62)+T184)/(T184*T187);
  g1(6,20)=T150*T190*params(1)*params(6);
  g1(6,21)=exp(params(85));
  g1(6,22)=T127*T190*params(1)*params(6);
  g1(6,59)=T130*params(1)*(params(62)+T184)/(T184*T187);
  g1(7,18)=(-(T130*params(1)*exp(params(82))));
  g1(7,20)=(-(T150*exp(params(82))*params(1)*params(6)));
  g1(7,22)=exp(params(86))-T127*exp(params(82))*params(1)*params(6);
  g1(8,20)=exp(params(84))*params(7);
  g1(8,21)=(-exp(params(85)));
  g1(9,20)=T251*(params(125)-1)*exp(params(87))*exp(params(84))*params(6);
  g1(9,22)=(-(params(6)*exp(params(86))));
  g1(9,23)=T251*(params(125)-1)*exp(params(87))*exp(params(84))*params(6);
  g1(9,24)=(params(125)-1)*exp(params(88))*exp(params(87))*exp(params(84))*params(6)*params(7);
  g1(9,25)=exp(params(89));
  g1(9,61)=T251*exp(params(87))*exp(params(84))*params(6);
  g1(10,10)=T1327;
  g1(10,19)=(-T1327);
  g1(10,24)=exp(params(88));
  g1(10,42)=T1327;
  g1(10,43)=(-T1327);
  g1(11,20)=exp(params(84))*exp(params(86))/(T148*T251*(params(125)-1));
  g1(11,22)=exp(params(86))/((params(55)-exp(params(84)))*T251*(params(125)-1));
  g1(11,23)=exp(params(87));
  g1(11,24)=(-(exp(params(88))*exp(params(86))*params(7)/T323));
  g1(11,61)=(-(exp(params(86))/T311));
  g1(12,10)=T111*exp(params(106));
  g1(12,23)=(params(125)-1)*exp(params(87))*exp(params(105));
  g1(12,41)=(params(125)-1)*exp(params(87))*exp(params(105));
  g1(12,42)=T111*exp(params(106));
  g1(12,61)=exp(params(87))*exp(params(105));
  g1(13,14)=(-exp(params(79)));
  g1(13,15)=(-exp(params(80)));
  g1(13,41)=exp(params(105));
  g1(14,14)=exp(params(79));
  g1(14,16)=T251*(params(125)-1)*exp(params(87))*exp(params(63))*params(6)*exp(params(105))/exp(x(4));
  g1(14,18)=(-((exp(params(82))+T251*(params(125)-1)*exp(params(82))*exp(params(87)))*params(6)*exp(params(105))/exp(x(4))));
  g1(14,23)=(-(T251*(params(125)-1)*(exp(params(82))-exp(params(63)))*exp(params(87))*params(6)*exp(params(105))/exp(x(4))));
  g1(14,24)=(-((params(125)-1)*(exp(params(82))-exp(params(63)))*exp(params(88))*exp(params(87))*params(6)*params(7)*exp(params(105))/exp(x(4))));
  g1(14,41)=(-((exp(params(82))+T251*(params(125)-1)*exp(params(87))*(exp(params(82))-exp(params(63))))*params(6)*exp(params(105))/exp(x(4))));
  g1(14,61)=(-(T251*(exp(params(82))-exp(params(63)))*exp(params(87))*params(6)*exp(params(105))/exp(x(4))));
  g1(15,15)=exp(params(80));
  g1(16,1)=(-T1260);
  g1(16,4)=T1260;
  g1(16,13)=exp(params(78));
  g1(16,26)=(-T1260);
  g1(16,56)=T1260;
  g1(17,10)=T117+exp(params(120))*(params(9)-1);
  g1(17,13)=(-(exp(params(120))*exp(params(78))/T111));
  g1(17,16)=exp(params(63));
  g1(17,56)=(-T117);
  g1(18,17)=exp(params(81));
  g1(18,19)=T189+(-(1/T187));
  g1(18,59)=T189;
  g1(19,19)=params(62)/T184;
  g1(19,31)=exp(params(95));
  g1(20,1)=exp(params(66));
  g1(20,4)=(-(T504*T488*exp(params(120))*exp(params(119))*params(8)*T425));
  g1(20,6)=T490*(params(8)-1)*exp(params(71))*exp(params(119))/T497;
  g1(20,55)=(-(T490*exp(params(119))*T488));
  g1(20,56)=(-(T504*T488*exp(params(120))*exp(params(119))*params(8)*T425));
  g1(21,7)=params(1)*params(11)+params(11)-(params(11)+params(1)*params(11));
  g1(21,10)=T111;
  g1(22,4)=T425+(params(9)-1)*exp(params(120))*T425;
  g1(22,7)=(-exp(params(72)));
  g1(22,56)=(params(9)-1)*exp(params(120))*T425;
  g1(23,1)=exp(params(66));
  g1(23,2)=(-(exp(params(67))*exp(params(68))));
  g1(23,3)=(-(exp(params(67))*exp(params(68))));
  g1(24,3)=exp(params(68))-T585*exp(params(68))*params(18)/T577;
  g1(24,59)=T579+T596;
  g1(25,26)=1/exp(params(90));
  g1(25,27)=exp(params(91));
  g1(26,2)=(-(exp(params(90))*exp(params(67))));
  g1(26,26)=(-(exp(params(90))*exp(params(67))));
  g1(26,28)=exp(params(92))-T585*exp(params(92))*params(1)*params(18)/T577;
  g1(26,59)=(-(T574*T187*exp(params(92))*params(18)*params(1)*params(17)/T577))+T585*T187*exp(params(92))*params(19)*params(18)*params(1)*params(17)/T588;
  g1(27,2)=(-exp(params(67)));
  g1(27,29)=exp(params(93))-T574*params(1)*params(18)*exp(params(93))/T658;
  g1(27,59)=(-((params(17)-1)*T670*T187*params(1)*params(18)*exp(params(93))/T658))+(params(17)-1)*T574*T187*exp(params(93))*params(19)*params(1)*params(18)/T682;
  g1(28,28)=(-(T187*params(17)*exp(params(92))/((params(17)-1)*exp(params(93)))));
  g1(28,29)=T187*params(17)*exp(params(92))/((params(17)-1)*exp(params(93)));
  g1(28,59)=(-(T187*params(17)*exp(params(92))/((params(17)-1)*exp(params(93)))));
  g1(28,60)=exp(params(124));
  g1(29,59)=(params(17)-1)*T187*params(18)*params(19)/T682-T187*(params(17)-1)/T585;
  g1(29,60)=(-((params(18)-1)*(params(17)-1)*exp(params(124))/T714));
  g1(30,18)=(-(exp(params(82))*T187));
  g1(30,30)=exp(params(94));
  g1(30,59)=(-(exp(params(82))*T187));
  g1(31,9)=exp(params(74));
  g1(31,57)=(-(exp(params(74))*exp(params(121))));
  g1(32,30)=1;
  g1(32,53)=(-(1-y(69)));
  g1(32,69)=y(53);
  g1(33,16)=params(48)*(params(50)-1);
  g1(33,18)=(-(params(48)*(params(50)-1)));
  g1(33,61)=1-params(50);
  g1(33,63)=(-1);
  g1(34,17)=params(49)*(params(51)-1);
  g1(34,18)=(-(params(49)*(params(51)-1)));
  g1(34,62)=1-params(51);
  g1(34,64)=(-1);
  g1(35,2)=exp(params(67));
  g1(35,4)=(-(T425*params(125)*params(52)));
  g1(35,7)=(-exp(params(72)));
  g1(35,8)=(-exp(params(73)));
  g1(35,9)=(-exp(params(74)));
  g1(35,61)=(-(T425*params(52)));
  g1(36,55)=1-params(30);
  g1(37,56)=1-params(28);
  g1(38,57)=1-params(32);
  g1(39,63)=1-params(37)-params(38);
  g1(40,64)=1-params(42)-params(43);
  g1(41,58)=1-params(47);
  g1(42,4)=(-(exp(params(120))*T425));
  g1(42,5)=exp(params(70));
  g1(42,56)=(-(exp(params(120))*T425));
  g1(43,2)=T1267;
  g1(43,6)=(-T1267);
  g1(43,26)=T1267;
  g1(43,34)=exp(params(98));
  g1(44,6)=T866*params(56)*exp(params(71));
  g1(44,8)=(-(exp(params(73))/(exp(params(73))-exp(params(73))*params(3))))+exp(params(73))*params(3)/(exp(params(73))-exp(params(73))*params(3));
  g1(44,54)=1-params(1);
  g1(45,10)=exp(params(120))*(params(9)-1)/exp(params(82))+T1331;
  g1(45,13)=(-(exp(params(120))*exp(params(78))/(exp(params(82))*T111)));
  g1(45,18)=T1331;
  g1(45,32)=exp(params(96));
  g1(45,56)=(-T1331);
  g1(46,18)=T1385;
  g1(46,19)=T1385+(-(1/(exp(params(82))*T187)));
  g1(46,33)=exp(params(97));
  g1(46,59)=T1385;
  g1(47,2)=T111*params(125)*T425/(exp(params(67))*4);
  g1(47,4)=(-(T111*params(125)*T425/(exp(params(67))*4)));
  g1(47,10)=(-(T111*params(125)*T425/(exp(params(67))*4)));
  g1(47,61)=(-(T111*T425/(exp(params(67))*4)));
  g1(47,65)=1;
  g1(48,2)=T184*params(57)*params(126)/(exp(params(67))*4);
  g1(48,19)=(-(T184*params(57)*params(126)/(exp(params(67))*4)));
  g1(48,62)=(-(T184*params(57)/(exp(params(67))*4)));
  g1(48,66)=1;
  g1(49,4)=(-T961);
  g1(49,10)=(-T961);
  g1(49,19)=T184*T111*T425*params(125)*params(57)/T959;
  g1(49,61)=(-(T111*T425/T951));
  g1(49,67)=1;
  g1(50,4)=T184*T111*T425*params(57)*params(126)/T959;
  g1(50,10)=T184*T111*T425*params(57)*params(126)/T959;
  g1(50,19)=T985;
  g1(50,62)=(-(T184*params(57)/T951));
  g1(50,68)=1;
  g1(51,30)=(params(62)+exp(params(99)))/exp(params(94));
  g1(51,35)=exp(params(99))-exp(params(99))/exp(params(94));
  g1(52,35)=params(62)/exp(params(99));
  g1(52,36)=exp(params(100));
  g1(53,31)=(-(exp(params(95))/exp(params(100))));
  g1(53,36)=exp(params(95))/exp(params(100));
  g1(53,37)=exp(params(101));
  g1(54,17)=(params(62)+exp(params(103)))/exp(params(81));
  g1(54,39)=exp(params(103))-exp(params(103))/exp(params(81));
  g1(55,38)=exp(params(102));
  g1(55,39)=params(62)/exp(params(103));
  g1(56,19)=(-(T184*params(57)));
  g1(56,40)=exp(params(104));
  g1(57,4)=(params(125)-1)*T425;
  g1(57,16)=exp(params(63))*params(1)*params(14);
  g1(57,18)=(-(exp(params(82))*params(1)*params(14)));
  g1(57,42)=exp(params(106));
  g1(57,56)=T1081*exp(params(120))*params(58)*params(16);
  g1(57,61)=T425;
  g1(58,16)=exp(params(63))*params(1)*params(7)*params(15);
  g1(58,18)=(-(exp(params(82))*params(1)*params(7)*params(15)));
  g1(58,43)=exp(params(107));
  g1(58,62)=params(57);
  g1(59,4)=(-T425);
  g1(59,42)=exp(params(106));
  g1(59,51)=exp(params(115));
  g1(60,43)=exp(params(107));
  g1(60,52)=exp(params(116));
  g1(61,10)=(-(T111*exp(params(106))));
  g1(61,19)=(-(T184*exp(params(107))));
  g1(61,41)=exp(params(105));
  g1(61,42)=(-(T111*exp(params(106))));
  g1(61,43)=(-(T184*exp(params(107))));
  g1(61,44)=exp(params(108));
  g1(62,4)=T1148;
  g1(62,10)=T111*exp(params(106))*(params(53)-1);
  g1(62,19)=(-(T184*exp(params(107))*params(53)-T184*exp(params(107))*(params(53)-1)));
  g1(62,42)=T1149;
  g1(62,43)=(-(T184*exp(params(107))*params(53)-T184*exp(params(107))*(params(53)-1)));
  g1(62,44)=exp(params(108));
  g1(62,45)=exp(params(109));
  g1(62,47)=(-T1148);
  g1(63,44)=(-(exp(params(108))/exp(params(109))));
  g1(63,45)=exp(params(108))/exp(params(109));
  g1(63,46)=exp(params(110));
  g1(64,7)=(-exp(params(72)));
  g1(64,47)=exp(params(111))+(params(9)-1)*exp(params(111));
  g1(65,13)=(-(exp(params(78))/exp(params(112))));
  g1(65,48)=params(9)-1+(exp(params(78))-(params(9)-1)*exp(params(112)))/exp(params(112));
  g1(66,4)=(-T1205);
  g1(66,10)=(-(T111*exp(params(106))*(params(53)-1)/T1198));
  g1(66,47)=T1205;
  g1(66,49)=exp(params(113));
  g1(67,19)=T184*(params(53)-1);
  g1(67,50)=exp(params(114));
  g1(68,27)=(-((1-params(26))*params(22)));
  g1(68,30)=(-params(26));
  g1(68,53)=1;
  g1(68,59)=(-((1-params(26))*params(20)));
  g1(69,73)=1;
  g1(70,70)=1;
  g1(71,70)=(-1);
  g1(71,71)=1;
  g1(72,71)=(-1);
  g1(72,72)=1;
  g1(73,72)=(-1);
  g1(73,73)=1;
  g1(74,63)=(-1);
  g1(74,74)=1;
  g1(75,64)=(-1);
  g1(75,75)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],75,5625);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],75,421875);
end
end
end
end
