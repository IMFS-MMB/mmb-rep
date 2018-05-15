function [param_,np,modname,neq,nlag,nlead,eqname_,eqtype_,endog_,delay_,vtype_] = ...
     compute_aim_data()

% compute_aim_data()
%     This function will return various information about the AIM model,
%     but will not compute the G and H matrices.

  eqname = cell(41, 1);
  param = cell(14, 1);
  endog = cell(41, 1);
  delay = zeros(41, 1);
  vtype = zeros(41, 1);
  eqtype = zeros(41, 1);

  modname = 'FMJMCBF';
  neq = 41;
  np = 14;
  nlag = 1;
  nlead = 20;

  eqname(1) = cellstr('ygap');
  eqname(2) = cellstr('rff');
  eqname(3) = cellstr('rho1');
  eqname(4) = cellstr('rho16');
  eqname(5) = cellstr('rho40');
  eqname(6) = cellstr('contr');
  eqname(7) = cellstr('index');
  eqname(8) = cellstr('vbar');
  eqname(9) = cellstr('pdot');
  eqname(10) = cellstr('pdotma4');
  eqname(11) = cellstr('drff');
  eqname(12) = cellstr('ygap1');
  eqname(13) = cellstr('ygap2');
  eqname(14) = cellstr('ygap3');
  eqname(15) = cellstr('rff1');
  eqname(16) = cellstr('rff2');
  eqname(17) = cellstr('rff3');
  eqname(18) = cellstr('pdot1');
  eqname(19) = cellstr('pdot2');
  eqname(20) = cellstr('pdot3');
  eqname(21) = cellstr('pdot4');
  eqname(22) = cellstr('pdot5');
  eqname(23) = cellstr('pdot6');
  eqname(24) = cellstr('pdot7');
  eqname(25) = cellstr('pdot8');
  eqname(26) = cellstr('pdot9');
  eqname(27) = cellstr('pdot10');
  eqname(28) = cellstr('contr1');
  eqname(29) = cellstr('contr2');
  eqname(30) = cellstr('index1');
  eqname(31) = cellstr('index2');
  eqname(32) = cellstr('index3');
  eqname(33) = cellstr('pdotf4');
  eqname(34) = cellstr('pdotf8');
  eqname(35) = cellstr('pdotf12');
  eqname(36) = cellstr('pdotf16');
  eqname(37) = cellstr('pdotf20');
  eqname(38) = cellstr('one');
  eqname(39) = cellstr('pdot_');
  eqname(40) = cellstr('rff_');
  eqname(41) = cellstr('ygap_');
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
  eqtype(34) = 1;     eqtype(35) = 1;     eqtype(36) = 1;   
  eqtype(37) = 1;     eqtype(38) = 1;     eqtype(39) = 0;   
  eqtype(40) = 0;     eqtype(41) = 0;   
  eqtype_ = eqtype;

  param(1) = cellstr('xgap1');
  param(2) = cellstr('xgap2');
  param(3) = cellstr('xgap3');
  param(4) = cellstr('xgap4');
  param(5) = cellstr('xgap5');
  param(6) = cellstr('cofintintb1');
  param(7) = cellstr('cofintinf0');
  param(8) = cellstr('cofintinfb1');
  param(9) = cellstr('cofintinfb2');
  param(10) = cellstr('cofintinfb3');
  param(11) = cellstr('cofintout');
  param(12) = cellstr('cofintoutb1');
  param(13) = cellstr('slope');
  param(14) = cellstr('cy');
  param_ = char(param);

  endog(1) = cellstr('ygap');
  endog(2) = cellstr('pdot');
  endog(3) = cellstr('rff');
  endog(4) = cellstr('drff');
  endog(5) = cellstr('index');
  endog(6) = cellstr('pdotma4');
  endog(7) = cellstr('rho40');
  endog(8) = cellstr('rho16');
  endog(9) = cellstr('rho1');
  endog(10) = cellstr('vbar');
  endog(11) = cellstr('ygap1');
  endog(12) = cellstr('ygap2');
  endog(13) = cellstr('ygap3');
  endog(14) = cellstr('rff1');
  endog(15) = cellstr('rff2');
  endog(16) = cellstr('rff3');
  endog(17) = cellstr('pdot1');
  endog(18) = cellstr('pdot2');
  endog(19) = cellstr('pdot3');
  endog(20) = cellstr('pdot4');
  endog(21) = cellstr('pdot5');
  endog(22) = cellstr('pdot6');
  endog(23) = cellstr('pdot7');
  endog(24) = cellstr('pdot8');
  endog(25) = cellstr('pdot9');
  endog(26) = cellstr('pdot10');
  endog(27) = cellstr('contr');
  endog(28) = cellstr('contr1');
  endog(29) = cellstr('contr2');
  endog(30) = cellstr('index1');
  endog(31) = cellstr('index2');
  endog(32) = cellstr('index3');
  endog(33) = cellstr('pdotf4');
  endog(34) = cellstr('pdotf8');
  endog(35) = cellstr('pdotf12');
  endog(36) = cellstr('pdotf16');
  endog(37) = cellstr('pdotf20');
  endog(38) = cellstr('one');
  endog(39) = cellstr('pdot_');
  endog(40) = cellstr('rff_');
  endog(41) = cellstr('ygap_');
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
  delay(34) = 0;     delay(35) = 0;     delay(36) = 0;   
  delay(37) = 0;     delay(38) = 0;     delay(39) = 0;   
  delay(40) = 0;     delay(41) = 0;   
  delay_ = delay;

  vtype(1) = 0;     vtype(2) = 1;     vtype(3) = 0;   
  vtype(4) = 1;     vtype(5) = 0;     vtype(6) = 1;   
  vtype(7) = 1;     vtype(8) = 1;     vtype(9) = 1;   
  vtype(10) = 1;     vtype(11) = 1;     vtype(12) = 1;   
  vtype(13) = 1;     vtype(14) = 1;     vtype(15) = 1;   
  vtype(16) = 1;     vtype(17) = 1;     vtype(18) = 1;   
  vtype(19) = 1;     vtype(20) = 1;     vtype(21) = 1;   
  vtype(22) = 1;     vtype(23) = 1;     vtype(24) = 1;   
  vtype(25) = 1;     vtype(26) = 1;     vtype(27) = 1;   
  vtype(28) = 1;     vtype(29) = 1;     vtype(30) = 1;   
  vtype(31) = 1;     vtype(32) = 1;     vtype(33) = 1;   
  vtype(34) = 1;     vtype(35) = 1;     vtype(36) = 1;   
  vtype(37) = 1;     vtype(38) = 2;     vtype(39) = 1;   
  vtype(40) = 1;     vtype(41) = 1;   
  vtype_ = vtype;



