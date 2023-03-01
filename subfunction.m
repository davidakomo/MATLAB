function [a, s] = subfunction(low, high)
a = low + rand(3,4)*(high-low);
s = sumAllElements(a);

function suma = sumAllElements(M)
global v
v = M(:);
suma = sum(v);