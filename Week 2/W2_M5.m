%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 2 : MCQ Question 5

clc
clear all

T1 = T_matrix(1,2,3,pi/3,1,1,0);
T2 = T_matrix(1,1,1,pi/4,1,2,3);
T = T1*T2

% Function to calculate the T-matrix given the axis, angle and translation vector
function T = T_matrix(Ax,Ay,Az,phi,Px,Py,Pz)
    % [Ax,Ay,Az] is the axis vector
    % phi is the angle in radian
    % [Px,Py,Pz] is the translation vector
    v = [Ax,Ay,Az];
    v = v/norm(v);
    K = [0, -v(3), v(2);
         v(3), 0, -v(1);
         -v(2), v(1), 0];
    Rot = eye(3) + sin(phi)*K + (1-cos(phi))*K^2;
    T = [Rot,[Px;Py;Pz];[0,0,0,1]];
end
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%