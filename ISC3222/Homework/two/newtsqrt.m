function ri = newtsqrt( x, delta, maxit)
% NEWTSQRT Newton's recurisve method for finding the square root.
%
%   Calculates to within margin of error delta, or up to the
%   maximum number of iterations.
%
% Synopsis: NEWTSQRT(x)
%           NEWTSQRT(x, delta)
%           NEWTSQRT(x, delta, maxit)
%
% Input:    x - The number to estimate the roots of
%           delta - The margin of error, defaults to 5.0e-6
%           maxit - The maximum number of iterations to attempt, 
%                   defaults to 25
%
% Output:  n = NEWTSQRT(x) is the numerical approximation of the 
%          square root of n using newton's recursive formula or
%          square roots.

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

ri = x;
rk = ri * 2;  % ensure the function can actually enter the loop
it = 0;  % create a counter variable for the loop
while abs(rk-ri) > delta && it < maxit
    % Copy over value from previous iteration
    rk = ri;

    % Calculate the next item of the series
    ri = 0.5 * (rk+x / rk);

    % keep track of iterations
    it = 1 + it;
end

end