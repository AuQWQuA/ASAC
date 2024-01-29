% NOIP2006-J T4
% input

int: k;
int: N;
% The input file consists of a single line containing two positive integers separated by a space: k N

% description

int: l = ceil(log(2, N));

array[1..l] of var int: idx;
var int: ans;

predicate int2bin(array[1..l] of var int: idx, var int: N, var int: pointer) =
if N = 0 then true else
idx[pointer] = N mod 2 /\ int2bin(idx, N div 2, pointer + 1)
endif;
% Construct an increasing sequence consisting of all powers of k and all finite, distinct powers of k.

constraint int2bin(idx, N, 1);

constraint ans = sum([pow(k, i - 1) | i in 1..l where idx[i] = 1]);
% Calculate the value of the Nth term of this sequence (represented in decimal).

%solve

solve satisfy;

%output

output[show(ans)];
% The output file contains the computed result, which is a positive integer (in all test data, the result does not exceed 2.1*10^9). (There should be no spaces or other symbols before the integer).
