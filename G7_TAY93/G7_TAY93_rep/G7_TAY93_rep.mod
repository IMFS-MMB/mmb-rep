// Title: Macroeconomic Policy in a World Economy, New York: Norton, 1993 (chapter 3)
// Authors: John B. Taylor


// G7_TAY93 replication of IRFs. Orifinal covariance-matrix has been delteted for this purpose.


// This file simulates the dynamic response of the model to specific shocks

var ygap0 pdot0 drs0 lretw0 dretw0 dletw0 fgdp0 fpdot0 frs0 dfrs0 lp0 dygap0 
    rr20 rr50 rr100 rs0 rs1 rs2 rs3 rs4 rs5 rs6 rl0 rl1 rl2 rl3 rl4 rl5 rl6 
    cd0 cn0 cs0 cd1 cn1 cs1 cd2 cn2 cs2 c3 c4 cd5 cn5 cs5 cd6 cn6 cs6 ine0 
    ins0 ir0 ii0 if1 ii1 in2 ir2 ii2 if3 ii3 if4 ii4 in5 ir5 ii5 in6 ir6 ii6 
    lex0 lex1 lex2 lex3 lex4 lex5 lex6 lim0 lim1 lim2 lim3 lim4 lim5 lim6 y0 
    y1 y2 y3 y4 y5 y6 le1 le2 le3 le4 le5 le6 lx0 lx1 lx2 lx3 lx4 lx5 lx6 lw0 
    lw1 lw2 lw3 lw4 lw5 lw6 lp1 lp2 lp3 lp4 lp5 lp6 lpi0 lpi1 lpi2 lpi3 lpi4   
	lpi5 lpi6 lpe0 lpe1 lpe2 lpe3 lpe4 lpe5 lpe6 lg0 lg1 lg2 lg3 lg4 lg5 lg6 
    ule1 ule2 ule3 ule4 ule5 ule6 rsl10 rsl20 rsl11 rsl21 rsl12 rsl22 rsl13 
    rsl23 rsl15 rsl25 rsl16 rsl26 rsl30 rsl40 rsl31 rsl41 rsl32 rsl42 rsl33 
    rsl43 rsl35 rsl45 rsl36 rsl46 rsl50 rsl60 rsl51 rsl61 rsl52 rsl62 rsl53 
    rsl63 rsl55 rsl65 rsl56 rsl66 yl10 yl20 yl11 yl21 yl12 yl22 yl13 yl23 yl14 
    yl24 yl15 yl25 yl16 yl26 yl30 yl40 yl31 yl41 yl32 yl42 yl33	yl43 yl34 yl44 
    yl35 yl45 yl36 yl46 yl50 yl60 yl51 yl61 yl52 yl62 yl53 yl63 yl54 yl64 yl55 
    yl65 yl56 yl66 lpl10 lpl20 lpl30 lpl40 lpl50 lpl60 lpl70 lpl80 lpl90 lpl100 
    lpl110 lpl120 lpl130 lpl140 lpl150 lpl160 lpl170 lpl180 lpl11 lpl21 lpl12 
    lpl22 lpl13 lpl23 lpl14 lpl24 lpl15 lpl25 lpl16 lpl26 lwl10 lwl20 lwl11 
    lwl21 lwl12 lwl22 lwl13 lwl23 lwl14 lwl24 lwl15 lwl25 lwl16 lwl26 lp10 
    lp20 lp11 lp21 lp12 lp22 lp13 lp23 lp14 lp24 lp15 lp25 lp16 lp26 lp30 
    lp40 lp50 lp60 lp70 lp80 lp90 lp100 lx10 lx20 lx11 lx21 lx12 lx22 lx13 
    lx23 lx14 lx24 lx15 lx25 lx16 lx26 rs10 lpl190 lp110 ygapl10 lw10 lp31 
    lp32 lp33 lp34 lp35 lp36 rsl70 rsl71 rsl72 rsl73 rsl75 rsl76 yl70 yl71 
    yl72 yl73 yl74 yl75 yl76 lpl31 lpl32 lpl33 lpl34 lpl35 lpl36 ygap10 lpi10 
    lpi11 lpi12 lpi13 lpi14 lpi15 lpi16 le11 le12 le13 le14 le15 le16 lpe10 
    lpe11 lpe12 lpe13 lpe14 lpe15 lpe16 one

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq outputgap output pinf4;                 //*
//**************************************************************************
    

varexo	//rs0_ 
    interest_
    rs1_ rs2_ rs3_ rs4_ rs5_ rs6_ ule1_ ule2_ ule3_ ule4_ ule5_ ule6_ rl0_ rl1_ 
    rl2_ rl3_ rl4_ rl5_ rl6_ cd0_ cn0_ cs0_ cd1_ cn1_ cs1_ cd2_ cn2_ cs2_ c3_ 
    c4_ cd5_ cn5_ cs5_  cd6_ cn6_ cs6_ ine0_ ins0_ ir0_ ii0_ if1_ ii1_ in2_ 
    ir2_ ii2_ if3_ ii3_ if4_ ii4_ in5_  ir5_ ii5_ in6_ ir6_ ii6_ lex0_ lex1_ 
    lex2_ lex3_ lex4_ lex5_ lex6_ lim0_ lim1_ lim2_  lim3_ lim4_ lim5_ lim6_ 
    lx0_ lx1_ lx2_ lx3_ lx4_ lx5_ lx6_ lp0_ lp1_ lp2_ lp3_ lp4_  lp5_ lp6_ 
    lpi0_ lpi1_ lpi2_ lpi3_ lpi4_ lpi5_ lpi6_ lpe0_ lpe1_ lpe2_ lpe3_ lpe4_ 
    lpe5_  lpe6_ fiscal_ lg1_ lg2_ lg3_ lg4_ lg5_ lg6_

//**************************************************************************
// Modelbase Shocks                                                      //*       
       ; // the Modelbase Shocks can be found above for not having to    //*
         // change the order of the variance covariance matrix           //*
//**************************************************************************
  
parameters tayrule1 mrulep1 mruley1 ybar1 tayrule2 mrulep2 mruley2 ybar2 tayrule3 
           mrulep3 mruley3 ybar3 tayrule4 mrulep4 mruley4 ybar4 tayrule5 mrulep5 
           mruley5 ybar5 tayrule6 mrulep6 mruley6 ybar6 yt0 dummy0 yt1 dummy1 
           yt2 dummy2 yt3 dummy3 yt4 dummy4 yt5 dummy5 yt6 dummy6 ybar0 exbar0  
           imbar0 gbar0 exbar1 imbar1 gbar1 exbar2 imbar2 gbar2 exbar3 imbar3 
           gbar3 exbar4 imbar4 gbar4 exbar5 imbar5 gbar5 exbar6 imbar6 gbar6 
           rhog0 rhog1 rhog2 rhog3 rhog4 rhog5 rhog6 tayrule0 tayr10 tayr20 
           leadpi20 leadpi19 leadpi18 leadpi17 leadpi16 leadpi15 leadpi14 leadpi13 
           leadpi12 leadpi11 leadpi10 leadpi9 leadpi8 leadpi7 leadpi6 leadpi5 
           leadpi4 leadpi3 leadpi2 leadpi1 leadpi0 lagpi1 lagpi2 lagpi3 lagpi4 
           taypm200 taypm190 taypm180 taypm170 taypm160 taypm150 taypm140 taypm130
           taypm120 taypm110 taypm100 taypm90 taypm80 taypm70 taypm60 taypm50 
           taypm40 taypm30 taypm20 taypm10 tayp00 tayp10 tayp20 tayp30 tayp40 
           tayp80 tayp120 tayxm80 tayxm70 tayxm60 tayxm50 tayxm40 tayxm30 tayxm20 
           tayxm10 tayx00 tayx10 tayx20 tayc0 tayfi0 tayii0 tayplm3 tayplm2 
           tayplm1 taypl00 taypl10 taypl20 taywd00 taywd10 taypi00 taypfx0

