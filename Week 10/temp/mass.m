% M matrix
function [M] = mass(q1,q2,q3,q4,t)
global m_1 m_2 r_2 I_2
M=[m_1+m_2  -m_2*r_2*sin(q2)  ; -m_2*r_2*sin(q2)  m_2*((r_2)^2)+I_2]

end