%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute the steady state.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2013 Benjamin K. Johannsen, Lawrence J. Christiano
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or (at
% your option) any later version.
%
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see http://www.gnu.org/licenses/.
function [ys,check]=US_CMR14_rep_steadystate(ys,exe)
% compute s.s.
global M_ options_
check = 0;

% Here we load the values of the deep parameters in a loop.
Np = M_.param_nbr;
for i = 1:Np
    paramname = deblank(M_.param_names(i,:));
    eval([ paramname ' = M_.params(' int2str(i) ');']);
end

%determine whether we're looking for the steady state of the cee or of the
%cmr model
%cee=0;
%if exist('gamma_p') == 0
%    cee=1;
%end

iotaw2   = 1-iotaw_p;
iota2    = 1 - iota_p;
infl     = pibar_p;
muup     = muup_p;
lambdaf  = lambdaf_p;
epsil    = epsil_p;
zetac    = zetac_p;
zetai    = zetai_p;
term     = term_p; 
muzstar  = muzstar_p;
%if cee == 0
gamma    = gamma_p;
xi8      = 1;
xi7      = 1;
xi6      = 1;
xi5      = 1;
xi4      = 1;
xi3      = 1;
xi2      = 1;
xi1      = 1;
xi0      = 1;
log_xi0=log(xi0);
log_xi1=log(xi1);
log_xi2=log(xi2);
log_xi3=log(xi3);
log_xi4=log(xi4);
log_xi5=log(xi5);
log_xi6=log(xi6);
log_xi7=log(xi7);
log_xi8=log(xi8);
%end
u        = 1;
uf       = u;
pi       = pibar_p;
pitarget = pibar_p;
rL       = muzstar_p / beta_p;
rLf      = rL;
% phi_p is set to a value that implies zero steady state profits.
% by setting phi_p=0, you trigger the steadystate.m into computing phi
phi_p = 0;

try
    
    %if cee == 1
    %    Fomegabar_p=[];mu_p=[];gamma_p=[];we_p=[];bigtheta_p=[];
    %end
    
    [rk,n,kbar,h,i,wtilde,d,c,lambdaz,yz,sigma,omegabar,phi,s,pitild,pstar,piw, ...
        pitildw,wstar,wplus,Rk,Re,Fp,Kp,Fw,Kw,uzc,q,Gamma,Gam_muG,g,y] = nobanks_ss1(lambdaf_p,infl, ...
        muzstar_p,beta_p,delta_p,Fomegabar_p,mu_p,alpha_p,gamma_p,sigmaL_p, ...
        psiL_p,lambdaw_p,we_p,bigtheta_p,b_p,phi_p, ...
        muup_p,tauk_p,upsil_p,iota_p,iota2,pibar_p,xip_p,iotaw_p,iotaw2, ...
        xiw_p,epsil_p,etag_p,zeta_p,zetac_p,taul_p,psik_p,psil_p,tauc_p,taud_p);
    
    [rkf,nf,kbarf,hf,i_f,wtildef,df,cf,lambdazf,yzf,sigmaf,omegabarf,phif,sf,pitildf,pstarf,piwf, ...
        pitildwf,wstarf,wplusf,Rkf,Ref,Fpf,Kpf,Fwf,Kwf,uzcf,qf,Gammaf,Gam_muGf,gf,yf] = nobanks_ss1(lambdaf_p,infl, ...
        muzstar_p,beta_p,delta_p,Fomegabar_p,mu_p,alpha_p,gamma_p,sigmaL_p, ...
        psiL_p,lambdaw_p,we_p,bigtheta_p,b_p,phi_p, ...
        muup_p,tauk_p,upsil_p,iota_p,iota2,pibar_p,0,iotaw_p,iotaw2, ...%xip_p
        0,epsil_p,etag_p,zeta_p,zetac_p,taul_p,psik_p,psil_p,tauc_p,taud_p);%xiw_p
    log_zetac=log(zetac);
    log_lambdaz=log(lambdaz);
    log_term=log(term);
    log_pi=log(pi);
    log_muzstar=log(muzstar);
