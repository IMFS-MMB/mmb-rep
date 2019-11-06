function [residual, g1, g2, g3] = monetary_shock_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(40, 1);
T11 = y(20)^(-params(4));
T15 = params(3)*y(52)^(-params(4));
T27 = 1+params(6)*(y(53)-y(54))/(y(54)-y(53)*params(7));
T36 = (y(55)+y(53)*(1-params(10)))/y(34);
T43 = (y(54)-y(53)*params(7))*(y(55)+y(53)*(1-params(10)));
T45 = 1+params(6)*(y(53)-y(54))*(y(55)+y(53)*(1-params(10))*y(62))/T43;
T94 = y(4)^params(8);
T98 = y(24)^(1-params(8));
T108 = (y(24)/y(4))^(1-params(8));
T115 = (y(4)/y(24))^params(8);
T137 = 1/params(13);
T142 = (1-params(15)*y(45)^T137)/(1-params(15));
T144 = T142^(-params(13));
T153 = (1+params(13))/params(13);
T155 = params(3)*params(15)*y(59)^T153;
T162 = params(3)*params(15)*y(59)^T137;
T172 = 1/params(12);
T177 = (1-params(14)*y(41)^T172)/(1-params(14));
T183 = T177^(-(params(12)+(1+params(12))*params(5)));
T194 = params(3)*params(14)*y(56)^((1+params(12))*(1+params(5))/params(12));
T202 = params(3)*params(14)*y(56)^T172;
T213 = y(45)^T153;
T223 = params(27)^(1-params(18));
T225 = T223*y(8)^params(18);
T227 = y(45)^params(16);
T228 = T225*T227;
T232 = (y(25)/params(22))^params(17);
T236 = T228*T232*exp(y(13));
lhs =T11;
rhs =T15*y(38)*T27;
residual(1)= lhs-rhs;
lhs =T11;
rhs =T15*T36*T45;
residual(2)= lhs-rhs;
lhs =(y(35)-params(7)*y(34))*y(21);
rhs =params(6)*((y(36)+y(34)*(1-params(10))*y(51))*y(5)+y(8)*y(7)*y(3)/y(45)-y(26));
residual(3)= lhs-rhs;
lhs =y(35);
rhs =1+y(22)+y(23)*y(21)/params(24);
residual(4)= lhs-rhs;
lhs =y(22);
rhs =params(11)*(y(21)/params(24)-1)^2/2;
residual(5)= lhs-rhs;
lhs =y(23);
rhs =params(11)*(y(21)/params(24)-1);
residual(6)= lhs-rhs;
lhs =y(25)*y(48);
rhs =y(12)*T94*T98-params(9);
residual(7)= lhs-rhs;
lhs =y(37);
rhs =y(12)*params(8)*y(44)*T108;
residual(8)= lhs-rhs;
lhs =y(40);
rhs =y(12)*(1-params(8))*y(44)*T115;
residual(9)= lhs-rhs;
lhs =y(36)*y(4);
rhs =y(25)-y(24)*y(40)+y(21)*(y(35)-(1+y(22)));
residual(10)= lhs-rhs;
lhs =y(27);
rhs =y(28)+y(29);
residual(11)= lhs-rhs;
lhs =y(27);
rhs =y(21)+(1-params(10))*y(4);
residual(12)= lhs-rhs;
lhs =y(46);
rhs =y(47)*T144;
residual(13)= lhs-rhs;
lhs =y(46);
rhs =y(44)*y(25)*T11*(1+params(13))+T155*y(60);
residual(14)= lhs-rhs;
lhs =y(47);
rhs =T11*y(25)+T162*y(61);
residual(15)= lhs-rhs;
lhs =y(42);
rhs =y(43)*T183;
residual(16)= lhs-rhs;
lhs =y(42);
rhs =(1+params(12))*y(24)^(1+params(5))+T194*y(57);
residual(17)= lhs-rhs;
lhs =y(43);
rhs =y(24)*T11*y(40)+T202*y(58);
residual(18)= lhs-rhs;
lhs =y(45)*y(40);
rhs =y(41)*y(9);
residual(19)= lhs-rhs;
lhs =y(48);
rhs =params(15)*y(10)*T213+(1-params(15))*T142^(1+params(13));
residual(20)= lhs-rhs;
lhs =y(33);
rhs =T236;
residual(21)= lhs-rhs;
lhs =y(13);
rhs =params(2)*y(2)+x(it_, 3);
residual(22)= lhs-rhs;
lhs =y(29);
rhs =params(19)*(y(51)-params(35));
residual(23)= lhs-rhs;
lhs =y(25)*y(30);
rhs =params(33)*(steady_state(14));
residual(24)= lhs-rhs;
lhs =y(8)*y(7)*y(3)/y(45)+y(34)*y(29);
rhs =y(25)*y(30)+y(26)+(y(36)+(1-params(10))*y(34))*y(6);
residual(25)= lhs-rhs;
lhs =y(25);
rhs =y(20)+y(21)*(1+y(22));
residual(26)= lhs-rhs;
lhs =y(38);
rhs =y(33)/y(59);
residual(27)= lhs-rhs;
lhs =y(39);
rhs =T36;
residual(28)= lhs-rhs;
lhs =y(50);
rhs =y(39)-y(38);
residual(29)= lhs-rhs;
lhs =y(49);
rhs =params(6)*(y(53)-y(54))/(y(54)-y(53)*params(7));
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(34)*y(4);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(20)+y(35)*y(21);
residual(32)= lhs-rhs;
lhs =y(51);
rhs =params(35)*(1-params(21))+params(21)*y(11)+x(it_, 1);
residual(33)= lhs-rhs;
lhs =y(12);
rhs =(1-params(1))*params(34)+params(1)*y(1)+x(it_, 2);
residual(34)= lhs-rhs;
lhs =y(14);
rhs =100*log(y(25)/(steady_state(14)));
residual(35)= lhs-rhs;
lhs =y(15);
rhs =100*(y(45)^4-1);
residual(36)= lhs-rhs;
lhs =y(16);
rhs =100*(y(33)^4-(steady_state(22))^4);
residual(37)= lhs-rhs;
lhs =y(17);
rhs =100*log(y(20)/(steady_state(9)));
residual(38)= lhs-rhs;
lhs =y(18);
rhs =100*log(y(21)/(steady_state(10)));
residual(39)= lhs-rhs;
lhs =y(19);
rhs =100*log(y(12)/(steady_state(1)));
residual(40)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(40, 65);

  %
  % Jacobian matrix
  %

