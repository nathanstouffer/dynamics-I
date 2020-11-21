% 
%
% A file to produce a number of trajectories in the phase plane
% given xdot=f(x,y) and ydot=g(x,y)
%
%  f and g must be hardcoded into matlab
%
%

function trajectory(x0, y0)

    num_steps = 1000000;            % number of steps
    step_size = 0.001;              % step size
    % define vectors to store the steps
    x_traj = 1:num_steps;
    y_traj = 1:num_steps;
    % iterate over all initial conditions
    for i = 1:length(x0)
        % set initial condition in trajectory vector
        x_traj(1) = x0(i);
        y_traj(1) = y0(i);
        for j = 2:num_steps
            x = x_traj(j-1);
            y = y_traj(j-1);
            x_traj(j) = x + step_size*f(x, y);
            y_traj(j) = y + step_size*g(x, y);
        end
        plot(x_traj, y_traj);
        hold on;
    end
    hold off;
end

function vals = f(x, y)
    vals = x-y-x.*(x.^2 + 5*y.^2);
end

function vals = g(x, y)
    vals = x+y-y.*(x.^2+y.^2);
end

