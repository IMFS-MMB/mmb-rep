function y = MDP_SS_omegss(betta,betta_NR,betta_NR_E,mu_R_D,mu_R_L,mu_R_L_E,sigma,sigma_HH,mu_NFC,mu_HH,subv_R_D,subv_R_L_E,subv_R_L)

fun = @(x) betta_NR_E*(1+((((1/betta-1)/(mu_R_D*(1-subv_R_D))))*mu_R_L_E*(1-subv_R_L_E)))*((1-normcdf((log(x)+0.5*sigma^2)/(sigma)))/(1-normcdf((log(x)+0.5*sigma^2)/(sigma)) - mu_NFC*x*(1/(x*(sigma)*sqrt(2*3.141592653589793)))*exp(-((log(x)+ 0.5*sigma^2)^2)/(2*(sigma^2)))))-1;
x0 = 0.5;
y=fzero(fun,x0);