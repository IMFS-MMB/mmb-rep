
function z=NK_GM05_DIT_SD_fff(y)
z=zeros(14,1);
global ex_ ex_det_ it_ recur_

global alpha beta kappa omega phipi rho rhoa rhoy sigma tau 
global theta xi 
z(1) = y(11) -(y(11)-sigma^(-1)*(y(8)-y(6)-y(9)));
z(2) = y(9) -(-sigma*tau*(1-rhoa)*y(1)+alpha*sigma*(theta+xi)*(rhoy-1)* ...
y(14));
z(3) = y(6) -(beta*y(6)+kappa*y(11));
z(4) = y(13) -(tau*y(1)+alpha*xi*y(14));
z(5) = y(11) -(y(12)-y(13));
z(6) = y(6) -(0);
z(7) = y(12) -(y(14)+sigma^(-1)*y(10));
z(8) = y(5) -(y(6)+alpha*(y(10)-y(10)));
z(9) = y(5) -(y(3)-y(3));
z(10) = y(6) -(y(4)-y(4));
z(11) = y(10) -(y(10)+y(2)-y(2)+y(7)-y(6));
z(12) = y(7) -(0);
z(13) = y(1) -(rhoa*y(1)+ex_(it_-1,1));
z(14) = y(14) -(rhoy*y(14)+ex_(it_-1,2));
if ~isreal(z)
  z = real(z)+imag(z).^2;
end
