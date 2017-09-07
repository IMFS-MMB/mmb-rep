% MATLAB function: loc.m                        July 22, 1992
%        loc(mstring,'sstring') returns the number of the row of 
%        mstring that has the same non-blanck characters as 
%        sstring. mstring is a matrix of characters. Each of its 
%        rows corresponds to a "name". sstring is a character
%        string. It is the "name" we are looking for in mstring.
%        Note that sstring must be placed in between single 
%        quotation marks.

%function [x] = loc(mstring,sstring,switch)
function [x] = loc(mstring,sstring,switcher)

[rm,cm]=size(mstring);
cs=max(size(sstring));

% If necessary, add blanck columns to sstring so it will have the
%  same number of columns as mstring.
if cm>cs;
  nblancks=cm-cs;
  for i=1:nblancks
     sstring=[sstring,' '];
  end
end

if(cm~=max(size(sstring)))
  disp(['problem with padding ',sstring])
  disp('The character string might be longer than name list')
  mstring
  %return
  pause
end

x=0;
for r=1:rm;
   if(length(find(mstring(r,:)==sstring))==cm)
      x=r;
   end
end


%if(x==0)
%  if(~exist('switcher')); disp(['Could not find ',sstring]); end
end
