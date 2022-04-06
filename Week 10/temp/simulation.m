% ode45 routine for each tstep
clear all
clc
clf

para % Call the parameters

in1 = 0; % d
in2 = pi/2; % theta_2
in3 = 0; % d_dot
in4 = 0;  %theta_2 dot

y0 = [in1;in2;in3;in4];

ti = 0;    % Intital time
tf = 2;   % Final time
tsim = [ti:0.0001:tf];

[t,y] = ode45(@eom,tsim,y0);

des = [];
for i=1:1:length(tsim)
    des = [des,reshape(des_in(tsim(i)),[6,1])];     
end

% Displacements
subplot(2,2,1);
plot(t,y(:,1),t,des(1,:))
grid on
xlabel('{Time (s)}')
ylabel('{d (m)}')
% hold on

subplot(2,2,2);
plot(t,y(:,2),t,des(2,:))
grid on
xlabel('{Time (s)}')
ylabel('{theta_2 (m)}')
% hold on
% axis([ti tf -0.2 0.2])

subplot(2,2,3);
plot(t,y(:,3),t,des(3,:))
grid on
xlabel('(Time (s)')
ylabel('d_dot')
% hold on
% axis([ti tf -pi/6 pi/6])

% Velocities
subplot(2,2,4);
plot(t,y(:,4),t,des(4,:))
grid on
xlabel('Time (s)')
ylabel('theta_2_dot')
% hold on

