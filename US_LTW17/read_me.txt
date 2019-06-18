US_LTW17 Replication

+ replicated model corresponds to the New Keynesian model used in Leeper, Traum and Walker (2017)

+ parameters were imported from the 'meandraw' vector in the postmean_regimeM_5507.mat file to be found in the directory '\replication files\EstimatedModel\mat_files' 
  in the original code provided on the journal website (5021.zip). 

+ last change: 2019-05-10

+ replication: The original model was set up in Matlab and was extracted from the model code, in particular from 'model.m' to be found in  
  '\replication files\EstimatedModel\model_files', and was translated then into Dynare. It replicates posterior mean responses to a government spending increase in 
  estimated regime M, that is, under monetary dominance. In particular, it replicates the baseline scenario (solid line) in Figure 5 from the original
  publication on p. 2437. Please note that the scaling in Panel B. in Figure 5 in the journal seems wrong, it is lower by one order of magnitude than it 
  should be, i.e. -0.02 instead of -0.2.
                
+ replicated posterior mean responses to a government spending increase: US_LTW_irf.pdf                    

+ file to produce replicated posterior mean responses to a government spending increase: run.m (which calls the translated Dynare code). Before executing run.m, 
  do not forget to add the path to your Dynare version. To replicate the response functions Dynare 4.5.6 was used. Alternatively, you could also obtain the original 
  responses by 'executing posterior_multiplier_counterfactuals.m' from the original code provided by the authors on the journal website, but before running, you will 
  have to comment out lines 48 and 49, that is 'param(28) = 0.8;' and 'param(29) = 0;' and set 'RegimeM_I = 1;' and 'band_I = 0;' 

+ US_LTW17_rep.mod produces the same IRFs using using dynare. For for the implementation into the MMB the flexprice model was added to the original model.
  In addition, as there is no option to implement models with a monetary policy rule including an AR(1) structure in the error term, the model was implemented
  without the AR(1)-term in the monetary policy rule. 
                    
+ literature: Eric M. Leeper, Nora Traum and Todd B. Walker (2017) "Clearing Up the Fiscal Multiplier Morass". American Economic Review, Vol. 107, No. 8, (2017), pp. 2409-2454
  