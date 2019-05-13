function res=calibgam(phiss,param,failure)
tau     = param(1);
omr     = param(2);
psilss  = param(3);
kpss    = param(4);
gamss   = phiss*((1-tau)*psilss+kpss)/((1-phiss)*(1-tau+tau*kpss)*(omr-1)+(1-tau)*(1-phiss)*psilss*omr-phiss*kpss);
res     = phiss*gamss-failure*(1+gamss);
