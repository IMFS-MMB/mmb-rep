function [residual, g1, g2, g3] = DEFK_int_GE_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(33, 1);
T11 = y(10)^(-params(2));
T14 = y(43)^(-params(2));
T15 = params(1)*T14;
T27 = 1+params(4)*(y(44)-y(45))/(y(45)-y(44)*params(5));
T36 = (y(46)+y(44)*(1-params(8)))/y(24);
T43 = (y(45)-y(44)*params(5))*(y(46)+y(44)*(1-params(8)));
T45 = 1+params(4)*(y(44)-y(45))*(y(46)+y(44)*(1-params(8))*y(53))/T43;
T95 = params(32)*y(2)^params(6);
T98 = y(14)^(1-params(6));
T108 = (y(14)/y(2))^(1-params(6));
T115 = (y(2)/y(14))^params(6);
T137 = 1/params(11);
T142 = (1-params(13)*y(36)^T137)/(1-params(13));
T144 = T142^(-params(11));
T153 = (1+params(11))/params(11);
T155 = params(1)*params(13)*y(50)^T153;
T162 = params(1)*params(13)*y(50)^T137;
T172 = 1/params(10);
T177 = (1-params(12)*y(32)^T172)/(1-params(12));
T183 = T177^(-(params(10)+(1+params(10))*params(3)));
T194 = params(1)*params(12)*y(47)^((1+params(10))*(1+params(3))/params(10));
T202 = params(1)*params(12)*y(47)^T172;
T213 = y(36)^T153;
T221 = y(6)^params(16);
T225 = params(25)*y(36)^params(14);
T229 = (y(15)/params(20))^params(15);
T230 = T225*T229;
T232 = T230^(1-params(16));
T233 = T221*T232;
lhs =T11;
rhs =T15*y(28)*T27;
residual(1)= lhs-rhs;
lhs =T11;
rhs =T15*T36*T45;
residual(2)= lhs-rhs;
lhs =(y(25)-params(5)*y(24))*y(11);
rhs =params(4)*((y(26)+y(24)*(1-params(8))*y(42))*y(3)+y(6)*y(5)*y(1)/y(36)-y(16));
residual(3)= lhs-rhs;
lhs =y(25);
rhs =1+y(12)+y(13)*y(11)/params(22);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =params(9)*(y(11)/params(22)-1)^2/2;
residual(5)= lhs-rhs;
lhs =y(13);
rhs =params(9)*(y(11)/params(22)-1);
residual(6)= lhs-rhs;
lhs =y(15)*y(39);
rhs =T95*T98-params(7);
residual(7)= lhs-rhs;
lhs =y(27);
rhs =params(32)*params(6)*y(35)*T108;
residual(8)= lhs-rhs;
lhs =y(31);
rhs =params(32)*(1-params(6))*y(35)*T115;
residual(9)= lhs-rhs;
lhs =y(26)*y(2);
rhs =y(15)-y(14)*y(31)+y(11)*(y(25)-(1+y(12)));
residual(10)= lhs-rhs;
lhs =y(17);
rhs =y(18)+y(19);
residual(11)= lhs-rhs;
lhs =y(17);
rhs =y(11)+(1-params(8))*y(2);
residual(12)= lhs-rhs;
lhs =y(37);
rhs =y(38)*T144;
residual(13)= lhs-rhs;
lhs =y(37);
rhs =y(35)*y(15)*T11*(1+params(11))+T155*y(51);
residual(14)= lhs-rhs;
lhs =y(38);
rhs =T11*y(15)+T162*y(52);
residual(15)= lhs-rhs;
lhs =y(33);
rhs =y(34)*T183;
residual(16)= lhs-rhs;
lhs =y(33);
rhs =(1+params(10))*y(14)^(1+params(3))+T194*y(48);
residual(17)= lhs-rhs;
lhs =y(34);
rhs =y(14)*T11*y(31)+T202*y(49);
residual(18)= lhs-rhs;
lhs =y(36)*y(31);
rhs =y(32)*y(7);
residual(19)= lhs-rhs;
lhs =y(39);
rhs =params(13)*y(8)*T213+(1-params(13))*T142^(1+params(11));
residual(20)= lhs-rhs;
lhs =y(23);
rhs =max(T233,1);
residual(21)= lhs-rhs;
lhs =y(19);
rhs =params(17)*(y(42)-params(33));
residual(22)= lhs-rhs;
lhs =y(16);
rhs =params(30)+params(18)*(y(6)*y(5)*y(1)/y(36)-params(20)*params(25)*params(31)-y(24)*y(4));
residual(23)= lhs-rhs;
lhs =y(6)*y(5)*y(1)/y(36)+y(24)*y(19);
rhs =y(16)+y(4)*(y(26)+(1-params(8))*y(24))+y(15)*y(20);
residual(24)= lhs-rhs;
lhs =y(15);
rhs =y(10)+y(11)*(1+y(12));
residual(25)= lhs-rhs;
lhs =y(28);
rhs =y(23)/y(50);
residual(26)= lhs-rhs;
lhs =y(30);
rhs =T36;
residual(27)= lhs-rhs;
lhs =y(41);
rhs =y(30)-y(28);
residual(28)= lhs-rhs;
lhs =y(40);
rhs =params(4)*(y(44)-y(45))/(y(45)-y(44)*params(5));
residual(29)= lhs-rhs;
lhs =y(21);
rhs =y(24)*y(2);
residual(30)= lhs-rhs;
lhs =y(22);
rhs =y(10)+y(25)*y(11);
residual(31)= lhs-rhs;
lhs =T11;
rhs =params(1)*T14*y(29);
residual(32)= lhs-rhs;
lhs =y(42);
rhs =params(33)*(1-params(19))+params(19)*y(9)+x(it_, 1);
residual(33)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(33, 54);

  %
  % Jacobian matrix
  %

