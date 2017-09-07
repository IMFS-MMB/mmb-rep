Replication of CA_BMZ12

+replicaton: 	IRF to a financial shock
		IRF to a technology shock
	both with a smoothing Taylor rule.

+policy regimes: The policy regime can be changed	    by changing certain parameters in the model file:
	Standard Taylor:r_c=0, rhotau=0
	Augmented Taylor:r_c=0.5, rhotau=0
	Macroprudential Taylor:r_c=0, rhotau=0.5
	Macroprudential Augmented Taylor:r_c=0.5, 						rhotau=0.5

+reference: 	The reference graphs are the 
		figures 3 and 4 at page 30 of 
		Bailliu, Meh, Zhang (2012)				"Macroprudential Rules and Monetary 
		Policy when Financial Frictions				Matter"	-Bank of Canada Working Paper			2012-6

+ file to produce IRFs: run.m 
	(which calls Bailliu_orig_rep.mod in the 		folder Bailliu_orig_rep)

+Findings:

financial shock: Match is good. Nominal credit growth is a little too high under standard Taylor, capital a little too low under Macroprudential Taylor and Macroprudential Augmented Taylor.

TFP shock: Match is good with constraints.
Under standard Taylor, net worth is too high and credit growth is far too high peaking at ~8.9*10^{-4} instead of ~5*10^{-4}.
Under Macroprudential Taylor, the policy rate drops a little too low, nominal credit growth is a little too high.
Under Augmented Taylor, nominal credit growth is too high, the policy rate drops too low.
Augmented Macro Taylor: policy drop is too low, risk is premium too high.