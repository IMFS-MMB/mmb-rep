NK_RA16 Replication

+ last change: 2018-03-15

+ replication: IRF to monetary policys shock  

+ replicated IRFs: Fig2_fullmodel.pdf shows the responses of the variables in the full model to a contractionary 
    monetary policy shock as in fig. 2 of the article.    

+ file to produce replicated IRFs: run.m (which calls NK_R16_rep.mod in the folder NK_R16_rep) 

+ literature:
  -  Rannenberg, Ansgar (2016). "Bank Leverage Cycles and the External Finance Premium", Journal of Money, Credit and Banking, 
            Vol. 48, No. 8, pp. 1569-1612

+ Notes on replication:
    -  This code replicates the full model used in figure 1 and 2 of the article. To perfectly match the IRFs 
    - in figure 1 and 2, variable capital utilization need to be included. The calibration of the respective 
    - parameter is not included in the paper, but was provided by the author.
