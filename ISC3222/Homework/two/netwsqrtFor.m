function ri = newtsqrtFor(x, delta, maxit)
% NEWTSQRTFOR calculates the square root with a For loop
%
%   Calculates to within margin of error delta, or up to the
%   maximum number of iterations.
%
% Synopsis: NEWTSQRTFOR(x)
%           NEWTSQRTFOR(x, delta)
%           NEWTSQRTFOR(x, delta, maxit)
%
% Input:    x - The number to estimate the roots of
%           delta - The margin of error, defaults to 5.0e-6
%           maxit - The maximum number of iterations to attempt, 
%                   defaults to 25
%
% Output:   n = NEWTSQRTFOR(x) is the numerical approximation of the 
%           square root of n using newton's recursive formula or
%           square roots.

switch nargin
    case 2
        maxit = 25;
    case 1
        delta = 5.0e-6;
        maxit = 25;
end

if x < 0
    fprintf('x = %-g is negative, cannot calculate the square root.\n', x);
    return
end

if x < delta
    fprintf('x = %-g is less than delta = %-g, ',x,delta)
end

ri = x;
rk = ri * 2;  % ensure the function can actually enter the loop
for i = 1:maxit
    if abs(rk-ri) < delta
        break
    end
    % Copy over value from previous iteration
    rk = ri;

    % Calculate the next item of the series
    ri = 0.5 * (rk+x / rk);

    % keep track of iterations
    it = 1 + it;
end

end
