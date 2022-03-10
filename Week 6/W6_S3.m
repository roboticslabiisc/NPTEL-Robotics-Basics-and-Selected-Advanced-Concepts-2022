%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 6 : Subjective Question 3
clc
clear
clf

L1 = 1;
L2 = 0.5;
t1 = pi/4;
t2 = pi/4;

J = [- L1*sin(t1) - L2*sin(t1+t2), -L2*sin(t1+t2);
       L1*cos(t1) + L2*cos(t1+t2),  L2*cos(t1+t2)];
g = J'*J;
A = (J/g)*(J/g)';

fimplicit(@(x,y) [x,y]*A*[x;y]-1)
grid on
axis equal
axis([-1.5 1.5 -0.8 0.8])
xlabel('X-axis')
ylabel('Y-axis')
title('Velocity Ellipse')
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%