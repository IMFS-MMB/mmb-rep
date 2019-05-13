NK_CDDL17 Replication 

+ last change: 2018-09-16

+ replication: 	- IRF from a normal productivity shock (one standard deviation)
		- IRF from risky productivity shock (one standard deviation)

+ replicated IRF: 	- “figure3.png” represents figure 3 in the paper
			- “figure4.png” represents figure 4 in the paper

+ file to produce replicated IRF: 	
		- run.m calls three mod files in the three subfolders.
		- The mod files are taken from the code provided by the authors (https://www.aeaweb.org/articles?id=10.1257/mac.20140139).
			* the first mod file has κ = 0.14 (capital requirements) and hence no risky technology is used.
			* the second mod file has κ set optimally and hence κ is the minimum value that excludes the risky technology from being used.
			* the third mod file has κ = 0.1 and then the risky technology is being used. 
		- calib.m is used by the mod files and it is taken from the code provided by the authors. 			* Changes: the first values for parameters “nbeta” and “sigma” are used, subsequent values are commented out  
		- calibgam.m is used by the mod files and it is taken from the code provided by the authors.
		- comp_lambda_model…mod is used to calculate the optimal monetary policy parameters for each mod file and it is taken from the code of the authors.
		- fcsolve.m is used by file calib.m, but NOT provided in the code of the authors. It is taken from (http://www.harrisdellas.net/teaching/dsge_seminar/download/programs_2/fcsolve.txt)

+ literature:
  - Collard, Fabrice, Harris Dellas, Behzad Diba, and Olivier Loisel. 2017. “Optimal Monetary and Prudential Policies.” American Economic Journal: Macroeconomics, 9 (1): 40-87.



compareMMBtoRep2.m and compareMMBtoRep3.m:

+ These two files allow a comparison between a model in the implementation of the model in the MMB and the original replication. 
+ "compareMMBtoRep2.m" compares the MMB implementation with the version of the model, in which prudential policy is set optimally, and the risky technology is not used. 
+ "compareMMBtoRep3.m" compares the MMB implementation with the version of the model, in which capital requirements are too low and the risky technology is used.

+ Use option "run and advance" of Matlab for both files, so that there is time to apply the MMB options.