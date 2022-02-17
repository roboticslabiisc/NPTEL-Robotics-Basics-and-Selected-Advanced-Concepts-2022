%%%%%%%%%%%%%%%%%%%%%%% CODE STARTS HERE %%%%%%%%%%%%%%%%%%%%%%%
% Robotics: Basics and Selected Advanced Concepts 
% Code by : Soumya Kanti Mahapatra, PhD Student
% Dept. of Mechanical Engineering, IISc Bangalore.
% Week 3 : Subjective Question 3
clc
clear
clf

L1 = 5;
L2 = 3;
L3 = 1;

Rout = L1 + L2 - L3;
Rin = L1 - L2 + L3;

p = [];
for i = -Rout:0.05:Rout
    for j = -Rout:0.05:Rout
        if (i^2 + j^2) <= Rout^2 && (i^2 + j^2) >= Rin^2
            p = [p,[i;j]];
        end
    end
end

scatter(p(1,:),p(2,:),'.')
grid on
axis equal
xlabel('X-axis')
ylabel('Y-axis')
title('Dexterous region of planar 2R robot')
axis([-8 8 -8 8])
box on

ang = 0:0.1:2*pi;
error = [];
for i = 1:1:length(p)
    for j = 1:1:length(ang)
        x = p(1,i);
        y = p(2,i);
        phi = ang(j);
        
        % Inverse Kinmatics
        X = x - L3*cos(phi);
        Y = y - L3*sin(phi);
        th2 = acos((X^2 + Y^2 - L1^2 - L2^2)/(2*L1*L2));
        pj = (X^2 + Y^2 - L1^2 - L2^2)/(2*L1*L2);
        if pj >1 || pj < -1
            error = [error;[x,y,phi,th2]];
            scatter(x,y,'+r')
            hold on
            grid on
            axis equal
        end
        for k = 0:1:1
            t2 = (-1)^k;
            k1 = L1 + L2*cos(t2);
            k2 = L2*sin(t2);
            th1 = atan2(Y,X) - atan2(k2,k1);
            th3 = phi - th1 - t2;
            
            % Check if theta_i is real
            a1 = isreal(th1);
            a2 = isreal(th2);
            a3 = isreal(th3);
            if a1 == 0 || a2 == 0 || a3 == 0
                [x;y;phi] % This will show [x;y;phi] if any IK solution is imaginary
            end
            
            % Cross check
            x1 = L1*cos(th1) + L2*cos(th1+t2) + L3*cos(th1+t2+th3);
            y1 = L1*sin(th1) + L2*sin(th1+t2) + L3*sin(th1+t2+th3);
            if (x1^2 + y1^2) >= Rout^2 && (x1^2 + y1^2) <= Rin^2
                error = [error;[x,y,phi,th2]]; % This stores [x;y;phi] if any IK solution is imaginary
            end
        end
    end
end
error
%%%%%%%%%%%%%%%%%%%%%%% CODE ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%