catch
    
    ys=[];
    error('fatal (cmr_steadystate) failed to compute a steady state ')
    check=1;
    return;
    
end 
if wtilde <0 | i <0 | kbar <0 | c<0 | uzc<0 | lambdaz<0
    error('fatal (steadystate) w or i or k or y or c or uzc<0')
end

RL = Re; RLf=Ref;
networth_obs    = 1;
inflation_obs   = 1;
hours_obs       = 1;
credit_obs      = 1;
gdp_obs         = 1;
wage_obs        = 1;
investment_obs  = 1;
consumption_obs = 1;
premium_obs     = 1;
Spread1_obs     = 1;
Re_obs          = 1;
pinvest_obs     = 1;
RealRe_obs      = 1; 
G          = (normcdf((log(omegabar) + sigma^2 / 2) / sigma - sigma));
Gf         = (normcdf((log(omegabarf) + sigma^2 / 2) / sigma - sigma));
H          = (normcdf((log(omegabar) + sigma^2 / 2) / sigma - 2 * sigma));
Hf         = (normcdf((log(omegabarf) + sigma^2 / 2) / sigma - 2 * sigma));
bankruptcy = (normcdf(((log(omegabar) + sigma^2 / 2) / sigma)));
bankruptcyf= (normcdf(((log(omegabarf) + sigma^2 / 2) / sigma)));
F          = bankruptcy;
Ff         = bankruptcyf; 
volEquity = (1 + Rk ) * q  * kbar  / n  * sqrt( (exp(sigma^2)/(1-F )*(1-H ) - ((1-G )/(1-F ))^2) );
volEquityf= (1 + Rkf) * qf * kbarf / nf * sqrt( (exp(sigma^2)/(1-Ff)*(1-Hf) - ((1-Gf)/(1-Ff))^2) );


%MMB varaibles
interest   = 0;
inflation  = 0;
inflationq = 0;                                                     
output     = 0;                                                       
outputgap  = 0;

% Define the steady state values of the endogenous variables of the model.
Ne = M_.orig_endo_nbr;
ys = zeros(Ne,1);
endoleadcount = 2;
nonauxcount = 0;
for indexvar = 1:Ne
    varname = deblank(M_.endo_names(indexvar,:));
    eval(['ys(' int2str(indexvar) ') = ' varname ';']);
end 
byte_code = 0;
ys2 = add_auxiliary_variables_to_steadystate(ys(1:M_.orig_endo_nbr), ...
    M_.aux_vars, M_.fname, ...
    zeros(M_.exo_nbr,1), [], ...
    M_.params, byte_code);
ys = ys2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [rk,n,k,h,I,w,d,c,lambdaz,yz,sigma,omegabar,phi,mc,pitild,pstar,piw, ...
    pitildw,wstar,wplus,Rk,R,Fp,Kp,Fw,Kw,ucz,q,Gamma,Gam_muG,g,y] = nobanks_ss1(lambdaf, ...
    infl,muz,beta,delta,Fomegabar,mu,alpha,gam,sigmaL,psiL,lambdaw,we,bigtheta,b,phi, ...
    muup,tauk,upsil,iota1,iota2,pibar,xip,iotaw1,iotaw2,xiw,epsil,etag,zeta,zetac,taul,psik,psil,tauc,taud)

% If phi = 0, we are assuming infl=pibar.
% We use sw=1 as a flag to skip some redundant computations
% sw must be unity in case we're working with the cee model because we
% exploited the restriction on phi in computing the steady state.
sw = 0;
if phi == 0;
    sw = 1;
    lambdafs = 1; %in order to solve for phi we need to eliminate the subsidies (given the way phi is solved for, we would get otherwise that phi=0)
    lambdaws = 1;
end
R = (infl * muz / beta - 1) / (1 - taud);

