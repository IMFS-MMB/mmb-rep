NK_MPT10 Replication

+ last change: 2018-03-15

+ replication: IRF to government spending shock  

+ replicated IRFs: Fig11.pdf is fig. 11 of the article.    

+ file to produce replicated IRFs: run.m (which calls NK_MPT10_rep.mod in the folder NK_MPT10_rep) 

+ literature:
  -  T. Monacelli, R. Perotti, A. Trigari (2010): "Unemployment Fiscal Multiplier", Journal of Monetary Economics 57, pp.531-553

+ Notes on replication:
    - This code replicates the plot 11 of the article for sigma=1.
    - mistake in eq.(22)(reservation wage of worker) in original article: 
      Instead of multipliying Hn,t+1 with Lambda_t,t+1, it has to be divided by lambda_t
    - mistake in eq.(28)(AR(1) for government spending):
      g_y (steady state share of government spending in output) needs to be replaced with steady state of government spending 
    - investment adjustment cost parameter needs to be calibrated to monthly data (3.24*3) 
      to generate persistence in IRF of Investment as it is displayed in Fig.4 of the article (to check this: see RBC_MPT10_rep.mod 
      in the folder NK_MPT10_rep)
    - both coefficients in the Taylor rule are adjusted to monthly frequency, instead of only output coeffienct. 
    - Taking account of these mistakes, this code replicates the results of section 7 of the paper (Fig 11.) (here for sigma=1)