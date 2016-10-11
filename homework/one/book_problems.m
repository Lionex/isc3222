%% Homework 1
% Gwen Zapata
% 15 September 2016
%% Problem 2
% Given the matrix
C = [11 5;2 1;18 7];
% Write the two statements to create s = (11, 2, 18)T and 
% t = (11, 5, 2, 1, 18, 7) by extracting the rows and columns of C.
s = C(1:3)'
t = reshape(C', 1, 6)

%% Problem 3 (Q16 of the textbook): MATLAB built-in functions to create matrix (10 points)
% Write a one-line expression to create the following matrix
% |[ 1  0  0  0  1   |
% | -1  1  0  0  1   |
% | -1 -1  1  0  1   |
% | -1 -1 -1  1  1   |
% | -1 -1 -1 -1  1 ] |
% Hint: one solution uses matrix addition and the built-in tril, ones, eye,
% and zeros commands.
% solution:
x = eye(5,6) - tril(ones(5,6),-1)
x(:,6) = ones(5,1)

%% Problem 4: MATLAB Vectorization (12 points)
B = ones(3,3); x = 21:24;
% solution:
B(2:3,1:2) = reshape(x, 2, 2)

%% Problem 5 (Q31 of the textbook): MATLAB plotting (10 points)
% Given the sequence of MATLAB statements below, what additional statements are
% necessary to create the exact plot shown below? Do not create any additional data. Do not
% worry about the fonts or font sizes in the legend or on the axes. Do not use the interactive
% plot-editing tools in MATLAB version 5.3 or later.
x = [2 3 4 5 6 7];
y = [7 6 6 3 2 3];
z = 5*sin(x);
% solution:
plot(x,y,'bo-', x,z,'gs')
legend('data','5*sine'); xlabel('x'); ylabel('y');
axis([1 8 1 8])
grid on;