%gam is empty, when it's the cee model whose steady state we seek.
if ~isempty(gam)
    % Try an initial value.
    % If it does not find a solution it will bracket the solution
    rrk = 0.054; %0.061 %EA=0.04; US=0.054;
    
    try
        opt = optimset('diagnostics', 'on', ...
            'TolX', 1e-16, 'TolFun', 1e-16);                                       %
        [rkopt, fval, exitflag] = fzero(@nobanks_ss2, rrk, opt, phi, ...
            Fomegabar, mu, gam, delta, infl, ...
            R, muz, lambdaf, bigtheta, we, ...
            beta, psiL, sigmaL, lambdaw, ...
            alpha, b, muup, tauk, upsil, ...
            iota1, iota2, pibar, xip, ...
            iotaw1, iotaw2, xiw, epsil, ...
            sw, lambdafs, lambdaws, ...
            etag, tauc, taul);
        if abs(fval) > .1e-9 || abs(imag(rkopt)) > .1e-10 || exitflag <= 0
            error('(nobanks_ss1) failed to find steady state on first try, will look more closely now')
        end
    catch
        lasterr
        rkk = ((upsil / infl * (R + 1 - tauk * delta) - 1 + delta) / (1 - tauk)) + .000001:.001:0.08;
        rk = rkk(1);
        [ffold] = nobanks_ss2(rk, phi, Fomegabar, mu, gam, delta, infl, R, ...
            muz, lambdaf, bigtheta, we, beta, psiL, ...
            sigmaL, lambdaw, alpha, b, muup, tauk, upsil, ...
            iota1, iota2, pibar, xip, iotaw1, iotaw2, xiw,...
            epsil, sw, lambdafs, lambdaws, etag, tauc, taul);
        ix = 0;
        fx(1) = ffold;
        for ii = 2:length(rkk)
            rk = rkk(ii);
            [ff] = nobanks_ss2(rk, phi, Fomegabar, mu, gam, delta, infl, R, ...
                muz, lambdaf, bigtheta, we, beta, psiL, ...
                sigmaL, lambdaw, alpha, b, muup, tauk, upsil,...
                iota1, iota2, pibar, xip, iotaw1, iotaw2, ...
                xiw, epsil, sw, lambdafs, lambdaws, etag, ...
                tauc, taul);
            if ff > 0 & ffold < 0
                ix = ix + 1;
                I(ix) = ii;
            end
            ffold = ff;
            fx(ii) = ff;
        end
        
        if ix > 1
            error('fatal (nobanks_ss1) found more than one steady state')
        end
        if ix == 0
            error('fatal (nobanks_ss1) failed to bracket a steady state')
        end
        rk1 = rkk(I(ix) - 1);
        rk2 = rkk(I(ix));
        rrk = [rk1, rk2];
        [rkopt, fval, exitflag] = fzero(@nobanks_ss2, rrk, opt, phi, ...
            Fomegabar, mu, gam, delta, infl, ...
            R, muz, lambdaf, bigtheta, we, beta,...
            psiL, sigmaL, lambdaw, alpha, b, ...
            muup, tauk, upsil, iota1, iota2, ...
            pibar, xip, iotaw1, iotaw2, xiw,  ...
            epsil, sw, lambdafs, lambdaws, etag,...
            tauc, taul);
        if abs(fval) > .1e-9 || abs(imag(rkopt))>.1e-10 || exitflag <= 0
            error('fatal (nobanks_ss1) failed to find steady state')
        end
    end
    
    rk = rkopt;
    
else
    
    sw=1;
    rk=(upsil*(R-tauk*delta+1)/infl -(1-delta))/(1-tauk);
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[ff, n, k, h, I, w, d, c, lambdaz, yz, sigma, omegabar, phi, mc, pitild,...
    pstar, piw, pitildw, wstar, wplus, Rk, q, Gamma, Gam_muG] = ...
    nobanks_ss2(rk, phi, Fomegabar, mu, gam, delta, infl, R, muz, ...
    lambdaf, bigtheta, we, beta, psiL, sigmaL, lambdaw, ...
    alpha, b, muup, tauk, upsil, iota1, iota2, pibar, xip, ...
    iotaw1, iotaw2, xiw, epsil, sw, lambdafs, lambdaws, ...
    etag, tauc, taul);

