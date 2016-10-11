function [conc,M] = G_puff (m,Dx,Dy,v,b)
%G_PUFF: Gaussian puff for solving advection-dispersion equations 
% Synopsis: [c,M] = G_puff (m,Dx,Dy,v,b) 
% 
% Input: m  = mass [kg] 
%        Dx = dispersion coeffient in X direction [m^2/day] 
%        Dy = dispersion coeffient in Y direction [m^2/day] 
%        v  = flow velocity [m/day] 
%        b  = aquifier thickness [m] 
% 
% Output: conc = concentration of the containimant [kg/m^3] 
%         M    = movie of concentration contours 

% Default input values
if (nargin == 0)
%
% If a user of the code does not provide any input, what will you do?
%
%
end

% Discretization of the domain. You need to understand what meshgrid does
% We had an exercise of meshgrid in the hotkey practice of the last lab.
[X,Y] = meshgrid(0:2.5:100,-50:2.5:50);

% Discretization in time. You decide what to do!
%

% Initalize the concentration matrix.
conc = ......

% Start the loop of time. Vecterization is needed for the calculation.
% Do not use loop for the cells in the x-y space.
for t = ......
    conc=......
    
    % Plot contours
    contourf(X,Y,conc(:,:,it))
    
    % More lines are needed to finish the assignment
    %
    %
end