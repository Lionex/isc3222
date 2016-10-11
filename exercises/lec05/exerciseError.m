%% Error
% Truncation and rounding errors can never be avoided on a computer.
% Computers can only hold a finite number of numbers, and thus they have an
% infinite number of numbers that they cannot store.
%
% Roundoff occurs in a computer calculation whenever digits to the right of
% decimal point arre discarded.
%
% Truncation error occrus whenver a numerbical compation uses formulas
% involve discrte values as an apprximate of a continuous function.
%% Bits, Bytes, and Words
% IEEE established a standard so that 8 bits make up a byte.
% base 10 | conversion | base 2
% 1       | 1=2^0      | 0000 0001
% 2       | 2=2^1      | 0000 0010
% 4       | 4=2^2      | 0000 0100
% 8       | 8=2^3      | 0000 1000
% 16      | 16=2^4     | 0001 0000
%% Integers
% Integers will never have rounding errors, they can have exact
% representations in computer memory.
%
% What is the largest 16-bit integer?
% 2^15 + 1
%
% This is because 2^0 also takes a bit, meaning the largest number is
% always equal to 2^(n-1) + 1 where n = number of bits.
%% Exercise: Store an integer
% Express 25 as a binary number.
twentyFive = '0001 1001'
dec2bin(25)
%% Floating Point
% Previously, the point could float anywhere, but now we normalize it with
% a normalized scientific notation.
%
% 0.42585987 10^3 = 425.85987
%   ^mantissa   ^exponent
% This is the IEEE standard on floating point numbers; this means we only
% need to store the mantissa and the exponent!
%
% 1-bit for the sign, 52 bits for the mantissa, 11 bits for the exponent.
%
% Finite number of bits in the exponent limits the range
%
% Finite number of bits in the mantissa limits the precision
% So why then is the realmax's exponent only 308?
realmax
10^(2^10 - 1) % The largest signed 11 bit number as an exponent of 10
% However, computers do not store in base 10!
% The multiplier is calculated as 
2^(2^10 - 1)
% with the largest exponent
2^10 - 1
% This has nearly the correct exponent, but remember, the mantissa must
% also be included.
%% Real Numbers n < 1
