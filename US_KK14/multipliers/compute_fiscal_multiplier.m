function [mult_tau_k mult_tau_w]=compute_fiscal_multiplier(para_SS, irf_tauk, irf_tauw,horizon)
% Steady state


% benchmark

%tau_k_SS_b=0.1929;
%tau_w_SS_b=0.2088;


Rb_SS=para_SS(1);
tax_rev_tauw_SS=para_SS(2);
tax_rev_tauk_SS=para_SS(3);
%cg_SS=para_SS(4);
y_SS=para_SS(5);
%w_SS=para_SS(6);
%k_SS=para_SS(7);
%rk_SS=para_SS(8);


% options
hor=horizon;

% Present value Multiplier

mult_tau_k=zeros(1,hor);
discounted_output_tau_k=zeros(1,hor);
discounted_tau_k=zeros(1,hor);


%tau_k Multiplier

% Real interest changes
irf_Rb_b=irf_tauk(:,1);

response_Rb_b=irf_Rb_b*Rb_SS;
diff_rb=zeros(1,hor);
diff_rb(1) = response_Rb_b(1);
for i = 2:hor
    diff_rb(i) = response_Rb_b(i) - response_Rb_b(i-1);
end
diff_rb=diff_rb+Rb_SS;

% irf_output_tau_k=irf_tauk(:,5);
% response_output_tau_k=exp(irf_output_tau_k(1:hor)).*y_SS-y_SS
% 
% irf_tau_k=irf_tauk(:,3);
% response_tau_k=exp(irf_tau_k(1:hor)).*tax_rev_tauk_SS-tax_rev_tauk_SS

irf_output_tau_k=irf_tauk(:,5);
response_output_tau_k=irf_output_tau_k(1:hor)*y_SS;


irf_tau_k=irf_tauk(:,3);
response_tau_k=irf_tau_k(1:hor)*tax_rev_tauk_SS;



discounted_output_tau_k(1)=(response_output_tau_k(1));
discounted_tau_k(1)=response_tau_k(1);
mult_tau_k(1)=discounted_output_tau_k(1)/discounted_tau_k(1);

R_SS = 1;

for i=2:hor
   
    R_SS=R_SS*diff_rb(i);
    
    discounted_output_tau_k(i)=(1/R_SS)*((response_output_tau_k(i)));

    discounted_tau_k(i)=(1/R_SS)*(response_tau_k(i));

    mult_tau_k(i)=sum(discounted_output_tau_k(1:i))/sum(discounted_tau_k(1:i));
          
end

% Present value Multiplier

mult_tau_w=zeros(1,hor);
discounted_output_tau_w=zeros(1,hor);
discounted_tau_w=zeros(1,hor);


%tau_k Multiplier

% Real interest changes
irf_Rb_b=irf_tauw(:,1);

response_Rb_b=irf_Rb_b*Rb_SS;
diff_rb=zeros(1,hor);
diff_rb(1) = response_Rb_b(1);
for i = 2:hor
    diff_rb(i) = response_Rb_b(i) - response_Rb_b(i-1);
end
diff_rb=diff_rb+Rb_SS;

% irf_output_tau_w=irf_tauw(:,5);
% response_output_tau_w=exp(irf_output_tau_w(1:hor)).*y_SS-y_SS;
% 
% irf_tau_w=irf_tauw(:,2);
% response_tau_w=exp(irf_tau_w(1:hor)).*tax_rev_tauw_SS-tax_rev_tauw_SS;

irf_output_tau_w=irf_tauw(:,5);
response_output_tau_w=irf_output_tau_w(1:hor)*y_SS;

irf_tau_w=irf_tauw(:,2);
response_tau_w=irf_tau_w(1:hor)*tax_rev_tauw_SS;



discounted_output_tau_w(1)=(response_output_tau_w(1));
discounted_tau_w(1)=response_tau_w(1);
mult_tau_w(1)=discounted_output_tau_w(1)/discounted_tau_w(1);


R_SS = 1;

for i=2:hor
   
    R_SS=R_SS*diff_rb(i);
   
    discounted_output_tau_w(i)=(1/R_SS)*(response_output_tau_w(i));

    discounted_tau_w(i)=(1/R_SS)*(response_tau_w(i));

    mult_tau_w(i)=sum(discounted_output_tau_w(1:i))/sum(discounted_tau_w(1:i));
          
end