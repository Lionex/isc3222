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

if (nargin < 5),  b  = 1.0; end % m
if (nargin < 4),  v  = 0.5; end % m/day
if (nargin < 3),  Dx = 0.5; end % m^2/day
if (nargin < 2),  Dy = 0.1; end % m^2/day
if (nargin == 0), m  = 1.0; end % kg

% Start the loop of time. Vecterization is needed for the calculation.
% Do not use loop for the cells in the x-y space.
tmax = 100/v;
tmin = tmax/50;
dt   = tmax/50;

[X,Y,T]=meshgrid(0:2.5:100,-50:2.5:50,tmin:dt:tmax);

% Initalize the concentration matrix.
conc = zeros(size(X,1),size(Y,2),size(tmax:dt:tmin,3));

conc = (m/b) / (4*pi*sqrt(Dx*Dy)) .* exp(-(X-v.*T).^2./(4*Dx.*T) - Y.^2./(4*Dy.*T));

set(gca,'nextplot','replacechildren');
for it = 1:size(T,2);
    contourf(X(:,:,it),Y(:,:,it),conc(:,:,it));
    xlabel(gca,'X (m)');
    ylabel(gca,'Y (m)');
    time_title=['Simulation time t= ',num2str(it),' day'];
    title(gca,time_title)
    set(gca,'Visible','on');
    M(it)=getframe(gca); 
end

end
