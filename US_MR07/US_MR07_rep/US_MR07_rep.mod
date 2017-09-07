var x pi y yn i l p w R g a e v gam da
    p1 w1 l1 R1 y1 
    p2 w2 l2 R2 y2   
    p3 w3 l3 R3 y3  
    p4 w4 l4 R4 y4   
    p5 w5 l5 R5 y5   
    p6 w6 l6 R6 y6  
    p7 w7 l7 R7 y7  
    p8 w8 l8 R8 y8  
    p9 w9 l9 R9 y9  
    p10 w10 l10 R10 y10  
    p11 w11 l11 R11 y11  
    p12 w12 l12 R12 y12  
    p13 w13 l13 R13 y13  
    p14 w14 l14 R14 y14  
    p15 w15 l15 R15 y15  
    p16 w16 l16 R16 y16  
    p17 w17 l17 R17 y17  
    p18 w18 l18 R18 y18  
    p19 w19 l19 R19 y19  
    p20 w20 l20 R20 y20  
    p21 w21 l21 R21 y21  
    p22 w22 l22 R22 y22  
    p23 w23 l23 R23 y23  
    p24 w24 l24 R24 y24  
    p25 w25 l25 R25 y25  
    p26 w26 l26 R26 y26  
    p27 w27 l27 R27 y27  
    p28 w28 l28 R28 y28  
    p29 w29 l29 R29 y29  
    p30 w30 l30 R30 y30  
    y100;
    
varexo g_e a_e e_e v_e gam_e;

parameters delta lambda omega beta phi_p phi_y mu theta psi gamma rho_g rho_a rho_e rho_v rho_gam;

delta  = 0.184; //0.176
lambda = 0.702; //0.657
omega  = 0.195; //0.210
beta   = 2/3;
phi_p  = 1.24;
phi_y  = 0.33;
mu     = 34.068; //20.547
theta  = 1;
psi    = 4; 
gamma  = 4.196; //6.884
rho_g  = 0.938;
rho_a  = 0.35;
rho_e  = 0.918;
rho_v  = 0.630; //0.676
rho_gam = 0.667; //0.638

model(linear);

//long run output
y100 = y(+150);

//Equations for modelling past expectations
p1 = p(+1); w1 = w(+1); l1 = l(+1); R1 = R(+1); y1 = y(+1); 
p2 = p(+2); w2 = w(+2); l2 = l(+2); R2 = R(+2); y2 = y(+2); 
p3 = p(+3); w3 = w(+3); l3 = l(+3); R3 = R(+3); y3 = y(+3); 
p4 = p(+4); w4 = w(+4); l4 = l(+4); R4 = R(+4); y4 = y(+4); 
p5 = p(+5); w5 = w(+5); l5 = l(+5); R5 = R(+5); y5 = y(+5); 
p6 = p(+6); w6 = w(+6); l6 = l(+6); R6 = R(+6); y6 = y(+6); 
p7 = p(+7); w7 = w(+7); l7 = l(+7); R7 = R(+7); y7 = y(+7); 
p8 = p(+8); w8 = w(+8); l8 = l(+8); R8 = R(+8); y8 = y(+8); 
p9 = p(+9); w9 = w(+9); l9 = l(+9); R9 = R(+9); y9 = y(+9); 
p10  = p(+10); w10  = w(+10); l10  = l(+10); R10  = R(+10); y10  = y(+10); 
p11  = p(+11); w11  = w(+11); l11  = l(+11); R11  = R(+11); y11  = y(+11); 
p12  = p(+12); w12  = w(+12); l12  = l(+12); R12  = R(+12); y12  = y(+12); 
p13  = p(+13); w13  = w(+13); l13  = l(+13); R13  = R(+13); y13  = y(+13); 
p14  = p(+14); w14  = w(+14); l14  = l(+14); R14  = R(+14); y14  = y(+14); 
p15  = p(+15); w15  = w(+15); l15  = l(+15); R15  = R(+15); y15  = y(+15); 
p16  = p(+16); w16  = w(+16); l16  = l(+16); R16  = R(+16); y16  = y(+16); 
p17  = p(+17); w17  = w(+17); l17  = l(+17); R17  = R(+17); y17  = y(+17); 
p18  = p(+18); w18  = w(+18); l18  = l(+18); R18  = R(+18); y18  = y(+18); 
p19  = p(+19); w19  = w(+19); l19  = l(+19); R19  = R(+19); y19  = y(+19);
p20  = p(+20); w20  = w(+20); l20  = l(+20); R20  = R(+20); y20  = y(+20);
p21  = p(+21); w21  = w(+21); l21  = l(+21); R21  = R(+21); y21  = y(+21);
p22  = p(+22); w22  = w(+22); l22  = l(+22); R22  = R(+22); y22  = y(+22);
p23  = p(+23); w23  = w(+23); l23  = l(+23); R23  = R(+23); y23  = y(+23);
p24  = p(+24); w24  = w(+24); l24  = l(+24); R24  = R(+24); y24  = y(+24);
p25  = p(+25); w25  = w(+25); l25  = l(+25); R25  = R(+25); y25  = y(+25);
p26  = p(+26); w26  = w(+26); l26  = l(+26); R26  = R(+26); y26  = y(+26);
p27  = p(+27); w27  = w(+27); l27  = l(+27); R27  = R(+27); y27  = y(+27);
p28  = p(+28); w28  = w(+28); l28  = l(+28); R28  = R(+28); y28  = y(+28);
p29  = p(+29); w29  = w(+29); l29  = l(+29); R29  = R(+29); y29  = y(+29);
p30  = p(+30); w30  = w(+30); l30  = l(+30); R30  = R(+30); y30  = y(+30);

