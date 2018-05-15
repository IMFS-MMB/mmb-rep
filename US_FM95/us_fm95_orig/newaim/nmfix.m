function fixnm = nmfix(nm)

% Remove ascii numeric 0's from strings and replace with 32's

[r,c] = size(nm);
for i = 1:r
   locs = find(nm(i,:)==0);
   if(~isempty(locs))
      llocs = length(locs);
      nm(i,locs) = setstr(ones(1,llocs)*32);
   end
end
fixnm = nm;

return