//************************************************************************** 
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        std_r_ std_r_quart;                                              //*
                                                                         //*
// load Modelbase Monetary Policy Parameters                             //*
cofintintb1 =  0.755226; 
cofintintb2 = 0; 
cofintintb3 = 0; 
cofintintb4 = 0;
cofintinf0 = 0.602691;
cofintinfb1 = 0; 
cofintinfb2 = 0; 
cofintinfb3 = 0; 
cofintinfb4 = 0; 
cofintinff1 = 0; 
cofintinff2 = 0; 
cofintinff3 = 0; 
cofintinff4 = 0;                            
cofintout = 1.17616; 
cofintoutb1 = -0.972390; 
cofintoutb2 = 0; 
cofintoutb3 = 0; 
cofintoutb4 = 0; 
cofintoutf1 = 0; 
cofintoutf2 = 0; 
cofintoutf3 = 0; 
cofintoutf4 = 0;
std_r_ = 1;
std_r_quart = 0.25;                                                   	 //*
                                                                         //*
//**************************************************************************

tayrule1 = 0;          
mrulep1  = 0.5;        
mruley1  = 0.5;        
ybar1    = 0.99639;
    
tayrule2 = 0;          
mrulep2  = 0.5;        
mruley2  = 0.5;        
ybar2    = 1.0002;

tayrule3 = 0;          
mrulep3  = 0.5;        
mruley3  = 0.5;        
ybar3    = 0.99048;
    
tayrule4 = 0;          
mrulep4  = 0.5;        
mruley4  = 0.5;        
ybar4    = 1.0062;
    
tayrule5 = 0;          
mrulep5  = 0.5;        
mruley5   = 0.5;        
ybar5    = 0.99973;
    
tayrule6 = 0;          
mrulep6  = 0.5;        
mruley6  = 0.5;        
ybar6    = 1.0238;
     
yt0      = 0.00040174; //trend term for potential output (quarterly) i.e. yt0 = exp(0.006021*t)*dummy0; t=31 (in linearized model: growth rate after half of the sample is used); 0.006021=quarterly growth rate of potential output
dummy0   = 0.00033333; //normalization factors for demand components set approximately to inverse of size of GDP
yt1      = 0.0039987;  
dummy1   = 0.003125;   
yt2      = 0.0011608;  
dummy2   = 0.00096154;
 
yt3      = 0.00083603; 
dummy3   = 0.00071429; 
yt4      = 1.5237e-005;
dummy4   = 1.2821e-005;
yt5      = 6.2473e-006;
dummy5   = 4.5455e-006;
yt6      = 0.0051023;  
dummy6   = 0.0045455;  

cdbar0  =        247.42386252*dummy0;
cnbar0  =        738.87003347*dummy0;
csbar0  =        924.90494807*dummy0;
cdbar1  =         24.63779890*dummy1;
cnbar1  =         75.38207079*dummy1;
csbar1  =         75.57866602*dummy1;
cdbar2  =         62.94401364*dummy2;
cnbar2  =        347.26234321*dummy2;
csbar2  =        247.44971113*dummy2;
cbar3   =        772.31551571*dummy3;
cbar4   =      49832.49871981*dummy4;
cdbar5  =       7297.43653599*dummy5;
cnbar5  =      60363.82918269*dummy5;
csbar5  =      61372.97000801*dummy5;
cdbar6  =         13.17116440*dummy6;
cnbar6  =         71.18118382*dummy6;
csbar6  =         48.57896654*dummy6;
inebar0 =        221.19265075*dummy0;
insbar0 =        123.71003924*dummy0;
irbar0  =        148.46178069*dummy0;
iibar0  =         13.82229302*dummy0;
ifbar1  =         67.30794487*dummy1;
iibar1  =          2.82410027*dummy1;
inbar2  =        169.00903108*dummy2;
irbar2  =         59.17720433*dummy2;
iibar2  =          8.46950767*dummy2;
ifbar3  =        306.10444913*dummy3;
iibar3  =          5.79604073*dummy3;
ifbar4  =      13926.41627827*dummy4;
iibar4  =        670.68484752*dummy4;
inbar5  =      35420.82280988*dummy5;
irbar5  =      15001.38317947*dummy5;
iibar5  =       1342.12234569*dummy5;
inbar6  =         33.41236347*dummy6;
irbar6  =          8.74249443*dummy6;
iibar6  =          0.41575733*dummy6;

ybar0    = 1.0076;     
exbar0   = 0.10002;   
imbar0   = 0.10677;    
gbar0    = 0.20462;    
exbar1   = 0.26084;    
imbar1   = 0.22944;    
gbar1    = 0.19657;    
exbar2   = 0.21535;    
imbar2   = 0.21111;    
gbar2    = 0.13115;    
exbar3   = 0.27838;    
imbar3   = 0.26312;

gbar3    = 0.19726;    
exbar4   = 0.22264;    
imbar4   = 0.19929;    
gbar4    = 0.14967;    
exbar5   = 0.13801;    
imbar5   = 0.16112;    
gbar5    = 0.1917;     
exbar6   = 0.26452;    
imbar6   = 0.25392;    
gbar6    = 0.21309;
    
rhog0    = 0.91416;    
rhog1    = 0.96567;    
rhog2    = 0.98649;    
rhog3    = 0.78663;    
rhog4    = 0.83928;    
rhog5    = 0.94509;    
rhog6    = 0.83347;    
tayrule0 = 1;          
tayr10   = 0;          
tayr20   = 0;
          
leadpi20 = 0;          
leadpi19 = 0;          
leadpi18 = 0;          
leadpi17 = 0;          
leadpi16 = 0;          
leadpi15 = 0;          
leadpi14 = 0;          
leadpi13 = 0;          
leadpi12 = 0;          
leadpi11 = 0;
          
leadpi10 = 0;          
leadpi9  = 0;          
leadpi8  = 0;          
leadpi7  = 0;          
leadpi6  = 0;          
leadpi5  = 0;         
leadpi4  = 0;          
leadpi3  = 0;          
leadpi2  = 0;          
leadpi1  = 0;
          
leadpi0  = 0.25;       
lagpi1   = 0.25;       
lagpi2   = 0.25;       
lagpi3   = 0.25;       
lagpi4   = 0;          
taypm200 = 0;          
taypm190 = 0;          
taypm180 = 0;          
taypm170 = 0;          
taypm160 = 0;
          
taypm150 = 0;          
taypm140 = 0;          
taypm130 = 0;          
taypm120 = 0;          
taypm110 = 0;          
taypm100 = 0;          
taypm90  = 0;          
taypm80  = 0;          
taypm70  = 0;          
taypm60  = 0;
          
taypm50  = 0;          
taypm40  = 0;          
taypm30  = 0;          
taypm20  = 0;          
taypm10  = 0;          
tayp00   = 0.125;      
tayp10   = 0.125;      
tayp20   = 0.125;      
tayp30   = 0.125;      
tayp40   = 0;
          
tayp80   = 0;          
tayp120  = 0;          
tayxm80  = 0;          
tayxm70  = 0;          
tayxm60  = 0;          
tayxm50  = 0;          
tayxm40  = 0;          
tayxm30  = 0;          
tayxm20  = 0;          
tayxm10  = 0;
          
tayx00   = 0.5;        
tayx10   = 0;          
tayx20   = 0;          
tayc0    = 0;          
tayfi0   = 0;          
tayii0   = 0;          
tayplm3  = 0;          
tayplm2  = 0;          
tayplm1  = 0;          
taypl00  = 0;
          
taypl10  = 0;          
taypl20  = 0;          
taywd00  = 0;          
taywd10  = 0;          
taypi00  = 0;          
taypfx0  = 0;  

model(linear);

//**************************************************************************
// Modelbase Variables                                                   //*

