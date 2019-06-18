function coeff_vec=MSR_COEFFS(model) %The input is an identification number of a model chosen.
coeff_vec=NaN(33,1);

% Set Parameters for the Monetary Policy Rule
% The Policy Rule is Described by the Following Equation in Each model Dynare file:
% interest = const + cofintintb1*interest(-1) + cofintintb2*interest(-2) + cofintintb3*interest(-3) + cofintintb4*interest(-4)
%           + cofintinf0*inflationq + cofintinfb1*inflationq(-1) + cofintinfb2*inflationq(-2) + cofintinfb3*inflationq(-3) + cofintinfb4*inflationq(-4)
%           + cofintinff1*inflationq(+1) + cofintinff2*inflationq(+2) + cofintinff3*inflationq(+3) + cofintinff4*inflationq(+4)
%           + cofintout*outputgap + cofintoutb1*outputgap(-1) + cofintoutb2*outputgap(-2) + cofintoutb3*outputgap(-3) + cofintoutb4*outputgap(-4)
%           + cofintoutf1*outputgap(+1) + cofintoutf2*outputgap(+2) + cofintoutf3*outputgap(+3) + cofintoutf4*outputgap(+4)
%           + cofintoutp*output + cofintoutpb1*output(-1) + cofintoutpb2*output(-2) + cofintoutpb3*output(-3) + cofintoutpb4*output(-4)
%           + cofintoutpf1*output(+1) + cofintoutpf2*output(+2) + cofintoutpf3*output(+3) + cofintoutpf4*output(+4)
%           + {std_r_ * interest_            , if the model has an annual interest rate
%           + {std_r_quart * interest_       , if the model has an quarterly interest rate

% Description of Modelbase Variables:
% interest is the annualized quarterly nominal interest rate
% inflationq is the annualized quarterly inflation rate
% inflation is the year-on-year inflation rate
% outputgap
% output

% The Mapping of coefficients in the monetary rule

% coeff_vec(1)=cofintintb1,coeff_vec(2)=cofintintb2,coeff_vec(3)=cofintintb3,coeff_vec(4)=cofintintb4
% coeff_vec(5)=cofintinf0,coeff_vec(6)=cofintinfb1,coeff_vec(7)=cofintinfb2,coeff_vec(8)=cofintinfb3,coeff_vec(9)=cofintinfb4,
% coeff_vec(10)=cofintinff1,coeff_vec(11)=cofintinff2,coeff_vec(12)=cofintinff3,coeff_vec(13)=cofintinff4,
% coeff_vec(14)=cofintout,coeff_vec(15)=cofintoutb1,coeff_vec(16)=cofintoutb2,coeff_vec(17)=cofintoutb3,coeff_vec(18)=cofintoutb4,
% coeff_vec(19)=cofintoutf1,coeff_vec(20)=cofintoutf2,coeff_vec(21)=cofintoutf3,coeff_vec(22)=cofintoutf4,
% coeff_vec(23)=cofintoutp,coeff_vec(24)=cofintoutpb1,coeff_vec(25)=cofintoutpb2,coeff_vec(26)=cofintoutpb3,coeff_vec(27)=cofintoutpb4,
% coeff_vec(28)=cofintoutpf1,coeff_vec(29)=cofintoutpf2,coeff_vec(30)=cofintoutpf3,coeff_vec(31)=cofintoutpf4,
% coeff_vec(32) =std_r_
% coeff_vec(33) = std_r_quart

switch model
    case 1  % NK_RW97
        
    case 2  % NK_LWW03
        % Policy Rule From Levin, Wieland and Williams (2003)
        % Original formulation of the policy rule:
        % i = -0.28 + 0.76*i(-1) + 0.60*pitilde + 0.21*y + 0.97*dy
        %[Equation (4) in the paper]
        % Variables:
        % i is the annualized short-term nominal interest rate
        % pitilde is the four-quarter average inflation rate (annualized)
        % y is the output gap
        % dy is the first difference of the output gap
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.755226; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0.602691/4; coeff_vec(6) = 0.602691/4; coeff_vec(7) = 0.602691/4; coeff_vec(8) = 0.602691/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 1.17616; coeff_vec(15) = -0.972390; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 3  % NK_CGG99
        % Original interest rate rule from table 1 in Clarida et al. (1999)
        % i = 0.79*i(-1)+(1-0.79)*(2.15*pi(+1)+(0.93/4)*x);
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = i*4;
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);
        % inflationq = pi*4;
        % outputgap  = x;
        % We devide the original output gap coefficient by 4, since Clarida et al. (2000)
        % report that they use annualized quarterly inflation and interest rate data to estimate the rule.
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.79; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.79)*2.15; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.79)*.93/4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 4  % NK_CGG02
        % Original monetary policy rule (Galí and Monacelli, 2005)
        % r = 1.5*infl; domestic inflation-based Taylor rule in section 5
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = r;
        % inflation  = (1/4)*(infl+infl(-1)+infl(-2)+infl(-3));
        % inflationq = infl;
        % outputgap  = ytilde;
        % output     = y;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) =0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 5  % NK_MCN99cr
        % Original monetary policy rule from table 1.1 of the paper
        % mu1=1.5; mu2=0; mu3=0;
        % R = mu1*pi + mu2*ytilde + mu3*R(-1);
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = 100*4*R;
        % inflation = 100*(1/4)*(4*pi + 4*pi(-1) + 4*pi(-2) + 4*pi(-3));
        % inflationq  = 100*4*pi;
        % outputgap  = 100*ytilde;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 6  % NK_IR04
        % Original interest rate rule
        % r = rhor*r(-1) + rhoy*y(-1) + rhopi*pi(-1) + interest_;
        % rhor = 0.5481; rhopi = 0.5680; rhoy = 0.0
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest = 4*r;
        % inflation = pi + pi(-1) + pi(-2) + pi(-3);
        % inflationq  = 4*pi;
        % outputgap = y - (omega1*z-omega2*gamma2*0+omega2*(gamma3-1)*e)/(1-omega2*gamma1);
        % output = y;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.5481; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0.5680; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 7  % NK_BGG99
        % Original interest rate rule
        % r_nH = rhov*r_nH(-1) + zetav*piH(-1) - e_rn
        % rhov=.9 ; zetav=0.11
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = 4*r_nH;
        % inflation  = piH+piH(-1)+piH(-2)+piH(-3);
        % inflationq = 4*piH;
        % outputgap  = yH-yHf;
        % output     = yH;
        % fispol     = e_g;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.9; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0.11; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 8  % NK_GM05
        
    case 9  % NK_GK11
        % References: Gertler, M. and Karadi, P. ``A Model of
        % Unconvetional Monetary Policy'' In: Journal of Monetary Economics (2011)
        % Original formulation of the policy rule
        % rn = rhoi*rn(-1) + (1-rhoi)*(kappa_pi*pi+kappa_y*y) + e_rn; eq(39)
        % rhoi = 0.0; kappa_pi = 1.5; kappa_y = 0.5/4; when the crisis phase
        % the authers use minus the price markup as a proxy for the
        % output gap in the rule.
        %
        % Definition of Modelbase Variables in Terms of Orginal Model Variables
        % interest   = 4*rn;
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);
        % inflationq = 4*pi;
        % outputgap  = y-yf;
        % output     = y;
        
        % Description in terms of the Modelbase general rule specification:
        %              coeff_vec(1) = 0.0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        %              coeff_vec(5) = (1-0.0)*1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        %              coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        %              coeff_vec(14) = 0.5*(1-0.0); coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        %              coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        %              coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        %              coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        %              coeff_vec(32) = 1;
        %              coeff_vec(33) = 0.25;
        
    case 10 % NK_CK08
        % Reference: New Keynesian model with search and matching frictions in the labor market. Christoffel, Kuester (JME, 2008)
        % Original Monetary policy rule in the paper
        % Rt = (1-gamma_R)*gamma_Pi/4*(Pit(-1) + Pit(-2) + Pit(-3)+ Pit(-4))
        %    +(1-gamma_R)*gamma_y/4*yt+ gamma_R*Rt(-1)+ emoneyt;
        % gamma_R     = 0.85;	 // interest rate smoothing
        % gamma_Pi    = 1.5;   // weight on inflation
        % gamma_y     = 0.5;   // weight on output
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = 4*Rt;
        % inflation  = Piannt;
        % inflationq = 4*Pit;
        % outputgap  = yt;    // natural output not computed in model
        % output     = yt;
        % fispol     = g_
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.85; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = (1-0.85)*1.5/4; coeff_vec(7) = (1-0.85)*1.5/4; coeff_vec(8) = (1-0.85)*1.5/4;coeff_vec(9) = (1-0.85)*1.5/4;
        coeff_vec(10) = 0;coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.5*(1-0.85); coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 11 % NK_CKL09
        % Reference: "The role of labor markets for euro area monetary policy"
        % Christoffel, K., Kuester, K., and T. Linzert (2009),  European Economic Review 53, 908–936
        % Original Model Code: Monetary policy rule in the paper
        % Rt = (1-gamma_R)*gamma_Pi/4*(Piannt)
        %    +(1-gamma_R)*gamma_y/4*(yt-1*yflext)+ gamma_R*Rt(-1)+
        %    + gamma_dy*(yt-yt(-1)) //
        %    + emoneyt;
        % gamma_R     = 0.85;	// interest rate smoothing
        % gamma_Pi    = 1.5;  // weight on inflation
        % gamma_y     = 0.5;  // weight on output
        % gamma_dy    = 0.0;  //
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = 4*Rt;
        % inflation  = Piannt;
        % inflationq = 4*Pit;
        % outputgap  = yt-yflext;    // output minus flex-price/flex-wage output
        % output     = yt;
        % fispol     = g_
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.85; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.85)*1.5/4; coeff_vec(6) = (1-0.85)*1.5/4; coeff_vec(7) = (1-0.85)*1.5/4; coeff_vec(8) = (1-0.85)*1.5/4;coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.5*(1-0.85); coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 12 % NK_RW06
    
    case 13 % US_CMR14noFA
    
    case 14 % US_CMR14
        % Reference: Christiano, L. J., Motto, R., Rostagno, M., 2014. Risk shocks in American Economic Review 104 (1), 27–65.
        %             // Definition of Modelbase Variables in Terms of Original Model Variables     //*
        %   interest   = 100*( (1+Re)^4 - (1+Re_p)^4 )/((1+Re_p)^4);                    //*
        %   inflationq = 100*(pi^4-pi_p^4)/(pi_p^4);                                    //*
        %   inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
        %   output     = (log(y)-log(steady_state(y)))*100;                           //*
        %   outputgap  = (log(y)-log(yf))*100;                                        //*
        
        % interest rate rule in terms of model base common variables
        % interest = rhotil_p * interest(-1) + (1 - rhotil_p) * aptil_p * pi_p * inflationq(+1)
        %          + (1 - rhotil_p) * adytil_p * muzstar_p * (1/4) *(output - output(-1)) +  e_xp;
        % rhotil_p       =   0.850296450300000  ;
        % aptil_p        =   2.396495942700000  ;
        % muzstar_p         = 1.004124413586981;
        % adytil_p       =   0.364943654300000  ;
        % pi_p              = 1.006010795406775;
        coeff_vec(1) = 0.850296450300000; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0; coeff_vec(10) = (1-0.850296450300000)* 2.396495942700000*1.006010795406775; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0; coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = (1-0.850296450300000)*0.364943654300000*1.004124413586981;coeff_vec(24) = -(1-0.850296450300000)*0.364943654300000*1.004124413586981;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 15 % US_FRB03
        
    case 16 % US_FRB08
        
    case 17 % US_FRB08mx
        
    case 18 % US_SW07
        % Policy Rule Smets Wouters 2007 US
        % Original formulation of the policy rule:
        % r =  crpi*(1-crr)*pinf + cry*(1-crr)*(y-yf) + crdy*(y - yf - y(-1) + yf(-1)) + crr*r(-1) + ms
        % [Equation (14) in the paper]
        % Variables:
        % r is the quarterly interest rate, not annualized
        % pinf is quarterly inflation, not annualized
        % y is output
        % yf is potential output
        % ms is a monetary policy shock
        % Coefficients:
        % crpi=     2.0443; Taylor rule reaction to inflation
        % crr=      0.8103; Taylor rule interest rate smoothing
        % cry=      0.0882; Taylor rule long run reaction to output gap
        % crdy=     0.2247; Taylor rule short run reaction to output gap
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8103; coeff_vec(2) = 0;  coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.8103)*2.0443;  coeff_vec(6) = 0;  coeff_vec(7) = 0;  coeff_vec(8) = 0;coeff_vec(9) = 0;
        coeff_vec(10) = 0;  coeff_vec(11) = 0;  coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = ((1-0.8103)*0.0882+0.2247)*4;  coeff_vec(15) = -0.2247*4;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 19 % US_ACELM
        % The impulse response function for the monetary policy shock
        % in ACEL(2004) is almost identical to CEE(2005). Therefore, we
        % use the policy rule of CEE(2005)
        % Original formulation of the policy rule:
        % R = rho*R(-1) + (1-rho)*(alpha_pi*pi(+1) + alpha_y*y) + eps
        % [Equation on page 28 of the paper]
        % Variables:
        % R is the short-run nominal interest rate, annualized or not?
        % pi is inflation, annualized or not?
        % y is the output gap
        % Coefficients:
        % rho = 0.80; Taylor rule interest rate smoothing
        % alpha_pi = 1.5; Taylor rule reaction to expected inflation one period ahead
        % alpha_y = 0.1; Taylor rule reaction to output gap
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.8)*1.5; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.8)*0.1*4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 20 % US_ACELt
        % Original formulation of the policy rule:
        % R = rho*R(-1) + (1-rho)*(alpha_pi*pi(+1) + alpha_y*y) + eps
        % [Equation on page 28 of the paper]
        % Variables:
        % R is the short-run nominal interest rate, annualized or not?
        % pi is inflation, annualized or not?
        % y is the output gap
        % Coefficients:
        % rho = 0.80; Taylor rule interest rate smoothing
        % alpha_pi = 1.5; Taylor rule reaction to expected inflation one period ahead
        % alpha_y = 0.1; Taylor rule reaction to output gap
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = (1-0.8)*1.5;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.8)*0.1*4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 21 % US_ACELswm
        % Original formulation of the policy rule:
        % R = rho*R(-1) + (1-rho)*(alpha_pi*pi(+1) + alpha_y*y) + eps
        % [Equation on page 28 of the paper]
        % Variables:
        % R is the short-run nominal interest rate, annualized or not?
        % pi is inflation, annualized or not?
        % y is the output gap
        % Coefficients:
        % rho = 0.80; Taylor rule interest rate smoothing
        % alpha_pi = 1.5; Taylor rule reaction to expected inflation one period ahead
        % alpha_y = 0.1; Taylor rule reaction to output gap
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = (1-0.8)*1.5;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.8)*0.1*4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 22 % US_ACELswt
        % Original formulation of the policy rule:
        % R = rho*R(-1) + (1-rho)*(alpha_pi*pi(+1) + alpha_y*y) + eps
        % [Equation on page 28 of the paper]
        % Variables:
        % R is the short-run nominal interest rate, annualized or not?
        % pi is inflation, annualized or not?
        % y is the output gap
        % Coefficients:
        % rho = 0.80; Taylor rule interest rate smoothing
        % alpha_pi = 1.5; Taylor rule reaction to expected inflation one period ahead
        % alpha_y = 0.1; Taylor rule reaction to output gap
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = (1-0.8)*1.5;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.8)*0.1*4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 23 % US_RS99
        
    case 24 % US_OR03
        % Orphanides, A. 2003. "The quest for prosperity without inflation."
        % // Journal of Monetary Economics 50 (2003) 633-663
        % Policy rule: Taylor (1993) Rule
        %
        % Original formulation of the policy rule:
        % r = p + 0.5*y + 0.5*(p-2)+2
        % [Equation (1) in the paper]
        % Variables:
        % r is the federal funds rate
        % p is the rate of inflation over the previous four quarters
        % y is the percent deviation of real GDP from a target
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.5/4; coeff_vec(6) = 1.5/4; coeff_vec(7) = 1.5/4; coeff_vec(8) = 1.5/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.5; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 25 % US_PM08
        %  Model: US_PM08 stationary version
        %
        % Original formulation of the policy rule:
        % //RS_USh = gamma_us1*RS_USh(-1) + (1-gamma_us1)*(RR_US_BARh + PIE_US4h(+3) +
        % //gamma_us2*(PIE_US4h(+3)-pietar_us_ss) + gamma_us4*Y_US) + RES_RS_US;
        % gamma_us1   = 0.7087;
        % gamma_us2   = 1.2679;
        % gamma_us4   = 0.2192;
        % pietar_us_ss= 2.5;
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest   = RS_USh;                                                     //*
        % inflation  = PIE_US4h;(=(PIE_USh+PIE_USh(-1)+PIE_USh(-2)+PIE_USh(-3))/4 )                                                 	 //*
        % inflationq = PIE_USh;                                                 	 //*
        % outputgap  = Y_US;                                                       //*
        % output     = Y_US;                                                       //*
        % PIE_US4h(+3);(=(PIE_USh(+3)+PIE_USh(+2)+PIE_USh(+1)+PIE_USh)/4 )
        % Note that we ignore the shock to real equilibrium interest rate: RR_US_BARh
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.7087; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.7087)*(1+1.2679)/4; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.7087)*(1+1.2679)/4; coeff_vec(11) = (1-0.7087)*(1+1.2679)/4; coeff_vec(12) = (1-0.7087)*(1+1.2679)/4; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.7087)*0.2192; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0; coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 26 % US_PM08fl
        %  Model: US_PM08 stationary version
        %
        % Original formulation of the policy rule:
        % //RS_USh = gamma_us1*RS_USh(-1) + (1-gamma_us1)*(RR_US_BARh + PIE_US4h(+3) +
        % //gamma_us2*(PIE_US4h(+3)-pietar_us_ss) + gamma_us4*Y_US) + RES_RS_US;
        % gamma_us1   = 0.7762;
        % gamma_us2   = 1.2993;
        % gamma_us4   = 0.2102;
        % pietar_us_ss= 2.5;
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest   = RS_USh;                                                     //*
        % inflation  = PIE_US4h;(=(PIE_USh+PIE_USh(-1)+PIE_USh(-2)+PIE_USh(-3))/4 )                                                 	 //*
        % inflationq = PIE_USh;                                                 	 //*
        % outputgap  = Y_US;                                                       //*
        % output     = Y_US;                                                       //*
        % PIE_US4h(+3);(=(PIE_USh(+3)+PIE_USh(+2)+PIE_USh(+1)+PIE_USh)/4 )
        % Note that we ignore the shock to real equilibrium interest rate: RR_US_BARh
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.7762; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.7762)*(1+1.2993)/4; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.7762)*(1+1.2993)/4; coeff_vec(11) = (1-0.7762)*(1+1.2993)/4; coeff_vec(12) = (1-0.7762)*(1+1.2993)/4; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.7762)*0.2102; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 27 % US_DG08
        % Policy Rule De Graeve 2008 US
        % Original formulation of the policy rule:
        % Rn = rho*Rn(-1)+(1-rho)*(pibar(-1)+rpi*(pi-pibar)+ry*(Y-Yf))
        %      + rdeltapi*(pi-pi(-1))+rdeltay*(Y-Yf-(Y(-1)-Yf(-1)))+eta_R;
        % pi-pibar is replaced with pi over an entire code.
        % [Equation (14) in the paper]
        %  Definition of Modelbase Variables in Terms of Original Model Variables
        %   interest   = Rn*4;                                                       //*
        %   inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                  	 //*
        %   inflationq = 4*pi;                                                       //*
        %   outputgap  = Y-Yf;                                                       //*
        %   output     = Y;
        % Coefficients:
        %   rho = 0.8977;       % interest rate smoothing
        %   rpi = 1.4933;      % policy response to inflation deviation
        %   ry = 0.0882;       % policy response to output deviation
        %   rdeltapi = 0.0801; % policy response to inflation dynamics
        %   rdeltay = 0.2749;  % policy response to output dynamics
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8977; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  (1-0.8977)*1.4933+0.0801; coeff_vec(6) = -0.0801; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 4*((1-0.8977)*0.0882+0.2749); coeff_vec(15) = -4*0.2749; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 28 % US_CD08
        
    case 29 % US_IAC05
        % Policy rule of Matteo Iacoviello. 2005. "House Prices, Borrowing Constraints, and Monetary Policy in the Business Cycle"
        % the American Economic Review 95, pp. 739-764.
        % Original formulation of the policy rule:
        % Rhat = (1-rR)*(1+rpi)*pihat(-1)+rY*(1-rR)*Yhat(-1)+rR*Rhat(-1)+eRhat;
        % [Equation (L9) in the paper]
        % Definition of Modelbase Variables in Terms of Original Model Variables //*
        %  interest   = Rhat*4;                                                     //*
        %  inflation  = pihat+pihat(-1)+pihat(-2)+pihat(-3);                        //*
        %  inflationq = pihat*4;                                                    //*
        %  output  = Yhat;                                                          //*
        %  outputgap = Yhat-Yhatf;
        % Coefficients:
        %  rR = 0.73;
        %  rpi = 0.27;
        %  rY = 0.13;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.73; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = (1-0.73)*(1+0.27); coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 4*(1-0.73)*0.13;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 30 % US_MR07
        
    case 31 % US_RA07
        % Policy rule Pau Rabanal (2007).
        % Original formulation of the policy rule:
        % r= rhor*r(-1)+(1-rhor)*gammap*pi+(1-rhor)*gammay*output+epsz;
        % rhor = 0.94;//interest rate smoothing
        % gammap = 1.34;//inflation reaction
        % gammay = 0.53;//output reaction
        % epsz is IID.
        % // Definition of Modelbase Variables in Terms of Original Model Variables//*
        % interest   = r*4;                                                        //*
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
        % inflationq = pi*4;                                                       //*
        % outputgap  = y-yf;                                                       //*
        % output     = y;                                                          //*
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.94; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.94)*1.34; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = (1-0.94)*0.53*4;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 32 % US_CCTW10
        % Policy Rule same form as Smets Wouters 2007 US
        %
        % Original formulation of the policy rule:
        % r =  crpi*(1-crr)*pinf + cry*(1-crr)*(y-yf) + crdy*(y - yf - y(-1) + yf(-1)) + crr*r(-1) + ms
        % [Equation (14) in the paper]
        % Variables:
        % r is the quarterly interest rate, not annualized
        % pinf is quarterly inflation, not annualized
        % y is output
        % yf is potential output
        % ms is a monetary policy shock
        % Coefficients:
        % crpi= 2.0520;    (SW2007) 2.0443; Taylor rule reaction to inflation
        % crr=  0.8180;    (SW2007)0.8103; Taylor rule interest rate smoothing
        % cry=  0.0830;    (SW2007)0.0882; Taylor rule long run reaction to output gap
        % crdy= 0.2321;    (SW2007)0.2247; Taylor rule short run reaction to output gap
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8180; coeff_vec(2) = 0;  coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.8180)*2.0520;  coeff_vec(6) = 0;  coeff_vec(7) = 0;  coeff_vec(8) = 0;  coeff_vec(9) = 0;
        coeff_vec(10) = 0;  coeff_vec(11) = 0;  coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = ((1-0.8180)*0.0830+0.2321)*4;  coeff_vec(15) = -0.2321*4;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 33 % US_IR11
        % Policy rule  Ireland, Peter N. (2011): "A New Keynesian Perspective on the Great Recession",
        % Journal of Money, Credit and Banking Vol.54, No.1, 31-54.
        %
        % Original formulation of the policy rule:
        % r-r(-1)=rhopi*pi+rhog*(y-y(-1)+z)+epsr;
        % [Equation (27) in the paper]
        % z=epsz;
        % Definition of Modelbase Variables in Terms of Original Model Variables//*                                                                         //*
        %  interest   = r*4;                                                        //*
        %  inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
        %  inflationq = pi*4;                                                       //*
        %  outputgap  = x;                                                          //*
        %  output     = y;
        % Coefficients:
        %   rhopi=0.4153;       //response coefficient of the Taylor rule
        %   rhog=0.1270;        //response coefficient of the Taylor rule
        % Description in terms of the Modelbase general rule specification:
        % Note that we ignore the technology shock in the monetary poliy rule.
        coeff_vec(1) =  1; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0.4153; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 4*0.1270; coeff_vec(15) = -4*0.1270; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 34 % EA_CW05ta
        % // Further references:
        % // Coenen, G., and V. Wieland. 2005. "A Small Estimated Euro Area Model with Rational Expectations and Nominal Rigidities."
        % // European Economic Review 49(5), pp. 1081-1104.
        %
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest   = is*100;                                                     //*
        % inflation  = infl*100;                                                    //*
        % inflationq = pi1*4*100;                                                  //*
        % outputgap  = q*100;                                                      //*
        % output     = q*100;                                                      //*
        % // Original monetary policy rule (excluding constants), equation M-7 in Table %4, page 1097)
        % Use Taylor rule
        % // is = infl + 0.5*infl + 0.5*q;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.5/4; coeff_vec(6) = 1.5/4; coeff_vec(7) = 1.5/4; coeff_vec(8) = 1.5/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.5; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 35 % EA_CW05fm
        % // Further references:
        % // Coenen, G., and V. Wieland. 2005. "A Small Estimated Euro Area Model with Rational Expectations and Nominal Rigidities."
        % // European Economic Review 49(5), pp. 1081-1104.
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        %
        % interest   = is*100;                                                     //*
        % inflation  = infl*100;                                                    //*
        % inflationq = pi1*4*100;                                                  //*
        % outputgap  = q*100;                                                      //*
        % output     = q*100;                                                      //*
        % // Original monetary policy rule (excluding constants), equation M-7 in Table %4, page 1097)
        % Use Taylor rule
        % // is = infl + 0.5*infl + 0.5*q;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.5/4; coeff_vec(6) = 1.5/4; coeff_vec(7) = 1.5/4; coeff_vec(8) = 1.5/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.5; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 36 % EA_AWM05
        % No original MP rule with policy shock in the paper.
        
    case 37 % EA_SW03
        % // Further references:
        % // Smets, F., and R. Wouters. 2003. "An Estimated Stochastic Dynamic General Equilibrium Model of the Euro Area."
        % // Journal of the European Economic Association 1(5), pp. 1123-1175.
        % //**************************************************************************
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        %
        % interest   = r*4;                                                        //*
        % inflation  = pinf4;                                                      //*
        % inflationq = pinf*4;                                                     //*
        % outputgap  = ygap;                                                       //*
        % output     = y;                                                          //*
        % fispol     = eg;                                                         //*
        % //**************************************************************************
        % crpi        = 1.6841;
        % crdpi       = 0.1398;
        % crr         = 0.9613;
        % cry         = 0.0988;
        % crdy        = 0.1586;
        %
        % // Original monetary policy rule (Smets and Wouters, 2003)
        % r = crr*r(-1) + (1-crr)*(crpi*pinf+cry*ygap)+crdpi*(pinf-pinf(-1))+crdy*(ygap-ygap(-1))+cscaleer*er;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.9613; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.9613)*1.6841+0.1398; coeff_vec(6) = -0.1398; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = ((1-0.9613)*0.0988+0.1586)*4; coeff_vec(15) = -0.1586*4; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;coeff_vec(23) = 0;
        coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 38 % EA_SR07
        
    case 39 % EA_QUEST3
        % // Further references:
        % // Ratto, M., W. Roeger, and J. in ’t Veld. 2009. "QUEST III: An Estimated Open-Economy DSGE
        % // Model of the Euro Area with Fiscal and Monetary Policy." Economic Modelling 26(1) pp. 222-233.
        %
        % //**************************************************************************
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        %
        % interest   = 100*((E_INOM+1)^4-interestq_exog^4)/interestq_exog^4;
        % inflation = (1/4)*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));
        % inflationq = 100*(4*E_PHIC+1-inflationannual_exog)/inflationannual_exog;
        % outputgap  = 100*E_LYGAP;
        % fispol = E_EPS_G;                                                                 //*
        %  //**************************************************************************
        % TYE1       =   0.4274;
        % TYE2       =   0.0783;
        % ILAGE      =   0.9009;
        % TINFE      =   1.9590;
        % interestq_exog^4 = 1.0366;
        % inflationannual_exog = 1.02
        % old Monetary policy rule (equation 37 in paper, page 5)
        % E_INOM = ILAGE*E_INOM(-1)+(1-ILAGE)*(E_EX_R + E_ZPHIT + TINFE*(E_PHIC-E_ZPHIT) + TYE1*E_LYGAP(-1))
        %   //            + TYE2*(E_LYGAP-E_LYGAP(-1)) + E_ZEPS_M;
        % new policy rule in terms of model base variables using the
        % first order approximation
        % interest =
        % ILAGE*interest(-1)+(1-ILAGE)*(inflationannual_exog*TINFE/interestq_exog^4*inflationq
        % + 4*TYE1/interestq_exog^4*outputgap) +  E_ZEPS_M*400/interestq_exog^4
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.9009; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.9009)*1.02*1.9590/1.0366; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.0783*4/1.0366; coeff_vec(15) = ((1-0.9009)*0.4274-0.0783)*4/1.0366; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 40 % EA_CKL09
        %Christoffel, K., Kuester, K., and T. Linzert (2009), "The role of labor markets for euro area monetary policy," European Economic Review 53, 908–936
        %Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest   = 4*Rt;                                                         //*
        % inflation  = Piannt;                                                       //*
        % inflationq = 4*Pit;                                                        //*
        % outputgap  = yt-yflext;    // output minus flex-price/flex-wage output     //*
        % output     = yt;                                                           //*
        % fispol     = g_;                                                           //*
        %
        % // Monetary policy rule in the paper  [Equation (28) in the paper]
        % // Rt         =      (1-gamma_R)*gamma_Pi/4*( Piannt)
        % //                                    + (1-gamma_R)*gamma_y/4*(yt-1*yflext)
        % //                                    + gamma_R*Rt(-1)
        % //                                    + gamma_dy*(yt-yt(-1))
        % //                                    + emoneyt;
        % gamma_R     = 0.8;   // interest rate smoothing
        % gamma_Pi    = 1.62;  // weight on inflation
        % gamma_y     = 0.43;  // weight on output
        % gamma_dy    = 0.12;  //
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.8)*1.62/4; coeff_vec(6) = (1-0.8)*1.62/4; coeff_vec(7) = (1-0.8)*1.62/4; coeff_vec(8) = (1-0.8)*1.62/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = ((1-0.8)*0.43/4)*4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.12*4;coeff_vec(24) = -0.12*4;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 41 % EA_GE10
        % // Further references:
        % // Gelain, Paolo. 2010. "The external finance premium in the euro area: A dynamic stochastic general equilibrium analysis"
        % // North american Journal of Economics and finance 21, pp. 49-71%
        % // This is a version of the model with financial accelerator and estimation with data from ECB until 2008 q3 without epi
        % // and without S as a varobs (author's comment)
        %
        % // Definition of Modelbase Variables in Terms of Original Model Variables//*
        % interest   = rn*4;                                                       //*
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
        % inflationq = pi*4;                                                       //*
        % outputgap  = y-ypot;                                                     //*
        % output     = y;                                                          //*
        % fispol     = ug;                                                         //*
        %
        % rdeltapi=0.1417;            //response of int.rate to infl. first diff.
        % rdeltay=0.2061;             //response of int.rate to output growth
        % rpi=1.6633;                 //response of int.rate to inflation
        % ry=0.1054;                  //response of int.rate to output
        % phim=0.9075;                //smooth parameter in instrument rule
        %
        % //Monetary policy rule (section 2.3, page 55 in paper)
        % rn=phim*rn(-1)+(1-phim)*(rpi*(pi(-1))+ry*(y(-1)-ypot(-1)))+rdeltapi*(pi-pi(-1))+rdeltay*(y-ypot-(y(-1)-ypot(-1)))+ur; %%%% FOR FLEXIBLE ECONOMY without epi
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.97075; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0.1417; coeff_vec(6) = (1-0.9075)*1.6633-0.1417; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.2061*4; coeff_vec(15) = ((1-0.9075)*0.1054-0.2061)*4; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 42 % G7_TAY93
        % Taylor (1993) Rule
        %
        % Original formulation of the policy rule:
        % r = p + 0.5*y + 0.5*(p-2)+2
        % [Equation (1) in the paper]
        % Variables:
        % r is the federal funds rate
        % p is the rate of inflation over the previous four quarters
        % y is the percent deviation of real GDP from a target
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4)= 0;
        coeff_vec(5) = 1.5/4; coeff_vec(6) = 1.5/4; coeff_vec(7) = 1.5/4; coeff_vec(8) = 1.5/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.5; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 43 % G3_CW03
        % // Further references:
        % // Coenen, G., and V. Wieland. 2002,2003. "Inflation Dynamics and International Linkages: A Model of the United States, the Euro Area and Japan."
        % // ECB Working Paper 181.
        %
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest   = is_us*100;                                                   //*
        % inflation  = pi4_us*100;                                                  //*
        % inflationq = pi1_us*4*100;                                                //*
        % outputgap  = q_us*100;                                                    //*
        % output     = q_us*100;                                                    //*
        % //**************************************************************************
        % Taylor rule
        % rho_us   = 0.00;
        % alpha_us = 0.50;
        % beta_us  = 0.50;
        %
        % % steady states
        % pitarget_us = 0.00;
        % rlbar_us = -delta0_us/delta4_us;
        %
        %is_us    =  (1-rho_us)*(rlbar_us*one + pi4_us) + rho_us*is_us(-1) + alpha_us*(pi4_us - pitarget_us*one) + beta_us*q_us;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.50/4; coeff_vec(6) = 1.50/4; coeff_vec(7) = 1.50/4; coeff_vec(8) = 1.50/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.50; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 44 % EACZ_GEM03
        
        
    case 45 % G2_SIGMA08
        % // Further references:
        % // Erceg, C., L. Guerrieri, and C. Gust. 2008. "Trade adjustment and the composition of trade."
        % // Journal of Economic Dynamics and Control 32, pp. 2622-2650.
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        %
        % interest  = rs*4;                                                        //*
        % inflation  = dpqyoy;                                                     //*
        % inflationq = dpq*4;                                                      //*
        % outputgap  = gdpgap;                                                     //*
        % output     = gdp;                                                        //*
        % fispol     = errgcxt;                                                    //*
        % //**************************************************************************
        %
        % monlag = .8;
        % gampi = .6/(1-.8);
        % gamex = 0;
        % gamy = 0;
        % gamgap = 0;
        % gamy4 = .28/(1-.8);
        %
        % // Monetary policy rule (domestic)
        % //rs      =  monlag*rs(-1) + (1-monlag)*(.25*dpqyoy + (gampi-1)*(.25*dpqyoy-pitar) + gamex*(er-er(-1)) + gamy*.25*dgdp  + gamy4*.25*dgdpyoy + gamgap*.25*gdpgap);
        
        coeff_vec(1) = 0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = ((1-0.8)*0.6/(1-0.8))/4; coeff_vec(6) = ((1-0.8)*0.6/(1-0.8))/4; coeff_vec(7) = ((1-0.8)*0.6/(1-0.8))/4; coeff_vec(8) = ((1-0.8)*0.6/(1-0.8))/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.28/(1-0.8)*0.25*4;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) =  -0.28/(1-0.8)*0.25*4;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 46 % EAUS_NAWM08
        % // Further references: Coenen, Günter & McAdam, Peter & Straub, Roland, 2008.
        % //             "Tax reform and labour-market performance in the euro
        % //             area: A simulation-based analysis using the New Area-
        % //                 Wide Model," Journal of Economic Dynamics and Control,
        % //             Elsevier, vol. 32(8), pages 2543-2583, August.
        % //
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        %                                                                           //*
        % interest   = (EA_R^4-EA_interest_EXOG^4)/EA_interest_EXOG^4;              //*
        % inflation  = (EA_PIC4-EA_PI4TARGET)/EA_PI4TARGET;                         //*
        % inflationq = (EA_PIC^4-EA_PI4TARGET)/EA_PI4TARGET;                        //*
        % outputgap  = EA_YGAP;                                                     //*
        % output     = (EA_Y/EA_YBAR);                                              //*
        % fispol     = EA_EPSG;                                                     //*
        % //**************************************************************************
        %
        % EA_PI4TARGET   = 1.02;
        % EA_PHIRR       = 0.95;
        % EA_PHIRPI      = 2.00;
        % EA_PHIRGY      = 0.10;
        % EA_interest_EXOG^4=EA_BETA^(-4)*EA_PI4TARGET=1.0506 ;
        %
        % // Original monetary policy rule for EA and US (Coenen, McAdams and Straub (2008)) equation 35 in paper
        % //EA_R^4-1 = EA_PHIRR*(EA_R(-1)^4-1)+(1-EA_PHIRR)*(EA_RRSTAR^4*EA_PI4TARGET-1+EA_PHIRPI*(EA_PIC4-EA_PI4TARGET))+EA_PHIRGY*(EA_Y/EA_Y(-1)-1)+EA_EPSR ;
        %
        % //US_R^4-1 = US_PHIRR*(US_R(-1)^4-1)+(1-US_PHIRR)*(US_RRSTAR^4*US_PI4TARGET-1+US_PHIRPI*(US_PIC4-US_PI4TARGET))+US_PHIRGY*(US_Y/US_Y(-1)-1)+US_EPSR ; //Taylor rule
        %
        % The monetary authority is assumed to follow a Taylor-type interest-rate rule (cf.
        % (Taylor, 1993) specified in terms of annual consumer-price inflation and quarterly output growth.
        % We can rewrite the original rule in terms of Modelbase
        % variables as follows.
        % interest   = EA_PHIRR*interest(-1)+(1-EA_PHIRR)
        %            *(EA_PHIRPI*EA_PI4TARGET/EA_interest_EXOG^4*inflation)
        %             +EA_PHIRGY/EA_interest_EXOG^4*(output-output(-1)) +EA_EPSR/EA_interest_EXOG^4 ;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.95; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.95)*2.00*1.02/(1.0506*4); coeff_vec(6) = (1-0.95)*2.00*1.02/(1.0506*4); coeff_vec(7) = (1-0.95)*2.00*1.02/(1.0506*4); coeff_vec(8) = (1-0.95)*2.00*1.02/(1.0506*4); coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.10/1.0506;coeff_vec(24) = -0.10/1.0506;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 47 % EAES_RA09
        % // Further references:
        % // Rabanal, Pau. 2009. "Inflation Differentials between Spain and the EMU: A DSGE Perspective"
        % // Journal of Money, Credit and Banking 41(6), pp. 1141-1166.
        % //**************************************************************************
        % // Definition of Modelbase Variables in Terms of Original Model Variables//*
        %                                                                          //*
        % interest   = r*4;                                                        //*
        % inflation  = (pi_EMU+pi_EMU(-1)+pi_EMU(-2)+pi_EMU(-3));                  //*
        % inflationq = pi_EMU*4;                                                   //*
        % outputgap  = y_EMU; //Note, at the moment the flex price case based output gap is not defined.  //*
        % output     = y_EMU;                                                      //*
        % //**************************************************************************
        %
        % rho_r=0.73;             //interest rate smoothing
        % gamma_pi=1.43;          //Taylor rule inflation
        %
        % //Monetary policy (equation 21 in paper)
        % //r=rho_r*r(-1)+(1-rho_r)*gamma_pi*pi_EMU+eps_m;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.73; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.73)*1.43; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 48 % CL_MS07
        
    case 49 % BRA_SAMBA08
        % // Model: BRA_SAMBA08
        %
        % // Further references:
        % // Gouvea, Solange, André Minella, Rafael Santos, and Nelson Souza-Sobrinho (September 2008)
        % //"Samba: Stochastic Analytical Model with a Bayesian Approach".
        % // Working Paper.
        %
        % //**************************************************************************
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        %
        % interest   = r*400;                                                       //*
        % inflation = (1/4)*(4*pi+4*pi(-1)+4*pi(-2)+4*pi(-3))*100;                  //*
        % inflationq  = pi*400;                                                     //*
        % outputgap  = yva*100;                                                     //*
        % output = y*100;                                                           //*
        % fispol = g_;                                                              //*
        % //**************************************************************************
        %
        % gamar=0.682;
        % gamapi=1.523;
        % gamay=0.839;
        %
        % // Original Taylor rule:
        % r = gamar*r(-1)+(1-gamar)*(gamapi*(pi(+1)-pibar(+1))+pibar+gamay*yva)+zr;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.682; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.682)*1.523; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.682)*0.839*4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 50 % CA_LS07
        
    case 51 % HK_FPP11
        
    case 52 % US_IN10
        % Iacoviello, Matteo and Stefano Neri (2010)
        % Original formulation of the policy rule:
        % //r = TAYLOR_R*r(-1) + (1-TAYLOR_R)*(TAYLOR_P)*dp +
        % //(1-TAYLOR_R)*TAYLOR_Y*(zata_GDP-zata_GDP(-1)) +
        % //(1-TAYLOR_R)*log(1/BETA) + eps_e - a_s/100 ;
        % a_s is a stochastic process with high persistence capturing
        % long-lasting deviations of inflation from its steady-sttate level
        % Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest   = 400*(r-log(1/BETA));
        % inflation  = (dp+dp(-1)+dp(-2)+dp(-3))*100;
        % inflationq = dp*400;
        % outputgap  = (zata_GDP-zata_GDPf)*100;
        % output     = (zata_GDP-0.9308)*100;
        % Note that we ignore a_s in the monetary poliy rule.
        % TAYLOR_P	=	1.40444	;
        % TAYLOR_R	=	0.59913	;
        % TAYLOR_Y	=	0.51261	;
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.59913; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.59913)*1.40444; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 4*(1-0.59913)*0.51261;coeff_vec(24) = -4*(1-0.59913)*0.51261;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 53 % US_CMR10
        
    case 54 % US_CMR10fa
        
    case 55 % US_VMDno
        %  Verona, Martins and Drumond, "(Un)anticipated monetary policy in a DSGE model with a shadow banking system",
        %  International Journal of Central Banking, forthcoming
        % Original formulation of the policy rule:
        % ReXU - rhotilUU*ReXU(-1)-(1-rhotilUU)*(ReXUU+aptilUU*(piU(+1)-piUU)+aytilUU*(YU-YUU))+e_xpU/400;
        
        % rhotilUU=0.88, aptilUU=1.82, aytilUU=0.11, YUU=0.4796, piUU=1
        % (1+ReXUU)^4=1.0127^4=1.0516
        
        % // Definition of Modelbase Variables in Terms of Original Model Variables//*
        % interest   = 100*( (1+ReXU)^4 - (1+ReXUU)^4 )/((1+ReXUU)^4);             //*
        % inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));//*
        % inflationq = 100*(piU^4-piUU^4)/(piUU^4);                                //*
        % outputgap  = 100*(YU-YflexU)/YUU;                                        //*
        % output     = 100*(YU-YUU)/YUU;                                           //*
        % For the expression of common variables in terms of model variables,
        % the following approximation are used.
        % interest ~= 400*( ReXU - ReXUU)/(1+ReXUU)^4;
        % inflationq ~= 400*(piU -piUU)/(piUU^4);
        
        % In terms of common variables, the policy rule are following:
        % interest=rhotilUU*interest(-1)+(1-rhotilUU)*(aptilUU*(piUU^4)/(1+ReXUU)^4*inflationq(+1)
        %                                 +4*aytilUU*YUU/(1+ReXUU)^4*output+e_xpU/(1+ReXUU)^4
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.88; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.88)*1.82*1/1.0516; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = (1-0.88)*4*0.11*0.4796/1.0516;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 56 % US_VMDop
        %  Verona, Martins and Drumond, "(Un)anticipated monetary policy in a DSGE model with a shadow banking system",
        %  International Journal of Central Banking, forthcoming
        % Original formulation of the policy rule:
        % ReXU - rhotilUU*ReXU(-1)-(1-rhotilUU)*(ReXUU+aptilUU*(piU(+1)-piUU)+aytilUU*(YU-YUU))+e_xpU/400;
        
        % rhotilUU=0.88, aptilUU=1.82, aytilUU=0.11, YUU=0.4796, piUU=1
        % (1+ReXUU)^4=1.0127^4=1.0516
        
        % // Definition of Modelbase Variables in Terms of Original Model Variables//*
        % interest   = 100*( (1+ReXU)^4 - (1+ReXUU)^4 )/((1+ReXUU)^4);             //*
        % inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));//*
        % inflationq = 100*(piU^4-piUU^4)/(piUU^4);                                //*
        % outputgap  = 100*(YU-YflexU)/YUU;                                        //*
        % output     = 100*(YU-YUU)/YUU;                                           //*
        % For the expression of common variables in terms of model variables,
        % the following approximation are used.
        % interest ~= 400*( ReXU - ReXUU)/(1+ReXUU)^4;
        % inflationq ~= 400*(piU -piUU)/(piUU^4);
        
        % In terms of common variables, the policy rule are following:
        % interest=rhotilUU*interest(-1)+(1-rhotilUU)*(aptilUU*(piUU^4)/(1+ReXUU)^4*inflationq(+1)
        %                                 +4*aytilUU*YUU/(1+ReXUU)^4*output+e_xpU/(1+ReXUU)^4
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.88; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.88)*1.82*1/1.0516; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = (1-0.88)*4*0.11*0.4796/1.0516;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 57 % EA_GNSS10
        % Reference: Gerali, A., S. Neri, L. Sessa, F. Signoretti. (2010).
        % Credit and Banking in a DSGE Model of the Euro Area. Journal of Money Credit and Banking
        % Supplement to Vol. 42, No. 6.
        % Definition of Modelbase Variables in Terms of Original Model Variables //*
        %
        % interest   = 400*(exp(r_ib)-r_ib_ss);
        % inflation  = (pie+pie(-1)+pie(-2)+pie(-3))*100;
        % inflationq = pie*400;
        % outputgap  = (Y-Yf)*100;
        % output     = (Y-0.273582784533271)*100;
        % //outputgap  = (Y1-Y1f)*100;
        % //output     = (Y1-0.250953431249047)*100;
        %
        % phi_pie     =   coeffs(20); % 2.00384780180824    ;
        % rho_ib      =   coeffs(21); % 0.750481873084311 ;
        % phi_y       =   coeffs(22); % 0.303247771697294 ;
        % piss         = 1;
        %
        % ////***********  8) TAYLOR RULE *****************************************************
        % //(1+exp(r_ib)) = (1+r_ib_ss)^(1 - rho_ib ) * (1+exp(r_ib(-1)))^rho_ib * (( exp(pie) / piss ) ^phi_pie *(exp(Y1)/exp(Y1(-1)))^phi_y  ) ^ ( 1 - rho_ib ) * (1+e_r_ib);// (34) monetary policy
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.750481873084311; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  2.00384780180824*(1-0.750481873084311); coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.303247771697294*(1-0.750481873084311)*4;coeff_vec(24) = -0.303247771697294*(1-0.750481873084311)*4; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
        
    case 58 % NK_MM10
        % Reference: Meh, C., and K. Moran. 2010.
        % The role of bank capital in the propagation of shocks."
        % Journal of Economic Dynamics and Control.
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = (Rd^4-steady_state(Rd)^4)/(steady_state(Rd)^4)*100;
        % interest = log(Rd/steady_state(Rd))*400;
        % inflationq = log(infl/steady_state(infl))*400;
        % inflation = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));
        % inflation  = (infl*infl(-1)*infl(-2)*infl(-3)-steady_state(infl)^4)/(steady_state(infl)^4)*100;
        % inflationq = ((infl^4-steady_state(infl)^4)/steady_state(infl)^4)*100;
        % output     =  (log(Y)-log(steady_state(Y)))*100;
        % outputgap  =  (log(Y)-log(Yf))*100;
        % Original formulation of the policy rule:
        % log(Rd/steady_state(Rd)) = lam_r*log( Rd(-1)/steady_state(Rd) ) + (1-lam_r) * ( lam_pi*log(infl/steady_state(infl)) + lam_y*log(Y/steady_state(Y)) ) + lmp;
        % We can approximate the policy rule in terms of modelbase
        % variables as follows.
        % interest = lam_r*interest(-1) + (1-lam_r)*((lam_pi*inflationq)+ 4*lam_y*output) + 400*lmp;
        % lam_r = 0.8;
        % lam_pi = 1.5;
        % lam_y = 0.1/4;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  (1-0.8)*1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) =0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = (1-0.8)*0.1;coeff_vec(24) = 0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 59 % NK_KRS12
        % Reference: Kannan, Rabanal, Scott (2012).
        % Monetary and Macroprudential Policy Rules in a Model with House Price Booms.
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = r*4;
        % inflation  = p+p(-1)+p(-2)+p(-3);
        % inflationq = p*4;
        % output =    y;
        % outputgap  = y-ystar;
        % Monetary policy
        % r=gammaR*r(-1)+(1-gammaR)*(gammapi*deltapC(-1)+gammay*(y(-1)-ystar(-1))+gammab*(bB(-1)-bB(-2)+deltapC(-1)));
        % gammaR = 0.7;
        % gammapi = 1.3;
        % gammay = 0.125;
        % gammab = 0;
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.7; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  0; coeff_vec(6) = 1.3*(1-0.7); coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = .125*(1-0.7)*4; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 60 % HK_FP13
    case 61 % EAUS_NAWMctww
        % Reference: // Cogan, J.F., J.B. Taylor, V. Wieland and M.H. Wolters,
        % // 2013. "Fiscal Consolidation Strategies", Journal of Economic Dynamics and
        % // Control, 37(2), 404-421
        % Original rule
        % // US_R^4-1 = US_PHIRR*(US_R(-1)^4-1)+(1-US_PHIRR)*
        % (US_RRSTAR^4*US_PI4TARGET-1+US_PHIRPI*(US_PIC4-US_PI4TARGET))
        % +US_PHIRGY*(US_Y/US_Y(-1)-1)+US_EPSR ; //Taylor rule
        %
        % US_PI4TARGET   = 1.02;
        % US_PHIRR       = 0.8180; //(taken from CCTW (2010); original value in NAWM: 0.95;)
        % US_PHIRPI      = 2.0520; //(taken from CCTW (2010); original value in NAWM: 2;)
        % US_PHIRGY      = 0.10;
        % US_interest_EXOG=US_BETA^(-1)*US_PI4TARGET^(1/4)=1.0124;
        % US_interest_EXOG^4=1.0506
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        %                                                                          //*
        % interest   = (US_R^4-US_interest_EXOG^4)/US_interest_EXOG^4;              //*
        % inflation  = (US_PIC4-US_PI4TARGET)/US_PI4TARGET;                         //*
        % inflationq = (US_PIC^4-US_PI4TARGET)/US_PI4TARGET;                        //*
        % outputgap  = US_YGAP;                                                     //*
        % output     = (US_Y-US_YBAR)/US_YBAR;                                      //*
        % fispol     = US_EPSG;                                                     //*
        % We can rewrite the original rule in terms of Modelbase
        % variables as follows.
        % interest   = US_PHIRR*interest(-1)+(1-US_PHIRR)
        %            *(US_PHIRPI*US_PI4TARGET/US_interest_EXOG^4*inflation)
        %             +US_PHIRGY/US_interest_EXOG^4*(output-output(-1)) +US_EPSR/US_interest_EXOG^4 ;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8180; coeff_vec(2) = 0;  coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.8180)*2.0520*1.02/(4*1.0506);  coeff_vec(6) = (1-0.8180)*2.0520*1.02/(4*1.0506); coeff_vec(7) = (1-0.8180)*2.0520*1.02/(4*1.0506);  coeff_vec(8) = (1-0.8180)*2.0520*1.02/(4*1.0506);  coeff_vec(9) = 0;
        coeff_vec(10) = 0;  coeff_vec(11) = 0;  coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = 0.10/1.0506;  coeff_vec(15) = -0.10/1.0506;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 62 %NK_CW09
        % references:Curdia, V. and Woodford, M. (2009), Credit frictions and optimal monetary policy,
        % BIS Working Papers 278, Bank for International Settlements.
        % Original rule
        % //i_d_hat = phi_pi * Pi_hat + phi_y * Y_hat  + epsilon_m //Taylor rule
        % phi_pi   = 2;
        % phi_y    = 0.25; //(taken from CCTW (2010); original value in NAWM: 0.95;)
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0;  coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) = 2;  coeff_vec(6) = 0; coeff_vec(7) =0;  coeff_vec(8) =0;  coeff_vec(9) = 0;
        coeff_vec(10) = 0;  coeff_vec(11) = 0;  coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = .25;  coeff_vec(15) = 0;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 63 % GPM6_IMF13
        %  Model: GPM6 - The Global Projection Model with 6 Regions
        %
        % Original formulation of the policy rule:
        % RS_US   = gamma1_US *RS_US(-1) +(1-gamma1_US )*(RR_BAR_US +PIE4_US(+3)
        %          +gamma2_US *(PIE4_US(+3) -PIETAR_US )+0 +gamma4_US *Y_US )+RES_RS_US;
        % gamma1_US   = 0.7107;
        % gamma2_US   = 0.9104;
        % gamma4_US   = 0.2052;
        % pietar_US_ss= 2.5;
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest   = RS_US - (pietar_US_ss+rr_bar_US_ss);                         //*
        % inflation  = PIE_US - pietar_US_ss;                                       //*
        % inflationq = PIE4_US- pietar_US_ss;                                       //*
        % outputgap  = Y_US;                                                        //*
        % output = LGDP_US - 948.33249637;                                          //*
        % PIE4_US(+3) = (PIE_US(+3)+PIE_US(+2)+PIE_US(+1)+PIE_US)/4
        % Note that we ignore the shock to real equilibrium interest
        % rate, RES_RR_BAR_US.
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.7107; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.7107)*(1+0.9104)/4; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.7107)*(1+0.9104)/4; coeff_vec(11) = (1-0.7107)*(1+0.9104)/4; coeff_vec(12) = (1-0.7107)*(1+0.9104)/4; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.7107)*0.2052; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0; coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 64 % CA_BMZ12
        % Reference: Jeannine Bailliu, Cesaire Meh and Yahong Zhang (2012)
        % "Macroprudential Rules and Monetary Policy when Financial Frictions Matter"
        % Bank of Canada Working Paper 2012-6
        % //**************************************************************************
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest = log(rnt/rn_ss)*400;                                           //*
        % inflationq = log(pit/pi_ss)*400;                                         //*
        % inflation = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
        % output     = log(yt/y_ss)*100;                                               //*
        % outputgap  = log(yt/ytfp)*100;                                                          //*
        % //fispol = g_;                                                            //*
        % //**************************************************************************
        % // Original Standard Taylor rule
        % Rnhat=phi_R*Rnhat(-1)+(1-phi_R)*(phi_pi*pihat+phi_Y*yhat)+e_mhat;
        % phi_R=0.7145; Taylor rule interest rate smoothing
        % phi_pi=1.7062; Taylor rule reaction to inflation
        % phi_Y=0.0776; Taylor rule reaction to output
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 1.7145; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.7145)*1.7062; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0; coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0; coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = (1-0.7145)*0.0776*4;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 65 %
    
    case 66 % US_FM95
        
    case 67 % US_OW98
        % // Orphanides, A., and V. Wieland. 1998. "Price stability and monetary policy effectiveness when nominal interest rates are bounded at zero."
        % // Finance and Economics Discussion Series 98-35, Board of Governors of the Federal Reserve System.
        % Original formulation of the policy rule:
        %  rff = -0.0042 + 0.760*rff(-1) + 0.625*pinf + 1.171*ygap - 0.967*ygap(-1);
        %   equation (1)
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        %  interest   = rff-rffbar*100;                                             //*
        %  inflation = (1/4)*(pdot+ pdot(-1)+ pdot(-2)+ pdot(-3))-pinfbar*100;      //*
        %  inflationq  = pdot-pinfbar*100;                                          //*
        %  outputgap  = ygap;                                                       //*
        %  output = ygap;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.760; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0.625/4; coeff_vec(6) = 0.625/4; coeff_vec(7) = 0.625/4; coeff_vec(8) = 0.625/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 1.171; coeff_vec(15) = -0.967; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
  
        
    case 68 % EA_QR14
        % Reference: Dominic Quint and Pau Rabanal (2014).
        % "Monetary and Macroprudential Policy in an Estimated DSGE Model of the Euro Area"
        % International Journal of Central Banking (June 2014)
        %// Definition of Modelbase Variables in Terms of Original Model Variables //*
        
        % interest   = 400*(r-log(RR_bar));
        % inflation  = (dpemu + dpemu(-1) + dpemu(-2) + dpemu(-3))*100;
        % inflationq = dpemu*400;
        % outputgap  = (y_emu - y_emuf)*100;
        % output     = (y_emu - log(L_total_bar))*100;
        % //**************************************************************************
        %//exp(r) = (1/beta)^(1-gamma_r) *(exp(dpemu))^(gamma_pi*(1-gamma_r)) *(exp(y_emu)*exp(e_tech)/exp(y_emu(-1)))^(gamma_y*(1-gamma_r)) *exp(r(-1))^gamma_r*exp(e_m);
        %//interest = gamma_r*interest(-1)+(1-gamma_r)*(gamma_pi*inflationq) + (1-gamma_r)*(gamma_y*(output - output(-1) + e_tech) +e_m;
        % gamma_pi=1.5579;          % Taylor rule: inflation
        % gamma_r=0.8016;           % Taylor rule: smoothing
        % gamma_y=0.2023;           % Taylor rule: output growth
        coeff_vec(1) = 0.8016; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.8016)*1.5579; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0; coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0; coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 4*(1-0.8016)*0.2023;coeff_vec(24) = -4*(1-0.8016)*0.2023;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 69
    
    case 70 % NK_LWW03AL   
         % Policy Rule From Levin, Wieland and Williams (2003) with
         % Adaptive learning
         
        % Original formulation of the policy rule:
        % i = -0.28 + 0.76*i(-1) + 0.60*pitilde + 0.21*y + 0.97*dy
        %[Equation (4) in the paper]
        % Variables:
        % i is the annualized short-term nominal interest rate
        % pitilde is the four-quarter average inflation rate (annualized)
        % y is the output gap
        % dy is the first difference of the output gap
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.755226; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0.602691/4; coeff_vec(6) = 0.602691/4; coeff_vec(7) = 0.602691/4; coeff_vec(8) = 0.602691/4; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 1.17616; coeff_vec(15) = -0.972390; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 71 % NK_CGG99AL
         % Original interest rate rule from table 1 in Clarida et al. (1999)
        % i = 0.79*i(-1)+(1-0.79)*(2.15*pi(+1)+(0.93/4)*x);
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = i*4;
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);
        % inflationq = pi*4;
        % outputgap  = x;
        % We devide the original output gap coefficient by 4, since Clarida et al. (2000)
        % report that they use annualized quarterly inflation and interest rate data to estimate the rule.
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.79; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = (1-0.79)*2.15; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.79)*.93/4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 72 % NK_CGG02AL
         % Original monetary policy rule (Galí and Monacelli, 2005)
        % r = 1.5*infl; domestic inflation-based Taylor rule in section 5
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = r;
        % inflation  = (1/4)*(infl+infl(-1)+infl(-2)+infl(-3));
        % inflationq = infl;
        % outputgap  = ytilde;
        % output     = y;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) =0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 73 % NK_IR04AL 
         % Original interest rate rule
        % r = rhor*r(-1) + rhoy*y(-1) + rhopi*pi(-1) + interest_;
        % rhor = 0.5481; rhopi = 0.5680; rhoy = 0.0
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest = 4*r;
        % inflation = pi + pi(-1) + pi(-2) + pi(-3);
        % inflationq  = 4*pi;
        % outputgap = y - (omega1*z-omega2*gamma2*0+omega2*(gamma3-1)*e)/(1-omega2*gamma1);
        % output = y;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.5481; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0.5680; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 74 % NK_BGG99AL
        
         % Original interest rate rule
        % r_nH = rhov*r_nH(-1) + zetav*piH(-1) - e_rn
        % rhov=.9 ; zetav=0.11
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = 4*r_nH;
        % inflation  = piH+piH(-1)+piH(-2)+piH(-3);
        % inflationq = 4*piH;
        % outputgap  = yH-yHf;
        % output     = yH;
        % fispol     = e_g;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.9; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0.11; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 75 % NK_RW06AL
        
    case 76 % US_FM95AL
        
    case 77 % US_SW07AL
                % Policy Rule Smets Wouters 2007 US
        % Original formulation of the policy rule:
        % r =  crpi*(1-crr)*pinf + cry*(1-crr)*(y-yf) + crdy*(y - yf - y(-1) + yf(-1)) + crr*r(-1) + ms
        % [Equation (14) in the paper]
        % Variables:
        % r is the quarterly interest rate, not annualized
        % pinf is quarterly inflation, not annualized
        % y is output
        % yf is potential output
        % ms is a monetary policy shock
        % Coefficients:
        % crpi=     2.0443; Taylor rule reaction to inflation
        % crr=      0.8103; Taylor rule interest rate smoothing
        % cry=      0.0882; Taylor rule long run reaction to output gap
        % crdy=     0.2247; Taylor rule short run reaction to output gap
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8103; coeff_vec(2) = 0;  coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.8103)*2.0443;  coeff_vec(6) = 0;  coeff_vec(7) = 0;  coeff_vec(8) = 0;coeff_vec(9) = 0;
        coeff_vec(10) = 0;  coeff_vec(11) = 0;  coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = ((1-0.8103)*0.0882+0.2247)*4;  coeff_vec(15) = -0.2247*4;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 78 % US_MI07AL
        % Policy Rule in Milani (2007)
        % Original formulation of the policy rule: (p.26)
        % i = rho*i(-1)+(1-rho)*(Xi_pi*pi+Xi_x*x)+ mps;
        % [Equation (6.3) in the paper]
        % Variables:
        % i is the annualized quarterly interest rate
        % pi is quarterly inflation, annualized
        % x is output
        % mps is the monetary policy shock
        % Coefficients:
        % rho=     1.484; Policy rule reaction to inflation
        % Xi_pi=   0.914; Policy rule interest rate smoothing
        % Xi_x=    0.801; Policy rule reaction to output gap
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.914; coeff_vec(2) = 0;  coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.914)*1.484;  coeff_vec(6) = 0;  coeff_vec(7) = 0;  coeff_vec(8) = 0;coeff_vec(9) = 0;
        coeff_vec(10) = 0;  coeff_vec(11) = 0;  coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = (1-0.914)*0.801;  coeff_vec(15) = 0;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 79 % US_YR13AL
        % Policy rule in Rychalovska (2013)
        % Original formulation of the policy rule:
        % r = crpi*(1-crr)*pinf +cry*(1-crr)*(y-cfc*a) +crdy*(y-y(-1)-cfc*(a-a(-1))) +crr*r(-1) +ms
        % That is: r =  crr*r(-1) + (1-crr)*crpi*pinf + ((1-crr)*cry+crdy)*ygap - crdy*ygap(-1)  +ms
        % Variables: 
        % r is the quarterly annualized interest rate
        % pinf is the quarterly annualized inflation 
        % (y-cfc*a) / ygap is the output gap
        % ms is the monetary policy shock
        % Coefficients:
        % crr=        0.9209;
        % crpi=       1.6692;
        % cry=        0.1372;
        % crdy=       0.1004;

        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.9209; coeff_vec(2) = 0;  coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.9209)*1.6692;  coeff_vec(6) = 0;  coeff_vec(7) = 0;  coeff_vec(8) = 0;coeff_vec(9) = 0;
        coeff_vec(10) = 0;  coeff_vec(11) = 0;  coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = ((1-0.9209)*0.1372+0.1004) ;  coeff_vec(15) = -0.1004;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 
        
     case 80 % NK_ET14
        % Further references:
        % Ellison, M. and Tischbirek, A.: ``Unconventional government debt purchases as a supplement to conventional monetary policy''
        % In: Journal of Economic Dynamics and Control (2014), no. 43, pp. 199–217.
        % Definition of Modelbase Variables in Terms of Original Model Variables //*
        
        % interest     = 400*(i - steady_state(i));
        % inflation    = (Pi + Pi(-1) + Pi(-2) + Pi(-3) - 4*steady_state(Pi))*100;
        % inflationq   = 400*(Pi - steady_state(Pi));
        % outputgap    = (Y - Yf - (steady_state(Y) - steady_state(Yf)))*100;
        % output       = 100*(Y - steady_state(Y));
        % //**************************************************************************
        %//exp(r) = (1/beta)^(1-gamma_r) *(exp(dpemu))^(gamma_pi*(1-gamma_r)) *(exp(y_emu)*exp(e_tech)/exp(y_emu(-1)))^(gamma_y*(1-gamma_r)) *exp(r(-1))^gamma_r*exp(e_m);
        %//interest = gamma_r*interest(-1)+(1-gamma_r)*(gamma_pi*inflationq) + (1-gamma_r)*(gamma_y*(output - output(-1) + e_tech) +e_m;
        % gamma_pi=1.5579;          % Taylor rule: inflation
        % gamma_r=0.8016;           % Taylor rule: smoothing
        % gamma_y=0.2023;           % Taylor rule: output growth
        coeff_vec(1) = 0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.01; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0; coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0; coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 4*0.3;coeff_vec(24) = -4*(1-0.8016)*0.2023;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
    case 85 %RBC_DTT11
        %// Fiorella De Fiore, Pedro Teles, and Oreste Tristani (2011) ``Monetary Policy and the Financing of Firms''
        %// American Economic Journal
        
        %// Definition of Modelbase Variables in Terms of Original Model Variables //*
        %interest   = 400*r_t;                                                       //*
        %inflation  = (100/4)*(4*pi_t+4*pi_t(-1)+4*pi_t(-2)+4*pi_t(-3));             //*
        %inflationq = 400*pi_t;                                                      //*
        %output     = 100*y_t;                                                       //*
        %outputgap = 0;                                                              //*
        %//**************************************************************************
        
        %// Baseline model-specific Monetary Policy Rule
        %//- exp(r_t) + poly + 1.0025/bet*(exp(pi_t)/1.0025)^zet*exp(pol_t)
        %// Steady state inflation = 1.0025
        %// poly = 0  dummy parameter to denote the policy rule
        %// zet = 1.5 inflation response parameter 
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) =  0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
            
        
    case 86 % US_CFOP14
        % Original formulation of the policy rule:
        % R =rhoR*R(-1) + ((1-rhoR)*fp)*p + ((1-rhoR)*fy)*(gdp - gdpstar) + fdy*( (gdp - gdp(-1)) - (gdpstar - gdpstar(-1)) ) + mp;
        % Variables:
        % R is the quarterly interest rate, not annualized
        % p is quarterly inflation, not annualized
        % gdp is output
        % gdpstar is potential output
        % mp is a monetary policy shock
        % Coefficients:
        % rhoR          = 0.8600; Taylor rule interest rate smoothing
        % (1-rhoR)*fp   = 0.2954; Taylor rule reaction to inflation
        % (1-rhoR)*fy   = 0.0154; Taylor rule reaction to output gap
        % fdy           = 0.2000; Taylor rule reaction to output gap growth
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1)  = 0.86;    coeff_vec(2)  = 0;       coeff_vec(3)  = 0;  coeff_vec(4)  = 0;
        coeff_vec(5)  = 0.2954;  coeff_vec(6)  = 0;       coeff_vec(7)  = 0;  coeff_vec(8)  = 0;  coeff_vec(9)  = 0;
        coeff_vec(10) = 0;       coeff_vec(11) = 0;       coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = 0.8616;  coeff_vec(15) = -0.8;    coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0;       coeff_vec(20) = 0;       coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;       coeff_vec(24) = 0;       coeff_vec(25) = 0;  coeff_vec(26) = 0;  coeff_vec(27) = 0;
        coeff_vec(28) = 0;       coeff_vec(29) = 0;       coeff_vec(30) = 0;  coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 87 % US_JPT11
        % Original formulation of the policy rule:
        % R =rhoR*R(-1) + ((1-rhoR)*fp)*p + ((1-rhoR)*fy)*(gdp - gdpstar) + fdy*( (gdp - gdp(-1)) - (gdpstar - gdpstar(-1)) ) + mp;
        % Variables:
        % R is the quarterly interest rate, not annualized
        % p is quarterly inflation, not annualized
        % gdp is output
        % gdpstar is potential output
        % mp is a monetary policy shock
        % Coefficients:
        % rhoR          = 0.8600; Taylor rule interest rate smoothing
        % (1-rhoR)*fp   = 0.2363; Taylor rule reaction to inflation
        % (1-rhoR)*fy   = 0.0064; Taylor rule reaction to output gap
        % fdy           = 0.2110; Taylor rule reaction to output gap growth
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1)  = 0.86;    coeff_vec(2)  = 0;       coeff_vec(3)  = 0;  coeff_vec(4)  = 0;
        coeff_vec(5)  = 0.2363;  coeff_vec(6)  = 0;       coeff_vec(7)  = 0;  coeff_vec(8)  = 0;  coeff_vec(9)  = 0;
        coeff_vec(10) = 0;       coeff_vec(11) = 0;       coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = 0.8698;  coeff_vec(15) = -0.844;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0;       coeff_vec(20) = 0;       coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;       coeff_vec(24) = 0;       coeff_vec(25) = 0;  coeff_vec(26) = 0;  coeff_vec(27) = 0;
        coeff_vec(28) = 0;       coeff_vec(29) = 0;       coeff_vec(30) = 0;  coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 88 % US_CPS10
        % Reference: Inflation-Gap Persistence in the US (AEJ: Macro, 2010)
        % By Timothy Cogley, Giorgio E. Primiceri and Thomas J. Sargent
        % //**************************************************************************
        % // Definition of Modelbase Variables in Terms of Original Model Variables //*
        % interest   = 4*R;                                                         //*
        % inflation  = p+p(-1)+p(-2)+p(-3);                                         //*
        % inflationq = 4*(p-pit);   // consider inflation gap instead of inflation  //*
        % output     = y;                                                           //*
        % outputgap  = y-ystar;                                                     //*
        % //**************************************************************************
        % // Original Code for the Monetary Policy Rule in the Paper
        % R -(1-rhoR)*fp/4*p +(1-rhoR)*(fp)*pit -(1-rhoR)*fy*y +(1-rhoR)*fy*ystar = rhoR*R(-1) +(1-rhoR)*fp/4*p(-1) +(1-rhoR)*fp/4*p(-2) +(1-rhoR)*fp/4*p(-3)+Rs;
        % fp=1.784;  inflation gap parameter in the MP rule
        % fy=0.66;  output gap paramenter in the MP rule
        % rhoR=0.633;	AR 1 parament in the MP rule
        % sdr=0.069;  standard deviation of MP shock Rs
        % // Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.6330; coeff_vec(2) = 0;  coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) = 0.1637;  coeff_vec(6) =  0.1637;  coeff_vec(7) =  0.1637;  coeff_vec(8) =  0.1637; coeff_vec(9) = 0;
        coeff_vec(10) = 0;  coeff_vec(11) = 0;  coeff_vec(12) = 0;  coeff_vec(13) = 0;
        coeff_vec(14) = 0.9689;  coeff_vec(15) = 0;  coeff_vec(16) = 0;  coeff_vec(17) = 0;  coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0;  coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 89 %US_NS14
        %Monetary Policy rule uses weighted foreign and domestic values for inflation and output
        %r=0.8*r(-1)+0.2*(1.5*(nn*pi+(1-nn)*pif)+0.5*(nn*y+(1-nn)*yf)+0*(nn*g+(1-nn)*gf))+er;
        %
        %
        %
        %
        coeff_vec(1) = 0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0.2*1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0; coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0; coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.2*0.5*4;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 0; coeff_vec(33) =0 ;
    case 90 % US_DNGS15
        % Policy Rule Del Negro, Giannoni, Schorfheide 2015
        % Original formulation of the policy rule:
        %R = rho*R(-1)+(1-rho)*psi1*(pi-pist)+(1-rho)*psi2*(y-y_f)+psi3*((y-y_f)-(y(-1)-y_f(-1)))+rm;
        
        %pist = rho_pist*pist(-1)+psi_pist;
        
        % pi-pist is replaced with pi
        
        %  Definition of Modelbase Variables in Terms of Original Model Variables
        %   interest   = R*4;                                                       //*
        %   inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
        %   inflationq = 4*pi;                                                       //*
        %   outputgap  = y-y_f;                                                       //*
        %   output     = y;
        % Coefficients:
        %   rho = 0.675;       % interest rate smoothing
        %   psi1 = 1.3737;      % policy response to inflation deviation
        %   psi2 = 0.018;       % policy response to output deviation
        %   psi3 = 0.2398;       % policy response to output dynamics
        
        % Description in terms of the Modelbase general rule specification:
        
        coeff_vec(1) =  0.675; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  (1-0.675)*1.3737; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 4*((1-0.675)*0.018+0.2398); coeff_vec(15) = -4*0.2398; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 91 % US_FMS134
        % Policy Rule Del Negro, Giannoni, Schorfheide 2015
        % Original formulation of the policy rule:
        %r = rhos*r(-1) + (1-rhos)*(rhoinfl*(infl)+rhoy*(y-yf)) + rhody*((y-y(-1))+(yf(-1)-yf)) + zetar ;
        
        %pist = rho_pist*pist(-1)+psi_pist;
        
        % pi-pist is replaced with pi
        
        %  Definition of Modelbase Variables in Terms of Original Model Variables
        %   interest   = r*4;                                                       //*
        %   inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
        %   inflationq = 4*pi;                                                       //*
        %   outputgap  = y-y_f;                                                       //*
        %   output     = y;
        %   Coefficients:
        %   rho = 0.7987;       % interest rate smoothing
        %   rhoinfl = 1.5189;      % policy response to inflation deviation
        %   rhoy = 0.0075;       % policy response to output deviation
        %   rhody    = 0.2394;       % policy response to output dynamics
        
        % Description in terms of the Modelbase general rule specification:
        
        coeff_vec(1) =  0.7987; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  (1-0.7987)*1.5189; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 4*((1-0.7987)*0.0075+0.2394); coeff_vec(15) = -4*0.2394; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
    case 92 % NK_AFL15
        % Further references:
        % Angeloni, I. Faia, E. and Marco Lo Duca: ``Monetary Policy and Risk Taking''
        % In: Journal of Economic Dynamics and Control, vol. 52 Issue C, 2015, pp. 285-307
        % Definition of Modelbase Variables in Terms of Original Model Variables //*
        
        % interest     = 400*(rn - rnss);
        % inflation    = 100*(pai + pai(-1) + pai(-2) + pai(-3) - 4*PAIss);
        % inflationq   = 400*(pai - PAIss);
        % outputgap    = 100*(y - yf - (yss - steady_state(yf)));
        % output       = 100*(y - yss);
        % //**************************************************************************
        %  vP      = 1.5;         % Taylor rule: inflation
        % vY      = (0.5)/4       % Taylor rule: output deviation from
        % steady state
        coeff_vec(1) = 0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.5/4; coeff_vec(6) = 1.5/4; coeff_vec(7) = 1.5/4; coeff_vec(8) = 1.5/4; coeff_vec(9) = 0; coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.5; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0; coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
  
  case  93  % US_FGKR15
        % // J. Fernandez-Villaverde, P. Guerron-Quintana, K. Kuester, and J. Rubio-Ramirez.
        % // Fiscal volatility shocks and economic activity. American Economic Review, 105(11): 3352–84, November 2015
                
        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest     = 400*(Rt-log(Rs));
        %inflation    = ((inflt+inflt(-1)+inflt(-2)+inflt(-3))*100) - 400*log(infls);    
        %inflationq   = 400*(inflt-log(infls));
        %outputgap    = ((exp(yt)/exp(ytF))-1)*100;
        %output       = 100*(yt-log(ys));
        %fispol       = egt;
        %// **************************************************************************
        
        % Baseline model policy rule
        % exp(Rt) = Rs*(exp(Rt(-1))/Rs)^phiR*(exp(inflt)/infls)^(phips*(1-phiR))*(exp(yt)/ys)^(phiy*(1-phiR))*exp(emt) ;  
        % infls= 1.0045 ;  // inflation target (adjusted for mean ergodic inflation rate)
        % phiR = 0.7 ;     // smoothing coefficient
        % phips= 1.35 ;    // steady-state response to inflation
        % phiy = 0.25 ;    // response to output
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.7; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  1.35*(1-0.7) ; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.25*(1-0.7)*4; coeff_vec(24) =  0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
  case  94 %EA_PV15
        % Original interest rate rule
        % r = rho*r(-1) + (1-rho)*0.5*( phi_pi*pi_ea+phi_dy*(y_ea-y_ea(-1))+ r_shock; 
        % rho=.84 ; phi_pi=1.85 ; phi_dy=.15
        % We ignored that r_shock is AR(1) process
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = 4*r;                                           
        % inflation  = (pi_ea + pi_ea(-1) + pi_ea(-2) + pi_ea(-3));                          
        % inflationq = 4*pi_ea;                                                              
        % outputgap  = (y_ea - y_eafp);                                             
        % output     = y_ea; 
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.84; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.84)*1.85; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = (1-0.84)*0.15*4;coeff_vec(24) = -(1-0.84)*0.15*4;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;

