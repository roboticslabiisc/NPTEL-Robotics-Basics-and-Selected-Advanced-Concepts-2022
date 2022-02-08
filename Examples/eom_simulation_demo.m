%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Demo : Equation of motion simulation of spring-mass-damper system

clc
clear
clf

global m c k F

m = 1;
c = 0.5;
k = 1;
F = 0;

tspan = 0:0.1:20;
y0 = [1,0]; % Initial condition x = 1, x_dot = 0;
[t,y] = ode45(@eom,tspan,y0);

plot(t,y(:,1),t,y(:,2))
grid on
xlabel('Time')
legend('Displacement','Velocity')

function Q = eom(t,x)
    global m c k F
    
    Q(1) = x(2); % x_dot =
    Q(2) = (F - k*x(1) - c*x(2))/m; % x_double_dot =
    Q = Q';
end
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%