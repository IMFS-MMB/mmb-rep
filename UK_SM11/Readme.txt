UK_SM11 Replication

last change: 2022-08-15

replication: IRFs to all 12 model shocks (one standard deviation)
eps_a: Productivity Shock
eps_g: Domestic Demand (Fiscal Policy) Shock
eps_po: World Oil Price Shock
eps_yf: World Demand Shock
eps_pmf: World Import Price Shock
eps_rf: Real World Interest Rate Shock
eps_pg: World Gas Price Shock
eps_mu: Price Markup Shock
eps_b: Risk Premium Shock
eps_inv: Investment Technology Shock
eps_w: Wage Markup Shock
eps_i: Monetary Policy Shock

replicated IRFs: UK_SM11_Replicated_IRFs.pdf
original   IRFs: UK_SM11_OG_IRFs.pdf

file to produce replicated IRF:
    - UK_SM11_rep.mod

Literature: Millard, Stephen. 2011. "An estimated DSGE model of energy, costs and inflation in the United Kingdom." Bank of England Working Paper, no. 432 (July).

Findings: In order to replicate the baseline model IRFs of the working paper version of Stephen Millard (2011) in file 'UK_SM11_replicated_IRFs.pdf' we simply removed a typo in the file sent by Stephen Millard. The author presumably copied one of the shock process equations (gas) and forgot to replace a variable (the gas price innovation term). The two equations and their empirical counterpart are (53) and (54), (58) and (59) in the paper, respectively.

