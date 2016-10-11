function s = trapezoids( f, a, b, n )
% TRAPEZOIDS calculates the numerical approximation of a definite integral
%   Uses the trapezoidal rule to calculate the sum of the areas of
%   trapezoids that approximate the curve.  Precision increases with larger
%   n, which represents the number of trapezoids.
%
% Synopsis: TRAPEZOIDS(f)
%           TRAPEZOIDS(f, b)
%           TRAPEZOIDS(f, a, b)
%           TRAPEZOIDS(f, a, b, n)
%
% Input:    f - the function to integrate
%           a - the lower limit of integration
%           b - the upper limit of integration
%           n - the number of trapezoidal panels to create to calculate the
%               integral
%
% Output:   s = TRAPEZOIDS(...)

% defines the default values of optional arguments
defaultStart = 0;
defaultEnd = 1;
defaultSteps = 25;

switch nargin
    case 1
        a = defaultStart;
        b = defaultEnd;
        n = defaultSteps;
    case 2 % sets value of a and b so TRAPEZOID(f, b) evaluates from 0 to b
        b = a;
        a = defaultStart;
        n = defaultSteps;
    case 3
        n = defaultSteps;
end



end

