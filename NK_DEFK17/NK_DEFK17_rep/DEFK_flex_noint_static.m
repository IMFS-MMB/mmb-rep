function [residual, g1, g2, g3] = DEFK_flex_noint_static(y, x, params)
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

residual = zeros( 25, 1);

%
% Model equations
%

T11 = y(1)^(-params(2));
T25 = 1+params(4)*(y(16)-y(17))/(y(17)-y(16)*params(5));
T33 = (y(18)+y(16)*(1-params(8)))/y(16);
T40 = (y(17)-y(16)*params(5))*(y(18)+y(16)*(1-params(8)));
T42 = 1+params(4)*(y(16)-y(17))*(y(18)+y(16)*(1-params(8))*y(25))/T40;
T78 = params(30)*y(8)^params(6);
T81 = y(5)^(1-params(6));
T91 = (y(5)/y(8))^(1-params(6));
T98 = (y(8)/y(5))^params(6);
lhs =T11;
rhs =T11*params(1)*y(14)*T25;
residual(1)= lhs-rhs;
lhs =T11;
rhs =T11*params(1)*T33*T42;
residual(2)= lhs-rhs;
lhs =(y(17)-y(16)*params(5))*y(2);
rhs =params(4)*((y(18)+y(16)*(1-params(8))*y(25))*y(9)+y(14)*y(11)*y(6)-y(7));
residual(3)= lhs-rhs;
lhs =y(17);
rhs =1+y(3)+y(4)*y(2)/params(20);
residual(4)= lhs-rhs;
lhs =y(3);
rhs =params(9)*(y(2)/params(20)-1)^2/2;
residual(5)= lhs-rhs;
lhs =y(4);
rhs =params(9)*(y(2)/params(20)-1);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =T78*T81-params(7);
residual(7)= lhs-rhs;
lhs =y(19);
rhs =params(30)*params(6)*y(22)*T91;
residual(8)= lhs-rhs;
lhs =y(21);
rhs =params(30)*(1-params(6))*y(22)*T98;
residual(9)= lhs-rhs;
lhs =y(18)*y(8);
rhs =y(6)-y(5)*y(21)+y(2)*(y(17)-(1+y(3)));
residual(10)= lhs-rhs;
lhs =y(8);
rhs =y(9)+y(10);
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(2)+(1-params(8))*y(8);
residual(12)= lhs-rhs;
lhs =y(22)*(1+params(11));
rhs =1;
residual(13)= lhs-rhs;
lhs =(1+params(10))*y(5)^params(3);
rhs =T11*y(21);
residual(14)= lhs-rhs;
residual(15) = y(10);
lhs =y(7);
rhs =params(28)+params(16)*(y(14)*y(11)*y(6)-params(23)*params(29)*params(18)-y(16)*y(10));
residual(16)= lhs-rhs;
lhs =y(14)*y(11)*y(6)+y(16)*y(10);
rhs =y(7)+(y(18)+y(16)*(1-params(8)))*y(10)+y(11)*y(6);
residual(17)= lhs-rhs;
lhs =y(6);
rhs =y(1)+y(2)*(1+y(3));
residual(18)= lhs-rhs;
lhs =y(20);
rhs =T33;
residual(19)= lhs-rhs;
lhs =y(24);
rhs =y(20)-y(14);
residual(20)= lhs-rhs;
lhs =y(23);
rhs =params(4)*(y(16)-y(17))/(y(17)-y(16)*params(5));
residual(21)= lhs-rhs;
lhs =y(12);
rhs =y(16)*y(8);
residual(22)= lhs-rhs;
lhs =y(13);
rhs =y(1)+y(17)*y(2);
residual(23)= lhs-rhs;
lhs =T11;
rhs =params(1)*T11*y(15);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =(1-params(17))*params(31)+y(25)*params(17)+x(1);
residual(25)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(25, 25);

  %
  % Jacobian matrix
  %