if abs(ff) > 10
    error(' fatal (nobanks_ss2) failed to compute a steady state')
end

[Fp, Kp, Fw, Kw] = nobanks_ss4(lambdaz, yz, pitild, infl, lambdaf, beta,...
    xip, mc, zetac, wstar, lambdaw, h, taul, ...
    muz, sigmaL, xiw, pitildw, piw, zeta, ...
    lambdafs, lambdaws);

x   = infl * muz - 1;
ucz = (muz - b * beta) * zetac / (c * (muz - b));
g   = etag * (c + I) / (1 - etag);
y   = c + I + g;

% verify the steady state equations are satisfied.
[err] = check_nobanks(mc, rk, w, R, h, k, wstar, Rk, q, infl, piw, ...
    ucz, I, pstar, lambdaz, yz, Fp, Kp, g, c, Fw, Kw, ...
    wplus, pitild, pitildw, alpha, psik, psil, epsil, ...
    muz, upsil, lambdaw, lambdaf, muup, tauk, delta, ...
    b, beta, zetac, x, xip, xiw, tauc, taul, sigmaL, ...
    zeta, phi, Gamma, omegabar, Fomegabar, mu, gam, ...
    we, n, bigtheta, Gam_muG, psiL, sw, lambdafs, ...
    lambdaws, taud);

if max(abs(err)) > .1e-9
    error('fatal (nobanks_ss1) failed to find a steady state for cee&bgg model')
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ff,n,k,h,I,w,d,c,lambdaz,yz,sigma,omegabar,phi,mc,pitild,pstar,piw, ...
    pitildw,wstar,wplus,Rk,q,Gamma,Gam_muG] = nobanks_ss2(rk,phi, ...
    Fomegabar,mu,gam,delta,infl,R,muz,lambdaf,bigtheta,we,beta,psiL,sigmaL, ...
    lambdaw,alpha,b,muup,tauk,upsil,iota1,iota2,pibar,xip,iotaw1,iotaw2,xiw,epsil,sw,lambdafs,lambdaws,etag, ...
    tauc,taul)

if sw ~= 1
    [pitild,pstar,piw,pitildw,wstar,wplus,mc] = nobanks_ss3(infl, ...
        muup,muz,beta,tauk,delta,upsil,iota1,iota2,pibar, ...
        xip,lambdaf,iotaw1,iotaw2,xiw,lambdaw,sigmaL,alpha,epsil,lambdafs);
else %when sw=1, we are computing steady state for the case infl=pibar, so we skip computations above
    infl    = pibar;
    pitild  = infl;
    pstar   = 1;
    piw     = muz*infl;
    pitildw = infl;
    wstar   = 1;
    wplus   = 1;
    mc      = lambdafs/lambdaf;
end

wwstar=(wstar^(lambdaw/(lambdaw-1)));
hk=(1/(muz*upsil))*(1/wwstar)*(rk/(mc*alpha))^(1/(1-alpha));

if ~isempty(gam)
    
    Rk =(((1-tauk)*rk+(1-delta))/upsil)*infl+tauk*delta-1;
    s=(1+Rk)/(1+R);
    [sigma,omegabar,Gamma,Gam_muG,ix] = getomega(s,Fomegabar,mu);
    
else
    
    ix=0;
    
end

q=1;

