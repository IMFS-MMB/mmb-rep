function param=calib(year)
%year=2012;
nbeta   = 1.0276^(-0.25);
sigma   = 7;%mup/(mup-1);

%nbeta   = 0.99;
%sigma   = 4.167;

tau     = 0.0229;
etss    = 0.0492/4;
oms     = exp(0.0226/4);%exp(0.0278/4);
omr     = exp(etss);
kpss    = 0.12;
kappa   = 0.10;
thh     = 3.409;    % From Karadi and Gertler (2009)
psilss  = log(oms)-tau*kappa/(1-tau);
failure = 0.0094;
chi     = 0.276;    % From Karadi and Gertler (2009)
xi      = 0.779;    % From Karadi and Gertler (2009)
mup     = sigma/(sigma-1);
dpss    = 1;
nu      = 0.33;%1-mup*whsy;
delta   = 0.025;
rz      = 0.966230; % Estimated using Fernald TFP_util 1993Q1-2012Q4
sez     = 0.006799;
rp      = 0.677908;  % Estimated using spread 1993Q1-2007Q3
sep     = 3.573303779883895e-04;
switch year
    case 2012
        rt      = 0.904743; % Estimated using Gilchrist Jaracek (2012) spread
        set     = 0.001456; % 1993Q1-2012Q4
    case 2007
        rt      = 0.905011; % 1993Q1-2007.75;
        set     = 6.014478243327080e-04;
end
psiss   = 1/mup;
Rdss    = dpss/nbeta;
Rsss    = oms*Rdss;
Rrss    = omr*Rsss;
phiss   = fcsolve(@calibgam,0.01,[],[tau omr psilss kpss],failure);
mf      = log((1-phiss)/phiss);
gammass = phiss*((1-tau)*psilss+kpss)/((1-phiss)*(1-tau+tau*kpss)*(omr-1)+(1-tau)*(1-phiss)*psilss*omr-phiss*kpss);
ksy     = nu*nbeta/(mup*(oms-nbeta*(1-delta)));
isy     = delta*ksy;
csy     = 1-(delta+psilss)*ksy;
hss     = ((1-nu)/(mup*csy*thh))^(1/(1+chi)); 
yss     = ksy^(nu/(1-nu))*hss;

param   = [nbeta chi thh nu delta sigma mup xi psiss dpss tau etss kpss psilss phiss gammass oms omr rz rt rp sez set sep];
