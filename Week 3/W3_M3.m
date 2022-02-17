%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 3 : MCQ Question 3

clc
clear

alpha = [0,-90,0,-90,90,-90];
a = [0,0,.4318,.019,0,0];
d = [0,0,0.125,.432,0,0];

T = [0.8660   -0.5000         0    0.1855;
     0.3536    0.6124   -0.7071    0.2514;
     0.3536    0.6124    0.7071    0.1267;
          0         0         0    1.0000];
      
% T = [0.9749   -0.2192   -0.0388    0.1304; 
%      0.1643    0.8262   -0.5388    0.3071;
%      0.1502    0.5190    0.8415    0.0482;
%           0         0         0    1.0000];
% The above T is for the solution to the example in lecture.

x = T(1,4);
y = T(2,4);
z = T(3,4);
R = T(1:3,1:3);

t1 = [];
t2 = [];
t3 = [];
t4 = [];
t5 = [];
t6 = [];
for i = 1:1:2
    th1 = 2*atan((-x + (-1)^(i)*sqrt(x^2 + y^2 -d(3)^2))/(y + d(3)));
    th1 = th1*180/pi;
    t1 = [[t1],th1];
end

for i = 1:1:2
    K = (1/(2*a(3)))*(x^2 + y^2 + z^2 - d(3)^2 - a(3)^2 - a(4)^2 - d(4)^2);
    th3 = 2*atan((-d(4) + (-1)^(i)*sqrt(d(4)^2 + a(4)^2 - K^2))/(K + a(4)));
    th3 = th3*180/pi;
    t3 = [[t3],th3];
end
The = [];
for i = 1:1:2
    for j = 1:1:2
        c3 = cos(t3(j)*pi/180);
        s3 = sin(t3(j)*pi/180);
        num = -a(3) - a(4)*c3 + d(4)*s3 + ((-1)^i)*sqrt(a(3)^2 + a(4)^2 + d(4)^2 + 2*a(3)*(a(4)*c3-d(4)*s3)-z^2);
        den = z - (a(4)*s3 + d(4)*c3);
        th2 = 2*atan(num/den);
        th2 = th2*180/pi;
        t2 = [[t2],th2];
        The = [The,[th2;t3(j)]];
    end
end
The = [[t1(1),t1(1),t1(2),t1(2)];The];

Theta = [];
for i = 1:1:length(The)
    P = The(:,i);
    R_03 = eye(3);
    for j = 1:1:3
        R_03 = R_03*rotx(alpha(j))*rotz(P(j));
    end
    Rn = R_03^(-1)*R;
    for q = 1:1:2
        th5 = atan2((-1)^(q)*sqrt(Rn(2,1)^2 + Rn(2,2)^2),Rn(2,3));
        th4 = atan2(Rn(3,3)/sin(th5),-Rn(1,3)/sin(th5));
        th6 = atan2(-Rn(2,2)/sin(th5),Rn(2,1)/sin(th5));
        t5 = [[t5],th5*180/pi];
        t6 = [[t6],th6*180/pi];
        t4 = [[t4],th4*180/pi];
        Theta = [[Theta],[P;[th4;th5;th6]*180/pi]];
    end
end
THETA = array2table(Theta);
THETA.Properties.VariableNames = ({'Solution 1','Solution 2','Solution 3','Solution 4','Solution 5','Solution 6','Solution 7','Solution 8'});
% THETA.Properties.VariableNames = ({'Solution1','Solution2','Solution3','Solution4','Solution5','Solution6','Solution7','Solution8'});
THETA.Properties.RowNames = ({'Theta 1','Theta 2','Theta 3','Theta 4','Theta 5','Theta 6'});
disp(THETA)

%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%