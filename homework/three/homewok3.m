%% Homework 3: Unavoidable errors
% Gwen Lofman                   
% ISC3222                        
% 20 Oct 2016                    

%% Problem 1: Roundoff error (20 points)
% Perform Guassian elimination on
% 
% |x1 +       x2 +  x3 = 1;|
% |x1 + 1.0001x2 + 2x3 = 2;|
% |x1 +      2x2 + 2x3 = 1;|
% without pivoting. Use three-figure floating point arithmetic during 
% backward substitution. This means that we can keep all the digits during 
% the calculation, but keep only three digits after the decimal point in 
% the last step of backward substitution. 

% Now conduct pivoting by interchanging equations 2 and 3. 

%What conclusion can you draw from this exercise?

%% Problem 2: Relative convergence criteria (15 points)
% The absolute and relative convergence criteria in Equation (5.12) and in
% Equation 
