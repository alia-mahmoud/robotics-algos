Robot_animation.mp4

clear;
clc;
close all;

% define time and end effector path
t = linspace(0, 1, 100);
x = 2*t;
y = 2 - 2*t;

% calculate joint angles using inverse kinematics
theta2 = acos((x.^2 + y.^2 - 2)./2);
theta1 = atan2(y,x) - atan2(sin(theta2), 1 + cos(theta2));

% calculate elbow position from theta1
elbow_x = cos(theta1);
elbow_y = sin(theta1);

% set up figure for animation
figure;
axis equal;
xlim([-0.25 2.25]);
ylim([-0.5 2.25]);
grid on;
xlabel('X Position');
ylabel('Y Position');
title('2-Link Elbow Manipulator');
hold on;

% initialize the arm and end effector trail
arm = plot(nan, nan, '-o', 'LineWidth', 2);
trail = plot(nan, nan, '--', 'LineWidth', 1);

% create video file
v = VideoWriter('robot_animation', 'MPEG-4');
v.FrameRate = 20;
open(v);

% move through each point in the path
for i = 1:length(t)

    % update base, elbow, and end effector positions
    arm.XData = [0 elbow_x(i) x(i)];
    arm.YData = [0 elbow_y(i) y(i)];

    % update the path traced by the end effector
    trail.XData = x(1:i);
    trail.YData = y(1:i);

    % update animation and add frame to video
    drawnow;
    frame = getframe(gcf);
    writeVideo(v, frame);
end

% close and save video
close(v);


