function [SS,TF]= volt_linear()
clc,clear

%state variable matrix
x=[5.50677,0.132906,0.0019752,49.3818]';

%input variable
u=[0.016783]';

%Getting the state space model
[A,B,C,D]=linmod('volt_l_mfile',x,u);
SS=ss(A,B,C,D);

%Getting transfer function
TF=tf(SS);

%Get eigen value of A
eig(A)
