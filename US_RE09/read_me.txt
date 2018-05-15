US_RE09 Replication

+ last change: 2018-04-05

+ replication: 	
IRF to a monetary policy shock based Dynare algorithm (truncating lagged expectations, T=16)
IRF to a productivity shock based Dynare algorithm (truncating lagged expectations, T=16)
IRF to a aggregate demand shock based Dynare algorithm (truncating lagged expectations, T=16)
IRF to a goods markup shock based Dynare algorithm (truncating lagged expectations, T=16)
IRF to a wage markup shock based Dynare algorithm (truncating lagged expectations, T=16)
IRF to a monetary policy shock from Reis (2009)
IRF to a productivity shock from Reis (2009)
IRF to a aggregate demand shock from Reis (2009)
IRF to a goods markup shock from Reis (2009)
IRF to a wage markup shock from Reis (2009)

+ Note: IRFs are based on posterior estimates of Reis (2009)

+ Note: to change the truncation value T for the IRFs in the Dynare code, one needs to adjust the code in the replication file RRSIGE. mod in line 15 and 51 or in the MMB replication file US_RSI09.mod in line 22 and line 81. It needs to be considered that increasing the truncation value further than 16 is related to a substantial increase in computing time.

+ file to plot the IRFs of Dynare compared to Reis (2009): difference SIGE.m (plots the exact IRFs of the Reis (2009) paper in comparison to the truncated IRFs)

+ replication file: RRSIGE.mod (from Verona and Wolters (2014)) and US_RSI09.mod (MMB replication file)

+ Note: there appears to be a typo either in Reis (2009) paper or the code of Verona and Wolters (2014), the standard deviation for elasticities of substitution (goods and labor) are 10 times higher in the code of Verona and Wolters (2014). However, changing the value to the one stated by Reis (2009) leads to a substantial differences between the IRFs even with high truncation values

+ software requirements: Dynare version 4

+ literature: 	
Reis, R. (2009): Optimal Monetary Policy in an Estimated Sticky-Information Model, American Economic Journal: Macroeconomics 1:2, 1-28
Verona, F. and M. H. Wolters (2014): Sticky Information Models in Dynare, Computational Economics 43, 357-370. 





