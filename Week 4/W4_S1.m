%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 4 : Subjective Question 1
clc
clear
clf

global L0 L1 L2 L3 t p1

L0 = 3;
L1 = 4;
L2 = 6;
L3 = 6;

theta = linspace(0,2*pi,100);
p1 = 0;
p2 = -2;
phi_1 = [];
phi_2 = [];
for i = 1:1:length(theta)
    t = theta(i);
    options = optimoptions('fsolve','Display','off');
    p1 = fsolve(@F1,p1,options);
    phi_1 = [phi_1,p1];
    p2 = fsolve(@F2,p2,options);
    phi_2 = [phi_2,p2];
end
phi_3 = theta + phi_2 - phi_1 - pi;
Total = theta + phi_2 - phi_1 - phi_3;

% Angle plots
figure(1)
plot(theta,phi_1,theta,phi_2,theta,phi_3,theta,Total)
grid on
legend('\phi_1','\phi_2','\phi_3','\theta_1+\phi_2-\phi_1-\phi_3','Location','east')
axis([0 2*pi -5 5])
xlabel('\theta_1 (rad)')
ylabel('Angle (rad)')

% Coupler curve plots
figure(2)
fimplicit(@coupler,[-3 7 -5 5])
axis equal
grid on
title('Coupler curve')
xlabel('X-axis')
ylabel('Y-axis')
Xc = [];
Yc = [];
Xp = [];
Yp = [];
for i = 1:1:length(theta)
    X = [0;L1*cos(theta(i));(L1*cos(theta(i))+L2*cos(theta(i)+phi_2(i)));(L0)];
    Y = [0;L1*sin(theta(i));(L1*sin(theta(i))+L2*sin(theta(i)+phi_2(i)));(0)];
    Xp = [Xp,X];
    Yp = [Yp,Y];
    Xc = [Xc,(X(2)+X(3))/2];
    Yc = [Yc,(Y(2)+Y(3))/2];
end

% Simulation
for i = 1:1:length(theta)
    figure(3)
    clf
    plot(Xp(:,i),Yp(:,i),'-o')
    xlabel('X-axis')
    ylabel('Y-axis')
    axis equal
    grid on
    axis([-5 10 -6 6])
    xlabel('X-axis')
    ylabel('Y-axis')
    title('Simulation')
    hold on
    plot(Xc(1:i),Yc(1:i))
    scatter(Xc(i),Yc(i),'r*')
    hold off
    pause(0.001)
end

function F = F1(x)
    global L0 L1 L2 L3 t
    
    F = L0^2 + L1^2 + L3^2 - L2^2 - 2*L1*cos(t)*(L3*cos(x)+L0)-2*L1*L3*sin(x)*sin(t) + 2*cos(x)*L0*L3;
end

function F = F2(x)
    global L0 L1 L2 L3 t p1

    F = L1*cos(t) + L2*cos(t+x) - L0 - L3*cos(p1);
end

function F = coupler(x,y)
    global L0 L1 L2 L3
    a = L2/2;
    b = L2/2;
    E1 = 4*a^2*b^2*L0^2*y^2;
    E2 = b*(x-L0)*(L1^2-a^2-x^2-y^2) - a*x*((x-L0)^2+y^2+b^2-L3^2);
    E3 = y^2*(b*(L1^2-a^2-x^2-y^2) - a*((x-L0)^2+y^2+b^2-L3^2))^2;
    
    eqn = E1-E2^2-E3;
    F = eqn;
end
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%