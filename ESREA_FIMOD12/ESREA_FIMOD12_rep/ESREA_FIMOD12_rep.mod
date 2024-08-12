// Model: ESREA_FIMOD12

// References:
// Stähler, N. and C. Thomas (2012): “FiMod—A DSGE model for fiscal policy simulations,” Economic Modelling, 29, 239–261.

// Last edited: 2023/11/20 by K. Bankowski

var     dYtot, dYt, dCtot, dIt, dEx, dIm, dutot, dwpt, dULC, dpBt, 
        dDebttoGDP, dDeficit, dPrimDefRatio, dCgtoGDP, dtauct, dtaut, dwgt, dngt, dIgt,
        fdYtot, fdYt, fdCtot, fdIt, fdEx, fdIm, fdutot, fdwpt, fdULC, fdDebttoGDP, 
        fdDeficit, fdPrimDefRatio, fdCgtoGDP, fdtauct, fdtaut, fdwgt,
        Ytot, Ctot, It, Export, Import, utot, wpt, UnitLabCost, pBt,  
        DebttoGDP, Deficit, PrimDefrat, PurchtoGDO, tauct, taut, wgt, 
        fPrimDef, fExport, fImport, fUnitLabCost, fDebttoGDP, fDeficit, 
        fPrimDefrat, fPurchtoGDO, 
        q1t, q2t, piet, ptildt, Dt, lambdat, Yt, mct, Rt, Ct, 
        kt, Debt, ggt, qpt, Mpt, vpt, npt, ppt, Gt, Cgt,
        At, pgt, ntot, xt, rt, Wpt, Jt, 
        Wgt, vgt, ngt, Mgt, qgt, Crt, lambdart, nprt,
        nptot, ngtot, ngrt, Wptot, Wprt, Wgrt, wopt, A1t, A2t, 
        A3t, A4t, A5t, A6t, Wpot, Wprot, Jot, 
        Vact, Igt, kgt, cont, A7t, Utildt, 
        Iot, kot, Debtot, CAt, CBt, IoAt, IoBt, CrAt, 
        CrBt, RECBt, ddt, CAtot, IAtot, pieAt, IBtot, CBtot, fq1t, fq2t, 
        fpiet, fptilfdt, fDt, flambdat, fYt, fmct, fRt, fCt, fkt, fGt, 
        fDebt, fggt, fqpt, fMpt, fvpt, fnpt, fIt, fppt, fAt, fpgt, 
        futot, fntot, fwpt, fwgt, fxt, frt, fWpt, fJt, fWgt, ftaut, 
        fvgt, fngt, fMgt, fqgt, fCtot, fCrt, flambdart, fnprt, fnptot, fngtot, 
        fngrt, fWptot, fWprt, fWgrt, fwopt, fA1t, fA2t, fA3t, fA4t, 
        fA5t, fA6t, fWpot, fWprot, ftaukt, ftausct, ftauct, fJot, fVact, 
        fIgt, fkgt, fcont, fA7t, fUtilfdt, ftaubt, fTt, fIot, 
        fkot, fDebtot, fCAt, fCBt, fIoAt, fIoBt, fCrAt, fCrBt, fddt, fCAtot, 
        fIAtot, pieBt, fIBtot, fCBtot, St, Qt, S1t, fSt, fQt, fS1t,
        fYtot, Aauxrt, Aauxot, Hauxot, Hauxrt, Sub, fSub,
        fAauxrt, fAauxot, fHauxot, fHauxrt, fCgt, PrimDef, 
        taukt, taubt, tausct, Tt, dTt, dCgt, dGt, dCrt, dCt, dnptot, drt,
        dpiet, dRt, dRECBt, RealInt, dRealInt, dfpiet, dpieAt, 
        dPrimDef, fdCrt, fdCt, fdnptot, dtausct, fdRt, dpieBt, 
        fdTt, fdpBt, Cgobs, cpiinf, fcpiinf, dgdp, fdgdp,
        Consumption, dmOutput, dmInflation, Investment, Wage,
        Employment, Unemployment, Consumption_f, Output_f,
        Inflation_f, Investment_f, Wage_f, ToT, Employment_f, dev_xt, dev_fxt, Unemployment_f
        Rev_t, Exp_t, Rev_GDP_t, Exp_GDP_t qYtot fqYtot qCgt fqCgt qIgt fqIgt
;
        
varexo  epsiA, epsiG, epsing, epsik, 
        epsisc, epsic, epsiwg, epsiIg, 
        epsiconsum, epsib, epsitw, epsisub, fepsisub,
        fepsiG, fepsiA, fepsing, fepsik, 
        fepsisc, fepsic, fepsiwg, fepsiIg, 
        fepsiconsum, fepsib, fepsitw epsii
;   

parameters
            betta, epsi, phi, alphaa, rhoi, phipie, kappaep, sg,
            varphip, sp, sigmac, xoui, kappaB, delta,
            gamma1, gamma2, markup, rhot, xi_b, phiy, h, rhoG,
            kappav, kappaeg, varphig, rhon, rhow, wageprem, rhoA,
            q1s, q2s, pies, ptilds, Ds, lambdas, Ys, mcs, Rs, Cs, 
            ks, Gs, ggs, qps, Mps, vps, nps, pps,
            qgs, Mgs, vgs, ngs, pgs, utots, ntots, wps, wgs, 
            xs, rs, Wps, Js, Wgs, taus, Debts, As, Is, rhocyc, AA, BB, CC, 
            mu, Ctots, Crs, lambdars, nprs, nptots, ngtots, ngrs, Wptots,
            Wprs, Wgrs, phiw, phiwn, gammaw, wops, A1s, A2s, A3s, A4s, A5s, 
            A6s, Wpos, Wpros, tauks, rhok, rhosc, tauscs, taucs, rhoc, 
            Jos, Vacs, xi_bk, xi_bsc, xi_bc, 
            Igs, kgs, rhoIg, deltag, eta, rhocon, cons, omegag,
            omegai, fracpub, A7s, Utilds, taubs, rhob, xi_bb, Ts, rhotw, 
            xi_bw, Ios, kos, Debtots, omegad, dtgdps,  fAA, fBB, fCC,
            fbetta, fepsi, fphi, falphaa, fkappaep, fsg,
            fvarphip, fsp, fsigmac, fxoui, fkappaB, fdelta,  frhoG,
            fgamma1, fgamma2, fmarkup, frhot, fxi_b, fh,
            fkappav, fkappaeg, fvarphig, frhon, frhow, fwageprem, frhoA,
            fq1s, fq2s, fpies, fptilfds, fDs, flambdas, fYs, fmcs, fRs,
            fks, fGs, fggs, fqps, fMps, fvps, fnps, fpps, fCs, 
            fqgs, fMgs, fvgs, fngs, fpgs, futots, fntots, fwps, fwgs, 
            fxs, frs, fWps, fJs, fWgs, ftaus, fDebts, fAs, fIs, frhocyc, 
            fmu, fCtots, fCrs, flambdars, fnprs, fnptots, fngtots, fngrs, 
            fWptots, fWprs, fWgrs, fphiw, fphiwn, fgammaw, fwops, fA1s, 
            fA2s, fA3s, fA4s, fA5s, fA6s, fWpos, fWpros, ftauks, frhok, 
            frhosc, ftauscs, ftaucs, frhoc,  fomegag,  frhotw,
            fJos, fVacs, fxi_bk, fxi_bsc, fxi_bc, 
            fIgs, fkgs, frhoIg, fdeltag, feta, frhocon, fcons,
            fomegai, ffracpub, fA7s, fUtilfds, ftaubs, frhob, fxi_bb, fTs, 
            fxi_bw, fIos, fkos, fDebtots, fomegad, fdtgdps, omega, Psi, 
            CAs, CBs, IoAs, IoBs, pBs, CrAs, CrBs, RECBs, dds, CAtots, 
            IAtots, pieAs, IBtots, CBtots, fCAs, fCBs, fIoAs, fIoBs,  fPsi,
            fCrAs, fCrBs, fdds, fCAtots, fIAtots, pieBs, fIBtots, fCBtots, 
            Psi2, fPsi2, xi_bg, fxi_bg, Ss, Qs, tq, S1s, 
            fSs, fQs, ftq,fS1s, 
            A11s, fA11s, Cgs, fCgs, Ytots, fYtots, PrimDefs, fPrimDefs,  
            Subs, fSubs, rhos, frhos, xi_sub, xi_pubw, Exports, Imports, 
            UnitLabCosts, DebttoGDPs, Deficits, PrimDefrats, PurchtoGDOs, 
            fExports, fImports, fUnitLabCosts, fDebttoGDPs, fDeficits, 
            fPrimDefrats, fPurchtoGDOs, RealIns, CapRets
            cpiinfs, fcpiinfs, Hauxos, Aauxos, Hauxrs, Aauxrs, fHauxos, 
            fAauxos, fHauxrs, fAauxrs, dgdps, fdgdps, tc, ftc, taus_aux, 
            taucs_aux xi_yw, psi_w, xi_yc, psi_c, xi_ysc, psi_sc, xi_ypubw, psi_pubw, xi_ycg, psi_cg,
            xi_big xi_yig psi_ig xi_bn xi_yn psi_n xi_y
            // parameters added for the extention of the fiscal rules
            Rev_ts, Exp_ts, Rev_GDP_ts, Exp_GDP_ts
;

//***********************************************************
// Parameter calibration and setting steady-state values
//**********************************************************

// ######################################################################
// Calibrated values (Baseline)
// ######################################################################

