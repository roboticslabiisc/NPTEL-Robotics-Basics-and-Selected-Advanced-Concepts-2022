%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 9 : Subjective Question 1

clc
clear
clf

x0 = 0;
x1 = 60;
x2 = 0;
x3 = 0;
t = 0:0.05:3;
X = traj(x0,x1,x2,x3,t(end));

TH = X(1) + X(2).*t + X(3)*t.^2 + X(4)*t.^3;
TH_d = X(2) + 2*X(3)*t + 3*X(4)*t.^2;
TH_dd = 2*X(3) + 6*X(4)*t;

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