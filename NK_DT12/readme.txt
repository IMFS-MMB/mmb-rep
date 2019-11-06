NK_DT12 Replication

+ last change: 2019-08-11

+ replication by: Christian Mücke & Johannes Binder

+ replications: IRF to negative technology shock 
		IRF to a positive monetary policy shock
		both under the standard Taylor-Rule



+ file to produce replicated IRF: 
	Execute 'run.m', this will produce the Figures.
	Note, that the acutal replication code is 'Fio2_Revision_Woodf.mod'.
	To replicate the Figures 1 & 2 'run.m' first executes the dynare code 'Fio2_Revision_Woodf_flex.mod'. 
	This is the flex price version of the model, where the parameter theta=0 (i.e. line 19: thet = 0 in 'param_Fio2_Revision.m').
	The solution will be stored in 'Taylor_flex_DT.mat'. 
	Then 'run.m' executes 'Fio2_Revision_Woodf.mod', which finally creates the Figures 1 and 2.
	(Dynare is needed to run the codes)

+ original IRFs: figures 1 (page 920) and 2(page 922) in De Fiore & Tristani (2012) 

+ original Code: The authors code can be found in the fiore-tristani_original_code.zip

+ findings: The replication code reproduces the mentioned IRFs with neglectable deviations due to numerical procedures.

+ literature:
  - De Fiore and Tristani (2012): Optimal monetary policy in a model of the credit channel. The Economic Journal, 123(571)