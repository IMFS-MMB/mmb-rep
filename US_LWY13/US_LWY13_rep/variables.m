% variables.m
% Assigns variable numbers.

vnames = {  'cr'        % 1 consumption: Ricardian agents
            'cnr'       % 2 consumption: Non-Ricardian agents
            'R'         % 3 nominal interest rate
            'i'         % 4 investment
            'k'         % 5 private k
            'v'         % 6 k utilization rate
            'l'         % 7 labor
            'y'         % 8 output 
            'g'         % 9 govt consumption
            'c'         %10 aggregate consumtpion
            'q'         %11 Lagragina multiplier for a unit of investment goods				
            'rk'        %12 real return for private k 
            'w'         %13 real wage 
            'pi'        %14 inflation for consumption goods 
            'b'         %15 govt debt
            'sb'        %16 b/y
            'tauk'      %17 tauk
            'taul'      %18 taul
            'r'         %19 real interest rate check
            'kbar'      %20 effective unit of k
            'z'         %21 trasnfers 
            'mc'        %22 real marginal cost
            'Tk'        %23
            'Tl'        %24
                    
            'xcr'       %25 cr(t+1)
            'xpi'       %26 pi(t+1)
            'xub'       %27 ub(t+1)
            'xi'        %28 i(t+1)
            'xui'       %29 ui(t+1)
            'xq'        %30 q(t+1)
            'xrk'       %31 rk(t+1)
            'xtk'       %32 tauk(t+1)
            'xw'        %33 w(t+1)
            
            'ua'        %34 general preference shock
            'ub'        %35 investment shock in adjustment costs
            'um'        %36 technology shock
            'ui'        %37 wage markup shock
            'uw'        %38 price markup shock
            'up'        %39 monetary policy shock
            'ug'        %40 g shock
            'utk'       %41 taul shock
            'utl'       %42 tauk shock
            'uz'        %43 z shock
          };  
      
for j = 1:size(vnames,1)
   jnk(j,:) = strcat({'N'},vnames(j,:));
   eval([char(jnk(j,:)) ' = j;']);      
end


