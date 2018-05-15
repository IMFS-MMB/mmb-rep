function [residual, g1, g2, g3] = NK_ET14_rep_static(y, x, params)
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

residual = zeros( 61, 1);

%
% Model equations
%

T16 = y(5)^(-1);
T42 = y(6)^params(3);
T44 = y(2)^params(2);
T50 = y(5)^(y(23)-1);
T54 = (1-params(6)*T50)/(1-params(6));
T63 = (y(13)/y(14))^((y(23)-1)/(1+y(23)*(params(5)-1)));
T65 = y(2)^(-params(2));
T66 = y(7)*T65;
T74 = y(23)*params(5)/(y(23)-1);
T76 = T42*y(12)*T74;
T79 = (y(1)/y(15))^params(5);
T81 = y(5)^(y(23)*params(5));
T205 = 1-(1/(1+y(21)))^params(8);
T207 = 1-1/(1+y(21));
T218 = (y(8)*y(3)-y(10)*params(14)-y(9)*params(15))/y(10);
T224 = params(12)+params(13)*log(y(10)/y(9));
T228 = (y(8)*y(3)-y(10)*params(14)-y(9)*params(15))/y(9);
T230 = 1-params(12)-params(13)*log(y(10)/y(9));
T243 = y(5)/params(7);
T245 = T243^params(23);
T246 = y(1)/params(27);
T248 = T246^params(24);
T257 = T243^params(25);
T259 = T246^params(26);
T271 = (y(6)/y(22))^(1/params(5));
T274 = T54^T74;
T442 = y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5);
T446 = y(17)/(y(5)*T442);
T448 = y(5)*y(5)*T442;
T469 = y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*T448;
T476 = y(5)*y(5)*T446;
T477 = y(5)*T476;
T478 = y(5)*T477;
T479 = y(5)*T478;
T480 = y(5)*T479;
T481 = y(5)*T480;
T482 = y(5)*T481;
T483 = y(5)*T482;
lhs =y(2)+y(8)*y(3)+y(4);
rhs =y(3)*T16+params(10)*y(11)*y(6)+(1-params(10))*y(1);
residual(1)= lhs-rhs;
lhs =1;
rhs =params(1)*y(7)/y(7)*(y(8)*y(5))^(-1);
residual(2)= lhs-rhs;
lhs =y(11);
rhs =y(12)/y(7)*T42*T44;
residual(3)= lhs-rhs;
lhs =T54;
rhs =T63;
residual(4)= lhs-rhs;
lhs =y(13);
rhs =y(1)*T66+y(13)*T50*params(1)*params(6);
residual(5)= lhs-rhs;
lhs =y(14);
rhs =T76*T79+y(14)*params(1)*params(6)*T81;
residual(6)= lhs-rhs;
lhs =y(3);
rhs =y(16)+1/params(8)*(y(17)+y(17)/y(5)+y(17)/(y(5)*y(5))+y(17)/(y(5)*y(5)*y(5))+y(17)/(y(5)*y(5)*y(5)*y(5))+y(17)/(y(5)*y(5)*y(5)*y(5)*y(5))+y(17)/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+y(17)/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+y(17)/T442+T446+y(17)/T448+y(17)/(y(5)*T448)+y(17)/(y(5)*y(5)*T448)+y(17)/(y(5)*y(5)*y(5)*T448)+y(17)/(y(5)*y(5)*y(5)*y(5)*T448)+y(17)/(y(5)*y(5)*y(5)*y(5)*y(5)*T448)+y(17)/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*T448)+y(17)/T469+y(17)/(y(5)*T469)+y(5)*T483);
residual(7)= lhs-rhs;
lhs =1+y(20);
rhs =1/y(10);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =1/(params(8)*(1+y(21)))*T205/T207;
residual(9)= lhs-rhs;
lhs =y(26);
rhs =y(8)*y(3);
residual(10)= lhs-rhs;
lhs =y(16);
rhs =params(14)+T218*T224;
residual(11)= lhs-rhs;
lhs =y(17);
rhs =params(15)+T228*T230;
residual(12)= lhs-rhs;
lhs =y(18);
rhs =params(11)*params(27);
residual(13)= lhs-rhs;
lhs =(1+y(20))/(1+params(37));
rhs =T245*T248*y(24);
residual(14)= lhs-rhs;
lhs =(y(18)-y(19))/y(18);
rhs =T257*T259*y(25);
residual(15)= lhs-rhs;
lhs =y(18);
rhs =y(17)+y(19);
residual(16)= lhs-rhs;
lhs =y(1);
rhs =y(2)+y(4);
residual(17)= lhs-rhs;
lhs =y(1);
rhs =y(15)*T271;
residual(18)= lhs-rhs;
lhs =y(22);
rhs =(1-params(6))*T274+y(22)*params(6)*T81;
residual(19)= lhs-rhs;
lhs =log(y(7));
rhs =log(y(7))*params(18)+x(1);
residual(20)= lhs-rhs;
lhs =log(y(12));
rhs =log(y(12))*params(19)+x(2);
residual(21)= lhs-rhs;
lhs =log(y(15));
rhs =log(y(15))*params(21)+x(3);
residual(22)= lhs-rhs;
lhs =log(y(23)/params(4));
rhs =log(y(23)/params(4))*params(22)+x(4);
residual(23)= lhs-rhs;
lhs =log(y(4)/params(28));
rhs =log(y(4)/params(28))*params(20)+x(5);
residual(24)= lhs-rhs;
lhs =log(y(24));
rhs =log(y(24))*params(16)-x(6);
residual(25)= lhs-rhs;
lhs =log(y(25));
rhs =log(y(25))*params(17)-x(7);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(17);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(17);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(5);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(17);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(5);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(17);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(5);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(17);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(5);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(17);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(5);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(17);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(5);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(17);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(5);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(17);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(5);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(17);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(5);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(17);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(5);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(17);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(5);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(17);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(5);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(17);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(5);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(17);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(5);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(17);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(5);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(17);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(5);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(17);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(5);
residual(61)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(61, 61);

  %
  % Jacobian matrix
  %

