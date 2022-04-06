% Tau vector (input to the plant)
function [T] = tau(var,q1,q2,q3,q4,t)
global g  Kp1 Kp2 Kp3 Kv1 Kv2 Kv3
e = des_in(t)-[q1,q3,0;q2,q4,0];
e1 = e(1,:)';
e2 = e(2,:)';
if var == 1 %For model base controller
    %uncomment the below line for m_1 and m_2 =.8 and 1.2
    T = var_mass(q1,q2,q3,q4,t)*[Kp1*e1(1)+Kv1*e1(2)+e1(3);Kp2*e2(1)+Kv2*e2(2)+e2(3)] + var_cori(q1,q2,q3,q4,t) + var_grav(q1,q2,q3,q4,t);
    
   
    %uncomment the below line for m_1 and m_2 =1
    %T = mass(q1,q2,q3,q4,t)*[Kp1*e1(1)+Kv1*e1(2)+e1(3);Kp2*e2(1)+Kv2*e2(2)+e2(3)] + cori(q1,q2,q3,q4,t) + grav(q1,q2,q3,q4,t);

else %For PD controller
    T = [Kp1*e1(1)+Kv1*e1(2)+e1(3);Kp2*e2(1)+Kv2*e2(2)+e2(3)];
end