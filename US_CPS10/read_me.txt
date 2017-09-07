US_CPS10 Replication

+ replicated model corresponds to the model used in Cogley, Primiceri and Sargent (2010)

+ last change: 2017-03-11

+ replication: Responses of inflation gap and real interest rate to an inflation target shock (unit shock) 
                

+ replicated IRFs: US_CPS10_irf.pdf (inflation target shock)
                        

+ file to produce replicated IRFs: run.m (which calls US_CPS10_rep1.mod and US_CPS10_rep2.mod in the subfolder US_CPS10_rep)

+ US_CPS10_rep1.mod produces IRFs using parameterization estimated for the period 1960:Q1-1979:Q3.
 
+ US_CPS10_rep2.mod produces IRFs using counterfactual parameterization, that is, parameters estimated for the period 1960:Q1-1979:Q3, 
except that the parameter for the policy reaction to inflation (phi_pi) is exchanged for the estimated parameter for the period 1982:Q4-2006:Q4. 

+ US_CPS10_rep3.mod produces IRFs using parameterization estimated for the period 1982:Q4-2006:Q4 (not needed for the replication).

+ For the sake of better comparability with other estimated US-models the model using the parameterization estimated for 
  the period 1982:Q4-2006:Q4 was implemented. In the .mod file the different parameterizations from above were included as well, yet commented out. 
  In case you wish to use the parameterization estimated for the period 1960:Q1-1979:Q3 or the counterfactual set, you can conveniently switch 
  by commenting in.

+ original IRFs: Original IRFs in Figure 6 on page 63.     
                    
+ literature:
  - Cogley, T, G. E. Primiceri and T. J. Sargent (2010) “Inflation-Gap Persistence in the US” American Economic Journal: Macroeconomics, 2 (1), 43-69.