case  95 % NK_CFP10
         % Original monetary policy rule (Carlstrom, Fuerst and Paustian, 2010)
         % R = 1.5*pi + 0.5*yg (For IRFs in Section 2.2)
         % Definition of Modelbase Variables in Terms of Original Model Variables
         % interest   = R*4;
         % inflation  = pi+pi(-1)+pi(-2)+pi(-3);  
         % inflationq = pi*4;
         % outputgap  = y-yf;
         % output     = y;
         % Description in terms of the Modelbase general rule specification:
         coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0;  coeff_vec(4) = 0;
         coeff_vec(5) = 1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
         coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
         coeff_vec(14) = 4*0.5; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
         coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
         coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
         coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
         coeff_vec(32) = 1; coeff_vec(33) = 0.25;
         
case  96 %NK_GM07:	

        % Goodfriend, M., B.T. McCallum. 2007. " Banking and interest raets in monetary policy analysis: A quantitative exploration".
        % Journal of Monetary Economics 54, pp. 1480-1507.
        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest = rIB*4;
        %inflation = dp+dp(-1)+dp(-2)+dp(-3);
        %inflationq = dp*4;
        %outputgap = mc*4;
        %output = c;
        %fispol = 0;

        %// **************************************************************************
        
        % Baseline model policy rule
        %rIB = (1 - mu_3) * ((1 + mu_1) * dp(+1) + mu_2 * (mc)) + mu_3 * (rIB(-1)) + eps_i;
        %mu_1 = 1.5;  
        %mu_2 = 0.5;   
        %mu_3 = 0.0;   

        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0;  coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  2.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.5; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) = 0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 

