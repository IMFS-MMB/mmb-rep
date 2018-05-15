function [residual, g1, g2, g3] = RBC_DTT11_rep_static(y, x, params)
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

T47 = exp(y(22))^2;
T50 = exp(T47/2)/2;
T54 = (T47-y(10))/1.414213562373095/exp(y(22));
T55 = erf(T54);
T60 = y(10)/1.414213562373095/exp(y(22));
T61 = erf(T60);
T79 = exp((-0.5)*(y(10)/exp(y(22)))^2);
T82 = T79/2.506628274794649/exp(y(22));
T101 = exp(y(2))*exp(y(4))/(1-y(17)/y(18));
T108 = exp(y(1))^(-params(2));
T187 = 1.0025/params(5)*(exp(y(3))/1.0025)^params(8)*exp(y(23));
lhs =y(24);
rhs =y(1)-params(1)*exp(y(11));
residual(1)= lhs-rhs;
lhs =y(25);
rhs =y(24)+y(25)*params(5);
residual(2)= lhs-rhs;
residual(3) = (-y(17))+exp(y(20))*exp(y(10))*y(9);
residual(4) = (-y(18))+1-y(8);
residual(5) = (-y(16))+y(4);
residual(6) = (-y(6))+T50*(1+T55)-exp(y(10))/2*(1-T61);
residual(7) = (-y(7))+T50*(1-T55);
residual(8) = (-y(9))+T82/exp(y(10));
residual(9) = (-y(8))+(1+T61)/2;
residual(10) = y(6)*(-exp(y(13)))+T101;
residual(11) = (-1)/exp(y(2))+params(5)*T108/T108/exp(y(3));
residual(12) = (-exp(y(13)))*(1-exp(y(20))*y(7)-y(6))+exp(y(2))*(1-exp(y(4)));
residual(13) = exp(y(4))*(-exp(y(11)))*exp(y(19))+exp(y(13))*exp(y(5));
residual(14) = exp(y(3))*(-exp(y(5)))*exp(y(16))+exp(y(5))*exp(y(13))*y(6)*(1-exp(y(21)));
residual(15) = (-exp(y(13)))+T108*exp(y(19))/params(1);
residual(16) = exp(y(1))+(1-exp(y(20))*y(7))*exp(y(11))*exp(y(19))*(-(1-params(13)));
residual(17) = (-exp(y(12)))+exp(y(11))*exp(y(19));
residual(18) = (-exp(y(13)))+(1-exp(y(4)))*exp(y(14))/exp(y(10));
residual(19) = (-exp(y(15)))+exp(y(14))/exp(y(2));
residual(20) = (-exp(y(2)))+params(12)+T187;
residual(21) = y(19)-y(19)*params(7)-x(1);
residual(22) = y(20)-(1-params(9))*log(params(3))-y(20)*params(9)-x(2);
residual(23) = y(21)-(1-params(10))*log(params(4))-y(21)*params(10)-x(3);
residual(24) = y(22)-(1-params(11))*log(params(6))-y(22)*params(11)-x(4);
residual(25) = y(23)-y(23)*params(7)-x(5);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(25, 25);

  %
  % Jacobian matrix
  %

