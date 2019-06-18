EA_VI16

+ replicated model corresponds to the model with financial friction as in Gertler/Karadi, estimated on European Data

+ last change: 2019-05-10

+ notes on replication: 
    - this package contains the original .mod-file was provided by the author as well as an adjusted version that eliminates two timing-errors
       - Eq 18b is shifted on period forward to guarantee determinacy. In the original code only the 
         right hand side of the equation has been shifted one period forward. 
       - In eq 19, capital is forward looking in the original code [k(+1)]. I change this to a static variable [k] 
         to make the notation consistent with the rest of the code 
       - the dynamics of the original model and the model with adjustments differ only slightly

+ the original IRFs and IRFs of the adjusted model are replicated for the monetary policy shock. 
                    
+ literature: Stefania Villa (2016). Financial frictions in the Euro Area and the United States: a Bayesian assessment
              Macroeconomic Dynamics, 20 (05), p. 1313-1340
