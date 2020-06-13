EA_SWW14 Replication

+ last change: 2019-07-07

+ replication: IRF to all 8 shocks in the model (one standard deviation)
etaa: technology shock
etab: risk premium shock
etag: exogenous spending shock
etaq: investment specific technology shock
etar: monetary policy shock
etas: labor supply shock
etap: price markup shock
etaw: wage markup shock 

+ replicated IRF: EA_SWW14_irf.pdf

+ file to produce replicated IRF: run.m (which calls EA_SWW14_rep.mod in the folder 
	EA_SWW14_rep and replicates figures 2,3 and 4)

+ original IRFs: figure 2, figure 3 and figure 4 on pages 24-25 in Smets, Warne and Wouters 2013

+ literature:
  - Smets, Warne and Wouters, Professional Forecasters and the Real-Time Forecasting Performance
    of an Estimated New Keynesian Model for the Euro Area, ECB Working Paper Series NO 1571, August 2013

+ findings: 

IRFs are not matching initially, but after doing the following steps, they are identical.
(All steps can be seen in the file replication.txt. Here are the most important steps, but not in full detail)

- use the posterior modes of the parameter estimates from the authors' code (see parameters.txt)
- define real wage
- define annualized interest and inflation rate
- change sign of technology shock (in MC) and interest rate shock (in MP rule) and price markup shock (in pi)
- use a different flex price wage equation


EDIT: 
- parameters.txt provides the code by the authors, especially the used parameters because they are different to those in the paper.
