% computes the steady state of BankCapital.mod. 
% Taken from an example file by S. Adjemian on Dynare Forum
% January 2011, Kevin Moran

function [ys,check] = BankCapital_steadystate(ys,exe)
global M_

%% DO NOT CHANGE THIS PART.
%%
%% Here we load the values of the deep parameters in a loop.
%%
NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for i = 1:NumberOfParameters                                  % Loop...
  paramname = deblank(M_.param_names(i,:));                   %    Get the name of parameter i. 
  eval([ paramname ' = M_.params(' int2str(i) ');']);         %    Get the value of parameter i.
end                                                           % End of the loop.  
check = 0;
%%
%% END OF THE FIRST MODEL INDEPENDENT BLOCK.


%% THIS BLOCK IS MODEL SPECIFIC.
%%
%% Here the user has to define the steady state.
%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% steady-state computations:

infl_ss = pi_ss;

Rd_ss = pi_ss/bet;

kk1 = delta*theta_k/(alphag*bigR*(1/bet-1+delta)); 
betatemp  = 1/bet;

q_ss = kk1*(alphag*tau_b*mu_ss*betatemp/delalpha-(1+mu_ss+alphag*mu_ss/(Rd_ss*delalpha)));
q_ss = q_ss/(alphag*smallb*kk1/(Rd_ss*delalpha)-alphag*bigR*kk1/Rd_ss-theta_e-theta_b-bby-alphag*tau_e*smallb*kk1*betatemp/delalpha);

G_ss = 1+mu_ss-(q_ss*alphag/Rd_ss)*(bigR-mu_ss/(q_ss*delalpha)-smallb/delalpha);
   
IY = kk1/q_ss;

KY = alphag*bigR*IY/delta; 

KeY = tau_e*alphag*smallb*IY/delalpha;
    
KbY = tau_b*alphag*mu_ss*IY/(q_ss*delalpha);

KhY = KY - KeY - KbY;

CeY = (1-tau_e)*alphag*smallb*IY*q_ss/delalpha;

CbY = nu*(1-tau_b)*alphag*mu_ss*IY/delalpha;

ChY = 1 + bby - CeY - CbY  - (1+mu_ss)*IY;

essai = (1-bet*habit)*theta_h/((1-habit)*ChY*psi_l*mark_w);

smallh = essai^(1/(1+elas_l));

H_ss = smallh*eta_h^(xi_w/(xi_w-1));

kk2 = (KY^(1/(1-theta_k))) * (eta_e^(theta_e/(1-theta_k)))* (eta_b^(theta_b/(1-theta_k)))* mark_p^(1/(theta_k-1));

K_ss = H_ss^(theta_h/(1-theta_k))* kk2;

Y_ss = (1/mark_p)* (K_ss^theta_k)*(H_ss^theta_h)*(eta_e^theta_e)*(eta_b^theta_b);

I_ss = IY*Y_ss;

rk_ss = (1/mark_p)*theta_k*(K_ss^(theta_k-1))*(H_ss^theta_h)*(eta_e^theta_e)*(eta_b^theta_b);

wh_ss = (1/mark_p)*theta_h*(K_ss^theta_k)*(H_ss^(theta_h-1))*(eta_e^theta_e)*(eta_b^theta_b);
                                 
we_ss = (1/mark_p)*theta_e*(K_ss^theta_k)*(H_ss^theta_h)*(eta_e^(theta_e-1))*(eta_b^theta_b);

wb_ss = (1/mark_p)*theta_b*(K_ss^theta_k)*(H_ss^theta_h)*(eta_e^theta_e)*(eta_b^(theta_b-1));

Ke_ss = KeY*Y_ss;

Kb_ss = KbY*Y_ss;

Kh_ss = KhY*Y_ss;

Ce_ss = CeY*Y_ss;

Cb_ss = CbY*Y_ss;

ch_ss = ChY*Y_ss/eta_h;

