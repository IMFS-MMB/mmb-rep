function [residual, g1, g2] = NK_GM05_DIT_SD_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 14, 1);

%
% Model equations
%

T10 = params(1)^(-1);
lhs =y(2);
rhs =y(2)-T10*(y(6)-y(1)-y(5));
residual(1)= lhs-rhs;
lhs =y(5);
rhs =(-params(1))*params(3)*(1-params(11))*y(13)+params(1)*params(4)*(params(5)+params(6))*(params(12)-1)*y(12);
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(7)+y(2)*params(8);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =params(3)*y(13)+y(12)*params(4)*params(6);
residual(4)= lhs-rhs;
lhs =y(2);
rhs =y(3)-y(4);
residual(5)= lhs-rhs;
residual(6) = y(1);
lhs =y(3);
rhs =y(12)+T10*y(7);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(1);
residual(8)= lhs-rhs;
residual(9) = y(8);
residual(10) = y(1);
lhs =y(7);
rhs =y(7)+y(11)-y(11)+y(14)-y(1);
residual(11)= lhs-rhs;
residual(12) = y(14);
lhs =y(13);
rhs =params(11)*y(13)+x(2);
residual(13)= lhs-rhs;
lhs =y(12);
rhs =params(12)*y(12)+x(1);
residual(14)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(14, 14);

%
% Jacobian matrix
%

  g1(1,1)=(-T10);
  g1(1,5)=(-T10);
  g1(1,6)=T10;
  g1(2,5)=1;
  g1(2,12)=(-(params(1)*params(4)*(params(5)+params(6))*(params(12)-1)));
  g1(2,13)=(-((-params(1))*params(3)*(1-params(11))));
  g1(3,1)=1-params(7);
  g1(3,2)=(-params(8));
  g1(4,4)=1;
  g1(4,12)=(-(params(4)*params(6)));
  g1(4,13)=(-params(3));
  g1(5,2)=1;
  g1(5,3)=(-1);
  g1(5,4)=1;
  g1(6,1)=1;
  g1(7,3)=1;
  g1(7,7)=(-T10);
  g1(7,12)=(-1);
  g1(8,1)=(-1);
  g1(8,8)=1;
  g1(9,8)=1;
  g1(10,1)=1;
  g1(11,1)=1;
  g1(11,14)=(-1);
  g1(12,14)=1;
  g1(13,13)=1-params(11);
  g1(14,12)=1-params(12);
  if ~isreal(g1)
    g1 = real(g1)+imag(g1).^2;
  end
end
if nargout >= 3,
%
% Hessian matrix
%

  g2 = sparse([],[],[],14,196);
end
end