case  97 %NK_KW16: 
        % Kirchner, M., S. van Wijnbergen. 2016. " Fiscal deficits, financial fragility, and the effectiveness of government policies".
        % Journal of Monetary Economics 80, pp. 51-68.

        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest   = log(i/i_ss)*400;                                            //*
        %inflationq = log(infl/infl_ss)*400;                                            //*
        %inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
        %output     = log(Y/Y_ss)*100;                                              //*
        %outputgap  = log(Y/Y_fe)*100;                                              //*
        %fispol     = e_g;                                                           //*    
	
        %// **************************************************************************
        
        % Baseline model policy rule
        % %(i) =   (i(-1))^rho_i* (i_ss*(infl)^kappa_pi*((Y)/(Y(-1)))^(kappa_y))^(1-rho_i)*(exp(-e_i)); 
        % rho_i = 0.8;  // smoothing coefficient
        % kappa_pi = 1.5 ;     // response to inflation
        % kappa_y= 0.125 ;    // response to output 
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  0.3; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 4*0.025; coeff_vec(24) = -4*0.025; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 

case  98 %NK_MPT10: 
        % Further References:  T. Monacelli, R. Perotti, A. Trigari (2010): "Unemployment Fiscal Multiplier",
        % Journal of Monetary Economics 57, pp.531-553

        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest   = log((1+i_nom)/(1+i_nom_ss))*400;                               //*
        %inflationq = log(infl/infl_ss)*400;                                         //*
        %inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
        %output     = log(Y/Y_ss)*100;                                               //*
        %outputgap  = log(Y/Y_fe)*100;                                               //*
        %fispol     = e;                                                          //*    

        %// **************************************************************************
        
        % Baseline model policy rule
        % %1+i_nom            =   (1+i_nom(-1))^rho_i*((1+i_nom_ss)*infl^kappa_pi*(Y/Y(-1))^(kappa_y))^(1-rho_i);%*(e_i);
        % rho_i = 0;  // smoothing coefficient
        % kappa_pi = 1.5;     // response to inflation
        % kappa_y = 0.125;    // response to output 
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.125*4; coeff_vec(24) = -0.125*4; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 


