function [residual, g1, g2, g3] = DEFK_flex_noint_dynamic(y, x, params, steady_state, it_)
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
T11 = y(8)^(-params(2));
T14 = y(33)^(-params(2));
T15 = params(1)*T14;
T27 = 1+params(4)*(y(34)-y(35))/(y(35)-y(34)*params(5));
T36 = (y(36)+y(34)*(1-params(8)))/y(23);
T43 = (y(35)-y(34)*params(5))*(y(36)+y(34)*(1-params(8)));
T45 = 1+params(4)*(y(34)-y(35))*(y(36)+y(34)*(1-params(8))*y(37))/T43;
T91 = params(30)*y(2)^params(6);
T94 = y(12)^(1-params(6));
T104 = (y(12)/y(2))^(1-params(6));
T111 = (y(2)/y(12))^params(6);
lhs =T11;
rhs =T15*y(21)*T27;
residual(1)= lhs-rhs;
lhs =T11;
rhs =T15*T36*T45;
residual(2)= lhs-rhs;
lhs =(y(24)-params(5)*y(23))*y(9);
rhs =params(4)*((y(25)+y(23)*(1-params(8))*y(32))*y(3)+y(6)*y(5)*y(1)-y(14));
residual(3)= lhs-rhs;
lhs =y(24);
rhs =1+y(10)+y(11)*y(9)/params(20);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =params(9)*(y(9)/params(20)-1)^2/2;
residual(5)= lhs-rhs;
lhs =y(11);
rhs =params(9)*(y(9)/params(20)-1);
residual(6)= lhs-rhs;
lhs =y(13);
rhs =T91*T94-params(7);
residual(7)= lhs-rhs;
lhs =y(26);
rhs =params(30)*params(6)*y(29)*T104;
residual(8)= lhs-rhs;
lhs =y(28);
rhs =params(30)*(1-params(6))*y(29)*T111;
residual(9)= lhs-rhs;
lhs =y(25)*y(2);
rhs =y(13)-y(12)*y(28)+y(9)*(y(24)-(1+y(10)));
residual(10)= lhs-rhs;
lhs =y(15);
rhs =y(16)+y(17);
residual(11)= lhs-rhs;
lhs =y(15);
rhs =y(9)+(1-params(8))*y(2);
residual(12)= lhs-rhs;
lhs =y(29)*(1+params(11));
rhs =1;
residual(13)= lhs-rhs;
lhs =(1+params(10))*y(12)^params(3);
rhs =T11*y(28);
residual(14)= lhs-rhs;
residual(15) = y(17);
lhs =y(14);
rhs =params(28)+params(16)*(y(6)*y(5)*y(1)-params(23)*params(29)*params(18)-y(23)*y(4));
residual(16)= lhs-rhs;
lhs =y(6)*y(5)*y(1)+y(23)*y(17);
rhs =y(14)+y(4)*(y(25)+(1-params(8))*y(23))+y(13)*y(18);
residual(17)= lhs-rhs;
lhs =y(13);
rhs =y(8)+y(9)*(1+y(10));
residual(18)= lhs-rhs;
lhs =y(27);
rhs =T36;
residual(19)= lhs-rhs;
lhs =y(31);
rhs =y(27)-y(21);
residual(20)= lhs-rhs;
lhs =y(30);
rhs =params(4)*(y(34)-y(35))/(y(35)-y(34)*params(5));
residual(21)= lhs-rhs;
lhs =y(19);
rhs =y(23)*y(2);
residual(22)= lhs-rhs;
lhs =y(20);
rhs =y(8)+y(24)*y(9);
residual(23)= lhs-rhs;
lhs =T11;
rhs =params(1)*T14*y(22);
residual(24)= lhs-rhs;
lhs =y(32);
rhs =(1-params(17))*params(31)+params(17)*y(7)+x(it_, 1);
residual(25)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(25, 38);

  %
  % Jacobian matrix
  %

