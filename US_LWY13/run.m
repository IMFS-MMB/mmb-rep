clear all
close all


nvar=43;
nexog=10;
nforerrors = 9;


cd([cd '/US_LWY13_rep']);
load param



[G,C0,M,fmat,fwt,ywt,gev,eu]=modelsolver(param,nvar,nexog,nforerrors);


%%IRFs

namvec={'epsilona';'epsilonb';'Mon. Pol. shock';'epsiloni';'epsilonw';'epsilonp';'Fiscal Pol. shock';'epsilontk';'epsilontl';'epsilonz'};
namvecchar=char(namvec);

sigg=1.035382077;
sgss=0.1708;
sigm=0.14985528;


for i=1:10

shockvector=zeros(nexog,1);

shockvector(i,1)=1;

IRF_T=100;

IRFvars=zeros(43,100);

IRFvars(:,1)=M(:,34:43)*shockvector;

for j=2:100
    IRFvars(:,j)=G*IRFvars(:,j-1);
end


if (i==7)
    IRFvars=IRFvars/sigg*(1/sgss);
elseif (i==3)
    IRFvars=IRFvars/sigm*0.25;
else
end

%Plotting variables

y=IRFvars(8,:);
R=IRFvars(3,:);

inflation=zeros(1,100);
inflation(1,1)=IRFvars(14,1);
inflation(1,2)=inflation(1,1)+IRFvars(14,2);
inflation(1,3)=inflation(1,2)+IRFvars(14,3);
inflation(1,4)=inflation(1,3)+IRFvars(14,4);

for k=4:100
    inflation(1,k)=IRFvars(14,k)+IRFvars(14,k-1)+IRFvars(14,k-2)+IRFvars(14,k-3);
end


figure(i)
subplot(2,2,2);
plot(1:100,inflation);
title('Inflation')
subplot(2,2,3);
plot(1:100,4*R);
title('Interest Rate')
subplot(2,2,4);
plot(1:100,y);
title('Output')
suptitle(sprintf('IRF to %s',char(namvec(i))))
end