case  99 % NK_PP17
         % Original monetary policy rule (De Paoli and Paustian, 2017)
         % R = 1.5*pi + 0.125*yg (Calibration in Section 4.1)
         % Definition of Modelbase Variables in Terms of Original Model Variables
         % interest   = R*4;
         % inflation  = pi+pi(-1)+pi(-2)+pi(-3);  
         % inflationq = pi*4;
         % outputgap  = y-yf;
         % output     = y;
         % Description in terms of the Modelbase general rule specification:
         coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0;  coeff_vec(4) = 0;
         coeff_vec(5) = 1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
         coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
         coeff_vec(14) = 0.125*4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
         coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
         coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
         coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
         coeff_vec(32) = 1; coeff_vec(33) = 0.25;


case  100 	%NK_PSV16 - it uses the rule from BGG99

        % Original interest rate rule
        % rn = rho*rn(-1) + S*pi(-1) + eM; 
        % rho=.9 ; S=0.11
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = 4*rn;
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);
        % inflationq = 4*pi;
        % outputgap  = y-yf;
        % output     = y;
        % fispol     = eG;
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.9; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0; coeff_vec(6) = 0.11; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;

case  101 	% NK_RA16: 	
        % Rannenberg, Ansgar (2016). "Bank Leverage Cycles and the External Finance Premium", 
        %                             Journal of Money, Credit and Banking, Vol. 48, No. 8, pp. 1569-1612

        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest   = R4;                                                              //*
        %inflationq = Pi*4;                                                           //*
        %inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
        %output     = Y;                                                               //*
        %outputgap  = Y-Y_fe;                                                          //*
        %fispol     = e_g;                                                             //*    

        %// **************************************************************************
        
        % Baseline model policy rule
        % R = (1-rho_i)*(psi_pi*Pi + psi_y*mc) + rho_i*R(-1) +e_i;
        % In the paper, the output gap was used. In the code that was provided by author and reproduces results in the paper
        % real marginal cost were used! In the replication package, mc are used. Here I use the output gap. 
	
        % rho_i= 0.8;  // smoothing coefficient
        % psi_pi = 1.5 ;     // response to inflation
        % psi_y = 0.125 ;    // response to output 
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.8; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  0.3; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.025; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) = 0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 