// ######################################################################
// Parameter values
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Home country
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    // Shock persistence

    rhoA = 0.9;                             // Persistence technology
    rhocon = 0.99; // 0.9375;               // Persistence of preference shock

    // Monetary policy rule
    rhoi = 0.841;                                                      // interest rate smoothing parameter
    phipie = 1.796;                                                    // MP's stance on inflation
    phiy = 0.054;                                                      // MP stance on output
        
    // Fiscal policy
    rhotw = 0.826; xi_bw = -0.005;  xi_yw = 0.073;   psi_w = 0.605;    // Labour tax
    rhoc = 0.921;  xi_bc = 0;       xi_yc = 0;       psi_c = 0.561;    // Consumption tax
    rhosc = 0.925; xi_bsc = -0.007; xi_ysc = -0.006; psi_sc = 0.681;   // SSC (employer)
    rhoG = 0.822;  xi_bg = 0.097;   xi_ycg = 0.167;  psi_cg = 0.777;   // Public consumption
    rhoIg = 0.783; xi_big = 0.219;  xi_yig = 0.199;  psi_ig = 0.786;   // Public investment
    rhon = 0.951;  xi_bn = 0;       xi_yn = 0;       psi_n  = 0.519;   // Public employment
    rhot = 0.533;  xi_b = 0.163;    xi_y=0.188;                        // Lump-sum taxes  
    rhow = 0.897;  xi_pubw = 0;     xi_ypubw = 0;    psi_pubw = 0.749; // Public wages

    rhok = 0;      xi_bk = 0;                                          // Capital tax
    rhob = 0;      xi_bb = 0;                                          // Bond tax
    rhos = 0;      xi_sub = 0;                                         // Gov subsidies

    rhocyc = 0;                                                        // Pub empl. reaction to priv employment

    // Price setting and wage stickyness
    phi = 0.9;                          // Calvo parameter, prices
    epsi = 4;                           //++ Market power
    markup = epsi/(epsi-1);
    gamma1 = 0;                         // Inflation indexation, prices
    gamma2 = 0;                         // Indexation to SS inflation (not needed)

    phiw = 0.83; // 0.825;              // Wage stickyness, existing jobs
    phiwn = 0.83; // 0.8;               // Wage stichyness, new jobs
    gammaw = 0;                         // Inflation indexation of wages

    // Trade in international bonds
    Psi2 = 0.001;                       //++ Risk premium parameter for internat bonds
    fPsi2 = Psi2;                       // same for foreign country
        
    // Preference parameters
    betta = 0.9985;                     //++ Discount rate
    sigmac = 1;                         //++ Risk aversion
    h = 0.494;                          //++ Habits
    mu = 0.283;                         //++ Fraction of RoTs
    cons = 1;                           // SS preference parameter on consupmtion
//    Psi = 0.3*0.5629;                   // Home bias (depending on calibration strategy)
      
    // Production sector
    delta = 0.0150;                     //++ Priv capital depreciation rate
    deltag = 0.0150;                    //++ Pub capital depreciation rate
    alphaa = 0.3300;                    //++ Priv capital share in production function
    eta = 0.0729;//0.1;                 // Pub capital's effects on priv production
         
    // Labor market parameters
    varphip = 0.5;                      // Mathcing elasticity (private)
    varphig = 0.3;                      // Mathcing elasticity (public)
    rrs = 0.60;                         // Short-term replacement ratio
    sp = 0.04;                          // Dismissal probability (privare)
    sg = sp/2;                          // Dismissal probability (public)
    xoui = .6;//0.8;                    // Bargaining power of workers
    omega_tc = 0.55;                    // Silva & Toledo (2008): training costs equal 55% of a new hire's quarterly wage
    
    tq = 4.9396;                        // Investment adjustment costs

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Foreign country (parameter naming analogous to home country)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    // Shock persistence
    frhoG = rhoG;
    frhoA = rhoA;  
        
    // Fiscal policy
    frhot = rhot;
    frhos = rhos;    
    fxi_b = 0.8;
    fxi_bk = xi_bk;
    fxi_bc = xi_bc;    
    fxi_bsc = xi_bsc;
    fxi_bb = xi_bb;
    fxi_bw = 0; // xi_bw;
    fxi_bg = xi_bg;

    frhon = rhon;
    frhow = rhow;
    frhocyc = rhocyc;
    frhoIg = rhoIg;
    frhok = rhok;
    frhosc = rhosc;
    frhoc = rhoc;
    frhob = rhob;
    frhotw = rhotw;
    
    // Price setting
    fphi = phi;
    fepsi = epsi;
    fmarkup = fepsi/(fepsi-1);
    fgamma1 = gamma1;
    fgamma2 = gamma2;

    fphiw = 0.83; // 0.832;
    fphiwn = 0.83; // 0.81;
    fgammaw = gammaw;
        
    // Preference parameters
    fbetta = betta;
    fsigmac = sigmac;
    fh = 0.6;
    fmu = 0.4;
    fcons = cons;
    frhocon = rhocon;
//    fPsi = 3*0.0272;
      
    // Production sector
    fdelta = delta;
    fdeltag = deltag;
    falphaa = alphaa;
    feta = 0.1029;
        
    // Labor market parameters
    fvarphip = varphip;
    fvarphig = varphig;
    frrs = 0.59;
    fsp = sp;
    fsg = fsp/2;
    fxoui = 0.5;
    omega_ftc = 0.55; // Silva & Toledo (2008): training costs equal 55% of a new hire's quarterly wage

    ftq = 4.9480;
     

// ######################################################################
// Targeted values
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Home country
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    // Country size
    omega = 0.275;                          // Size of home counrty

    pieAs = 1;                              // SS PPI gross inflation rate
//  which then implies
    pies = pieAs;                           // SS CPI inflation rate
    
    Ytots = 1;                              // SS per capita GDP

    omega_imp = 0.135;                       //++ Home import share from RoE

    omegaCg  = 0.112;                        //++ SS gov purchases
    omegai   = 0.017;                        //++ SS gov investment (parameter)
    omegaNg  = 0.064;                        // SS public sector wage bill
    omegag   = omegaNg+omegaCg+omegai;        // SS gov spending (parameter)
    omegad   = 4*0.600;                      //++ SS debt to GDP ratio (parameter)
    omegasub = 0.180;          

    fracpub = 0.113;                       // Fraction of bublic employment (parameter)
    
    utots = 0.082;                         //++ SS total unemployment rate
    ntots = (1-utots);                      // SS total employment rate
    ngtots = fracpub*ntots;                 // SS total public employment
    nptots = ntots - ngtots;                // SS total private employment

    taucs = 0.183;                          //++ SS VAT rate
    taucs_aux = taucs;                      // auxiliary parameter for plotting
    tauscs = 0.167;                         //++ SS social security contribution rate
    tauscs_aux = tauscs;                    // auxiliary parameter for plotting
    taus = 0.304;                           //++ SS labor tax rate
    taus_aux = taus;                        // auxiliary parameter for plotting    
    tauks = 0.214;                          //++ SS capital tax rate
    taubs = 0*(taus-0.0337);                // SS bond tax rate
    
    qps = 0.7;                              // SS vacancy filling rate (private)
    qgs = 0.8;                              // SS vacancy filling rate (public)

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Foreign country (parameter/variable naming analogous to home country)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    // Implied by pieAs:
    pieBs = pieAs;
    fpies = pieBs;

    fYtots = 0.895;


    fomegaCg  = 0.102;                 
    fomegai   = 0.028;                   
    fomegaNg  = 0.087;          
    fomegag   = fomegaNg+fomegaCg+fomegai;
    fomegad = 4*0.6000;
    fomegasub = 0.183;

    ffracpub = 0.204;
     
    futots = 0.095;
    fntots = (1-futots);
    fngtots = ffracpub*fntots;
    fnptots = fntots - fngtots;
    
    ftaucs  = 0.196;
    ftauscs = 0.246;
    ftaus   = 0.277;
    ftauks  = 0.316;
    ftaubs  = 0*0.3220;
    
    fqps = qps;
    fqgs = qgs;
    
// ######################################################################
// International relations
// ######################################################################
//***********************************************************************
// Note: when setting dds<>0, the SS calculation has to be adapted!!!
//***********************************************************************

    dds = 0;                                // Targeted current account
    pBs = 1;                                // Targeted terms of trade

    Igs = omegai*Ytots;                     // Public investment implied by targets (home)
    Gs = omegag*Ytots;                      // Public spending implied by targets (home)
    fGs = fomegag*fYtots;                   // Public spending implied by targets (foreign)    
    fIgs = fomegai*fYtots;                  // Public investment implied by targets (foreign)
    Cgs = omegaCg*Ytots;                    // Public consumption implied by targets (home)
    fCgs = fomegaCg*fYtots;                 // Public consumption implied by targets (foreign)
    Subs = omegasub*Ytots;                  // Public subsidies implied by targets (foreign)
    fSubs = fomegasub*fYtots;               // Public subsidies implied by targets (home)

    Ys = Ytots - Gs + Igs + Cgs;            // SS per capita private output(home)
    fYs = fYtots - fGs + fIgs + fCgs;       // SS per capita private output(foreign)



//    If targeting dds and pBs differently (note that, then, we NEED to set home bias in advance!!)
//    AA_tot = (1-omega-Psi)*(Ys-Cgs-Igs);
//    fAA_tot= (omega-fPsi)*(fYs-fCgs-fIgs);
//    pBs = (omega/(1-omega))*(AA_tot/fAA_tot) + (omega/(1-omega))*(Psi+fPsi)*(1-1/betta)*dds/fAA_tot;
//    dds = (((1-omega)/omega)*pBs*fAA_tot - AA_tot)/((Psi+fPsi)*(1-1/betta));

    ggs = Gs-Cgs-Igs;
    fggs = fGs-fCgs-fIgs;
    wgs = (ggs)/((1+tauscs)*ngtots);            // SS public wages (implied by targets; home)
    fwgs = (fggs)/((1+ftauscs)*fngtots);        // SS public wages (implied by targets; foreign)

    fdds = -omega/(1-omega)*dds;


