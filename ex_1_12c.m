s = tf('s');
g = (2*(s+1)*(-s+1))/((0.5*s+1)*(2*s+1)*(4*s+1));
rlocus(g)

%%
a = [48 44 12 (1+ 6*0)];
p = roots(a)