case  102 % NK_ST13: 	coeff_vec(1) = 0.75; coeff_vec(5) = 0.25*1.5;
        % Stracca, L. 2013. "Inside Money in General Equilibrium: Does it matter for monetary policy?".
        % Macroeconomic Dynamics 17, pp. 563-590.

        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest   = log(R/R_ss)*400;                                            //*
        %inflationq = log(pi/pi_ss)*400;                                            //*
        %inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
        %output     = log(y/y_ss)*100;                                              //*
        %outputgap  = log(y/y_fe)*100;                                              //*
        %fispol     = 0;                                                           //*    

        %// **************************************************************************
        
        % Baseline model policy rule
        % R = (1 - rho) * (1 / beta + rho_pi * (pi - 1)) + rho * R(-1) + epsilon_r ;	// Interest rate rule
        % rho = 0.75// smoothing coefficient
        % rho_pi = 0.25*1.5;     // response to inflation
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.75; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  0.25*1.5;  coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) =  0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 

case  103 	%US_AJ16: 	
        % Model file for "Financial Intermediation, Investment Dynamics, and
        % Business Cycle Fluctuations" by Andrea Ajello

        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest   = 4*( i_t-steady_state(i_t));                            //*
        %inflation  = (pi_t+pi_tm1+pi_tm2+pi_tm3) - 4*pis/100;               //*
        %inflationq = 4*(pi_t-pis/100);                                      //*
        %outputgap  = ygap_t;                                                //*
        %output     = (GDP_t-steady_state(GDP_t));                           //*
        %fispol    = eps_g 						    //*
        
        %// **************************************************************************
        
        % Baseline model policy rule
        %i_t - (rho_i*i_t(-1) + (1-rho_i)*((steady_state(r) + (pi_t + pi_t(-1)+pi_t(-2)+pi_t(-3))/4) + phi_pi*((pi_t + pi_t(-1)+pi_t(-2)+pi_t(-3))/4 - pistar) + phi_Ygap*(ygap_t) + phi_DY*(d_GDP + d_GDP(-1) + d_GDP(-2) + d_GDP(-3))/400) + interest_);

        % rho_i = 0.828;  // smoothing coefficient
        % phi_pi = 0.46 ;     // response to inflation
        % phi_Ygap = 0;    // response to output gap
        % phi_DY = 0.156 ;    // response to change in output
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.828; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = (1-0.828)/4*(1+0.46); coeff_vec(6) = (1-0.828)/4*(1+0.46); coeff_vec(7) = (1-0.828)/4*(1+0.46); coeff_vec(8) = (1-0.828)/4*(1+0.46); coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23)= (1-0.828)/400*0.156; coeff_vec(24) = 0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = -(1-0.828)/400*0.156;
        coeff_vec(28) = 0; coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 

    
