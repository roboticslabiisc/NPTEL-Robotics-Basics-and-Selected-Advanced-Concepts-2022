%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 8 : Subjective Question 2
clc
clear
clf

global m1 m2 J r g Tau2

m1 = 1;
m2 = 1;
r = 0.5;
J = 1/12;
g = 9.81;
D = [];
D_d = [];
D_dd = [];
time = 0:0.05:2;
for t = time
    if t <= 1
        d = -sqrt(3)/2 + 3*t^2 - 2*t^3;
        d_d = 6*t - 6*t^2;
        d_dd = 6 - 12*t;
    else
        d = -sqrt(3)/2 - 4 + 12*t - 9*t^2 + 2*t^3;
        d_d = 12 - 18*t + 6*t^2;
        d_dd = -18 + 12*t;
    end
    D = [D,d];
    D_d = [D_d,d_d];
    D_dd = [D_dd,d_dd];
end
% plot(time,D_dd)

F = (m1+m2)*D_dd;
Tau2 = -m2*r*D_dd*sin(pi/6) + m2*r*g*cos(pi/6);

subplot(2,1,1)
plot(time,F)
grid on
xlabel('Time (s)')
ylabel('F_1 (N)')
title('F_1 vs Time')

subplot(2,1,2)
plot(time,Tau2)
grid on
xlabel('Time (s)')
ylabel('\tau_2 (Nm)')
title('\tau_2 vs Time')
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%