T175 = getPowerDeriv(y(1),(-params(2)),1);
T207 = getPowerDeriv(y(5)/y(8),1-params(6),1);
T214 = getPowerDeriv(y(8)/y(5),params(6),1);
T266 = (params(4)*(y(17)-y(16)*params(5))-params(4)*(y(16)-y(17))*(-params(5)))/((y(17)-y(16)*params(5))*(y(17)-y(16)*params(5)));
T300 = ((y(17)-y(16)*params(5))*(-params(4))-params(4)*(y(16)-y(17)))/((y(17)-y(16)*params(5))*(y(17)-y(16)*params(5)));
  g1(1,1)=T175-T25*y(14)*params(1)*T175;
  g1(1,14)=(-(T11*params(1)*T25));
  g1(1,16)=(-(T11*params(1)*y(14)*T266));
  g1(1,17)=(-(T11*params(1)*y(14)*T300));
  g1(2,1)=T175-T42*T33*params(1)*T175;
  g1(2,16)=(-(T42*T11*params(1)*(y(16)*(1-params(8))-(y(18)+y(16)*(1-params(8))))/(y(16)*y(16))+T11*params(1)*T33*(T40*(params(4)*(y(18)+y(16)*(1-params(8))*y(25))+params(4)*(y(16)-y(17))*(1-params(8))*y(25))-params(4)*(y(16)-y(17))*(y(18)+y(16)*(1-params(8))*y(25))*((y(18)+y(16)*(1-params(8)))*(-params(5))+(y(17)-y(16)*params(5))*(1-params(8))))/(T40*T40)));
  g1(2,17)=(-(T11*params(1)*T33*(T40*(y(18)+y(16)*(1-params(8))*y(25))*(-params(4))-(y(18)+y(16)*(1-params(8)))*params(4)*(y(16)-y(17))*(y(18)+y(16)*(1-params(8))*y(25)))/(T40*T40)));
  g1(2,18)=(-(T42*T11*params(1)*1/y(16)+T11*params(1)*T33*(params(4)*(y(16)-y(17))*T40-(y(17)-y(16)*params(5))*params(4)*(y(16)-y(17))*(y(18)+y(16)*(1-params(8))*y(25)))/(T40*T40)));
  g1(2,25)=(-(T11*params(1)*T33*params(4)*(y(16)-y(17))*y(16)*(1-params(8))/T40));
  g1(3,2)=y(17)-y(16)*params(5);
  g1(3,6)=(-(params(4)*y(14)*y(11)));
  g1(3,7)=params(4);
  g1(3,9)=(-(params(4)*(y(18)+y(16)*(1-params(8))*y(25))));
  g1(3,11)=(-(params(4)*y(14)*y(6)));
  g1(3,14)=(-(params(4)*y(11)*y(6)));
  g1(3,16)=y(2)*(-params(5))-params(4)*(1-params(8))*y(25)*y(9);
  g1(3,17)=y(2);
  g1(3,18)=(-(params(4)*y(9)));
  g1(3,25)=(-(params(4)*y(16)*(1-params(8))*y(9)));
  g1(4,2)=(-(y(4)*1/params(20)));
  g1(4,3)=(-1);
  g1(4,4)=(-(y(2)/params(20)));
  g1(4,17)=1;
  g1(5,2)=(-(params(9)*1/params(20)*2*(y(2)/params(20)-1)/2));
  g1(5,3)=1;
  g1(6,2)=(-(params(9)*1/params(20)));
  g1(6,4)=1;
  g1(7,5)=(-(T78*getPowerDeriv(y(5),1-params(6),1)));
  g1(7,6)=1;
  g1(7,8)=(-(T81*params(30)*getPowerDeriv(y(8),params(6),1)));
  g1(8,5)=(-(params(30)*params(6)*y(22)*1/y(8)*T207));
  g1(8,8)=(-(params(30)*params(6)*y(22)*T207*(-y(5))/(y(8)*y(8))));
  g1(8,19)=1;
  g1(8,22)=(-(T91*params(30)*params(6)));
  g1(9,5)=(-(params(30)*(1-params(6))*y(22)*(-y(8))/(y(5)*y(5))*T214));
  g1(9,8)=(-(params(30)*(1-params(6))*y(22)*T214*1/y(5)));
  g1(9,21)=1;
  g1(9,22)=(-(T98*params(30)*(1-params(6))));
  g1(10,2)=(-(y(17)-(1+y(3))));
  g1(10,3)=y(2);
  g1(10,5)=y(21);
  g1(10,6)=(-1);
  g1(10,8)=y(18);
  g1(10,17)=(-y(2));
  g1(10,18)=y(8);
  g1(10,21)=y(5);
  g1(11,8)=1;
  g1(11,9)=(-1);
  g1(11,10)=(-1);
  g1(12,2)=(-1);
  g1(12,8)=1-(1-params(8));
  g1(13,22)=1+params(11);
  g1(14,1)=(-(y(21)*T175));
  g1(14,5)=(1+params(10))*getPowerDeriv(y(5),params(3),1);
  g1(14,21)=(-T11);
  g1(15,10)=1;
  g1(16,6)=(-(y(14)*y(11)*params(16)));
  g1(16,7)=1;
  g1(16,10)=(-(params(16)*(-y(16))));
  g1(16,11)=(-(params(16)*y(14)*y(6)));
  g1(16,14)=(-(params(16)*y(11)*y(6)));
  g1(16,16)=(-(params(16)*(-y(10))));
  g1(17,6)=y(14)*y(11)-y(11);
  g1(17,7)=(-1);
  g1(17,10)=y(16)-(y(18)+y(16)*(1-params(8)));
  g1(17,11)=y(14)*y(6)-y(6);
  g1(17,14)=y(11)*y(6);
  g1(17,16)=y(10)-(1-params(8))*y(10);
  g1(17,18)=(-y(10));
  g1(18,1)=(-1);
  g1(18,2)=(-(1+y(3)));
  g1(18,3)=(-y(2));
  g1(18,6)=1;
  g1(19,16)=(-((y(16)*(1-params(8))-(y(18)+y(16)*(1-params(8))))/(y(16)*y(16))));
  g1(19,18)=(-(1/y(16)));
  g1(19,20)=1;
  g1(20,14)=1;
  g1(20,20)=(-1);
  g1(20,24)=1;
  g1(21,16)=(-T266);
  g1(21,17)=(-T300);
  g1(21,23)=1;
  g1(22,8)=(-y(16));
  g1(22,12)=1;
  g1(22,16)=(-y(8));
  g1(23,1)=(-1);
  g1(23,2)=(-y(17));
  g1(23,13)=1;
  g1(23,17)=(-y(2));
  g1(24,1)=T175-params(1)*y(15)*T175;
  g1(24,15)=(-(T11*params(1)));
  g1(25,25)=1-params(17);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],25,625);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],25,15625);
end
end
end
end
