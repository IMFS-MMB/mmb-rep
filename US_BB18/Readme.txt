Model: US_BB18
Last change: 2022-08-01

Replication of IRFs: The code produces IRFs to all 13 shocks in the model (one standard deviation).
     vzm : Productivity shock to goods
     vzc : Preference shock to consumption
     vzo : Oil productivity shock
     vzoil : ROW oil supply shock
     vzrowgdp : Shock to ROW economic activity
     vznetexpf : Shock to net exports of final good
     vmk : Price markup shock
     vR : Monetary Policy Shock
     vzprow : Real exchange rate shock
     vzI : Productivity shock to investment
     vzrisk : US risk shock
     vzdoil : Oil demand shock
     vpifstar : Shock to inflation target

Original IRFs: See file Original IRFs.pdf. The paper only includes IRFs for the oil productivity shock (vzo), the ROW oil supply shock (vzoil), and a ROW demand shock (vzdoil) on pages 366-367 in the paper.

Replicated IRFs: See file Replicated IRFs.pdf.

Literature: Balke, N.S. and Brown, S.P., 2018. Oil supply shocks and the US economy: An estimated DSGE model. Energy policy, 116, pp.357-372.

Findings: The IRFs are shown for the oil price (poout), GDP (yfout), hours (lout), ROW oil production (worldoil), US oil production (usoilprod), and oil imports (importo). 
The Matlab figures including IRFs for all other variables in response to the three shocks are figures 14, 22, and 13 respectively. 
The mod file computes a separate measure for oil imports (oilimports) which was included in the original codes producing the IRFs but the direction and magnitude of the IRFs did not match what is shown in the paper.
After replacing the variable oilimports with the variable importo also used in the mod file, the oil import IRFs match the direction of the IRFs in the paper with the exception of the oil productivity shock and only show small deviations in the magnitude for the other shocks.





