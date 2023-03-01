clear,clc
syms x1 x2 x3 x4 u1 y

%defining the outputs
Cm = x1;
Ci = x2;
Do = x3;
Di = x4;
y = Di/Do;

%inputs
Fi = u1;

%nominal values of the outputs and inputs
x1s = 5.50677;
x2s = 0.132906;
x3s = 0.0019752;
x4s = 49.3818;
u1s = 0.016783;
ys = 25000.5;

%equations to be linearized
F1 = 10*(6-Cm) - (2.4568*Cm*sqrt(Ci)); 
F2 = 80*Fi - 10.1022*Ci;
F3 = 0.0024121*Cm*sqrt(Ci) + 0.112191*Ci - 10*Do;
F4 = 245.978*Cm*sqrt(Ci) - 10*Di;

%Taylor series representation
syms deltax1 deltax2 deltax3 deltax4 deltau1 
ddeltax1_dt = diff(F1,x1)*deltax1 + diff(F1,x2)*deltax2 + diff(F1,x3)*deltax3 +diff(F1,x4)*deltax4 + diff(F1,u1)*deltau1;
ddeltax2_dt = diff(F2,x1)*deltax1 + diff(F2,x2)*deltax2 + diff(F2,x3)*deltax3 +diff(F2,x4)*deltax4 + diff(F2,u1)*deltau1;
ddeltax3_dt = diff(F3,x1)*deltax1 + diff(F3,x2)*deltax2 + diff(F3,x3)*deltax3 +diff(F3,x4)*deltax4 + diff(F3,u1)*deltau1;
ddeltax4_dt = diff(F4,x1)*deltax1 + diff(F4,x2)*deltax2 + diff(F4,x3)*deltax3 +diff(F4,x4)*deltax4 + diff(F4,u1)*deltau1;
G1 = y - ys;

% Obtaining matrix A,B,C,D
A = [diff(F1,x1), diff(F1,x2), diff(F1,x3), diff(F1,x4);diff(F2,x1), diff(F2,x2), diff(F2,x3), diff(F2,x4); diff(F3,x1), diff(F3,x2), diff(F3,x3), diff(F3,x4); diff(F4,x1), diff(F4,x2), diff(F4,x3), diff(F4,x4)]; 
B = [diff(F1,u1); diff(F2,u1); diff(F3,u1); diff(F4,u1)];
C = [diff(G1,x1), diff(G1,x2), diff(G1,x3), diff(G1,x4)];
D = [diff(G1,u1)];

%obtaining the numerical values of A B C and D
A = double(subs(A, [x1,x2,x3,x4,u1],[x1s,x2s,x3s,x4s,u1s])); 
B = double(subs(B, [x1,x2,x3,x4,u1],[x1s,x2s,x3s,x4s,u1s])); 
C = double(subs(C, [x1,x2,x3,x4,u1],[x1s,x2s,x3s,x4s,u1s])); 
D = double(subs(D, [x1,x2,x3,x4,u1],[x1s,x2s,x3s,x4s,u1s])); 

eig(A)

volt_ss = ss(A,B,C,D)
volt_tf = tf(volt_ss)