interest   = 100*rs0;                                                    //*
pinf4      = lp0-lp40;                                                   //*
inflation  = 100*pinf4; //annual inflation                               //*
inflationq = 100*4*(lp0-lp10); //annualized quarterly inflation          //*
outputgap  = 100*ygap0;                                                  //*
output     = 100*y0;                                                     //*

                                                                         //*
// Policy Rule                                                           //*
interest =   cofintintb1*interest(-1)                                    //*  
           + cofintintb2*interest(-2)                                    //* 
           + cofintintb3*interest(-3)                                    //*  
           + cofintintb4*interest(-4)                                    //* 
           + cofintinf0*inflation                                        //* 
           + cofintinfb1*inflation(-1)                                   //* 
           + cofintinfb2*inflation(-2)                                   //* 
           + cofintinfb3*inflation(-3)                                   //* 
           + cofintinfb4*inflation(-4)                                   //* 
           + cofintinff1*inflation(+1)                                   //* 	      
           + cofintinff2*inflation(+2)                                   //* 
           + cofintinff3*inflation(+3)                                   //* 
           + cofintinff4*inflation(+4)                                   //* 
           + cofintout*outputgap                                         //* 
           + cofintoutb1*outputgap(-1)                                   //* 
           + cofintoutb2*outputgap(-2)                                   //* 
           + cofintoutb3*outputgap(-3)                                   //* 
           + cofintoutb4*outputgap(-4)                                   //* 
           + cofintoutf1*outputgap(+1)                                   //* 
           + cofintoutf2*outputgap(+2)                                   //* 
           + cofintoutf3*outputgap(+3)                                   //* 
           + cofintoutf4*outputgap(+4)                                   //* 
           + std_r_ * interest_;                                         //*
//**************************************************************************


// Original Model Code:


dygap0   =  ygap0 - ygap10 ;//+ rs0_;
rr20     =  rl0 - (lpl40 - lp0);
rr50   =  rs0- (lpl10 - lp0) + 20.0*(rr50(+1) - rr50);
rr100   =  rs0- (lpl10 - lp0) + 40.0*(rr100(+1) - rr100);

// policy rules
rs1    =  tayrule1*(lp1 - lp31(-1) + mrulep1*(lp1 - lp31(-1)) + mruley1*y1/ybar1) + (1-tayrule1)*(- 1.956500*(- lp1) + 1.833256*(- lp11) + 0.065438*y1/ybar1) + 0.01*rs1_;
rs2    =  tayrule2*(lp2 - lp32(-1) + mrulep2*(lp2 - lp32(-1)) + mruley2*y2/ybar2) + (1-tayrule2)*(- 3.167371*(- lp2) + 2.161998*( -lp12) + 0.530050*y2/ybar2) + 0.01*rs2_;
rs3    =  tayrule3*(lp3 - lp33(-1) + mrulep3*(lp3 - lp33(-1)) + mruley3*y3/ybar3) + (1-tayrule3)*(- 1.547899*( -lp3) + 1.079499*( -lp13) + 0.624063*y3/ybar3) + 0.01*rs3_;
rs4    =  tayrule4*(lp4 - lp34(-1) + mrulep4*(lp4 - lp34(-1)) + mruley4*y4/ybar4) + (1-tayrule4)*(- 2.583022*( -lp4) + 2.310869*( -lp14) + 0.198877*y4/ybar4) + 0.01*rs4_;
rs5    =  tayrule5*(lp5 - lp35(-1) + mrulep5*(lp5 - lp35(-1)) + mruley5*y5/ybar5) + (1-tayrule5)*(- 2.085851*( -lp5) + 1.563560*( -lp15) + 0.289115*y5/ybar5) + 0.01*rs5_;
rs6    =  tayrule6*(lp6 - lp36(-1) + mrulep6*(lp6 - lp36(-1)) + mruley6*y6/ybar6) + (1-tayrule6)*(- 1.285991*( -lp6) + 1.177721*( -lp16) + 0.272787*y6/ybar6) + 0.01*rs6_;

// ex ante interest-rate parity
le1    = le1(+1) + 0.25*(rs1 - rs0) + ule1;
le2    = le2(+1) + 0.25*(rs2 - rs0) + ule2;
le3    = le3(+1) + 0.25*(rs3 - rs0) + ule3;
le4    = le4(+1) + 0.25*(rs4 - rs0) + ule4;
le5    = le5(+1) + 0.25*(rs5 - rs0) + ule5;
le6    = le6(+1) + 0.25*(rs6 - rs0) + ule6; 

// term structure
rl0    = 0.267752456729*(rs0+ 0.753116*(rsl10 + 0.753116*(rsl20 + 0.753116*(rsl30 + 0.753116*(rsl40 + 0.753116*(rsl50 + 0.753116*(rsl60 + 0.753116*(rsl70 + 0.753116*(rsl70(+1)))))))))) + 0.01*rl0_; 
rl1    = 0.536220867091*(rs1 + 0.464317*(rsl11 + 0.464317*(rsl21 + 0.464317*(rsl31 + 0.464317*(rsl41 + 0.464317*(rsl51 + 0.464317*(rsl61 + 0.464317*(rsl71 + 0.464317*(rsl71(+1)))))))))) + 0.01*rl1_;
rl2    = 0.487360392790*(rs2 + 0.513857*(rsl12 + 0.513857*(rsl22 + 0.513857*(rsl32 + 0.513857*(rsl42 + 0.513857*(rsl52 + 0.513857*(rsl62 + 0.513857*(rsl72 + 0.513857*(rsl72(+1)))))))))) + 0.01*rl2_;  
rl3    = 0.365325410230*(rs3 + 0.641385*(rsl13 + 0.641385*(rsl23 + 0.641385*(rsl33 + 0.641385*(rsl43 + 0.641385*(rsl53 + 0.641385*(rsl63 + 0.641385*(rsl73 + 0.641385*(rsl73(+1)))))))))) + 0.01*rl3_;
rl4    = rs4 + 0.01*rl4_;
rl5    = 0.279991858639*(rs5 + 0.738245*(rsl15 + 0.738245*(rsl25 + 0.738245*(rsl35 + 0.738245*(rsl45 + 0.738245*(rsl55 + 0.738245*(rsl65 + 0.738245*(rsl75 + 0.738245*(rsl75(+1)))))))))) + 0.01*rl5_;
rl6    = 0.166364985021*(rs6 + 0.894834*(rsl16 + 0.894834*(rsl26 + 0.894834*(rsl36 + 0.894834*(rsl46 + 0.894834*(rsl56 + 0.894834*(rsl66 + 0.894834*(rsl76 + 0.894834*(rsl76(+1)))))))))) + 0.01*rl6_;

// durable consumption
cd0    = 0.040036*(0.163244115*(y0 + 0.9*(yl10 + 0.9*(yl20 + 0.9*(yl30 + 0.9*(yl40 + 0.9*(yl50 + 0.9*(yl60 + 0.9*(yl70 + 0.9*(yl70(+1))))))))))) + 0.697747*cd0(-1) - 29.342915*yt0*(rl0 - lpl40 + lp0) + dummy0*cd0_; //trend in yt0 term included to prevent real-interest rate elasticity of consumption from declining over time (in linearized model: multiplied with fixed growth rate after 31 quarters)
cd1    = 0.047059*(0.163244115*(y1 + 0.9*(yl11 + 0.9*(yl21 + 0.9*(yl31 + 0.9*(yl41 + 0.9*(yl51 + 0.9*(yl61 + 0.9*(yl71 + 0.9*(yl71(+1))))))))))) + 0.632337*cd1(-1) - 7.528040*yt1*(rl1 - lpl31(+1) + lp1) + dummy1*cd1_;
cd2    = 0.079200*(0.163244115*(y2 + 0.9*(yl12 + 0.9*(yl22 + 0.9*(yl32 + 0.9*(yl42 + 0.9*(yl52 + 0.9*(yl62 + 0.9*(yl72 + 0.9*(yl72(+1))))))))))) + 0.343733*cd2(-1) - 34.504536*yt2*(rl2 - lpl32(+1)+ lp2) + dummy2*cd2_;
cd5    = 0.040712*(0.163244115*(y5 + 0.9*(yl15 + 0.9*(yl25 + 0.9*(yl35 + 0.9*(yl45 + 0.9*(yl55 + 0.9*(yl65 + 0.9*(yl75 + 0.9*(yl75(+1))))))))))) + 0.356465*cd5(-1) - 4098.146661*yt5*(rl5 - lpl35(+1) + lp5) + dummy5*cd5_;
cd6    = 0.072862*(0.163244115*(y6 + 0.9*(yl16 + 0.9*(yl26 + 0.9*(yl36 + 0.9*(yl46 + 0.9*(yl56 + 0.9*(yl66 + 0.9*(yl76 + 0.9*(yl76(+1))))))))))) + 0.516084*cd6(-1) - 0*yt6*(rl6 - lpl36(+1) + lp6) + dummy6*cd6_;  

