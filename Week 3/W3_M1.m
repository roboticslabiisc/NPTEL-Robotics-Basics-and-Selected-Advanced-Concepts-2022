%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 3 : MCQ Question 1

clear
clc
clf

L1 = 5;
L2 = 5;

X = [];
Y = [];

for i = -pi/2:0.01:pi/2
    for j = -pi/2:0.01:pi/2
        x = L1*cos(i) + L2*cos(i+j);
        y = L1*sin(i) + L2*sin(i+j);
        X = [[X],x];
        Y = [[Y],y];
        %[i,j,x,y]
    end
end

scatter(X,Y,'.','MarkerFaceAlpha',0)
grid on
axis equal
xlabel('X-axis')
ylabel('Y-axis')
title('Workspace of constrained planar 2R robot')
axis([-6 11 -11 11])
box on


% % Ploting the boundary -- Extra
% [k,v] = boundary(X',Y',1);
% clf
% fill(X(k),Y(k),'c','FaceAlpha',0.3);
% grid on
% axis equal
% xlabel('X-axis')
% ylabel('Y-axis')
% hold on
% scatter(0,0,'*r')
% xticks(-6:2:12)
% yticks(-12:2:12)
% axis([-6 12 -12 12])

%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%