// ######################################################################
// Calculating initial SS
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Home country
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Ss = 0;                                 // Investment adjustment costs
    S1s = 0;                                // Investment adjustment costs (derivative)
    Qs = 1;                                 // Tobin's q

    cpiinfs = pies;                         // Implied CPI inflation

    Utilds = 1 - (1-sp)*nptots -(1-sg)*ngtots;
    
    Rs = (pies/betta - taubs)/(1-taubs);
    rs = ((Rs*(1-taubs)+taubs)/pies - 1 + delta*(1-tauks))/(1-tauks);
    ptilds=((1-phi*pieAs^((1-epsi)*(gamma1+gamma2-1)))/(1-phi))^(1/(1-epsi));
    Ds=((1-phi)*ptilds^(-epsi))/(1-phi*pies^(epsi*(1-gamma1-gamma2)));
    mcs=(ptilds*(1-phi*betta*pies^(epsi*(1-gamma1-gamma2))))/(markup*(1-phi*betta*pies^((1-epsi)*(gamma1+gamma2-1))));

    RECBs = (Rs*(1-taubs)+taubs)*exp(Psi2*(dds-dds)/Ys);

    vps = sp*nptots/qps;
    kappaep = vps*qps/((Utilds)^varphip*vps^(1-varphip));
    Mps = kappaep*(Utilds)^varphip*vps^(1-varphip);

    vgs = sg*ngtots/qgs;
    kappaeg = vgs*qgs/((Utilds)^varphig*vgs^(1-varphig));
    Mgs = kappaeg*(Utilds)^varphig*vgs^(1-varphig);

    pps = Mps/Utilds;
    pgs = Mgs/Utilds;
    
    nps = Mps/sp;
    nprs = Mps/sp;
    ngs = Mgs/sg;
    ngrs = Mgs/sg;
    
    xs = (1-alphaa)*mcs*Ys/nptots;
    ks = alphaa*mcs*Ys/rs;
    Is = delta*ks;

    Ios = Is/(1-mu);
    kos = ks/(1-mu);

    kgs = Igs/deltag;
    As = Ys*Ds/(kgs^eta*ks^alphaa*nptots^(1-alphaa));
    Debts = omegad*Ytots;

    Debtots = Debts/(1-mu);
    
    A1s = 1/(1-betta*(1-sp)*phiw);
    A2s = xs/(1-betta*(1-sp)*phiw);
    A3s = 1/(1-betta*(1-sp)*(phiw));
    A5s = 1/(1-betta*(1-sp)*(phiw));
    A6s = (1-taus)/(1-betta*(1-sp)*(phiw)*(pies^gammaw/pies));
    A7s = (1+tauscs)/(1-betta*(1-sp)*phiw*pies^(-1));

    AA = (1-(betta*(1-sp))/(1-betta*(1-sp)*phiw)*((1-phiw)-pps)) - ((betta*(1-sp))/(1-betta*(1-sp)*phiw)*pgs*betta*pps*(1-sg))/(1-betta*(1-sg)*(1-pgs));
    BB = (A3s*(1-rrs)+rrs*((betta*(1-sp))/(1-betta*(1-sp)*phiw)*pgs/(1-betta*(1-sg)*(1-pgs))));
    CC = (betta*(1-sp)*pgs)/((1-betta*(1-sp)*phiw)*(1-betta*(1-sg)*(1-pgs)));
    DD = (1-A1s*betta*(1-sp)*(1-phiw));
    XX = xoui/(1-xoui);
    
    wops = (1+tauscs)^(-1)*(XX*A3s/A1s*AA/DD*A2s + (1+tauscs)*CC*wgs)/(BB + XX*A3s*AA/DD);
    wps = wops;
    wopssc = (1+tauscs)*wops;
    wageprem = wgs/wps;
    
    Js = (A2s - A1s*wops*(1+tauscs))/(1-A1s*(1-sp)*(1-phiw)*betta);
    Jos = (A2s - A1s*wps*(1+tauscs))/(1-A1s*(1-sp)*(1-phiw)*betta);
    Vacs = (1-phiwn)*Js + phiwn*Jos;

    A11s = Js/(1-betta*(1-sp)*phiw);

    tc = omega_tc*wps;
    kappav = qps*(Vacs-tc);

    Ctots = (Ys-Cgs-Igs-(1-1/betta)*dds)-Is;  // Total consumption of households in home country including home and foreign goods!
   
    kappaB = rrs*wops*(1-taus);
    
    Crs = (nprs*wps*(1-taus) + ngrs*wgs*(1-taus) + (1-nprs-ngrs)*kappaB)/(1+taucs);
    Cs = (Ctots - mu*Crs)/(1-mu);
    lambdas= ((Cs-h*Cs)^(-sigmac) - betta*h*(Cs-h*Cs)^(-sigmac))/(1+taucs);
    lambdars= ((Crs-h*Crs)^(-sigmac) - betta*h*(Crs-h*Crs)^(-sigmac))/(1+taucs);

    Wps = (wops*BB-wgs*CC)/AA*(1-taus);
    Wprs = (wops*BB-wgs*CC)/AA*(1-taus);
    Wpos = Wps;    
    Wpros = Wprs;
    Wgs = (wgs*(1-taus)- kappaB-betta*pps*Wps*(1-sg))*1/((1-betta*(1-sg)*(1-pgs)));
    Wgrs = (wgs*(1-taus)- kappaB-betta*pps*Wprs*(1-sg))*1/((1-betta*(1-sg)*(1-pgs)));
    Wptots = (1-mu)*Wps + mu*Wprs;

    Hauxos = betta*(1-sp)*(((1-phiw)-(1-phiwn)*pps)*Wps-pps*phiwn*Wpos-pgs*Wgs);
    Aauxos = Hauxos/(1-betta*(1-sp)*phiw);
    Hauxrs = betta*(1-sp)*(((1-phiw)-(1-phiwn)*pps)*Wprs-pps*phiwn*Wpros-pgs*Wgrs);
    Aauxrs = Hauxrs/(1-betta*(1-sp)*phiw);

    A4s = (1-taus)/(1-betta*(1-sp)*(phiw)*(pies^gammaw/pies));

    VCs = kappav*vps;
    dtgdps = Debts/Ys;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Foreign country (analogous to gome country)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    fSs = Ss;
    fS1s = S1s;
    fQs = Qs;

    fcpiinfs = fpies;

    fUtilfds = 1 - (1-fsp)*fnptots -(1-fsg)*fngtots;
    
    fRs = (fpies/fbetta - ftaubs)/(1-ftaubs);
    frs = ((fRs*(1-ftaubs)+ftaubs)/fpies - 1 + fdelta*(1-ftauks))/(1-ftauks);
    fptilfds=((1-fphi*fpies^((1-fepsi)*(fgamma1+fgamma2-1)))/(1-fphi))^(1/(1-fepsi));
    fDs=((1-fphi)*fptilfds^(-fepsi))/(1-fphi*fpies^(fepsi*(1-fgamma1-fgamma2)));
    fmcs=(fptilfds*(1-fphi*fbetta*fpies^(fepsi*(1-fgamma1-fgamma2))))/(fmarkup*(1-fphi*fbetta*fpies^((1-fepsi)*(fgamma1+fgamma2-1))));

    fvps = fsp*fnptots/fqps;
    fkappaep = fvps*fqps/((fUtilfds)^fvarphip*fvps^(1-fvarphip));
    fMps = fkappaep*(fUtilfds)^fvarphip*fvps^(1-fvarphip);

    fvgs = fsg*fngtots/fqgs;
    fkappaeg = fvgs*fqgs/((fUtilfds)^fvarphig*fvgs^(1-fvarphig));
    fMgs = fkappaeg*(fUtilfds)^fvarphig*fvgs^(1-fvarphig);

    fpps = fMps/fUtilfds;
    fpgs = fMgs/fUtilfds;
    
    fnps = fMps/fsp;
    fnprs = fMps/fsp;
    fngs = fMgs/fsg;
    fngrs = fMgs/fsg;
    
    fxs = (1-falphaa)*fmcs*fYs/fnptots;
    fks = falphaa*fmcs*fYs/frs;
    fIs = fdelta*fks;

    fIos = fIs/(1-fmu);
    fkos = fks/(1-fmu);

    fkgs = fIgs/fdeltag;
    fAs = fYs*fDs/(fkgs^feta*fks^falphaa*fnptots^(1-falphaa));
    fDebts = fomegad*fYtots;

    fDebtots = fDebts/(1-fmu);
    
    fA1s = 1/(1-fbetta*(1-fsp)*fphiw*fpies^(fgammaw-1));
    fA2s = fxs/(1-fbetta*(1-fsp)*fphiw);
    fA3s = 1/(1-fbetta*(1-fsp)*(fphiw));
    fA5s = 1/(1-fbetta*(1-fsp)*(fphiw));
    fA6s = (1-ftaus)/(1-fbetta*(1-fsp)*(fphiw)*(fpies^fgammaw/fpies));
    fA7s = (1+ftauscs)/(1-fbetta*(1-fsp)*fphiw*fpies^(fgammaw-1));
 
    fAA = (1-fA3s*fbetta*(1-fsp)*((1-fphiw)-fpps*(1))) - (fA3s*fbetta*(1-fsp)*fpgs*fbetta*fpps*(1-fsg))/(1-fbetta*(1-fsg)*(1-fpgs));
    fBB = fA3s*(1-frrs+frrs*(fbetta*fpgs*(1-fsp)/(1-fbetta*(1-fsg)*(1-fpgs))));
    fCC = fA3s*((fbetta*fpgs*(1-fsp)/(1-fbetta*(1-fsg)*(1-fpgs))));
    fDD = (1-fA1s*fbetta*(1-fsp)*(1-fphiw));
    fXX = fxoui/(1-fxoui);
    
    fwops = (1+ftauscs)^(-1)*(fXX*fA3s/fA1s*fAA/fDD*fA2s + (1+ftauscs)*fCC*fwgs)/(fBB + fXX*fA3s/fA1s*fAA/fDD*fA1s);
    fwps = fwops;
    fwopssc = (1+ftauscs)*fwops;
    fwageprem = fwgs/fwps;
    
    fJs = (fA2s - fA1s*fwops*(1+ftauscs))/(1-fA1s*(1-fsp)*(1-fphiw)*fbetta);
    fJos = (fA2s - fA1s*fwps*(1+ftauscs))/(1-fA1s*(1-fsp)*(1-fphiw)*fbetta);
    fVacs = (1-fphiwn)*fJs + fphiwn*fJos;

    fA11s = fJs/(1-fbetta*(1-fsp)*fphiw);
    
    ftc = omega_ftc*fwps;
    fkappav = fqps*(fVacs-ftc);

    fCtots = (fYs-fCgs-fIgs-(1-1/betta)*fdds)-fIs;
   
    fkappaB = frrs*fwops*(1-ftaus);
    
    fCrs = (fnprs*fwps*(1-ftaus) + fngrs*fwgs*(1-ftaus) + (1-fnprs-fngrs)*fkappaB)/(1+ftaucs);
    fCs = (fCtots - fmu*fCrs)/(1-fmu);
    flambdas= ((fCs-fh*fCs)^(-fsigmac) - fbetta*fh*(fCs-fh*fCs)^(-fsigmac))/(1+ftaucs);
    flambdars= ((fCrs-fh*fCrs)^(-fsigmac) - fbetta*fh*(fCrs-fh*fCrs)^(-fsigmac))/(1+ftaucs);

    fWps = (fwops*fBB-fwgs*fCC)/fAA*(1-ftaus);
    fWprs = (fwops*fBB-fwgs*fCC)/fAA*(1-ftaus);
    fWpos = fWps;    
    fWpros = fWprs;
    fWgs = (fwgs*(1-ftaus)- fkappaB-fbetta*fpps*fWps*(1-fsg))*1/((1-fbetta*(1-fsg)*(1-fpgs)));
    fWgrs = (fwgs*(1-ftaus)- fkappaB-fbetta*fpps*fWprs*(1-fsg))*1/((1-fbetta*(1-fsg)*(1-fpgs)));
    fWptots = (1-fmu)*fWps + fmu*fWprs;

    fHauxos = fbetta*(1-fsp)*(((1-fphiw)-(1-fphiwn)*fpps)*fWps-fpps*fphiwn*fWpos-fpgs*fWgs);
    fAauxos = fHauxos/(1-fbetta*(1-fsp)*fphiw);
    fHauxrs = fbetta*(1-fsp)*(((1-fphiw)-(1-fphiwn)*fpps)*fWprs-fpps*fphiwn*fWpros-fpgs*fWgrs);
    fAauxrs = fHauxrs/(1-fbetta*(1-fsp)*fphiw);

    fA4s = (1-ftaus)/(1-fbetta*(1-fsp)*(fphiw)*(fpies^fgammaw/fpies));

    fVCs = fkappav*fvps;
    fdtgdps = fDebts/fYs;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Price setting, consumption decompiosition, public sector and 