// nondurable consumption 
cn0    = 0.097906*(0.163244115*(y0 + 0.9*(yl10 + 0.9*(yl20 + 0.9*(yl30 + 0.9*(yl40 + 0.9*(yl50 + 0.9*(yl60 + 0.9*(yl70 + 0.9*(yl70)))))))))) + 0.508379*cn0(-1) - 24.789224*yt0*(rl0 - lpl40 + lp0) + dummy0*cn0_;  
cn1    = 0.014979*(0.163244115*(y1 + 0.9*(yl11 + 0.9*(yl21 + 0.9*(yl31 + 0.9*(yl41 + 0.9*(yl51 + 0.9*(yl61 + 0.9*(yl71 + 0.9*(yl71(+1))))))))))) + 0.899088*cn1(-1) - 3.266014*yt1*(rl1 - lpl31(+1) + lp1) + dummy1*cn1_;
cn2    = 0.195613*(0.163244115*(y2 + 0.9*(yl12 + 0.9*(yl22 + 0.9*(yl32 + 0.9*(yl42 + 0.9*(yl52 + 0.9*(yl62 + 0.9*(yl72 + 0.9*(yl72(+1))))))))))) + 0.330087*cn2(-1) - 0*yt2*(rl2 - lpl32(+1) + lp2) + dummy2*cn2_;
cn5    = 0.025993*(0.163244115*(y5 + 0.9*(yl15 + 0.9*(yl25 + 0.9*(yl35 + 0.9*(yl45 + 0.9*(yl55 + 0.9*(yl65 + 0.9*(yl75 + 0.9*(yl75(+1))))))))))) + 0.822208*cn5(-1) - 0*yt5*(rl5 - lpl35(+1) + lp5) + dummy5*cn5_;
cn6    = 0.089712*(0.163244115*(y6 + 0.9*(yl16 + 0.9*(yl26 + 0.9*(yl36 + 0.9*(yl46 + 0.9*(yl56 + 0.9*(yl66 + 0.9*(yl76 + 0.9*(yl76(+1))))))))))) + 0.666482*cn6(-1) - 4.996876*yt6*(rl6 - lpl36(+1) + lp6) + dummy6*cn6_; 

// services consumption
cs0    = 0.038131*(0.163244115*(y0 + 0.9*(yl10 + 0.9*(yl20 + 0.9*(yl30 + 0.9*(yl40 + 0.9*(yl50 + 0.9*(yl60 + 0.9*(yl70 + 0.9*(yl70(+1))))))))))) + 0.906280*cs0(-1) - 0*yt0*(rl0 - lpl40 + lp0) + dummy0*cs0_;
cs1    = 0.026202*(0.163244115*(y1 + 0.9*(yl11 + 0.9*(yl21 + 0.9*(yl31 + 0.9*(yl41 + 0.9*(yl51 + 0.9*(yl61 + 0.9*(yl71 + 0.9*(yl71(+1))))))))))) + 0.911831*cs1(-1) - 0*yt1*(rl1 - lpl31(+1) + lp1) + dummy1*cs1_;
cs2    = 0.075554*(0.163244115*(y2 + 0.9*(yl12 + 0.9*(yl22 + 0.9*(yl32 + 0.9*(yl42 + 0.9*(yl52 + 0.9*(yl62 + 0.9*(yl72 + 0.9*(yl72(+1))))))))))) + 0.809747*cs2(-1) - 0*yt2*(rl2 - lpl32(+1) + lp2) + dummy2*cs2_;
cs5    = 0.093135*(0.163244115*(y5 + 0.9*(yl15 + 0.9*(yl25 + 0.9*(yl35 + 0.9*(yl45 + 0.9*(yl55 + 0.9*(yl65 + 0.9*(yl75 + 0.9*(yl75(+1))))))))))) + 0.691814*cs5(-1) - 0*yt5*(rl5 - lpl35(+1) + lp5) + dummy5*cs5_;
cs6    = 0.031536*(0.163244115*(y6 + 0.9*(yl16 + 0.9*(yl26 + 0.9*(yl36 + 0.9*(yl46 + 0.9*(yl56 + 0.9*(yl66 + 0.9*(yl76 + 0.9*(yl76(+1))))))))))) + 0.912554*cs6(-1) - 0*yt6*(rl6 - lpl36(+1) + lp6) + dummy6*cs6_;

// consumption for Germany and Italy (not disaggregated)  
c3     = 0.176731*(0.163244115*(y3 + 0.9*(yl13 + 0.9*(yl23 + 0.9*(yl33 + 0.9*(yl43 + 0.9*(yl53 + 0.9*(yl63 + 0.9*(yl73 + 0.9*(yl73(+1))))))))))) + 0.733012*c3(-1) - 95.037846*yt3*(rl3 - lpl33(+1) + lp3) + dummy3*c3_;
c4     = 0.084700*(0.163244115*(y4 + 0.9*(yl14 + 0.9*(yl24 + 0.9*(yl34 + 0.9*(yl44 + 0.9*(yl54 + 0.9*(yl64 + 0.9*(yl74 + 0.9*(yl74(+1))))))))))) + 0.876537*c4(-1) - 1203.954351*yt4*(rl4 - lpl34(+1) + lp4) + dummy4*c4_;  

// nonresidential equipment investment (ine); nonresidential structures investment (ins); residential investment (ir); inventory investment (ii)
ine0   = 0.759169*ine0(-1) + 0.042619*(0.163244115*(y0 + 0.9*(yl10 + 0.9*(yl20 + 0.9*(yl30 + 0.9*(yl40 + 0.9*(yl50 + 0.9*(yl60 + 0.9*(yl70 + 0.9*(yl70(+1))))))))))) - 98.662872*yt0*(rl0 - lpl40 + lp0) + dummy0*ine0_;
ins0   = 0.962768*ins0(-1) + 0.007254*(0.163244115*(y0 + 0.9*(yl10 + 0.9*(yl20 + 0.9*(yl30 + 0.9*(yl40 + 0.9*(yl50 + 0.9*(yl60 + 0.9*(yl70 + 0.9*(yl70(+1))))))))))) - 24.992937*yt0*(rl0 - lpl40 + lp0) + dummy0*ins0_;
ir0    = 0.613971*ir0(-1)  + 0.063050*(0.163244115*(y0 + 0.9*(yl10 + 0.9*(yl20 + 0.9*(yl30 + 0.9*(yl40 + 0.9*(yl50 + 0.9*(yl60 + 0.9*(yl70 + 0.9*(yl70(+1))))))))))) -269.518067*yt0*(rl0 - lpl40 + lp0) + dummy0*ir0_;
ii0    = 0.656318*ii0(-1)  + 0.207494*y0 - 0.200888*y0(-1) - 86.277158*yt0*(rl0 - lpl40 + lp0) + dummy0*ii0_;

