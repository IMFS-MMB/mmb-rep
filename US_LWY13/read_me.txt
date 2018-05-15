US_LWY13 Replication

+ replicated model corresponds to the New Keynesian model used in Leeper, Walker and Yang (2013) without foresight

+ parameters were imported from the parameterfile param.mat and modelnogrowth.m to be found in '...\MatlabCode_sec3\NKmodel\IdentifiedVAR' in the original code 
  provided on the journal website (8337_data_and_programs_0.zip). 

+ last change: 2018-04-25

+ replication: Unfortunately no impulse response functions were shown in the paper, therefore the original model set up in Matlab was extracted from the model code. 
  Impulse response functions of inflation, annualized nominal interest rate and output to all shocks are generated using the (partly extended) Matlab code from the paper.
  After solving the model using gensys the IRFs were calculated manually for all shocks.The variable 'inflation' was calculated using the solution matrices and is 
  similar to the 'inflation' defined in the MMB: (pi+pi(-1)+pi(-2)+pi(-3)). The interst rate was also scaled up by the factor '4' to obtain annualized values. The
  magnitutde of the fiscal shock was rescaled and aligned with that in the MMB. The magnitude of the monetary policy shock was rescaled and also aligned with that 
  in the MMB. No flexprice equilibrium exists in the model, this was added only in the .mod-file. 
                
+ replicated IRFs: US_LWY13_irf.pdf (inflation target shock)                    

+ file to produce replicated IRFs: run.m (which calls the original Matlab code extracted from the code provided on the journal website). To execute run.m 
  all files necessary are included in the replication package. In case you receive an eror message please try to add the path to dynare which may solve the problem. 
  In addition, if necessary, delete the path to 'mutools' using the 'pathtool' command in Matlab, where 'mutools' is to be found mostly in 
  '.../toolbox/robust/rctobsolete/mutools/commands' and '.../toolbox/robust/rctobsolete/mutools/commands' as this my confuse Matlab.  

+ US_LWY13_rep.mod produces the same IRFs using using dynare. The flexprice model was added to the original code. The steady state values can be calculated also by paper 
  and pencil which was implemented also in the US_LWY13_rep.mod file.
                    
+ literature: Eric M. Leeper, Todd B. Walker and Shu-Chun Susan Yang (2013) "Fiscal Foresight and Information Flows". Econometrica, Vol. 81, No. 3 (May 2013), pp. 1115-1145
  