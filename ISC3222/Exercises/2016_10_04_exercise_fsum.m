function s = fsum(fun, a, b, n)
% FSUM calcualtes 

x = linspace(a,b,n);
y = feval(fun,x);
s = sum(y);

function s = tancos(x)
% TANCOS calculates the componentwise tangent times cosine
%
% Synposis: 
% 
% Output:  

s = @(x) tan(x) .* cos(x);

function s = tancossum(x, a,b,n)

s = fsum('tancos', a,b,n);