if1    = 0.933232*if1(-1) + 0.025502*(0.163244115*(y1 + 0.9*(yl11 + 0.9*(yl21 + 0.9*(yl31 + 0.9*(yl41 + 0.9*(yl51 + 0.9*(yl61 + 0.9*(yl71 + 0.9*(yl71(+1))))))))))) - 9.697647*yt1*(rl1 - lpl31(+1) + lp1) + dummy1*if1_;
ii1    = 0.715112*ii1(-1) + 0.631541*y1 - 0.604745*y1(-1) - 24.337881*yt1*(rl1 - lpl31(+1) + lp1) + dummy1*ii1_;

in2    = 0.811606*in2(-1) + 0.019594*(0.163244115*(y2 + 0.9*(yl12 + 0.9*(yl22 + 0.9*(yl32 + 0.9*(yl42 + 0.9*(yl52 + 0.9*(yl62 + 0.9*(yl72 + 0.9*(yl72(+1))))))))))) + dummy2*in2_;
ir2    = 0.857641*ir2(-1) - 21.531584*yt2*(rl2 - lpl32(+1) + lp2) + dummy2*ir2_;
ii2    = 0.698647*ii2(-1) + 0.155856*y2 - 0.150925*y2(-1) - 45.009887*yt2*(rl2 - lpl32(+1) + lp2) + dummy2*ii2_;

if3    = 0.810232*if3(-1) + 0.049096*(0.163244115*(y3 + 0.9*(yl13 + 0.9*(yl23 + 0.9*(yl33 + 0.9*(yl43 + 0.9*(yl53 + 0.9*(yl63 + 0.9*(yl73 + 0.9*(yl73(+1))))))))))) - 213.802663*yt3*(rl3 - lpl33(+1) + lp3) + dummy3*if3_;
ii3    = 0.326051*ii3(-1) + 0.177627*y3 - 0.171459*y3(-1) - 261.311394*yt3*(rl3 - lpl33(+1) + lp3) + dummy3*ii3_;

if4    = 0.906866*if4(-1) + 0.030282*(0.163244115*(y4 + 0.9*(yl14 + 0.9*(yl24 + 0.9*(yl34 + 0.9*(yl44 + 0.9*(yl54 + 0.9*(yl64 + 0.9*(yl74 + 0.9*(yl74(+1))))))))))) - 3015.818496*yt4*(rl4 - lpl34(+1) + lp4) + dummy4*if4_;
ii4    = 0.543133*ii4(-1) + 0.560677*y4 - 0.514888*y4(-1) - 7551.414350*yt4*(rl4 - lpl34(+1) + lp4) + dummy4*ii4_;

in5    = 0.898810*in5(-1) + 0.040603*(0.163244115*(y5 + 0.9*(yl15 + 0.9*(yl25 + 0.9*(yl35 + 0.9*(yl45 + 0.9*(yl55 + 0.9*(yl65 + 0.9*(yl75 + 0.9*(yl75(+1))))))))))) - 13453.512916*yt5*(rl5 - lpl35(+1) + lp5) + dummy5*in5_;
ir5    = 0.823210*ir5(-1) - 2577.509255*yt5*(rl5 - lpl35(+1) + lp5) + dummy5*ir5_;
ii5    = 0.296271*ii5(-1) - 0.305864*y5 + 0.323035*y5(-1) - 16349.191748*yt5*(rl5 - lpl35(+1) + lp5) + dummy5*ii5_;

in6    = 0.726412*in6(-1) + 0.033597*(0.163244115*(y6 + 0.9*(yl16 + 0.9*(yl26 + 0.9*(yl36 + 0.9*(yl46 + 0.9*(yl56 + 0.9*(yl66 + 0.9*(yl76 + 0.9*(yl76(+1))))))))))) - 4.022227*yt6*(rl6 - lpl36(+1) + lp6) + dummy6*in6_;
ir6    = 0.727523*ir6(-1) - 1.330503*yt6*(rl6 - lpl36(+1) + lp6) + dummy6*ir6_;
ii6    = 0.639135*ii6(-1) + 0.034235*y6 - 0.035887*y6(-1) - 2.522000*yt6*(rl6 - lpl36(+1) + lp6) + dummy6*ii6_;

//real exports
lex0   = 0.794366*lex0(-1) - 0.150669*(lpe0-lpi0) + 0.230363*(0.091*y1/ybar1 + 0.175*y2/ybar2 + 0.265*y3/ybar3 + 0.123*y4/ybar4 + 0.189*y5/ybar5 + 0.157*y6/ybar6) + 0.01*lex0_;
lex1   = 0.581493*lex1(-1) - 0.324658*(lpe1-lpi1) + 1.014557*(0.268*y0/ybar0 + 0.141*y2/ybar2 + 0.213*y3/ybar3 + 0.099*y4/ybar4 + 0.152*y5/ybar5 + 0.127*y6/ybar6) + 0.01*lex1_;
lex2   = 0.508914*lex2(-1) - 0.375950*(lpe2-lpi2) + 0.999121*(0.287*y0/ybar0 + 0.079*y1/ybar1 + 0.229*y3/ybar3 + 0.106*y4/ybar4 + 0.163*y5/ybar5 + 0.136*y6/ybar6) + 0.01*lex2_;
lex3   = 0.532222*lex3(-1) - 0.340291*(lpe3-lpi3) + 0.684491*(0.311*y0/ybar0 + 0.085*y1/ybar1 + 0.164*y2/ybar2 + 0.116*y4/ybar4 + 0.177*y5/ybar5 + 0.147*y6/ybar6) + 0.01*lex3_;
lex4   = 0.704032*lex4(-1) - 0.079844*(lpe4-lpi4) + 0.594719*(0.275*y0/ybar0 + 0.075*y1/ybar1 + 0.145*y2/ybar2 + 0.219*y3/ybar3 + 0.156*y5/ybar5 + 0.130*y6/ybar6) + 0.01*lex4_;
lex5   = 0.814074*lex5(-1) - 0.153263*(lpe5-lpi5) + 0.372469*(0.291*y0/ybar0 + 0.079*y1/ybar1 + 0.153*y2/ybar2 + 0.232*y3/ybar3 + 0.108*y4/ybar4 + 0.137*y6/ybar6) + 0.01*lex5_;
lex6   = 0.130558*lex6(-1) - 0.369852*(lpe6-lpi6) + 1.128672*(0.283*y0/ybar0 + 0.077*y1/ybar1 + 0.149*y2/ybar2 + 0.225*y3/ybar3 + 0.105*y4/ybar4 + 0.161*y5/ybar5) + 0.01*lex6_;

//real imports
lim0   = 0.440069*lim0(-1) - 0.216498*(lpi0-lp0) + 1.274518*y0/ybar0 + 0.01*lim0_;
lim1   = 0.679052*lim1(-1) - 0.100330*(lpi1-lp1) + 0.497822*y1/ybar1 + 0.01*lim1_;
lim2   = 0.687657*lim2(-1) - 0.147787*(lpi2-lp2) + 0.698130*y2/ybar2 + 0.01*lim2_;
lim3   = 0.290667*lim3(-1) + 0*(lpi3-lp3) + 1.324583*y3/ybar3 + 0.01*lim3_;  
lim4   = 0.414376*lim4(-1) - 0.190000*(lpi4-lp4) + 1.176764*y4/ybar4 + 0.01*lim4_;
lim5   = 0.902181*lim5(-1) - 0.081189*(lpi5-lp5) + 0.110926*y5/ybar5 + 0.01*lim5_; 
lim6   = 0.650631*lim6(-1) - 0.061169*(lpi6-lp6) + 0.656945*y6/ybar6 + 0.01*lim6_;