T352 = getPowerDeriv(y(20),(-params(4)),1);
T367 = params(3)*getPowerDeriv(y(52),(-params(4)),1);
T397 = getPowerDeriv(y(24)/y(4),1-params(8),1);
T404 = getPowerDeriv(y(4)/y(24),params(8),1);
T490 = (params(6)*(y(54)-y(53)*params(7))-params(6)*(y(53)-y(54))*(-params(7)))/((y(54)-y(53)*params(7))*(y(54)-y(53)*params(7)));
T514 = ((y(54)-y(53)*params(7))*(-params(6))-params(6)*(y(53)-y(54)))/((y(54)-y(53)*params(7))*(y(54)-y(53)*params(7)));
T579 = (-(params(15)*getPowerDeriv(y(45),T137,1)))/(1-params(15));
  g1(1,20)=T352;
  g1(1,52)=(-(T27*y(38)*T367));
  g1(1,53)=(-(T15*y(38)*T490));
  g1(1,54)=(-(T15*y(38)*T514));
  g1(1,38)=(-(T15*T27));
  g1(2,20)=T352;
  g1(2,52)=(-(T45*T36*T367));
  g1(2,34)=(-(T45*T15*(-(y(55)+y(53)*(1-params(10))))/(y(34)*y(34))));
  g1(2,53)=(-(T45*T15*(1-params(10))/y(34)+T15*T36*(T43*(params(6)*(y(55)+y(53)*(1-params(10))*y(62))+params(6)*(y(53)-y(54))*(1-params(10))*y(62))-params(6)*(y(53)-y(54))*(y(55)+y(53)*(1-params(10))*y(62))*((y(55)+y(53)*(1-params(10)))*(-params(7))+(y(54)-y(53)*params(7))*(1-params(10))))/(T43*T43)));
  g1(2,54)=(-(T15*T36*(T43*(y(55)+y(53)*(1-params(10))*y(62))*(-params(6))-(y(55)+y(53)*(1-params(10)))*params(6)*(y(53)-y(54))*(y(55)+y(53)*(1-params(10))*y(62)))/(T43*T43)));
  g1(2,55)=(-(T45*T15*1/y(34)+T15*T36*(params(6)*(y(53)-y(54))*T43-(y(54)-y(53)*params(7))*params(6)*(y(53)-y(54))*(y(55)+y(53)*(1-params(10))*y(62)))/(T43*T43)));
  g1(2,62)=(-(T15*T36*params(6)*(y(53)-y(54))*y(53)*(1-params(10))/T43));
  g1(3,21)=y(35)-params(7)*y(34);
  g1(3,3)=(-(params(6)*y(8)*y(7)/y(45)));
  g1(3,26)=params(6);
  g1(3,5)=(-(params(6)*(y(36)+y(34)*(1-params(10))*y(51))));
  g1(3,7)=(-(params(6)*y(8)*y(3)/y(45)));
  g1(3,8)=(-(params(6)*y(7)*y(3)/y(45)));
  g1(3,34)=y(21)*(-params(7))-params(6)*(1-params(10))*y(51)*y(5);
  g1(3,35)=y(21);
  g1(3,36)=(-(params(6)*y(5)));
  g1(3,45)=(-(params(6)*(-(y(8)*y(7)*y(3)))/(y(45)*y(45))));
  g1(3,51)=(-(params(6)*y(5)*(1-params(10))*y(34)));
  g1(4,21)=(-(y(23)*1/params(24)));
  g1(4,22)=(-1);
  g1(4,23)=(-(y(21)/params(24)));
  g1(4,35)=1;
  g1(5,21)=(-(params(11)*1/params(24)*2*(y(21)/params(24)-1)/2));
  g1(5,22)=1;
  g1(6,21)=(-(params(11)*1/params(24)));
  g1(6,23)=1;
  g1(7,12)=(-(T94*T98));
  g1(7,24)=(-(y(12)*T94*getPowerDeriv(y(24),1-params(8),1)));
  g1(7,25)=y(48);
  g1(7,4)=(-(T98*y(12)*getPowerDeriv(y(4),params(8),1)));
  g1(7,48)=y(25);
  g1(8,12)=(-(params(8)*y(44)*T108));
  g1(8,24)=(-(y(12)*params(8)*y(44)*1/y(4)*T397));
  g1(8,4)=(-(y(12)*params(8)*y(44)*T397*(-y(24))/(y(4)*y(4))));
  g1(8,37)=1;
  g1(8,44)=(-(T108*y(12)*params(8)));
  g1(9,12)=(-((1-params(8))*y(44)*T115));
  g1(9,24)=(-(y(12)*(1-params(8))*y(44)*(-y(4))/(y(24)*y(24))*T404));
  g1(9,4)=(-(y(12)*(1-params(8))*y(44)*T404*1/y(24)));
  g1(9,40)=1;
  g1(9,44)=(-(T115*y(12)*(1-params(8))));
  g1(10,21)=(-(y(35)-(1+y(22))));
  g1(10,22)=y(21);
  g1(10,24)=y(40);
  g1(10,25)=(-1);
  g1(10,4)=y(36);
  g1(10,35)=(-y(21));
  g1(10,36)=y(4);
  g1(10,40)=y(24);
  g1(11,27)=1;
  g1(11,28)=(-1);
  g1(11,29)=(-1);
  g1(12,21)=(-1);
  g1(12,4)=(-(1-params(10)));
  g1(12,27)=1;
  g1(13,45)=(-(y(47)*T579*getPowerDeriv(T142,(-params(13)),1)));
  g1(13,46)=1;
  g1(13,47)=(-T144);
  g1(14,20)=(-(y(44)*y(25)*(1+params(13))*T352));
  g1(14,25)=(-(y(44)*T11*(1+params(13))));
  g1(14,44)=(-(y(25)*T11*(1+params(13))));
  g1(14,59)=(-(y(60)*params(3)*params(15)*getPowerDeriv(y(59),T153,1)));
  g1(14,46)=1;
  g1(14,60)=(-T155);
  g1(15,20)=(-(y(25)*T352));
  g1(15,25)=(-T11);
  g1(15,59)=(-(y(61)*params(3)*params(15)*getPowerDeriv(y(59),T137,1)));
  g1(15,47)=1;
  g1(15,61)=(-T162);
  g1(16,41)=(-(y(43)*(-(params(14)*getPowerDeriv(y(41),T172,1)))/(1-params(14))*getPowerDeriv(T177,(-(params(12)+(1+params(12))*params(5))),1)));
  g1(16,42)=1;
  g1(16,43)=(-T183);
  g1(17,24)=(-((1+params(12))*getPowerDeriv(y(24),1+params(5),1)));
  g1(17,56)=(-(y(57)*params(3)*params(14)*getPowerDeriv(y(56),(1+params(12))*(1+params(5))/params(12),1)));
  g1(17,42)=1;
  g1(17,57)=(-T194);
  g1(18,20)=(-(y(24)*y(40)*T352));
  g1(18,24)=(-(T11*y(40)));
  g1(18,40)=(-(T11*y(24)));
  g1(18,56)=(-(y(58)*params(3)*params(14)*getPowerDeriv(y(56),T172,1)));
  g1(18,43)=1;
  g1(18,58)=(-T202);
  g1(19,9)=(-y(41));
  g1(19,40)=y(45);
  g1(19,41)=(-y(9));
  g1(19,45)=y(40);
  g1(20,45)=(-(params(15)*y(10)*getPowerDeriv(y(45),T153,1)+(1-params(15))*T579*getPowerDeriv(T142,1+params(13),1)));
  g1(20,10)=(-(params(15)*T213));
  g1(20,48)=1;
  g1(21,13)=(-T236);
  g1(21,25)=(-(exp(y(13))*T228*1/params(22)*getPowerDeriv(y(25)/params(22),params(17),1)));
  g1(21,8)=(-(exp(y(13))*T232*T227*T223*getPowerDeriv(y(8),params(18),1)));
  g1(21,33)=1;
  g1(21,45)=(-(exp(y(13))*T232*T225*getPowerDeriv(y(45),params(16),1)));
  g1(22,2)=(-params(2));
  g1(22,13)=1;
  g1(22,65)=(-1);
  g1(23,29)=1;
  g1(23,51)=(-params(19));
  g1(24,25)=y(30);
  g1(24,30)=y(25);
  g1(25,3)=y(8)*y(7)/y(45);
  g1(25,25)=(-y(30));
  g1(25,26)=(-1);
  g1(25,6)=(-(y(36)+(1-params(10))*y(34)));
  g1(25,29)=y(34);
  g1(25,7)=y(8)*y(3)/y(45);
  g1(25,30)=(-y(25));
  g1(25,8)=y(7)*y(3)/y(45);
  g1(25,34)=y(29)-(1-params(10))*y(6);
  g1(25,36)=(-y(6));
  g1(25,45)=(-(y(8)*y(7)*y(3)))/(y(45)*y(45));
  g1(26,20)=(-1);
  g1(26,21)=(-(1+y(22)));
  g1(26,22)=(-y(21));
  g1(26,25)=1;
  g1(27,33)=(-(1/y(59)));
  g1(27,38)=1;
  g1(27,59)=(-((-y(33))/(y(59)*y(59))));
  g1(28,34)=(-((-(y(55)+y(53)*(1-params(10))))/(y(34)*y(34))));
  g1(28,53)=(-((1-params(10))/y(34)));
  g1(28,55)=(-(1/y(34)));
  g1(28,39)=1;
  g1(29,38)=1;
  g1(29,39)=(-1);
  g1(29,50)=1;
  g1(30,53)=(-T490);
  g1(30,54)=(-T514);
  g1(30,49)=1;
  g1(31,4)=(-y(34));
  g1(31,31)=1;
  g1(31,34)=(-y(4));
  g1(32,20)=(-1);
  g1(32,21)=(-y(35));
  g1(32,32)=1;
  g1(32,35)=(-y(21));
  g1(33,11)=(-params(21));
  g1(33,51)=1;
  g1(33,63)=(-1);
  g1(34,1)=(-params(1));
  g1(34,12)=1;
  g1(34,64)=(-1);
  g1(35,14)=1;
  g1(35,25)=(-(100*1/(steady_state(14))/(y(25)/(steady_state(14)))));
  g1(36,15)=1;
  g1(36,45)=(-(100*4*y(45)^3));
  g1(37,16)=1;
  g1(37,33)=(-(100*4*y(33)^3));
  g1(38,17)=1;
  g1(38,20)=(-(100*1/(steady_state(9))/(y(20)/(steady_state(9)))));
  g1(39,18)=1;
  g1(39,21)=(-(100*1/(steady_state(10))/(y(21)/(steady_state(10)))));
  g1(40,12)=(-(100*1/(steady_state(1))/(y(12)/(steady_state(1)))));
  g1(40,19)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],40,4225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],40,274625);
end
end
end
end
