function [x,rc] = fcsolve(FUN,x,option,varargin);

% function [x,rc] = fcsolve(FUN,x0,option,P1,P2,.....)
%
% Solves for FUN(x,P1,P2,...)=0
%
% FUN should be written - 	so that parametric arguments are packed in to vectors P1,...
% 								- 	so that if presented with a matrix x, it produces a return value of
% 									same dimension of x.  
%
% rc = 0 if convergence is OK
%		 4 is the maximum number of iterations has been reached
%
% option is an optional vector to control the algorithm:
%
% itmax : maximum number of iterations (sum of abs. values small enough to be a solution) (1000)
% crit  : stopping criterion (1e-9)
% delta : differencing interval for numerical gradient (1e-8)
% alpha : tolerance on rate of descent (1e-3)
% dispo : Displaystyle (0 nothing, 1 minimum (default), 2 full
%
% (c) Chris Smith 1997 revised by F. Collard (1999)
%

if ((nargin>=3)&~isempty(option));	% ~ is the logical "not"
   itmax=option(1);
   crit=option(2);
   delta=option(3);
   alpha=option(4);
   dispo=option(5); 
else
   crit=1e-9;		% sum of abs. values small enough to be a solution
   delta=1e-8;		% differencing interval for numerical gradient
   alpha=1e-3;		% tolerance on rate of descent
   itmax=10000;	% max no. of iterations
   dispo=1;			% partial display
end

nv=length(x);
tvec=delta*eye(nv);
done=0;
f0=feval(FUN,x,varargin{:});
af0=sum(abs(f0));
af00=af0;
itct=0;
h1 = clock ;       
while ~done
   if itct>3 & af00-af0<crit*max(1,af0) & rem(itct,2)==1
      randomize=1;
   else
      for i=1:nv;
         grad(1:nv,i) = (feval(FUN,x+tvec(:,i),varargin{:})-f0)/delta;
      end;
      
      if isreal(grad)
         if rcond(grad)<1e-12
            grad=grad+tvec;
         end
         dx0=-grad\f0;
         randomize=0;
      else
         disp('imaginary gradient')
         randomize=1;
      end
   end
   if randomize
      fprintf(1,'\n Random Search')
      dx0=norm(x)./randn(size(x));
   end
   lambda=1;
   lambdamin=1;
   fmin=f0;
   xmin=x;
   afmin=af0;
   dxSize=norm(dx0);
   factor=.6;
   shrink=1;
   subDone=0;
   while ~subDone
      dx=lambda*dx0;
      f=feval(FUN,x+dx,varargin{:});
      af=sum(abs(f));
      f2=sum(f.^2);
      if af<afmin
         afmin=af;
         fmin=f;
         lambdamin=lambda;
         xmin=x+dx;
      end
      if ((lambda >0) & (af0-af < alpha*lambda*af0)) | ((lambda<0) & (af0-af < 0) )
         if ~shrink
            factor=factor^.6;
            shrink=1;
         end
         if abs(lambda*(1-factor))*dxSize > .1*delta;
            lambda = factor*lambda;
         elseif (lambda > 0) & (factor==.6) %i.e., we've only been shrinking
            lambda=-.3;
         else %
            subDone=1;
            if lambda > 0
               if factor==.6
                  rc = 2;
               else
                  rc = 1;
               end
            else
               rc=3;
            end
         end
      elseif (lambda >0) & (af-af0 > (1-alpha)*lambda*af0)
         if shrink
            factor=factor^.6;
            shrink=0;
         end
         lambda=lambda/factor;
      else % good value found
         subDone=1;
         rc=0;
      end
   end % while ~subDone
   itct=itct+1;
   if dispo>0;
      fprintf(1,'\n iter %5.0f, Sum |f| : %e, ||f||? : %e, step : %e, conv(lambda) %d\n',itct,afmin,f2,lambdamin,rc);
      if dispo>1;
         fprintf(1,'\n   x  %10g %10g %10g %10g',xmin);
         fprintf(1,'\n   f  %10g %10g %10g %10g',fmin);
      end
   end
   
   x=xmin;
   f0=fmin;
   af00=af0;
   af0=afmin;
   if itct >= itmax
      done=1;
      rc=4;
   elseif af0<crit;
      done=1;
      rc=0;
   end
end
if ~(dispo==0)
disp (' ') ;
disp ('-----------------------------------------------------') ;
disp ('                     RESULTS') ;
disp ('-----------------------------------------------------') ;
disp (' ') ;
if rc==0
   disp('Convergence achieved properly')
elseif rc==4
	disp('Maximal number of iterations reached')
else   
   disp('Convergence not achieved properly, try another starting value')
end
disp (' ') ;
disp (sprintf('Iteration n?          : %5.0f',itct)) ;
disp (sprintf('Elapsed Time (in sec.): %5.2f',etime(clock,h1))) ;
disp (' ') ;
disp ('Solution              : ') ;
disp(sprintf('\n%15.6f',x))
disp (' ') ;
disp ('-----------------------------------------------------') ;
end;