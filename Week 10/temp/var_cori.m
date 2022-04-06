% C vector
function [C] = var_cori(q1,q2,q3,q4,t)

global g  r_2 
m_2 =1.2 ;


C=[0 -m_2*r_2*cos(q2)*q4 ; 0 0]*[q3;q4];

end