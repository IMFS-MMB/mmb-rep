NK_GHP16 Replication

+ last change: 2019-02-06

+ replication: IRF to a government spending shock
              
              	
+ replicated IRFs: -NK_GHP16_Fig1.pdf are the IRFs to a government spending shock with 4 different
		    values for the elasticity of substitution between home and market goods

		   -NK_GHP16_Fig2.pdf shows the fiscal multipliers of GDP, consumption, market hours,
		    and investment for different values of the elasticity of substitution between
		    home and market goods for the baseline scenario with K_m/Y=5.16

+ file to produce replicated IRFs: run.m (which calls NK_GHP16_rep.mod in the folder NK_GHP16_rep) 

+ literature:
  - Gnocchi, Hauser, Pappa, 2016 : "Housework and fiscal expansions"
    In: Journal of Monetary Economics 79, pp. 94-108
 
+ Notes on replication:
 - The parameter ksi ("kadjust") is set to 252.5 (instead of 250 as described in the paper) according to the code of the authors