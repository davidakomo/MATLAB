syms kc s

%n = 6*kc;
%d = 48*s^3 + 44*s^2 + 12*s + 1;
sys = (6*kc)/(48*s^3 + 44*s^2 + 12*s + 1);

%[z, p, k] = tf2zp(n, d);

polezzz = poles(sys)
%zerozzz = zero(tf(n,d))

%% 
p = [-48 0 12 0];
w = roots(p)

kc = ((44.*(w.^2))-1)./6

%% 
ba = roots([3 1.8334 0.25])

K = ba.^3 + 0.9167.*ba.^2 + 0.25.*ba + 0.020835

KC = K./0.125
%%
s = tf('s');
g = (6*0.004)/(48*s^3 + 44*s^2 + 12*s + 1);
rlocus(g)