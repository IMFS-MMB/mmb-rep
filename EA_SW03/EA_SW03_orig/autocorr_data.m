% ---------------------------------------------
% Obtain the autocorrelation functions
% for annual inflation, the output gap and dr
% ---------------------------------------------
clear
load c:\wieland_project\data_2000\awmvaluesnew2

% ---------------------------------------------
% Construct data
% ---------------------------------------------
% Annual inflation

pipcda = pipcd(1:end-3)+pipcd(2:end-2)+pipcd(3:end-1)+pipcd(4:end);
yer    = yer(4:end);
dstn   = stn(4:end)-stn(3:end-1);
N        = length(pipcda);

[autopi] = autocorr(pipcda,80);
boundspi = bounds_AC(autopi, N);

[autoy]  = autocorr(yer,80);
boundsy  = bounds_AC(autoy, N);

[autodr] = autocorr(dstn,80);
boundsdr = bounds_AC(autodr, N);

save data_ac autopi autoy boundspi boundsy autodr boundsdr
