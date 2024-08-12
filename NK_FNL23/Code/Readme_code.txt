Replication of: "Toward a Green Economy: The Role of Central Bank's Asset Purchases"
By Alessandro Ferrari and Valerio Nispi Landi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FIGURES 1 and 2 (transition and GQE)
A)
- In gqe_trans.mod set:

@#define ela =  0
@#define gqe =  0
BOND=0;
- In console_ss.m
TRANS=1;

- In console_ss_clean.m:

T=120;        
G=301;
GQE=1.5; 
FAST=0;
QE=0;         
      DUR=T;         
INCR=0;               
PATH=0;
mu=1;      

- Run console_ss.m
  

B) Changes with respect to A:
- In gqe_trans set.mod:

@#define gqe =  1

- In console_ss_clean.m:
      
INCR=1;       
PATH=1;      

- Run console_ss_clean.m             

C) Changes with respect to B

- In console_ss_clean.m:

DUR=2;         
PATH=2;      

- Run console_ss_clean.m    

D) Changes with respect to C


- In console_ss_clean.m:

DUR=T;   
INCR=0;       
PATH=3;      

- Run console_ss_clean.m    

E) 
In plotting.m:

SAVE=1; % (If you want to save the IRF) 
SIZE=0;
PRES=0;

- Run plotting.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FIGURE 3 (bond functions)

A)

- In console_ss.m
TRANS=1;

- In gqe_trans set.mod:

@#define ela =  0
@#define gqe =  1
BOND=1;

- In console_ss_clean.m:

FAST=0;
QE=0;
T=120;        
G=301;         
GQE=1.5;       
DUR=T;         
INCR=1;                
PATH=6;      
mu=1;

- Run console_ss.m

- Run bond_functions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FIGURE 4 (different size)

A)
- In gqe_trans set.mod:

@#define ela =  0
@#define gqe =  0
BOND=0;

- In console_ss.m
TRANS=1;

- In console_ss_clean.m:

FAST=0;
QE=0;
T=120;        
G=301;         
GQE=1.5;       
DUR=T;         
INCR=0;                
PATH=0;      
mu=1;

- Run console_ss.m


B) Changes with respect to A:

- In gqe_trans set.mod:

@#define gqe =  1

- In console_ss_clean.m:
PATH=3; 

- Run console_ss_clean.m


C) Changes with respect to B:

- In console_ss_clean.m:
GQE=1.25;  
PATH=1; 

- Run console_ss_clean.m

D) Changes with respect to C:

- In console_ss_clean.m:
GQE=1.75;  
PATH=2; 

- Run console_ss_clean.m

E) In plotting.m

SAVE=1; % (If you want to save the IRF) 
SIZE=1;
PRES=0;

- Run plotting.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FIGURE 5 (credit easing)

A)
- In gqe_trans set.mod:

@#define ela =  0
@#define gqe =  0
BOND=0;

- In console_ss.m
TRANS=1;

bCG_Y=0.2052*184.505/(4*gdpEUR);
bCB_Y=(1-0.2052)*184.505/(4*gdpEUR);
instead of:

bCG_Y=0;
bCB_Y=0;

- In console_ss_clean.m:

FAST=0;
QE=0;
T=120;        
G=301;         
GQE=1.5;       
DUR=T;         
INCR=0;                
PATH=0;      
mu=1;

- Run console_ss.m


B) Changes with respect to A:

- In gqe_trans set.mod:

@#define gqe =  1

- In console_ss_clean.m:
QE=2;
PATH=1; 

- Run console_ss_clean.m


C) In plotting_qe.m

SAVE=1; % (If you want to save the IRF) 
CQE=1;

- Run plotting_qe.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FIGURE A1 (IRF TFP Shocks)
A)
- In console_ss.m set:
 TRANS=0;

- In gqe_stoch.mod set:

@#define ela =  0
tfp_stand=0.01;  
mon_stand=0.00;

- In plotting_irf.m set:

shock='va';

- Run plotting_irf.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FIGURE A2 (IRF monetary shocks)
A)
- In console_ss.m set:
 TRANS=0;

- In gqe_stoch.mod set:

@#define ela =  0
tfp_stand=0.00;  
mon_stand=0.0025;

- In plotting_irf.m set:

shock='vm';

- Run plotting_irf.m 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FIGURE A3 (market neutral qe)

A)
- In gqe_trans set.mod:

@#define ela =  0
@#define gqe =  0
BOND=0;

- In console_ss.m
TRANS=1;

- In console_ss_clean.m:

FAST=0;
QE=0;
T=120;        
G=301;         
GQE=1.5;       
DUR=T;         
INCR=0;                
PATH=0;      
mu=1;

- Run console_ss.m


B) Changes with respect to A:

- In gqe_trans set.mod:

@#define gqe =  1

- In console_ss_clean.m:
DUR=2;
INCR=1;
PATH=1; 

- Run console_ss_clean.m


C) Changes with respect to B:

- In console_ss_clean.m:
QE=1;
PATH=2; 

- Run console_ss_clean.m

D) In plotting_qe.m

SAVE=1; % (If you want to save the IRF) 
CQE=0;

- Run plotting_qe.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FIGURE A4 (no fiscal policy)

A)
- In gqe_trans set.mod:

@#define ela =  0
@#define gqe =  0

- In console_ss_clean.m:
T=120;        
G=301;         
GQE=1.5;       
DUR=T;         
INCR=0;               
PATH=0;      
mu=1;

- Run console_ss.m


B) Changes with respect to A:

- In gqe_trans set.mod:

@#define gqe =  1

- In console_ss_clean.m:

DUR=2;      
INCR=1;       
PATH=2;      
 
- Run console_ss_clean.m

C) Changes with respect to B:


- In console_ss_clean.m:

PATH=3; 
mu=0;      
 
- Run console_ss_clean.m

D)

- Run plotting_only.m


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FIGURA A5 (Change zeta and csi)

A) 

-In gqe_trans.mod:

@#define gqe =  0

-In console_ss_clean.m
FAST=0;
BOND=0;
QE=0;
T=120;        
G=301;         
GQE=1.5;       
DUR=2;         
INCR=1;               
PATH=0;      
mu=1;



- Run console_ss.m

B) 
-In gqe_trans.mod:

@#define gqe =  1

- In console_ss_clean.m

PATH=1;

- Run console_ss_clean

C) 
- In console_ss set :

zeta=0.35;
csi=0.5;

- In console_ss_clean

 PATH=5;      

-In gqe_trans.mod:

@#define gqe =  0

- Run console_ss 

D) 
- In console_ss_clean

PATH=2;   

-In gqe_trans.mod:

@#define gqe =  1   

- Run console_ss_clean

E)
Run plotting_weight

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FIGURE A6 (change bond parameter)

- Repeat exactly the steps for Fig 1 and 2, but with:
gammaG=-2.5

and with
kappaG=1;
kappaB=1;

commenting

% kappaB=rB/(vB*(rB-theta/betta));
% kappaG=rG/(vG*(theta/betta-rG));

- Run plotting_ela

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TABLE 2: Data vs Model
A)

- Run compute_stat to save the business cycle statistics in the euro area (using the file eadata_cp)

- In console_ss.m set:
TRANS=0;

- In gqe_stoch.mod set:

@#define ela =  0
tfp_stand=0.017;  
mon_stand=0.00;

- Run plotting_irf.m 

- Open SS, which replicates Table 2