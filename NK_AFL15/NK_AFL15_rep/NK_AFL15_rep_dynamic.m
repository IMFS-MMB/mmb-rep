function [residual, g1, g2, g3] = NK_AFL15_rep_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(27, 1);
T49 = (y(4)/params(18))^params(39)*exp(x(it_, 2));
T94 = params(41)/2*(y(15)/y(2)-params(43))^2;
T95 = 1-params(43)+y(15)*params(41)*(y(15)/y(2)-params(43))/y(2)-T94;
T111 = y(13)^(1-params(38));
T115 = params(44)/params(33);
T116 = y(19)*exp(y(17))*y(2)^params(38)*T111*T115;
T119 = y(12)-(params(44)-1)/params(44);
T185 = T111*exp(y(17))*y(2)^params(38);
T198 = 1-1/y(8)*(y(26)+params(46))/(2-params(45)+params(52)*(1+params(45)));
T199 = y(14)*T198;
T215 = (params(46)+y(38)-(params(46)+y(38))/(2-params(45)))^2/(params(46)*8);
T217 = T215*y(34);
T295 = getPowerDeriv(1-params(41)*(y(15)/y(2)-params(43)),(-1),1);
T304 = params(41)/2*(-y(15))/(y(2)*y(2))*2*(y(15)/y(2)-params(43));
T387 = params(41)/2*2*(y(15)/y(2)-params(43))*1/y(2);
lhs =y(19);
rhs =y(6)^(-params(34));
residual(1)= lhs-rhs;
lhs =y(20);
rhs =params(35)*1/(y(13)-1);
residual(2)= lhs-rhs;
lhs =y(21);
rhs =params(38)*y(11)/y(2);
residual(3)= lhs-rhs;
lhs =y(22);
rhs =y(11)*(1-params(38))/y(13);
residual(4)= lhs-rhs;
lhs =y(17);
rhs =params(37)*y(3)+x(it_, 1);
residual(5)= lhs-rhs;
lhs =y(18)/params(18);
rhs =T49;
residual(6)= lhs-rhs;
lhs =y(19);
rhs =params(36)*y(36)*y(29);
residual(7)= lhs-rhs;
lhs =y(29);
rhs =y(8)*(1-y(28))/y(33);
residual(8)= lhs-rhs;
lhs =y(22)*y(12);
rhs =(-y(20))/y(19);
residual(9)= lhs-rhs;
lhs =y(21)*y(12);
rhs =y(10);
residual(10)= lhs-rhs;
lhs =y(14);
rhs =(1-params(41)*(y(15)/y(2)-params(43)))^(-1);
residual(11)= lhs-rhs;
lhs =y(26)/y(33);
rhs =y(35)/y(14);
residual(12)= lhs-rhs;
lhs =y(16);
rhs =y(10)+y(14)*T95;
residual(13)= lhs-rhs;
lhs =y(19)*y(7)*(y(7)-params(7));
rhs =params(36)*y(36)*y(33)*(y(33)-params(7))+T116*T119;
residual(14)= lhs-rhs;
lhs =y(9);
rhs =y(15)+y(2)*(1-params(43))-y(2)*T94;
residual(15)= lhs-rhs;
lhs =y(11);
rhs =y(18)+y(6)+y(15)+y(31)+y(30);
residual(16)= lhs-rhs;
lhs =y(31);
rhs =params(33)/2*(y(7)-params(7))^2;
residual(17)= lhs-rhs;
lhs =y(30);
rhs =y(9)*y(14)*y(26)*params(52)*y(27);
residual(18)= lhs-rhs;
lhs =log(y(8)/params(9));
rhs =params(50)*log(y(1)/params(9))+(1-params(50))*(params(47)*log(y(7)/params(7))+params(49)*log(y(14)/params(15))+params(48)*log((y(11)-y(30))/params(12)))+y(32);
residual(19)= lhs-rhs;
lhs =y(32);
rhs =0.2*y(5)+x(it_, 3);
residual(20)= lhs-rhs;
lhs =y(11);
rhs =T185;
residual(21)= lhs-rhs;
lhs =y(23);
rhs =y(2)*T199;
residual(22)= lhs-rhs;
lhs =y(23)+y(24);
rhs =y(2)*y(14);
residual(23)= lhs-rhs;
lhs =y(37);
rhs =params(42)*(y(23)+y(9)*T217)+params(1);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(24)/(y(2)*y(14));
residual(25)= lhs-rhs;
lhs =y(27);
rhs =0.5*(1-(y(26)-y(8)*y(25))/params(46));
residual(26)= lhs-rhs;
lhs =y(28);
rhs =y(27)*(1+params(45))*.25*(1-params(52))*(y(8)+(y(26)-params(46))/y(25));
residual(27)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(27, 41);

  %
  % Jacobian matrix
  %

  g1(1,6)=(-(getPowerDeriv(y(6),(-params(34)),1)));
  g1(1,19)=1;
  g1(2,13)=(-(params(35)*(-1)/((y(13)-1)*(y(13)-1))));
  g1(2,20)=1;
  g1(3,2)=(-((-(params(38)*y(11)))/(y(2)*y(2))));
  g1(3,11)=(-(params(38)/y(2)));
  g1(3,21)=1;
  g1(4,11)=(-((1-params(38))/y(13)));
  g1(4,13)=(-((-(y(11)*(1-params(38))))/(y(13)*y(13))));
  g1(4,22)=1;
  g1(5,3)=(-params(37));
  g1(5,17)=1;
  g1(5,39)=(-1);
  g1(6,4)=(-(exp(x(it_, 2))*1/params(18)*getPowerDeriv(y(4)/params(18),params(39),1)));
  g1(6,18)=1/params(18);
  g1(6,40)=(-T49);
  g1(7,19)=1;
  g1(7,36)=(-(params(36)*y(29)));
  g1(7,29)=(-(params(36)*y(36)));
  g1(8,33)=(-((-(y(8)*(1-y(28))))/(y(33)*y(33))));
  g1(8,8)=(-((1-y(28))/y(33)));
  g1(8,28)=(-((-y(8))/y(33)));
  g1(8,29)=1;
  g1(9,12)=y(22);
  g1(9,19)=(-(y(20)/(y(19)*y(19))));
  g1(9,20)=(-((-1)/y(19)));
  g1(9,22)=y(12);
  g1(10,10)=(-1);
  g1(10,12)=y(21);
  g1(10,21)=y(12);
  g1(11,2)=(-((-(params(41)*(-y(15))/(y(2)*y(2))))*T295));
  g1(11,14)=1;
  g1(11,15)=(-(T295*(-(params(41)*1/y(2)))));
  g1(12,33)=(-y(26))/(y(33)*y(33));
  g1(12,14)=(-((-y(35))/(y(14)*y(14))));
  g1(12,35)=(-(1/y(14)));
  g1(12,26)=1/y(33);
  g1(13,2)=(-(y(14)*((y(2)*y(15)*params(41)*(-y(15))/(y(2)*y(2))-y(15)*params(41)*(y(15)/y(2)-params(43)))/(y(2)*y(2))-T304)));
  g1(13,10)=(-1);
  g1(13,14)=(-T95);
  g1(13,15)=(-(y(14)*((params(41)*(y(15)/y(2)-params(43))+y(15)*params(41)*1/y(2))/y(2)-T387)));
  g1(13,16)=1;
  g1(14,7)=y(19)*y(7)+y(19)*(y(7)-params(7));
  g1(14,33)=(-(params(36)*y(36)*y(33)+params(36)*y(36)*(y(33)-params(7))));
  g1(14,2)=(-(T119*T115*T111*y(19)*exp(y(17))*getPowerDeriv(y(2),params(38),1)));
  g1(14,12)=(-T116);
  g1(14,13)=(-(T119*T115*y(19)*exp(y(17))*y(2)^params(38)*getPowerDeriv(y(13),1-params(38),1)));
  g1(14,17)=(-(T116*T119));
  g1(14,19)=y(7)*(y(7)-params(7))-T119*T115*T185;
  g1(14,36)=(-((y(33)-params(7))*params(36)*y(33)));
  g1(15,2)=(-(1-params(43)-(T94+y(2)*T304)));
  g1(15,9)=1;
  g1(15,15)=(-(1-y(2)*T387));
  g1(16,6)=(-1);
  g1(16,11)=1;
  g1(16,15)=(-1);
  g1(16,18)=(-1);
  g1(16,30)=(-1);
  g1(16,31)=(-1);
  g1(17,7)=(-(params(33)/2*2*(y(7)-params(7))));
  g1(17,31)=1;
  g1(18,9)=(-(y(14)*y(26)*params(52)*y(27)));
  g1(18,14)=(-(y(9)*y(26)*params(52)*y(27)));
  g1(18,26)=(-(y(9)*y(14)*params(52)*y(27)));
  g1(18,27)=(-(y(9)*y(14)*y(26)*params(52)));
  g1(18,30)=1;
  g1(19,7)=(-((1-params(50))*params(47)*1/params(7)/(y(7)/params(7))));
  g1(19,1)=(-(params(50)*1/params(9)/(y(1)/params(9))));
  g1(19,8)=1/params(9)/(y(8)/params(9));
  g1(19,11)=(-((1-params(50))*params(48)*1/params(12)/((y(11)-y(30))/params(12))));
  g1(19,14)=(-((1-params(50))*params(49)*1/params(15)/(y(14)/params(15))));
  g1(19,30)=(-((1-params(50))*params(48)*(-1)/params(12)/((y(11)-y(30))/params(12))));
  g1(19,32)=(-1);
  g1(20,5)=(-0.2);
  g1(20,32)=1;
  g1(20,41)=(-1);
  g1(21,2)=(-(T111*exp(y(17))*getPowerDeriv(y(2),params(38),1)));
  g1(21,11)=1;
  g1(21,13)=(-(exp(y(17))*y(2)^params(38)*getPowerDeriv(y(13),1-params(38),1)));
  g1(21,17)=(-T185);
  g1(22,8)=(-(y(2)*y(14)*(-((y(26)+params(46))*(-1)/(y(8)*y(8))/(2-params(45)+params(52)*(1+params(45)))))));
  g1(22,2)=(-T199);
  g1(22,14)=(-(y(2)*T198));
  g1(22,23)=1;
  g1(22,26)=(-(y(2)*y(14)*(-(1/y(8)/(2-params(45)+params(52)*(1+params(45)))))));
  g1(23,2)=(-y(14));
  g1(23,14)=(-y(2));
  g1(23,23)=1;
  g1(23,24)=1;
  g1(24,9)=(-(params(42)*T217));
  g1(24,34)=(-(params(42)*y(9)*T215));
  g1(24,23)=(-params(42));
  g1(24,37)=1;
  g1(24,38)=(-(params(42)*y(9)*y(34)*(1-1/(2-params(45)))*2*(params(46)+y(38)-(params(46)+y(38))/(2-params(45)))/(params(46)*8)));
  g1(25,2)=(-((-(y(14)*y(24)))/(y(2)*y(14)*y(2)*y(14))));
  g1(25,14)=(-((-(y(2)*y(24)))/(y(2)*y(14)*y(2)*y(14))));
  g1(25,24)=(-(1/(y(2)*y(14))));
  g1(25,25)=1;
  g1(26,8)=(-(0.5*(-((-y(25))/params(46)))));
  g1(26,25)=(-(0.5*(-((-y(8))/params(46)))));
  g1(26,26)=(-(0.5*(-(1/params(46)))));
  g1(26,27)=1;
  g1(27,8)=(-(y(27)*(1+params(45))*.25*(1-params(52))));
  g1(27,25)=(-(y(27)*(1+params(45))*.25*(1-params(52))*(-(y(26)-params(46)))/(y(25)*y(25))));
  g1(27,26)=(-(y(27)*(1+params(45))*.25*(1-params(52))*1/y(25)));
  g1(27,27)=(-((1+params(45))*.25*(1-params(52))*(y(8)+(y(26)-params(46))/y(25))));
  g1(27,28)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],27,1681);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],27,68921);
end
end
