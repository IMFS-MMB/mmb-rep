%Params to Foreign VAR
ForLag1  = A1_for;
ForLag2  = A2_for;
ForLag3  = A3_for;
ForLag4  = A4_for;
ForShock = B0_for;


%Lag 1
ForLag111 = ForLag1(1,1);
ForLag112 = ForLag1(1,2);
ForLag113 = ForLag1(1,3);
ForLag121 = ForLag1(2,1);
ForLag122 = ForLag1(2,2);
ForLag123 = ForLag1(2,3);
ForLag131 = ForLag1(3,1);
ForLag132 = ForLag1(3,2);
ForLag133 = ForLag1(3,3);
%Lag 2
ForLag211 = ForLag2(1,1);
ForLag212 = ForLag2(1,2);
ForLag213 = ForLag2(1,3);
ForLag221 = ForLag2(2,1);
ForLag222 = ForLag2(2,2);
ForLag223 = ForLag2(2,3);
ForLag231 = ForLag2(3,1);
ForLag232 = ForLag2(3,2);
ForLag233 = ForLag2(3,3);
%Lag 3
ForLag311 = ForLag3(1,1);
ForLag312 = ForLag3(1,2);
ForLag313 = ForLag3(1,3);
ForLag321 = ForLag3(2,1);
ForLag322 = ForLag3(2,2);
ForLag323 = ForLag3(2,3);
ForLag331 = ForLag3(3,1);
ForLag332 = ForLag3(3,2);
ForLag333 = ForLag3(3,3);
%Lag 4
ForLag411 = ForLag4(1,1);
ForLag412 = ForLag4(1,2);
ForLag413 = ForLag4(1,3);
ForLag421 = ForLag4(2,1);
ForLag422 = ForLag4(2,2);
ForLag423 = ForLag4(2,3);
ForLag431 = ForLag4(3,1);
ForLag432 = ForLag4(3,2);
ForLag433 = ForLag4(3,3);
%For Shock
ForShock11 = B0_for(1,1);
ForShock12 = B0_for(1,2);
ForShock13 = B0_for(1,3);
ForShock21 = B0_for(2,1);
ForShock22 = B0_for(2,2);
ForShock23 = B0_for(2,3);
ForShock31 = B0_for(3,1);
ForShock32 = B0_for(3,2);
ForShock33 = B0_for(3,3);


%Params to Fiscal VAR
FisLag1  = A1_fis([2:3 5],[2:3 5]);
FisLag2  = A2_fis([2:3 5],[2:3 5]);
FisShock = B0_fis;

%Lag 1
FisLag111 = FisLag1(1,1);
FisLag112 = FisLag1(1,2);
FisLag113 = FisLag1(1,3);
FisLag121 = FisLag1(2,1);
FisLag122 = FisLag1(2,2);
FisLag123 = FisLag1(2,3);
FisLag131 = FisLag1(3,1);
FisLag132 = FisLag1(3,2);
FisLag133 = FisLag1(3,3);
%Lag 2
FisLag211 = FisLag2(1,1);
FisLag212 = FisLag2(1,2);
FisLag213 = FisLag2(1,3);
FisLag221 = FisLag2(2,1);
FisLag222 = FisLag2(2,2);
FisLag223 = FisLag2(2,3);
FisLag231 = FisLag2(3,1);
FisLag232 = FisLag2(3,2);
FisLag233 = FisLag2(3,3);
%Fis Shock
FisShock11 = FisShock(1,1);     %tauk
FisShock12 = FisShock(1,2);     %tauy
FisShock13 = FisShock(1,3);     %tauc
FisShock14 = FisShock(1,4);     %tauw
FisShock15 = FisShock(1,5);     %g_gap
FisShock21 = FisShock(2,1);
FisShock22 = FisShock(2,2);
FisShock23 = FisShock(2,3);
FisShock24 = FisShock(2,4);
FisShock25 = FisShock(2,5);
FisShock31 = FisShock(3,1);
FisShock32 = FisShock(3,2);
FisShock33 = FisShock(3,3);
FisShock34 = FisShock(3,4);
FisShock35 = FisShock(3,5);
FisShock41 = FisShock(4,1);
FisShock42 = FisShock(4,2);
FisShock43 = FisShock(4,3);
FisShock44 = FisShock(4,4);
FisShock45 = FisShock(4,5);
FisShock51 = FisShock(5,1);
FisShock52 = FisShock(5,2);
FisShock53 = FisShock(5,3);
FisShock54 = FisShock(5,4);
FisShock55 = FisShock(5,5);


