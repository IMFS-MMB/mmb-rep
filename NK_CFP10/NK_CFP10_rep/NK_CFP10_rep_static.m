function [residual, g1, g2] = NK_CFP10_rep_static(y, x, params)
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

residual = zeros( 18, 1);

%
% Model equations
%

T57 = 1/params(1);
lhs =params(2)*y(1)+params(3)*y(11);
rhs =y(14);
residual(1)= lhs-rhs;
lhs =params(2)*y(1)+params(3)*y(12);
rhs =y(13);
residual(2)= lhs-rhs;
lhs =0;
rhs =y(4)-y(5);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =(-(1/(1+params(7))*y(17)));
residual(4)= lhs-rhs;
lhs =y(8)+y(9);
rhs =y(1)+y(6)+y(7)*params(7);
residual(5)= lhs-rhs;
lhs =y(8);
rhs =T57*(y(17)+y(8)-y(3)*(params(2)+params(3))*params(4)*(1-params(1))+y(7)*(1+params(7)*params(1)-params(6)*(1-params(1))*params(5)*params(4)));
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(3)*(params(2)+params(3))+y(7)*params(5)*params(6);
residual(7)= lhs-rhs;
lhs =y(1);
rhs =y(15)+y(12)*(1-params(5))+y(11)*params(5);
residual(8)= lhs-rhs;
lhs =y(5);
rhs =y(6)*params(9)+y(5)*params(1)+params(9)*y(16);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(1)-y(6)*(params(4)-1);
residual(10)= lhs-rhs;
lhs =y(7)*params(6);
rhs =y(1)+y(6)-y(14)-y(11);
residual(11)= lhs-rhs;
lhs =y(4);
rhs =y(5)*params(14)+y(3)*params(15)+y(18);
residual(12)= lhs-rhs;
lhs =y(2);
rhs =y(15)*(1+params(3))/(params(2)+params(3));
residual(13)= lhs-rhs;
lhs =y(3);
rhs =y(1)-y(2);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(10)-x(1);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(12)+x(2);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(17)*params(13)-x(3);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(11)-x(4);
residual(18)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(18, 18);

  %
  % Jacobian matrix
  %

  g1(1,1)=params(2);
  g1(1,11)=params(3);
  g1(1,14)=(-1);
  g1(2,1)=params(2);
  g1(2,12)=params(3);
  g1(2,13)=(-1);
  g1(3,4)=(-1);
  g1(3,5)=1;
  g1(4,7)=1;
  g1(4,17)=1/(1+params(7));
  g1(5,1)=(-1);
  g1(5,6)=(-1);
  g1(5,7)=(-params(7));
  g1(5,8)=1;
  g1(5,9)=1;
  g1(6,3)=(-(T57*(-((params(2)+params(3))*params(4)*(1-params(1))))));
  g1(6,7)=(-(T57*(1+params(7)*params(1)-params(6)*(1-params(1))*params(5)*params(4))));
  g1(6,8)=1-T57;
  g1(6,17)=(-T57);
  g1(7,3)=(-(params(2)+params(3)));
  g1(7,6)=1;
  g1(7,7)=(-(params(5)*params(6)));
  g1(8,1)=1;
  g1(8,11)=(-params(5));
  g1(8,12)=(-(1-params(5)));
  g1(8,15)=(-1);
  g1(9,5)=1-params(1);
  g1(9,6)=(-params(9));
  g1(9,16)=(-params(9));
  g1(10,1)=(-1);
  g1(10,6)=params(4)-1;
  g1(10,10)=1;
  g1(11,1)=(-1);
  g1(11,6)=(-1);
  g1(11,7)=params(6);
  g1(11,11)=1;
  g1(11,14)=1;
  g1(12,3)=(-params(15));
  g1(12,4)=1;
  g1(12,5)=(-params(14));
  g1(12,18)=(-1);
  g1(13,2)=1;
  g1(13,15)=(-((1+params(3))/(params(2)+params(3))));
  g1(14,1)=(-1);
  g1(14,2)=1;
  g1(14,3)=1;
  g1(15,15)=1-params(10);
  g1(16,16)=1-params(12);
  g1(17,17)=1-params(13);
  g1(18,18)=1-params(11);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,324);
end
end