case  104     %US_CFP17_endo:
        % Policy Rule From Carlstrom, Fuerst, Paustian (2017)
        % Original formulation of the policy rule:
        %r1 = 0.77*r1(-1) + (0.23)*(1.42*pin + 0.49*ygap)+mp
        %[Equation (58) in the code]
        % Variables:
        % r1 is the quarterly short-term nominal interest rate
        % pin is the quarter on quarter inflation rate 
        % ygap is the output gap
        % 
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.77; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0.3266; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.1127/4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;
        
case  105   % US_CFP17_exo: 
	    % Policy Rule From Carlstrom, Fuerst, Paustian (2017)
        % Original formulation of the policy rule:
        %r1 = 0.77*r1(-1) + (0.23)*(1.42*pin + 0.49*ygap)+mp
        %[Equation (58) in the code]
        % Variables:
        % r1 is the quarterly short-term nominal interest rate
        % pin is the quarter on quarter inflation rate 
        % ygap is the output gap
        % 
        %
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.77; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 0.3266; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.1127/4; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;

case 106  % DNGS15_SW
        % Original monetary policy rule (Del Negro et al. 2015)
        % R = rho*R(-1)+(1-rho)*psi1*(pi-pist)+(1-rho)*psi2*(y-y_f)+psi3*((y-y_f)-(y(-1)-y_f(-1))) 
        % Parameter values from Appendix Table A.2
        % psi1 = 2.0477;
        % psi2 = 0.0873;
        % psi3 = 0.2360;
        % rho = 0.8305;
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = R*4;
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);  
        % inflationq = pi*4;
        % outputgap  = y-yf;
        % output     = y;
  	    % fispol = psi_g;
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.8305; coeff_vec(2) = 0; coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) =  (1-0.8305)*2.0477; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 4*((1-0.8305)*0.0873 + 0.2360); coeff_vec(15) = -4*0.2360; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1; coeff_vec(33) = 0.25;

