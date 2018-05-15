function [residual, g1, g2] = NK_GLSV07_pclm_rep_static(y, x, params)
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

residual = zeros( 10, 1);

%
% Model equations
%

T133 = 1/(1-params(4));
lhs =y(4);
rhs =params(6)*y(1)*(1-params(1))/(1-params(4))+y(4)*(1-params(6)+params(6)*params(1)/(1-params(4)))-params(6)*y(2)*params(3)/(1-params(4))-params(6)*y(6)/(1-params(4));
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(1)*params(12)*(params(1)+params(21))+y(3)*params(2)+y(2)*params(12)-y(4)*params(1)*params(12);
residual(2)= lhs-rhs;
lhs =y(2)-y(1)*params(9)+y(3)*params(19)/params(16);
rhs =y(6)*params(10)*params(18)*(params(15)-1)+y(2)+y(3)/params(16)-y(1)*params(9);
residual(3)= lhs-rhs;
lhs =y(3)*params(19)*(1-params(4))*params(7)+y(1)*(1-params(1))-y(2)*params(3)-y(4)*(1-params(4)-params(1));
rhs =y(6)*(1-params(2)*params(15))+y(3)*(1-params(4))*params(7)+y(1)*(params(20)*(1+params(21))+(1-params(1))*params(2))+y(2)*(params(20)-params(3)*params(2))-y(4)*(params(20)+params(2)*(1-params(4)-params(1)));
residual(4)= lhs-rhs;
lhs =y(5);
rhs =y(6)*(1+params(14))*(1-params(18))+y(5)*(1+params(14))*(1-params(17));
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(15)+x(1);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(1)*(1-params(1))+y(4)*params(1);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(2)+y(1)*params(21);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(6)*params(18)+params(17)*y(5);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(4)+T133*(y(1)*(1-params(1))-y(2)*params(3)-y(6)-y(4)*(1-params(4)-params(1)));
residual(10)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(10, 10);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(params(6)*(1-params(1))/(1-params(4))));
  g1(1,2)=params(6)*params(3)/(1-params(4));
  g1(1,4)=1-(1-params(6)+params(6)*params(1)/(1-params(4)));
  g1(1,6)=params(6)/(1-params(4));
  g1(2,1)=(-(params(12)*(params(1)+params(21))));
  g1(2,2)=(-params(12));
  g1(2,3)=1-params(2);
  g1(2,4)=params(1)*params(12);
  g1(3,3)=params(19)/params(16)-1/params(16);
  g1(3,6)=(-(params(10)*params(18)*(params(15)-1)));
  g1(4,1)=1-params(1)-(params(20)*(1+params(21))+(1-params(1))*params(2));
  g1(4,2)=(-params(3))-(params(20)-params(3)*params(2));
  g1(4,3)=params(19)*(1-params(4))*params(7)-(1-params(4))*params(7);
  g1(4,4)=(-(1-params(4)-params(1)))-(-(params(20)+params(2)*(1-params(4)-params(1))));
  g1(4,6)=(-(1-params(2)*params(15)));
  g1(5,5)=1-(1+params(14))*(1-params(17));
  g1(5,6)=(-((1+params(14))*(1-params(18))));
  g1(6,6)=1-params(15);
  g1(7,1)=(-(1-params(1)));
  g1(7,4)=(-params(1));
  g1(7,7)=1;
  g1(8,1)=(-params(21));
  g1(8,2)=(-1);
  g1(8,8)=1;
  g1(9,5)=(-params(17));
  g1(9,6)=(-params(18));
  g1(9,9)=1;
  g1(10,1)=(-((1-params(1))*T133));
  g1(10,2)=(-(T133*(-params(3))));
  g1(10,4)=(-(1+T133*(-(1-params(4)-params(1)))));
  g1(10,6)=T133;
  g1(10,10)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,100);
end
end
