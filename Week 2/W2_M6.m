%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 2 : MCQ Question 6

clc
clear all

R1 = rotx(60); % Rotation matrix for rotation about X-axis by 60 degrees
v = [0;1;0]; 
v_new1 = (R1^-1)*v; % Finding the global Y-axis in the new local rotated coordinates
R2 = R_matrix(v_new1(1),v_new1(2),v_new1(3),pi/4);
R = R1*R2;
v_new2 = (R^-1)*[0;0;1]; % Finding the global Z-axis in the new local rotated coordinates
R3 = R_matrix(v_new2(1),v_new2(2),v_new2(3),pi/6);
R = R1*R2*R3 %Final rotation matrix

% Alternate solution
Ra = rotx(60)*roty(45)*rotz(30)

% % Test
% for i = 0:0.01:pi/2
%     clf
%     R3 = R_matrix(v_new2(1),v_new2(2),v_new2(3),i);
%     R = R1*R2*R3;
% 
%     A = [0;0;1];
%     B = R1*A;
%     C = R1*R2*A;
%     D = R*A;
% 
%     P = [A,B,C,D];
%     % scatter3(P(:,1),P(:,2),P(:,3))
%     scatter3(P(1,:),P(2,:),P(3,:))
%     axis equal
%     axis([-1 1 -1 1 -1 1])
%     xlabel('X')
%     ylabel('Y')
%     zlabel('Z')
%     view([0 0 1])
%     pause(.01)
% end

% Function to get R-matrix given axis and angle
function R = R_matrix(Ax,Ay,Az,phi)
    % [Ax,Ay,Az] is the axis vector
    % phis is the angle of rotation
    v = [Ax,Ay,Az];
    v = v/norm(v);
    K = [0, -v(3), v(2);
         v(3), 0, -v(1);
         -v(2), v(1), 0];
    R = eye(3) + sin(phi)*K + (1-cos(phi))*K^2;
end

%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%