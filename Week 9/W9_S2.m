%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 9 : Subjective Question 2
clc
clear
clf

% Part 1
x0a = 0;
x1a = 45;
x2a = 0;
x3a = 0;
ta = 0:0.05:1;
Xa = traj(x0a,x1a,x2a,x3a,ta(end));

THa = Xa(1) + Xa(2).*ta + Xa(3)*ta.^2 + Xa(4)*ta.^3;
TH_da = Xa(2) + 2*Xa(3)*ta + 3*Xa(4)*ta.^2;
TH_dda = 2*Xa(3) + 6*Xa(4)*ta;

% Part 2
x0b = 45;
x1b = 60;
x2b = 0;
x3b = 0;
tb = 0:0.05:2;
Xb = traj(x0b,x1b,x2b,x3b,tb(end));

THb = Xb(1) + Xb(2).*tb + Xb(3)*tb.^2 + Xb(4)*tb.^3;
TH_db = Xb(2) + 2*Xb(3)*tb + 3*Xb(4)*tb.^2;
TH_ddb = 2*Xb(3) + 6*Xb(4)*tb;

t = [ta,tb+ta(end)];
TH = [THa,THb];
TH_d = [TH_da,TH_db];
TH_dd = [TH_dda,TH_ddb];

subplot(3,1,1)
plot(t,TH)
grid on
xlabel('Time (s)','Interpreter','latex')
ylabel('$${\theta}_1$$ (rad)','Interpreter','latex');

subplot(3,1,2)
plot(t,TH_d)
grid on
xlabel('Time (s)','Interpreter','latex')
ylabel('$$\dot{\theta}_1$$ (rad/s)','Interpreter','latex');

subplot(3,1,3)
plot(t,TH_dd)
grid on
xlabel('Time (s)','Interpreter','latex')
ylabel('$$\ddot{\theta}_1$$ (rad/s$$^2)$$','Interpreter','latex');

sgtitle('Trajectory of $$\theta_1, \dot{\theta}_1, \ddot{\theta}_1$$ vs t','Interpreter','latex')

function F = traj(x0,x1,x2,x3,t)
%     a = x0;
%     b = x0 + x1*t + x2*t^2 + x3*t^3;
%     c = x1;
%     d = x1 + 2*x2*t + 3*x3*t^2;
    A = [1, 0, 0, 0;
         1, t, t^2, t^3;
         0, 1, 0, 0;
         0, 1, 2*t, 3*t^2];
     B = [x0;x1;x2;x3];
     F = linsolve(A,B);
end
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%