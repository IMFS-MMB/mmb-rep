function tabmat = tabit_ac_compute(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15, ...
t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t33,...
t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47,t48,t49,t50)

% Create a "tabulate" matrix for the input arguments.  Allows
% character arrays (1- or 2-d), real 1-d arrays, real 2-d arrays,
% and complex 1-d arrays.  (No complex 2-d arrays).

if(nargin>50)
  disp('No more than 50 items may be tabited at once');
  return;
end

% Initialize column dimension of tabulate matrix

ctab1 = 1;

% Initialize tabmat to be a 1 by 1 matrix of zeros

tabmat = zeros(1,1);
imagflg = 0;

% Loop over arguments in function call

for j = 1:nargin;
      temp = eval(['t',int2str(j)]);

% Get dimensions of argument.  If it's a string array, stick it in
% as is.  If it's not a string, and one of dimensions is 1, transpose
% if necessary to get the row dimension to be the big one.  If
% both dims are > 1, and not a string variable, then call tab2d to
% turn the 2d real array into a 2d character matrix.

% Check to see if it's a timeseries.  If so, pull out the first row.

     %tschk(temp);
     %if(tsflg)
     %   temp = temp(1,:);
     %end

     [nr,nc] = size(temp);

  if(~isstr(temp))
     
     if(nr>1&nc>1)                                % for 2d real arrays
        imagflg = sum(sum(abs(imag(temp))>0)>0);  % Check for imaginary component
        if(imagflg)
           disp('No 2-d complex arrays can be tabited by this routine.')
           return
        end
        temp = tab2d(temp,imagflg);
        [nr,nc] = size(temp);
        inc = nc + 2;
     else                                          % for 1d real arrays

       inc = 12;
       if(nr==1) 
          temp = temp';
          savenc = nc;
          nc = nr;
          nr = savenc;
       end

% Check if there is any imaginary part to the 1d array; if so, turn it
% into a 2d array with 1st column the real part, second column
% the imaginary part.

       imagflg = (sum(abs(imag(temp))>0)>0);
       if(imagflg)
           rpt = real(temp);
           ipt = imag(temp);
           temp = [rpt,ipt];
           temp = tab2d(temp,imagflg);
           [nr,nc] = size(temp);
           inc = nc + 2;
       
% Convert the array to a character string

       else
           
           temp = tnum2nam(temp);end
       end

  else     % Do above only for non-string arrays

% For string arrays

      inc = nc + 2;

  end

% Compute right-hand column limit; all entries (except arbitrary
% string matrices) are 10 columns wide.

     ctab2 = ctab1 + inc - 1;


% Put properly oriented argument and a 2-column spacer into matrix

     tabmat(1:nr,ctab1:ctab2) = [temp,nmspace(nr,2)];

% Increment column dimension of tabmat 

     ctab1 = ctab2 + 1;

end

% Find locations in tabmat whose ascii code is 0.  Set them to ascii
% code 32.  (Otherwise, all characters in a row following a 0 will
% not print out).

z = find(abs(tabmat)==0);
tabmat(z) = ones(length(z),1)*32;
tabmat = setstr(tabmat);

% Add a first two rows of header to matrix

[nr,nc] = size(tabmat);
rows(1,:) = setstr('-'*ones(nc,1))';
rows(2,:) = blanks(nc);
tabmat((3:nr+2),(1:nc)) = tabmat;
tabmat((1:2),(1:nc)) = rows;
srow1 = rows(1,:);
rows(1,:) = rows(2,:);
rows(2,:) = srow1;
tabmat(((nr+3):(nr+4)),(1:nc)) = rows;
