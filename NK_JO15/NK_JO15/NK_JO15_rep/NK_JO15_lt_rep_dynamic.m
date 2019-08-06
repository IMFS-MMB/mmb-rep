function [residual, g1, g2, g3] = NK_JO15_lt_rep_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(23, 1);
T16 = (1+params(11))/((1+params(10))*params(1));
T23 = params(10)/(1+params(10));
T126 = (-params(1))*(1-params(17))*params(12)*((1+params(10))*params(13)-params(1)*params(10)^2)/((1+params(11))*params(14));
T134 = params(12)*params(10)*params(1)*(1-params(17))*(params(13)-(1+params(10))*params(1))/((1+params(11))*params(14));
T145 = params(1)*params(6)/(1+params(11));
T197 = params(12)*params(10)*params(1)/params(14);
T221 = params(1)/(1+params(11));
lhs =y(9);
rhs =y(32)-T16*y(11)+T16*y(33)+T23*y(34)-T23*y(13)+T16*y(17);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =y(33)*params(3)+y(9)*params(8)*params(13)/(1+params(11))+y(13)*params(1)*params(10)*params(8)/(1+params(11))+y(11)*params(8);
residual(2)= lhs-rhs;
lhs =y(13);
rhs =y(34)-T16*y(15)+T16*y(35)+y(32)*T23-y(9)*T23+T16*y(18);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =params(3)*y(36)+y(13)*params(13)*params(9)/(1+params(11))+y(9)*params(1)*params(10)*params(9)/(1+params(11))+y(15)*params(9);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =params(23)*y(2)+(1-params(23))*params(19)*y(12)+y(9)*(1-params(23))*params(21)+x(it_, 1);
residual(5)= lhs-rhs;
lhs =y(15);
rhs =params(24)*y(4)+(1-params(24))*params(20)*y(16)+y(13)*(1-params(24))*params(22)+x(it_, 2);
residual(6)= lhs-rhs;
lhs =y(17);
rhs =T126*y(19)-T134*y(20);
residual(7)= lhs-rhs;
lhs =y(18);
rhs =T126*y(20)-y(19)*T134;
residual(8)= lhs-rhs;
lhs =y(12);
rhs =y(10)+y(9)*T145-T145*y(1)-y(13)*T145+T145*y(3)+y(19)*params(16)-params(16)*y(5)-y(20)*params(16)+params(16)*y(6);
residual(9)= lhs-rhs;
lhs =y(16);
rhs =params(16)*y(5)+y(20)*params(16)+T145*y(1)+y(14)+y(13)*T145-T145*y(3)-y(9)*T145-params(16)*y(6)-y(19)*params(16);
residual(10)= lhs-rhs;
lhs =y(21);
rhs =y(11)+y(9)*params(13)/(1+params(11))+y(13)*params(10)*params(1)/(1+params(11));
residual(11)= lhs-rhs;
lhs =y(22);
rhs =y(15)+y(13)*params(13)/(1+params(11))+y(9)*params(10)*params(1)/(1+params(11));
residual(12)= lhs-rhs;
lhs =y(25);
rhs =y(19)*params(13)*params(12)/params(14)-y(20)*T197;
residual(13)= lhs-rhs;
lhs =y(26);
rhs =y(20)*params(13)*params(12)/params(14)-y(19)*T197;
residual(14)= lhs-rhs;
lhs =y(23);
rhs =y(9)+y(25);
residual(15)= lhs-rhs;
lhs =y(24);
rhs =y(13)+y(26);
residual(16)= lhs-rhs;
lhs =y(27);
rhs =y(12)+y(7);
residual(17)= lhs-rhs;
lhs =y(28);
rhs =y(16)+y(8);
residual(18)= lhs-rhs;
lhs =y(30);
rhs =y(23)*T221-y(24)*T221;
residual(19)= lhs-rhs;
lhs =y(31);
rhs =y(30)*(1-2*params(6));
residual(20)= lhs-rhs;
lhs =y(29);
rhs =y(27)+y(31)-y(28);
residual(21)= lhs-rhs;
lhs =y(19);
rhs =params(17)*y(5)+x(it_, 3);
residual(22)= lhs-rhs;
lhs =y(20);
rhs =y(6)*params(18)+x(it_, 4);
residual(23)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(23, 40);

  %
  % Jacobian matrix
  %

  g1(1,9)=1;
  g1(1,32)=(-1);
  g1(1,33)=(-T16);
  g1(1,11)=T16;
  g1(1,13)=T23;
  g1(1,34)=(-T23);
  g1(1,17)=(-T16);
  g1(2,9)=(-(params(8)*params(13)/(1+params(11))));
  g1(2,10)=1;
  g1(2,33)=(-params(3));
  g1(2,11)=(-params(8));
  g1(2,13)=(-(params(1)*params(10)*params(8)/(1+params(11))));
  g1(3,9)=T23;
  g1(3,32)=(-T23);
  g1(3,13)=1;
  g1(3,34)=(-1);
  g1(3,35)=(-T16);
  g1(3,15)=T16;
  g1(3,18)=(-T16);
  g1(4,9)=(-(params(1)*params(10)*params(9)/(1+params(11))));
  g1(4,13)=(-(params(13)*params(9)/(1+params(11))));
  g1(4,14)=1;
  g1(4,15)=(-params(9));
  g1(4,36)=(-params(3));
  g1(5,9)=(-((1-params(23))*params(21)));
  g1(5,2)=(-params(23));
  g1(5,11)=1;
  g1(5,12)=(-((1-params(23))*params(19)));
  g1(5,37)=(-1);
  g1(6,13)=(-((1-params(24))*params(22)));
  g1(6,4)=(-params(24));
  g1(6,15)=1;
  g1(6,16)=(-((1-params(24))*params(20)));
  g1(6,38)=(-1);
  g1(7,17)=1;
  g1(7,19)=(-T126);
  g1(7,20)=T134;
  g1(8,18)=1;
  g1(8,19)=T134;
  g1(8,20)=(-T126);
  g1(9,1)=T145;
  g1(9,9)=(-T145);
  g1(9,10)=(-1);
  g1(9,12)=1;
  g1(9,3)=(-T145);
  g1(9,13)=T145;
  g1(9,5)=params(16);
  g1(9,19)=(-params(16));
  g1(9,6)=(-params(16));
  g1(9,20)=params(16);
  g1(10,1)=(-T145);
  g1(10,9)=T145;
  g1(10,3)=T145;
  g1(10,13)=(-T145);
  g1(10,14)=(-1);
  g1(10,16)=1;
  g1(10,5)=(-params(16));
  g1(10,19)=params(16);
  g1(10,6)=params(16);
  g1(10,20)=(-params(16));
  g1(11,9)=(-(params(13)/(1+params(11))));
  g1(11,11)=(-1);
  g1(11,13)=(-(params(10)*params(1)/(1+params(11))));
  g1(11,21)=1;
  g1(12,9)=(-(params(10)*params(1)/(1+params(11))));
  g1(12,13)=(-(params(13)/(1+params(11))));
  g1(12,15)=(-1);
  g1(12,22)=1;
  g1(13,19)=(-(params(13)*params(12)/params(14)));
  g1(13,20)=T197;
  g1(13,25)=1;
  g1(14,19)=T197;
  g1(14,20)=(-(params(13)*params(12)/params(14)));
  g1(14,26)=1;
  g1(15,9)=(-1);
  g1(15,23)=1;
  g1(15,25)=(-1);
  g1(16,13)=(-1);
  g1(16,24)=1;
  g1(16,26)=(-1);
  g1(17,12)=(-1);
  g1(17,7)=(-1);
  g1(17,27)=1;
  g1(18,16)=(-1);
  g1(18,8)=(-1);
  g1(18,28)=1;
  g1(19,23)=(-T221);
  g1(19,24)=T221;
  g1(19,30)=1;
  g1(20,30)=(-(1-2*params(6)));
  g1(20,31)=1;
  g1(21,27)=(-1);
  g1(21,28)=1;
  g1(21,29)=1;
  g1(21,31)=(-1);
  g1(22,5)=(-params(17));
  g1(22,19)=1;
  g1(22,39)=(-1);
  g1(23,6)=(-params(18));
  g1(23,20)=1;
  g1(23,40)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,1600);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],23,64000);
end
end
end
end