// international relations; home and foreign 
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    q1s = pies^epsi*lambdas*Ys*mcs/(1-betta*phi*pies^epsi);
    q2s = pies^(epsi-1)*lambdas*(Ys)/(1-betta*phi*pieAs^(epsi-1));

    fq1s = fpies^fepsi*flambdas*fYs*fmcs/(1-fbetta*fphi*fpies^fepsi);
    fq2s = fpies^(fepsi-1)*flambdas*fYs/(1-fbetta*fphi*fpies^(fepsi-1));

    Aux_Var = omega_imp*Ytots/(((1-mu)*Cs+ mu*Crs)+Is);
    Psi = 1-omega-Aux_Var;
    
    CBs = Cs*(1-omega-Psi)*pBs^(-omega-Psi);
    CAs = Cs*(omega+Psi)*pBs^(1-omega-Psi);
    CrBs = Crs*(1-omega-Psi)*pBs^(-omega-Psi);
    CrAs = Crs*(omega+Psi)*pBs^(1-omega-Psi);
    CBtots = (1-mu)*CBs + mu*CrBs;
    CAtots = (1-mu)*CAs + mu*CrAs;

    IBtots = Is*(1-omega-Psi)*pBs^(-omega-Psi);
    IAtots = Is*(omega+Psi)*pBs^(1-omega-Psi);
    IoAs = IAtots/(1-mu);
    IoBs = IBtots/(1-mu);

    Ts = (Rs/pies)*Debts + utots*kappaB + Gs*pBs^(-(1-omega-Psi)) + Subs - ( taus*(wps*nptots+wgs*ngtots) + taucs*Ctots + tauscs*(wps*nptots+wgs*ngtots) +  tauks*(rs-delta)*ks + Debts + taubs*((Rs-1)/pies)*Debts);
    
    AA_tot = (1-omega-Psi)*(Ys-Cgs-Igs);
    fPsi = omega-omega/(1-omega)*AA_tot/(fYs-fCgs-fIgs);
    
    fCBs = fCs*(1-omega+fPsi)*pBs^(-omega+fPsi);
    fCAs = fCs*(omega-fPsi)*pBs^(1-omega+fPsi);
    fCrBs = fCrs*(1-omega+fPsi)*pBs^(-omega+fPsi);
    fCrAs = fCrs*(omega-fPsi)*pBs^(1-omega+fPsi);
    fCBtots = (1-fmu)*fCBs + fmu*fCrBs;
    fCAtots = (1-fmu)*fCAs + fmu*fCrAs;

    fIBtots = fIs*(1-omega+fPsi)*pBs^(-omega+fPsi);
    fIAtots = fIs*(omega-fPsi)*pBs^(1-omega+fPsi);
    fIoAs = fIAtots/(1-fmu);
    fIoBs = fIBtots/(1-fmu);

    fBCPs = pBs^(omega-fPsi);

    fTs = (fRs/fpies)*fDebts + futots*fkappaB + fGs*pBs^(omega-fPsi) + fSubs - (ftaus*(fwps*fnptots+fwgs*fngtots) + ftaucs*fCtots + ftauscs*(fwps*fnptots+fwgs*fngtots) +  ftauks*(frs-fdelta)*fks + fDebts + ftaubs*((fRs-1)/fpies)*fDebts);

    PrimDefs = -(Ts + taus*(wps*nptots+wgs*ngtots) + taucs*Ctots + tauscs*(wps*nptots+wgs*ngtots) +  tauks*(rs-delta)*ks  + taubs*((Rs-1)/pies)*Debts) + (utots*kappaB + Gs*pBs^(-(1-omega-Psi)) + Subs);
    fPrimDefs = -(fTs + ftaus*(fwps*fnptots+fwgs*fngtots) + ftaucs*fCtots + ftauscs*(fwps*fnptots+fwgs*fngtots) +  ftauks*(frs-fdelta)*fks + ftaubs*((fRs-1)/fpies)*fDebts) + (futots*fkappaB + fGs*pBs^(omega-fPsi) + fSubs);

    Exports = (1-omega)/omega*(fCAtots + fIAtots);
    Imports = (CBtots + IBtots);
    UnitLabCosts = (1+tauscs)*wps*nptots/Ys;
    DebttoGDPs = pBs^(1-omega-Psi)*Debts/(4*Ytots);
    PrimDefrats = pBs^(1-omega-Psi)*PrimDefs/Ytots;
    PurchtoGDOs = Cgs/Ytots;
    Deficits = ((Rs-1)*DebttoGDPs+ + PrimDefrats);
    RealIns = Rs/pies;
    CapRets = rs/mcs;

    fImports = ( fCAtots + fIAtots);
    fExports = omega/(1-omega)*(CBtots + IBtots);
    fUnitLabCosts = (1+ftauscs)*fwps*fnptots/fYs;
    fDebttoGDPs = (1/pBs)^(omega-fPsi)*fDebts/(4*fYtots);
    fDeficits = ((fRs-1)*fDebts+fPrimDefs)/fYtots;
    fPrimDefrats = (1/pBs)^(omega-fPsi)*fPrimDefs/fYtots;
    fPurchtoGDOs = fCgs/fYtots;

    dgdps = 0;
    fdgdps = 0;

    Rev_ts = Ts + taus*(wps*nptots+wgs*ngtots) + taucs*Ctots + tauscs*(wps*nptots+wgs*ngtots) +  tauks*(rs-delta)*ks;
    Exp_ts = utots*kappaB + Gs*pBs^(-(1-omega-Psi)) + Subs;

    Rev_GDP_ts = pBs^(1-omega-Psi)*Rev_ts/Ytots;
    Exp_GDP_ts = pBs^(1-omega-Psi)*Exp_ts/Ytots;

// ######################################################################  
// Include model equations
// ######################################################################  
model;
// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// Households
// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// ######################################################################
// Home country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Household consumption and investment decomposition
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ct = ((1/pBt)^(1-omega-Psi)*CAt + pBt^(omega+Psi)*CBt);
// alternative way of writting (should yield the same result)
// = (CAt/(omega+Psi))^(omega+Psi)*(CBt/(1-omega-Psi))^(1-omega-Psi);

CAt/CBt = (Psi+omega)/(1-omega-Psi)*pBt;

Iot = ((1/pBt)^(1-omega-Psi)*IoAt + pBt^(omega+Psi)*IoBt);
IoAt/IoBt = (Psi+omega)/(1-omega-Psi)*pBt;

CAtot = (1-mu)*CAt + mu*CrAt;
IAtot = (1-mu)*IoAt;

CBtot = (1-mu)*CBt + mu*CrBt;
IBtot = (1-mu)*IoBt;

Crt =  ((1/pBt)^(1-omega-Psi)*CrAt + pBt^(omega+Psi)*CrBt);
CrAt/CrBt = (Psi+omega)/(1-omega-Psi)*pBt;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// First-order conditions of households: Euler conditions, optimal capital 
// investment, marginal utility of consumption (optimizers and RoTs)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

betta*(lambdat(+1)/lambdat) - piet(+1)/(Rt*(1-taubt(+1))+taubt(+1));
lambdat = (cont*(Ct-h*Ct(-1))^(-sigmac) - betta*h*cont(+1)*(Ct(+1)-h*Ct)^(-sigmac))/(1+tauct);

Qt = betta*(lambdat(+1)/lambdat)*((1-delta)*Qt(+1)+rt(+1)*(1-taukt(+1))+taukt(+1)*delta);
1 = Qt*((1-St)-(It/It(-1))*S1t) + betta*(lambdat(+1)/lambdat)*Qt(+1)*(It(+1)/It)^2*S1t(+1);

lambdat = betta*lambdat(+1)*(RECBt/piet(+1))*exp(-Psi2*(ddt-dds)/Yt);

lambdart = (cont*(Crt-h*Crt(-1))^(-sigmac) - betta*h*cont(+1)*(Crt(+1)-h*Crt)^(-sigmac))/(1+tauct);
Crt = (nprt*wpt*(1-taut) + ngrt*wgt*(1-taut) + (1-nprt-ngrt)*kappaB)/(1+tauct);

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Capital law of motion, investment adjustment costs
// and aggregation
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

kt = (1-delta)*kt(-1) + (1-St)*It;

St = (tq/2)*(It/It(-1)-1)^2;
S1t = tq*(It/It(-1)-1);

Ctot = (1-mu)*Ct + mu*Crt;
It = (1-mu)*Iot;
kt = (1-mu)*kot;
Debt = (1-mu)*Debtot;

nptot = (1-mu)*npt + mu*nprt;
ngtot = (1-mu)*ngt + mu*ngrt;


// ######################################################################
// Foreign country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Household consumption and investment decomposition
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fCt = ((1/pBt)^(1-omega+fPsi)*fCAt + pBt^(omega-fPsi)*fCBt);
fCAt/fCBt = (omega-fPsi)/(1-omega+fPsi)*pBt;

fIot = ((1/pBt)^(1-omega+fPsi)*fIoAt + pBt^(omega-fPsi)*fIoBt);
fIoAt/fIoBt = (omega-fPsi)/(1-omega+fPsi)*pBt;

fCAtot = (1-fmu)*fCAt + fmu*fCrAt;
fIAtot = (1-fmu)*fIoAt;

fCBtot = (1-fmu)*fCBt + fmu*fCrBt;
fIBtot = (1-fmu)*fIoBt;

