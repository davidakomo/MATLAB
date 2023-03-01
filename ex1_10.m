clear, clc
% Example 1.10 table
r = [];
for k =[0,0.004,0.05,0.2,0.5,1,1.67,3]
    p = [48 44 12 1+6*k];
    a = roots(p);
    r = [r;a']
end
%% 

plot(r,"Marker","x","LineWidth",1)
grid minor
%axes Position