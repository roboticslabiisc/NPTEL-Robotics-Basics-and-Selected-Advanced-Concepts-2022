%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 9 : Subjective Question 4
clc
clear
clf

J = 1;
K = 1;
F = 1;
Kp = 1;
Kv = 2;

G1 = tf([Kv Kp],[1]);
G2 = tf([K],[J F 0]);

G = (G1*G2 + 0.1*G2)/(1+G1*G2);
step(G)
grid on
title("PD control (K_p= " + Kp + ", K_v= " + Kv + ")")

figure(2)
for Ki = 1:1:4
%     figure(Ki+2)
%     Ki = 3;
    G1 = tf([Kv Kp Ki],[1 0]);
    G = (G1*G2 + 0.1*G2)/(1+G1*G2);
    subplot(2,2,Ki)
    step(G)
    title("PID control (K_p= " + Kp + ", K_v= " + Kv + ", K_i= " + Ki +")")
    grid on
end
grid on
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%