fCrt = ((1/pBt)^(1-omega+fPsi)*fCrAt + pBt^(omega-fPsi)*fCrBt);
fCrAt/fCrBt = (omega-fPsi)/(1-omega+fPsi)*pBt;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// First-order conditions of households: Euler conditions, optimal capital 
// investment, marginal utility of consumption (optimizers and RoTs)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fbetta*(flambdat(+1)/flambdat) - fpiet(+1)/(fRt*(1-ftaubt(+1))+ftaubt(+1));
flambdat = (fcont*(fCt-fh*fCt(-1))^(-fsigmac) - fbetta*fh*fcont(+1)*(fCt(+1)-fh*fCt)^(-fsigmac))/(1+ftauct);

fQt = fbetta*(flambdat(+1)/flambdat)*((1-fdelta)*fQt(+1)+frt(+1)*(1-ftaukt(+1))+ftaukt(+1)*fdelta);
1 = fQt*((1-fSt)-(fIt/fIt(-1))*fS1t) + fbetta*(flambdat(+1)/flambdat)*fQt(+1)*(fIt(+1)/fIt)^2*fS1t(+1);

flambdat = fbetta*flambdat(+1)*(RECBt/fpiet(+1))*exp(fPsi2*omega/(1-omega)*(ddt/pBt-dds/pBs)/fYt);
// flambdat = fbetta*flambdat(+1)*(RECBt/fpiet(+1))*exp(-fPsi2*(fddt-fdds)/fYt);

flambdart = (fcont*(fCrt-fh*fCrt(-1))^(-fsigmac) - fbetta*fh*fcont(+1)*(fCrt(+1)-fh*fCrt)^(-fsigmac))/(1+ftauct);
fCrt = (fnprt*fwpt*(1-ftaut) + fngrt*fwgt*(1-ftaut) + (1-fnprt-fngrt)*fkappaB)/(1+ftauct);

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Capital law of motion, investment adjustment costs
// and aggregation
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fkt = (1-fdelta)*fkt(-1) + (1-fSt)*fIt;

fSt = (ftq/2)*(fIt/fIt(-1)-1)^2;
fS1t = ftq*(fIt/fIt(-1)-1);

fCtot = (1-fmu)*fCt + fmu*fCrt;
fIt = (1-fmu)*fIot;
fkt = (1-fmu)*fkot;
fDebt = (1-fmu)*fDebtot;

fnptot = (1-fmu)*fnpt + fmu*fnprt;
fngtot = (1-fmu)*fngt + fmu*fngrt;

// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// Production
// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// ######################################################################
// Home country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Aggregate output, use and marginal costs of production factors
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ytot = Yt + ggt;
Yt = Cgt + CAtot + IAtot + Igt + (1-omega)/omega*(fCAtot + fIAtot);
Yt*Dt = At*(kt(-1))^alphaa*kgt(-1)^(eta)*nptot^(1-alphaa);

rt = mct*alphaa*Yt/kt(-1);
xt = mct*(1-alphaa)*Yt/nptot;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Pricing
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//price dynamics (generalized Calvo)
q1t - lambdat*Yt*mct - phi*betta*pieAt(+1)^(epsi)*q1t(+1);
q2t - lambdat*Yt*pBt^(-(1-omega-Psi)) - phi*betta*pieAt(+1)^(epsi-1)*q2t(+1);
ptildt-(markup*q1t)/(q2t);

//aggregate price level
1-phi*pies^(gamma2*(1-epsi))*piet(-1)^(gamma1*(1-epsi))*pieAt^(epsi-1)-(1-phi)*ptildt^(1-epsi);

//price  dispersion
Dt-(1-phi)*(ptildt)^(-epsi)-phi*pieAt^(epsi)*pies^(-epsi*gamma2)*pieAt(-1)^(-epsi*gamma1)*Dt(-1);

// CPI inflation
piet = pieAt*(pBt/pBt(-1))^(1-omega-Psi);


// ######################################################################
// Foreign country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Aggregate output, use and marginal costs of production factors
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fYtot = fYt + fggt;
fYt = fCgt + fCBtot + fIBtot + fIgt  + omega/(1-omega)*(CBtot + IBtot);
fYt*fDt = fAt*(fkt(-1))^falphaa*fkgt(-1)^(feta)*fnptot^(1-falphaa);

frt = fmct*falphaa*fYt/(fkt(-1));
fxt = fmct*(1-falphaa)*fYt/fnptot;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Pricing
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//price dynamics (generalized Calvo)
fq1t - flambdat*fYt*fmct - fphi*fbetta*pieBt(+1)^(fepsi)*fq1t(+1);
fq2t - flambdat*fYt*pBt^(omega-fPsi) - fphi*fbetta*pieBt(+1)^(fepsi-1)*fq2t(+1);
fptilfdt-(fmarkup*fq1t)/(fq2t);

//aggregate price level
1-fphi*fpies^(fgamma2*(1-fepsi))*fpiet(-1)^(fgamma1*(1-fepsi))*pieBt^(fepsi-1)-(1-fphi)*fptilfdt^(1-fepsi);

//price  dispersion
fDt-(1-fphi)*(fptilfdt)^(-fepsi)-fphi*pieBt^(fepsi)*fpies^(-fepsi*fgamma2)*pieBt(-1)^(-fepsi*fgamma1)*fDt(-1);

// Foreign PPI
fpiet = pieBt*(pBt(-1)/pBt)^(omega-fPsi);

// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// Labour
// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// ######################################################################
// Home country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Matching as well as laws of motion for employment and average wages
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// probability of matching for a vacancy (qt)
qpt = Mpt/vpt;
qgt = Mgt/vgt;

// probability to find a job (pt)
ppt = Mpt/Utildt;
pgt = Mgt/Utildt;

// Matching function
Mpt = kappaep*(Utildt)^varphip*vpt^(1-varphip);
Mgt = kappaeg*(Utildt)^varphig*vgt^(1-varphig);

// Employment law of motion and unemployment (aggregated)
npt = (1-sp)*npt(-1) + ppt*(1-(1-sp)*npt(-1) - (1-sg)*ngt(-1));
ngt = (1-sg)*ngt(-1) + pgt*(1-(1-sp)*npt(-1) - (1-sg)*ngt(-1));
                             
nprt = (1-sp)*nprt(-1) + ppt*(1-(1-sp)*nprt(-1) - (1-sg)*ngrt(-1));
ngrt = (1-sg)*ngrt(-1) + pgt*(1-(1-sp)*nprt(-1) - (1-sg)*ngrt(-1));

utot = (1-nptot-ngtot);
ntot = nptot + ngtot;
Utildt = 1-(1-sp)*nptot(-1)- (1-sg)*ngtot(-1) ;

// Private real wage law of motion
nptot*wpt = (1-sp)*((1-phiw)*wopt + phiw*(piet(-1)^gammaw/piet)*wpt(-1))*nptot(-1) + Mpt*((1-phiwn)*wopt + phiwn*(piet(-1)^gammaw/piet)*wpt(-1));

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Wage bargaining
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Adjunct recursive (labor market) variables capturing that a wage fixed in t prevail for more than one period dependinf on phiw and phiwn;
// necessary only due to staggered wage bargaining assumption
A1t = Jt + betta*(lambdat(+1)/lambdat)*phiw*(1-sp)*A1t(+1);
A2t = xt + betta*(lambdat(+1)/lambdat)*phiw*(1-sp)*A2t(+1);
A3t = 1 + betta*(lambdat(+1)/lambdat)*(1-sp)*(phiw)*A3t(+1);
A4t = (1-taut) + betta*(lambdat(+1)/lambdat)*(1-sp)*(phiw)*(pies^gammaw/piet(+1))*A4t(+1);
A5t = 1 + betta*(lambdart(+1)/lambdart)*(1-sp)*(phiw)*A5t(+1);
A6t = (1-taut) +   betta*(lambdart(+1)/lambdart)*(1-sp)*phiw*(pies^gammaw/piet(+1))*A6t(+1);
A7t = (1+tausct) + betta*(lambdat(+1)/lambdat)*  phiw*(1-sp)*(pies^gammaw/piet(+1))*A7t(+1);

// Wage sharing rule
Wptot = xoui/(1-xoui)*(((1-mu)*A4t+mu*A6t)/A7t)*Jt;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Value functions of firms and workers
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Value functions of firms
Jt = A2t - A7t*wopt + A1t(+1)*(1-sp)*(1-phiw)*betta*(lambdat(+1)/lambdat);
Jot = A2t - A7t*wpt(-1)*piet^(-1) + A1t(+1)*(1-sp)*(1-phiw)*betta*(lambdat(+1)/lambdat);

// Auxiliary variables due to staggerd wage bargaining
Hauxot = betta*(1-sp)*(lambdat(+1)/lambdat)*(((1-phiw)-(1-phiwn)*ppt(+1))*Wpt(+1)-ppt(+1)*phiwn*Wpot(+1)-pgt(+1)*Wgt(+1));
Aauxot = Hauxot + betta*(1-sp)*phiw*(lambdat(+1)/lambdat)*Aauxot(+1);
Hauxrt = betta*(1-sp)*(lambdart(+1)/lambdart)*(((1-phiw)-(1-phiwn)*ppt(+1))*Wprt(+1)-ppt(+1)*phiwn*Wprot(+1)-pgt(+1)*Wgrt(+1));
Aauxrt = Hauxrt + betta*(1-sp)*phiw*(lambdart(+1)/lambdart)*Aauxrt(+1);

// Value functions of workers
Wpt = A4t*wopt - A3t*kappaB  + Aauxot;
Wgt = wgt*(1-taut) - kappaB  + betta*(lambdat(+1)/lambdat)*((1-sg)*(1-pgt(+1))*Wgt(+1)-(1-sg)*ppt(+1)*(1-phiwn)*Wpt(+1) - (1-sg)*ppt(+1)*phiwn*Wpot(+1));
Wpot = A4t*wpt(-1)*piet^(-1) - A3t*kappaB  + Aauxot;

Wprt = A6t*wopt - A5t*kappaB  + Aauxrt;
Wgrt = wgt*(1-taut) - kappaB  + betta*(lambdart(+1)/lambdart)*((1-sg)*(1-pgt(+1))*Wgt(+1)-(1-sg)*ppt(+1)*(1-phiwn)*Wprt(+1) - (1-sg)*ppt(+1)*phiwn*Wprot(+1));
Wprot = A6t*wpt(-1)*piet^(-1) - A5t*kappaB  + Aauxrt;