case 107  % DNGS15_SWpi
        % Original monetary policy rule (Del Negro et al. 2015)
        % R = rho*R(-1)+(1-rho)*psi1*(pi-pist)+(1-rho)*psi2*(y-y_f)+psi3*((y-y_f)-(y(-1)-y_f(-1))) 
        % Parameter values from Appendix Table A.2
        % psi1 = 1.9693;
        % psi2 = -0.0053;
        % psi3 = 0.2175;
        % rho = 0.7909;
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = R*4;
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);  
        % inflationq = pi*4;
        % outputgap  = y-yf;
        % output     = y;
  	    % fispol = psi_g;
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.7909; coeff_vec(2) = 0; coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) =  (1-0.7909)*1.9693; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 4*((1-0.7909)*(-0.0053)+0.2175); coeff_vec(15) = -4*0.2175; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1; coeff_vec(33) = 0.25;
        
case 108  % DNGS15_SWSP
        % Original monetary policy rule (Del Negro et al. 2015)
        % R = rho*R(-1)+(1-rho)*psi1*(pi-pist)+(1-rho)*psi2*(y-y_f)+psi3*((y-y_f)-(y(-1)-y_f(-1))) 
        % Parameter values from Appendix Table A.2
        % psi1 = 1.2632;
        % psi2 = 0.0566;
        % psi3 = 0.2460;
        % rho = 0.7627;
        % Definition of Modelbase Variables in Terms of Original Model Variables
        % interest   = R*4;
        % inflation  = pi+pi(-1)+pi(-2)+pi(-3);  
        % inflationq = pi*4;
        % outputgap  = y-yf;
        % output     = y;
  	    % fispol = psi_g;
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) = 0.7627; coeff_vec(2) = 0; coeff_vec(3) = 0;  coeff_vec(4) = 0;
        coeff_vec(5) =  (1-0.7627)*1.2632; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 4*((1-0.7627)*0.0566    +0.2460); coeff_vec(15) = -4*0.2460     ; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1; coeff_vec(33) = 0.25;

