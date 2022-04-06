% Desired inputs
function [Q] = des_in(t)

if t<1  
    q1_d=3*t^2-2*t^3;
    dq1_d=6*t-6*t^2;
    ddq1_d=6-12*t;
else
    q1_d=-4+12*t-9*t^2+2*t^3;
    dq1_d=12-18*t+6*t^2;
    ddq1_d=-18+12*t;
end    

% x_b
q2_d = pi/2;    % x_b
dq2_d = 0;   % dx_b
ddq2_d = 0;  % ddx_b


Q = [q1_d,dq1_d,ddq1_d;
    q2_d,dq2_d,ddq2_d];
end