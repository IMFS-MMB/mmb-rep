function [ys,params,check] = Gas_RANK_steadystate(ys,exo,M_,options_)
% function [ys,params,check] = Ramsey_steady_file_steadystate(ys,exo,M_,options_)
% computes the steady state for the Ramsey_steady_file.mod, conditional on
% the instrument value provided
%
% Inputs: 
%   - ys        [vector] vector of initial values for the steady state of
%                   the endogenous variables
%   - exo       [vector] vector of values for the exogenous variables
%   - M_        [structure] Dynare model structure
%   - options   [structure] Dynare options structure
%
% Output: 
%   - ys        [vector] vector of steady state values for the the endogenous variables
%   - params    [vector] vector of parameter values
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impose restrictions on parameters)

% Copyright © 2020 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <https://www.gnu.org/licenses/>.

%global M_ 

% read out parameters to access them with their name
beta=NaN; %make parameter known to Matlab function, prevents crashes due to Matlab function with same name;
          %will be overwritten next
          
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end

% read in instrument values
for ii = 1:size(options_.instruments,1)
  eval([options_.instruments{ii} ' = ys(strmatch(options_.instruments{ii},M_.endo_names,''exact'')) ;']);
end
% initialize indicator
check = 0;


%% Enter model equations here

%% shocks
eps_tfp           = 1;                  
eps_pEf           = 1;
eps_muz           = 1;
eps_R             = 1;


%% interest rates, exchange rates, inflation rates, discounting

if ramsey_yes_para==0
R_nom_ss          = Pistar/cbeta;
R_nom             = R_nom_ss;
end
R_nomf_ss         = R_nom;
R_nom_flex        = R_nom;			

Q                 = 1;
Q_flex            = Q;

LAMBDA_u          = cbeta;          
LAMBDA_u_flex     = LAMBDA_u; 
LAMBDA            = (1-0)*LAMBDA_u; 
LAMBDA_flex       = (1-0)*LAMBDA_u;

Pi_z              = R_nom*cbeta;   % important to use this instead of Pistar, in ramsey it might deviate in ss
Pi_z_flex         = Pi_z;
Pivf_ss           = Pi_z;
Pi_w              = (Pi_z);			
Pi_w_flex         = (Pi_w);		
Pi_exp            = Pi_z;
Pi_exp_flex       = Pi_exp;
Pi_CPI            = Pi_z;
Pi_CPI_lag1       = Pi_CPI; 
Pi_CPI_lag2       = Pi_CPI_lag1;
Pi_CPI_ann        = Pi_CPI^4; 
Pi_CPI_flex       = Pi_CPI     ;
Pi_CPI_lag1_flex  = Pi_CPI_lag1;
Pi_CPI_lag2_flex  = Pi_CPI_lag2;
Pi_CPI_ann_flex   = Pi_CPI_ann ; 
Pi_CES_u          = Pi_z; 
Pi_CES_u_flex     = Pi_z_flex;

zetaz             = 1;
zetaw             = 1;
dispz             = 1;
dispw             = 1;

pX                = 1;       % from EQ 95
pExp              = (pX*(1/Q));
pExp_flex         = pExp;
pC                = 1;
pC_flex           = 1;
pEf               = pEf_ss;
pE                = pEf;
pE_flex           = pE;
pCES_u            = ((1-alppha_uec)*pC^(1-ppsi_ec)     +(alppha_uec)*pE^(1-ppsi_ec)  )^(1/(1-ppsi_ec));
pCES_u_flex       = ((1-alppha_uec)*pC_flex^(1-ppsi_ec)+(alppha_uec)*pE_flex^(1-ppsi_ec))^(1/(1-ppsi_ec));
pCES_c            = ((1-alppha_cec)*pC^(1-ppsi_ec)     +(alppha_cec)*pE^(1-ppsi_ec)  )^(1/(1-ppsi_ec));
pCES_c_flex       = ((1-alppha_cec)*pC_flex^(1-ppsi_ec)+(alppha_cec)*pE_flex^(1-ppsi_ec))^(1/(1-ppsi_ec));
pCPI              = 0*pCES_c      + (1-0)*pCES_u;      
pCPI_flex         = 0*pCES_c_flex + (1-0)*pCES_u_flex;




