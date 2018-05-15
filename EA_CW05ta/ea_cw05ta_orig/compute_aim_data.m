function [param_,np,modname,neq,nlag,nlead,eqname_,eqtype_,endog_,delay_,vtype_] = ...
     compute_aim_data()

% compute_aim_data()
%     This function will return various information about the AIM model,
%     but will not compute the G and H matrices.

  eqname = cell(17, 1);
  param = cell(15, 1);
  endog = cell(17, 1);
  delay = zeros(17, 1);
  vtype = zeros(17, 1);
  eqtype = zeros(17, 1);

  modname = 'Taylor';
  neq = 17;
  np = 15;
  nlag = 1;
  nlead = 8;

  eqname(1) = cellstr('EQ1');
  eqname(2) = cellstr('EQ1a');
  eqname(3) = cellstr('EQ2');
  eqname(4) = cellstr('EQ2a');
  eqname(5) = cellstr('EQ2b');
  eqname(6) = cellstr('EQ3');
  eqname(7) = cellstr('EQ3a');
  eqname(8) = cellstr('EQ3b');
  eqname(9) = cellstr('EQ4');
  eqname(10) = cellstr('EQ6');
  eqname(11) = cellstr('EQ6a');
  eqname(12) = cellstr('EQ6');
  eqname(13) = cellstr('EQ7');
  eqname(14) = cellstr('EQ8');
  eqname(15) = cellstr('EQ9');
  eqname(16) = cellstr('EQ10');
  eqname(17) = cellstr('EQ11');
  eqname_ = char(eqname);

  eqtype(1) = 1;     eqtype(2) = 1;     eqtype(3) = 1;   
  eqtype(4) = 1;     eqtype(5) = 1;     eqtype(6) = 1;   
  eqtype(7) = 1;     eqtype(8) = 1;     eqtype(9) = 1;   
  eqtype(10) = 1;     eqtype(11) = 1;     eqtype(12) = 1;   
  eqtype(13) = 1;     eqtype(14) = 1;     eqtype(15) = 1;   
  eqtype(16) = 1;     eqtype(17) = 1;   
  eqtype_ = eqtype;

  param(1) = cellstr('delta1');
  param(2) = cellstr('delta2');
  param(3) = cellstr('delta3');
  param(4) = cellstr('rlbar');
  param(5) = cellstr('sigma_e_d');
  param(6) = cellstr('f1');
  param(7) = cellstr('f2');
  param(8) = cellstr('f3');
  param(9) = cellstr('gamma');
  param(10) = cellstr('f0');
  param(11) = cellstr('sigma_e_cw');
  param(12) = cellstr('rho');
  param(13) = cellstr('alpha');
  param(14) = cellstr('pitarget');
  param(15) = cellstr('beta');
  param_ = char(param);

  endog(1) = cellstr('q');
  endog(2) = cellstr('lagq1');
  endog(3) = cellstr('cwp');
  endog(4) = cellstr('lagcwp1');
  endog(5) = cellstr('lagcwp2');
  endog(6) = cellstr('pi1');
  endog(7) = cellstr('lagpi11');
  endog(8) = cellstr('lagpi12');
  endog(9) = cellstr('pi4');
  endog(10) = cellstr('is');
  endog(11) = cellstr('lagis1');
  endog(12) = cellstr('dis');
  endog(13) = cellstr('il');
  endog(14) = cellstr('rl');
  endog(15) = cellstr('one');
  endog(16) = cellstr('e_d');
  endog(17) = cellstr('e_cw');
  endog_ = char(endog);

  delay(1) = 0;     delay(2) = 0;     delay(3) = 0;   
  delay(4) = 0;     delay(5) = 0;     delay(6) = 0;   
  delay(7) = 0;     delay(8) = 0;     delay(9) = 0;   
  delay(10) = 0;     delay(11) = 0;     delay(12) = 0;   
  delay(13) = 0;     delay(14) = 0;     delay(15) = 0;   
  delay(16) = 0;     delay(17) = 0;   
  delay_ = delay;

  vtype(1) = 1;     vtype(2) = 1;     vtype(3) = 1;   
  vtype(4) = 1;     vtype(5) = 1;     vtype(6) = 1;   
  vtype(7) = 1;     vtype(8) = 1;     vtype(9) = 1;   
  vtype(10) = 1;     vtype(11) = 1;     vtype(12) = 1;   
  vtype(13) = 1;     vtype(14) = 1;     vtype(15) = 1;   
  vtype(16) = 1;     vtype(17) = 1;   
  vtype_ = vtype;



