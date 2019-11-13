GRC_MP17 Replication

+ Replication package identical for ESP_MP17, GRC_MP17, IRL_MP17, and PRT_MP17.

+ last change: 2019-07-30

+ replication: 
  This code does not replicate IRFs because they are not the focus of the original paper. Instead, it reproduces 
	Tables 5 and 6 and Figures 4-12.

		* Table 5: Goodness of Fit
			- run line 17 in run.m
			- results are stored in fit_table_struct_demean.csv and fit_table_struct_demean_tex.txt

		* Table 6: Employment Change
			- run line 26 in run.m
			- results are stored in table_pigs.txt

		* Figure 4: Benchmark Model Fit
			- run line 14 in run.m
			- figures are stored in the sub-folder Figs_Benchm

		* Figures 5, 6: Fiscal Counterfactual
			- run line 20 in run.m
			- figures are stored in the sub-folder Figs_CounterFact, all files beginning with "cf_fiscal"

		* Figures 7, 8: Monetary Counterfactual
			- run line 21 in run.m
			- figures are stored in the sub-folder Figs_CounterFact, all files beginning with "cf_mp"

		* Figures 9, 10: Fiscal+Macroprudential Counterfactual
			- run line 22 in run.m
			- figures are stored in the sub-folder Figs_CounterFact, all files beginning with "cf_fiscalmp"

		* Figures 11, 12: No Segmentation Counterfactual
			- run line 23 in run.m
			- figures are stored in the sub-folder Figs_CounterFact, all files beginning with "cf_rho"


+ Note 1: Parameter values for the interest spread rule in file Prog_Sim_Structural_NKM.m lines 164-167 are taken 
	from the published paper, not the original Matlab code. Results were found to be robust to this change.

+ Note 2: The modelbase implementation is solely based on the file GRC_MP17_rep.mod.
	  
+ literature:
	- Martin, Philippe and Thomas Philippon, 2017. "Inspecting the Mechanism: Leverage and the Great Recession
	  in the Eurozone", American Economic Review, vol. 107(7), pages 1904-1937.