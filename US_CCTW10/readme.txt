

This Readme-File explains how to run the Matlab Code in the zip-file "Code_CCTW_2010_JEDC" 
to replicate figure 2, 3, 4 and 6 of the paper J.F. Cogan, T. Cwik, J.B. Taylor and 
V. Wieland (2010),"New Keynesian versus old Keynesian government spending multipliers",
Journal of Economic Dynamics & Control 34, 281-295.

How to run the code:
====================

1) Download Dynare Version 4 from the Dynare website: http://www.dynare.org/ 
   (the Simulations in the paper were carried out with Dynare 4.04 and Matlab R2008b).
2) Unzip the zip-file "Code_CCTW_2010_JEDC" in a folder you choose.
3) Start Matlab and change the current directory to the folder "Code_CCTW_2010_JEDC". 
4) Link in Matlab the Dynare folder in the Matlab menu under file/Set Path.
5) Open the start_CCTW.m file in Matlab and run it. 

Content of the zip-file:
========================

start_CCTW.m: Runs Dynare to start the deterministic simulation and generates 
figures 2, 3, 4 and 6 of the paper.

SW_US_fiscal2002.mod: Dynare model file:
The equations and parameter values correspond to the estimated model of the 
U.S. economy in Smets, Frank and Raf Wouters, 2007, 
 "Shocks and Frictions in US Business Cycles: A Bayesian DSGE-Approach", 
American Economic Review, June 2007, 97(3), 586-606, 
except for the specification of monetary and fiscal policies. 

SW_US_fiscal.mod: Dynare model file:
The equations and parameters are the same as in the file described above with the exception 
of the monetary policy rule, which contains an endogenous Zero Lower Bound.

SW_US_fiscal_LC.mod: Dynare model file:
The equations and parameter values correspond to the augmented model with liquidity constrained households
described and estimated in the paper J.F. Cogan, T. Cwik, J.B. Taylor and 
V. Wieland (2010),"New Keynesian versus old Keynesian government spending multipliers",
Journal of Economic Dynamics & Control 34, 281-295.



Monetary policy: 
----------------

(1) we replace the estimated reaction function in Smets and Wouters (2007) with 
the rule proposed in Taylor, John B. "“Discretion Versus Policy Rules in Practice,” 
Carnegie-Rochester Series on Public Policy, North-Holland, 39, 1993, pp. 195-214.  

(2) we allow for the possibility to simulate the anticipation of a constant interest 
rate for a pre-specified time period.  This is accomplished by introducing a nonlinear 
switching process between a constant interest rate level and the level implied by the 
rule. The switch is triggered by a future shock.  Using the stacked Fair-Taylor extended
path method implemented in Dynare ("deterministic" simulation) the switch is simulated as 
anticipated, that is the shock triggering the switch in time t is known at time zero. 

(3) In the file SW_US_fiscal.mod we replace the monetary policy rule by a rule with endogenous 
Zero Lower Bound for the simulations out of the recession starting in 2009Q1. After liftoff the 
interest rate follows the original Smets and Wouters monetary policy rule. 



Fiscal policy: 
--------------

We replace the estimated AR(1) process for government spending with alternative specifications. 
In particular, we specify the path of future government spending implied by the American Recovery
and Reinvestment Act 2009 (see Table 3 in the paper). This path is then anticipated. 
It implies a second nonlinearity that requires application of the stacked Fair-Taylor extended
path method. 

 