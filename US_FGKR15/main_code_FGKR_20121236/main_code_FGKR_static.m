function [residual, g1, g2] = main_code_FGKR_static(y, x, params)
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

residual = zeros( 31, 1);

%
% Model equations
%

T15 = exp(y(27));
T17 = exp(y(2))-exp(y(2))*params(78)/T15;
T26 = (exp(y(2))*T15-exp(y(2))*params(78))^params(37);
T28 = exp(y(3))/T17^params(37)-exp(y(3))*params(78)*params(3)/T26;
T44 = exp(y(3))*params(10)*params(39)*exp(y(5))^(1+params(75));
T53 = exp(y(5))*exp(y(10))*(params(10)-1)*(1-y(23))*exp(y(25));
T62 = exp(y(6))^params(36);
T67 = exp(y(25))*T15*exp(y(10))*params(44)*exp(y(26))*T62/exp(y(25));
T70 = exp(y(25))*T15*T62/exp(y(25));
T75 = T70-params(82)*params(26)^params(36);
T89 = T15*exp(y(25))*T15*exp(y(26))*exp(y(10))*T62*params(3)*params(44)*exp(y(27)*(-params(37)))/exp(y(25));
T98 = T15^params(37);
T99 = params(3)*exp(y(10))*exp(y(15))/exp(y(6))/T98;
T125 = 1-params(8)-params(45)*(exp(y(24))-1)-params(46)/2*(exp(y(24))-1)^2;
T137 = T15*exp(y(7))/exp(y(7));
T140 = T137-params(82);
T150 = exp(y(7))*T15^2/exp(y(7));
T153 = params(79)*params(3)*T150^2;
T157 = exp(y(12))*(1-T137*params(79)*T140-params(79)*T140^2/2)+exp(y(12))*T140*T153/T98;
T166 = exp(y(6))^params(7);
T174 = y(22)*params(3)*exp(y(10))*params(11)/T166*params(6)/T98;
T195 = 1-params(9)+params(9)*exp(y(11))-exp(y(6))*params(43)*(exp(y(6))-params(26))+params(9)*params(43)*(exp(y(6))-params(26))^2/2;
T202 = T15*exp(y(26))/exp(y(26));
T203 = (1-y(22)*params(71))*params(3)*params(43)*1/T98*T202;
T204 = exp(y(6))*T203;
T205 = (exp(y(6))-params(26))*T204;
T210 = exp(y(25))/(1-params(1));
T211 = T210^(1-params(1));
T213 = (exp(y(16))/params(1))^params(1);
T219 = exp(y(24))*exp(y(8))/exp(y(5));
T223 = exp(y(25))*T15*params(1)/(1-params(1))/exp(y(16));
T230 = exp(y(8))*exp(y(16))*exp(y(24))/T15;
T236 = (exp(y(6))-params(26))^2*exp(y(26))*params(43)/2;
T243 = params(60)*(exp(y(15))/params(60))^params(42);
T248 = (exp(y(6))/params(26))^(params(41)*(1-params(42)));
T254 = (exp(y(26))/params(77))^((1-params(42))*params(47));
T263 = exp(y(15))*y(1)/exp(y(6))/T15;
T271 = exp(y(16))*exp(y(24))*y(22)*exp(y(8))/T15;
T280 = y(22)*exp(y(9))*params(11)*(-params(6))/T166/T15;
T298 = exp(y(24))*exp(y(8))/T15;
T299 = T298^params(1);
T300 = exp(y(5))^(1-params(1));
T309 = params(44)*exp(y(26))*T75^2/2;
T317 = exp(y(7))*(1-T140^2*params(79)/2);
T351 = y(1)/exp(y(26))-params(2)/params(77);
T495 = 1/exp(y(26));
T508 = T17^params(37)*T17^params(37);
T510 = getPowerDeriv(exp(y(2))*T15-exp(y(2))*params(78),params(37),1);
T538 = exp(y(6))*getPowerDeriv(exp(y(6)),params(36),1);
T546 = exp(y(25))*T15*T538/exp(y(25));
T571 = exp(y(6))*getPowerDeriv(exp(y(6)),params(7),1);
T597 = exp(y(26))*params(43)/2*exp(y(6))*2*(exp(y(6))-params(26));
T638 = (-(T300*T298*getPowerDeriv(T298,params(1),1)));
T650 = (-(params(3)*exp(y(10))*exp(y(24))*exp(y(16))*(1-y(22))/T98));
T723 = (-(params(45)*exp(y(24))))-params(46)/2*exp(y(24))*2*(exp(y(24))-1);
T759 = (-(exp(y(26))*y(1)))/(exp(y(26))*exp(y(26)));
T804 = T15*getPowerDeriv(T15,params(37),1);
lhs =T28;
rhs =exp(y(10))*(1+y(21));
residual(1)= lhs-rhs;
lhs =0;
rhs =T44-T53-T67*T75+T75*T89;
residual(2)= lhs-rhs;
lhs =exp(y(10));
rhs =T99;
residual(3)= lhs-rhs;
lhs =exp(y(10))*exp(y(16))*(1-y(22));
rhs =exp(y(12))*(params(45)+params(46)*(exp(y(24))-1));
residual(4)= lhs-rhs;
lhs =exp(y(12));
rhs =params(3)*(exp(y(12))*T125+exp(y(10))*exp(y(24))*exp(y(16))*(1-y(22)))/T98;
residual(5)= lhs-rhs;
lhs =exp(y(10));
rhs =T157+y(13);
residual(6)= lhs-rhs;
lhs =y(13);
rhs =params(3)*y(13)*(1-params(11))/T166/T98+T174;
residual(7)= lhs-rhs;
lhs =0;
rhs =(1-y(22)*params(71))*T195+T205;
residual(8)= lhs-rhs;
lhs =exp(y(11));
rhs =T211*T213;
residual(9)= lhs-rhs;
lhs =T219;
rhs =T223;
residual(10)= lhs-rhs;
lhs =y(14);
rhs =exp(y(26))-exp(y(5))*exp(y(25))-T230-params(40)-T236;
residual(11)= lhs-rhs;
lhs =exp(y(15));
rhs =T243*T248*T254*exp(x(5));
residual(12)= lhs-rhs;
lhs =y(1);
rhs =T263+exp(y(26))*y(4)-(exp(y(5))*y(23)*exp(y(25))+T271+T280+exp(y(2))*y(21)+y(22)*params(71)*y(14)+params(38)*(y(1)/params(77)-params(2)/params(77))+params(72));
residual(13)= lhs-rhs;
lhs =exp(y(26));
rhs =T299*T300-params(40);
residual(14)= lhs-rhs;
lhs =exp(y(26));
rhs =T236+exp(y(26))*y(4)+exp(y(2))+exp(y(7))+T309;
residual(15)= lhs-rhs;
lhs =exp(y(8));
rhs =T125*exp(y(8))/T15+T317;
residual(16)= lhs-rhs;
lhs =exp(y(9));
rhs =exp(y(7))+(1-params(11))*exp(y(9))/(T15*T166);
residual(17)= lhs-rhs;
lhs =y(27);
rhs =log(params(82))+x(7);
residual(18)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(50)+x(2);
residual(19)= lhs-rhs;
lhs =y(4);
rhs =(1-params(51))*params(24)+y(4)*params(51)+params(80)*params(19)*(y(26)-log(params(77)))+params(81)*params(18)*T351+exp(y(18))*x(3);
residual(20)= lhs-rhs;
lhs =y(22);
rhs =(1-params(56))*params(69)+y(22)*params(56)+(y(26)-log(params(77)))*params(80)*params(21)+T351*params(81)*params(20)+exp(y(19))*x(4);
residual(21)= lhs-rhs;
lhs =y(21);
rhs =(1-params(49))*params(68)+y(21)*params(49)+(y(26)-log(params(77)))*params(80)*params(17)+T351*params(81)*params(16)+exp(y(17))*x(1);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =(1-params(57))*params(70)+y(23)*params(57)+(y(26)-log(params(77)))*params(80)*params(23)+T351*params(81)*params(22)+exp(y(20))*x(6);
residual(23)= lhs-rhs;
lhs =y(19);
rhs =(1-params(54))*params(64)+y(19)*params(54)+(1-params(54)^2)^0.5*params(14)*x(10);
residual(24)= lhs-rhs;
lhs =y(20);
rhs =(1-params(55))*params(66)+y(20)*params(55)+(1-params(55)^2)^0.5*params(15)*x(11);
residual(25)= lhs-rhs;
lhs =y(17);
rhs =(1-params(52))*params(61)+y(17)*params(52)+(1-params(52)^2)^0.5*params(12)*x(8);
residual(26)= lhs-rhs;
lhs =y(18);
rhs =(1-params(53))*params(63)+y(18)*params(53)+(1-params(53)^2)^0.5*params(13)*x(9);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(27);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(27);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(27);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(27);
residual(31)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(31, 31);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-(exp(y(3))*T17*getPowerDeriv(T17,params(37),1)))/T508-(-(exp(y(3))*params(78)*params(3)*(exp(y(2))*T15-exp(y(2))*params(78))*T510))/(T26*T26);
  g1(1,3)=T28;
  g1(1,10)=(-(exp(y(10))*(1+y(21))));
  g1(1,21)=(-exp(y(10)));
  g1(1,27)=(-(exp(y(3))*getPowerDeriv(T17,params(37),1)*(-((-(exp(y(2))*params(78)*T15))/(T15*T15)))))/T508-(-(exp(y(3))*params(78)*params(3)*exp(y(2))*T15*T510))/(T26*T26);
  g1(2,3)=(-T44);
  g1(2,5)=(-(exp(y(3))*params(10)*params(39)*exp(y(5))*getPowerDeriv(exp(y(5)),1+params(75),1)-T53));
  g1(2,6)=(-((-(T75*exp(y(25))*T15*exp(y(10))*params(44)*exp(y(26))*T538/exp(y(25))+T67*T546))+T89*T546+T75*T15*exp(y(25))*T15*exp(y(26))*exp(y(27)*(-params(37)))*exp(y(10))*params(3)*params(44)*T538/exp(y(25))));
  g1(2,10)=(-(T75*T89+(-T53)-T67*T75));
  g1(2,23)=exp(y(25))*exp(y(5))*(-(exp(y(10))*(params(10)-1)));
  g1(2,25)=T53;
  g1(2,26)=(-(T75*T89+(-(T67*T75))));
  g1(2,27)=(-((-(T67*T75+T67*T70))+T70*T89+T75*(T89+T15*exp(y(25))*(T15*exp(y(26))*exp(y(10))*T62*params(3)*params(44)*exp(y(27)*(-params(37)))+T15*exp(y(26))*exp(y(10))*T62*params(3)*params(44)*(-params(37))*exp(y(27)*(-params(37))))/exp(y(25)))));
  g1(3,6)=(-((-(exp(y(6))*params(3)*exp(y(10))*exp(y(15))))/(exp(y(6))*exp(y(6)))/T98));
  g1(3,10)=exp(y(10))-T99;
  g1(3,15)=(-T99);
  g1(3,27)=(-((-(params(3)*exp(y(10))*exp(y(15))/exp(y(6))*T804))/(T98*T98)));
  g1(4,10)=exp(y(10))*exp(y(16))*(1-y(22));
  g1(4,12)=(-(exp(y(12))*(params(45)+params(46)*(exp(y(24))-1))));
  g1(4,16)=exp(y(10))*exp(y(16))*(1-y(22));
  g1(4,22)=(-(exp(y(10))*exp(y(16))));
  g1(4,24)=(-(exp(y(12))*params(46)*exp(y(24))));
  g1(5,10)=T650;
  g1(5,12)=exp(y(12))-params(3)*exp(y(12))*T125/T98;
  g1(5,16)=T650;
  g1(5,22)=(-(params(3)*exp(y(10))*exp(y(24))*(-exp(y(16)))/T98));
  g1(5,24)=(-(params(3)*(exp(y(10))*exp(y(24))*exp(y(16))*(1-y(22))+exp(y(12))*T723)/T98));
  g1(5,27)=(-((-(params(3)*(exp(y(12))*T125+exp(y(10))*exp(y(24))*exp(y(16))*(1-y(22)))*T804))/(T98*T98)));
  g1(6,10)=exp(y(10));
  g1(6,12)=(-T157);
  g1(6,13)=(-1);
  g1(6,27)=(-(exp(y(12))*((-(T137*params(79)*T140+T137*T137*params(79)))-params(79)*T137*2*T140/2)+(T98*exp(y(12))*(T137*T153+T140*params(79)*params(3)*exp(y(7))*T15*2*T15/exp(y(7))*2*T150)-exp(y(12))*T140*T153*T804)/(T98*T98)));
  g1(7,6)=(-((-(params(3)*y(13)*(1-params(11))*T571))/(T166*T166)/T98+params(6)*(-(y(22)*params(3)*exp(y(10))*params(11)*T571))/(T166*T166)/T98));
  g1(7,10)=(-T174);
  g1(7,13)=1-params(3)*(1-params(11))/T166/T98;
  g1(7,22)=(-(params(6)*params(3)*exp(y(10))*params(11)/T166/T98));
  g1(7,27)=(-((-(params(3)*y(13)*(1-params(11))/T166*T804))/(T98*T98)+(-(y(22)*params(3)*exp(y(10))*params(11)/T166*params(6)*T804))/(T98*T98)));
  g1(8,6)=(-((1-y(22)*params(71))*((-(exp(y(6))*params(43)*(exp(y(6))-params(26))+exp(y(6))*exp(y(6))*params(43)))+params(9)*params(43)*exp(y(6))*2*(exp(y(6))-params(26))/2)+T205+exp(y(6))*T204));
  g1(8,11)=(-((1-y(22)*params(71))*params(9)*exp(y(11))));
  g1(8,22)=(-(T195*(-params(71))+(exp(y(6))-params(26))*exp(y(6))*T202*params(3)*params(43)*1/T98*(-params(71))));
  g1(8,27)=(-((exp(y(6))-params(26))*exp(y(6))*(T203+T202*(1-y(22)*params(71))*params(3)*params(43)*(-T804)/(T98*T98))));
  g1(9,11)=exp(y(11));
  g1(9,16)=(-(T211*exp(y(16))/params(1)*getPowerDeriv(exp(y(16))/params(1),params(1),1)));
  g1(9,25)=(-(T213*T210*getPowerDeriv(T210,1-params(1),1)));
  g1(10,5)=(-(exp(y(5))*exp(y(24))*exp(y(8))))/(exp(y(5))*exp(y(5)));
  g1(10,8)=T219;
  g1(10,16)=(-((-(exp(y(16))*exp(y(25))*T15*params(1)/(1-params(1))))/(exp(y(16))*exp(y(16)))));
  g1(10,24)=T219;
  g1(10,25)=(-T223);
  g1(10,27)=(-T223);
  g1(11,5)=exp(y(5))*exp(y(25));
  g1(11,6)=T597;
  g1(11,8)=T230;
  g1(11,14)=1;
  g1(11,16)=T230;
  g1(11,24)=T230;
  g1(11,25)=exp(y(5))*exp(y(25));
  g1(11,26)=(-(exp(y(26))-T236));
  g1(11,27)=(-(T15*exp(y(8))*exp(y(16))*exp(y(24))))/(T15*T15);
  g1(12,6)=(-(exp(x(5))*T254*T243*exp(y(6))/params(26)*getPowerDeriv(exp(y(6))/params(26),params(41)*(1-params(42)),1)));
  g1(12,15)=exp(y(15))-exp(x(5))*T254*T248*params(60)*exp(y(15))/params(60)*getPowerDeriv(exp(y(15))/params(60),params(42),1);
  g1(12,26)=(-(exp(x(5))*T243*T248*exp(y(26))/params(77)*getPowerDeriv(exp(y(26))/params(77),(1-params(42))*params(47),1)));
  g1(13,1)=1-(exp(y(15))/exp(y(6))/T15-params(38)*1/params(77));
  g1(13,2)=exp(y(2))*y(21);
  g1(13,4)=(-exp(y(26)));
  g1(13,5)=exp(y(5))*y(23)*exp(y(25));
  g1(13,6)=(-((-(exp(y(6))*exp(y(15))*y(1)))/(exp(y(6))*exp(y(6)))/T15-y(22)*exp(y(9))*(-(params(11)*(-params(6))*T571))/(T166*T166)/T15));
  g1(13,8)=T271;
  g1(13,9)=T280;
  g1(13,14)=y(22)*params(71);
  g1(13,15)=(-T263);
  g1(13,16)=T271;
  g1(13,21)=exp(y(2));
  g1(13,22)=params(71)*y(14)+T230+exp(y(9))*params(11)*(-params(6))/T166/T15;
  g1(13,23)=exp(y(5))*exp(y(25));
  g1(13,24)=T271;
  g1(13,25)=exp(y(5))*y(23)*exp(y(25));
  g1(13,26)=(-(exp(y(26))*y(4)));
  g1(13,27)=(-((-(T15*exp(y(15))*y(1)/exp(y(6))))/(T15*T15)-((-(T15*exp(y(16))*exp(y(24))*y(22)*exp(y(8))))/(T15*T15)+(-(T15*y(22)*exp(y(9))*params(11)*(-params(6))/T166))/(T15*T15))));
  g1(14,5)=(-(T299*exp(y(5))*getPowerDeriv(exp(y(5)),1-params(1),1)));
  g1(14,8)=T638;
  g1(14,24)=T638;
  g1(14,26)=exp(y(26));
  g1(14,27)=(-(T300*getPowerDeriv(T298,params(1),1)*(-(T15*exp(y(24))*exp(y(8))))/(T15*T15)));
  g1(15,2)=(-exp(y(2)));
  g1(15,4)=(-exp(y(26)));
  g1(15,6)=(-(T597+params(44)*exp(y(26))*T546*2*T75/2));
  g1(15,7)=(-exp(y(7)));
  g1(15,26)=exp(y(26))-(T309+T236+exp(y(26))*y(4));
  g1(15,27)=(-(params(44)*exp(y(26))*T70*2*T75/2));
  g1(16,7)=(-T317);
  g1(16,8)=exp(y(8))-T125*exp(y(8))/T15;
  g1(16,24)=(-(exp(y(8))*T723/T15));
  g1(16,27)=(-((-(T15*T125*exp(y(8))))/(T15*T15)+exp(y(7))*(-(params(79)/2*T137*2*T140))));
  g1(17,6)=(-((-((1-params(11))*exp(y(9))*T15*T571))/(T15*T166*T15*T166)));
  g1(17,7)=(-exp(y(7)));
  g1(17,9)=exp(y(9))-(1-params(11))*exp(y(9))/(T15*T166);
  g1(17,27)=(-((-((1-params(11))*exp(y(9))*T15*T166))/(T15*T166*T15*T166)));
  g1(18,27)=1;
  g1(19,3)=1-params(50);
  g1(20,1)=(-(params(81)*params(18)*T495));
  g1(20,4)=1-params(51);
  g1(20,18)=(-(exp(y(18))*x(3)));
  g1(20,26)=(-(params(80)*params(19)+params(81)*params(18)*T759));
  g1(21,1)=(-(params(81)*params(20)*T495));
  g1(21,19)=(-(exp(y(19))*x(4)));
  g1(21,22)=1-params(56);
  g1(21,26)=(-(params(80)*params(21)+params(81)*params(20)*T759));
  g1(22,1)=(-(params(81)*params(16)*T495));
  g1(22,17)=(-(exp(y(17))*x(1)));
  g1(22,21)=1-params(49);
  g1(22,26)=(-(params(80)*params(17)+params(81)*params(16)*T759));
  g1(23,1)=(-(params(81)*params(22)*T495));
  g1(23,20)=(-(exp(y(20))*x(6)));
  g1(23,23)=1-params(57);
  g1(23,26)=(-(params(80)*params(23)+params(81)*params(22)*T759));
  g1(24,19)=1-params(54);
  g1(25,20)=1-params(55);
  g1(26,17)=1-params(52);
  g1(27,18)=1-params(53);
  g1(28,27)=(-1);
  g1(28,28)=1;
  g1(29,27)=(-1);
  g1(29,29)=1;
  g1(30,27)=(-1);
  g1(30,30)=1;
  g1(31,27)=(-1);
  g1(31,31)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],31,961);
end
end