if ix == 0
    if ~isempty(gam)
        kn = 1/(1-s*Gam_muG);
        G  = Gamma-omegabar*(1-Fomegabar);
        n  = we/( 1 - (gam/(infl*muz))*( Rk - R - mu*G*(1+Rk) )*kn - gam*((1+R)/(infl*muz)) );
        k  = kn*n;
        h  = hk*k;
        I  = k*(1-(1-delta)/(muz*upsil));
        d  = mu*G*(1+Rk)*k/(infl*muz);
        if sw == 1
            phi=((k/(upsil*muz))^alpha)*(h^(1-alpha))*(1-lambdafs/lambdaf);
        end
        %it looks like the following is incorrect....pstar probably should multiply
        %everything, including phi.
        yz =(pstar^(lambdaf/(lambdaf-1))) * ((k/(muz*upsil))^alpha) * (wwstar*h)^(1-alpha) - phi;
        c  = (1-etag)*(yz - bigtheta*((1-gam)/gam)*(n-we) - d)-I;
        lambdaz = ((muz-b*beta)/(c*(muz-b)))/(1+tauc);
    else
        yzh = (lambdafs/lambdaf)*((1/(hk*muz*upsil))^alpha);
        Ih  = (1-(1-delta)/(muz*upsil))/hk;
        ch  = (1-etag)*yzh-Ih;
        lambdazh = ((muz-b*beta)/(ch*(muz-b)))/(1+tauc);
    end
    f0 = 1-xiw*((pitildw/infl)^(1/(1-lambdaw)));
    ffnum = 1-beta*xiw*((pitildw/infl)^(1/(1-lambdaw)));
    ffden = 1-beta*xiw*((pitildw/infl)^((1+sigmaL)*lambdaw/(1-lambdaw)));
    f1 = (f0/(1-xiw))^(lambdaw*(1+sigmaL)-1);
    W = (wwstar^sigmaL)*f1*ffnum/ffden;
    w  = mc * (1-alpha) * ((wwstar*hk*muz*upsil)^(-alpha)) ;
    if ~isempty(gam)
        hh = (lambdaz*(1-taul)*w/(W*lambdaw/lambdaws*psiL))^(1/sigmaL);
    else
        h = (lambdazh*(1-taul)*w/(W*lambdaw/lambdaws*psiL))^(1/(1+sigmaL));
        yz=yzh*h;
        I=Ih*h;
        c=ch*h;
        k=h/hk;
        hh=h;
        sigma=[];
        Gamma=[];Gam_muG=[];omegabar=[];n=[];d=[];
        Rk=R;
        phi=((k/(upsil*muz))^alpha)*(h^(1-alpha))*(1-lambdafs/lambdaf);
        lambdaz=lambdazh/h;
        n=0.2;
    end
    if n > 0 && k > 0 && h > 0 && I > 0 && w > 0 && c > 0 && hh > 0
        ff=h-hh;
    else
        ff=10000;
    end
else
    ff=10000;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [pitild,pstar,piw,pitildw,wstar,wplus,s] = nobanks_ss3(piss, ...
    muup,muzstar,beta,tauk,delta,upsil,iota1,iota2,pibar, ...
    xip,lambdaf,iotaw1,iotaw2,xiw,lambdaw,sigmaL,alpha,epsil,lambdafs)

pitild=piss^(iota1+iota2)*(pibar^(1-(iota1+iota2)));

aa=  ( 1 - xip * ((pitild/piss)^(1/(1-lambdaf))) )/( 1 - xip );

bb = 1 - xip*((pitild/piss)^(lambdaf/(1-lambdaf)));

pstar=( (1-xip)*(aa^lambdaf) / bb )^((1-lambdaf)/lambdaf);

piw=muzstar*piss;

pitildw= (piss^(iotaw1+iotaw2)) * (pibar^(1-(iotaw1+iotaw2))) ;

bb=  ( 1 - xiw * ((pitildw*muzstar/piw)^(1/(1-lambdaw))) )/( 1 - xiw );

wstar=( (1-xiw)*(bb^lambdaw) / ( 1 - xiw * ( (pitildw*muzstar/piw)^(lambdaw/(1-lambdaw)) ) ) )^((1-lambdaw)/lambdaw);

wplus=( (1-xiw)*(bb^(lambdaw*(1+sigmaL))) ...
    / ( 1 - xiw * ( (pitildw*muzstar/piw)^(lambdaw*(1+sigmaL)/(1-lambdaw)) ) ) )^((1-lambdaw)/(lambdaw*(1+sigmaL)));

