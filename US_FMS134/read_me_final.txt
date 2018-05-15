US_FMS134 Replication

+ This replication is meant to produce Impulse Response Function of the 4th specification of Feve et. al. where the specification
	admits endogenous governement spending policy and allowing for Edgeworth Complementarity/Substitutability 

+ The model is first replicated by following the estimation stage of the original paper where the authors
	used Bayesian Technique with Metropolis-Hastings Algorithm

+ last change: 2017-02-27

+ Model Simulation: IRF to Monetary Policy Shock using model specific rule
                    IRF to Fiscal Policy Shock using model specific rule

+ Replicated IRFs: US_FMS134_irf_monpol.pdf (monetary policy shock)
                   US_FMS134_irf_fispol.pdf (fiscal policy shock)     

+ file to produce replicated IRFs: run.m (which calls US_FMS134_replication.mod in the folder US_FMS134_replication)

+ No illustrated IRF in the original paper. The estimated value of the fiscal multiplier from this
    replication exercise is very close (Bayesian MCMC estimation) to the value presented in Table 6 of the original paper p.168. 
  
+ literature:
  - Patrick Fève, Julien Matheron and  Jean-Guillaume Sahuc (2013): "A Pitfall with Estimated 
    DSGE-Based Government Spending Multipliers" American Economic Journal: Macroeconomics, 
    5,141-178
