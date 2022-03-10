%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 6 : Subjective Question 4
clc
clear

global L1 L2 L3 a b

L1 = 1;
L2 = 1;
L3 = 1;
a = 0.5;
b = 1;

ics = [1,1,1];

options = optimoptions('fsolve','Display','off');
t = fsolve(@constraints,ics,options);

theta_i = t

s1 = sin(t(1)); s2 = sin(t(2)); s3 = sin(t(3));
c1 = cos(t(1)); c2 = cos(t(2)); c3 = cos(t(3));

K = [2*L1 - 3*c1 + L2*c1*c2 - 2*L2*s1*s2, 2*L2 - 3*c2 + L1*c1*c2 - 2*L1*s1*s2, 0;
     0, 2*L2 - 3*c2 + L3*c2*c3 - 2*L3*s2*s3, 2*L3 - 3*c3 + L2*c2*c3 - 2*L2*s2*s3;
     2*L1 - 3*c1 + L3*c1*c3 - 2*L3*s1*s3, 0, 2*L3 - 3*c3 + L1*c1*c3 - 2*L1*s1*s3]
 
K_star = [3*L1*s1 - L1*L2*s1*c2 - 2*L1*L2*c1*s2, 3*L2*s2 - L1*L2*c1*s2 - 2*L1*L2*s1*c2, 0;
          0, 3*L2*s2 - L2*L3*s2*c3 - 2*L2*L3*c2*s3, 3*L3*s3 - L2*L3*c2*s3 - 2*L2*L3*s2*c3;
          3*L1*s1 - L1*L3*s1*c3 - 2*L1*L3*c1*s3, 0, 3*L3*s3 - L1*L3*c1*s3 - 2*L1*L3*s1*c3]

function F = constraints(x)

    global L1 L2 L3 a b
    
    t1 = x(1);
    t2 = x(2);
    t3 = x(3);

    F(1) = 3 - 3*a^2 + L1^2 + L2^2 + L1*L2*cos(t1)*cos(t2) - 2*L1*L2*sin(t1)*sin(t2) - 3*L1*cos(t1) - 3*L2*cos(t2);
    F(2) = 3 - 3*a^2 + L2^2 + L3^2 + L2*L3*cos(t2)*cos(t3) - 2*L2*L3*sin(t2)*sin(t3) - 3*L2*cos(t2) - 3*L3*cos(t3);
    F(3) = 3 - 3*a^2 + L3^2 + L1^2 + L3*L1*cos(t3)*cos(t1) - 2*L3*L1*sin(t3)*sin(t1) - 3*L3*cos(t3) - 3*L1*cos(t1);
end
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%