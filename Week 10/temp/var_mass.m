% M matrix
function [M] = var_mass(q1,q2,q3,q4,t)

global r_2 I_2
m_1 = 0.8;
m_2 = 1.2;
M=[m_1+m_2  -m_2*r_2*sin(q2)  ; -m_2*r_2*sin(q2)  m_2*((r_2)^2)+I_2];

end