bigA_ss = eta_b*wb_ss+(rk_ss+q_ss*(1-delta))*Kb_ss+bby*Y_ss;
			
bigN_ss = eta_e*we_ss+(rk_ss+q_ss*(1-delta))*Ke_ss;

totC_ss = Ce_ss+Cb_ss+eta_h*ch_ss;

lam_ss = (1-bet*habit)/((1-habit)*(ch_ss));

smalld_ss = alphag*q_ss*( bigR - smallb/delalpha - mu_ss/(q_ss*delalpha))*I_ss/(Rd_ss*eta_b);
   
p_ss = (Rd_ss-1)*lam_ss/ ( (Rd_ss-1)*lam_ss*eta_b*smalld_ss + eta_h*reta);

mc_ss = reta*p_ss/((Rd_ss-1)*lam_ss);

Ra_ss = alphag*q_ss*(mu_ss/(q_ss*delalpha))*I_ss/bigA_ss;

TL_ss = I_ss-bigN_ss;

CA_ss = bigA_ss/((1+mu_ss)*I_ss-bigN_ss);

numw_ss =  ( ( (wh_ss*infl_ss)^(xi_w*(1+elas_l)) * H_ss^(1+elas_l) )/(1-bet*phi_w) )^(1/(1+elas_l*xi_w));

denw_ss = ( (wh_ss^(xi_w)*infl_ss^(xi_w-1)*H_ss*lam_ss)/(1-bet*phi_w) )^(1/(1+elas_l*xi_w));

wtilde_ss = (mark_w*psi_l)^(1/(1+xi_w*elas_l))*numw_ss/denw_ss;

s_ss = 1/mark_p;

mgrowth_ss = infl_ss;

expinfl_ss = infl_ss;

gY_ss = 1;

u_ss = 1;

% Now ready to assign these "*_ss values to all variables
s = s_ss; 
u = u_ss;
infl = infl_ss;
expinfl = expinfl_ss;
mgrowth = mgrowth_ss;
gY = gY_ss;
Rd = Rd_ss; 
q = q_ss;
G = G_ss;
H = H_ss;
K = K_ss;
Y = Y_ss;
I = I_ss;          
rk = rk_ss;
w_h = wh_ss;
w_e = we_ss;
w_b = wb_ss;
Ke = Ke_ss;
Kb = Kb_ss;
Ce = Ce_ss;
Cb = Cb_ss;
ch = ch_ss;
totC = totC_ss;
lam = lam_ss;
bigA = bigA_ss;			
bigN = bigN_ss;
smalld = smalld_ss;   
p = p_ss;
mc = mc_ss;
Ra = Ra_ss;
TL = TL_ss; 
numw = numw_ss;
denw = denw_ss;
wtilde = wtilde_ss;
nump = (lam_ss * Y_ss * s_ss * infl_ss^xi_p)/(1-bet*phi_p);
denp = (lam_ss * Y_ss * infl_ss^(xi_p-1))/(1-bet*phi_p);
ptilde = xi_p * nump/ ((xi_p - 1) * denp );
lz = 0.0;
lmp = 0.0;
lbk = 0.0;
keff = K_ss;
CA = CA_ss;
log_y = log(Y);
log_I = log(I);



%%
%% END OF THE MODEL SPECIFIC BLOCK.


%% DO NOT CHANGE THIS PART.
%%
%% Here we define the steady state values of the endogenous variables of
%% the model.
%%
NumberOfEndogenousVariables = M_.endo_nbr;                    % Number of endogenous variables.
ys = zeros(NumberOfEndogenousVariables,1);                    % Initialization of ys (steady state).
for i = 1:NumberOfEndogenousVariables                         % Loop...
  varname = deblank(M_.endo_names(i,:));                      %    Get the name of endogenous variable i.                     
  eval(['ys(' int2str(i) ') = ' varname ';']);                %    Get the steady state value of this variable.
end                                                           % End of the loop.
%%
%% END OF THE SECOND MODEL INDEPENDENT BLOCK.