% Parameters
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