//real gnp (or gdp for France, Italy and the UK)
y0     = cd0 + cn0 + cs0 + ine0 + ins0 + ir0 + ii0 + exbar0*lex0 - imbar0*lim0 + gbar0*lg0; 
y1     = cd1 + cn1 + cs1 + if1 + ii1 + exbar1*lex1 - imbar1*lim1 + gbar1*lg1;
y2     = cd2 + cn2 + cs2 + in2 + ir2 + ii2 + exbar2*lex2 - imbar2*lim2 + gbar2*lg2; 
y3     = c3 + if3 + ii3 + exbar3*lex3 - imbar3*lim3 + gbar3*lg3; 
y4     = c4 + if4 + ii4 + exbar4*lex4 - imbar4*lim4 + gbar4*lg4;
y5     = cd5 + cn5 + cs5 + in5 + ir5 + ii5 + exbar5*lex5 - imbar5*lim5 + gbar5*lg5;
y6     = cd6 + cn6 + cs6 + in6 + ir6 + ii6 + exbar6*lex6 - imbar6*lim6 + gbar6*lg6;

//contract wage determination
lx0    = 0.32704*(lw0 + 0.029763*y0/ybar0) + 0.27436*(lwl10 + 0.029763*yl10/ybar0) + 0.19930*(lwl20 + 0.029763*yl20/ybar0) + 0.19930*(lwl20(+1) + 0.029763*yl30/ybar0) + 0.01*lx0_; 
lx1    = 0.44989*(lw1 + 0.054075*y1/ybar1) + 0.31735*(lwl11 + 0.054075*yl11/ybar1) + 0.11638*(lwl21 + 0.054075*yl21/ybar1) + 0.11638*(lwl21(+1) + 0.054075*yl31/ybar1) + 0.01*lx1_; 
lx2    = 0.51173*(lw2 + 0.036756*y2/ybar2) + 0.28827*(lwl12 + 0.036756*yl12/ybar2) + 0.10000*(lwl22 + 0.036756*yl22/ybar2) + 0.10000*(lwl22(+1) + 0.036756*yl32/ybar2) + 0.01*lx2_; 
lx3    = 0.50243*(lw3 + 0.039324*y3/ybar3) + 0.28925*(lwl13 + 0.039324*yl13/ybar3) + 0.10416*(lwl23 + 0.039324*yl23/ybar3) + 0.10416*(lwl23(+1) + 0.039324*yl33/ybar3) + 0.01*lx3_;
lx4    = 0.49913*(lw4 + 0.10839*y4/ybar4)  + 0.30087*(lwl14 + 0.10839*yl14/ybar4) + 0.10000*(lwl24 + 0.10839*yl24/ybar4) + 0.10000*(lwl24(+1) + 0.10839*yl34/ybar4) + 0.01*lx4_; 
lx5    = 0.340475*(lw5 + 0.29649*y5/ybar5) + 0.222275*(lwl15 + 0.29649*yl15/ybar5) + 0.218625*(lwl25 + 0.29649*yl25/ybar5) + 0.218625*(lwl25(+1) + 0.29649*yl35/ybar5) + 0.01*lx5_; 
lx6    = 0.52716*(lw6 + 0.052835*y6/ybar6) + 0.27284*(lwl16 + 0.052835*yl16/ybar6) + 0.10000*(lwl26 + 0.052835*yl26/ybar6) + 0.10000*(lwl26(+1) + 0.052835*yl36/ybar6) + 0.01*lx6_; 
     
// aggregate wage
lw0    = 0.32704*lx0 + 0.27436*lx10 + 0.19930*lx20 + 0.19930*lx20(-1);
lw1    = 0.44989*lx1 + 0.31735*lx11 + 0.11638*lx21 + 0.11638*lx21(-1); 
lw2    = 0.51173*lx2 + 0.28827*lx12 + 0.10000*lx22 + 0.10000*lx22(-1);
lw3    = 0.50243*lx3 + 0.28925*lx13 + 0.10416*lx23 + 0.10416*lx23(-1); 
lw4    = 0.49913*lx4 + 0.30087*lx14 + 0.10000*lx24 + 0.10000*lx24(-1); 
lw5    = 0.340475*lx5 + 0.222275*lx15 + 0.218625*lx25 + 0.218625*lx25(-1); 
lw6    = 0.52716*lx6 + 0.27284*lx16 + 0.10000*lx26 + 0.10000*lx26(-1);

//aggregate price
lp0    = 1.088743*lp10 - 0.295658*lp20 + 0.454517*lw0 - 0.259299*lw10 + 0.027232*lpi10 - 0.015535*lpi10(-1) + 0.01*lp0_; 
lp1    = 1.559540*lp11 - 0.599187*lp21 + 0.100062*lw1 - 0.068610*lw1(-1) + 0.026074*(0.268*lp10 - le11 + 0.141*(lp12 + le12) + 0.213*(lp13 + le13) + 0.099*(lp14 + le14) + 0.152*(lp15 + le15) + 0.127*(lp16 + le16)) - 0.017879*(0.268*lp20 - le11(-1) + 0.141*(lp22 + le12(-1)) + 0.213*(lp23 + le13(-1)) + 0.099*(lp24 + le14(-1)) + 0.152*(lp25 + le15(-1)) + 0.127*(lp26 + le16(-1))) + 0.01*lp1_; 
lp2    = 1.125662*lp12 - 0.227201*lp22 + 0.101682*lw2 - 0.026797*lw2(-1) + 0.036192*lpi12 - 0.009538*lpi12(-1) + 0.01*lp2_; 
lp3    = 0.848208*lp13 + 0.132416*lw3 + 0.019376*(0.311*lp10 - le13 + 0.085*(lp11 + le11) + 0.164*(lp12 + le12) + 0.116*(lp14 + le14) + 0.177*(lp15 + le15) + 0.147*(lp16 + le16)) + 0.01*lp3_; 
lp4    = 1.190099*lp14 - 0.286187*lp24 + 0.111369*lw4 - 0.037250*lw4(-1) + 0.033011*lpi14 - 0.011042*lpi14(-1) + 0.01*lp4_; 
lp5    = 1.785110*lp15 - 0.795084*lp25 + 0.052518*lw5 - 0.044794*lw5(-1) + 0.015293*lpi15 - 0.013043*lpi15(-1) + 0.01*lp5_; 
lp6    = 1.404124*lp16 - 0.490370*lp26 + 0.160132*lw6 - 0.104382*lw6(-1) + 0.087596*lpi16 - 0.057100*lpi16(-1) + 0.01*lp6_; 
 
