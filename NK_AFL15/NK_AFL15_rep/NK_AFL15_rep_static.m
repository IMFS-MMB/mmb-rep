function [residual, g1, g2] = NK_AFL15_rep_static(y, x, params)
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

residual = zeros( 27, 1);

%
% Model equations
%

T89 = params(41)/2*(y(10)/y(4)-params(43))^2;
T90 = 1-params(43)+y(10)*params(41)*(y(10)/y(4)-params(43))/y(4)-T89;
T104 = y(8)^(1-params(38));
T108 = params(44)/params(33);
T109 = y(14)*exp(y(12))*y(4)^params(38)*T104*T108;
T112 = y(7)-(params(44)-1)/params(44);
T173 = T104*exp(y(12))*y(4)^params(38);
T186 = 1-1/y(3)*(y(21)+params(46))/(2-params(45)+params(52)*(1+params(45)));
T187 = y(9)*T186;
T200 = (y(21)+params(46)-(y(21)+params(46))/(2-params(45)))^2/(params(46)*8);
T201 = y(9)*T200;
T252 = 1/params(9)/(y(3)/params(9));
T278 = getPowerDeriv(1-params(41)*(y(10)/y(4)-params(43)),(-1),1);
T287 = params(41)/2*(-y(10))/(y(4)*y(4))*2*(y(10)/y(4)-params(43));
T370 = params(41)/2*2*(y(10)/y(4)-params(43))*1/y(4);
lhs =y(14);
rhs =y(1)^(-params(34));
residual(1)= lhs-rhs;
lhs =y(15);
rhs =params(35)*1/(y(8)-1);
residual(2)= lhs-rhs;
lhs =y(16);
rhs =params(38)*y(6)/y(4);
residual(3)= lhs-rhs;
lhs =y(17);
rhs =y(6)*(1-params(38))/y(8);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(37)+x(1);
residual(5)= lhs-rhs;
lhs =y(13)/params(18);
rhs =(y(13)/params(18))^params(39)*exp(x(2));
residual(6)= lhs-rhs;
lhs =y(14);
rhs =y(14)*params(36)*y(24);
residual(7)= lhs-rhs;
lhs =y(24);
rhs =y(3)*(1-y(23))/y(2);
residual(8)= lhs-rhs;
lhs =y(17)*y(7);
rhs =(-y(15))/y(14);
residual(9)= lhs-rhs;
lhs =y(16)*y(7);
rhs =y(5);
residual(10)= lhs-rhs;
lhs =y(9);
rhs =(1-params(41)*(y(10)/y(4)-params(43)))^(-1);
residual(11)= lhs-rhs;
lhs =y(21)/y(2);
rhs =y(11)/y(9);
residual(12)= lhs-rhs;
lhs =y(11);
rhs =y(5)+y(9)*T90;
residual(13)= lhs-rhs;
lhs =y(14)*y(2)*(y(2)-params(7));
rhs =(y(2)-params(7))*y(14)*params(36)*y(2)+T109*T112;
residual(14)= lhs-rhs;
lhs =y(4);
rhs =y(10)+y(4)*(1-params(43))-y(4)*T89;
residual(15)= lhs-rhs;
lhs =y(6);
rhs =y(13)+y(1)+y(10)+y(26)+y(25);
residual(16)= lhs-rhs;
lhs =y(26);
rhs =params(33)/2*(y(2)-params(7))^2;
residual(17)= lhs-rhs;
lhs =y(25);
rhs =y(4)*y(9)*y(21)*params(52)*y(22);
residual(18)= lhs-rhs;
lhs =log(y(3)/params(9));
rhs =log(y(3)/params(9))*params(50)+(1-params(50))*(params(47)*log(y(2)/params(7))+params(49)*log(y(9)/params(15))+params(48)*log((y(6)-y(25))/params(12)))+y(27);
residual(19)= lhs-rhs;
lhs =y(27);
rhs =y(27)*0.2+x(3);
residual(20)= lhs-rhs;
lhs =y(6);
rhs =T173;
residual(21)= lhs-rhs;
lhs =y(18);
rhs =y(4)*T187;
residual(22)= lhs-rhs;
lhs =y(18)+y(19);
rhs =y(4)*y(9);
residual(23)= lhs-rhs;
lhs =y(18);
rhs =params(42)*(y(18)+y(4)*T201)+params(1);
residual(24)= lhs-rhs;
lhs =y(20);
rhs =y(19)/(y(4)*y(9));
residual(25)= lhs-rhs;
lhs =y(22);
rhs =0.5*(1-(y(21)-y(3)*y(20))/params(46));
residual(26)= lhs-rhs;
lhs =y(23);
rhs =y(22)*(1+params(45))*.25*(1-params(52))*(y(3)+(y(21)-params(46))/y(20));
residual(27)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(27, 27);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(getPowerDeriv(y(1),(-params(34)),1)));
  g1(1,14)=1;
  g1(2,8)=(-(params(35)*(-1)/((y(8)-1)*(y(8)-1))));
  g1(2,15)=1;
  g1(3,4)=(-((-(params(38)*y(6)))/(y(4)*y(4))));
  g1(3,6)=(-(params(38)/y(4)));
  g1(3,16)=1;
  g1(4,6)=(-((1-params(38))/y(8)));
  g1(4,8)=(-((-(y(6)*(1-params(38))))/(y(8)*y(8))));
  g1(4,17)=1;
  g1(5,12)=1-params(37);
  g1(6,13)=1/params(18)-exp(x(2))*1/params(18)*getPowerDeriv(y(13)/params(18),params(39),1);
  g1(7,14)=1-params(36)*y(24);
  g1(7,24)=(-(y(14)*params(36)));
  g1(8,2)=(-((-(y(3)*(1-y(23))))/(y(2)*y(2))));
  g1(8,3)=(-((1-y(23))/y(2)));
  g1(8,23)=(-((-y(3))/y(2)));
  g1(8,24)=1;
  g1(9,7)=y(17);
  g1(9,14)=(-(y(15)/(y(14)*y(14))));
  g1(9,15)=(-((-1)/y(14)));
  g1(9,17)=y(7);
  g1(10,5)=(-1);
  g1(10,7)=y(16);
  g1(10,16)=y(7);
  g1(11,4)=(-((-(params(41)*(-y(10))/(y(4)*y(4))))*T278));
  g1(11,9)=1;
  g1(11,10)=(-(T278*(-(params(41)*1/y(4)))));
  g1(12,2)=(-y(21))/(y(2)*y(2));
  g1(12,9)=(-((-y(11))/(y(9)*y(9))));
  g1(12,11)=(-(1/y(9)));
  g1(12,21)=1/y(2);
  g1(13,4)=(-(y(9)*((y(4)*y(10)*params(41)*(-y(10))/(y(4)*y(4))-y(10)*params(41)*(y(10)/y(4)-params(43)))/(y(4)*y(4))-T287)));
  g1(13,5)=(-1);
  g1(13,9)=(-T90);
  g1(13,10)=(-(y(9)*((params(41)*(y(10)/y(4)-params(43))+y(10)*params(41)*1/y(4))/y(4)-T370)));
  g1(13,11)=1;
  g1(14,2)=y(14)*y(2)+y(14)*(y(2)-params(7))-(y(14)*params(36)*y(2)+y(14)*params(36)*(y(2)-params(7)));
  g1(14,4)=(-(T112*T108*T104*y(14)*exp(y(12))*getPowerDeriv(y(4),params(38),1)));
  g1(14,7)=(-T109);
  g1(14,8)=(-(T112*T108*y(14)*exp(y(12))*y(4)^params(38)*getPowerDeriv(y(8),1-params(38),1)));
  g1(14,12)=(-(T109*T112));
  g1(14,14)=y(2)*(y(2)-params(7))-((y(2)-params(7))*params(36)*y(2)+T112*T108*T173);
  g1(15,4)=1-(1-params(43)-(T89+y(4)*T287));
  g1(15,10)=(-(1-y(4)*T370));
  g1(16,1)=(-1);
  g1(16,6)=1;
  g1(16,10)=(-1);
  g1(16,13)=(-1);
  g1(16,25)=(-1);
  g1(16,26)=(-1);
  g1(17,2)=(-(params(33)/2*2*(y(2)-params(7))));
  g1(17,26)=1;
  g1(18,4)=(-(y(9)*y(21)*params(52)*y(22)));
  g1(18,9)=(-(y(4)*y(21)*params(52)*y(22)));
  g1(18,21)=(-(y(4)*y(9)*params(52)*y(22)));
  g1(18,22)=(-(y(4)*y(9)*y(21)*params(52)));
  g1(18,25)=1;
  g1(19,2)=(-((1-params(50))*params(47)*1/params(7)/(y(2)/params(7))));
  g1(19,3)=T252-params(50)*T252;
  g1(19,6)=(-((1-params(50))*params(48)*1/params(12)/((y(6)-y(25))/params(12))));
  g1(19,9)=(-((1-params(50))*params(49)*1/params(15)/(y(9)/params(15))));
  g1(19,25)=(-((1-params(50))*params(48)*(-1)/params(12)/((y(6)-y(25))/params(12))));
  g1(19,27)=(-1);
  g1(20,27)=0.8;
  g1(21,4)=(-(T104*exp(y(12))*getPowerDeriv(y(4),params(38),1)));
  g1(21,6)=1;
  g1(21,8)=(-(exp(y(12))*y(4)^params(38)*getPowerDeriv(y(8),1-params(38),1)));
  g1(21,12)=(-T173);
  g1(22,3)=(-(y(4)*y(9)*(-((y(21)+params(46))*(-1)/(y(3)*y(3))/(2-params(45)+params(52)*(1+params(45)))))));
  g1(22,4)=(-T187);
  g1(22,9)=(-(y(4)*T186));
  g1(22,18)=1;
  g1(22,21)=(-(y(4)*y(9)*(-(1/y(3)/(2-params(45)+params(52)*(1+params(45)))))));
  g1(23,4)=(-y(9));
  g1(23,9)=(-y(4));
  g1(23,18)=1;
  g1(23,19)=1;
  g1(24,4)=(-(params(42)*T201));
  g1(24,9)=(-(params(42)*y(4)*T200));
  g1(24,18)=1-params(42);
  g1(24,21)=(-(params(42)*y(4)*y(9)*(1-1/(2-params(45)))*2*(y(21)+params(46)-(y(21)+params(46))/(2-params(45)))/(params(46)*8)));
  g1(25,4)=(-((-(y(9)*y(19)))/(y(4)*y(9)*y(4)*y(9))));
  g1(25,9)=(-((-(y(4)*y(19)))/(y(4)*y(9)*y(4)*y(9))));
  g1(25,19)=(-(1/(y(4)*y(9))));
  g1(25,20)=1;
  g1(26,3)=(-(0.5*(-((-y(20))/params(46)))));
  g1(26,20)=(-(0.5*(-((-y(3))/params(46)))));
  g1(26,21)=(-(0.5*(-(1/params(46)))));
  g1(26,22)=1;
  g1(27,3)=(-(y(22)*(1+params(45))*.25*(1-params(52))));
  g1(27,20)=(-(y(22)*(1+params(45))*.25*(1-params(52))*(-(y(21)-params(46)))/(y(20)*y(20))));
  g1(27,21)=(-(y(22)*(1+params(45))*.25*(1-params(52))*1/y(20)));
  g1(27,22)=(-((1+params(45))*.25*(1-params(52))*(y(3)+(y(21)-params(46))/y(20))));
  g1(27,23)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],27,729);
end
end