Wptot = (1-mu)*Wpt + mu*Wprt;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Job creation
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Vacancies FOC (private sector)
kappav/qpt + tc - Vact;
Vact = (1-phiwn)*Jt + phiwn*Jot;



// ######################################################################
// Foreign country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Matching as well as laws of motion for employment and average wages
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// probability of matching for a vacancy (qt)
fqpt = fMpt/fvpt;
fqgt = fMgt/fvgt;

// probability to find a job (pt)
fppt = fMpt/fUtilfdt;
fpgt = fMgt/fUtilfdt;

// Matching function
fMpt = fkappaep*(fUtilfdt)^fvarphip*fvpt^(1-fvarphip);
fMgt = fkappaeg*(fUtilfdt)^fvarphig*fvgt^(1-fvarphig);

// Employment law of motion and unemployment (aggregated)
fnpt = (1-fsp)*fnpt(-1) + fppt*(1-(1-fsp)*fnpt(-1) - (1-fsg)*fngt(-1));
fngt = (1-fsg)*fngt(-1) + fpgt*(1-(1-fsp)*fnpt(-1) - (1-fsg)*fngt(-1));
                             
fnprt = (1-fsp)*fnprt(-1) + fppt*(1-(1-fsp)*fnpt(-1) - (1-fsg)*fngt(-1));
fngrt = (1-fsg)*fngrt(-1) + fpgt*(1-(1-fsp)*fnpt(-1) - (1-fsg)*fngt(-1));

futot = (1-fnptot-fngtot);
fntot = fnptot + fngtot;

fUtilfdt = 1-(1-fsp)*fnptot(-1)- (1-fsg)*fngtot(-1) ;

// Private real wage law of motion
fnptot*fwpt = (1-fsp)*((1-fphiw)*fwopt + fphiw*(fpiet(-1)^fgammaw/fpiet)*fwpt(-1))*fnptot(-1) + fMpt*((1-fphiwn)*fwopt + fphiwn*(fpiet(-1)^fgammaw/fpiet)*fwpt(-1));

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Wage bargaining
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Adjunct recursive (labor market) variables capturing that a wage fixed in t prevail for more than one period dependinf on phiw and phiwn;
// necessary only due to staggered wage bargaining assumption
fA1t = fJt + fbetta*(flambdat(+1)/flambdat)*fphiw*(1-fsp)*fA1t(+1);
fA2t = fxt + fbetta*(flambdat(+1)/flambdat)*fphiw*(1-fsp)*fA2t(+1);
fA3t = 1 + fbetta*(flambdat(+1)/flambdat)*(1-fsp)*(fphiw)*fA3t(+1);
fA4t = (1-ftaut) + fbetta*(flambdat(+1)/flambdat)*(1-fsp)*(fphiw)*(fpies^fgammaw/fpiet(+1))*fA4t(+1);
fA5t = 1 + fbetta*(flambdart(+1)/flambdart)*(1-fsp)*(fphiw)*fA5t(+1);
fA6t = (1-ftaut) + fbetta*(flambdart(+1)/flambdart)*(1-fsp)*(fphiw)*(fpies^fgammaw/fpiet(+1))*fA6t(+1);
fA7t = (1+ftausct) + fbetta*(flambdat(+1)/flambdat)*fphiw*(1-fsp)*(fpies^fgammaw/fpiet(+1))*fA7t(+1);

// Wage sharing rule
fWptot = fxoui/(1-fxoui)*(((1-fmu)*fA4t+fmu*fA6t)/fA7t)*fJt;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Value functions of firms and workers
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Value functions of firms
fJt = fA2t - fA7t*fwopt + fA1t(+1)*(1-fsp)*(1-fphiw)*fbetta*(flambdat(+1)/flambdat);
fJot = fA2t - fA7t*fwpt(-1)*fpiet^(-1) + fA1t(+1)*(1-fsp)*(1-fphiw)*fbetta*(flambdat(+1)/flambdat);

// Auxiliary variables due to staggerd wage bargaining
fHauxot = fbetta*(1-fsp)*(flambdat(+1)/flambdat)*(((1-fphiw)-(1-fphiwn)*fppt(+1))*fWpt(+1)-fppt(+1)*fphiwn*fWpot(+1)-fpgt(+1)*fWgt(+1));
fAauxot = fHauxot + fbetta*(1-fsp)*fphiw*(flambdat(+1)/flambdat)*fAauxot(+1);
fHauxrt = fbetta*(1-fsp)*(flambdart(+1)/flambdart)*(((1-fphiw)-(1-fphiwn)*fppt(+1))*fWprt(+1)-fppt(+1)*fphiwn*fWprot(+1)-fpgt(+1)*fWgrt(+1));
fAauxrt = fHauxrt + fbetta*(1-fsp)*fphiw*(flambdart(+1)/flambdart)*fAauxrt(+1);

// Value functions of workers
fWpt = fA4t*fwopt - fA3t*fkappaB  + fAauxot;
fWgt = fwgt*(1-ftaut) - fkappaB  + fbetta*(flambdat(+1)/flambdat)*((1-fsg)*(1-fpgt(+1))*fWgt(+1)-(1-fsg)*fppt(+1)*(1-fphiwn)*fWpt(+1) - (1-fsg)*fppt(+1)*fphiwn*fWpot(+1));
fWpot = fA4t*fwpt(-1)*fpiet^(-1) - fA3t*fkappaB  + fAauxot;

fWprt = fA6t*fwopt - fA5t*fkappaB  + fAauxrt;
fWgrt = fwgt*(1-ftaut) - fkappaB  + fbetta*(flambdart(+1)/flambdart)*((1-fsg)*(1-fpgt(+1))*fWgt(+1)-(1-fsg)*fppt(+1)*(1-fphiwn)*fWprt(+1) - (1-fsg)*fppt(+1)*fphiwn*fWprot(+1));
fWprot = fA6t*fwpt(-1)*fpiet^(-1) - fA5t*fkappaB  + fAauxrt;

fWptot = (1-fmu)*fWpt + fmu*fWprt;


// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Job creation
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Vacancies FOC (private sector)
fkappav/fqpt + ftc - fVact;
fVact = (1-fphiwn)*fJt + fphiwn*fJot;

// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// Fiscal
// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// ######################################################################
// Home country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Gov. budget constraint and fiscal rules
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Tt + taut*(wpt*nptot+wgt*ngtot) + tauct*Ctot + tausct*(wpt*nptot+wgt*ngtot) +  taukt*(rt-delta)*kt(-1) + Debt + taubt*((Rt(-1)-1)/piet)*Debt(-1) =  (Rt(-1)/piet)*Debt(-1) + utot*kappaB + Gt*pBt^(-(1-omega-Psi)) + Sub;
// with
Gt = (Cgt + Igt) + ggt ;
ggt = pBt^(1-omega-Psi)*((1+tausct)*wgt*ngtot);

taut-taus                   = rhotw*(taut(-1)-taus)                + xi_bw*log(Debt(-1)/Debts)  + xi_yw*log(Ytot(-1)/Ytots)    + psi_w*epsitw    + (1-psi_w)*epsitw(-1);
tauct-taucs                 = rhoc *(tauct(-1)-taucs)              + xi_bc*log(Debt(-1)/Debts)  + xi_yc*log(Ytot(-1)/Ytots)    + psi_c*epsic     + (1-psi_c)*epsic(-1);
tausct-tauscs               = rhosc*(tausct(-1)-tauscs)            + xi_bsc*log(Debt(-1)/Debts) + xi_ysc*log(Ytot(-1)/Ytots)   + psi_sc*epsisc   + (1-psi_sc)*epsisc(-1);
wgt-wgs                     = rhow*(wgt(-1)-wgs)                   + xi_pubw*log(Debt(-1)/Debt) + xi_ypubw*log(Ytot(-1)/Ytots) + psi_pubw*epsiwg + (1-psi_pubw)*epsiwg(-1);
(Tt-steady_state(Tt))/Ytots = rhot*(Tt(-1)-steady_state(Tt))/Ytots + xi_b*log(Debt(-1)/Debts)   + xi_y*log(Ytot(-1)/Ytots);

log(Cgt/Cgs) = rhoG*log(Cgt(-1)/Cgs)  - xi_bg*log(Debt(-1)/Debts)  - xi_ycg*log(Ytot(-1)/Ytots) + psi_cg*epsiG  + (1-psi_cg)*epsiG(-1);
log(Igt/Igs) = rhoIg*log(Igt(-1)/Igs) - xi_big*log(Debt(-1)/Debts) - xi_yig*log(Ytot(-1)/Ytots) + psi_ig*epsiIg + (1-psi_ig)*epsiIg(-1);
log(ngt/ngs) = rhon*log(ngt(-1)/ngs)  - xi_bn*log(Debt(-1)/Debts)  - xi_yn*log(Ytot(-1)/Ytots)  + psi_n*epsing  + (1-psi_n)*epsing(-1);


taukt-tauks = rhok*(taukt(-1)-tauks) + (1-rhok)*xi_bk*(Debt(-1)/(Ytot(-1))*pBt(-1)^(1-omega-Psi) - omegad) +  epsik;
taubt-taubs = rhob*(taubt(-1)-taubs) + (1-rhob)*xi_bb*(Debt(-1)/(Ytot(-1))*pBt(-1)^(1-omega-Psi) - omegad) +  epsib;
Sub/Subs = (Sub(-1)/Subs)^rhos*(Debt(-1)/(omegad*Ytot(-1))*pBt(-1)^(1-omega-Psi))^((1-rhos)*xi_sub)*exp(epsisub);

// wgt = wgs*(wgt(-1)/wgs)^rhow*(Debt(-1)/(omegad*Ytot(-1)))^((1-rhow)*xi_pubw)*exp(epsiwg);
//(Cgt/Cgs)-((Cgt(-1)/Cgs)^rhoG)*(Debt(-1)*pBt(-1)^(1-omega-Psi)/(omegad*Ytot(-1)))^((1-rhoG)*xi_bg)*exp(epsiG);
// (Cgt/omegag*Yt)-((Cgt(-1)/omegag*Yt(-1))^rhoG)*exp(epsiG);
// (Igt/omegai*Yt)-((Igt(-1)/omegai*Yt(-1))^rhoIg)*exp(epsiIg);

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Public capital law of motion
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

kgt = (1-deltag)*kgt(-1) + Igt;

