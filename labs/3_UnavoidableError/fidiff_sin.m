function  backdiff_sin(x)
% BACKDIFF_SIN First order backward difference approximation of d/dx of sin(x)
%
% Synopsis:  BACKDIF_SIN(x)
%
% Input:     x = (optional) value at which the derivative is to be evaluated
%                Default:  x = 1
%
% Output:    A table and plot of relative error versus stepsize

% Default argument
if nargin<1, x=1; end

% Calculations
fp   = cos(x);                 % Exact value of fprime
h    = 1./(2.^(1:1:13))';      % Column vector of stepsizes
fpbd = (sin(x) - sin(x-h))./h; % Vectorized calculation of backwards
                               % difference approximation
Eabs = abs(fp - fpbd);         % Absolute error
Erel = Eabs./fp;               % Relative error

% Plot the error vs stepsize
plot(h,Erel,'+');  xlabel('Stepsize,  h');    ylabel('Relative error');

% Calculate alpha
alpha = zeros(length(h),1);
for k = length(h):-1:2
    alpha(k) = log(Eabs(k)/Eabs(k-1))/log(h(k)/h(k-1));
end

% Print results
fprintf('      h        fp       fpfd         Erel         Eabs         Alpha\n');
for k=length(h):-1:2
  fprintf('%10.1e %9.5f %9.5f %12.2e %12.2e %12.5f\n',h(k),fp,fpbd(k),Erel(k),Eabs(k),alpha(k));
end
fprintf('%10.1e %9.5f %9.5f %12.2e %12.2e\n',h(k-1),fp,fpbd(k-1),Erel(k-1),Eabs(k-1));

TruncErr = cos(x).*h;
RoundErr = abs(fpbd-fp-TruncErr);

%output for roundoff error
fprintf('\nTable for examining truncation and roundoff errors\n');
fprintf('      h        TruncErr     RoundErr\n');
for k=length(h):-1:1
  fprintf('%10.1e %12.2e %12.2e\n',h(k),TruncErr(k),RoundErr(k));
end

