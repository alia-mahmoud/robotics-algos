clear;
clc;
close all;

% defining t. i used 0 to 1 because those values get me from 0 to 2 in my
% position eqns defined below.

t = linspace(0, 1, 100000); 

% end-effector position

x = 0 + 2*t;
y = 2 - 2*t;

% inverse kinematics equations

theta2 = acos((x.^2 + y.^2 - 2)/2);
theta1 = atan2(y,x) - atan(sin(theta2)./(1 + cos(theta2)));


plot(t, theta1);
hold on;
plot(t, theta2);

xlabel('Time (s)');
ylabel('\Theta (rad)');
legend('\theta_1', '\theta_2');






