a1 = 1 - ((pitild/piss)^(lambdaf/(1-lambdaf)))*beta*xip;
a2 = 1 - ((pitild/piss)^(1/(1-lambdaf)))*beta*xip;
a3 = 1 - ((pitild/piss)^(1/(1-lambdaf)))*xip;

s = (lambdafs/lambdaf) * (a1/a2) * ((a3/(1-xip))^(1-lambdaf));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Fp,Kp,Fw,Kw] = nobanks_ss4(lambdaz,yz,pitild,piss,lambdaf,beta,xip,s,zetac, ...
    wstar,lambdaw,L,taul,muzstar,sigmaL,xiw,pitildw,piw,zeta,lambdafs,lambdaws) 
Fp=lambdaz*yz/(1-(pitild/piss)^(1/(1-lambdaf))*beta*xip);
Kp=lambdaz*yz*lambdaf/lambdafs*s/(1 - (pitild/piss)^(lambdaf/(1-lambdaf))*beta*xip);
Fw=zetac*wstar^(lambdaw/(lambdaw-1))*L*(1-taul)*lambdaz*lambdaws/lambdaw;
Fw=Fw/(1-beta*xiw*(muzstar*pitildw/piw)^(lambdaw/(1-lambdaw))*pitildw/piss);
Kw=(wstar^(lambdaw/(lambdaw-1))*L)^(1+sigmaL)*zeta*zetac;
Kw=Kw/(1-beta*xiw*(pitildw*muzstar/piw)^(lambdaw*(1+sigmaL)/(1-lambdaw))); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [err] = check_nobanks(mc,rk,w,R,h,k,wstar,Rk,q,infl, ...
    piw,ucz,I,pstar,lambdaz,yz,Fp,Kp,g,c,Fw,Kw,wplus,pitild,pitildw, ...
    alpha,psik,psil,epsil,muz,upsil,lambdaw,lambdaf,muup,tauk,delta, ...
    b,beta,zetac,x,xip,xiw,tauc,taul,sigmaL,zeta,phi,Gamma,omegabar, ...
    Fomegabar,mu,gam,we,n,bigtheta,Gam_muG,psiL,sw,lambdafs,lambdaws,taud)

%these are checks on equations that are also in the cee model
[err] = check_nobanks1(mc,rk,w,R,h,k,wstar,Rk,q,infl, ...
    piw,ucz,I,pstar,lambdaz,yz,Fp,Kp,g,c,Fw,Kw,wplus,pitild,pitildw, ...
    alpha,psik,psil,epsil,muz,upsil,lambdaw,lambdaf,muup,tauk,delta, ...
    b,beta,zetac,x,xip,xiw,tauc,taul,sigmaL,zeta,phi,lambdafs,lambdaws,taud);

%these are checks that reflect the presence of the equations pertaining to the entrepreneurs

%rate of return on capital
err(11)=Rk-infl/upsil*((1-tauk)*rk+(1-delta)*q)/q  -tauk*delta + 1;
%resource constraint:
if ~isempty(gam)
    
    G=Gamma-omegabar*(1-Fomegabar);
    d=mu*G*(1+Rk)*q*k/(muz*infl);
    err(17)=d+c+I+bigtheta*((1-gam)/gam)*(n-we)-yz+g;
    %zero profit condition on banks
    err(22)=Gam_muG-((1+R)/(1+Rk))*(1-n/(q*k));
    %law of motion of net worth
    err(23)=n-(gam/(infl*muz))*(Rk-R-mu*G*(1+Rk))*k*q-we-gam*(1+R)*n/(infl*muz);
    if sw == 0;%in this case, the zero profit condition on intermediate firms does not hold in steady state
        err(21)=0;
    end
    
else
    
    err(17)=c+I-yz+g;
    
end

err(24)=((1-xiw*(pitildw*muz/piw)^(1/(1-lambdaw)))/(1-xiw))^(1-lambdaw*(1+sigmaL))*w*Fw/psiL-Kw;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [err] = check_nobanks1(s,rk,wtilde,R,L,kbar,wstar,Rk,q,piss, ...
    piw,uzc,inv,pstar,lambdaz,yz,Fp,Kp,g,c,Fw,Kw,wplus,pitild,pitildw, ...
    alpha,psik,psil,epsil,muzstar,upsil,lambdaw,lambdaf,muup,tauk,delta, ...
    b,beta,zetac,x,xip,xiw,tauc,taul,sigmaL,zeta,phi,lambdafs,lambdaws,taud)

