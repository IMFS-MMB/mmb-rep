function [param_,np,modname,neq,nlag,nlead,eqname_,eqtype_,endog_,delay_,vtype_] = ...
     compute_aim_data()

% compute_aim_data()
%     This function will return various information about the AIM model,
%     but will not compute the G and H matrices.

  eqname = cell(35, 1);
  param = cell(15, 1);
  endog = cell(35, 1);
  delay = zeros(35, 1);
  vtype = zeros(35, 1);
  eqtype = zeros(35, 1);

  modname = 'FuhrerMoore_discr';
  neq = 35;
  np = 15;
  nlag = 1;
  nlead = 1;

  eqname(1) = cellstr('EQ1');
  eqname(2) = cellstr('EQ1a');
  eqname(3) = cellstr('EQ2');
  eqname(4) = cellstr('EQ2a');
  eqname(5) = cellstr('EQ2b');
  eqname(6) = cellstr('EQ2c');
  eqname(7) = cellstr('EQ2d');
  eqname(8) = cellstr('EQ3');
  eqname(9) = cellstr('EQ3a');
  eqname(10) = cellstr('EQ3b');
  eqname(11) = cellstr('EQ4');
  eqname(12) = cellstr('EQ4a');
  eqname(13) = cellstr('EQ4b');
  eqname(14) = cellstr('EQ5');
  eqname(15) = cellstr('EQ6');
  eqname(16) = cellstr('EQ7');
  eqname(17) = cellstr('EQ8');
  eqname(18) = cellstr('EQ8a');
  eqname(19) = cellstr('EQ8b');
  eqname(20) = cellstr('EQ8c');
  eqname(21) = cellstr('EQ8d');
  eqname(22) = cellstr('EQ8e');
  eqname(23) = cellstr('EQ8f');
  eqname(24) = cellstr('EQ9');
  eqname(25) = cellstr('EQ9a');
  eqname(26) = cellstr('EQ9b');
  eqname(27) = cellstr('EQ9c');
  eqname(28) = cellstr('EQ9d');
  eqname(29) = cellstr('EQ9e');
  eqname(30) = cellstr('EQ9f');
  eqname(31) = cellstr('EQ9g');
  eqname(32) = cellstr('control');
  eqname(33) = cellstr('EQ10');
  eqname(34) = cellstr('EQ11');
  eqname(35) = cellstr('EQ12');
  eqname_ = char(eqname);

  eqtype(1) = 1;     eqtype(2) = 1;     eqtype(3) = 1;   
  eqtype(4) = 1;     eqtype(5) = 1;     eqtype(6) = 1;   
  eqtype(7) = 1;     eqtype(8) = 1;     eqtype(9) = 1;   
  eqtype(10) = 1;     eqtype(11) = 1;     eqtype(12) = 1;   
  eqtype(13) = 1;     eqtype(14) = 1;     eqtype(15) = 1;   
  eqtype(16) = 1;     eqtype(17) = 1;     eqtype(18) = 1;   
  eqtype(19) = 1;     eqtype(20) = 1;     eqtype(21) = 1;   
  eqtype(22) = 1;     eqtype(23) = 1;     eqtype(24) = 1;   
  eqtype(25) = 1;     eqtype(26) = 1;     eqtype(27) = 1;   
  eqtype(28) = 1;     eqtype(29) = 1;     eqtype(30) = 1;   
  eqtype(31) = 1;     eqtype(32) = 1;     eqtype(33) = 1;   
  eqtype(34) = 1;     eqtype(35) = 1;   
  eqtype_ = eqtype;

  param(1) = cellstr('delta1');
  param(2) = cellstr('delta2');
  param(3) = cellstr('delta3');
  param(4) = cellstr('rlbar');
  param(5) = cellstr('sigma_e_d');
  param(6) = cellstr('f0');
  param(7) = cellstr('f1');
  param(8) = cellstr('f2');
  param(9) = cellstr('f3');
  param(10) = cellstr('gamma');
  param(11) = cellstr('sigma_e_cw');
  param(12) = cellstr('rho');
  param(13) = cellstr('alpha');
  param(14) = cellstr('pitarget');
  param(15) = cellstr('beta');
  param_ = char(param);

  endog(1) = cellstr('q');
  endog(2) = cellstr('lagq1');
  endog(3) = cellstr('cwp');
  endog(4) = cellstr('ldvindex1');
  endog(5) = cellstr('ldvindex2');
  endog(6) = cellstr('ldq1');
  endog(7) = cellstr('ldq2');
  endog(8) = cellstr('vindex');
  endog(9) = cellstr('lagcwp1');
  endog(10) = cellstr('lagcwp2');
  endog(11) = cellstr('pi1');
  endog(12) = cellstr('lagpi1');
  endog(13) = cellstr('lagpi2');
  endog(14) = cellstr('pi4');
  endog(15) = cellstr('is');
  endog(16) = cellstr('dis');
  endog(17) = cellstr('il');
  endog(18) = cellstr('ldis1');
  endog(19) = cellstr('ldis2');
  endog(20) = cellstr('ldis3');
  endog(21) = cellstr('ldis4');
  endog(22) = cellstr('ldis5');
  endog(23) = cellstr('ldis6');
  endog(24) = cellstr('rl');
  endog(25) = cellstr('ldpi1');
  endog(26) = cellstr('ldpi2');
  endog(27) = cellstr('ldpi3');
  endog(28) = cellstr('ldpi4');
  endog(29) = cellstr('ldpi5');
  endog(30) = cellstr('ldpi6');
  endog(31) = cellstr('ldpi7');
  endog(32) = cellstr('control');
  endog(33) = cellstr('one');
  endog(34) = cellstr('e_d');
  endog(35) = cellstr('e_cw');
  endog_ = char(endog);

  delay(1) = 0;     delay(2) = 0;     delay(3) = 0;   
  delay(4) = 0;     delay(5) = 0;     delay(6) = 0;   
  delay(7) = 0;     delay(8) = 0;     delay(9) = 0;   
  delay(10) = 0;     delay(11) = 0;     delay(12) = 0;   
  delay(13) = 0;     delay(14) = 0;     delay(15) = 0;   
  delay(16) = 0;     delay(17) = 0;     delay(18) = 0;   
  delay(19) = 0;     delay(20) = 0;     delay(21) = 0;   
  delay(22) = 0;     delay(23) = 0;     delay(24) = 0;   
  delay(25) = 0;     delay(26) = 0;     delay(27) = 0;   
  delay(28) = 0;     delay(29) = 0;     delay(30) = 0;   
  delay(31) = 0;     delay(32) = 0;     delay(33) = 0;   
  delay(34) = 0;     delay(35) = 0;   
  delay_ = delay;

  vtype(1) = 1;     vtype(2) = 1;     vtype(3) = 1;   
  vtype(4) = 1;     vtype(5) = 1;     vtype(6) = 1;   
  vtype(7) = 1;     vtype(8) = 1;     vtype(9) = 1;   
  vtype(10) = 1;     vtype(11) = 1;     vtype(12) = 1;   
  vtype(13) = 1;     vtype(14) = 1;     vtype(15) = 1;   
  vtype(16) = 1;     vtype(17) = 1;     vtype(18) = 1;   
  vtype(19) = 1;     vtype(20) = 1;     vtype(21) = 1;   
  vtype(22) = 1;     vtype(23) = 1;     vtype(24) = 1;   
  vtype(25) = 1;     vtype(26) = 1;     vtype(27) = 1;   
  vtype(28) = 1;     vtype(29) = 1;     vtype(30) = 1;   
  vtype(31) = 1;     vtype(32) = 1;     vtype(33) = 1;   
  vtype(34) = 1;     vtype(35) = 1;   
  vtype_ = vtype;