//import price
lpi0   = 1.487969*lpi10 - 0.531068*lpi10(-1) + 0.106199*(0.091*(lp1 + le1) + 0.175*(lp2 + le2) + 0.265*(lp3 + le3) + 0.123*(lp4 + le4) + 0.189*(lp5 + le5) + 0.157*(lp6 + le6)) - 0.063100*(0.091*(lp11 + le11) + 0.175*(lp12 + le12) + 0.265*(lp13 + le13) + 0.123*(lp14 + le14) + 0.189*(lp15 + le15) + 0.157*(lp16 + le16)) + 0.01*lpi0_; 
lpi1   = 1.634182*lpi11 - 0.661753*lpi11(-1) + 0.106199*(0.268*lp0 - le1 + 0.141*(lp2 + le2) + 0.213*(lp3 + le3) + 0.099*(lp4 + le4) + 0.152*(lp5 + le5) + 0.127*(lp6 + le6)) - 0.078628*(0.268*lp10 - le11 + 0.141*(lp12 + le12) + 0.213*(lp13 + le13) + 0.099*(lp14 + le14) + 0.152*(lp15 + le15) + 0.127*(lp16 + le16)) + 0.01*lpi1_;    
lpi2   = 1.303861*lpi12 - 0.313229*lpi12(-1) + 0.682412*(0.287*lp0 - le2 + 0.079*(lp1 + le1) + 0.229*(lp3 + le3) + 0.106*(lp4 + le4) + 0.163*(lp5 + le5) + 0.136*(lp6 + le6)) - 0.673044*(0.287*lp10 - le12 + 0.079*(lp11 + le11) + 0.229*(lp13 + le13) + 0.106*(lp14 + le14) + 0.163*(lp15 + le15) + 0.136*(lp16 + le16)) + 0.01*lpi2_;    
lpi3   = 1.649893*lpi13 - 0.680513*lpi13(-1) + 0.179918*(0.311*lp0 - le3 + 0.085*(lp1 + le1) + 0.164*(lp2 + le2) + 0.116*(lp4 + le4) + 0.177*(lp5 + le5) + 0.147*(lp6 + le6)) - 0.149298*(0.311*lp10 - le13 + 0.085*(lp11 + le11) + 0.164*(lp12 + le12) + 0.116*(lp14 + le14) + 0.177*(lp15 + le15) + 0.147*(lp16 + le16)) + 0.01*lpi3_;                    
lpi4   = 1.487061*lpi14 - 0.526309*lpi14(-1) + 0.419347*(0.275*lp0 - le4 + 0.075*(lp1 + le1) + 0.145*(lp2 + le2) + 0.219*(lp3 + le3) + 0.156*(lp5 + le5) + 0.130*(lp6 + le6)) - 0.380099*(0.275*lp10 - le14 + 0.075*(lp11 + le11) + 0.145*(lp12 + le12) + 0.219*(lp13 + le13) + 0.156*(lp15 + le15) + 0.130*(lp16 + le16)) + 0.01*lpi4_;    
lpi5   = 1.367766*lpi15 - 0.414996*lpi15(-1) + 0.545684*(0.291*lp0 - le5 + 0.079*(lp1 + le1) + 0.153*(lp2 + le2) + 0.232*(lp3 + le3) + 0.108*(lp4 + le4) + 0.137*(lp6 + le6)) - 0.498454*(0.291*lp10 - le15 + 0.079*(lp11 + le11) + 0.153*(lp12 + le12) + 0.232*(lp13 + le13) + 0.108*(lp14 + le14) + 0.137*(lp16 + le16)) + 0.01*lpi5_;  
lpi6   = 1.470613*lpi16 - 0.507596*lpi16(-1) + 0.446572*(0.283*lp0 - le6 + 0.077*(lp1 + le1) + 0.149*(lp2 + le2) + 0.225*(lp3 + le3) + 0.105*(lp4 + le4) + 0.161*(lp5 + le5)) - 0.409589*(0.283*lp10 - le16 + 0.077*(lp11 + le11) + 0.149*(lp12 + le12) + 0.225*(lp13 + le13) + 0.105*(lp14 + le14) + 0.161*(lp15 + le15)) + 0.01*lpi6_;    

//export price
lpe0   = 1.496438*lpe10 - 0.526481*lpe10(-1) + 0.434402*lp0 - 0.404359*lp10 + 0.01*lpe0_; 
lpe1   = 1.333433*lpe11 - 0.378879*lpe11(-1) + 0.589471*lp1 - 0.544025*lp11 + 0.01*lpe1_; 
lpe2   = 1.324253*lpe12 - 0.436685*lpe12(-1) + 0.296323*lp2 - 0.183891*lp12 + 0.01*lpe2_; 
lpe3   = 1.618395*lpe13 - 0.654678*lpe13(-1) + 0.143262*lp3 - 0.117509*lp13 + 0.058586*(0.311*lp0 - le3 + 0.085*(lp1 + le1) + 0.164*(lp2 + le2) + 0.116*(lp4 + le4) + 0.177*(lp5 + le5) + 0.147*(lp6 + le6)) - 0.048056*(0.311*lp10 - le13 + 0.085*(lp11 + le11) + 0.164*(lp12 + le12) + 0.116*(lp14 + le14) + 0.177*(lp15 + le15) + 0.147*(lp16 + le16)) + 0.01*lpe3_; 
lpe4   = 1.154987*lpe14 - 0.242117*lpe14(-1) + 0.276511*lp4 - 0.243271*lp14 + 0.448290*(0.275*lp0 - le4 + 0.075*(lp1 + le1) + 0.145*(lp2 + le2) + 0.219*(lp3 + le3) + 0.156*(lp5 + le5) + 0.130*(lp6 + le6)) - 0.394400*(0.275*lp10 - le14 + 0.075*(lp11 + le11) + 0.145*(lp12 + le12) + 0.219*(lp13 + le13) + 0.156*(lp15 + le15) + 0.130*(lp16 + le16)) + 0.01*lpe4_; 
lpe5   = 1.163789*lpe15 - 0.251802*lpe15(-1) + 0.385888*lp5 - 0.338235*lp15 + 0.326834*(0.291*lp0 - le5 + 0.079*(lp1 + le1) + 0.153*(lp2 + le2) + 0.232*(lp3 + le3) + 0.108*(lp4 + le4) + 0.137*(lp6 + le6)) - 0.286474*(0.291*lp10 - le15 + 0.079*(lp11 + le11) + 0.153*(lp12 + le12) + 0.232*(lp13 + le13) + 0.108*(lp14 + le14) + 0.137*(lp16 + le16)) + 0.01*lpe5_; 
lpe6   = 1.541207*lpe16 - 0.565219*lpe16(-1) + 0.220616*lp6 - 0.207324*lp16 + 0.177926*(0.283*lp0 - le6 + 0.077*(lp1 + le1) + 0.149*(lp2 + le2) + 0.225*(lp3 + le3) + 0.105*(lp4 + le4) + 0.161*(lp5 + le5)) - 0.167206*(0.283*lp10 - le16 + 0.077*(lp11 + le11) + 0.149*(lp12 + le12) + 0.225*(lp13 + le13) + 0.105*(lp14 + le14) + 0.161*(lp15 + le15)) + 0.01*lpe6_;


//original fiscal rule:
//lg0    = rhog0*lg0(-1) + fiscal_; 

lg0    = rhog0*lg0(-1) + 0.01*(1/gbar0)*fiscal_; 


lg1    = rhog1*lg1(-1) + 0.01*lg1_;
lg2    = rhog2*lg2(-1) + 0.01*lg2_;
lg3    = rhog3*lg3(-1) + 0.01*lg3_; 
lg4    = rhog4*lg4(-1) + 0.01*lg4_;
lg5    = rhog5*lg5(-1) + 0.01*lg5_;
lg6    = rhog6*lg6(-1) + 0.01*lg6_;  
 
// interest-rate parity shock process
ule1   = 0.5*ule1(-1) + 0.01*ule1_;
ule2   = 0.5*ule2(-1) + 0.01*ule2_;  
ule3   = 0.5*ule3(-1) + 0.01*ule3_; 
ule4   = 0.5*ule4(-1) + 0.01*ule4_;
ule5   = 0.5*ule5(-1) + 0.01*ule5_;
ule6   = 0.5*ule6(-1) + 0.01*ule6_;         

rsl10  = rs0(+1);
rsl20  = rsl10(+1); 
rsl11  = rs1(+1);
rsl21  = rsl11(+1); 
rsl12  = rs2(+1);
rsl22  = rsl12(+1); 
rsl13  = rs3(+1);
rsl23  = rsl13(+1);
rsl15  = rs5(+1);
rsl25  = rsl15(+1);
rsl16  = rs6(+1); 
rsl26  = rsl16(+1); 
rsl30  = rsl20(+1); 
rsl40  = rsl30(+1);
rsl31  = rsl21(+1);
rsl41  = rsl31(+1);
rsl32  = rsl22(+1);
rsl42  = rsl32(+1);
rsl33  = rsl23(+1); 
rsl43  = rsl33(+1);
rsl35  = rsl25(+1); 
rsl45  = rsl35(+1);
rsl36  = rsl26(+1);
rsl46  = rsl36(+1); 
rsl50  = rsl40(+1); 
rsl60  = rsl50(+1);
rsl51  = rsl41(+1);
rsl61  = rsl51(+1); 
rsl52  = rsl42(+1); 
rsl62  = rsl52(+1); 
rsl53  = rsl43(+1); 
rsl63  = rsl53(+1); 
rsl55  = rsl45(+1); 
rsl65  = rsl55(+1); 
rsl56  = rsl46(+1); 
rsl66  = rsl56(+1); 

