function [acor,pacor] = autocorr_compute(v,nlag,prntcorr)

% Compute the first nlag autocorrelations and partial autocorrelations
% of the vector stored in v.  Compute the Q-statistics for lags
% 1-12,24,36,48,60 if nlag is greater than or equal to 12,24, etc.
% Print if the third argument "prntcorr" is included in the argument
% list and equals 1.  Respects the global tsrange for timeseries input.

% Check to see if v is a timeseries.  If so, pull out its first row
% and assign it to v

%tsflg = tschk(v);
tsflg=1;
% Default for nlag = 1

if(nargin==1)
   nlag = 1;
   prntcorr = 0;
end
if(nargin<3)
   prntcorr = 0;
end


%if(tsflg)
%  if(exist('tsrange'))
%      v = tsproject(v,tsrange(1),tsrange(2));
%      v = v(1,:);
%  else
%      v = v(1,:);
%  end
%end

% Remove mean

mv = mean(v);
v = v - mv;
nobs = length(v);

% Change to a column vector if it's a row vector

[nr,nc] = size(v);
if(nc>1)
  v = v';
end

% Compute a lagvar matrix for the nlag lags

lv = zeros(nobs,nlag);

expr = 'lv(:,i) =lag(v,i);';

for i = 1:nlag
   eval(expr);
end

% Compute the correlations of v (chopped off appropriately)
% with the lags

expr = 'acor(i) = temp;';
vv = v'*v;
if(vv==0)
  disp('Variance of series is zero.  Aborting.')
  return
end

for i = 1:nlag
    index = (i+1:nobs);
    temp = (v(index)'*lv(index,i));
    temp = temp/vv;
    eval(expr);
end

% Compute the partial autocorrelations via a recursive method due to
% Durbin(1960) 

pacor(1,1) = acor(1);
vcor(1) = 1 - acor(1)^2;

for l = 1:nlag-1

pacor(l+1,l+1) = acor(l+1);

   for k = 1:l
     pacor(l+1,l+1) = pacor(l+1,l+1) - pacor(l,k)*acor(l-(k-1));
   end
   pacor(l+1,l+1) = pacor(l+1,l+1)/vcor(l);

   for j = 1:l
      pacor(l+1,j) = pacor(l,j) - pacor(l+1,l+1)*pacor(l,l+1-j);
   end
   if(abs(pacor(l+1,l+1))>1)
      disp(['Partial autocorrelation > 1 for lag ',num2str(l+1)]);
      return
   end
      vcor(l+1) = vcor(l)*(1-pacor(l+1,l+1))*(1+pacor(l+1,l+1));
end

pacor = diag(pacor)';

if(prntcorr)

% Compute q-statistic for lags 12, 24, etc. if < nlag

disp(' ')

if(nlag>=12) 
   q12 = sum(acor(1:12).^2)*nobs;disp(['Q(12):  ',num2str(q12)]);
end
if(nlag>=24) 
   q24 = sum(acor(1:24).^2)*nobs;disp(['Q(24):  ',num2str(q24)]);
end
if(nlag>=36) 
   q36 = sum(acor(1:36).^2)*nobs;disp(['Q(36):  ',num2str(q36)]);
end
if(nlag>=48) 
   q48 = sum(acor(1:48).^2)*nobs;disp(['Q(48):  ',num2str(q48)]);
end
if(nlag>=60) 
   q60 = sum(acor(1:60).^2)*nobs;disp(['Q(60):  ',num2str(q60)]);
end

   disp(' ')
   disp('Lag        Autocorr.    Partial    ')
   disp('                        Correl.    ')
   cortab = tabit_ac_compute((1:nlag)',acor, pacor);
   disp(cortab)
   disp(' ')
if(nlag>=12)
   disp(['SE, 1st 12 autocorr.        :  ',num2str((1/sqrt(nobs))*(1+2*(q12/nobs))^.5)]);
end
if(nlag>=24)
   disp(['SE, 1st 24 autocorr.        :  ',num2str((1/sqrt(nobs))*(1+2*(q24/nobs))^.5)]);
end
if(nlag>=36)
   disp(['SE, 1st 36 autocorr.        :  ',num2str((1/sqrt(nobs))*(1+2*(q36/nobs))^.5)]);
end
if(nlag>=48)
   disp(['SE, 1st 48 autocorr.        :  ',num2str((1/sqrt(nobs))*(1+2*(q48/nobs))^.5)]);
end
if(nlag>=60)
   disp(['SE, 1st 60 autocorr.        :  ',num2str((1/sqrt(nobs))*(1+2*(q60/nobs))^.5)]);
end

   disp(['Partial corr. standard error:  ',num2str(sqrt(1/nobs))]);
   disp(['Variance:  ',num2str(vv/(nobs-1))]);
   disp(['Mean    :  ',num2str(mv)]);

end