T196 = getPowerDeriv(y(8),(-params(2)),1);
T199 = getPowerDeriv(y(33),(-params(2)),1);
T200 = params(1)*T199;
T229 = getPowerDeriv(y(12)/y(2),1-params(6),1);
T236 = getPowerDeriv(y(2)/y(12),params(6),1);
T305 = (params(4)*(y(35)-y(34)*params(5))-params(4)*(y(34)-y(35))*(-params(5)))/((y(35)-y(34)*params(5))*(y(35)-y(34)*params(5)));
T329 = ((y(35)-y(34)*params(5))*(-params(4))-params(4)*(y(34)-y(35)))/((y(35)-y(34)*params(5))*(y(35)-y(34)*params(5)));
  g1(1,8)=T196;
  g1(1,33)=(-(T27*y(21)*T200));
  g1(1,21)=(-(T15*T27));
  g1(1,34)=(-(T15*y(21)*T305));
  g1(1,35)=(-(T15*y(21)*T329));
  g1(2,8)=T196;
  g1(2,33)=(-(T45*T36*T200));
  g1(2,23)=(-(T45*T15*(-(y(36)+y(34)*(1-params(8))))/(y(23)*y(23))));
  g1(2,34)=(-(T45*T15*(1-params(8))/y(23)+T15*T36*(T43*(params(4)*(y(36)+y(34)*(1-params(8))*y(37))+params(4)*(y(34)-y(35))*(1-params(8))*y(37))-params(4)*(y(34)-y(35))*(y(36)+y(34)*(1-params(8))*y(37))*((y(36)+y(34)*(1-params(8)))*(-params(5))+(y(35)-y(34)*params(5))*(1-params(8))))/(T43*T43)));
  g1(2,35)=(-(T15*T36*(T43*(y(36)+y(34)*(1-params(8))*y(37))*(-params(4))-(y(36)+y(34)*(1-params(8)))*params(4)*(y(34)-y(35))*(y(36)+y(34)*(1-params(8))*y(37)))/(T43*T43)));
  g1(2,36)=(-(T45*T15*1/y(23)+T15*T36*(params(4)*(y(34)-y(35))*T43-(y(35)-y(34)*params(5))*params(4)*(y(34)-y(35))*(y(36)+y(34)*(1-params(8))*y(37)))/(T43*T43)));
  g1(2,37)=(-(T15*T36*params(4)*(y(34)-y(35))*y(34)*(1-params(8))/T43));
  g1(3,9)=y(24)-params(5)*y(23);
  g1(3,1)=(-(params(4)*y(6)*y(5)));
  g1(3,14)=params(4);
  g1(3,3)=(-(params(4)*(y(25)+y(23)*(1-params(8))*y(32))));
  g1(3,5)=(-(params(4)*y(6)*y(1)));
  g1(3,6)=(-(params(4)*y(5)*y(1)));
  g1(3,23)=y(9)*(-params(5))-params(4)*(1-params(8))*y(32)*y(3);
  g1(3,24)=y(9);
  g1(3,25)=(-(params(4)*y(3)));
  g1(3,32)=(-(params(4)*y(3)*(1-params(8))*y(23)));
  g1(4,9)=(-(y(11)*1/params(20)));
  g1(4,10)=(-1);
  g1(4,11)=(-(y(9)/params(20)));
  g1(4,24)=1;
  g1(5,9)=(-(params(9)*1/params(20)*2*(y(9)/params(20)-1)/2));
  g1(5,10)=1;
  g1(6,9)=(-(params(9)*1/params(20)));
  g1(6,11)=1;
  g1(7,12)=(-(T91*getPowerDeriv(y(12),1-params(6),1)));
  g1(7,13)=1;
  g1(7,2)=(-(T94*params(30)*getPowerDeriv(y(2),params(6),1)));
  g1(8,12)=(-(params(30)*params(6)*y(29)*1/y(2)*T229));
  g1(8,2)=(-(params(30)*params(6)*y(29)*T229*(-y(12))/(y(2)*y(2))));
  g1(8,26)=1;
  g1(8,29)=(-(T104*params(30)*params(6)));
  g1(9,12)=(-(params(30)*(1-params(6))*y(29)*(-y(2))/(y(12)*y(12))*T236));
  g1(9,2)=(-(params(30)*(1-params(6))*y(29)*T236*1/y(12)));
  g1(9,28)=1;
  g1(9,29)=(-(T111*params(30)*(1-params(6))));
  g1(10,9)=(-(y(24)-(1+y(10))));
  g1(10,10)=y(9);
  g1(10,12)=y(28);
  g1(10,13)=(-1);
  g1(10,2)=y(25);
  g1(10,24)=(-y(9));
  g1(10,25)=y(2);
  g1(10,28)=y(12);
  g1(11,15)=1;
  g1(11,16)=(-1);
  g1(11,17)=(-1);
  g1(12,9)=(-1);
  g1(12,2)=(-(1-params(8)));
  g1(12,15)=1;
  g1(13,29)=1+params(11);
  g1(14,8)=(-(y(28)*T196));
  g1(14,12)=(1+params(10))*getPowerDeriv(y(12),params(3),1);
  g1(14,28)=(-T11);
  g1(15,17)=1;
  g1(16,1)=(-(y(6)*y(5)*params(16)));
  g1(16,14)=1;
  g1(16,4)=(-(params(16)*(-y(23))));
  g1(16,5)=(-(params(16)*y(6)*y(1)));
  g1(16,6)=(-(params(16)*y(5)*y(1)));
  g1(16,23)=(-(params(16)*(-y(4))));
  g1(17,1)=y(6)*y(5);
  g1(17,13)=(-y(18));
  g1(17,14)=(-1);
  g1(17,4)=(-(y(25)+(1-params(8))*y(23)));
  g1(17,17)=y(23);
  g1(17,5)=y(6)*y(1);
  g1(17,18)=(-y(13));
  g1(17,6)=y(5)*y(1);
  g1(17,23)=y(17)-(1-params(8))*y(4);
  g1(17,25)=(-y(4));
  g1(18,8)=(-1);
  g1(18,9)=(-(1+y(10)));
  g1(18,10)=(-y(9));
  g1(18,13)=1;
  g1(19,23)=(-((-(y(36)+y(34)*(1-params(8))))/(y(23)*y(23))));
  g1(19,34)=(-((1-params(8))/y(23)));
  g1(19,36)=(-(1/y(23)));
  g1(19,27)=1;
  g1(20,21)=1;
  g1(20,27)=(-1);
  g1(20,31)=1;
  g1(21,34)=(-T305);
  g1(21,35)=(-T329);
  g1(21,30)=1;
  g1(22,2)=(-y(23));
  g1(22,19)=1;
  g1(22,23)=(-y(2));
  g1(23,8)=(-1);
  g1(23,9)=(-y(24));
  g1(23,20)=1;
  g1(23,24)=(-y(9));
  g1(24,8)=T196;
  g1(24,33)=(-(params(1)*y(22)*T199));
  g1(24,22)=(-T15);
  g1(25,7)=(-params(17));
  g1(25,32)=1;
  g1(25,38)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],25,1444);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],25,54872);
end
end
end
end
