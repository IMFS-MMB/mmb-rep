function y = MDP_SS_omegssHH(betta,betta_NR,betta_NR_E,mu_R_D,mu_R_L,mu_R_L_E,sigma,sigma_HH,mu_NFC,mu_HH,subv_R_D,subv_R_L_E,subv_R_L)

fun = @(x) betta_NR*(1+((((1/betta-1)/(mu_R_D*(1-subv_R_D))))*mu_R_L*(1-subv_R_L)))*((1-normcdf((log(x)+0.5*sigma_HH^2)/(sigma_HH)))/(1-normcdf((log(x)+0.5*sigma_HH^2)/(sigma_HH)) - mu_HH*x*(1/(x*(sigma_HH)*sqrt(2*3.141592653589793)))*exp(-((log(x)+ 0.5*sigma_HH^2)^2)/(2*(sigma_HH^2)))))-1;
x0 = 0.7;
y=fzero(fun,x0);