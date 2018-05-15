function [residual, g1, g2] = NK_PP17_rep_static(y, x, params)
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

residual = zeros( 14, 1);

%
% Model equations
%

T42 = 1/(1+params(7)*params(6));
lhs =y(4);
rhs =params(10)*((params(2)+params(4))*y(2)+params(3)*(y(3)+params(9)*y(5))+y(12))+y(4)*params(1);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(4);
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(3)+y(6)-y(4)+T42*(params(7)*params(6)*y(7)+y(5)*params(6)+(params(6)-1)*y(8))+y(11);
residual(3)= lhs-rhs;
lhs =y(6)+y(7);
rhs =y(2)*(params(4)+1+params(2))+(1+params(4))/(params(2)+params(4))*y(10)-(y(3)+params(9)*y(5))*(1-params(3));
residual(4)= lhs-rhs;
lhs =y(7)+y(14);
rhs =y(5)*params(6)+(params(6)-1)*y(8)+params(1)*(y(14)+(1+params(7)*params(6))*y(7));
residual(5)= lhs-rhs;
residual(6) = y(8);
lhs =y(3);
rhs =y(4)*params(16)+y(2)*params(17)+y(13);
residual(7)= lhs-rhs;
lhs =y(2);
rhs =y(1)-(1+params(4))/(params(2)+params(4))*y(10);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =params(10)*((params(2)+params(4))*y(2)+params(3)*(y(3)+params(9)*y(5)));
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(10)*params(11)-x(1);
residual(10)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(12)+x(2);
residual(11)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(13)-x(3);
residual(12)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(14)-x(4);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(14)*params(15)+x(5);
residual(14)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(14, 14);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-(params(10)*(params(2)+params(4))));
  g1(1,3)=(-(params(10)*params(3)));
  g1(1,4)=1-params(1);
  g1(1,5)=(-(params(10)*params(3)*params(9)));
  g1(1,12)=(-params(10));
  g1(2,3)=1;
  g1(2,4)=(-1);
  g1(3,3)=(-1);
  g1(3,4)=1;
  g1(3,5)=(-(params(6)*T42));
  g1(3,7)=(-(params(7)*params(6)*T42));
  g1(3,8)=(-(T42*(params(6)-1)));
  g1(3,11)=(-1);
  g1(4,2)=(-(params(4)+1+params(2)));
  g1(4,3)=1-params(3);
  g1(4,5)=params(9)*(1-params(3));
  g1(4,6)=1;
  g1(4,7)=1;
  g1(4,10)=(-((1+params(4))/(params(2)+params(4))));
  g1(5,5)=(-params(6));
  g1(5,7)=1-params(1)*(1+params(7)*params(6));
  g1(5,8)=(-(params(6)-1));
  g1(5,14)=1-params(1);
  g1(6,8)=1;
  g1(7,2)=(-params(17));
  g1(7,3)=1;
  g1(7,4)=(-params(16));
  g1(7,13)=(-1);
  g1(8,1)=(-1);
  g1(8,2)=1;
  g1(8,10)=(1+params(4))/(params(2)+params(4));
  g1(9,2)=(-(params(10)*(params(2)+params(4))));
  g1(9,3)=(-(params(10)*params(3)));
  g1(9,5)=(-(params(10)*params(3)*params(9)));
  g1(9,9)=1;
  g1(10,10)=1-params(11);
  g1(11,12)=1-params(12);
  g1(12,11)=1-params(13);
  g1(13,13)=1-params(14);
  g1(14,14)=1-params(15);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,196);
end
end
