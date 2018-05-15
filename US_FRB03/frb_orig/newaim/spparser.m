% Parser setup for modelez syntax models

if parseflag == 1
   parsecom=horzcat(thispath,'\vwparser\vwparser ', dirnam,modnam);
   dos(parsecom);
end

% Run compute_aim_data:

[param_,np,modname,neq,nlag,nlead,eqname_,eqtype_,endog_,delay_,vtype_] = ...
	eval(['compute_aim_data']);

if(parseflag)
   seq  = find(eqtype_==0);
   dvar = find(vtype_==0);
   if(length(seq)~=length(dvar))
      error('Number of data variables not equal to number of stochastic equations.');
   end
end
   
param_  = setstr(param_);
endog_  = setstr(endog_);
eqname_ = setstr(eqname_);
modname = setstr(modname');
param_  =  nmfix(param_);
endog_  =  nmfix(endog_);
eqname_ =  nmfix(eqname_);

