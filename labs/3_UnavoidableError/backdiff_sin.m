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
fp = cos(x);                   % Exact value of fprime
h = logspace(-12,0,13)';       % Column vector of stepsizes
fpfd = (sin(x) - sin(x-h))./h; % Vectorized calculation of fd approximation
Eabs = abs(fp - fpfd);         % Absolute error
Erel = Eabs./fp;               % Relative error

% Plot the error vs stepsize
loglog(h,Erel,'+');  xlabel('Stepsize,  h');    ylabel('Relative error');

% Calculate alpha
alpha=zeros(length(h),1);
for k=length(h):-1:2
    alpha(k) = log(Eabs(k)/Eabs(k-1))/log(h(k)/h(k-1));
end

% Print results
fprintf('      h        fp       fpfd         Erel         Eabs         Alpha\n');
for k=length(h):-1:2
  fprintf('%10.1e %9.5f %9.5f %12.2e %12.2e %12.5f\n',h(k),fp,fpfd(k),Erel(k),Eabs(k),alpha(k));
end
fprintf('%10.1e %9.5f %9.5f %12.2e %12.2e\n',h(k-1),fp,fpfd(k-1),Erel(k-1),Eabs(k-1));

TruncErr = sin(x).*h/2.0;
RoundErr = abs(fpfd-fp-TruncErr);

%output for roundoff error
fprintf('\nTable for examining truncation and roundoff errors\n');
fprintf('      h        TruncErr     RoundErr\n');
for k=length(h):-1:1
  fprintf('%10.1e %12.2e %12.2e\n',h(k),TruncErr(k),RoundErr(k));
end

