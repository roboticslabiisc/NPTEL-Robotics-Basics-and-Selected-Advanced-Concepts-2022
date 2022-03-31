%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 9 : Subjective Question 3
clc
clear
clf

J = 1;
K = 1;
F = 1;
Kp = 1;
% Kv = 0.02
for Kv = 0:0.5:2
    G = tf([K*Kv K*Kp],[J (F+K*Kv) K*Kp]);
    step(G)
    hold on
end
grid on
lgd = legend('0','0.5','1','1.5','2','Location','east');
title(lgd,'K_v')
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%