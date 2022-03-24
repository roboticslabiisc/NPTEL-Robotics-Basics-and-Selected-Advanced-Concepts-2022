%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 8 : Subjective Question 3
clc
clear
clf

global m1 m2 J r g

m1 = 1;
m2 = 1;
r = 0.5;
J = 1/3;
g = 9.81;

y0 = [0.5,pi/6,0,0];
tspan = 0:.1:10;
[t,y] = ode45(@odePR,tspan,y0);

width = 1; % whatever
height = 0.5; % whatever...

for i = 1:1:length(t) % This is the simulation which is extra
    clf
    xCenter = y(i,1); % Wherever...
    yCenter = 0; % Wherever...
    xLeft = xCenter - width/2;
    yBottom = yCenter - height/2;
    rectangle('Position', [xLeft, yBottom, width, height], 'FaceColor', 'c');
    hold on
    LX = [y(i,1);y(i,1)+2*cos(y(i,2))];
    LY = [0;2*sin(y(i,2))];
    plot(LX,LY,'r','LineWidth',3)
    axis equal
    axis([-2 4 -2 1])
    xlabel('X-axis')
    ylabel('Y-axis')
    title('Simulation')
    grid on
    pause(.01)
end

figure(2)
subplot(2,1,1)
plot(t,y(:,1))
grid on
xlabel('Time (s)')
ylabel('d (m)')
title('d vs Time')
% axis equal

subplot(2,1,2)
plot(t,y(:,2))
grid on
xlabel('Time (s)')
ylabel('\theta_2 (rad)')
title('\theta_2 vs Time')
% axis equal

function F = odePR(t,q)
 global m1 m2 J r g

 T1 = 0;
 T2 = 0;

 F1 = q(3);
 F2 = q(4);
 F3 = 0.1e1 / (-sin(q(2)) ^ 2 * m2 ^ 2 * r ^ 2 + m1 * m2 * r ^ 2 + m2 ^ 2 * r ^ 2 + J * m1 + J * m2) * (q(4) ^ 2 * cos(q(2)) * m2 ^ 2 * r ^ 3 - cos(q(2)) * sin(q(2)) * g * m2 ^ 2 * r ^ 2 + J * q(4) ^ 2 * cos(q(2)) * m2 * r + sin(q(2)) * T2 * m2 * r + T1 * m2 * r ^ 2 + J * T1);
 F4 = (q(4) ^ 2 * cos(q(2)) * sin(q(2)) * m2 ^ 2 * r ^ 2 - cos(q(2)) * g * m1 * m2 * r - cos(q(2)) * g * m2 ^ 2 * r + sin(q(2)) * T1 * m2 * r + T2 * m1 + T2 * m2) / (-sin(q(2)) ^ 2 * m2 ^ 2 * r ^ 2 + m1 * m2 * r ^ 2 + m2 ^ 2 * r ^ 2 + J * m1 + J * m2);
 
 F = [F1;F2;F3;F4];

end
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%