%% steady state corrections
taumuz_ss         = 1/muz_ss;
taumuw_ss         = 1/muw_ss;

%% final output marginal costs, production
mcz               = 1/muz_ss;
mcz_flex          = mcz;

CES_scale         = (alppha_ez).^(-(alppha_ez))*(1-alppha_ez).^(-(1-alppha_ez));

% z                      = CES_scale* l^alphal * m^(1-alphal)
% z_scaled = z/CES_scale =                 l^alphal * m^(1-alphal)

if CD_yes_para==1
% old
%(pm) = (1-alphal)*(mcz)/((epsm)* (epstaumuz))*((dispz)*(z))/(m);
omegamz_ss = (alppha_ez)/pE; % = m_ss/z_ss
else
% new
%(pm) = (1-alphal)^(1/psi)*(mcz)/((epsm)*(epstaumuz))*((dispz)*(z)/m)^(1/psi);
%pm_ss = (1-alphal)^(1/psi)*(mcz_ss)/((epstaumuz_ss))*(1/omegamz_ss)^(1/psi);
omegamz_ss = 1/((pE*(taumuz_ss/mcz)/((alppha_ez)^(1/ppsi_ez)))^ppsi_ez);     % = m_ss/z_scaled
end

if CD_yes_para==1
% old
% (z)=CES_scale*(l)^alphal*(m)^(1-alphal); 
% z_ss=CES_scale*(N_ss)^alphal*(m_ss)^(1-alphal); 
% 1=CES_scale*(N_ss/z_ss)^alphal*(m_ss/z_ss)^(1-alphal); 
% 1=CES_scale*(N_ss/z_ss)^alphal*(omegamz_ss)^(1-alphal); 
% (omegamz_ss)^(alphal-1)=CES_scale*(omegalz_ss)^alphal; 
% (omegamz_ss)^((alphal-1)/alphal)/(CES_scale^(1/alphal))=omegalz_ss; 
%omegalz_ss         = (1 / ((omegamz_ss)^(1-alphal)))^(1/alphal); % N_ss/z_ss
omegalz_ss         =  (omegamz_ss)^(-(alppha_ez)/(1-alppha_ez))/(CES_scale^(1/(1-alppha_ez))); 

%z_ss  = N_ss/omegalz_ss;
Z      = N_ss/omegalz_ss;
else
% new
%(dispz)*(z)=( alphal^(1/ppsi_ez)*l^((ppsi_ez-1)/ppsi_ez) + (1-alphal)^(1/ppsi_ez)*m^((ppsi_ez-1)/ppsi_ez) )^(ppsi_ez/(ppsi_ez-1)); 
%z_ss                =( alphal^(1/ppsi_ez)*N_ss^((ppsi_ez-1)/ppsi_ez) + (1-alphal)^(1/ppsi_ez)*m_ss^((ppsi_ez-1)/ppsi_ez) )^(ppsi_ez/(ppsi_ez-1)); 
%z_ss^((ppsi_ez-1)/ppsi_ez)=( alphal^(1/ppsi_ez)*N_ss^((ppsi_ez-1)/ppsi_ez) + (1-alphal)^(1/ppsi_ez)*m_ss^((ppsi_ez-1)/ppsi_ez) ); 
%z_ss^((ppsi_ez-1)/ppsi_ez)=  alphal^(1/ppsi_ez)*N_ss^((ppsi_ez-1)/ppsi_ez) + (1-alphal)^(1/ppsi_ez)*m_ss^((ppsi_ez-1)/ppsi_ez) ; 

%z_ss^((ppsi_ez-1)/ppsi_ez)=  alphal^(1/ppsi_ez)*N_ss^((ppsi_ez-1)/ppsi_ez) + (1-alphal)^(1/ppsi_ez)*m_ss^((ppsi_ez-1)/ppsi_ez) ; 