T558 = getPowerDeriv(y(1)/y(15),params(5),1);
T589 = 1/params(28)/(y(4)/params(28));
T595 = getPowerDeriv(y(8)*y(5),(-1),1);
T599 = getPowerDeriv(y(5),y(23)-1,1);
T606 = getPowerDeriv(y(5),y(23)*params(5),1);
T647 = y(5)*y(5)*y(5)*y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)*y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)+y(5)*(y(5)+y(5))))));
T665 = (-(y(17)*(T442+y(5)*(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)+y(5)*T647))))/(y(5)*T442*y(5)*T442);
T668 = y(5)*T442+y(5)*(T442+y(5)*(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)+y(5)*T647));
T710 = y(5)*y(5)*y(5)*y(5)*y(5)*T448+y(5)*(y(5)*y(5)*y(5)*y(5)*T448+y(5)*(y(5)*y(5)*y(5)*T448+y(5)*(y(5)*y(5)*T448+y(5)*(y(5)*T448+y(5)*(T448+y(5)*T668)))));
T772 = getPowerDeriv(y(6),params(3),1);
T780 = getPowerDeriv(y(6)/y(22),1/params(5),1);
T811 = params(13)*(-y(10))/(y(9)*y(9))/(y(10)/y(9));
T833 = params(13)*1/y(9)/(y(10)/y(9));
T856 = getPowerDeriv(y(13)/y(14),(y(23)-1)/(1+y(23)*(params(5)-1)),1);
T995 = 1/params(4)/(y(23)/params(4));
  g1(1,1)=(-(1-params(10)));
  g1(1,2)=1;
  g1(1,3)=y(8)-T16;
  g1(1,4)=1;
  g1(1,5)=(-(y(3)*getPowerDeriv(y(5),(-1),1)));
  g1(1,6)=(-(params(10)*y(11)));
  g1(1,8)=y(3);
  g1(1,11)=(-(params(10)*y(6)));
  g1(2,5)=(-(params(1)*y(7)/y(7)*y(8)*T595));
  g1(2,8)=(-(params(1)*y(7)/y(7)*y(5)*T595));
  g1(3,2)=(-(y(12)/y(7)*T42*getPowerDeriv(y(2),params(2),1)));
  g1(3,6)=(-(T44*y(12)/y(7)*T772));
  g1(3,7)=(-(T44*T42*(-y(12))/(y(7)*y(7))));
  g1(3,11)=1;
  g1(3,12)=(-(T44*T42*1/y(7)));
  g1(4,5)=(-(params(6)*T599))/(1-params(6));
  g1(4,13)=(-(1/y(14)*T856));
  g1(4,14)=(-(T856*(-y(13))/(y(14)*y(14))));
  g1(4,23)=(-(params(6)*T50*log(y(5))))/(1-params(6))-T63*(1+y(23)*(params(5)-1)-(y(23)-1)*(params(5)-1))/((1+y(23)*(params(5)-1))*(1+y(23)*(params(5)-1)))*log(y(13)/y(14));
  g1(5,1)=(-T66);
  g1(5,2)=(-(y(1)*y(7)*getPowerDeriv(y(2),(-params(2)),1)));
  g1(5,5)=(-(y(13)*params(1)*params(6)*T599));
  g1(5,7)=(-(y(1)*T65));
  g1(5,13)=1-T50*params(1)*params(6);
  g1(5,23)=(-(y(13)*params(1)*params(6)*T50*log(y(5))));
  g1(6,1)=(-(T76*1/y(15)*T558));
  g1(6,5)=(-(y(14)*params(1)*params(6)*T606));
  g1(6,6)=(-(T79*y(12)*T74*T772));
  g1(6,12)=(-(T79*T42*T74));
  g1(6,14)=1-params(1)*params(6)*T81;
  g1(6,15)=(-(T76*T558*(-y(1))/(y(15)*y(15))));
  g1(6,23)=(-(T79*T42*y(12)*((y(23)-1)*params(5)-y(23)*params(5))/((y(23)-1)*(y(23)-1))+y(14)*params(1)*params(6)*T81*params(5)*log(y(5))));
  g1(7,3)=1;
  g1(7,5)=(-(1/params(8)*((-y(17))/(y(5)*y(5))+(-(y(17)*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))+(-(y(17)*(y(5)*y(5)+y(5)*(y(5)+y(5)))))/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+(-(y(17)*(y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)+y(5)*(y(5)+y(5))))))/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+(-(y(17)*(y(5)*y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)+y(5)*(y(5)+y(5)))))))/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+(-(y(17)*(y(5)*y(5)*y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)*y(5)+y(5)*(y(5)*y(5)+y(5)*(y(5)+y(5))))))))/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+(-(y(17)*T647))/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+(-(y(17)*(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)+y(5)*T647)))/(T442*T442)+T665+(-(y(17)*T668))/(T448*T448)+(-(y(17)*(T448+y(5)*T668)))/(y(5)*T448*y(5)*T448)+(-(y(17)*(y(5)*T448+y(5)*(T448+y(5)*T668))))/(y(5)*y(5)*T448*y(5)*y(5)*T448)+(-(y(17)*(y(5)*y(5)*T448+y(5)*(y(5)*T448+y(5)*(T448+y(5)*T668)))))/(y(5)*y(5)*y(5)*T448*y(5)*y(5)*y(5)*T448)+(-(y(17)*(y(5)*y(5)*y(5)*T448+y(5)*(y(5)*y(5)*T448+y(5)*(y(5)*T448+y(5)*(T448+y(5)*T668))))))/(y(5)*y(5)*y(5)*y(5)*T448*y(5)*y(5)*y(5)*y(5)*T448)+(-(y(17)*(y(5)*y(5)*y(5)*y(5)*T448+y(5)*(y(5)*y(5)*y(5)*T448+y(5)*(y(5)*y(5)*T448+y(5)*(y(5)*T448+y(5)*(T448+y(5)*T668)))))))/(y(5)*y(5)*y(5)*y(5)*y(5)*T448*y(5)*y(5)*y(5)*y(5)*y(5)*T448)+(-(y(17)*T710))/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*T448*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*T448)+(-(y(17)*(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*T448+y(5)*T710)))/(T469*T469)+(-(y(17)*(T469+y(5)*(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*T448+y(5)*T710))))/(y(5)*T469*y(5)*T469)+T483+y(5)*(T482+y(5)*(T481+y(5)*(T480+y(5)*(T479+y(5)*(T478+y(5)*(T477+y(5)*(T476+y(5)*(y(5)*T446+y(5)*(T446+y(5)*T665))))))))))));
  g1(7,16)=(-1);
  g1(7,17)=(-(1/params(8)*(1+1/y(5)+1/(y(5)*y(5))+1/(y(5)*y(5)*y(5))+1/(y(5)*y(5)*y(5)*y(5))+1/(y(5)*y(5)*y(5)*y(5)*y(5))+1/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+1/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5))+1/T442+1/(y(5)*T442)+1/T448+1/(y(5)*T448)+1/(y(5)*y(5)*T448)+1/(y(5)*y(5)*y(5)*T448)+1/(y(5)*y(5)*y(5)*y(5)*T448)+1/(y(5)*y(5)*y(5)*y(5)*y(5)*T448)+1/(y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*T448)+1/T469+1/(y(5)*T469)+y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*y(5)*1/(y(5)*T442))));
  g1(8,10)=(-((-1)/(y(10)*y(10))));
  g1(8,20)=1;
  g1(9,9)=1;
  g1(9,21)=(-((T207*(T205*(-params(8))/(params(8)*(1+y(21))*params(8)*(1+y(21)))+1/(params(8)*(1+y(21)))*(-((-1)/((1+y(21))*(1+y(21)))*getPowerDeriv(1/(1+y(21)),params(8),1))))-1/(params(8)*(1+y(21)))*T205*(-((-1)/((1+y(21))*(1+y(21))))))/(T207*T207)));
  g1(10,3)=(-y(8));
  g1(10,8)=(-y(3));
  g1(10,26)=1;
  g1(11,3)=(-(T224*y(8)/y(10)));
  g1(11,8)=(-(T224*y(3)/y(10)));
  g1(11,9)=(-(T224*(-params(15))/y(10)+T218*T811));
  g1(11,10)=(-(T224*(y(10)*(-params(14))-(y(8)*y(3)-y(10)*params(14)-y(9)*params(15)))/(y(10)*y(10))+T218*T833));
  g1(11,16)=1;
  g1(12,3)=(-(T230*y(8)/y(9)));
  g1(12,8)=(-(T230*y(3)/y(9)));
  g1(12,9)=(-(T230*(y(9)*(-params(15))-(y(8)*y(3)-y(10)*params(14)-y(9)*params(15)))/(y(9)*y(9))+T228*(-T811)));
  g1(12,10)=(-(T230*(-params(14))/y(9)+T228*(-T833)));
  g1(12,17)=1;
  g1(13,18)=1;
  g1(14,1)=(-(y(24)*T245*1/params(27)*getPowerDeriv(T246,params(24),1)));
  g1(14,5)=(-(y(24)*T248*1/params(7)*getPowerDeriv(T243,params(23),1)));
  g1(14,20)=1/(1+params(37));
  g1(14,24)=(-(T245*T248));
  g1(15,1)=(-(y(25)*T257*1/params(27)*getPowerDeriv(T246,params(26),1)));
  g1(15,5)=(-(y(25)*T259*1/params(7)*getPowerDeriv(T243,params(25),1)));
  g1(15,18)=(y(18)-(y(18)-y(19)))/(y(18)*y(18));
  g1(15,19)=(-1)/y(18);
  g1(15,25)=(-(T257*T259));
  g1(16,17)=(-1);
  g1(16,18)=1;
  g1(16,19)=(-1);
  g1(17,1)=1;
  g1(17,2)=(-1);
  g1(17,4)=(-1);
  g1(18,1)=1;
  g1(18,6)=(-(y(15)*1/y(22)*T780));
  g1(18,15)=(-T271);
  g1(18,22)=(-(y(15)*T780*(-y(6))/(y(22)*y(22))));
  g1(19,5)=(-((1-params(6))*(-(params(6)*T599))/(1-params(6))*getPowerDeriv(T54,T74,1)+y(22)*params(6)*T606));
  g1(19,22)=1-params(6)*T81;
  g1(19,23)=(-((1-params(6))*T274*(((y(23)-1)*params(5)-y(23)*params(5))/((y(23)-1)*(y(23)-1))*log(T54)+T74*(-(params(6)*T50*log(y(5))))/(1-params(6))/T54)+y(22)*params(6)*T81*params(5)*log(y(5))));
  g1(20,7)=1/y(7)-params(18)*1/y(7);
  g1(21,12)=1/y(12)-params(19)*1/y(12);
  g1(22,15)=1/y(15)-params(21)*1/y(15);
  g1(23,23)=T995-params(22)*T995;
  g1(24,4)=T589-params(20)*T589;
  g1(25,24)=1/y(24)-params(16)*1/y(24);
  g1(26,25)=1/y(25)-params(17)*1/y(25);
  g1(27,17)=(-1);
  g1(27,27)=1;
  g1(28,17)=(-1);
  g1(28,28)=1;
  g1(29,5)=(-1);
  g1(29,29)=1;
  g1(30,17)=(-1);
  g1(30,30)=1;
  g1(31,5)=(-1);
  g1(31,31)=1;
  g1(32,17)=(-1);
  g1(32,32)=1;
  g1(33,5)=(-1);
  g1(33,33)=1;
  g1(34,17)=(-1);
  g1(34,34)=1;
  g1(35,5)=(-1);
  g1(35,35)=1;
  g1(36,17)=(-1);
  g1(36,36)=1;
  g1(37,5)=(-1);
  g1(37,37)=1;
  g1(38,17)=(-1);
  g1(38,38)=1;
  g1(39,5)=(-1);
  g1(39,39)=1;
  g1(40,17)=(-1);
  g1(40,40)=1;
  g1(41,5)=(-1);
  g1(41,41)=1;
  g1(42,17)=(-1);
  g1(42,42)=1;
  g1(43,5)=(-1);
  g1(43,43)=1;
  g1(44,17)=(-1);
  g1(44,44)=1;
  g1(45,5)=(-1);
  g1(45,45)=1;
  g1(46,17)=(-1);
  g1(46,46)=1;
  g1(47,5)=(-1);
  g1(47,47)=1;
  g1(48,17)=(-1);
  g1(48,48)=1;
  g1(49,5)=(-1);
  g1(49,49)=1;
  g1(50,17)=(-1);
  g1(50,50)=1;
  g1(51,5)=(-1);
  g1(51,51)=1;
  g1(52,17)=(-1);
  g1(52,52)=1;
  g1(53,5)=(-1);
  g1(53,53)=1;
  g1(54,17)=(-1);
  g1(54,54)=1;
  g1(55,5)=(-1);
  g1(55,55)=1;
  g1(56,17)=(-1);
  g1(56,56)=1;
  g1(57,5)=(-1);
  g1(57,57)=1;
  g1(58,17)=(-1);
  g1(58,58)=1;
  g1(59,5)=(-1);
  g1(59,59)=1;
  g1(60,17)=(-1);
  g1(60,60)=1;
  g1(61,5)=(-1);
  g1(61,61)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],61,3721);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],61,226981);
end
end
end
end