%as discussed in the manuscript, there are 21 equations that are set to
%zero in the steady state. One of them, eq5, is used to determine the
%derivative of the utilization cost function, and is not checked below.
%eq2:
err(1)=s-((1/(1-alpha))^(1-alpha))*((1/alpha)^alpha)*((rk*(1+psik*R))^alpha)*((wtilde*(1+psil*R))^(1-alpha))/epsil;
%eq3:
err(2) = s - rk*(1+psik*R)/(alpha*epsil*( ( upsil*muzstar*(wstar^(lambdaw/(lambdaw-1))) * L/kbar )^(1-alpha) ) );
%eq4:
err(3) = q - 1/muup;
%eq6:
err(4) = Rk - (((1-tauk)*rk + (1-delta)*q)*piss/(upsil*q)) - tauk*delta + 1;
%eq14:
err(5) = uzc - (1/c)*(muzstar-b*beta)*zetac/(muzstar-b);

%eq17
err(7)=1+(1-taud)*R - piss*muzstar/beta;

err(8)=uzc - (1+tauc)*zetac*lambdaz;
%eq21
err(9)=kbar-(1-delta)*kbar/(muzstar*upsil)-inv;
%eq22
err(10)=piss-(1+x)/muzstar;
%eq24
err(11)=Rk-piss*muzstar/beta+1;
%eq31
err(13)=pstar-((1-xip)*( (1 - xip * ((pitild/piss)^(1/(1-lambdaf))))/(1-xip))^lambdaf + ...
    xip*(pitild*pstar/piss)^(lambdaf/(1-lambdaf)))^((1-lambdaf)/lambdaf);
%eq32
www= (1-xiw*(( (pitildw/piw)*muzstar )^(1/(1-lambdaw))))/(1-xiw);
err(14)=wstar-( (1-xiw)*www^lambdaw + xiw*( (pitildw/piw) * muzstar*wstar)^(lambdaw/(1-lambdaw)) )^((1-lambdaw)/lambdaw);
%eq33
err(15)=lambdaz*yz + (pitild/piss)^(1/(1-lambdaf))*beta*xip*Fp - Fp;
%eq34
err(16)=lambdaf/lambdafs*lambdaz*yz*s+beta*xip*((pitild/piss)^(lambdaf/(1-lambdaf)))*Kp-Kp;
%eq20
err(17)=g+c+inv/muup-yz;
%eq35
err(18)=zetac*wstar^(lambdaw/(lambdaw-1))*L*(1-taul)*lambdaz*lambdaws/lambdaw + beta*xiw*muzstar^(lambdaw/(1-lambdaw)) ...
    *piw^(lambdaw/(lambdaw-1))*pitildw^(1/(1-lambdaw))*Fw/piss - Fw;
%eq36
err(19)=(wstar^(lambdaw/(lambdaw-1))*L)^(1+sigmaL)*zetac*zeta ...
    + beta*xiw*(pitildw*muzstar/piw)^(lambdaw*(1+sigmaL)/(1-lambdaw))*Kw-Kw;
%eq37
wx=(1-xiw*(pitildw*muzstar/piw)^(1/(1-lambdaw)))/(1-xiw);
err(20)=wplus-((1-xiw)*wx^(lambdaw*(1+sigmaL)) + xiw*(pitildw*muzstar*wplus/piw)^(lambdaw*(1+sigmaL)/(1-lambdaw)))^((1-lambdaw)/(lambdaw*(1+sigmaL)));
%check on phi
err(21)=yz-s*(yz*(pstar^(lambdaf/(1-lambdaf)))+phi);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [sigma,omegabar,Gamma,Gam_muG,ixx] = getomega(s,Fomegabar,mu)

