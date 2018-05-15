%Solve Kss and usss jointly

function F = ssNLEst(X,param,rk,R);

w = X(1);
ky = X(2);
ly = X(3);
cy = X(4);
y = X(5);
str = X(6);
cry = X(7);
cnry = X(8);

pnames = { 	'alph  '   	% 
            'bet   '    % 
            'gamm  '  	% 1
            'kappa  '   % 2
            'omegaw'    % 3    
            'omegap'    % 4
            'etaw'      % 
            'etap'      % 
            'mu'        %  
            'phipi'     % 5
            'phiy'      % 6
            'sg'        %
            'sb'        %
            'taul'		%
            'tauk'      %
            'tauc'      %
            'theta'     % 7
            'gpsi'      % 8
            's'         % 9 
            'chiw'      %10
            'chip'      %11
            'delt'      %
            'rhoa'		%12
            'rhob'      %13
            'rhor'      %14
            'rhoi'      %15
            'rhow'      %16
            'rhop'      %17
            'rhog'		%18
            'rhotk'     %19
            'rhotl'     %20
            'rhoz'      %21
            'gammg'	    %22
            'gammtk'	%23
            'gammtl'    %24
            'gammz'     %25
            'psitk'     %26
            'psitl'     %27
            'psigc'     %
            'psiz'      %
            'siga'      %28    
            'sigb'      %29
            'sigm'      %30
            'sigi'      %31
            'sigw'      %32
            'sigp'      %33
            'sigg'      %34
            'sigtk'     %35
            'sigtl'     %36
            'sigz'      %37
            'phipid'    %38
            'phiyd'     %39
            'phia'      %40
};       
           
for j = 1:length(param)
    eval([char(pnames(j)) '=param(j);']);
end;

F(1) = w - ((((1-alph)^(1-alph))*(alph^(alph))*(rk^(-alph))*(etap-1))/(etap*(1+tauc)))^(1/(1-alph));
F(2) = ky - ((w*alph)/(rk*(1-alph)))^(1-alph);
F(3) = ly - ((w*alph)/(rk*(1-alph)))^(-alph);
F(4) = cy - (1 - delt*ky - sg);
F(5) = y - ((w*(1-taul)*(mu*(cnry^(-gamm)) + (1-mu)*(cry^(-gamm))*(1-theta)^(-gamm))*(etaw-1))/(etaw*(ly^kappa)))^(1/(gamm+kappa));
F(6) = str - ((1 - R)*sb - sg + (tauc/(1+tauc))*cy + taul*w*ly + tauk*rk*ky); %transfer-output share
F(7) = cnry - (1-taul)*w*ly - str;
F(8) = cry - (cy - mu*cnry)/(1-mu);