%1=  alphal^(1/ppsi_ez)*(N_ss/z_ss)^((ppsi_ez-1)/ppsi_ez) + (1-alphal)^(1/ppsi_ez)*(m_ss/z_ss)^((ppsi_ez-1)/ppsi_ez) ; 
%1=  alphal^(1/ppsi_ez)*(N_ss/z_ss)^((ppsi_ez-1)/ppsi_ez) + (1-alphal)^(1/ppsi_ez)*(omegamz_ss)^((ppsi_ez-1)/ppsi_ez) ; 
%(1-(1-alphal)^(1/ppsi_ez)*(omegamz_ss)^((ppsi_ez-1)/ppsi_ez))/(alphal^(1/ppsi_ez))=  (N_ss_over_z_ss)^((ppsi_ez-1)/ppsi_ez) ; 

N_ss_over_z_ss = ((1-(alppha_ez)^(1/ppsi_ez)*(omegamz_ss)^((ppsi_ez-1)/ppsi_ez))/((1-alppha_ez)^(1/ppsi_ez)))^(ppsi_ez/(ppsi_ez-1)) ; 
Z              = N_ss/N_ss_over_z_ss;
end

if CD_yes_para==1
w  = (1-alppha_ez)*(mcz/taumuz_ss)*(Z/1)/N_ss;
else
w  = (1-alppha_ez)^(1/ppsi_ez)*(mcz/taumuz_ss)*((Z)/N_ss)^(1/ppsi_ez);
end

Z_flex     = Z;			
w_flex     = w;			

E_z        = omegamz_ss*Z;
E_z_flex   = E_z;

% need to get mcw_ss, use EQ 21
mcw        = w/muw_ss;     % from the wage inflation equation
mcw_flex   = mcw;

X          = omegaxz_ss*Z;
X_flex     = X;
omegacz_ss = 1-omegaxz_ss;
C          = omegacz_ss*Z;
C_flex     = C;			

%%
kappaf_ss  = omegaxz_ss*Z*((1/Q))^epsilonf;

f1w        = (1/w*mcw*N_ss)/(1-phiw*cbeta*(zetaw^(muw_ss/(muw_ss-1))));
f2w        = (N_ss)/(1-phiw*cbeta*(zetaw^(1/(muw_ss-1))));

f1z        = (mcz*Z)/(1-phiz*cbeta*(zetaz^(muz_ss/(muz_ss-1))));
f2z        = (Z)/(1-phiz*cbeta*(zetaz^(1/(muz_ss-1))));

Y_gap      = 1;

vf_ss      = 1;
omegaf_ss  = X/(vf_ss*kappaf_ss*((pExp)/(pEf))^(-epsilonf));  

div_Z      = Z - taumuz_ss*(w*N_ss + pE*E_z);
div_Z_flex = div_Z;

div_F      = div_Z;
div_F_flex = div_F;

t_Z        = (1-taumuz_ss)*(w*N_ss+pE*E_z);
t_Z_flex   = t_Z;

t_F        = t_Z;
t_F_flex   = t_F;

C_c            = C;
C_c_flex       = C;
C_u            = C;
C_u_flex       = C;

CES_u          = C_u/((pC/pCES_u)^(-ppsi_ec)*(1-alppha_uec));
CES_u_flex     = C_u_flex/((pC_flex/pCES_u_flex)^(-ppsi_ec)*(1-alppha_uec));
CES_c          = C_c/((pC/pCES_c)^(-ppsi_ec)*(1-alppha_cec));
CES_c_flex     = C_c_flex/((pC_flex/pCES_c_flex)^(-ppsi_ec)*(1-alppha_cec));

E_h_u          = (pE/pCES_u)^(-ppsi_ec)*(alppha_uec)*CES_u;
E_h_u_flex     = (pE_flex/pCES_u_flex)^(-ppsi_ec)*(alppha_uec)*CES_u_flex;
E_h_c          = (pE/pCES_c)^(-ppsi_ec)*(alppha_cec)*CES_c;
E_h_c_flex     = (pE_flex/pCES_c_flex)^(-ppsi_ec)*(alppha_cec)*CES_c_flex;
E_h            = 0*E_h_c      + (1-0)*E_h_u;
E_h_flex       = 0*E_h_c_flex + (1-0)*E_h_u_flex;

NFA            = pExp/(1/Q)*X-pE*(E_z+E_h); % exports minus imports
%NFA            = pExp*Q*X-pE*(E_z); % exports minus imports

