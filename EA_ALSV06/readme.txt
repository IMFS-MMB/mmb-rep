Replication of EA_ALSV06


+ Note:		As the published paper Andrés et al. (2006) "Money in an Estimated Business Cycle
		Model of the Euro Area", The Economic Journal, 116 (April), 457-477 does not 
		contain any IRFs, we used the older working paper version for the replication.

+ replication: 	IRF to technology shock
		IRF to preference shock
		for the model with separable preferences and no habits and the model with CRRA
		utility/separable preferences and habits

+ reference: 	The reference graphs are in figure 3, p. 37 of Andrés et al. (2001) "Money in an
		Estimated Business Cycle Model of the Euro Area", Working Paper 0121, Banco de
		España.

+ file to produce IRFs: run.m (which calls ALSV06WP_rep.mod for the model without habits and 
		ALSV06WPh_rep.mod for the model with habits)

		run.m is divided in several sections which give out different figures. 
		In order to be able to change and loop over individual parameters, we set
		the parameters in run.m and pass them on to the mod-files.
		The first figure produced is the replication of the IRFs for the technology
		shock. The remaining figures deal with the preference shock. As the
		replication was not successful, we run a number of different variable 
		definitions and parameterizations to try to achieve a better fit between
		the replicated figure and the reported one.
		
		The mod-files ALSV06WP_rep.mod and ALSV06WPh_rep.mod contain the models as 
		specified in the working paper and, commented out, also the equivalent 
		parameter and model blocks which correspond to the version of the model 
		implemented in the MMB.
			
+ Findings: 

 technology shock: the match is fine.
 
 preference shock: using the same response variable definitions and parameter values as for the
		technology shock, the match is poor. For the model without habits ad hoc 
		assumptions on the variable definitions and changes of some parameters yield a 
		pretty close, but still not perfect match. For the model with habits, such a
		substantial improvement of the fit was not possible; only a slight improvement in 
		the response of money growth can be achieved when one changes the sing of the 
		preference shock (a) in the money demand equation. This has to be made manually in
		the mod-file ALSV06WPh_rep.mod.