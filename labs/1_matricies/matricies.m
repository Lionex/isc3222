%% Hotkey List
% Annotates a series of statements with descriptive text.
%%
% Compares the results of calculations under different precision.
a = 10;
sin(a)
format long;
sin(a)

%%
% Defines 3 vectors; |a| is a row vector, but |b| and |c| show two different
% methods for creating column vectors.
a = [1 2 3]
b = [1;2;3]
c = [1 2 3]'

%%
% Creates a matrix equivalent to |reshape(1:9,3,3)'|
% creates a 3x3 matrix containing values |1:9|, incremented by row then
% column.
A = [1 2 3;4 5 6;7 8 9]

%% 
% Displays built in functions for creating matricies
% |eye()| creates an identity matrix, |rand()| creates a matrix of given
% dimensions, with random elements between zero and 1, |zeroes()| creates
% a matrix of zeroes with the given dimensions.
A = eye(4)
B = rand(6,2)
C = zeros(2,5)

%%
% Displays different ways to create ranges.
% Line 1: standard colon notation, creates an inclusive range with steps of
% one between the first and last numbers of the range.
% Line 2: creates a range as in Line 1, but specifies a step of 0.5.
% Line 3: creates a range that inludes the start and end with the number
% of elements specified as the third argument.
a = 1:10
b = 1.0:0.5:10
c = linspace(1,10,3)

%%
% This block creates two 3x3 matricies, A which is all ones, and B which is
% all twos.  Then it calculates the matrix product of |A| and |B| and names it 
% |C|.  Finally it takes the inverse of matrix |A|, which produces a matrix of
% infinities, which are then multiplied by |B|, which results in a matrix of
% infinities called |D|.
A = ones(3,3)
B = 2*ones(3,3)
C = A*B
D = inv(A)*B

%%
% This block compares the matrix and component-wise products; the matrix
% product works if the first matrix has the same number of columns as the
% second matrix has rows.
% However, for component wise multiplication, the indicies are paired; thus
% the matricies must have the same dimensions.
A = ones(3,3);
B = [1 2;3 4;5 6];
A*B
A.*B

%%
% This block demonstrates assignment and access in matrix.
% |B| contains the scalar value from the second row and third column of A
% C contains the sub-matrix of A in the first and second rows, and the
% first through third columns.
% D attempts to assign a value outside of A's range, and the last line
% attempts to assign a value to an index outside of A's range.
A = [1 2 3;4 5 6;7 8 9]
B = A(2,3)
C = A(1:2,1:3)
D = A(5,5)
A(5,5) = pi

%%
% This block demonstrates the difference between matrix exponentiation and
% component-wise exponentiation.  Matrix exponentiation performs the matrix
% product of a matrix against itself n times, and the component-wise
% exponentiation operator raises each element of the matrix to the nth
% power.
A = 2*ones(4)
A^2
A.^2

%%
% This block demonstrates how sum handles vectors and matricies; if given a
% vector, sum simply calculates the sum of the elements.  However, if given
% a matrix it calculates the sum across the specified dimension (in this
% case by columns, then by rows)
A = [1 2 3;4 5 6;7 8 9]
a = [1 2 3]
sum(A,1)
sum(A,2)
sum(a)

%% Debug the following sections
%
%%
x = 1:40;
y = x.^2;
plot(x,y)

%%
x = 1:40;
y1 = x.^2;
y2 = x.^3;
plot(x,y1,x,y2);

%%
x = 1:40;
y1 = x.^2;
y2 = x.^3;
% |plot(x,y1,'r--')|
% |plot(x,y2,'b')| create two different figures.
% solution:
plot(x,y1,'r--', x,y2,'b')

%%
x = 1:40;
y1 = x.^2;
y2 = x.^3;
plot(x,y1,'r-')
hold on
plot(x,y2,'b:')
%%
x = 1:40;
y = x.^2;
% |plot(x,y,'r-')| These two lines are redundant
% |plot(x,y,'ro')| Just the last plot will suffice.
plot(x,y,'ro-', 'MarkerSize', 15)
%%
x = 0:.1:1;
y = 0:.25:1;
[X,Y] = meshgrid(x,y);
Z = sin(pi*X) .* sin(pi*Y);
% mesh and surface override each-other.
surf(X,Y,Z)
mesh(X,Y,Z)