%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 4 : MCQ Question 8
clc
clear
clf

global L0 L1 L2 L3

L0 = 8;
L1 = 3;
L2 = 8;
L3 = 4;

fimplicit(@coupler)
axis equal
grid on
title('Coupler curve')
hold on
fimplicit(@coupler2)
axis([1 9 -4 4])
xlabel('X-axis')
ylabel('Y-axis')
legend('a=4.5, b=3.5','a=6.0, b=2.0','Location','east')


function F = coupler(x,y)
    global L0 L1 L3 L2
    a = 4.5;
    b = L2 - a;
    E1 = 4*a^2*b^2*L0^2*y^2;
    E2 = b*(x-L0)*(L1^2-a^2-x^2-y^2) - a*x*((x-L0)^2+y^2+b^2-L3^2);
    E3 = y^2*(b*(L1^2-a^2-x^2-y^2) - a*((x-L0)^2+y^2+b^2-L3^2))^2;
    
    eqn = E1-E2^2-E3;
    F = eqn;
end

function F = coupler2(x,y)
    global L0 L1 L3 L2
    a = 6;
    b = L2 - a;
    E1 = 4*a^2*b^2*L0^2*y^2;
    E2 = b*(x-L0)*(L1^2-a^2-x^2-y^2) - a*x*((x-L0)^2+y^2+b^2-L3^2);
    E3 = y^2*(b*(L1^2-a^2-x^2-y^2) - a*((x-L0)^2+y^2+b^2-L3^2))^2;
    
    eqn = E1-E2^2-E3;
    F = eqn;
end

%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%