//Shock Processes
g = rho_g*g(-1) + g_e; 
a = (1+ rho_a)*a(-1) - rho_a* a(-2) + a_e; 
e = rho_e*e(-1) + e_e;
v = rho_v*v(-1) + v_e;
gam = rho_gam*gam(-1) + gam_e;

da = a - a(-1);

//Natural Level of Output
yn = ((1+1/psi)/(1 + 1/psi + beta/theta - beta))*a + ((beta/theta)/(1 + 1/psi + beta/theta - beta))*g + (beta/(gamma -1))/((1 + 1/psi + beta/theta - beta))*gam + (beta/(mu -1))/((1 + 1/psi + beta/theta - beta))*v;

//Production Function
y = a + beta*l;

//Taylor Rule
i = phi_y*(y - yn) + phi_p*(p - p(-1)) - e; 

//Wage setting
w = omega*(p + gamma*(w-p)/(gamma + psi) + l/(gamma + psi) + psi*(y100 - theta*R)/(theta*(gamma + psi)) - psi*gam/((gamma + psi)*(gamma - 1))) 
  + omega*(1-omega)^(1)*(p1(-1) + gamma*(w1(-1)-p1(-1))/(gamma + psi) + l1(-1)/(gamma + psi) + psi*(y100(-1) - theta*R1(-1))/(theta*(gamma + psi)) - psi*rho_gam^(1)*gam(-1)/((gamma + psi)*(gamma - 1)))  
  + omega*(1-omega)^(2)*(p2(-2) + gamma*(w2(-2)-p2(-2))/(gamma + psi) + l2(-2)/(gamma + psi) + psi*(y100(-2) - theta*R2(-2))/(theta*(gamma + psi)) - psi*rho_gam^(2)*gam(-2)/((gamma + psi)*(gamma - 1))) 
  + omega*(1-omega)^(3)*(p3(-3) + gamma*(w3(-3)-p3(-3))/(gamma + psi) + l3(-3)/(gamma + psi) + psi*(y100(-3) - theta*R3(-3))/(theta*(gamma + psi)) - psi*rho_gam^(3)*gam(-3)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(4)*(p4(-4) + gamma*(w4(-4)-p4(-4))/(gamma + psi) + l4(-4)/(gamma + psi) + psi*(y100(-4) - theta*R4(-4))/(theta*(gamma + psi)) - psi*rho_gam^(4)*gam(-4)/((gamma + psi)*(gamma - 1))) 
  + omega*(1-omega)^(5)*(p5(-5) + gamma*(w5(-5)-p5(-5))/(gamma + psi) + l5(-5)/(gamma + psi) + psi*(y100(-5) - theta*R5(-5))/(theta*(gamma + psi)) - psi*rho_gam^(5)*gam(-5)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(6)*(p6(-6) + gamma*(w6(-6)-p6(-6))/(gamma + psi) + l6(-6)/(gamma + psi) + psi*(y100(-6) - theta*R6(-6))/(theta*(gamma + psi)) - psi*rho_gam^(6)*gam(-6)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(7)*(p7(-7) + gamma*(w7(-7)-p7(-7))/(gamma + psi) + l7(-7)/(gamma + psi) + psi*(y100(-7) - theta*R7(-7))/(theta*(gamma + psi)) - psi*rho_gam^(7)*gam(-7)/((gamma + psi)*(gamma - 1))) 
  + omega*(1-omega)^(8)*(p8(-8) + gamma*(w8(-8)-p8(-8))/(gamma + psi) + l8(-8)/(gamma + psi) + psi*(y100(-8) - theta*R8(-8))/(theta*(gamma + psi)) - psi*rho_gam^(8)*gam(-8)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(9)*(p9(-9) + gamma*(w9(-9)-p9(-9))/(gamma + psi) + l9(-9)/(gamma + psi) + psi*(y100(-9) - theta*R9(-9))/(theta*(gamma + psi)) - psi*rho_gam^(9)*gam(-9)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(10)*(p10(-10) + gamma*(w10(-10)-p10(-10))/(gamma + psi) + l10(-10)/(gamma + psi) + psi*(y100(-10) - theta*R10(-10))/(theta*(gamma + psi)) - psi*rho_gam^(10)*gam(-10)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(11)*(p11(-11) + gamma*(w11(-11)-p11(-11))/(gamma + psi) + l11(-11)/(gamma + psi) + psi*(y100(-11) - theta*R11(-11))/(theta*(gamma + psi)) - psi*rho_gam^(11)*gam(-11)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(12)*(p12(-12) + gamma*(w12(-12)-p12(-12))/(gamma + psi) + l12(-12)/(gamma + psi) + psi*(y100(-12) - theta*R12(-12))/(theta*(gamma + psi)) - psi*rho_gam^(12)*gam(-12)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(13)*(p13(-13) + gamma*(w13(-13)-p13(-13))/(gamma + psi) + l13(-13)/(gamma + psi) + psi*(y100(-13) - theta*R13(-13))/(theta*(gamma + psi)) - psi*rho_gam^(13)*gam(-13)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(14)*(p14(-14) + gamma*(w14(-14)-p14(-14))/(gamma + psi) + l14(-14)/(gamma + psi) + psi*(y100(-14) - theta*R14(-14))/(theta*(gamma + psi)) - psi*rho_gam^(14)*gam(-14)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(15)*(p15(-15) + gamma*(w15(-15)-p15(-15))/(gamma + psi) + l15(-15)/(gamma + psi) + psi*(y100(-15) - theta*R15(-15))/(theta*(gamma + psi)) - psi*rho_gam^(15)*gam(-15)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(16)*(p16(-16) + gamma*(w16(-16)-p16(-16))/(gamma + psi) + l16(-16)/(gamma + psi) + psi*(y100(-16) - theta*R16(-16))/(theta*(gamma + psi)) - psi*rho_gam^(16)*gam(-16)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(17)*(p17(-17) + gamma*(w17(-17)-p17(-17))/(gamma + psi) + l17(-17)/(gamma + psi) + psi*(y100(-17) - theta*R17(-17))/(theta*(gamma + psi)) - psi*rho_gam^(17)*gam(-17)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(18)*(p18(-18) + gamma*(w18(-18)-p18(-18))/(gamma + psi) + l18(-18)/(gamma + psi) + psi*(y100(-18) - theta*R18(-18))/(theta*(gamma + psi)) - psi*rho_gam^(18)*gam(-18)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(19)*(p19(-19) + gamma*(w19(-19)-p19(-19))/(gamma + psi) + l19(-19)/(gamma + psi) + psi*(y100(-19) - theta*R19(-19))/(theta*(gamma + psi)) - psi*rho_gam^(19)*gam(-19)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(20)*(p20(-20) + gamma*(w20(-20)-p20(-20))/(gamma + psi) + l20(-20)/(gamma + psi) + psi*(y100(-20) - theta*R20(-20))/(theta*(gamma + psi)) - psi*rho_gam^(20)*gam(-20)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(21)*(p21(-21) + gamma*(w21(-21)-p21(-21))/(gamma + psi) + l21(-21)/(gamma + psi) + psi*(y100(-21) - theta*R21(-21))/(theta*(gamma + psi)) - psi*rho_gam^(21)*gam(-21)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(22)*(p22(-22) + gamma*(w22(-22)-p22(-22))/(gamma + psi) + l22(-22)/(gamma + psi) + psi*(y100(-22) - theta*R22(-22))/(theta*(gamma + psi)) - psi*rho_gam^(22)*gam(-22)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(23)*(p23(-23) + gamma*(w23(-23)-p23(-23))/(gamma + psi) + l23(-23)/(gamma + psi) + psi*(y100(-23) - theta*R23(-23))/(theta*(gamma + psi)) - psi*rho_gam^(23)*gam(-23)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(24)*(p24(-24) + gamma*(w24(-24)-p24(-24))/(gamma + psi) + l24(-24)/(gamma + psi) + psi*(y100(-24) - theta*R24(-24))/(theta*(gamma + psi)) - psi*rho_gam^(24)*gam(-24)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(25)*(p25(-25) + gamma*(w25(-25)-p25(-25))/(gamma + psi) + l25(-25)/(gamma + psi) + psi*(y100(-25) - theta*R25(-25))/(theta*(gamma + psi)) - psi*rho_gam^(25)*gam(-25)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(26)*(p26(-26) + gamma*(w26(-26)-p26(-26))/(gamma + psi) + l26(-26)/(gamma + psi) + psi*(y100(-26) - theta*R26(-26))/(theta*(gamma + psi)) - psi*rho_gam^(26)*gam(-26)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(27)*(p27(-27) + gamma*(w27(-27)-p27(-27))/(gamma + psi) + l27(-27)/(gamma + psi) + psi*(y100(-27) - theta*R27(-27))/(theta*(gamma + psi)) - psi*rho_gam^(27)*gam(-27)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(28)*(p28(-28) + gamma*(w28(-28)-p28(-28))/(gamma + psi) + l28(-28)/(gamma + psi) + psi*(y100(-28) - theta*R28(-28))/(theta*(gamma + psi)) - psi*rho_gam^(28)*gam(-28)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(29)*(p29(-29) + gamma*(w29(-29)-p29(-29))/(gamma + psi) + l29(-29)/(gamma + psi) + psi*(y100(-29) - theta*R29(-29))/(theta*(gamma + psi)) - psi*rho_gam^(29)*gam(-29)/((gamma + psi)*(gamma - 1)))
  + omega*(1-omega)^(30)*(p30(-30) + gamma*(w30(-30)-p30(-30))/(gamma + psi) + l30(-30)/(gamma + psi) + psi*(y100(-30) - theta*R30(-30))/(theta*(gamma + psi)) - psi*rho_gam^(30)*gam(-30)/((gamma + psi)*(gamma - 1)));

// IS curve
y =  delta*(y100 - theta*R) 
  + delta*(1-delta)^(1)*(y100(-1) - theta*R1(-1))
  + delta*(1-delta)^(2)*(y100(-2) - theta*R2(-2)) 
  + delta*(1-delta)^(3)*(y100(-3) - theta*R3(-3)) 
  + delta*(1-delta)^(4)*(y100(-4) - theta*R4(-4)) 
  + delta*(1-delta)^(5)*(y100(-5) - theta*R5(-5)) 
  + delta*(1-delta)^(6)*(y100(-6) - theta*R6(-6))  
  + delta*(1-delta)^(7)*(y100(-7) - theta*R7(-7)) 
  + delta*(1-delta)^(8)*(y100(-8) - theta*R8(-8)) 
  + delta*(1-delta)^(9)*(y100(-9) - theta*R9(-9)) 
  + delta*(1-delta)^(10)*(y100(-10) - theta*R10(-10)) 
  + delta*(1-delta)^(11)*(y100(-11) - theta*R11(-11)) 
  + delta*(1-delta)^(12)*(y100(-12) - theta*R12(-12)) 
  + delta*(1-delta)^(13)*(y100(-13) - theta*R13(-13)) 
  + delta*(1-delta)^(14)*(y100(-14) - theta*R14(-14)) 
  + delta*(1-delta)^(15)*(y100(-15) - theta*R15(-15)) 
  + delta*(1-delta)^(16)*(y100(-16) - theta*R16(-16)) 
  + delta*(1-delta)^(17)*(y100(-17) - theta*R17(-17)) 
  + delta*(1-delta)^(18)*(y100(-18) - theta*R18(-18)) 
  + delta*(1-delta)^(19)*(y100(-19) - theta*R19(-19)) 
  + delta*(1-delta)^(20)*(y100(-20) - theta*R20(-20)) 
  + delta*(1-delta)^(21)*(y100(-21) - theta*R21(-21)) 
  + delta*(1-delta)^(22)*(y100(-22) - theta*R22(-22)) 
  + delta*(1-delta)^(23)*(y100(-23) - theta*R23(-23)) 
  + delta*(1-delta)^(24)*(y100(-24) - theta*R24(-24)) 
  + delta*(1-delta)^(25)*(y100(-25) - theta*R25(-25)) 
  + delta*(1-delta)^(26)*(y100(-26) - theta*R26(-26)) 
  + delta*(1-delta)^(27)*(y100(-27) - theta*R27(-27)) 
  + delta*(1-delta)^(28)*(y100(-28) - theta*R28(-28)) 
  + delta*(1-delta)^(29)*(y100(-29) - theta*R29(-29)) 
  + delta*(1-delta)^(30)*(y100(-30) - theta*R30(-30)) 
  +g;   

//Price Setting
p =   lambda*(p + (beta*(w-p) + (1-beta)*y - a)/(beta + mu*(1-beta)) - beta*v/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(1)*(p1(-1) + (beta*(w1(-1)-p1(-1)) + (1-beta)*y1(-1) - rho_a*da(-1))/(beta + mu*(1-beta)) - beta*rho_v*v(-1)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(2)*(p2(-2) + (beta*(w2(-2)-p2(-2)) + (1-beta)*y2(-2) - rho_a^(2)*da(-2))/(beta + mu*(1-beta)) - beta*rho_v^(2)*v(-2)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(3)*(p3(-3) + (beta*(w3(-3)-p3(-3)) + (1-beta)*y3(-3) - rho_a^(3)*da(-3))/(beta + mu*(1-beta)) - beta*rho_v^(3)*v(-3)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(4)*(p4(-4) + (beta*(w4(-4)-p4(-4)) + (1-beta)*y4(-4) - rho_a^(4)*da(-4))/(beta + mu*(1-beta)) - beta*rho_v^(4)*v(-4)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(5)*(p5(-5) + (beta*(w5(-5)-p5(-5)) + (1-beta)*y5(-5) - rho_a^(5)*da(-5))/(beta + mu*(1-beta)) - beta*rho_v^(5)*v(-5)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(6)*(p6(-6) + (beta*(w6(-6)-p6(-6)) + (1-beta)*y6(-6) - rho_a^(6)*da(-6))/(beta + mu*(1-beta)) - beta*rho_v^(6)*v(-6)/((mu -1)*(beta + mu*(1-beta))))  
    + lambda*(1-lambda)^(7)*(p7(-7) + (beta*(w7(-7)-p7(-7)) + (1-beta)*y7(-7) - rho_a^(7)*da(-7))/(beta + mu*(1-beta)) - beta*rho_v^(7)*v(-7)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(8)*(p8(-8) + (beta*(w8(-8)-p8(-8)) + (1-beta)*y8(-8) - rho_a^(8)*da(-8))/(beta + mu*(1-beta)) - beta*rho_v^(8)*v(-8)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(9)*(p9(-9) + (beta*(w9(-9)-p9(-9)) + (1-beta)*y9(-9) - rho_a^(9)*da(-9))/(beta + mu*(1-beta)) - beta*rho_v^(9)*v(-9)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(10)*(p10(-10) + (beta*(w10(-10)-p10(-10)) + (1-beta)*y10(-10) - rho_a^(10)*da(-10))/(beta + mu*(1-beta)) - beta*rho_v^(10)*v(-10)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(11)*(p11(-11) + (beta*(w11(-11)-p11(-11)) + (1-beta)*y11(-11) - rho_a^(11)*da(-11))/(beta + mu*(1-beta)) - beta*rho_v^(11)*v(-11)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(12)*(p12(-12) + (beta*(w12(-12)-p12(-12)) + (1-beta)*y12(-12) - rho_a^(12)*da(-12))/(beta + mu*(1-beta)) - beta*rho_v^(12)*v(-12)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(13)*(p13(-13) + (beta*(w13(-13)-p13(-13)) + (1-beta)*y13(-13) - rho_a^(13)*da(-13))/(beta + mu*(1-beta)) - beta*rho_v^(13)*v(-13)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(14)*(p14(-14) + (beta*(w14(-14)-p14(-14)) + (1-beta)*y14(-14) - rho_a^(14)*da(-14))/(beta + mu*(1-beta)) - beta*rho_v^(14)*v(-14)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(15)*(p15(-15) + (beta*(w15(-15)-p15(-15)) + (1-beta)*y15(-15) - rho_a^(15)*da(-15))/(beta + mu*(1-beta)) - beta*rho_v^(15)*v(-15)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(16)*(p16(-16) + (beta*(w16(-16)-p16(-16)) + (1-beta)*y16(-16) - rho_a^(16)*da(-16))/(beta + mu*(1-beta)) - beta*rho_v^(16)*v(-16)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(17)*(p17(-17) + (beta*(w17(-17)-p17(-17)) + (1-beta)*y17(-17) - rho_a^(17)*da(-17))/(beta + mu*(1-beta)) - beta*rho_v^(17)*v(-17)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(18)*(p18(-18) + (beta*(w18(-18)-p18(-18)) + (1-beta)*y18(-18) - rho_a^(18)*da(-18))/(beta + mu*(1-beta)) - beta*rho_v^(18)*v(-18)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(19)*(p19(-19) + (beta*(w19(-19)-p19(-19)) + (1-beta)*y19(-19) - rho_a^(19)*da(-19))/(beta + mu*(1-beta)) - beta*rho_v^(19)*v(-19)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(20)*(p20(-20) + (beta*(w20(-20)-p20(-20)) + (1-beta)*y20(-20) - rho_a^(20)*da(-20))/(beta + mu*(1-beta)) - beta*rho_v^(20)*v(-20)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(21)*(p21(-21) + (beta*(w21(-21)-p21(-21)) + (1-beta)*y21(-21) - rho_a^(21)*da(-21))/(beta + mu*(1-beta)) - beta*rho_v^(21)*v(-21)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(22)*(p22(-22) + (beta*(w22(-22)-p22(-22)) + (1-beta)*y22(-22) - rho_a^(22)*da(-22))/(beta + mu*(1-beta)) - beta*rho_v^(22)*v(-22)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(23)*(p23(-23) + (beta*(w23(-23)-p23(-23)) + (1-beta)*y23(-23) - rho_a^(23)*da(-23))/(beta + mu*(1-beta)) - beta*rho_v^(23)*v(-23)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(24)*(p24(-24) + (beta*(w24(-24)-p24(-24)) + (1-beta)*y24(-24) - rho_a^(24)*da(-24))/(beta + mu*(1-beta)) - beta*rho_v^(24)*v(-24)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(25)*(p25(-25) + (beta*(w25(-25)-p25(-25)) + (1-beta)*y25(-25) - rho_a^(25)*da(-25))/(beta + mu*(1-beta)) - beta*rho_v^(25)*v(-25)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(26)*(p26(-26) + (beta*(w26(-26)-p26(-26)) + (1-beta)*y26(-26) - rho_a^(26)*da(-26))/(beta + mu*(1-beta)) - beta*rho_v^(26)*v(-26)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(27)*(p27(-27) + (beta*(w27(-27)-p27(-27)) + (1-beta)*y27(-27) - rho_a^(27)*da(-27))/(beta + mu*(1-beta)) - beta*rho_v^(27)*v(-27)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(28)*(p28(-28) + (beta*(w28(-28)-p28(-28)) + (1-beta)*y28(-28) - rho_a^(28)*da(-28))/(beta + mu*(1-beta)) - beta*rho_v^(28)*v(-28)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(29)*(p29(-29) + (beta*(w29(-29)-p29(-29)) + (1-beta)*y29(-29) - rho_a^(29)*da(-29))/(beta + mu*(1-beta)) - beta*rho_v^(29)*v(-29)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(30)*(p30(-30) + (beta*(w30(-30)-p30(-30)) + (1-beta)*y30(-30) - rho_a^(30)*da(-30))/(beta + mu*(1-beta)) - beta*rho_v^(30)*v(-30)/((mu -1)*(beta + mu*(1-beta))));

//Long interest rate
R = (i - p(+1) + p) + R(+1) ;

//Outputgap
x = y - yn; 

//Inflation
pi = p - p(-1);

end;

check;

shocks;
var e_e = 0.012^2;
//var g_e = 0.014^2;
//var a_e = 0.010^2;
//var v_e = 1.819^2; 
//var gam_e = 0.187^2;
end;

stoch_simul(periods = 2100, nograph, noprint) x pi l;