// ######################################################################
// Foreign country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Gov. budget constraint and fiscal rules
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fTt + ftaut*(fwpt*fnptot+fwgt*fngtot) + ftauct*fCtot + ftausct*(fwpt*fnptot+fwgt*fngtot) +  ftaukt*(frt-fdelta)*fkt(-1) + fDebt + ftaubt*((fRt(-1)-1)/fpiet)*fDebt(-1) = (fRt(-1)/fpiet)*fDebt(-1) + futot*fkappaB + fGt*pBt^(omega-fPsi) + fSub;
// with
fGt = (fCgt + fIgt) + fggt;
fggt = pBt^(-omega+fPsi)*((1+ftausct)*fwgt*fngtot );

ftaut-ftaus = frhotw*(ftaut(-1)-ftaus) + (1-frhotw)*fxi_bw*(fDebt(-1)/(fYtot(-1))*(1/pBt)^(omega-fPsi) - fomegad) + fepsitw; 
ftaukt-ftauks = frhok*(ftaukt(-1)-ftauks) + (1-frhok)*fxi_bk*(fDebt(-1)/(fYtot(-1))*(1/pBt)^(omega-fPsi) - fomegad) +  fepsik;
ftausct-ftauscs = frhosc*(ftausct(-1)-ftauscs) + (1-frhosc)*fxi_bsc*(fDebt(-1)/(fYtot(-1))*(1/pBt)^(omega-fPsi) - fomegad) + fepsisc;
ftauct-ftaucs = frhoc*(ftauct(-1)-ftaucs) + (1-frhoc)*fxi_bc*(fDebt(-1)/(fYtot(-1))*(1/pBt)^(omega-fPsi) - fomegad) +  fepsic;
ftaubt-ftaubs = frhob*(ftaubt(-1)-ftaubs) + (1-frhob)*fxi_bb*(fDebt(-1)/(fYtot(-1))*(1/pBt)^(omega-fPsi) - fomegad) +  fepsib;
fTt-fTs = frhot*(fTt(-1)-fTs) + (1-frhot)*xi_b*(fDebt(-1)/(fYtot(-1))*(1/pBt)^(omega-fPsi) - fomegad);

fSub/fSubs = (fSub(-1)/fSubs)^frhos*exp(fepsisub);
fngt/fngs = (fngt(-1)/fngs)^frhon*(fnpt(-1)/fnps)^((1-frhon)*frhocyc)*exp(fepsing);
fwgt = fwgs*(fwgt(-1)/fwgs)^frhow*exp(fepsiwg);

//government spending shock
(fCgt/fCgs)-((fCgt(-1)/fCgs)^frhoG)*(fDebt(-1)*(1/pBt)^(omega-fPsi)/(fomegad*fYtot(-1)))^((1-frhoG)*fxi_bg)*exp(fepsiG);
// (fGt/fomegag*fYt)-((fGt(-1)/fomegag*fYt(-1))^frhoG)*exp(fepsiG);

//government investment shock
(fIgt/fIgs)-((fIgt(-1)/fIgs)^frhoIg)*exp(fepsiIg);
// (fIgt/fomegai*fYt)-((fIgt(-1)/fomegai*fYt(-1))^frhoIg)*exp(fepsiIg);

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Public capital law of motion
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fkgt = (1-fdeltag)*fkgt(-1) + fIgt;

// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// International
// ##############################################################################################  
// ##############################################################################################  
// ############################################################################################## 
// ######################################################################
// Current account per capita
// ######################################################################

// home
ddt = (RECBt(-1)*exp(-Psi2*(ddt(-1)-dds)/Yt(-1))/pieAt)*ddt(-1) + (1-omega)/omega*(fCAtot+fIAtot) - pBt*(CBtot + IBtot);

// foreign
pBt*fddt = - omega/(1-omega) * ddt;

// ######################################################################
// Terms of trade
// ######################################################################

pBt = pieBt/pieAt*pBt(-1);

// ######################################################################
// Monetary policy
// ######################################################################

// Define if CPI taken into account by MP includes VAT or not
cpiinf = piet; // *((1+tauct)/(1+tauct(-1))); 
fcpiinf = fpiet; // *((1+ftauct)/(1+ftauct(-1)));

// Taylor rule (here: non-linear, but there are a million ways to define the rule...)
RECBt/RECBs = (RECBt(-1)/RECBs)^rhoi*(((cpiinf/cpiinfs)^omega*(fcpiinf/fcpiinfs)^(1-omega))^phipie*((Ytot/Ytot(-1))^omega*(fYtot/fYtot(-1))^(1-omega))^phiy)^((1-rhoi))*exp(epsii);

// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// Obs
// ##############################################################################################  
// ##############################################################################################  
// ############################################################################################## 
// ######################################################################
// Home country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Define some adjunct variables (mainly for plotting reasons)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PrimDef = Debt-Rt(-1)/piet*Debt(-1);

// omegadt = (1/pBt)^(1-omega-Psi)*Debt/Ytot;

Export = (1-omega)/omega*(fCAtot + fIAtot);
Import = (CBtot + IBtot);
UnitLabCost = (1+tausct)*wpt*nptot/Yt;
DebttoGDP = pBt^(1-omega-Psi)*Debt/(4*Ytot);
PrimDefrat = pBt^(1-omega-Psi)*PrimDef/Ytot;
PurchtoGDO = Cgt/Ytot;
Deficit = ((Rt(-1)-1)*DebttoGDP+ + PrimDefrat);

RealInt = Rt/piet;

Rev_t = Tt + taut*(wpt*nptot+wgt*ngtot) + tauct*Ctot + tausct*(wpt*nptot+wgt*ngtot) +  taukt*(rt-delta)*kt(-1);
Exp_t = utot*kappaB + Gt*pBt^(-(1-omega-Psi)) + Sub;

Rev_GDP_t = pBt^(1-omega-Psi)*Rev_t/Ytot;
Exp_GDP_t = pBt^(1-omega-Psi)*Exp_t/Ytot;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Observables
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dYtot = 100*(Ytot - Ytots)/Ytots;
dYt = 100*(Yt - Ys)/Ys;
dCtot = 100*(Ctot - Ctots)/Ctots;
dIt = 100*(It - Is)/Is;
dEx = 100*(Export - Exports)/Exports;
dIm = 100*(Import - Imports)/Imports;
dutot = 100*(utot - utots);
dnptot = 100*(nptot - nptots);
dwpt = 100*(wpt - wps)/wps;
dULC = 100*(UnitLabCost -UnitLabCosts)/UnitLabCosts;
dpBt = 100*(pBt - pBs)/pBs;
dDebttoGDP = 100*(DebttoGDP - DebttoGDPs);
dDeficit = 100*(Deficit - Deficits);
dPrimDefRatio = 100*(PrimDefrat - PrimDefrats);
dPrimDef = 100*(PrimDef - PrimDefs);
dCgtoGDP = 100*(PurchtoGDO - PurchtoGDOs);
dtauct = 100*(tauct -taucs_aux);
dtaut = 100*(taut - taus_aux);
dwgt = 100*(wgt - wgs)/wgs;
dngt = 100*(ngtot - ngtots)/ngtots;
dIgt = 100*(Igt - Igs)/Igs;
dCgt = 100*(Cgt - Cgs)/Cgs;
dTt = 100*(Tt - Ts)/Ts;
dGt = 100*(Gt - Gs)/Gs;
dCt = 100*(Ct - Cs)/Cs;
dCrt = 100*(Crt - Crs)/Crs;
drt = 100*(rt - rs)/rs;
dpiet = 100*(cpiinf - cpiinfs);
dpieAt = 100*(pieAt - pieAs);
dRt = 100*(Rt - Rs);
dRECBt = 100*(RECBt - RECBs);
dRealInt = 100*(RealInt - RealIns);
dtausct = 100*(tausct -tauscs);
fdRt = 100*(fRt - fRs);

qYtot = 100*(Ytot/Ytots(-1)-1);
fqYtot = 100*(fYtot/fYtots(-1)-1);

qCgt = 100*(Cgt/Cgt(-1)-1);
fqCgt = 100*(fCgt/fCgt(-1)-1);

qIgt = 100*(Igt/Igt(-1)-1);
fqIgt = 100*(fIgt/fIgt(-1)-1);

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Observables 2
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Consumption = (log(Ctot)-log(Ctots))*100;
dmOutput = (log(Ytot)-log(Ytots))*100;
dmInflation = (piet-pies)*400;
Investment = (log(It)-log(Is))*100;
Wage = (log(wpt)-log(wps))*100;
Employment = (log(ntot)-log(ntots))*100;
dev_xt = (log(xt)-log(xs))*100;
Unemployment = (utot-utots)*100;

// ######################################################################
// Foreign country
// ######################################################################

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Define some adjunct variables (mainly for plotting reasons)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fPrimDef = fDebt-fRt(-1)/fpiet*fDebt(-1);

// fomegadt = fDebt/fYtot;

fImport = (fCAtot + fIAtot);
fExport = omega/(1-omega)*(CBtot + IBtot);
fUnitLabCost = (1+ftausct)*fwpt*fnptot/fYt;
fDebttoGDP = (1/pBt)^(omega-fPsi)*fDebt/(4*fYtot);
fDeficit = ((fRt(-1)-1)*fDebt(-1)+fPrimDef)/fYtot;
fPrimDefrat = (1/pBt)^(omega-fPsi)*fPrimDef/fYtot;
fPurchtoGDO = fCgt/fYtot;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Observables
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fdYtot = 100*(fYtot - fYtots)/fYtots;
fdYt = 100*(fYt - fYs)/fYs;
fdCtot = 100*(fCtot - fCtots)/fCtots;
fdIt = 100*(fIt - fIs)/fIs;
fdEx = 100*(fExport - fExports)/fExports;
fdIm = 100*(fImport - fImports)/fImports;
fdutot = 100*(futot - futots)/futots;
fdwpt = 100*(fwpt - fwps)/fwps;
fdULC = 100*(fUnitLabCost -fUnitLabCosts)/fUnitLabCosts;
fdDebttoGDP = 100*(fDebttoGDP - fDebttoGDPs);
fdDeficit = 100*(fDeficit - fDeficits);
fdPrimDefRatio = 100*(fPrimDefrat - fPrimDefrats);
fdCgtoGDP = 100*(fPurchtoGDO - fPurchtoGDOs);
fdtauct = 100*(ftauct -ftaucs);
fdtaut = 100*(ftaut - ftaus);
fdwgt = 100*(fwgt - fwgs)/fwgs;
dfpiet = 100*(fpiet - fpies);
fdCt = 100*(fCt - fCs)/fCs;
fdCrt = 100*(fCrt - fCrs)/fCrs;
fdnptot = 100*(fnptot - fnptots)/fnptots;
fdTt = 100*(fTt - fTs)/fTs;
dpieBt = 100*(pieBt - pieBs);
fdpBt = 100*(1/pBt - 1/pBs)/(1/pBs);

