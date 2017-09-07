
function z=NK_GM05_CITR_SD_ff(y)
z=zeros(14,1);
global ex_ ex_det_ it_ recur_

global alpha beta kappa omega phipi rho rhoa rhoy sigma tau 
global theta xi 
z(1) = y(17) -(y(22)-sigma^(-1)*(y(14)-y(21)-y(15)));
z(2) = y(15) -(-sigma*tau*(1-rhoa)*y(7)+alpha*sigma*(theta+xi)*(rhoy-1)* ...
y(20));
z(3) = y(12) -(beta*y(21)+kappa*y(17));
z(4) = y(19) -(tau*y(7)+alpha*xi*y(20));
z(5) = y(17) -(y(18)-y(19));
z(6) = y(14) -(phipi*y(11));
z(7) = y(18) -(y(20)+sigma^(-1)*y(16));
z(8) = y(11) -(y(12)+alpha*(y(16)-y(5)));
z(9) = y(11) -(y(9)-y(3));
z(10) = y(12) -(y(10)-y(4));
z(11) = y(16) -(y(5)+y(8)-y(2)+y(13)-y(12));
z(12) = y(13) -(0);
z(13) = y(7) -(rhoa*y(1)+ex_(it_-1,1));
z(14) = y(20) -(rhoy*y(6)+ex_(it_-1,2));
