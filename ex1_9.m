x=fsolve(@(x) tan(5*x)+10*x, [-0.5], optimset('Display', "off"));

%% 
% syms w
% A = [tan(5*w) + 10*w];
% %fun = matlabFunction(det(A))
% DA = det(A)
% W = solve(DA,w)


syms w
A=[-2000*w^2+280*1e3,-280*1e3;280*1e3,-2000*w^2+280*1e3];
fun = matlabFunction(det(A))
DA = det(A)
W = solve(DA,w)