function [residual, g1, g2, g3] = NK_GK13_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(75, 1);
T17 = (exp(params(73))-exp(params(73))*params(3))^(1+params(2));
T25 = params(2)*exp(params(73))/T17+exp(params(73))*params(2)*params(1)*params(3)^2/T17;
T49 = exp(params(82));
T86 = exp(params(76))*exp(params(90))*exp(params(67))*(params(8)-1)/exp(params(71));
T87 = params(56)*params(4)*exp(params(71))*exp(params(71))^(params(4)-1)-T86;
T115 = exp(params(120));
T119 = exp(params(75));
T123 = exp(params(78))-T119*(params(9)-1);
T126 = T49-T115*T123/T119;
T135 = exp(params(86))+exp(params(84))*exp(params(86))/(params(55)-exp(params(84)));
T138 = 1+params(6)*T135-params(6);
T159 = (params(55)-exp(params(84)))^2;
T161 = exp(params(84))*exp(params(86))/(params(55)-exp(params(84)))+exp(params(86))*exp(2*params(84))/T159;
T198 = exp(params(83));
T201 = exp(params(123));
T203 = (params(62)+T198)/(T198*T201);
T204 = T49-T203;
T271 = 1+params(7)*exp(params(88));
T331 = (params(55)-exp(params(84)))*T271*(params(125)-1)^2;
T343 = (params(55)-exp(params(84)))*(params(125)-1)*T271^2;
T383 = T49-exp(params(63));
T390 = exp(x(it_, 4));
T454 = exp(params(69));
T522 = exp(params(71))^(1-params(8));
T524 = (T115*T454)^params(8);
T531 = exp(params(71))^params(8);
T538 = (T115*T454)^(params(8)-1);
T596 = T201^(params(18)-1);
T600 = T201^((params(18)-1)*params(19));
T606 = ((params(18)*T596/T600-1)/(params(18)-1))^(params(17)/(params(18)-1)-1);
T612 = T201^(params(17)-1);
T615 = T201^(params(17)*params(19));
T617 = T201*params(17)*params(18)*T201^(params(18)-2)*T606/T600-T201*exp(params(68))*params(17)*params(18)*T612/T615;
T624 = T201^params(17);
T627 = T201^(1+params(17)*params(19));
T635 = T201*exp(params(68))*params(17)*params(18)*params(19)*T624/T627-T606*T596*T201*params(17)*params(18)*params(19)/T201^(1+(params(18)-1)*params(19));
T704 = T201^(params(19)*(params(17)-1));
T719 = T201^(params(17)-2);
T731 = T201^(1+params(19)*(params(17)-1));
T763 = exp(params(124))^params(17);
T926 = exp(params(71))^params(4);
T1020 = T198*params(57)+T119*T454;
T1028 = T1020^2;
T1030 = T119*params(125)*T454/T1020-params(125)*exp(2*params(69))*exp(2*params(75))/T1028;
T1054 = params(126)*params(57)^2*exp(2*params(83))/T1028-T198*params(57)*params(126)/T1020;
T1156 = T115^(params(16)-1);
T1225 = exp(params(106))*params(53)*exp(params(111))/T454;
T1226 = T119*exp(params(106))*(params(53)-1)-T1225;
T1278 = exp(params(106))*(params(53)-1)-T1225;
T1285 = exp(params(106))*params(53)*exp(params(111))/(T454*T1278)-exp(params(106))*params(53)*exp(params(111))*T1226/(T454*T1278^2);
residual(1) = y(36)*T25+y(39)*exp(params(76))-exp(params(73))*params(2)*params(3)*y(4)/T17-exp(params(73))*params(2)*params(3)*params(1)*y(105)/T17;
residual(2) = params(1)*y(46)*T49-T49*params(1)*y(39)+T49*params(1)*y(107);
residual(3) = y(6)-y(39)+y(40)*exp(params(77));
residual(4) = y(34)*T87+(params(8)-1)*exp(params(76))*exp(params(67))*exp(params(90))*y(54)/exp(params(71))+(params(8)-1)*exp(params(76))*exp(params(67))*exp(params(90))*y(30)/exp(params(71))+(params(8)-1)*exp(params(76))*exp(params(67))*y(39)*exp(params(90))/exp(params(71));
residual(5) = y(48)*exp(params(84))-params(1)*y(39)*T126*T138+T138*params(1)*y(107)*T126+params(1)*y(46)*T49*T138+T138*(params(9)-1)*T115*params(1)*y(106)+T126*params(6)*params(1)*y(112)*T161+T135*T126*params(6)*params(1)*y(113)-T138*T115*exp(params(78))*params(1)*y(108)/T119+T138*T123*T115*params(1)*y(38)/T119-T138*T123*T115*params(1)*y(120)/T119;
residual(6) = params(1)*y(46)*T49*T138+y(49)*exp(params(85))-T138*params(1)*y(39)*T204+T138*params(1)*y(107)*T204-T138*params(1)*y(111)/T201+T161*params(6)*params(1)*y(112)*T204+T135*params(6)*params(1)*y(113)*T204+T138*(params(62)+T198)*params(1)*y(121)/(T198*T201)+T138*(params(62)+T198)*params(1)*y(47)/(T198*T201);
residual(7) = exp(params(86))*y(50)-params(1)*y(46)*T49*T138+T49*params(1)*y(39)*T138-T49*params(1)*y(107)*T138-T161*T49*params(6)*params(1)*y(112)-T135*T49*params(6)*params(1)*y(113);
residual(8) = exp(params(84))*y(48)*params(7)-y(49)*exp(params(85));
residual(9) = y(53)*exp(params(89))-exp(params(86))*params(6)*y(50)+exp(params(84))*params(6)*y(89)*exp(params(87))*T271+T271*exp(params(87))*exp(params(84))*y(48)*params(6)*(params(125)-1)+T271*(params(125)-1)*exp(params(87))*exp(params(84))*params(6)*y(51)+(params(125)-1)*exp(params(88))*exp(params(87))*exp(params(84))*params(6)*params(7)*y(52);
residual(10) = exp(params(88))*y(52)-T198*y(71)*exp(params(107))/(T119*exp(params(106)))+T198*exp(params(107))*y(70)/(T119*exp(params(106)))+T198*y(38)*exp(params(107))/(T119*exp(params(106)))-T198*y(47)*exp(params(107))/(T119*exp(params(106)));
residual(11) = exp(params(87))*y(51)+exp(params(86))*y(50)/((params(55)-exp(params(84)))*T271*(params(125)-1))-exp(params(86))*y(89)/T331+y(48)*exp(params(84))*exp(params(86))/(T159*T271*(params(125)-1))-exp(params(88))*exp(params(86))*params(7)*y(52)/T343;
residual(12) = T119*exp(params(106))*y(70)+T119*y(38)*exp(params(106))+exp(params(87))*y(89)*exp(params(105))+(params(125)-1)*exp(params(87))*exp(params(105))*y(69)+(params(125)-1)*exp(params(87))*y(51)*exp(params(105));
residual(13) = exp(params(105))*y(69)-y(42)*exp(params(79))-y(43)*exp(params(80));
residual(14) = y(42)*exp(params(79))-exp(params(105))*params(6)*y(12)*(T49+T271*(params(125)-1)*exp(params(87))*T383)/T390+(T49+T271*(params(125)-1)*exp(params(87))*T383)*exp(params(105))*params(6)*x(it_, 4)/T390-exp(params(105))*params(6)*y(7)*(T49+T271*(params(125)-1)*T49*exp(params(87)))/T390-T271*T383*exp(params(87))*exp(params(105))*params(6)*y(19)/T390+T271*(params(125)-1)*exp(params(87))*exp(params(63))*exp(params(105))*params(6)*y(44)/T390-T271*(params(125)-1)*T383*exp(params(87))*exp(params(105))*params(6)*y(9)/T390-(params(125)-1)*T383*exp(params(88))*exp(params(87))*exp(params(105))*params(6)*params(7)*y(10)/T390;
residual(15) = y(43)*exp(params(80));
residual(16) = exp(params(78))*y(41)+exp(params(90))*params(8)*y(2)*exp(params(66))/(T115*T454)-exp(params(66))*exp(params(90))*params(8)*y(54)/(T115*T454)-exp(params(66))*exp(params(90))*params(8)*y(29)/(T115*T454)+exp(params(66))*exp(params(90))*params(8)*y(84)/(T115*T454);
residual(17) = exp(params(63))*y(44)+(params(9)-1)*T115*y(38)-T115*exp(params(78))*y(41)/T119+T123*T115*y(5)/T119-T123*T115*y(84)/T119;
residual(18) = y(45)*exp(params(81))-y(47)/T201+(params(62)+T198)*y(87)/(T198*T201)+(params(62)+T198)*y(8)/(T198*T201);
residual(19) = y(59)*exp(params(95))+params(62)*y(47)/T198;
residual(20) = exp(params(66))*y(29)-y(83)*exp(params(119))*T522*T524+T524*(params(8)-1)*exp(params(119))*y(34)*exp(params(71))/T531-T522*T115*exp(params(119))*params(8)*y(2)*T454*T538-T538*T522*T115*exp(params(119))*T454*params(8)*y(84);
residual(21) = y(3)*params(11)+T119*y(38)-y(35)*(params(11)+params(1)*params(11))+params(11)*params(1)*y(104);
residual(22) = T454*y(32)-y(35)*exp(params(72))+(params(9)-1)*T115*T454*y(84)+(params(9)-1)*T115*y(2)*T454;
residual(23) = exp(params(66))*y(29)-exp(params(67))*y(31)*exp(params(68))-exp(params(67))*y(30)*exp(params(68));
residual(24) = y(31)*exp(params(68))+y(87)*T617+y(18)*T635-T624*exp(params(68))*params(18)*y(1)/T615;
residual(25) = y(55)*exp(params(91))+y(54)/exp(params(90));
residual(26) = y(56)*exp(params(92))-exp(params(67))*exp(params(90))*y(54)-exp(params(67))*exp(params(90))*y(30)-T624*exp(params(92))*params(18)*params(1)*y(114)/T615+T624*exp(params(92))*y(39)*params(1)*params(18)/T615-T624*exp(params(92))*y(107)*params(1)*params(18)/T615-T612*T201*exp(params(92))*y(121)*params(18)*params(1)*params(17)/T615+T624*T201*exp(params(92))*y(87)*params(19)*params(18)*params(1)*params(17)/T627;
residual(27) = y(57)*exp(params(93))-exp(params(67))*y(30)-T612*exp(params(93))*params(18)*params(1)*y(115)/T704+T612*y(39)*params(1)*params(18)*exp(params(93))/T704-T612*y(107)*params(1)*params(18)*exp(params(93))/T704-(params(17)-1)*T201*exp(params(93))*y(121)*params(1)*params(18)*T719/T704+(params(17)-1)*T612*T201*exp(params(93))*y(87)*params(19)*params(1)*params(18)/T731;
residual(28) = y(88)*exp(params(124))-T201*exp(params(92))*params(17)*y(56)/((params(17)-1)*exp(params(93)))+T201*exp(params(92))*params(17)*y(57)/((params(17)-1)*exp(params(93)))-T201*exp(params(92))*y(87)*params(17)/((params(17)-1)*exp(params(93)));
residual(29) = (params(17)-1)*T201*y(18)*params(18)*params(19)/T731-(params(18)-1)*(params(17)-1)*y(88)*exp(params(124))/T763-(params(17)-1)*T201*y(87)/T624;
residual(30) = y(58)*exp(params(94))-T201*y(46)*T49-T201*T49*y(121);
residual(31) = y(37)*exp(params(74))-exp(params(74))*y(85)*exp(params(121));
lhs =y(58);
rhs =(1-y(97))*y(81);
residual(32)= lhs-rhs;
residual(33) = y(89)-y(91)-y(19)*params(50)-y(46)*params(48)*(params(50)-1)+(params(50)-1)*params(48)*y(109);
residual(34) = y(90)-y(92)-y(20)*params(51)-y(46)*params(49)*(params(51)-1)+(params(51)-1)*params(49)*y(110);
residual(35) = exp(params(67))*y(30)-y(37)*exp(params(74))-y(35)*exp(params(72))-y(36)*exp(params(73))-T454*y(89)*params(52)-T454*params(52)*params(125)*y(32);
residual(36) = y(83)+x(it_, 1)-y(14)*params(30);
residual(37) = y(84)+x(it_, 2)-y(15)*params(28);
residual(38) = y(85)+x(it_, 3)-y(16)*params(32);
residual(39) = y(91)-x(it_, 6)-params(37)*y(21)-params(38)*y(27);
residual(40) = y(92)-x(it_, 7)-params(42)*y(22)-params(43)*y(28);
residual(41) = y(86)-x(it_, 5)-params(47)*y(17);
residual(42) = y(33)*exp(params(70))-T115*y(2)*T454-T115*T454*y(84);
residual(43) = y(62)*exp(params(98))-(params(8)-1)*exp(params(67))*y(34)*exp(params(90))/exp(params(71))+(params(8)-1)*exp(params(67))*exp(params(90))*y(54)/exp(params(71))+(params(8)-1)*exp(params(67))*exp(params(90))*y(30)/exp(params(71));
residual(44) = y(82)-params(1)*y(119)-y(36)*exp(params(73))/(exp(params(73))-exp(params(73))*params(3))+exp(params(71))*y(34)*params(56)*T926+exp(params(73))*params(3)*y(4)/(exp(params(73))-exp(params(73))*params(3));
residual(45) = y(60)*exp(params(96))+(params(9)-1)*T115*y(106)/T49-T115*exp(params(78))*y(108)/(T49*T119)+T123*T115*y(38)/(T49*T119)+T123*y(46)*T115/(T49*T119)-T123*T115*y(120)/(T49*T119);
residual(46) = y(61)*exp(params(97))-y(111)/(T49*T201)+y(46)*(params(62)+T198)/(T198*T49*T201)+(params(62)+T198)*y(121)/(T198*T49*T201)+(params(62)+T198)*y(47)/(T198*T49*T201);
residual(47) = y(93)-T119*y(89)*T454/(exp(params(67))*4)-T119*T454*params(125)*y(32)/(exp(params(67))*4)-T119*T454*y(38)*params(125)/(exp(params(67))*4)+T119*T454*y(30)*params(125)/(exp(params(67))*4);
residual(48) = y(94)-T198*y(90)*params(57)/(exp(params(67))*4)+T198*y(30)*params(57)*params(126)/(exp(params(67))*4)-T198*y(47)*params(57)*params(126)/(exp(params(67))*4);
residual(49) = y(95)-y(32)*T1030-y(38)*T1030-T119*y(89)*T454/T1020+T198*T119*T454*y(47)*params(125)*params(57)/T1028;
residual(50) = y(96)+y(47)*T1054-T198*y(90)*params(57)/T1020+T198*T119*T454*y(32)*params(57)*params(126)/T1028+T198*T119*T454*y(38)*params(57)*params(126)/T1028;
residual(51) = y(63)*exp(params(99))+y(58)*(params(62)+exp(params(99)))/exp(params(94))-exp(params(99))*y(116)/exp(params(94));
residual(52) = y(64)*exp(params(100))+params(62)*y(63)/exp(params(99));
residual(53) = y(65)*exp(params(101))-y(59)*exp(params(95))/exp(params(100))+exp(params(95))*y(64)/exp(params(100));
residual(54) = y(67)*exp(params(103))+y(45)*(params(62)+exp(params(103)))/exp(params(81))-exp(params(103))*y(117)/exp(params(81));
residual(55) = y(66)*exp(params(102))+params(62)*y(67)/exp(params(103));
residual(56) = y(68)*exp(params(104))-T198*y(47)*params(57);
residual(57) = exp(params(106))*y(70)+y(89)*T454+(params(125)-1)*T454*y(32)-T49*params(1)*y(46)*params(14)+exp(params(63))*params(14)*params(1)*y(109)+T383*y(39)*params(1)*params(14)-T383*y(107)*params(1)*params(14)+T115*y(84)*params(58)*params(16)*T1156;
residual(58) = y(71)*exp(params(107))+y(90)*params(57)+T383*y(39)*params(1)*params(7)*params(15)-T383*y(107)*params(1)*params(7)*params(15)-T49*params(15)*params(1)*y(46)*params(7)+exp(params(63))*params(15)*params(1)*params(7)*y(109);
residual(59) = exp(params(106))*y(70)-T454*y(32)+y(79)*exp(params(115));
residual(60) = y(71)*exp(params(107))+y(80)*exp(params(116));
residual(61) = exp(params(105))*y(69)+y(72)*exp(params(108))-T119*exp(params(106))*y(70)-T119*y(38)*exp(params(106))-T198*y(71)*exp(params(107))-T198*y(47)*exp(params(107));
residual(62) = y(72)*exp(params(108))-y(47)*(T198*exp(params(107))*params(53)-T198*exp(params(107))*(params(53)-1))-y(71)*(T198*exp(params(107))*params(53)-T198*exp(params(107))*(params(53)-1))+y(73)*exp(params(109))+y(70)*T1226+T119*y(38)*exp(params(106))*(params(53)-1)+exp(params(111))*exp(params(106))*y(32)*params(53)/T454-exp(params(111))*exp(params(106))*params(53)*y(75)/T454;
residual(63) = y(74)*exp(params(110))-y(72)*exp(params(108))/exp(params(109))+exp(params(108))*y(73)/exp(params(109));
residual(64) = exp(params(111))*y(75)-y(35)*exp(params(72))+(params(9)-1)*exp(params(111))*y(13);
residual(65) = (params(9)-1)*y(118)-exp(params(78))*y(108)/exp(params(112))+y(76)*(exp(params(78))-(params(9)-1)*exp(params(112)))/exp(params(112));
residual(66) = y(77)*exp(params(113))-y(32)*T1285+y(75)*T1285-T119*y(38)*exp(params(106))*(params(53)-1)/T1278;
residual(67) = y(78)*exp(params(114))+(params(53)-1)*T198*y(47);
lhs =y(81);
rhs =params(26)*y(11)+(1-params(26))*(y(87)*params(20)+y(55)*params(22));
residual(68)= lhs-rhs;
lhs =y(97);
rhs =y(23)+x(it_, 8)-y(101);
residual(69)= lhs-rhs;
lhs =y(98);
rhs =x(it_-1, 8);
residual(70)= lhs-rhs;
lhs =y(99);
rhs =y(24);
residual(71)= lhs-rhs;
lhs =y(100);
rhs =y(25);
residual(72)= lhs-rhs;
lhs =y(101);
rhs =y(26);
residual(73)= lhs-rhs;
lhs =y(102);
rhs =y(21);
residual(74)= lhs-rhs;
lhs =y(103);
rhs =y(22);
residual(75)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(75, 129);

  %
  % Jacobian matrix
  %

