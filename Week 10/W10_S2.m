%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Pramod Pal and Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 10 : Subjective Question 2

clear all
clc
clf

global g m_1 m_2 I_2 r_2 Kp1 Kp2  Kv1 Kv2 

g = 9.81;

m_1 = 1; 
m_2 = 1;% Mass of platform
I_2 = 1/12;          % z-MI of platform about CG
r_2 = 0.5;    % x-coordinate of CG of the platform wrt a fixed point

Kp1 = 1000; %previously 1000
Kp2 = 7500; %previously 7500

Kv1 = 2*sqrt(Kp1);
Kv2 = 2*sqrt(Kp2);

in1 = 0; % d
in2 = pi/2; % theta_2
in3 = 0; % d_dot
in4 = 0;  %theta_2 dot

y0 = [in1;in2;in3;in4];

ti = 0;    % Intital time
tf = 2;   % Final time
tsim = [ti:0.0001:tf];

[t,y] = ode45(@eom,tsim,y0);

des = [];
for i=1:1:length(tsim)
    des = [des,reshape(des_in(tsim(i)),[6,1])];     
end

figure(1);
plot(t,y(:,1),t,des(1,:))
grid on
xlabel('Time (s)','Interpreter','latex')
ylabel('d (m)','Interpreter','latex')
legend('Actual','Desired')

figure(2);
plot(t,y(:,2),t,des(2,:))
grid on
xlabel('Time (s)','Interpreter','latex')
ylabel('$$\theta_2$$ (rad)','Interpreter','latex')
legend('Actual','Desired','Location','north')

figure(3);
plot(t,y(:,3),t,des(3,:))
grid on
xlabel('Time (s)','Interpreter','latex')
ylabel('$$\dot{d}$$ (m)','Interpreter','latex')
legend('Actual','Desired')

figure(4);
plot(t,y(:,4),t,des(4,:))
grid on
xlabel('Time (s)','Interpreter','latex')
ylabel('$$\dot{\theta}_2$$ (rad/s)','Interpreter','latex')
legend('Actual','Desired')

% Desired inputs
function [Q] = des_in(t)
    % d
    if t<1  
        q1_d=3*t^2-2*t^3;
        dq1_d=6*t-6*t^2;
        ddq1_d=6-12*t;
    else
        q1_d=-4+12*t-9*t^2+2*t^3;
        dq1_d=12-18*t+6*t^2;
        ddq1_d=-18+12*t;
    end    

    % theta_2
    q2_d = pi/2;
    dq2_d = 0;
    ddq2_d = 0;


    Q = [q1_d,dq1_d,ddq1_d;
        q2_d,dq2_d,ddq2_d];
end

% M matrix
function [M] = mass(q1,q2,t)
    global m_1 m_2 r_2 I_2
    M = [m_1+m_2  -m_2*r_2*sin(q2)  ; -m_2*r_2*sin(q2)  m_2*((r_2)^2)+I_2];
end

% C vector
function [C] = cori(q1,q2,q3,q4,t)
    global m_2 r_2 
    C = [0 -m_2*r_2*cos(q2)*q4 ; 0 0]*[q3;q4];
end

% G vector
function [G] = grav(q1,q2,t)
    global g r_2 m_2
    G = [0 ; m_2*r_2*g*cos(q2)];
end

% Equations of motion
function f = eom(t,q)
    ddq = (mass(q(1),q(2),t)^-1)*(tau(q(1),q(2),q(3),q(4),t)-cori(q(1),q(2),q(3),q(4),t)-grav(q(1),q(2),t));
    f = [q(3);q(4);ddq];
end

% Tau vector (input to the plant)
function [T] = tau(q1,q2,q3,q4,t)
    global Kp1 Kp2 Kv1 Kv2
    e = des_in(t)-[q1,q3,0;q2,q4,0];
    e1 = e(1,:)';
    e2 = e(2,:)';
    T = [Kp1*e1(1)+Kv1*e1(2)+e1(3);Kp2*e2(1)+Kv2*e2(2)+e2(3)];
end
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%