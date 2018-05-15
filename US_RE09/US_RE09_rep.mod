//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Dynare code to replicate 
//
// Ricardo Reis
// A Sticky-Information General-Equilibrium Model for Policy Analysis.
// In: Monetary Policy under Uncertainty and Learning, edited by K. Schmidt-Heubel, C. Walsh and N. Loayza, Central Bank of Chile, Santiago, 2009
//
// Written by: Fabio Verona (fabio.verona@bof.fi) 
//             and
//             Maik H. Wolters (maik.wolters.ifw-kiel.de)
// 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Allows for 16 lagged information sets to restrict computational time, adjust as desired (note: if so also adjust the parameter value of T in line 51)
@#define lags = [1:16]

var y a l p w yinfn i R pi outputgap yclas deltaa g nuu gam eps z zwage zoutput;
//y: output, a: productivity, l: labor, p: price, w: wage, yinfn: output 100 periods ahead (steady state output)
//i: interest rate, R: recursive long real interest rate, pi: inflation, outputgap: outputgap 
//yclass: output without sticky information, deltaa: productivity growth, g: government spending (aggregate demand shock)
//nuu: elasticity of substitution (goods), gam: elasticity of substitution (labor)
//z: generic variable to compute the price under sticky information (sticky information Phillips curve)
//zwage: generic variable to compute the wage under sticky information (sticky information wage curve)
//zoutput: generic variable to compute output under sticky information (sticky information IS curve)

varexo e_deltaa e_g e_nuu e_gam e_eps;
//e_deltaa: producitivity shock
//e_g: aggregate demand shock
//e_nuu: goods markup shock
//e_gam: wage markup shock
//e_eps: monetary policy shock
   
parameters beta nu lambda theta delta omega gamma psi phi_pi phi_y rho_deltaa rho_eps rho_g rho_nuu rho_gam T;

// POSTERIOR MEAN, see Table 2 in paper
theta      =   1.00000000000000;
psi        =   5.15202697986071;
nu         =   10.0866927574090;
gamma      =   9.09210945073590;
beta       =   0.666666666666667;
rho_deltaa =   0.0285825345078334;
rho_eps    =   0.294610252638720;
rho_g      =   0.996989047437769;
rho_nuu    =   0.280541889680312;
rho_gam    =   0.855785136269719;
phi_pi     =   1.17350494813421;
phi_y      =   0.0625290108287302;
delta      =   0.0822178065824585;
omega      =   0.744214139325477;
lambda     =   0.516437987152365;
T=16;


model(linear);
//production function
y = a + beta*l;

// Phillips Curve
z = p +  (beta*(w-p)+(1-beta)*y-a)/(beta+nu*(1-beta))-(beta*nuu)/((nu-1)*(beta+nu*(1-beta)));

p = lambda*( + z +
 @#for lag in lags 
   +EXPECTATION(-@{lag})(z)*((1-lambda)^(@{lag})) 
 @#endfor
);

// Recursive long real interest rate
R = i - (p(+1)-p) + R(+1);

// IS Curve
yinfn = y(100);
zoutput = yinfn - theta*R;

y = g + delta*( + zoutput + 
 @#for lag in lags 
   +EXPECTATION(-@{lag})(zoutput)*((1-delta)^(@{lag})) 
 @#endfor
);

// Wage Curve
zwage = p + gamma*(w-p)/(gamma+psi) + l/(gamma+psi) + psi*(yinfn - theta*R)/(theta*(gamma+psi)) - psi*gam/((gamma+psi)*(gamma-1));

w = omega*( + zwage + 
 @#for lag in lags 
   +EXPECTATION(-@{lag})(zwage)*((1-omega)^(@{lag})) 
 @#endfor
);

// definition of inflation
pi = p - p(-1);

// Taylor rule
i = phi_y*(y-yclas) + phi_pi*pi - eps;

// Classical equilibrium
yclas = a + beta*psi/(1+psi)*(g+gam/(gamma-1)+nuu/(nu-1));

// other variables
deltaa    = a-a(-1);
outputgap = y-yclas;

// shock processes
eps     = rho_eps*eps(-1)         + e_eps;
deltaa  = rho_deltaa *deltaa(-1)  + e_deltaa;
g       = rho_g      *g(-1)       + e_g;
nuu     = rho_nuu    *nuu(-1)     + e_nuu;
gam     = rho_gam    *gam(-1)     + e_gam;

end;

//check;
//steady;

shocks;
var e_deltaa;  stderr 0.660134106707378;
var e_g;       stderr 0.833976978078512;
var e_nuu;     stderr 10.5679076888563;
var e_gam;     stderr 12.3169555240614;
var e_eps; stderr 0.437308817102200;
end;


stoch_simul(order=1,nomoments,noprint, nograph, irf=32);
//stoch_simul(order=1,noprint,nograph,irf=32);

differenceSIGE

//Comment on legend for the IRFs: R09 corresponds to replicated IRFs from Reis (2009), while VW14 refers to replicated IRFs using Verona and Wolters (2014) approximation (truncating lagged expectations)  