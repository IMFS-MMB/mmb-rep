NK_GS14 Replication

+ last change: 2019-02-13

+ replication: IRF to technology shock
               IRF to cost-push shock 
              	
+ replicated IRFs: NK_GS14_Fig3.pdf is the IRF to a technology shock with a standard Taylor rule 
		   and an asset-price augmented rule   

+ file to produce replicated IRFs: run.m (which calls NK_GS14_rep.mod in the folder NK_GS14_rep) 

+ literature:
  - L. Gambacorta and F.M. Signoretti (2014):
    "Should MP Lean against the Wind? An Analysis based on a DSGE Model with Banking"
    Journal of Economic Dynamics & Control 43, pp. 146-174
 
+ Notes on replication:
 - The replicated IRFs do not match the original ones exactly: output and leverage react on impact
   slightly different in the case of a standard Taylor rule.
   The parameters chosen are the ones described in the paper for the optimal policy rules.