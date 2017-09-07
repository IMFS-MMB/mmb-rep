US_CFOP14 Replication

+ all versions of the model (JPT, BGG and Rk-indexation) replicated for IRFs

+ only the Rk-indexation model included in the Macro Model Data base

+ JPT (i.e., Justiniano et al. 2011) model is also in the Macro Model Data base but under the parameterization estimated by JPT

+ last change: 2016-03-11

+ replication: IRF to marginal efficiency of investment (s.d. shock as estimated under BGG version) 
               IRF to net worth (s.d. shock as estimated under BGG version)
	       IRF to idiosyncratic variance (s.d. shock as estimated under BGG version)
               IRF to monetary policy (s.d. shock as estimated under BGG version)

+ replicated IRFs: US_CFOP14_irf_mei.pdf (marginal efficiency of investment shock)
                   US_CFOP14_irf_nw.pdf (net worth shock)
		   US_CFOP14_irf_iv.pdf (idiosyncratic variance shock) 
		   US_CFOP14_irf_mp.pdf (monetary policy shock) 

+ file to produce replicated IRFs: run.m (which calls .mod files for each version of the model in the folder US_CFOP14_rep)

+ original IRFs: figure 3a on page 142 in Carlstrom et al. 2014 (marginal efficiency of investment shock)
  		 figure 3b on page 143 in Carlstrom et al. 2014 (net worth shock)
		 figure 3c on page 144 in Carlstrom et al. 2014 (idiosyncratic variance shock)
		 figure 3d on page 145 in Carlstrom et al. 2014 (monetary policy shock)
                 
+ important note: During the replication process some minor issues with the equations provided in the paper were spotted. 
                  Correspondence with the authors confirmed that the slight differences were due to typos in the paper. The code which was 
                  provided and confirmed to be correct by the authors was implemented to the MMB. In case further clarification is 
                  needed we kindly ask you to contact the MMB team.  

+ literature:
  - Carlstrom, C. T., Fuerst, T. S., Ortiz, A., & Paustian, M. (2014). Estimating contract 
	indexation in a financial accelerator model. Journal of Economic Dynamics and control, 46, 130-149.

  - Justiniano, A., Primiceri, G. E., & Tambalotti, A. (2011). Investment shocks and the 
	relative price of investment. Review of Economic Dynamics, 14(1), 102-121.