case  112 % US_LWY13
        % // Eric M. Leeper, Todd B. Walker and Shu-Chun Susan Yang.
        % // Fiscal Foresight and Information Flows. Econometrica, Vol. 81, No. 3 (May 2013), pp. 1115-1145

        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest   = 4*R;                                                        //*
        %inflation  = 4*(pi/4+pi(-1)/4+pi(-2)/4+pi(-3)/4);                        //*
        %inflationq = 4*pi;                                                       //*
        %outputgap  = ygap;                                                    //*
        %output     = y;                                                          //*
        %fispol   = ug;                                                           //*
        
        %// **************************************************************************
        
        % Baseline model policy rule
        % R + (-(1-rhor)*phipi - phipid)*pi +(-(1-rhor)*phiy - phiyd)*y+phia*ua -um=-phipid*pi(-1) -phiyd*y(-1)+rhor*R(-1);;  
        % rhor=0.864376848;  // smoothing coefficient
        % phipi = 2.221117197 ;     // response to inflation
        % phiy= 0.038241257 ;    // response to output 
        % phiyd = 0.173996187 ;    // response to change in output
        % phipid = 0;               // response to change in inflation
        % phia = 0;                //response to technology shock
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0.864376848; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  0.301234915; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0.179182587*4; coeff_vec(24) =  -0.173996187*4; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 

case  113 	% Ricardo Reis
    	% A Sticky-Information General-Equilibrium Model for Policy Analysis.
        % In: Monetary Policy under Uncertainty and Learning, edited by K. Schmidt-Heubel, C. Walsh and N. Loayza, Central Bank of Chile, Santiago, 2009

        %Definition of Modelbase Variables in Terms of Original Model Variables
        %interest   = 4*i;                                                        //*
        %inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
        %inflationq = 4*pi;                                                       //*
        %outputgap  = x;                                                          //*
        %output     = y;                                                          //*
        %fispol     = e_g;                                                           //*
        
        %// **************************************************************************
        
        % Baseline model policy rule
        %i = phi_y*(y-yclas) + phi_pi*pi - eps;
        % phi_pi = 1.17350494813421;     // response to inflation
        % phi_y= 0.0625290108287302;    // response to output gap 
        
        % Description in terms of the Modelbase general rule specification:
        coeff_vec(1) =  0;  coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) =  1.17350494813421; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) = 0.0625290108287302; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0; coeff_vec(24) = 0; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0; coeff_vec(29) = 0; coeff_vec(30) = 0;coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25; 

case  114 	% NK_GLSV07

        % Original monetary policy rule (Gali, J., Lopez-Salido, J.D. and Valles, J., 2007)
        % r = 1.5*pi; inflation-based Taylor rule in page 18
        % Definition of Modelbase Variables in Terms of Original Model Variables
        %interest   = 4*r;                                           
        %inflation  = (pi + pi(-1) + pi(-2) + pi(-3));                          
        %inflationq = 4*pi;                                                              
        %outputgap  = (y - yf);                                             
        %output     = y; 
        %fispol     = e_g; 

        coeff_vec(1) =  0; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
        coeff_vec(5) = 1.5; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0.; coeff_vec(9) = 0;
        coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
        coeff_vec(14) =0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
        coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
        coeff_vec(23) = 0;coeff_vec(24) = 0;coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
        coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0; coeff_vec(31) = 0;
        coeff_vec(32) = 1;
        coeff_vec(33) = 0.25;

case 115  % US_HL16
        % Hollander, H. and G. Liu, 2016 : "The equity price channel in a New-Keynesian DSGE
        % model with financial frictions and banking"
        % In: Economic Modelling (2016)
        % Original formulation of the policy rule
        % i_d = kappa_i*i_d(-1) + kappa_pi*(1 - kappa_i)*pi + kappa_y*(1 - kappa_i)*(y - y(-1)) + xi_i
  
        % Definition of Modelbase Variables in Terms of Orginal Model Variables
        %interest   = 4*i_d;                                           
        %inflation  = (pi + pi(-1) + pi(-2) + pi(-3));                          
        %inflationq = 4*pi;                                                              
        %outputgap  = (y - yf);                                             
        %output     = y;
                                                             
        
        % Description in terms of the Modelbase general rule specification:
          coeff_vec(1) = 0.5314; coeff_vec(2) = 0; coeff_vec(3) = 0; coeff_vec(4) = 0;
          coeff_vec(5) = 0.9823; coeff_vec(6) = 0; coeff_vec(7) = 0; coeff_vec(8) = 0; coeff_vec(9) = 0;
          coeff_vec(10) = 0; coeff_vec(11) = 0; coeff_vec(12) = 0; coeff_vec(13) = 0;
          coeff_vec(14) = 0; coeff_vec(15) = 0; coeff_vec(16) = 0; coeff_vec(17) = 0; coeff_vec(18) = 0;
          coeff_vec(19) = 0; coeff_vec(20) = 0; coeff_vec(21) = 0; coeff_vec(22) = 0;
          coeff_vec(23) = 0.1306/4; coeff_vec(24) = -0.1306/4; coeff_vec(25) = 0;coeff_vec(26) = 0;coeff_vec(27) = 0;
          coeff_vec(28) = 0;coeff_vec(29) = 0;coeff_vec(30) = 0;coeff_vec(31) = 0;
          coeff_vec(32) = 1;
          coeff_vec(33) = 0.25;
end