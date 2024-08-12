function set_params_08_22

global M_

% original version sent by Nikolai
% NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
% for i = 1:NumberOfParameters                                  % Loop...
%   paramname = deblank(M_.param_names(i,:));                   %    Get the name of parameter i. 
%   eval([ paramname ' = M_.params(' int2str(i) ');']);         %    Get the value of parameter i.
% end  

% modification so that paramname is a char entering eval function
NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for i = 1:NumberOfParameters                                  % Loop...
  paramname = char(deblank(M_.param_names(i,:)));                   %    Get the name of parameter i. 
  eval([ paramname ' = M_.params(' int2str(i) ');']);         %    Get the value of parameter i.
end  
  
% Share of RoT households
mu_a = 0.329650;
mu_b = 0.530031;

% Distribution parameter for transfers
mu_bar_a = 0.501024;
mu_bar_b = 0.345449;

% Value-added Tax
tau_a = 0; 
tau_b = 0; 

% Labor Tax
tauw_a = 0.3039;
tauw_b = 0.2765;

% Social Security Contribution (employer)
tausc_a = 0.1667;
tausc_b = 0.2459;

% Capital Tax
tauk_a = 0.2143;
tauk_b = 0.3158;

% Consumption Tax
tauc_a = 0.1831;
tauc_b = 0.1960;

% discount factor
i_a_ts    = 0.025/4;
i_b_ts    = 0.025/4;

% Steady State Inflation (the same across countries)
pi_ts=1.00475;

% depreciation rate
delta_a   = 0.015;
delta_b   = 0.015;

% consumption elasticity
sigma_a   = 1;
sigma_b   = 1;

% habit formation
hab_a     = 0.523583;
hab_b     = 0.760915;

% Measures how valuable gov spending is for consumer (actually 1-alpha_G_a)
% for nu_G=1 (at the prior mode) and the requirement that marginal utility of consumption is
% the same for private and public consumption, it must be that  
% alpha_G_a = 1/(G_a_ts/c_o_a_ts+1).  
alpha_G_a = 1; 
alpha_G_b = 1; 

% Elasticity of substitution b/w priv and gov consumption
nu_G_a = 1;
nu_G_b = 1;

% inverse Frisch elasticity (correct only in a labor market without UB)
psi_a     = 10;%3;
psi_b     = 9;%3;

% scaling parameter to create slugish adjustment of labor force (in kappa_w_a)
psi_l_a     = 0;
psi_l_b     = 0;

% capital share
rho_a   =   0.33;
rho_b   =   0.33;

% importance of public capital and employment for private production
% Pappa (2009) assumes  a range of 0-0.25 for eta_nG
% and a range of 0-0.4  for eta_kG (Leeper  et al. (2009) assume 0.05 or 0.1)
eta_kG_a   =   0.1;%0.067471; 
eta_kG_b   =   0.1;%0.094292;

eta_nG_a   =   0.1;%0.077638; 
eta_nG_b   =   0.1;%0.090713;

% investment adjustment cost
upsilon_a  = 4.942077;
upsilon_b  = 4.949941;

% Price elasticity
theta_a =   4;
theta_b =   4;

% Calvo prices
%gamma_a   = 0.8;
%gamma_b   = 0.8;

% price adjustment cost
upsilon_p_a  = 68.392814;
upsilon_p_b  = 94.417153;

% wage adjustment cost
upsilon_w_a  = 88.739615;
upsilon_w_b  = 87.047266;

% employment adjustment cost
upsilon_n_a  = 0;%32.415154933;%100;
upsilon_n_b  = 0;%36.145705201;%100;

% replacement ratio
rrs_a  = 0.3511;%0;
rrs_b  = 0.3511;%0;

% Labor force
l_a_ts = 0.4717;
l_b_ts = 0.4013;

% Unemployment rate
ur_a_ts = 0.0818;
ur_b_ts = 0.0946;

% Share of public employment of total employment
gn_a = 0.1278;
gn_b = 0.1848;

% Public markup over private wages
mg_a = 0.03;
mg_b = 0.03;

% Public consumption as share of GDP
gc_a = 0.1112;
gc_b = 0.1006;
gc_c = 0.1059;

% Public transfers as share of GDP (including unemployment benefits)
gTR_a = 0.1900;
gTR_b = 0.1825;

% Public investment as share of GDP
gin_a = 0.0165;
gin_b = 0.0277;
gin_c = 0.0221;