ixx=0;
%equation aa5
oom=[.0000001:.1:.99];

ij=0;
omega=oom(1);
[ff(1),ix] = findomega(omega,s,Fomegabar,mu);
for ii = 2:length(oom)
    omega=oom(ii);
    [ff(ii),ix] = findomega(omega,s,Fomegabar,mu);
    
    if ff(ii)*ff(ii-1) < 0 & ix == 0
        ij=ij+1;
        II(ij)=ii;
    end
    
end

if ij > 1
    ixx=2;
    %disp('(getomega) multiple solutions to eq. aa5')
    sigma=[];
    omegabar=[];
    Gamma=[];
    Gam_muG=[];
    return
end
if ij < 1
    ixx=1;
    %disp('(getomega) no solution to eq. aa5')
    sigma=[];
    omegabar=[];
    Gamma=[];
    Gam_muG=[];
    return
end
omega1=oom(II(1)-1);
omega2=oom(II(1));

opt=optimset('diagnostics','on','TolX',1e-16,'TolFun',1e-16);
[omegabar,fval,exitflag,output] =   fzero(@findomega,[omega1,omega2],opt,s,Fomegabar,mu);
if abs(fval ) > .1e-9 | abs(imag(omega))>.1e-10 | exitflag <= 0
    ix(4)=1;
    error('fatal (getomega) failed to find omega')
end
[fff,ix,Gamma,Gam_muG] = findomega(omegabar,s,Fomegabar,mu);
[sigma] = ffsigma(omegabar,Fomegabar);
if ix ~= 0
    ixx==3;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ff,ix,Gamma,Gam_muG] = findomega(omega,s,Fomegabar,mu)

if s<=1,error('(findomega) s must be larger than 1'),end

sigma   =   ffsigma(omega,Fomegabar);

[ff,ix,Gamma,Gam_muG] = ffindomega(omega,sigma,mu,Fomegabar,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [sigma] = ffsigma(omega,Fomega)
% This routine finds the value of sigma
%for the lognormal distribution with mean
%forced to equal zero, such that prob < omega = Fomega.
%For Fomega = .03, this program requires
%omega to live in the interval
%[0.000000001,0.999];
sigma1=.00000001;
[ff1] = findsigma(sigma1,omega,Fomega);
sigma2=5;
[ff2] = findsigma(sigma2,omega,Fomega);
if ff1*ff2 > 0
    error('fatal (ffsigma) failed to bracket sigma')
end
x0=[sigma1 sigma2];
opt=optimset('diagnostics','on','TolX',1e-12,'TolFun',1e-12);
[sigma,fval,exitflag,output] =   fzero(@findsigma,x0,opt, ...
    omega,Fomega);
if abs(fval ) > .1e-9 | abs(imag(sigma))>.1e-10 | sigma < 0 | exitflag <= 0
    error('fatal (ffsigma) failed to find sigma')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ff] = findsigma(sigma,omega,Fomega)

ff=logncdf(omega,-sigma^2/2,sigma)-Fomega;

function [ff,ix,Gamma,Gam_muG] = ffindomega(omega,sigma,mu,Fomegabar,s)
% The following definitions are taken from BGG page 52 (NBER WP 6455)
z       =   (log(omega)+sigma^2/2)/sigma;
Gamma   =   normcdf(z-sigma)+omega*(1-normcdf(z));
Gam_muG =   (1-mu)*normcdf(z-sigma)+omega*(1-normcdf(z));

% omegabareq(1) corresponds to equation (zz1) in the manuscript
% omegabareq(2) is the definition of Fomegabar
ff  =   (1-Gamma)*s+(1-Fomegabar)/(1-Fomegabar-mu*omega*lognpdf(omega,-sigma^2/2,sigma))*(s*Gam_muG-1);

ix=0;
if max(abs(imag(ff))) > .1e-8 | (1-Fomegabar)/(1-Fomegabar-mu*omega*lognpdf(omega,-sigma^2/2,sigma)) < 0
    ix=1;
end
