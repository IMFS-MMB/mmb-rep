function [errcheck,lmss_vals]=comp_lambda_model1(xx)
% Coefficients defining linear system for obtaining steady states of LM variables 

global M_;

nbeta= M_.params(1);
chi  = M_.params(2);
thh  = M_.params(3);
nu   = M_.params(4);
delta= M_.params(5);
sigma= M_.params(6);
mup  = M_.params(7);
xi   = M_.params(8);
dpss = M_.params(9);
tau  = M_.params(10);

cnk_SS   = xx(1);
ynk_SS   = xx(2);
ink_SS   = xx(3);
knk_SS   = xx(4);
hnk_SS   = xx(5);
psink_SS = xx(6);
pnnk_SS  = xx(7);
pdnk_SS  = xx(8);
dpnk_SS  = xx(9);
dynk_SS  = xx(10);
Rsnk_SS  = xx(11);
Rdnk_SS  = xx(12);
lbnk_SS  = xx(13);
enk_SS   = xx(14);
dnk_SS   = xx(15);
lnk_SS   = xx(16);
psil_SS  = xx(17);
  
lmss_mat = zeros(17,16); 
lmss_vec = zeros(17,1); 
lmss_vec(1) = 1; 
lmss_mat(1,1) = 1; 
lmss_mat(1,5) = -exp(cnk_SS);
lmss_mat(2,13) = -exp(dnk_SS); 
lmss_mat(3,6) = 1/nbeta; 
lmss_mat(3,7) = -exp(Rsnk_SS - dpnk_SS + lbnk_SS)/nbeta; 
lmss_mat(3,8) = -(sigma*xi*exp(pnnk_SS + dpnk_SS*sigma))/dpss^sigma; 
lmss_mat(3,9) = -dpss^(1 - sigma)*xi*exp(pdnk_SS + dpnk_SS*(sigma - 1))*(sigma - 1); 
lmss_mat(3,10) = -dpss^(1 - sigma)*xi*exp(dpnk_SS*(sigma - 1))*(sigma - 1); 
lmss_mat(3,11) = -(sigma*xi*exp(dynk_SS + dpnk_SS*sigma))/dpss^sigma; 
lmss_mat(4,3) = 1; 
lmss_mat(4,11) = exp(dynk_SS) - (nbeta*xi*exp(dynk_SS + dpnk_SS*sigma))/dpss^sigma; 
lmss_mat(5,12) = 1; 
lmss_mat(5,13) = -exp(enk_SS); 
lmss_vec(6) = -thh*exp(hnk_SS*(chi + 1)); 
lmss_mat(6,2) = chi + 1; 
lmss_mat(6,3) = nu - 1; 
lmss_mat(7,4) = -exp(ink_SS); 
lmss_mat(7,5) = -exp(ink_SS); 
lmss_mat(8,3) = -nbeta*nu; 
lmss_mat(8,4) = exp(knk_SS) + nbeta*exp(knk_SS)*(delta - 1); 
lmss_mat(8,7) = nu*exp(lbnk_SS - knk_SS + psink_SS + ynk_SS); 
lmss_mat(8,14) = -exp(knk_SS); 
lmss_mat(9,1) = 1; 
lmss_mat(9,2) = -1; 
lmss_mat(9,6) = 1 - 1/nbeta; 
lmss_mat(9,7) = (exp(Rsnk_SS - dpnk_SS + lbnk_SS) - nu*exp(lbnk_SS - knk_SS + psink_SS + ynk_SS) + exp(lbnk_SS)*(delta - 1))/nbeta; 
lmss_mat(9,8) = -mup*exp(lbnk_SS + psink_SS + ynk_SS); 
lmss_mat(9,9) = -exp(lbnk_SS + ynk_SS); 
lmss_mat(10,5) = -exp(lnk_SS + psil_SS); 
lmss_mat(10,12) = -1; 
lmss_mat(10,13) = exp(lnk_SS); 
lmss_mat(10,14) = exp(lnk_SS); 
lmss_mat(11,9) = exp(pdnk_SS) - dpss^(1 - sigma)*xi*exp(pdnk_SS + dpnk_SS*(sigma - 1)); 
lmss_mat(11,10) = exp((pdnk_SS - pnnk_SS)*(sigma - 1))*(sigma - 1)*(xi - 1); 
lmss_mat(11,11) = sigma*exp(sigma*(pdnk_SS - pnnk_SS))*(xi - 1); 
lmss_mat(12,8) = exp(pnnk_SS) - (xi*exp(pnnk_SS + dpnk_SS*sigma))/dpss^sigma; 
lmss_mat(12,10) = -exp((pdnk_SS - pnnk_SS)*(sigma - 1))*(sigma - 1)*(xi - 1); 
lmss_mat(12,11) = -sigma*exp(sigma*(pdnk_SS - pnnk_SS))*(xi - 1); 
lmss_mat(13,2) = -1; 
lmss_mat(13,7) = -(nu*exp(lbnk_SS - knk_SS + psink_SS + ynk_SS))/nbeta; 
lmss_mat(13,8) = -mup*exp(lbnk_SS + psink_SS + ynk_SS); 
lmss_mat(14,6) = -1; 
lmss_mat(14,15) = -exp(Rsnk_SS - Rdnk_SS)*(tau - 1); 
lmss_mat(15,16) = 1; 
lmss_mat(16,7) = exp(Rsnk_SS - dpnk_SS + lbnk_SS); 
lmss_mat(16,15) = exp(Rsnk_SS - Rdnk_SS)*(tau - 1); 
lmss_mat(16,16) = -1; 
lmss_mat(17,2) = -1; 
lmss_mat(17,3) = 1; 
lmss_mat(17,5) = exp(ynk_SS); 
lmss_mat(17,7) = -(nu*exp(lbnk_SS - knk_SS + psink_SS + ynk_SS))/nbeta; 
lmss_mat(17,8) = -mup*exp(lbnk_SS + psink_SS + ynk_SS); 
lmss_mat(17,9) = -exp(lbnk_SS + ynk_SS); 

lmss_vals = -lmss_mat \ lmss_vec; 
errcheck = max(abs(lmss_mat*lmss_vals + lmss_vec)); 
if errcheck > 1e-08, 
  disp('Warning: steady states of lagrange multipliers cannot be accurately determined'); 
  disp(['         errcheck = ',num2str(errcheck,12)]); 
end; 