% Consumption and investment share for RoW
c_c = 0.6; %Only used if net exports = 0
in_c = 0.2;


% Normalization of public good
yG_a_ts = 1;
yG_b_ts = 1;

% Targeting of one bond position
B_ba_ts  = 0;

% price indexation
xip_a = 0.408574;
xip_b = 0.478292;

% wage indexation
xiw_a=0.449473;
xiw_b=0.320079;

% international risk premium parameter
phi   = 0.01;

% Trend growth of real variables
gamma_a = 0.003163327;
gamma_b = 0.001341793;


% trade openess (targeted with data on openness in set_params)
vtheta_ab   = 0.95;
vtheta_ba   = vtheta_ab;
vtheta_ac   = .15;
vtheta_ca   = vtheta_ac;
vtheta_bc   = .15;
vtheta_cb   = vtheta_bc;

% population Size (A and B)
pop_a     = 1; % normalization, always to be 1
pop_b     = 2.6; % based on population average from Excel data sheet
pop_c     = 56; %based on population figures from wikipedia only for RoW countries 

GDP_a_ts = 1; %normalization
GDP_b_ts = 0.871*GDP_a_ts; %Based on GDP per Head in RoE

% share of goods from i used in country A
n_ab     = vtheta_ab*pop_b/(pop_a + pop_b + pop_c);
n_ac     = vtheta_ac*pop_c/(pop_a + pop_b + pop_c);
n_aa     = 1-(n_ab+n_ac);

% share of goods from i used in country B
n_ba     = vtheta_ba*pop_a/(pop_a + pop_b + pop_c);
n_bb     = 1-(vtheta_ba*pop_a + vtheta_bc*pop_c)/(pop_a + pop_b + pop_c);
n_bc     = vtheta_bc*(pop_c)/(pop_a + pop_b + pop_c);

% share of goods from i used in country C
n_ca     = vtheta_ca*pop_a/(pop_a + pop_b + pop_c);
n_cb     = vtheta_cb*(pop_b)/(pop_a + pop_b + pop_c);
n_cc     = 1- (vtheta_ca*pop_a + vtheta_cb*pop_b)/(pop_a + pop_b + pop_c);

% elasticity between home and foreign traded goods
eta_a      = 1.259020;
eta_b      = 1.038337;
eta_c      = 0.821543;

% AR coefficient Technology
rho_a_a    = 0.887733;
rho_a_b    = 0.955646;


% AR coefficient price markup
rho_etheta_a    = 0.530973;
rho_etheta_b    = 0.395500;

% AR coefficient wage markup
rho_ethetaw_a    = 0.718964;
rho_ethetaw_b    = 0.686266;

% AR coefficient Preference
rho_eb_a   = 0.740270;
rho_eb_b   = 0.769954;

% AR coefficient Labor Supply
rho_en_a   = 0.980488;
rho_en_b   = 0.953652;

% AR coefficient Investment
rho_ein_a  = 0.703072;
rho_ein_b  = 0.697369;

% AR coefficient Risk premium
rho_erp_a  = 0.745050;
rho_erp_b  = 0.493648;

% AR coefficient country specific demand (RoW)
rho_eRoW_a  = 0.911062;
rho_eRoW_b  = 0.897517;

% AR coefficient country specific demand (RoE)
rho_eRoE_a  = 0.924960;
rho_eRoE_b  = 0.958970;

% AR coefficient (rho) and debt feedback (xi) of value-added tax
rho_etau_a = 0;
rho_etau_b = 0;

xi_b_etau_a = 0*0.05;
xi_b_etau_b = 0*0.05;

% AR coefficient labor tax
rho_etauw_a = 0.796744;
rho_etauw_b = 0.923336;

xi_b_etauw_a = 0.05;%-0.011991;
xi_b_etauw_b = 0.05;%0.000279;

xi_y_etauw_a = 0;%0.068317;
xi_y_etauw_b = 0;%-0.006743;

psi_tauw_a = 1;%0.603490;
psi_tauw_b = 1;%0.761335;

% AR coefficient social security
rho_etausc_a = 0.927246;
rho_etausc_b = 0.872372;

xi_b_etausc_a = 0;%-0.008189;
xi_b_etausc_b = 0;%-0.000770;

xi_y_etausc_a = 0;%-0.012899;
xi_y_etausc_b = 0;%-0.004052;

psi_tausc_a = 1;%0.685352;
psi_tausc_b = 1;%0.748207;

