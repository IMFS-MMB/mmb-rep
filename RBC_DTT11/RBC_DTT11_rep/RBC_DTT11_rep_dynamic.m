function [residual, g1, g2, g3] = RBC_DTT11_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(25, 1);
T48 = exp(y(33))^2;
T51 = exp(T48/2)/2;
T56 = (T48-y(21))/1.414213562373095/exp(y(33));
T57 = erf(T56);
T63 = y(21)/1.414213562373095/exp(y(33));
T64 = erf(T63);
T83 = exp((-0.5)*(y(21)/exp(y(33)))^2);
T88 = T83/2.506628274794649/exp(y(33));
T110 = exp(y(13))*exp(y(15))/(1-y(28)/y(29));
T119 = params(5)*exp(y(37))^(-params(2));
T121 = exp(y(12))^(-params(2));
T219 = 1.0025/params(5)*(exp(y(14))/1.0025)^params(8)*exp(y(34));
lhs =y(35);
rhs =y(12)-params(1)*exp(y(22));
residual(1)= lhs-rhs;
lhs =y(36);
rhs =y(35)+params(5)*y(46);
residual(2)= lhs-rhs;
residual(3) = (-y(28))+exp(y(45))*exp(y(43))*y(42);
residual(4) = (-y(29))+1-y(41);
residual(5) = (-y(27))+y(1);
residual(6) = (-y(17))+T51*(1+T57)-exp(y(21))/2*(1-T64);
residual(7) = (-y(18))+T51*(1-T57);
residual(8) = (-y(20))+T88/exp(y(21));
residual(9) = (-y(19))+(1+T64)/2;
residual(10) = (-exp(y(44)))*y(39)+T110;
residual(11) = (-1)/exp(y(13))+T119/T121/exp(y(38));
residual(12) = (-exp(y(44)))*(1-exp(y(45))*y(40)-y(39))+exp(y(13))*(1-exp(y(15)));
residual(13) = (-exp(y(22)))*exp(y(30))*exp(y(1))+exp(y(24))*exp(y(16));
residual(14) = (-exp(y(16)))*exp(y(14))*exp(y(6))+(1-exp(y(9)))*y(3)*exp(y(4))*exp(y(2));
residual(15) = (-exp(y(24)))+T121*exp(y(30))/params(1);
residual(16) = exp(y(12))+exp(y(22))*exp(y(30))*(-(1-params(13)))*(1-y(18)*exp(y(31)));
residual(17) = (-exp(y(23)))+exp(y(22))*exp(y(30));
residual(18) = (-exp(y(24)))+exp(y(5))*(1-exp(y(1)))/exp(y(21));
residual(19) = (-exp(y(26)))+exp(y(25))/exp(y(13));
residual(20) = (-exp(y(13)))+params(12)+T219;
residual(21) = y(30)-params(7)*y(7)-x(it_, 1);
residual(22) = y(31)-(1-params(9))*log(params(3))-params(9)*y(8)-x(it_, 2);
residual(23) = y(32)-(1-params(10))*log(params(4))-y(9)*params(10)-x(it_, 3);
residual(24) = y(33)-(1-params(11))*log(params(6))-params(11)*y(10)-x(it_, 4);
residual(25) = y(34)-params(7)*y(11)-x(it_, 5);
if nargout >= 2,
  g1 = zeros(25, 51);

  %
  % Jacobian matrix
  %

