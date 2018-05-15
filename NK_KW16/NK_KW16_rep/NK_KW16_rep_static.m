function [residual, g1, g2] = NK_KW16_rep_static(y, x, params)
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

residual = zeros( 40, 1);

%
% Model equations
%

T57 = exp(y(13))*params(6)*exp(y(2))/exp(y(9))+exp(y(12))*exp(y(10))*(1-params(3));
T64 = exp(y(11))*(exp(y(9))*exp(y(12)))^params(6);
T103 = (1-params(7)*exp(y(14))^(params(8)-1))/(1-params(7));
T117 = exp(y(16))*exp(y(14))^params(8)*exp(y(7))*params(1)*params(7);
T123 = exp(y(17))*exp(y(14))^(params(8)-1)*exp(y(7))*params(1)*params(7);
T131 = exp(y(14))*exp(y(16))*params(8)/(params(8)-1)/exp(y(17));
T148 = exp(y(33))*exp(y(9))*exp(y(10))*params(13)/(exp(y(9))*exp(y(10)));
T150 = params(1)*exp(y(7))*((exp(y(21))-exp(y(19)))*(1-params(13))+T148);
T164 = params(1)*exp(y(7))*((1-params(13))*(exp(y(22))-exp(y(19)))+exp(y(34))*params(13)*exp(y(40))/exp(y(40)));
T261 = (params(56)*exp(y(14))^params(9))^(1-params(16));
T287 = (-(exp(y(13))*params(6)*exp(y(2))/exp(y(9))/exp(y(10))));
T288 = (-(exp(y(2))*exp(y(13))*(1-params(6))/exp(y(3))));
T302 = (exp(y(5))-exp(y(5))*params(2))*getPowerDeriv(exp(y(5))-exp(y(5))*params(2),(-1),1);
T323 = (-(exp(y(3))^(1-params(6))*exp(y(11))*exp(y(9))*exp(y(12))*getPowerDeriv(exp(y(9))*exp(y(12)),params(6),1)));
lhs =exp(y(6));
rhs =(exp(y(5))-exp(y(5))*params(2))^(-1)-(exp(y(5))-exp(y(5))*params(2))^(-1)*params(2)*params(1);
residual(1)= lhs-rhs;
lhs =exp(y(7));
rhs =1;
residual(2)= lhs-rhs;
lhs =exp(y(7))*params(1)*exp(y(19));
rhs =1;
residual(3)= lhs-rhs;
lhs =exp(y(3))^params(4);
rhs =exp(y(6))*exp(y(4));
residual(4)= lhs-rhs;
lhs =exp(y(21));
rhs =T57/exp(y(10));
residual(5)= lhs-rhs;
lhs =exp(y(2));
rhs =T64*exp(y(3))^(1-params(6));
residual(6)= lhs-rhs;
lhs =exp(y(4));
rhs =exp(y(2))*exp(y(13))*(1-params(6))/exp(y(3));
residual(7)= lhs-rhs;
lhs =1/exp(y(10));
rhs =1;
residual(8)= lhs-rhs;
lhs =exp(y(9));
rhs =exp(y(8))+exp(y(9))*exp(y(12))*(1-params(3));
residual(9)= lhs-rhs;
lhs =exp(y(2));
rhs =exp(y(1))*exp(y(18));
residual(10)= lhs-rhs;
lhs =exp(y(18));
rhs =exp(y(18))*params(7)*exp(y(14))^params(8)+(1-params(7))*T103^((-params(8))/(1-params(8)));
residual(11)= lhs-rhs;
lhs =exp(y(16));
rhs =exp(y(13))*exp(y(1))+T117;
residual(12)= lhs-rhs;
lhs =exp(y(17));
rhs =exp(y(1))+T123;
residual(13)= lhs-rhs;
lhs =exp(y(15));
rhs =T131;
residual(14)= lhs-rhs;
lhs =exp(y(14))^(1-params(8));
rhs =params(7)+(1-params(7))*exp(y(15))^(1-params(8));
residual(15)= lhs-rhs;
lhs =exp(y(33));
rhs =T150;
residual(16)= lhs-rhs;
lhs =exp(y(34));
rhs =T164;
residual(17)= lhs-rhs;
lhs =exp(y(35));
rhs =params(1)*exp(y(7))*(exp(y(19))*(1-params(13))+params(13)*exp(y(35)));
residual(18)= lhs-rhs;
lhs =exp(y(33));
rhs =exp(y(34));
residual(19)= lhs-rhs;
lhs =exp(y(28));
rhs =exp(y(35))/(params(14)-exp(y(33)));
residual(20)= lhs-rhs;
lhs =exp(y(30));
rhs =exp(y(30))*params(13)*(exp(y(19))+exp(y(28))*(exp(y(23))-exp(y(19))))+exp(y(30))*params(15);
residual(21)= lhs-rhs;
lhs =exp(y(30))+exp(y(32));
rhs =exp(y(9))*exp(y(10))+exp(y(40));
residual(22)= lhs-rhs;
lhs =exp(y(29));
rhs =exp(y(9))*exp(y(10))+exp(y(40));
residual(23)= lhs-rhs;
lhs =exp(y(9))*exp(y(10));
rhs =exp(y(30))*exp(y(28))*exp(y(31));
residual(24)= lhs-rhs;
lhs =exp(y(40));
rhs =exp(y(30))*exp(y(28))*(1-exp(y(31)));
residual(25)= lhs-rhs;
lhs =exp(y(24));
rhs =exp(y(21));
residual(26)= lhs-rhs;
lhs =exp(y(25));
rhs =exp(y(22));
residual(27)= lhs-rhs;
lhs =exp(y(26));
rhs =exp(y(21))-exp(y(19));
residual(28)= lhs-rhs;
lhs =exp(y(27));
rhs =exp(y(22))-exp(y(19));
residual(29)= lhs-rhs;
lhs =exp(y(23));
rhs =exp(y(21))*exp(y(31))+exp(y(22))*(1-exp(y(31)));
residual(30)= lhs-rhs;
lhs =exp(y(40));
rhs =exp(y(22))*exp(y(40))+exp(y(36))-exp(y(39));
residual(31)= lhs-rhs;
lhs =exp(y(36));
rhs =params(33)*exp(y(37));
residual(32)= lhs-rhs;
lhs =exp(y(39));
rhs =params(41);
residual(33)= lhs-rhs;
lhs =exp(y(38));
rhs =exp(y(36))/params(25);
residual(34)= lhs-rhs;
lhs =exp(y(1));
rhs =exp(y(8))+exp(y(5))+exp(y(36));
residual(35)= lhs-rhs;
lhs =exp(y(20));
rhs =exp(y(19))*exp(y(14));
residual(36)= lhs-rhs;
lhs =exp(y(20));
rhs =exp(y(20))^params(16)*T261*exp((-x(3)));
residual(37)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(18)-x(4);
residual(38)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(17)-x(1);
residual(39)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(19)+x(2);
residual(40)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(40, 40);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-(T302-params(2)*params(1)*T302));
  g1(1,6)=exp(y(6));
  g1(2,7)=exp(y(7));
  g1(3,7)=exp(y(7))*params(1)*exp(y(19));
  g1(3,19)=exp(y(7))*params(1)*exp(y(19));
  g1(4,3)=exp(y(3))*getPowerDeriv(exp(y(3)),params(4),1);
  g1(4,4)=(-(exp(y(6))*exp(y(4))));
  g1(4,6)=(-(exp(y(6))*exp(y(4))));
  g1(5,2)=T287;
  g1(5,9)=(-((-(exp(y(13))*params(6)*exp(y(2))*exp(y(9))))/(exp(y(9))*exp(y(9)))/exp(y(10))));
  g1(5,10)=(-((exp(y(10))*exp(y(12))*exp(y(10))*(1-params(3))-exp(y(10))*T57)/(exp(y(10))*exp(y(10)))));
  g1(5,12)=(-(exp(y(12))*exp(y(10))*(1-params(3))/exp(y(10))));
  g1(5,13)=T287;
  g1(5,21)=exp(y(21));
  g1(6,2)=exp(y(2));
  g1(6,3)=(-(T64*exp(y(3))*getPowerDeriv(exp(y(3)),1-params(6),1)));
  g1(6,9)=T323;
  g1(6,11)=(-(T64*exp(y(3))^(1-params(6))));
  g1(6,12)=T323;
  g1(7,2)=T288;
  g1(7,3)=(-((-(exp(y(3))*exp(y(2))*exp(y(13))*(1-params(6))))/(exp(y(3))*exp(y(3)))));
  g1(7,4)=exp(y(4));
  g1(7,13)=T288;
  g1(8,10)=(-exp(y(10)))/(exp(y(10))*exp(y(10)));
  g1(9,8)=(-exp(y(8)));
  g1(9,9)=exp(y(9))-exp(y(9))*exp(y(12))*(1-params(3));
  g1(9,12)=(-(exp(y(9))*exp(y(12))*(1-params(3))));
  g1(10,1)=(-(exp(y(1))*exp(y(18))));
  g1(10,2)=exp(y(2));
  g1(10,18)=(-(exp(y(1))*exp(y(18))));
  g1(11,14)=(-(exp(y(18))*params(7)*exp(y(14))*getPowerDeriv(exp(y(14)),params(8),1)+(1-params(7))*(-(params(7)*exp(y(14))*getPowerDeriv(exp(y(14)),params(8)-1,1)))/(1-params(7))*getPowerDeriv(T103,(-params(8))/(1-params(8)),1)));
  g1(11,18)=exp(y(18))-exp(y(18))*params(7)*exp(y(14))^params(8);
  g1(12,1)=(-(exp(y(13))*exp(y(1))));
  g1(12,7)=(-T117);
  g1(12,13)=(-(exp(y(13))*exp(y(1))));
  g1(12,14)=(-(exp(y(16))*exp(y(7))*params(1)*params(7)*exp(y(14))*getPowerDeriv(exp(y(14)),params(8),1)));
  g1(12,16)=exp(y(16))-T117;
  g1(13,1)=(-exp(y(1)));
  g1(13,7)=(-T123);
  g1(13,14)=(-(exp(y(17))*exp(y(7))*params(1)*params(7)*exp(y(14))*getPowerDeriv(exp(y(14)),params(8)-1,1)));
  g1(13,17)=exp(y(17))-T123;
  g1(14,14)=(-T131);
  g1(14,15)=exp(y(15));
  g1(14,16)=(-T131);
  g1(14,17)=(-(exp(y(14))*(-(exp(y(17))*exp(y(16))*params(8)/(params(8)-1)))/(exp(y(17))*exp(y(17)))));
  g1(15,14)=exp(y(14))*getPowerDeriv(exp(y(14)),1-params(8),1);
  g1(15,15)=(-((1-params(7))*exp(y(15))*getPowerDeriv(exp(y(15)),1-params(8),1)));
  g1(16,7)=(-T150);
  g1(16,19)=(-(params(1)*exp(y(7))*(1-params(13))*(-exp(y(19)))));
  g1(16,21)=(-(params(1)*exp(y(7))*exp(y(21))*(1-params(13))));
  g1(16,33)=exp(y(33))-params(1)*exp(y(7))*T148;
  g1(17,7)=(-T164);
  g1(17,19)=(-(params(1)*exp(y(7))*(1-params(13))*(-exp(y(19)))));
  g1(17,22)=(-(params(1)*exp(y(7))*(1-params(13))*exp(y(22))));
  g1(17,34)=exp(y(34))-params(1)*exp(y(7))*exp(y(34))*params(13)*exp(y(40))/exp(y(40));
  g1(18,7)=(-(params(1)*exp(y(7))*(exp(y(19))*(1-params(13))+params(13)*exp(y(35)))));
  g1(18,19)=(-(params(1)*exp(y(7))*exp(y(19))*(1-params(13))));
  g1(18,35)=exp(y(35))-params(1)*exp(y(7))*params(13)*exp(y(35));
  g1(19,33)=exp(y(33));
  g1(19,34)=(-exp(y(34)));
  g1(20,28)=exp(y(28));
  g1(20,33)=(-((-(exp(y(35))*(-exp(y(33)))))/((params(14)-exp(y(33)))*(params(14)-exp(y(33))))));
  g1(20,35)=(-(exp(y(35))/(params(14)-exp(y(33)))));
  g1(21,19)=(-(exp(y(30))*params(13)*(exp(y(19))+exp(y(28))*(-exp(y(19))))));
  g1(21,23)=(-(exp(y(30))*params(13)*exp(y(28))*exp(y(23))));
  g1(21,28)=(-(exp(y(30))*params(13)*exp(y(28))*(exp(y(23))-exp(y(19)))));
  g1(21,30)=exp(y(30))-(exp(y(30))*params(13)*(exp(y(19))+exp(y(28))*(exp(y(23))-exp(y(19))))+exp(y(30))*params(15));
  g1(22,9)=(-(exp(y(9))*exp(y(10))));
  g1(22,10)=(-(exp(y(9))*exp(y(10))));
  g1(22,30)=exp(y(30));
  g1(22,32)=exp(y(32));
  g1(22,40)=(-exp(y(40)));
  g1(23,9)=(-(exp(y(9))*exp(y(10))));
  g1(23,10)=(-(exp(y(9))*exp(y(10))));
  g1(23,29)=exp(y(29));
  g1(23,40)=(-exp(y(40)));
  g1(24,9)=exp(y(9))*exp(y(10));
  g1(24,10)=exp(y(9))*exp(y(10));
  g1(24,28)=(-(exp(y(30))*exp(y(28))*exp(y(31))));
  g1(24,30)=(-(exp(y(30))*exp(y(28))*exp(y(31))));
  g1(24,31)=(-(exp(y(30))*exp(y(28))*exp(y(31))));
  g1(25,28)=(-(exp(y(30))*exp(y(28))*(1-exp(y(31)))));
  g1(25,30)=(-(exp(y(30))*exp(y(28))*(1-exp(y(31)))));
  g1(25,31)=(-(exp(y(30))*exp(y(28))*(-exp(y(31)))));
  g1(25,40)=exp(y(40));
  g1(26,21)=(-exp(y(21)));
  g1(26,24)=exp(y(24));
  g1(27,22)=(-exp(y(22)));
  g1(27,25)=exp(y(25));
  g1(28,19)=exp(y(19));
  g1(28,21)=(-exp(y(21)));
  g1(28,26)=exp(y(26));
  g1(29,19)=exp(y(19));
  g1(29,22)=(-exp(y(22)));
  g1(29,27)=exp(y(27));
  g1(30,21)=(-(exp(y(21))*exp(y(31))));
  g1(30,22)=(-(exp(y(22))*(1-exp(y(31)))));
  g1(30,23)=exp(y(23));
  g1(30,31)=(-(exp(y(21))*exp(y(31))+exp(y(22))*(-exp(y(31)))));
  g1(31,22)=(-(exp(y(22))*exp(y(40))));
  g1(31,36)=(-exp(y(36)));
  g1(31,39)=exp(y(39));
  g1(31,40)=exp(y(40))-exp(y(22))*exp(y(40));
  g1(32,36)=exp(y(36));
  g1(32,37)=(-(params(33)*exp(y(37))));
  g1(33,39)=exp(y(39));
  g1(34,36)=(-(exp(y(36))/params(25)));
  g1(34,38)=exp(y(38));
  g1(35,1)=exp(y(1));
  g1(35,5)=(-exp(y(5)));
  g1(35,8)=(-exp(y(8)));
  g1(35,36)=(-exp(y(36)));
  g1(36,14)=(-(exp(y(19))*exp(y(14))));
  g1(36,19)=(-(exp(y(19))*exp(y(14))));
  g1(36,20)=exp(y(20));
  g1(37,14)=(-(exp((-x(3)))*exp(y(20))^params(16)*params(56)*exp(y(14))*getPowerDeriv(exp(y(14)),params(9),1)*getPowerDeriv(params(56)*exp(y(14))^params(9),1-params(16),1)));
  g1(37,20)=exp(y(20))-exp((-x(3)))*T261*exp(y(20))*getPowerDeriv(exp(y(20)),params(16),1);
  g1(38,11)=1-params(18);
  g1(39,12)=1-params(17);
  g1(40,37)=1-params(19);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],40,1600);
end
end