% AR coefficient capital tax
rho_etauk_a = 0;%0.9644750430;
rho_etauk_b = 0;%0.9276792358;

xi_b_etauk_a = 0;%0.0943877166;
xi_b_etauk_b = 0;%0.0022430056;

xi_y_etauk_a = 0;%0.0744473101;
xi_y_etauk_b = 0;%0.0073913533;

psi_tauk_a = 1;
psi_tauk_b = 1;

% AR coefficient consumption tax
rho_etauc_a = 0.931902;
rho_etauc_b = 0.926762;

xi_b_etauc_a = 0;%0.0193504244;
xi_b_etauc_b = 0;%0.0082891896;

xi_y_etauc_a = 0;%.0119519215;
xi_y_etauc_b = 0;%-0.0000229126;

psi_tauc_a = 1;%0.562266;
psi_tauc_b = 1;%0.661305;

% AR coefficient Public Investment
rho_einG_a  = 0.535288;
rho_einG_b  = 0.960265;

xi_b_ein_a = 0;%1.152129;
xi_b_ein_b = 0;%-0.012979;

xi_y_ein_a = 0;%-0.320000;
xi_y_ein_b = 0;%0.197920;

psi_inG_a = 1;%0.759580;
psi_inG_b = 1;%0.791275;

% AR coefficient Public Employment
rho_enG_a  = 0.964139;
rho_enG_b  = 0.990828;

xi_b_enG_a = 0;%0.0002951085;
xi_b_enG_b = 0;%0.0023334175;

xi_y_enG_a = 0;%-0.0047123440;
xi_y_enG_b = 0;%-0.0014557560;

psi_nG_a = 1;%0.519779;
psi_nG_b = 1;%0.660448;

% AR coefficient of Public Employment Shock
rho_epsilon_enG_a  = 0.75;
rho_epsilon_enG_b  = 0.75;

% AR coefficient Gov. Spending
rho_eg_a = 0.873103;
rho_eg_b = 0.902612;

xi_b_eg_a = 0;%-0.014500;
xi_b_eg_b = 0;%0.132199;

xi_y_eg_a = 0;%0.057573;
xi_y_eg_b = 0;%-0.165407;

psi_cG_a = 1;%0.806836;
psi_cG_b = 1;%0.839313;

% AR coefficient transfers
rho_eTR_a = 0.957005;
rho_eTR_b = 0.852427;

xi_b_eTR_a = 0;%0.095329;
xi_b_eTR_b = 0;%0.094644;

xi_y_eTR_a = 0;%-0.068077;
xi_y_eTR_b = 0;%-0.235329;

psi_TR_a = 1;%0.745043;
psi_TR_b = 1;%0.752983;

% AR coefficient lump sum taxes (optimizers only)
rho_eT_a = 0.9;
rho_eT_b = 0.9;

xi_b_eT_a = 0;%0.408186;
xi_b_eT_b = 0;%-0.038100;

xi_y_eT_a = 0;%0.480368;
xi_y_eT_b = 0;%-0.185535;

psi_T_a = 1;%0.766707;
psi_T_b = 1;%0.524581;

% AR coefficient public wages
rho_emg_a = 0.954451;
rho_emg_b = 0.627018;

xi_b_emg_a = 0;%0;
xi_b_emg_b = 0;%0;

xi_y_emg_a = 0;%0;
xi_y_emg_b = 0;%0;

psi_mg_a = 1;%0.757595;
psi_mg_b = 1;%0.806443;

% AR coefficient unemployment benefits
rho_UB_a = 0;
rho_UB_b = 0;

 nu_etauw_a = 0;
 nu_etauw_b = 0;
 nu_eg_a = 0;
 nu_eg_b = 0;
 nu_eT_r_a = 0;
 nu_eT_r_b = 0;
 nu_ein_a = 0;
 nu_ein_b = 0;
 


a11 = 0.773115;
a12 = 0.322906;
a13 = 0.231580;
a21 = -0.088804;
a22 = 0.541592; 
a23 = 0.391018;
a24 = 0;
a31 = -0.007415;
a32 = -0.005005;
a33 = 0.950264;
a34 = 0;
a44 = 0;
c11 = 1;
c21 = 0.553581;
c22 = 1;
c24 = 0;
c31 = 0.090782;
c32 = -0.052241;
c33 = 1;
c34 = 0;
c44 = 1;


