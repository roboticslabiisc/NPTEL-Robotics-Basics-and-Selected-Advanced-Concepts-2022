%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 3 : Subjective Question 4
clc
clear
clf

global L1 L2 L3 x y

L1 = 5;
L2 = 3;
L3 = 1;

% Creating the path
n = 101;
Py = linspace(-5,5,n);
Px = linspace(1,7,n);

% fmincon routine
TH = [];
ics = [-0.5767;-1.8305;-0.4680];
for i = 1:1:length(Px)
    x = Px(i);
    y = Py(i);
    lb = -2*pi/3*[1;1;1];
    ub = 2*pi/3*[1;1;1];
    options = optimoptions('fmincon','Display','off');
    [xsol,fval] = fmincon(@obj,ics,[],[],[],[],lb,ub,@cons,options);
    TH = [TH,[xsol;fval]];
    ics = xsol;
end

% Plot x vs theta_i
figure(1)
g(1) = plot(Px,TH(1,:),'r');
hold on
grid on
% axis equal
xlabel('X coordinate')
% ylabel('Angle (rad)')
g(2) = plot(Px,TH(2,:),'b');
g(3) = plot(Px,TH(3,:),'g');
g(4) = plot(Px,TH(4,:),'k');
yline(2*pi/3,'--','2\pi/3','LabelHorizontalAlignment','left')
yline(-2*pi/3,'--','-2\pi/3','LabelVerticalAlignment','bottom')
hold off
axis([1 7 -3 7])
% leg = legend([h(1) h(2) h(3) h(4)],'\theta_1','\theta_2','\theta_3','\Sigma\theta_i^2');
leg = legend([g(1) g(2) g(3) g(4)],'$\theta_1$','$\theta_2$','$\theta_3$','$\Sigma\theta_i^2$','interpreter','latex');

leg.Location = 'northeast';
leg.NumColumns = 1;
title('Joint variables evolution')

% Plot y vs theta_i
figure(2)
h(1) = plot(Py,TH(1,:),'r');
hold on
grid on
% axis equal
xlabel('Y coordinate')
% ylabel('Angle (rad)')
h(2) = plot(Py,TH(2,:),'b');
h(3) = plot(Py,TH(3,:),'g');
h(4) = plot(Py,TH(4,:),'k');
yline(2*pi/3,'--','2\pi/3','LabelHorizontalAlignment','left')
yline(-2*pi/3,'--','-2\pi/3','LabelVerticalAlignment','bottom')
hold off
axis([-5 5 -3 7])
% leg = legend([h(1) h(2) h(3) h(4)],'\theta_1','\theta_2','\theta_3','\Sigma\theta_i^2');
leg = legend([h(1) h(2) h(3) h(4)],'$\theta_1$','$\theta_2$','$\theta_3$','$\Sigma\theta_i^2$','interpreter','latex');

leg.Location = 'northeast';
leg.NumColumns = 1;
title('Joint variables evolution')

% Animation of the motion
for i = 1:1:length(TH)
    figure(3)
    A = [0,0];
    B = L1*[cos(TH(1,i)),sin(TH(1,i))];
    C = B + L2*[cos(TH(1,i) + TH(2,i)),sin(TH(1,i) + TH(2,i))];
    D = C + L3*[cos(TH(1,i) + TH(2,i) + TH(3,i)),sin(TH(1,i) + TH(2,i) + TH(3,i))];
    M = [A;B;C;D];
    plot(M(:,1),M(:,2),'-x')
    axis equal
    grid on
    xlabel('X-axis')
    ylabel('Y-axis')
    title('Simulation')
    hold on
    plot(Px,Py,'--')
    axis([-2 8 -6 6])
    pause(0.1)
    hold off
end

% Optimization function
function f = obj(x)
X = x;
    f = (X(1))^2 + (X(2))^2 + (X(3))^2;
end

% Constraints
function [c,ceq] = cons(F)

global L1 L2 L3 x y

X = F;

c = [];

ceq = [-x + L1*cos(X(1)) + L2*cos(X(1) + X(2)) + L3*cos(X(1) + X(2) + X(3));
       -y + L1*sin(X(1)) + L2*sin(X(1) + X(2)) + L3*sin(X(1) + X(2) + X(3))];

end
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%