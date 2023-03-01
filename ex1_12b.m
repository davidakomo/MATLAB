clc, clear
syms kc s

sys = (2*kc*(s+1)*(-s+1))/((0.5*s+1)*(2*s+1)*(4*s+1))

polezzz = poles(sys)

%% 
p = [-4 0 6.5 0];
w = roots(p)

kc = ((11.*(w.^2))-1)./(2+2.*(w.^2))

%% 
ba = roots([1 0 -4.625 -6 -1.625])

minus_K = (ba.^3 + 2.75.*ba.^2 + 1.625.*ba + 0.25)./(ba.^2 - 1)

KC = -minus_K./-0.5

%% 
plot(KC)