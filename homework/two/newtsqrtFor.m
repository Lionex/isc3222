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
% Output:  n = NEWTSQRT(x) is the numerical approximation of the 
%          square root of n using newton's recursive formula or
%          square roots.

switch nargin
    case 2
        maxit = 25;
    case 1
        delta = 5.0e-6;
        maxit = 25;
    case 0
        warning(sprintf('no arguments provided.'))
        return
end

if x < 0
    fprintf('x = %-g is negative, cannot calculate the square root.\n', x);
    return
end

if x < delta
    fprintf('x = %-g is less than delta = %-g, ',x,delta)
    return
end

tic

ri = x;
for i = 1:maxit
    % Copy over value from previous iteration
    rk = ri;

    % Calculate the next item of the series
    ri = 0.5 * (rk+x / rk);
    
    if abs(rk-ri)/rk < delta
        break
    end
end

toc

relerr = abs(rk-ri)/rk;
if relerr > delta
    warning(sprintf('relative error %-g is greater than delta, try increasing maxit', relerr))
end

end