T235 = exp(y(1))*getPowerDeriv(exp(y(1)),(-params(2)),1);
T274 = 2/(exp(T54^2)*1.772453850905516);
T281 = 2/(1.772453850905516*exp(T60^2));
T310 = (1-y(17)/y(18))*(1-y(17)/y(18));
T330 = exp(T47/2)*exp(y(22))*2*exp(y(22))/2/2;
T337 = T274*(exp(y(22))*exp(y(22))*2*exp(y(22))/1.414213562373095-exp(y(22))*(T47-y(10))/1.414213562373095)/(exp(y(22))*exp(y(22)));
T344 = T281*(-(exp(y(22))*y(10)/1.414213562373095))/(exp(y(22))*exp(y(22)));
  g1(1,1)=(-1);
  g1(1,11)=params(1)*exp(y(11));
  g1(1,24)=1;
  g1(2,24)=(-1);
  g1(2,25)=1-params(5);
  g1(3,9)=exp(y(20))*exp(y(10));
  g1(3,10)=exp(y(20))*exp(y(10))*y(9);
  g1(3,17)=(-1);
  g1(3,20)=exp(y(20))*exp(y(10))*y(9);
  g1(4,8)=(-1);
  g1(4,18)=(-1);
  g1(5,4)=1;
  g1(5,16)=(-1);
  g1(6,6)=(-1);
  g1(6,10)=T50*(-0.7071067811865476)/exp(y(22))*T274-(exp(y(10))/2*(1-T61)+exp(y(10))/2*(-(0.7071067811865476/exp(y(22))*T281)));
  g1(6,22)=(1+T55)*T330+T50*T337-exp(y(10))/2*(-T344);
  g1(7,7)=(-1);
  g1(7,10)=T50*(-((-0.7071067811865476)/exp(y(22))*T274));
  g1(7,22)=(1-T55)*T330+T50*(-T337);
  g1(8,9)=(-1);
  g1(8,10)=(exp(y(10))*T79*(-0.5)*1/exp(y(22))*2*y(10)/exp(y(22))/2.506628274794649/exp(y(22))-exp(y(10))*T82)/(exp(y(10))*exp(y(10)));
  g1(8,22)=(exp(y(22))*T79*(-0.5)*2*y(10)/exp(y(22))*(-(y(10)*exp(y(22))))/(exp(y(22))*exp(y(22)))/2.506628274794649-exp(y(22))*T79/2.506628274794649)/(exp(y(22))*exp(y(22)))/exp(y(10));
  g1(9,8)=(-1);
  g1(9,10)=0.7071067811865476/exp(y(22))*T281/2;
  g1(9,22)=T344/2;
  g1(10,2)=T101;
  g1(10,4)=T101;
  g1(10,6)=(-exp(y(13)));
  g1(10,13)=y(6)*(-exp(y(13)));
  g1(10,17)=(-(exp(y(2))*exp(y(4))*(-(1/y(18)))))/T310;
  g1(10,18)=(-(exp(y(2))*exp(y(4))*(-((-y(17))/(y(18)*y(18))))))/T310;
  g1(11,1)=(T108*params(5)*T235-params(5)*T108*T235)/(T108*T108)/exp(y(3));
  g1(11,2)=exp(y(2))/(exp(y(2))*exp(y(2)));
  g1(11,3)=(-(params(5)*T108/T108*exp(y(3))))/(exp(y(3))*exp(y(3)));
  g1(12,2)=exp(y(2))*(1-exp(y(4)));
  g1(12,4)=exp(y(2))*(-exp(y(4)));
  g1(12,6)=exp(y(13));
  g1(12,7)=(-exp(y(13)))*(-exp(y(20)));
  g1(12,13)=(-exp(y(13)))*(1-exp(y(20))*y(7)-y(6));
  g1(12,20)=(-exp(y(13)))*(-(exp(y(20))*y(7)));
  g1(13,4)=exp(y(4))*(-exp(y(11)))*exp(y(19));
  g1(13,5)=exp(y(13))*exp(y(5));
  g1(13,11)=exp(y(4))*(-exp(y(11)))*exp(y(19));
  g1(13,13)=exp(y(13))*exp(y(5));
  g1(13,19)=exp(y(4))*(-exp(y(11)))*exp(y(19));
  g1(14,3)=exp(y(3))*(-exp(y(5)))*exp(y(16));
  g1(14,5)=exp(y(3))*(-exp(y(5)))*exp(y(16))+exp(y(5))*exp(y(13))*y(6)*(1-exp(y(21)));
  g1(14,6)=exp(y(5))*exp(y(13))*(1-exp(y(21)));
  g1(14,13)=exp(y(5))*exp(y(13))*y(6)*(1-exp(y(21)));
  g1(14,16)=exp(y(3))*(-exp(y(5)))*exp(y(16));
  g1(14,21)=exp(y(5))*exp(y(13))*y(6)*(-exp(y(21)));
  g1(15,1)=exp(y(19))*T235/params(1);
  g1(15,13)=(-exp(y(13)));
  g1(15,19)=T108*exp(y(19))/params(1);
  g1(16,1)=exp(y(1));
  g1(16,7)=exp(y(11))*exp(y(19))*(-(1-params(13)))*(-exp(y(20)));
  g1(16,11)=(1-exp(y(20))*y(7))*exp(y(11))*exp(y(19))*(-(1-params(13)));
  g1(16,19)=(1-exp(y(20))*y(7))*exp(y(11))*exp(y(19))*(-(1-params(13)));
  g1(16,20)=exp(y(11))*exp(y(19))*(-(1-params(13)))*(-(exp(y(20))*y(7)));
  g1(17,11)=exp(y(11))*exp(y(19));
  g1(17,12)=(-exp(y(12)));
  g1(17,19)=exp(y(11))*exp(y(19));
  g1(18,4)=exp(y(14))*(-exp(y(4)))/exp(y(10));
  g1(18,10)=(-(exp(y(10))*(1-exp(y(4)))*exp(y(14))))/(exp(y(10))*exp(y(10)));
  g1(18,13)=(-exp(y(13)));
  g1(18,14)=(1-exp(y(4)))*exp(y(14))/exp(y(10));
  g1(19,2)=(-(exp(y(2))*exp(y(14))))/(exp(y(2))*exp(y(2)));
  g1(19,14)=exp(y(14))/exp(y(2));
  g1(19,15)=(-exp(y(15)));
  g1(20,2)=(-exp(y(2)));
  g1(20,3)=exp(y(23))*1.0025/params(5)*exp(y(3))/1.0025*getPowerDeriv(exp(y(3))/1.0025,params(8),1);
  g1(20,23)=T187;
  g1(21,19)=1-params(7);
  g1(22,20)=1-params(9);
  g1(23,21)=1-params(10);
  g1(24,22)=1-params(11);
  g1(25,23)=1-params(7);
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
