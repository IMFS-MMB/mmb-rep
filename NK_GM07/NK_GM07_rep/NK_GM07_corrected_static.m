function [residual, g1, g2] = NK_GM07_corrected_static(y, x, params)
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

residual = zeros( 22, 1);

%
% Model equations
%

T46 = params(17)*(1-params(6))/(params(16)*params(18));
T60 = params(7)*params(14)/params(17)/(params(7)*params(14)/params(17)+params(19));
T66 = params(19)/(params(7)*params(14)/params(17)+params(19));
T94 = params(17)*params(6)*params(19)/(params(17)*params(19)+params(7)*params(14)*(1+params(9)));
T116 = params(7)*params(20)*params(1)/(params(17)*params(21));
T120 = params(7)*params(20)*(params(1)/(params(17)*params(21))-1);
T134 = (params(15)/params(14))^(1-params(2));
T137 = params(4)/(1+params(9))*(1-params(8)+params(2)*params(22)*T134);
T143 = T134*params(22)*params(4)*params(2)/(1+params(9));
T178 = 1/params(4)/(1+params(9));
T185 = params(20)*params(1)/(params(17)*params(21));
T236 = (-((1+params(9))*params(14)*params(6)*params(7)/(params(17)*params(19)+params(7)*params(14)*(1+params(9)))));
lhs =y(1);
rhs =y(1)*params(4)+params(5)*y(2);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(5)-y(4);
residual(2)= lhs-rhs;
lhs =y(12);
rhs =y(9)+y(11);
residual(3)= lhs-rhs;
lhs =y(4)+y(6);
rhs =params(15)/(1-params(15)-params(16))*y(7)+params(16)/(1-params(15)-params(16))*y(8);
residual(4)= lhs-rhs;
residual(5) = y(6)+y(8)+y(9)*T46+y(4)*(1+T46);
lhs =y(3);
rhs =T60*(y(9)-y(10)-y(16))-T66*y(13);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =(1+params(14)*params(8)/params(17))*(1-params(2))*(y(7)+y(14))-y(10)*params(14)*params(8)/params(17);
residual(7)= lhs-rhs;
lhs =y(9);
rhs =(1-params(6))*(y(8)+y(15))+T94*(y(9)+y(13))+(1+params(9))*params(14)*params(6)*params(7)/(params(17)*params(19)+params(7)*params(14)*(1+params(9)))*(y(10)+y(16));
residual(8)= lhs-rhs;
lhs =y(2);
rhs =y(6)+y(7)-y(9);
residual(9)= lhs-rhs;
residual(10) = y(1);
lhs =y(9)*T116;
rhs =T120*(y(3)+y(16))+y(10)*(T120-1)+y(10)*params(4)/(1+params(9))*(1-params(8))+y(4)*T137+T143*(y(2)+(1-params(2))*(y(7)+y(14)))-y(4)*(T116+T137);
residual(11)= lhs-rhs;
lhs =y(20);
rhs =(1-params(35))*(y(1)*(1+params(33))+y(2)*params(34))+y(20)*params(35)+x(5);
residual(12)= lhs-rhs;
lhs =y(17)/params(24);
rhs =y(6)+y(8)-y(9);
residual(13)= lhs-rhs;
lhs =y(18)/params(23);
rhs =y(6)+y(8)-y(9);
residual(14)= lhs-rhs;
lhs =y(19);
rhs =T178*(y(1)+y(4)-y(4));
residual(15)= lhs-rhs;
lhs =y(19)-y(22);
rhs =T185*(y(3)-y(9)-y(4))-y(3)*params(20);
residual(16)= lhs-rhs;
lhs =y(19)-y(20);
rhs =y(18);
residual(17)= lhs-rhs;
lhs =y(21)-y(20);
rhs =y(17);
residual(18)= lhs-rhs;
residual(19) = y(13);
lhs =y(14);
rhs =y(14)*params(30)+x(2);
residual(20)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(31)+x(3);
residual(21)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(32)-x(4);
residual(22)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(22, 22);

  %
  % Jacobian matrix
  %

  g1(1,1)=1-params(4);
  g1(1,2)=(-params(5));
  g1(2,2)=1;
  g1(2,4)=1;
  g1(2,5)=(-1);
  g1(3,9)=(-1);
  g1(3,11)=(-1);
  g1(3,12)=1;
  g1(4,4)=1;
  g1(4,6)=1;
  g1(4,7)=(-(params(15)/(1-params(15)-params(16))));
  g1(4,8)=(-(params(16)/(1-params(15)-params(16))));
  g1(5,4)=1+T46;
  g1(5,6)=1;
  g1(5,8)=1;
  g1(5,9)=T46;
  g1(6,3)=1;
  g1(6,9)=(-T60);
  g1(6,10)=T60;
  g1(6,13)=T66;
  g1(6,16)=T60;
  g1(7,7)=(-((1+params(14)*params(8)/params(17))*(1-params(2))));
  g1(7,9)=1;
  g1(7,10)=params(14)*params(8)/params(17);
  g1(7,14)=(-((1+params(14)*params(8)/params(17))*(1-params(2))));
  g1(8,8)=(-(1-params(6)));
  g1(8,9)=1-T94;
  g1(8,10)=T236;
  g1(8,13)=(-T94);
  g1(8,15)=(-(1-params(6)));
  g1(8,16)=T236;
  g1(9,2)=1;
  g1(9,6)=(-1);
  g1(9,7)=(-1);
  g1(9,9)=1;
  g1(10,1)=1;
  g1(11,2)=(-T143);
  g1(11,3)=(-T120);
  g1(11,4)=(-(T137-(T116+T137)));
  g1(11,7)=(-((1-params(2))*T143));
  g1(11,9)=T116;
  g1(11,10)=(-(T120-1+params(4)/(1+params(9))*(1-params(8))));
  g1(11,14)=(-((1-params(2))*T143));
  g1(11,16)=(-T120);
  g1(12,1)=(-((1-params(35))*(1+params(33))));
  g1(12,2)=(-((1-params(35))*params(34)));
  g1(12,20)=1-params(35);
  g1(13,6)=(-1);
  g1(13,8)=(-1);
  g1(13,9)=1;
  g1(13,17)=1/params(24);
  g1(14,6)=(-1);
  g1(14,8)=(-1);
  g1(14,9)=1;
  g1(14,18)=1/params(23);
  g1(15,1)=(-T178);
  g1(15,19)=1;
  g1(16,3)=(-(T185-params(20)));
  g1(16,4)=T185;
  g1(16,9)=T185;
  g1(16,19)=1;
  g1(16,22)=(-1);
  g1(17,18)=(-1);
  g1(17,19)=1;
  g1(17,20)=(-1);
  g1(18,17)=(-1);
  g1(18,20)=(-1);
  g1(18,21)=1;
  g1(19,13)=1;
  g1(20,14)=1-params(30);
  g1(21,15)=1-params(31);
  g1(22,16)=1-params(32);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],22,484);
end
end
