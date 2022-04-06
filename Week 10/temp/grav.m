% G vector
function [G] = grav(q1,q2,q3,q4,t)

global g r_2 m_2

G=[0 ; m_2*r_2*g*cos(q2)]
end