yl10   = y0(+1); 
yl20   = yl10(+1);
yl11   = y1(+1); 
yl21   = yl11(+1); 
yl12   = y2(+1);
yl22   = yl12(+1); 
yl13   = y3(+1);
yl23   = yl13(+1);
yl14   = y4(+1);
yl24   = yl14(+1);
yl15   = y5(+1);
yl25   = yl15(+1); 
yl16   = y6(+1); 
yl26   = yl16(+1); 
yl30   = yl20(+1); 
yl40   = yl30(+1);
yl31   = yl21(+1); 
yl41   = yl31(+1);
yl32   = yl22(+1); 
yl42   = yl32(+1); 
yl33   = yl23(+1); 
yl43   = yl33(+1);
yl34   = yl24(+1); 
yl44   = yl34(+1); 
yl35   = yl25(+1); 
yl45   = yl35(+1);
yl36   = yl26(+1); 
yl46   = yl36(+1);
yl50   = yl40(+1);
yl60   = yl50(+1);
yl51   = yl41(+1);
yl61   = yl51(+1); 
yl52   = yl42(+1); 
yl62   = yl52(+1); 
yl53   = yl43(+1); 
yl63   = yl53(+1); 
yl54   = yl44(+1); 
yl64   = yl54(+1);
yl55   = yl45(+1); 
yl65   = yl55(+1); 
yl56   = yl46(+1); 
yl66   = yl56(+1); 

lpl10  = lp0(+1); 
lpl20  = lpl10(+1); 
lpl30  = lpl20(+1); 
lpl40  = lpl30(+1); 
lpl50  = lpl40(+1); 
lpl60  = lpl50(+1);
lpl70  = lpl60(+1); 
lpl80  = lpl70(+1); 
lpl90  = lpl80(+1); 
lpl100 = lpl90(+1); 
lpl110 = lpl100(+1); 
lpl120 = lpl110(+1);
lpl130 = lpl120(+1); 
lpl140 = lpl130(+1); 
lpl150 = lpl140(+1); 
lpl160 = lpl150(+1); 
lpl170 = lpl160(+1); 
lpl180 = lpl170(+1); 
lpl11  = lp1(+1); 
lpl21  = lpl11(+1); 
lpl12  = lp2(+1);
lpl22  = lpl12(+1); 
lpl13  = lp3(+1); 
lpl23  = lpl13(+1); 
lpl14  = lp4(+1); 
lpl24  = lpl14(+1); 
lpl15  = lp5(+1); 
lpl25  = lpl15(+1); 
lpl16  = lp6(+1); 
lpl26  = lpl16(+1); 

lwl10  = lw0(+1); 
lwl20  = lwl10(+1); 
lwl11  = lw1(+1); 
lwl21  = lwl11(+1); 
lwl12  = lw2(+1); 
lwl22  = lwl12(+1); 
lwl13  = lw3(+1); 
lwl23  = lwl13;
lwl14  = lw4(+1); 
lwl24  = lwl14(+1); 
lwl15  = lw5(+1); 
lwl25  = lwl15(+1); 
lwl16  = lw6(+1); 
lwl26  = lwl16(+1);

lp10   = lp0(-1);
lp20   = lp10(-1);
lp11   = lp1(-1);
lp21   = lp11(-1); 
lp12   = lp2(-1);
lp22   = lp12(-1); 
lp13   = lp3(-1);
lp23   = lp13(-1);
lp14   = lp4(-1); 
lp24   = lp14(-1);
lp15   = lp5(-1); 
lp25   = lp15(-1);
lp16   = lp6(-1); 
lp26   = lp16(-1);  

lx10   = lx0(-1); 
lx20   = lx10(-1);
lx11   = lx1(-1);
lx21   = lx11(-1);
lx12   = lx2(-1);
lx22   = lx12(-1);
lx13   = lx3(-1); 
lx23   = lx13(-1); 
lx14   = lx4(-1); 
lx24   = lx14(-1); 
lx15   = lx5(-1);
lx25   = lx15(-1);
lx16   = lx6(-1);
lx26   = lx16(-1);

lp30   = lp20(-1);
lp40   = lp30(-1);
lp50   = lp40(-1); 
lp60   = lp50(-1);
lp70   = lp60(-1);
lp80   = lp70(-1);
lp90   = lp80(-1); 
lp100  = lp90(-1);

pdot0  = 4*(lp0 - lp10); 
drs0   = rs0- rs10; 
dletw0 = 4*( 0.091*(le1-le11) + 0.175*(le2-le12) + 0.265*(le3-le13) + 0.123*(le4-le14) + 0.189*(le5-le15) + 0.157*(le6-le16));
lretw0 = 0.091*(lp1 + le1) + 0.175*(lp2 + le2) + 0.265*(lp3 + le3) + 0.123*(lp4 + le4) + 0.189*(lp5 + le5) + 0.157*(lp6 + le6) - lp0; 
dretw0 = 4*(lretw0 - lretw0(-1));
fgdp0  = 0.091*y1/ybar1 + 0.175*y2/ybar2 + 0.265*y3/ybar3 + 0.123*y4/ybar4 + 0.189*y5/ybar5 + 0.157*y6/ybar6;  
fpdot0 = 4*( 0.091*(lp1-lp11) + 0.175*(lp2-lp12) + 0.265*(lp2-lp12) + 0.123*(lp4-lp14) + 0.189*(lp5-lp15) + 0.157*(lp6-lp16)); 
frs0   = 0.091*rs1 + 0.175*rs2 + 0.265*rs3 + 0.123*rs4 + 0.189*rs5 + 0.157*rs6;
dfrs0  = 0.091*(rs1-rs1(-1)) + 0.175*(rs2-rs2(-1)) + 0.265*(rs3-rs3(-1)) + 0.123*(rs4-rs4(-1)) + 0.189*(rs5-rs5(-1)) + 0.157*(rs6-rs6(-1));
ygap0  = y0/ybar0; 
rs10   = rs0(-1); 
lpl190 = lpl180(+1); 
lp110  = lp100(-1);
ygapl10= ygap0(+1);
lw10   = lw0(-1);

lp31   =  lp21(-1); 
lp32   =  lp22(-1); 
lp33   =  lp23(-1);
lp34   =  lp24(-1); 
lp35   =  lp25(-1);
lp36   =  lp26(-1);
 
rsl70  =  rsl60(+1);
rsl71  =  rsl61(+1);
rsl72  =  rsl62(+1);
rsl73  =  rsl63(+1);
rsl75  =  rsl65(+1); 
rsl76  =  rsl66(+1);
yl70   =  yl60(+1);
yl71   =  yl61(+1);
yl72   =  yl62(+1);
yl73   =  yl63(+1);
yl74   =  yl64(+1); 
yl75   =  yl65(+1);
yl76   =  yl66(+1);
lpl31  =  lpl21(+1);
lpl32  =  lpl22(+1);
lpl33  =  lpl23(+1);
lpl34  =  lpl24(+1);
lpl35  =  lpl25(+1);
lpl36  =  lpl26(+1);
 
ygap10 =  ygap0(-1);
lpi10  =  lpi0(-1);
lpi11  =  lpi1(-1);
lpi12  =  lpi2(-1);
lpi13  =  lpi3(-1);
lpi14  =  lpi4(-1);
lpi15  =  lpi5(-1);
lpi16  =  lpi6(-1);
le11   =  le1(-1); 
le12   =  le2(-1);
le13   =  le3(-1);
le14   =  le4(-1);
le15   =  le5(-1); 
le16   =  le6(-1); 
lpe10  =  lpe0(-1); 
lpe11  =  lpe1(-1); 
lpe12  =  lpe2(-1);
lpe13  =  lpe3(-1); 
lpe14  =  lpe4(-1); 
lpe15  =  lpe5(-1);
lpe16  =  lpe6(-1);
one    =  one(-1);
end;

//Steady;
//Check;

// Sigma_e = eye(105);

shocks;
var interest_ = 1;
end;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
stoch_simul (irf = 17, noprint, nograph) inflation inflationq interest outputgap; 