NFA_flex       = NFA;

bf             = -NFA*(1/Q)/(1-R_nomf_ss/(Pi_z*gammah_ss));
%bf             = -NFA/(Q+R_nomf_ss*Q/(Pi_z*gammah_ss));

bf_flex        = bf;

b              = 0;                                        
b_flex         = 0;

lambda_u       = (CES_u )^(-siggma);
lambda_u_flex  = (lambda_u);	
lambda_c       = (CES_c )^(-siggma);
lambda_c_flex  = lambda_c;        

wh             = w; % should be equal to w, thanks to wage subsidy, no labour union mono comp
wh_flex        = wh;

mrs_u          = wh;
mrs_u_flex     = mrs_u;

mrs_c          = wh;
mrs_c_flex     = mrs_c;	
%mrs_c      = mrs_u;  
%mrs_c_flex = mrs_u_flex; 

UN_u_times_chi = -mrs_u*(lambda_u/pCES_u);
UN_c_times_chi = -mrs_c*(lambda_c/pCES_c);


%--------------------------------------------------------------------------
N_c_guess          = 1; 

pr.N_ss            = N_ss;
pr.omega           = omega;
pr.varphi          = varphi;
pr.UN_c_times_chi  = UN_c_times_chi;
pr.UN_u_times_chi  = UN_u_times_chi;

options            = optimset('MaxFunEvals',1e20,'TolFun',1e-12,'TolX',1e-12,'Display','off');
[x1,fval,exitflag] = fsolve(@find_N_c,N_c_guess,options,pr);
if exitflag <= 0; 
disp('fsolve did not solve properly') 
end
N_c = x1(1);
N_u = (N_ss-omega*N_c)/(1-omega);

%--------------------------------------------------------------------------

chi_u      = -UN_u_times_chi/(N_u)^varphi;
chi_c      = -UN_c_times_chi/(N_c)^varphi;

UN_c       = (-chi_c*((dispw)*(N_c))^varphi);                    
UN_u       = (-chi_u*((dispw)*(N_u))^varphi);

UN_u_flex  = UN_u;                                              
UN_c_flex  = UN_c;                                            

N_u_flex   = N_u;
N          = N_ss;				
N_flex     = N;             
N_c_flex   = N_c;      

trans_c    = (pC*C_c+pE*E_h_c-w*N_c); 
trans_u    = -(pC*C_u+pE*E_h_u-w*N_u-((R_nomf_ss*(-bf)*Q)/(Pivf_ss*gammah_ss)-Q*(-bf)+(div_F-t_F))/(1-0));

trans_c_omega   = 0*trans_c;
trans_u_1momega = (1-0)*trans_u;



mrs        = 0*mrs_c + (1-0)*mrs_c; 

div_L      = w*N-taumuw_ss*mrs*N;
div_L_flex = div_L;

t_L        = (1-taumuw_ss)*wh*N_ss;
t_L_flex   = t_L;

C_lag1     = C;
C_u_lag1   = C_u;
C_c_lag1   = C_c;

R_real     = R_nom /Pi_z;

C_gap      = 100*log(C_u/C_c); % consumption _gap
C_gap_flex = C_gap;

%I_gap      = 100*log((w*(dispw)*(N_u)+(div_F-t_F)/(1-omega)-trans_u/(1-omega))/ (w*(dispw)*(N_c) + trans_c/(omega)));
inc_u      = w*(1)*(N_u)+(div_F-t_F)/(1-omega)-trans_u;
inc_c      = w*(1)*(N_c)+trans_c;
I_gap      = inc_u/inc_c;

dlnckp     = 100*log(1);       
dlnhrs     = 100*log(1);    

dlnhrs_u   = 100*(log(1));       
dlnhrs_c   = 100*(log(1));       

dlnehkp    = 100*(log(1));       
dlnehkp_c  = 100*(log(1));       
dlnehkp_u  = 100*(log(1));       
dlnezkp    = 100*(log(1)); 

dlnCESkp_c   = 100*(log(CES_c/CES_c));       
dlnCESkp_u   = 100*(log(CES_u/CES_u));       