Cgobs = 100*log(Cgt/Cgs);

dgdp = (Ys/Ytots*Yt/Ys + (1-Ys/Ytots)*ngtot/ngtots -1)*100;
fdgdp = (fYs/fYtots*fYt/fYs + (1-fYs/fYtots)*fngtot/fngtots -1)*100;


// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Observables 2
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Consumption_f = (log(fCtot)-log(fCtots))*100;
Output_f = (log(fYtot)-log(fYtots))*100;
Inflation_f = (fpiet-fpies)*400;
Investment_f = (log(fIt)-log(fIs))*100;
Wage_f = (log(fwpt)-log(fwps))*100;
ToT = (log(pBt)-log(pBs))*100;
Employment_f = (log(fntot)-log(fntots))*100;
dev_fxt = (log(fxt)-log(fxs))*100;
Unemployment_f = (futot-futots)*100;

// ##############################################################################################  
// ##############################################################################################  
// ##############################################################################################  
// Shocks
// ##############################################################################################  
// ##############################################################################################  
// ############################################################################################## 
// ######################################################################
// Home country
// ######################################################################

    //consumption shock; 39
(cont/cons)-((cont(-1)/cons)^rhocon)*exp(epsiconsum);

    //technology shock; 40
// (At/As)-((At(-1)/As)^rhoA)*exp(epsiA);
At = rhoA*At(-1) + (1-rhoA)*As + epsiA;

// ######################################################################
// Foreign country
// ######################################################################

//consumption shock
(fcont/fcons)-((fcont(-1)/fcons)^frhocon)*exp(fepsiconsum);

//technology shock
(fAt/fAs)-((fAt(-1)/fAs)^frhoA)*exp(fepsiA);

end;

// ######################################################################  
// Set initial steady-sate values
// ######################################################################  

initval;
    q1t         = q1s;
    q2t         = q2s;
    piet        = pies;
    ptildt      = ptilds;
    Dt          = Ds;
    lambdat     = lambdas;
    Yt          = Ys;
    mct         = mcs;
    Rt          = Rs;
    Ct          = Cs;
    kt          = ks;
    Gt          = Gs;
    Debt        = Debts;
    ggt         = ggs;
    qpt         = qps;
    Mpt         = Mps;
    vpt         = vps;
    npt         = nps;
    It          = Is;
    ppt         = pps;
    At          = As;
    pgt         = pgs;
    utot        = utots;
    ntot        = ntots;
    wpt         = wps;
    wgt         = wgs;
    xt          = xs;
    rt          = rs;
    Wpt         = Wps;
    Jt          = Js;
    Wgt         = Wgs;
    taut        = taus;
    vgt         = vgs;
    ngt         = ngs;
    Mgt         = Mgs;
    qgt         = qgs;
    Ctot        = Ctots;
    Crt         = Crs;
    lambdart    = lambdars;
    nprt        = nprs;
    nptot       = nptots;
    ngtot       = ngtots;
    ngrt        = ngrs;
    Wptot       = Wptots;
    Wprt        = Wprs;
    Wgrt        = Wgrs;
    wopt        = wops;
    A1t         = A11s;
    A2t         = A2s;
    A3t         = A3s;
    A4t         = A4s;
    A5t         = A5s;
    A6t         = A6s;
    A7t         = A7s;
    Wpot        = Wpos;
    Wprot       = Wpros;
    taukt       = tauks;
    tausct      = tauscs;
    tauct       = taucs;
    Jot         = Jos;
    Vact        = Vacs;
    kgt         = kgs;
    Igt         = Igs;
    cont        = cons;
    Utildt      = Utilds;
    taubt       = taubs;
    Tt          = Ts;
    Iot         = Ios;
    kot         = kos;
    Debtot      = Debtots;
    fq1t        = fq1s;
    fq2t        = fq2s;
    fpiet       = fpies;
    fptilfdt    = fptilfds;
    fDt         = fDs;
    flambdat    = flambdas;
    fYt         = fYs;
    fmct        = fmcs;
    fRt         = fRs;
    fCt         = fCs;
    fkt         = fks;
    fGt         = fGs;
    fDebt       = fDebts;
    fggt        = fggs;
    fqpt        = fqps;
    fMpt        = fMps;
    fvpt        = fvps;
    fnpt        = fnps;
    fIt         = fIs;
    fppt        = fpps;
    fAt         = fAs;
    fpgt        = fpgs;
    futot       = futots;
    fntot       = fntots;
    fwpt        = fwps;
    fwgt        = fwgs;
    fxt         = fxs;
    frt         = frs;
    fWpt        = fWps;
    fJt         = fJs;
    fWgt        = fWgs;
    ftaut       = ftaus;
    fvgt        = fvgs;
    fngt        = fngs;
    fMgt        = fMgs;
    fqgt        = fqgs;
    fCtot       = fCtots;
    fCrt        = fCrs;
    flambdart   = flambdars;
    fnprt       = fnprs;
    fnptot      = fnptots;
    fngtot      = fngtots;
    fngrt       = fngrs;
    fWptot      = fWptots;
    fWprt       = fWprs;
    fWgrt       = fWgrs;
    fwopt       = fwops;
    fA1t        = fA11s;
    fA2t        = fA2s;
    fA3t        = fA3s;
    fA4t        = fA4s;
    fA5t        = fA5s;
    fA6t        = fA6s;
    fA7t        = fA7s;
    fWpot       = fWpos;
    fWprot      = fWpros;
    ftaukt      = ftauks;
    ftausct     = ftauscs;
    ftauct      = ftaucs;
    fJot        = fJos;
    fVact       = fVacs;
    fkgt        = fkgs;
    fIgt        = fIgs;
    fcont       = fcons;
    fUtilfdt    = fUtilfds;
    ftaubt      = ftaubs;
    fTt         = fTs;
    fIot        = fIos;
    fkot        = fkos;
    fDebtot     = fDebtots;
    CAt         = CAs;
    CBt         = CBs;
    IoAt        = IoAs;
    IoBt        = IoBs;
    pBt         = pBs;
    CrAt        = CrAs;
    CrBt        = CrBs;
    RECBt       = RECBs;
    ddt         = dds;
    CAtot       = CAtots;
    IAtot       = IAtots;
    pieAt       = pieAs;
    IBtot       = IBtots;
    CBtot       = CBtots;
    fCAt        = fCAs;
    fCBt        = fCBs;
    fIoAt       = fIoAs;
    fIoBt       = fIoBs;
    fCrAt       = fCrAs;
    fCrBt       = fCrBs;
    fddt        = fdds;
    fCAtot      = fCAtots;
    fIAtot      = fIAtots;
    pieBt       = pieBs;
    fIBtot      = fIBtots;
    fCBtot      = fCBtots;
    St          = Ss;
    Qt          = Qs;
    S1t         = S1s;
    fSt         = fSs;
    fQt         = fQs;
    fS1t        = fS1s;
    Ytot        = Ytots;
    fYtot       = fYtots;
    Cgt         = Cgs;
    fCgt        = fCgs;
    Hauxot      = Hauxos;
    Aauxot      = Aauxos;
    Hauxrt      = Hauxrs;
    Aauxrt      = Aauxrs;
    fHauxot     = fHauxos;
    fAauxot     = fAauxos;
    fHauxrt     = fHauxrs;
    fAauxrt     = fAauxrs;
    Sub         = Subs;
    fSub        = fSubs;
    PrimDef     = PrimDefs;
    fPrimDef    = fPrimDefs;
    Export      = Exports;
    Import      = Imports;
    UnitLabCost = UnitLabCosts;
    DebttoGDP   = DebttoGDPs;
    Deficit     = Deficits;
    PrimDefrat  = PrimDefrats;
    PurchtoGDO  = PurchtoGDOs;
    fExport     = fExports;
    fImport     = fImports;
    fUnitLabCost= fUnitLabCosts;
    fDebttoGDP  = fDebttoGDPs;
    fDeficit    = fDeficits;
    fPrimDefrat = fPrimDefrats;
    fPurchtoGDO = fPurchtoGDOs;
    RealInt     = RealIns;
    cpiinf      = cpiinfs;
    fcpiinf     = fcpiinfs;
    dgdp        = dgdps;
    fdgdp       = fdgdps;
    Rev_t       = Rev_ts;
    Exp_t       = Exp_ts;
    Rev_GDP_t   = Rev_GDP_ts;
    Exp_GDP_t   = Exp_GDP_ts;
    qYtot       = 0;
    fqYtot      = 0;
    qCgt        = 0;
    fqCgt       = 0;
    qIgt        = 0;
    fqIgt        = 0;
end;

// ######################################################################  
// Calculate steady state
// ###################################################################### 

resid(1);
// steady(solve_algo=0);
steady;
//initialss = oo_.steady_state;
// resid(1);



// ######################################################################
// Simulation (stochastic) exercise and plotting
// ######################################################################

shocks;
var epsiA  = 0;
var epsii = (0.01/4)^2;
var epsiG = 0*((0.01/omegaCg))^2;
var epsiwg = 0;
var epsing = 0*(0.01/(pBs^(1-omega-Psi)*(1-taus)*(wgs*ngtots)/Ytots))^2;
var epsik = 0;
var epsisc = 0*(0.01/(pBs^(1-omega-Psi)*(wps*nptots+wgs*ngtots)/Ytots))^2;
var epsic = 0*(0.01/(pBs^(1-omega-Psi)*Ctots/Ytots))^2;
var epsiIg = 0*((0.01/omegai))^2;
var epsiconsum = 0;
var epsib = 0;
var epsitw = 0*(0.01/(pBs^(1-omega-Psi)*(wps*nptots+wgs*ngtots)/Ytots))^2;
var fepsiA  = 0;
var fepsiG = 0;
var fepsiwg = 0;
var fepsing = 0;
var fepsik = 0;
var fepsisc = 0;
var fepsic = 0;
var fepsiIg = 0;
var fepsiconsum = 0;
var fepsib = 0;
var fepsitw = 0;
end;

stoch_simul(order = 1, irf_shocks=(epsii),irf=20) dRECBt Consumption dmOutput dmInflation Ytot;
