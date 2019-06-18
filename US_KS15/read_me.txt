US_KS15 Replication

+ last change: 2019-05-24

+ replicated IRFs: Fig3 of the paper: IRF to government spending shock of 1% in Regime 3 und 4

+ file to produce replicated IRFs: run.m (which calls US_KS15_R3.mod and US_KS15_R4.mod) 

+ literature:
	- Literatur: A. Kriwoluzky and C. Stoltenberg (2015): Monetary Policy and 
	  the Transaction Role of Money in the US. Economic Journal, Vol 125, 1452-1473 
 
+ Notes on replication:
 - To replicate Fig 3., one has to calibrate the parameters according to the prior mean 
   with the exception of: gamma=0 (no habit formation), rho_R=0 (no interest rate smoothing),
   rho_y=0 (no reaction of interest rate rule to output). Parameter Values for sigma_c, eta_cc and eta_R 
   are set in accordance with code provided by authors.

Note: While the parametrization as above is necessary to replicate Fig3, 
      in the MMB-file that is used for model comparison, we use the posterior mean to calibrate the parameters!