T272 = exp(y(12))*getPowerDeriv(exp(y(12)),(-params(2)),1);
T316 = 2/(exp(T56^2)*1.772453850905516);
T323 = 2/(1.772453850905516*exp(T63^2));
T352 = (1-y(28)/y(29))*(1-y(28)/y(29));
T376 = exp(T48/2)*exp(y(33))*2*exp(y(33))/2/2;
T383 = T316*(exp(y(33))*exp(y(33))*2*exp(y(33))/1.414213562373095-exp(y(33))*(T48-y(21))/1.414213562373095)/(exp(y(33))*exp(y(33)));
T390 = T323*(-(exp(y(33))*y(21)/1.414213562373095))/(exp(y(33))*exp(y(33)));
  g1(1,12)=(-1);
  g1(1,22)=params(1)*exp(y(22));
  g1(1,35)=1;
  g1(2,35)=(-1);
  g1(2,36)=1;
  g1(2,46)=(-params(5));
  g1(3,42)=exp(y(45))*exp(y(43));
  g1(3,43)=exp(y(45))*exp(y(43))*y(42);
  g1(3,28)=(-1);
  g1(3,45)=exp(y(45))*exp(y(43))*y(42);
  g1(4,41)=(-1);
  g1(4,29)=(-1);
  g1(5,1)=1;
  g1(5,27)=(-1);
  g1(6,17)=(-1);
  g1(6,21)=T51*(-0.7071067811865476)/exp(y(33))*T316-(exp(y(21))/2*(1-T64)+exp(y(21))/2*(-(0.7071067811865476/exp(y(33))*T323)));
  g1(6,33)=(1+T57)*T376+T51*T383-exp(y(21))/2*(-T390);
  g1(7,18)=(-1);
  g1(7,21)=T51*(-((-0.7071067811865476)/exp(y(33))*T316));
  g1(7,33)=(1-T57)*T376+T51*(-T383);
  g1(8,20)=(-1);
  g1(8,21)=(exp(y(21))*T83*(-0.5)*1/exp(y(33))*2*y(21)/exp(y(33))/2.506628274794649/exp(y(33))-exp(y(21))*T88)/(exp(y(21))*exp(y(21)));
  g1(8,33)=(exp(y(33))*T83*(-0.5)*2*y(21)/exp(y(33))*(-(exp(y(33))*y(21)))/(exp(y(33))*exp(y(33)))/2.506628274794649-exp(y(33))*T83/2.506628274794649)/(exp(y(33))*exp(y(33)))/exp(y(21));
  g1(9,19)=(-1);
  g1(9,21)=0.7071067811865476/exp(y(33))*T323/2;
  g1(9,33)=T390/2;
  g1(10,13)=T110;
  g1(10,15)=T110;
  g1(10,39)=(-exp(y(44)));
  g1(10,44)=(-exp(y(44)))*y(39);
  g1(10,28)=(-(exp(y(13))*exp(y(15))*(-(1/y(29)))))/T352;
  g1(10,29)=(-(exp(y(13))*exp(y(15))*(-((-y(28))/(y(29)*y(29))))))/T352;
  g1(11,12)=(-(T119*T272))/(T121*T121)/exp(y(38));
  g1(11,37)=params(5)*exp(y(37))*getPowerDeriv(exp(y(37)),(-params(2)),1)/T121/exp(y(38));
  g1(11,13)=exp(y(13))/(exp(y(13))*exp(y(13)));
  g1(11,38)=(-(T119/T121*exp(y(38))))/(exp(y(38))*exp(y(38)));
  g1(12,13)=exp(y(13))*(1-exp(y(15)));
  g1(12,15)=exp(y(13))*(-exp(y(15)));
  g1(12,39)=exp(y(44));
  g1(12,40)=(-exp(y(44)))*(-exp(y(45)));
  g1(12,44)=(-exp(y(44)))*(1-exp(y(45))*y(40)-y(39));
  g1(12,45)=(-exp(y(44)))*(-(exp(y(45))*y(40)));
  g1(13,1)=(-exp(y(22)))*exp(y(30))*exp(y(1));
  g1(13,16)=exp(y(24))*exp(y(16));
  g1(13,22)=(-exp(y(22)))*exp(y(30))*exp(y(1));
  g1(13,24)=exp(y(24))*exp(y(16));
  g1(13,30)=(-exp(y(22)))*exp(y(30))*exp(y(1));
  g1(14,14)=(-exp(y(16)))*exp(y(14))*exp(y(6));
  g1(14,2)=(1-exp(y(9)))*y(3)*exp(y(4))*exp(y(2));
  g1(14,16)=(-exp(y(16)))*exp(y(14))*exp(y(6));
  g1(14,3)=exp(y(2))*(1-exp(y(9)))*exp(y(4));
  g1(14,4)=(1-exp(y(9)))*y(3)*exp(y(4))*exp(y(2));
  g1(14,6)=(-exp(y(16)))*exp(y(14))*exp(y(6));
  g1(14,9)=exp(y(2))*exp(y(4))*y(3)*(-exp(y(9)));
  g1(15,12)=exp(y(30))*T272/params(1);
  g1(15,24)=(-exp(y(24)));
  g1(15,30)=T121*exp(y(30))/params(1);
  g1(16,12)=exp(y(12));
  g1(16,18)=exp(y(22))*exp(y(30))*(-(1-params(13)))*(-exp(y(31)));
  g1(16,22)=exp(y(22))*exp(y(30))*(-(1-params(13)))*(1-y(18)*exp(y(31)));
  g1(16,30)=exp(y(22))*exp(y(30))*(-(1-params(13)))*(1-y(18)*exp(y(31)));
  g1(16,31)=exp(y(22))*exp(y(30))*(-(1-params(13)))*(-(y(18)*exp(y(31))));
  g1(17,22)=exp(y(22))*exp(y(30));
  g1(17,23)=(-exp(y(23)));
  g1(17,30)=exp(y(22))*exp(y(30));
  g1(18,1)=exp(y(5))*(-exp(y(1)))/exp(y(21));
  g1(18,21)=(-(exp(y(21))*exp(y(5))*(1-exp(y(1)))))/(exp(y(21))*exp(y(21)));
  g1(18,24)=(-exp(y(24)));
  g1(18,5)=exp(y(5))*(1-exp(y(1)))/exp(y(21));
  g1(19,13)=(-(exp(y(13))*exp(y(25))))/(exp(y(13))*exp(y(13)));
  g1(19,25)=exp(y(25))/exp(y(13));
  g1(19,26)=(-exp(y(26)));
  g1(20,13)=(-exp(y(13)));
  g1(20,14)=exp(y(34))*1.0025/params(5)*exp(y(14))/1.0025*getPowerDeriv(exp(y(14))/1.0025,params(8),1);
  g1(20,34)=T219;
  g1(21,7)=(-params(7));
  g1(21,30)=1;
  g1(21,47)=(-1);
  g1(22,8)=(-params(9));
  g1(22,31)=1;
  g1(22,48)=(-1);
  g1(23,9)=(-params(10));
  g1(23,32)=1;
  g1(23,49)=(-1);
  g1(24,10)=(-params(11));
  g1(24,33)=1;
  g1(24,50)=(-1);
  g1(25,11)=(-params(7));
  g1(25,34)=1;
  g1(25,51)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],25,2601);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],25,132651);
end
end
end
end
