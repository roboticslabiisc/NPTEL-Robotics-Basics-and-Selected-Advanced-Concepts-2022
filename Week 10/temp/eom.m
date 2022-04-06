% Equations of motion
function f = eom(t,q)
ddq = (mass(q(1),q(2),q(3),q(4),t)^-1)*(tau(2,q(1),q(2),q(3),q(4),t)-cori(q(1),q(2),q(3),q(4),t)-grav(q(1),q(2),q(3),q(4),t));

f = [q(3);q(4);ddq];
end