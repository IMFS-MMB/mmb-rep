US_HL16 Replication

+ last change: 2019-03-31

+ replication:  IRFs Figure 4
		IRFs Figure 5
              	
+ replicated IRFs: Figure 4 are the IRFs to a technology, a monetary policy, an equity price,
		   and a price markup shock for the main macroeconomic aggregates
		   Figure 5 are the IRFs to a technology, a monetary policy, an equity price,
		   and a price markup shock for the banking sector variables
		   The IRFs are shown for the "baseline", the "no equity" and the "flexible rates" scenarios.

+ file to produce replicated IRFs: run_HL16_rep.m (which calls US_HL16_BEP.mod, US_HL16_NEP.mod and US_HL16_FI.mod
in the folder US_HL16_rep) 

+ literature:
  - H. Hollander and G. Liu (2016):
    "The equity price channel in a New-Keynesian DSGE model with financial frictions and banking"
    Economic Modelling 52, pp. 375-389
 
+ Notes on replication:
 - In both figures, there are small differences in the replicated IRFs to a technology shock in the "flexible rates" scenario.
   All the other IRFs are matched exactly.