T295 = getPowerDeriv(y(10),(-params(2)),1);
T305 = getPowerDeriv(y(43),(-params(2)),1);
T306 = params(1)*T305;
T335 = getPowerDeriv(y(14)/y(2),1-params(6),1);
T342 = getPowerDeriv(y(2)/y(14),params(6),1);
T363 = getPowerDeriv(T230,1-params(16),1);
T433 = (params(4)*(y(45)-y(44)*params(5))-params(4)*(y(44)-y(45))*(-params(5)))/((y(45)-y(44)*params(5))*(y(45)-y(44)*params(5)));
T457 = ((y(45)-y(44)*params(5))*(-params(4))-params(4)*(y(44)-y(45)))/((y(45)-y(44)*params(5))*(y(45)-y(44)*params(5)));
T516 = (-(y(6)*y(5)*y(1)))/(y(36)*y(36));
T522 = (-(params(13)*getPowerDeriv(y(36),T137,1)))/(1-params(13));
  g1(1,10)=T295;
  g1(1,43)=(-(T27*y(28)*T306));
  g1(1,44)=(-(T15*y(28)*T433));
  g1(1,45)=(-(T15*y(28)*T457));
  g1(1,28)=(-(T15*T27));
  g1(2,10)=T295;
  g1(2,43)=(-(T45*T36*T306));
  g1(2,24)=(-(T45*T15*(-(y(46)+y(44)*(1-params(8))))/(y(24)*y(24))));
  g1(2,44)=(-(T45*T15*(1-params(8))/y(24)+T15*T36*(T43*(params(4)*(y(46)+y(44)*(1-params(8))*y(53))+params(4)*(y(44)-y(45))*(1-params(8))*y(53))-params(4)*(y(44)-y(45))*(y(46)+y(44)*(1-params(8))*y(53))*((y(46)+y(44)*(1-params(8)))*(-params(5))+(y(45)-y(44)*params(5))*(1-params(8))))/(T43*T43)));
  g1(2,45)=(-(T15*T36*(T43*(y(46)+y(44)*(1-params(8))*y(53))*(-params(4))-(y(46)+y(44)*(1-params(8)))*params(4)*(y(44)-y(45))*(y(46)+y(44)*(1-params(8))*y(53)))/(T43*T43)));
  g1(2,46)=(-(T45*T15*1/y(24)+T15*T36*(params(4)*(y(44)-y(45))*T43-(y(45)-y(44)*params(5))*params(4)*(y(44)-y(45))*(y(46)+y(44)*(1-params(8))*y(53)))/(T43*T43)));
  g1(2,53)=(-(T15*T36*params(4)*(y(44)-y(45))*y(44)*(1-params(8))/T43));
  g1(3,11)=y(25)-params(5)*y(24);
  g1(3,1)=(-(params(4)*y(6)*y(5)/y(36)));
  g1(3,16)=params(4);
  g1(3,3)=(-(params(4)*(y(26)+y(24)*(1-params(8))*y(42))));
  g1(3,5)=(-(params(4)*y(6)*y(1)/y(36)));
  g1(3,6)=(-(params(4)*y(5)*y(1)/y(36)));
  g1(3,24)=y(11)*(-params(5))-params(4)*(1-params(8))*y(42)*y(3);
  g1(3,25)=y(11);
  g1(3,26)=(-(params(4)*y(3)));
  g1(3,36)=(-(params(4)*T516));
  g1(3,42)=(-(params(4)*y(3)*(1-params(8))*y(24)));
  g1(4,11)=(-(y(13)*1/params(22)));
  g1(4,12)=(-1);
  g1(4,13)=(-(y(11)/params(22)));
  g1(4,25)=1;
  g1(5,11)=(-(params(9)*1/params(22)*2*(y(11)/params(22)-1)/2));
  g1(5,12)=1;
  g1(6,11)=(-(params(9)*1/params(22)));
  g1(6,13)=1;
  g1(7,14)=(-(T95*getPowerDeriv(y(14),1-params(6),1)));
  g1(7,15)=y(39);
  g1(7,2)=(-(T98*params(32)*getPowerDeriv(y(2),params(6),1)));
  g1(7,39)=y(15);
  g1(8,14)=(-(params(32)*params(6)*y(35)*1/y(2)*T335));
  g1(8,2)=(-(params(32)*params(6)*y(35)*T335*(-y(14))/(y(2)*y(2))));
  g1(8,27)=1;
  g1(8,35)=(-(T108*params(32)*params(6)));
  g1(9,14)=(-(params(32)*(1-params(6))*y(35)*(-y(2))/(y(14)*y(14))*T342));
  g1(9,2)=(-(params(32)*(1-params(6))*y(35)*T342*1/y(14)));
  g1(9,31)=1;
  g1(9,35)=(-(T115*params(32)*(1-params(6))));
  g1(10,11)=(-(y(25)-(1+y(12))));
  g1(10,12)=y(11);
  g1(10,14)=y(31);
  g1(10,15)=(-1);
  g1(10,2)=y(26);
  g1(10,25)=(-y(11));
  g1(10,26)=y(2);
  g1(10,31)=y(14);
  g1(11,17)=1;
  g1(11,18)=(-1);
  g1(11,19)=(-1);
  g1(12,11)=(-1);
  g1(12,2)=(-(1-params(8)));
  g1(12,17)=1;
  g1(13,36)=(-(y(38)*T522*getPowerDeriv(T142,(-params(11)),1)));
  g1(13,37)=1;
  g1(13,38)=(-T144);
  g1(14,10)=(-(y(35)*y(15)*(1+params(11))*T295));
  g1(14,15)=(-(y(35)*T11*(1+params(11))));
  g1(14,35)=(-(y(15)*T11*(1+params(11))));
  g1(14,50)=(-(y(51)*params(1)*params(13)*getPowerDeriv(y(50),T153,1)));
  g1(14,37)=1;
  g1(14,51)=(-T155);
  g1(15,10)=(-(y(15)*T295));
  g1(15,15)=(-T11);
  g1(15,50)=(-(y(52)*params(1)*params(13)*getPowerDeriv(y(50),T137,1)));
  g1(15,38)=1;
  g1(15,52)=(-T162);
  g1(16,32)=(-(y(34)*(-(params(12)*getPowerDeriv(y(32),T172,1)))/(1-params(12))*getPowerDeriv(T177,(-(params(10)+(1+params(10))*params(3))),1)));
  g1(16,33)=1;
  g1(16,34)=(-T183);
  g1(17,14)=(-((1+params(10))*getPowerDeriv(y(14),1+params(3),1)));
  g1(17,47)=(-(y(48)*params(1)*params(12)*getPowerDeriv(y(47),(1+params(10))*(1+params(3))/params(10),1)));
  g1(17,33)=1;
  g1(17,48)=(-T194);
  g1(18,10)=(-(y(14)*y(31)*T295));
  g1(18,14)=(-(T11*y(31)));
  g1(18,31)=(-(T11*y(14)));
  g1(18,47)=(-(y(49)*params(1)*params(12)*getPowerDeriv(y(47),T172,1)));
  g1(18,34)=1;
  g1(18,49)=(-T202);
  g1(19,7)=(-y(32));
  g1(19,31)=y(36);
  g1(19,32)=(-y(7));
  g1(19,36)=y(31);
  g1(20,36)=(-(params(13)*y(8)*getPowerDeriv(y(36),T153,1)+(1-params(13))*T522*getPowerDeriv(T142,1+params(11),1)));
  g1(20,8)=(-(params(13)*T213));
  g1(20,39)=1;
  g1(21,15)=(-(T221*T225*1/params(20)*getPowerDeriv(y(15)/params(20),params(15),1)*T363*(T233>1)));
  g1(21,6)=(-((T233>1)*T232*getPowerDeriv(y(6),params(16),1)));
  g1(21,23)=1;
  g1(21,36)=(-((T233>1)*T221*T363*T229*params(25)*getPowerDeriv(y(36),params(14),1)));
  g1(22,19)=1;
  g1(22,42)=(-params(17));
  g1(23,1)=(-(params(18)*y(6)*y(5)/y(36)));
  g1(23,16)=1;
  g1(23,4)=(-(params(18)*(-y(24))));
  g1(23,5)=(-(params(18)*y(6)*y(1)/y(36)));
  g1(23,6)=(-(params(18)*y(5)*y(1)/y(36)));
  g1(23,24)=(-(params(18)*(-y(4))));
  g1(23,36)=(-(params(18)*T516));
  g1(24,1)=y(6)*y(5)/y(36);
  g1(24,15)=(-y(20));
  g1(24,16)=(-1);
  g1(24,4)=(-(y(26)+(1-params(8))*y(24)));
  g1(24,19)=y(24);
  g1(24,5)=y(6)*y(1)/y(36);
  g1(24,20)=(-y(15));
  g1(24,6)=y(5)*y(1)/y(36);
  g1(24,24)=y(19)-(1-params(8))*y(4);
  g1(24,26)=(-y(4));
  g1(24,36)=T516;
  g1(25,10)=(-1);
  g1(25,11)=(-(1+y(12)));
  g1(25,12)=(-y(11));
  g1(25,15)=1;
  g1(26,23)=(-(1/y(50)));
  g1(26,28)=1;
  g1(26,50)=(-((-y(23))/(y(50)*y(50))));
  g1(27,24)=(-((-(y(46)+y(44)*(1-params(8))))/(y(24)*y(24))));
  g1(27,44)=(-((1-params(8))/y(24)));
  g1(27,46)=(-(1/y(24)));
  g1(27,30)=1;
  g1(28,28)=1;
  g1(28,30)=(-1);
  g1(28,41)=1;
  g1(29,44)=(-T433);
  g1(29,45)=(-T457);
  g1(29,40)=1;
  g1(30,2)=(-y(24));
  g1(30,21)=1;
  g1(30,24)=(-y(2));
  g1(31,10)=(-1);
  g1(31,11)=(-y(25));
  g1(31,22)=1;
  g1(31,25)=(-y(11));
  g1(32,10)=T295;
  g1(32,43)=(-(params(1)*y(29)*T305));
  g1(32,29)=(-T15);
  g1(33,9)=(-params(19));
  g1(33,42)=1;
  g1(33,54)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],33,2916);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],33,157464);
end
end
end
end
