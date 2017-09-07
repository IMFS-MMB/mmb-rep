function xtl = fortick(xt, fmt)

%FORTICK  formats the tick labels to be placed on a figure
%
%   xtl = fortick(xt, fmt) will take the tick marks, xt, format them in the 
%   format stated, fmt, and return a cell array, xtl which can be used as
%   the tick labels which are formatted in the desired format.
%
%   How to define the variables:
%      First, plot your figure.
%      xt = get(gca, 'XTick')   - or YTick, or ZTick, depending on what you wish to format.
%      fmt = 3.1 (or any other format you wish - type "help format" at the MATLAB
%                 Command Window for more information).
%      Then, call the function as stated above.
%      Then, back at the MATLAB Command Window, type
%      set(gca, 'XTickLabel', xtl, 'XTick', xt)
%      or YTick, or ZTick, depending on what you are doing
%      and your Tick Labels are formatted!

%   written on November 20, 1997 by Rob Monteiro

a = size(xt);
b = a(2);
for i = 1:b
   %xtl{1, i} =  eval(['sprintf(','''%' num2str(fmt),'f''', ',xt(1,i)' , ')']);
   xtl{1, i} =  eval(['sprintf(','''%' num2str(fmt),'g''', ',xt(1,i)' , ')']);
end