T1344 = exp(params(66))*exp(params(90))*params(8)/(T115*T454);
T1351 = exp(params(90))*exp(params(67))*(params(8)-1)/exp(params(71));
T1405 = T198*exp(params(107))/(T119*exp(params(106)));
T1407 = T115*T123/(T49*T119);
T1467 = (params(62)+T198)/(T198*T49*T201);
  g1(1,4)=(-(exp(params(73))*params(2)*params(3)/T17));
  g1(1,36)=T25;
  g1(1,105)=(-(exp(params(73))*params(2)*params(3)*params(1)/T17));
  g1(1,39)=exp(params(76));
  g1(2,39)=(-(params(1)*T49));
  g1(2,107)=params(1)*T49;
  g1(2,46)=params(1)*T49;
  g1(3,6)=1;
  g1(3,39)=(-1);
  g1(3,40)=exp(params(77));
  g1(4,30)=T86;
  g1(4,34)=T87;
  g1(4,39)=T86;
  g1(4,54)=T86;
  g1(5,38)=T138*T123*params(1)*T115/T119;
  g1(5,106)=T138*(params(9)-1)*params(1)*T115;
  g1(5,39)=(-(T138*params(1)*T126));
  g1(5,107)=T138*params(1)*T126;
  g1(5,108)=(-(T138*T115*params(1)*exp(params(78))/T119));
  g1(5,46)=T138*params(1)*T49;
  g1(5,48)=exp(params(84));
  g1(5,112)=T161*T126*params(1)*params(6);
  g1(5,113)=T135*T126*params(1)*params(6);
  g1(5,120)=(-(T138*T123*params(1)*T115/T119));
  g1(6,39)=(-(T138*params(1)*T204));
  g1(6,107)=T138*params(1)*T204;
  g1(6,46)=T138*params(1)*T49;
  g1(6,47)=T138*params(1)*(params(62)+T198)/(T198*T201);
  g1(6,111)=(-(params(1)*T138/T201));
  g1(6,112)=T161*T204*params(1)*params(6);
  g1(6,49)=exp(params(85));
  g1(6,113)=T135*T204*params(1)*params(6);
  g1(6,121)=T138*params(1)*(params(62)+T198)/(T198*T201);
  g1(7,39)=T138*params(1)*T49;
  g1(7,107)=(-(T138*params(1)*T49));
  g1(7,46)=(-(T138*params(1)*T49));
  g1(7,112)=(-(T161*T49*params(1)*params(6)));
  g1(7,50)=exp(params(86));
  g1(7,113)=(-(T135*T49*params(1)*params(6)));
  g1(8,48)=exp(params(84))*params(7);
  g1(8,49)=(-exp(params(85)));
  g1(9,48)=T271*(params(125)-1)*exp(params(87))*exp(params(84))*params(6);
  g1(9,50)=(-(params(6)*exp(params(86))));
  g1(9,51)=T271*(params(125)-1)*exp(params(87))*exp(params(84))*params(6);
  g1(9,52)=(params(125)-1)*exp(params(88))*exp(params(87))*exp(params(84))*params(6)*params(7);
  g1(9,53)=exp(params(89));
  g1(9,89)=T271*exp(params(87))*exp(params(84))*params(6);
  g1(10,38)=T1405;
  g1(10,47)=(-T1405);
  g1(10,52)=exp(params(88));
  g1(10,70)=T1405;
  g1(10,71)=(-T1405);
  g1(11,48)=exp(params(84))*exp(params(86))/(T159*T271*(params(125)-1));
  g1(11,50)=exp(params(86))/((params(55)-exp(params(84)))*T271*(params(125)-1));
  g1(11,51)=exp(params(87));
  g1(11,52)=(-(exp(params(88))*exp(params(86))*params(7)/T343));
  g1(11,89)=(-(exp(params(86))/T331));
  g1(12,38)=T119*exp(params(106));
  g1(12,51)=(params(125)-1)*exp(params(87))*exp(params(105));
  g1(12,69)=(params(125)-1)*exp(params(87))*exp(params(105));
  g1(12,70)=T119*exp(params(106));
  g1(12,89)=exp(params(87))*exp(params(105));
  g1(13,42)=(-exp(params(79)));
  g1(13,43)=(-exp(params(80)));
  g1(13,69)=exp(params(105));
  g1(14,42)=exp(params(79));
  g1(14,44)=T271*(params(125)-1)*exp(params(87))*exp(params(63))*params(6)*exp(params(105))/T390;
  g1(14,7)=(-((T49+T271*(params(125)-1)*T49*exp(params(87)))*params(6)*exp(params(105))/T390));
  g1(14,9)=(-(T271*(params(125)-1)*T383*exp(params(87))*params(6)*exp(params(105))/T390));
  g1(14,10)=(-((params(125)-1)*T383*exp(params(88))*exp(params(87))*params(6)*params(7)*exp(params(105))/T390));
  g1(14,12)=(-((T49+T271*(params(125)-1)*exp(params(87))*T383)*params(6)*exp(params(105))/T390));
  g1(14,19)=(-(T271*T383*exp(params(87))*params(6)*exp(params(105))/T390));
  g1(14,125)=(-((-(exp(params(105))*params(6)*y(12)*(T49+T271*(params(125)-1)*exp(params(87))*T383)*T390))/(T390*T390)))+(T390*(T49+T271*(params(125)-1)*exp(params(87))*T383)*params(6)*exp(params(105))-T390*(T49+T271*(params(125)-1)*exp(params(87))*T383)*exp(params(105))*params(6)*x(it_, 4))/(T390*T390)-(-(T390*exp(params(105))*params(6)*y(7)*(T49+T271*(params(125)-1)*T49*exp(params(87)))))/(T390*T390)-(-(T390*T271*T383*exp(params(87))*exp(params(105))*params(6)*y(19)))/(T390*T390)+(-(T390*T271*(params(125)-1)*exp(params(87))*exp(params(63))*exp(params(105))*params(6)*y(44)))/(T390*T390)-(-(T390*T271*(params(125)-1)*T383*exp(params(87))*exp(params(105))*params(6)*y(9)))/(T390*T390)-(-(T390*(params(125)-1)*T383*exp(params(88))*exp(params(87))*exp(params(105))*params(6)*params(7)*y(10)))/(T390*T390);
  g1(15,43)=exp(params(80));
  g1(16,29)=(-T1344);
  g1(16,2)=T1344;
  g1(16,41)=exp(params(78));
  g1(16,54)=(-T1344);
  g1(16,84)=T1344;
  g1(17,5)=T115*T123/T119;
  g1(17,38)=T115*(params(9)-1);
  g1(17,41)=(-(T115*exp(params(78))/T119));
  g1(17,44)=exp(params(63));
  g1(17,84)=(-(T115*T123/T119));
  g1(18,45)=exp(params(81));
  g1(18,8)=T203;
  g1(18,47)=(-(1/T201));
  g1(18,87)=T203;
  g1(19,47)=params(62)/T198;
  g1(19,59)=exp(params(95));
  g1(20,29)=exp(params(66));
  g1(20,2)=(-(T538*T522*T115*exp(params(119))*params(8)*T454));
  g1(20,34)=T524*(params(8)-1)*exp(params(71))*exp(params(119))/T531;
  g1(20,83)=(-(T524*exp(params(119))*T522));
  g1(20,84)=(-(T538*T522*T115*exp(params(119))*params(8)*T454));
  g1(21,3)=params(11);
  g1(21,35)=(-(params(11)+params(1)*params(11)));
  g1(21,104)=params(1)*params(11);
  g1(21,38)=T119;
  g1(22,2)=(params(9)-1)*T115*T454;
  g1(22,32)=T454;
  g1(22,35)=(-exp(params(72)));
  g1(22,84)=(params(9)-1)*T115*T454;
  g1(23,29)=exp(params(66));
  g1(23,30)=(-(exp(params(67))*exp(params(68))));
  g1(23,31)=(-(exp(params(67))*exp(params(68))));
  g1(24,1)=(-(T624*exp(params(68))*params(18)/T615));
  g1(24,31)=exp(params(68));
  g1(24,18)=T635;
  g1(24,87)=T617;
  g1(25,54)=1/exp(params(90));
  g1(25,55)=exp(params(91));
  g1(26,30)=(-(exp(params(90))*exp(params(67))));
  g1(26,39)=T624*exp(params(92))*params(1)*params(18)/T615;
  g1(26,107)=(-(T624*exp(params(92))*params(1)*params(18)/T615));
  g1(26,54)=(-(exp(params(90))*exp(params(67))));
  g1(26,56)=exp(params(92));
  g1(26,114)=(-(T624*exp(params(92))*params(1)*params(18)/T615));
  g1(26,87)=T624*T201*exp(params(92))*params(19)*params(18)*params(1)*params(17)/T627;
  g1(26,121)=(-(T612*T201*exp(params(92))*params(18)*params(1)*params(17)/T615));
  g1(27,30)=(-exp(params(67)));
  g1(27,39)=T612*params(1)*params(18)*exp(params(93))/T704;
  g1(27,107)=(-(T612*params(1)*params(18)*exp(params(93))/T704));
  g1(27,57)=exp(params(93));
  g1(27,115)=(-(T612*params(1)*params(18)*exp(params(93))/T704));
  g1(27,87)=(params(17)-1)*T612*T201*exp(params(93))*params(19)*params(1)*params(18)/T731;
  g1(27,121)=(-((params(17)-1)*T719*T201*params(1)*params(18)*exp(params(93))/T704));
  g1(28,56)=(-(T201*params(17)*exp(params(92))/((params(17)-1)*exp(params(93)))));
  g1(28,57)=T201*params(17)*exp(params(92))/((params(17)-1)*exp(params(93)));
  g1(28,87)=(-(T201*params(17)*exp(params(92))/((params(17)-1)*exp(params(93)))));
  g1(28,88)=exp(params(124));
  g1(29,18)=(params(17)-1)*T201*params(18)*params(19)/T731;
  g1(29,87)=(-(T201*(params(17)-1)/T624));
  g1(29,88)=(-((params(18)-1)*(params(17)-1)*exp(params(124))/T763));
  g1(30,46)=(-(T49*T201));
  g1(30,58)=exp(params(94));
  g1(30,121)=(-(T49*T201));
  g1(31,37)=exp(params(74));
  g1(31,85)=(-(exp(params(74))*exp(params(121))));
  g1(32,58)=1;
  g1(32,81)=(-(1-y(97)));
  g1(32,97)=y(81);
  g1(33,109)=params(48)*(params(50)-1);
  g1(33,46)=(-(params(48)*(params(50)-1)));
  g1(33,19)=(-params(50));
  g1(33,89)=1;
  g1(33,91)=(-1);
  g1(34,110)=params(49)*(params(51)-1);
  g1(34,46)=(-(params(49)*(params(51)-1)));
  g1(34,20)=(-params(51));
  g1(34,90)=1;
  g1(34,92)=(-1);
  g1(35,30)=exp(params(67));
  g1(35,32)=(-(T454*params(125)*params(52)));
  g1(35,35)=(-exp(params(72)));
  g1(35,36)=(-exp(params(73)));
  g1(35,37)=(-exp(params(74)));
  g1(35,89)=(-(T454*params(52)));
  g1(36,14)=(-params(30));
  g1(36,83)=1;
  g1(36,122)=1;
  g1(37,15)=(-params(28));
  g1(37,84)=1;
  g1(37,123)=1;
  g1(38,16)=(-params(32));
  g1(38,85)=1;
  g1(38,124)=1;
  g1(39,21)=(-params(37));
  g1(39,91)=1;
  g1(39,127)=(-1);
  g1(39,27)=(-params(38));
  g1(40,22)=(-params(42));
  g1(40,92)=1;
  g1(40,128)=(-1);
  g1(40,28)=(-params(43));
  g1(41,17)=(-params(47));
  g1(41,86)=1;
  g1(41,126)=(-1);
  g1(42,2)=(-(T115*T454));
  g1(42,33)=exp(params(70));
  g1(42,84)=(-(T115*T454));
  g1(43,30)=T1351;
  g1(43,34)=(-T1351);
  g1(43,54)=T1351;
  g1(43,62)=exp(params(98));
  g1(44,34)=T926*params(56)*exp(params(71));
  g1(44,4)=exp(params(73))*params(3)/(exp(params(73))-exp(params(73))*params(3));
  g1(44,36)=(-(exp(params(73))/(exp(params(73))-exp(params(73))*params(3))));
  g1(44,82)=1;
  g1(44,119)=(-params(1));
  g1(45,38)=T1407;
  g1(45,106)=T115*(params(9)-1)/T49;
  g1(45,108)=(-(T115*exp(params(78))/(T49*T119)));
  g1(45,46)=T1407;
  g1(45,60)=exp(params(96));
  g1(45,120)=(-T1407);
  g1(46,46)=T1467;
  g1(46,47)=T1467;
  g1(46,111)=(-(1/(T49*T201)));
  g1(46,61)=exp(params(97));
  g1(46,121)=T1467;
  g1(47,30)=T119*params(125)*T454/(exp(params(67))*4);
  g1(47,32)=(-(T119*params(125)*T454/(exp(params(67))*4)));
  g1(47,38)=(-(T119*params(125)*T454/(exp(params(67))*4)));
  g1(47,89)=(-(T119*T454/(exp(params(67))*4)));
  g1(47,93)=1;
  g1(48,30)=T198*params(57)*params(126)/(exp(params(67))*4);
  g1(48,47)=(-(T198*params(57)*params(126)/(exp(params(67))*4)));
  g1(48,90)=(-(T198*params(57)/(exp(params(67))*4)));
  g1(48,94)=1;
  g1(49,32)=(-T1030);
  g1(49,38)=(-T1030);
  g1(49,47)=T198*T119*T454*params(125)*params(57)/T1028;
  g1(49,89)=(-(T119*T454/T1020));
  g1(49,95)=1;
  g1(50,32)=T198*T119*T454*params(57)*params(126)/T1028;
  g1(50,38)=T198*T119*T454*params(57)*params(126)/T1028;
  g1(50,47)=T1054;
  g1(50,90)=(-(T198*params(57)/T1020));
  g1(50,96)=1;
  g1(51,58)=(params(62)+exp(params(99)))/exp(params(94));
  g1(51,63)=exp(params(99));
  g1(51,116)=(-(exp(params(99))/exp(params(94))));
  g1(52,63)=params(62)/exp(params(99));
  g1(52,64)=exp(params(100));
  g1(53,59)=(-(exp(params(95))/exp(params(100))));
  g1(53,64)=exp(params(95))/exp(params(100));
  g1(53,65)=exp(params(101));
  g1(54,45)=(params(62)+exp(params(103)))/exp(params(81));
  g1(54,67)=exp(params(103));
  g1(54,117)=(-(exp(params(103))/exp(params(81))));
  g1(55,66)=exp(params(102));
  g1(55,67)=params(62)/exp(params(103));
  g1(56,47)=(-(T198*params(57)));
  g1(56,68)=exp(params(104));
  g1(57,32)=(params(125)-1)*T454;
  g1(57,39)=T383*params(1)*params(14);
  g1(57,107)=(-(T383*params(1)*params(14)));
  g1(57,109)=exp(params(63))*params(1)*params(14);
  g1(57,46)=(-(T49*params(1)*params(14)));
  g1(57,70)=exp(params(106));
  g1(57,84)=T1156*T115*params(58)*params(16);
  g1(57,89)=T454;
  g1(58,39)=T383*params(1)*params(7)*params(15);
  g1(58,107)=(-(T383*params(1)*params(7)*params(15)));
  g1(58,109)=exp(params(63))*params(1)*params(7)*params(15);
  g1(58,46)=(-(T49*params(1)*params(7)*params(15)));
  g1(58,71)=exp(params(107));
  g1(58,90)=params(57);
  g1(59,32)=(-T454);
  g1(59,70)=exp(params(106));
  g1(59,79)=exp(params(115));
  g1(60,71)=exp(params(107));
  g1(60,80)=exp(params(116));
  g1(61,38)=(-(T119*exp(params(106))));
  g1(61,47)=(-(T198*exp(params(107))));
  g1(61,69)=exp(params(105));
  g1(61,70)=(-(T119*exp(params(106))));
  g1(61,71)=(-(T198*exp(params(107))));
  g1(61,72)=exp(params(108));
  g1(62,32)=T1225;
  g1(62,38)=T119*exp(params(106))*(params(53)-1);
  g1(62,47)=(-(T198*exp(params(107))*params(53)-T198*exp(params(107))*(params(53)-1)));
  g1(62,70)=T1226;
  g1(62,71)=(-(T198*exp(params(107))*params(53)-T198*exp(params(107))*(params(53)-1)));
  g1(62,72)=exp(params(108));
  g1(62,73)=exp(params(109));
  g1(62,75)=(-T1225);
  g1(63,72)=(-(exp(params(108))/exp(params(109))));
  g1(63,73)=exp(params(108))/exp(params(109));
  g1(63,74)=exp(params(110));
  g1(64,35)=(-exp(params(72)));
  g1(64,13)=(params(9)-1)*exp(params(111));
  g1(64,75)=exp(params(111));
  g1(65,108)=(-(exp(params(78))/exp(params(112))));
  g1(65,76)=(exp(params(78))-(params(9)-1)*exp(params(112)))/exp(params(112));
  g1(65,118)=params(9)-1;
  g1(66,32)=(-T1285);
  g1(66,38)=(-(T119*exp(params(106))*(params(53)-1)/T1278));
  g1(66,75)=T1285;
  g1(66,77)=exp(params(113));
  g1(67,47)=T198*(params(53)-1);
  g1(67,78)=exp(params(114));
  g1(68,55)=(-((1-params(26))*params(22)));
  g1(68,11)=(-params(26));
  g1(68,81)=1;
  g1(68,87)=(-((1-params(26))*params(20)));
  g1(69,23)=(-1);
  g1(69,97)=1;
  g1(69,101)=1;
  g1(69,129)=(-1);
  g1(70,98)=1;
  g1(70,129)=(-1);
  g1(71,24)=(-1);
  g1(71,99)=1;
  g1(72,25)=(-1);
  g1(72,100)=1;
  g1(73,26)=(-1);
  g1(73,101)=1;
  g1(74,21)=(-1);
  g1(74,102)=1;
  g1(75,22)=(-1);
  g1(75,103)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],75,16641);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],75,2146689);
end
end
end
end
