% 
%
% A file to produce a two dimensional vector field given xdot=f(x,y) and ydot=g(x,y)
%
%  f and g must be hardcoded into matlab
%
%

function v_field_2d(normalize, scale)
    % define x and y ranges
    xrange = [-5, 5];
    yrange = [-5, 5];
    % how many sample points to get from the range
    sample = 20;
    xstep = abs(xrange(1)-xrange(2))/sample;
    ystep = abs(yrange(1)-yrange(2))/sample;

    % declare x and y matrices
    [x, y] = meshgrid(xrange(1):xstep:xrange(2), yrange(1):ystep:yrange(2));
    
    % compute tangent vector at each point
    xdot = f(x, y);
    ydot = g(x, y);
    
    % normalize the vectors
    if (normalize)
        [xdot, ydot] = unit(xdot, ydot);
        % compute value for scale
        scale = 0.25;
    elseif (nargin == 1)
        scale = 1;
    end
    % display the vector field
    q = quiver(x, y, xdot, ydot, scale);
end

function vals = f(x, y)
    vals = x.*y -1;
end

function vals = g(x, y)
    vals = x-y.^3;
end

function [xhat, yhat] = unit(xdot, ydot)
    norm = sqrt(xdot.^2 + ydot.^2);
    xhat = xdot./norm;
    yhat = ydot./norm;
end

