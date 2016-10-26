%% Unavoidable Error
% Summary of example objective

%% Roundoff Error
% *Perform Gaussian elimination on*
A = [ 1 1      1
      1 1.0001 1
      1 2      2 ];
b = [ 1
      2
      1 ];
% *without pivoting. Use three-figure floating point arithmetic during
% backward substitution. This means that we can keep all the digits during
% the calculation, but keep only three digits after the decimal point in 
% the last step of backward substitution.*

A1 = [A,b];

n = size(A1,1);

for i = 1:n-1
    A1(i,:) = A1(i,:)./A1(i,i);
    A1(i,:) = A1(i,:).*A1(i+1,i);
    for j=i:1
        A1(i+1,:)=A1(i+1,:)-A1(j,:);
    end
end

A1
A1(3,:) = A1(3,:)-A1(2,:)-A1(1,:)

A1_ = A1(:,1:3)

% Now conduct  pivoting by interchanging equations 2 and 3. 

A2 = [A,b];

a2 = A2(2,:);
a3 = A2(3,:);
A2(2,:) = a3;
A2(3,:) = a2;

A2(1,:) = A2(1,:)./A2(1,1);
A2(1,:) = A2(1,:).*A2(2,1);
A2(2,:) = A2(2,:)- A2(1,:);

A2(2,:) = A2(2,:)./A2(2,2);
A2(2,:) = A2(2,:).*A2(3,1);
A2(3,:) = A2(3,:)- A2(1,:);

% *What conclusion can you draw from this exercise?*

% Moving the elements has a great effect on the answer of the exercise

%% Relaive Convergance Criteria
% The absolute and relative convergence criteria in Equation (5.12) of the 
% textbook are written one way, but example 5.6 has

%|while abs(r-rold)/rold>delta & it<maxit|

% Is this an error? Should the while statement have a < sign instead of 
% a > sign? Why?

% This is not an error; the convergence criteria determines whether a
% calculation has converged, and thus must return true when convergence
% happens.  However, in the while statement, the expression must return
% true as long as we want the computation to keep on happening; thus, the
% while statement shows the desired behavior, as once the convergence
% criteira is met, it will return false, telling the while loop to
% terminate.  
%
% Rewriting the statement as |while ~(abs(r-rold)/rold<delta) && it<maxit|
% may make this desired behavior more clear to the user.