mu_a	=	0.33530164244663	;
mu_bar_a	=	0.50650437662821	;
nu_G_a	=	0.81362959664029	;
hab_a	=	0.50767571593426	;
eta_a	=	1.01862589054347	;
upsilon_a	=	4.95144751166474	;
upsilon_p_a	=	70.84510541064140	;
upsilon_w_a	=	61.72056324380980	;
xip_a	=	0.35827801861261	;
xiw_a	=	0.49580548948295	;
eta_kG_a	=	0.07025399427035	;
eta_nG_a	=	0.07520613549373	;
rho_etauw_a	=	0.79167609127767	;
rho_etauc_a	=	0.92927642214350	;
rho_etausc_a	=	0.92335690783894	;
rho_eg_a	=	0.86696830948423	;
rho_einG_a	=	0.54289198670130	;
rho_enG_a	=	0.90811594398425	;
rho_eTR_a	=	0.96919154317430	;
rho_eT_a	=	0.29504261162457	;
rho_emg_a	=	0.92794449252638	;
% Taylor Rule - Interest smoothing 
rho_a_i	=	0.86889737103460	;
% Taylor Rule - Inflation coefficient
phi_a_pi	=	1.75721683204365	;
% Taylor Rule - Output gap coefficient
phi_a_y	=	0.05197578976967	;
rho_a_a	=	0.89678238936306	;
rho_ein_a	=	0.74965664646529	;
rho_eb_a	=	0.70500665560880	;
rho_en_a	=	0.97772348584646	;
rho_erp_a	=	0.82022690436118	;
rho_erp_b	=	0.61524278220581	;
rho_etheta_a	=	0.54565341122683	;
rho_ethetaw_a	=	0.76218654502728	;
rho_eRoE_a	=	0.93253160160212	;
rho_eRoW_a	=	0.91904618380572	;
mu_b	=	0.44712030979727	;
mu_bar_b	=	0.37957328640606	;
nu_G_b	=	0.45823884131334	;
hab_b	=	0.74550193730794	;
eta_b	=	0.77449765718517	;
upsilon_b	=	4.93768275244173	;
upsilon_p_b	=	67.43127503942450	;
upsilon_w_b	=	79.64377329946500	;
xip_b	=	0.46968174456230	;
xiw_b	=	0.30808605659282	;
eta_kG_b	=	0.12343923038341	;
eta_nG_b	=	0.08114393003610	;
rho_etauw_b	=	0.89155330613665	;
rho_etauc_b	=	0.89884618863134	;
rho_etausc_b	=	0.87643667872879	;
rho_eg_b	=	0.91581609842774	;
rho_einG_b	=	0.96000898948238	;
rho_enG_b	=	0.98622117885112	;
rho_eTR_b	=	0.86096057643551	;
rho_eT_b	=	0.95718734195883	;
rho_emg_b	=	0.10495839525484	;
rho_a_b	=	0.95558632931021	;
rho_ein_b	=	0.79469134149559	;
rho_eb_b	=	0.77687104591173	;
rho_en_b	=	0.94825121903839	;
rho_etheta_b	=	0.58045260284681	;
rho_ethetaw_b	=	0.46887756812270	;
rho_eRoE_b	=	0.95803459579526	;
rho_eRoW_b	=	0.92219979773838	;
eta_c	=	0.56927158819385	;
a11	=	0.76834653682342	;
a12	=	0.33626542961988	;
a13	=	0.19185300958693	;
a21	=	-0.11944556610313	;
a22	=	0.54061335483045	;
a23	=	0.32172824744101	;
c21	=	0.55679871316402	;
a31	=	-0.00748867219926	;
a32	=	0.00311974120695	;
a33	=	0.95255548112162	;
c31	=	0.09101008356196	;
c32	=	-0.04719749260639	;






%%%%%%%%%%%%%%%%%%%%%%

% original version provided by Nikolai
%  NumberOfParameters = M_.param_nbr;
%          for i = 1:NumberOfParameters
%              paramname = deblank(M_.param_names(i,:));
%              eval(['M_.params(' int2str(i) ')=' paramname ';']);
%          end 

% modification ensuring that paramnames is a char (see the begining of the
% file for the same adjustment)
 NumberOfParameters = M_.param_nbr;
         for i = 1:NumberOfParameters
             paramname = char(deblank(M_.param_names(i,:)));
             eval(['M_.params(' int2str(i) ')=' paramname ';']);
         end 
         
set_steadystate_31_08_aw1;