dlnzkp     = 100*log(1);       
dlnckp_c   = 100*log(1);       
dlnckp_u   = 100*log(1);       
dlnxkp     = 100*(log(1));   
dlnmkp     = 100*(log(1));   

output_gap = 100*log(1);
dlneer     = 100*(log(1))  ; 
dlnNFA     = 100*(log(1));   


Pi_w_lag1  = (Pi_w) ; 
Pi_w_lag2  = (Pi_w_lag1) ; 
Pi_w_ann   = (Pi_w)*(Pi_w_lag1)*(Pi_w_lag2)*(Pi_w_lag2); 

Pi_z_lag1  = (Pi_z) ; 
Pi_z_lag2  = (Pi_z_lag1) ; 
Pi_z_ann   = (Pi_z)*(Pi_z_lag1)*(Pi_z_lag2)*(Pi_z_lag2); 

Expected_Pi_CES_u  = Pi_CES_u;

Pi_E               = 1;
Expected_Pi_E      = 1;

Pi_E_lag1    = (Pi_E) ; 
Pi_E_lag2    = (Pi_E_lag1) ; 
Pi_E_ann     = (Pi_E)*(Pi_E_lag1)*(Pi_E_lag2)*(Pi_E_lag2); 

pE_over_w  = pE/w;

markup_Z     = 1/mcz;
%markup_W     = 1/(wh-w);

dlnMarkup_Z  = 0;
dlnMarkup_W  = 0; 

dlnw       = 100*(log(w/w));
dlnwh      = 100*(log(wh/wh));

dlnDiv_Z   = 100*(log(div_Z/div_Z)); 

wh_logdev  = 0;
w_logdev   = 0;



C_gap_CES  = 100*(log(CES_u/CES_c));


z_hat         = log(Z/(Z));
n_hat         = log(N/(N));
z_minus_n_hat = 1/ppsi_ez*(z_hat-n_hat);

Pi_w_over_Pi_z = (Pi_w)/(Pi_z); 

markup_Z_effective     = (taumuz_ss*eps_muz)/mcz; % effective markup definition
dlnMarkup_Z_effective  = 100*(log(markup_Z_effective/markup_Z_effective));



% new -------------------------------------








%CES_u_test    = (((1-alppha_uec)^(1/ppsi_ec)*(C_u)^((ppsi_ec-1)/ppsi_ec))
%+((alppha_uec)^(1/ppsi_ec)*(E_h_u)^((ppsi_ec-1)/ppsi_ec)))^(ppsi_ec/(ppsi_ec-1));
%CES_u_flex    = (((1-alppha_uec)^(1/ppsi_ec)*(C_u_flex)^((ppsi_ec-1)/ppsi_ec))
%+((alppha_uec)^(1/ppsi_ec)*(E_h_u_flex)^((ppsi_ec-1)/ppsi_ec)))^(ppsi_ec/(ppsi_ec-1));
%CES_c         = (((1-alppha_cec)^(1/ppsi_ec)*(C_c)^((ppsi_ec-1)/ppsi_ec))
%+((alppha_cec)^(1/ppsi_ec)*(E_h_c)^((ppsi_ec-1)/ppsi_ec)))^(ppsi_ec/(ppsi_ec-1));
%CES_c_flex    = (((1-alppha_cec)^(1/ppsi_ec)*(C_c_flex)^((ppsi_ec-1)/ppsi_ec))
%+((alppha_cec)^(1/ppsi_ec)*(E_h_c_flex)^((ppsi_ec-1)/ppsi_ec)))^(ppsi_ec/(ppsi_ec-1));







%% end own model equations

params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end





function f=find_N_c(xx,pr)
    for i=1:size(xx,2)
        %-------------------------------------------------------------------------------------------        
        N_c  = xx(1,i);
        N_u  = (pr.N_ss-pr.omega*N_c)/(1-pr.omega);

        %chi = -UN_c_times_chi/(N_c_ss)^varphi;
        %chi = -UN_u_times_chi/(N_u_ss)^varphi;
        
        % Residual
%        f(1,i)  = pr.UN_c_times_chi/(N_c)^pr.varphi - pr.UN_u_times_chi/(N_u)^pr.varphi;
         f(1,i)  = N_u - N_c;
        
    end













