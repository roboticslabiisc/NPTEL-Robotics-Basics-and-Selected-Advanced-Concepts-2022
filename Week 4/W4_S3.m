%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 4 : Subjective Question 3
clc
clear
clf

L0 = 1.25;
L1 = 3.2;
L2 = 1.05;
L3 = 1.26;
L4 = 2.68;

PL = [];
PR = [];
X = [];
for i = 0:.02:2*pi
    for j = 0:.02:2*pi
        PL = L1*[cos(i),sin(i)];
        PR = [L0,0]+L4*[cos(j),sin(j)];
        if norm(PL-PR) < L2+L3
            [xout,yout] = circcirc(PL(1),PL(2),L2,PR(1),PR(2),L3);
            for j = 1:1:2
                v1 = isfinite(xout(j));
                v2 = isfinite(yout(j));
                if v1 == 1 && v2 == 1
                    X = [[X],[xout;yout]];
                end
            end
        end
    end
end
Xp = X(1,:)';
Yp = X(2,:)';
scatter(Xp,Yp,'.')
grid on
axis equal
xlabel('X-axis')
ylabel('Y-axis')
title('Workspace of 5-bar mechanism')
axis([-3 5 -4 4])
box on

% hold on
% 
% k = boundary(Xp,Yp,1);
% hold on
% plot(Xp(k),Yp(k))
%         
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%