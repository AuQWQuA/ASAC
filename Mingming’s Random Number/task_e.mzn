% NOIP2006-J T1
%input

int: n;
array[1..n] of int: random;
% The input file consists of 2 lines. The first line contains 1 positive integer, representing the number of generated random numbers: N. The second line contains N positive integers separated by spaces, representing the generated random numbers.

%description

var set of 1..1000: random_set;
var 1..n: num;
% First, he generated N random integers between 1 and 1000 using a computer (N ≤ 100).

constraint random_set = array2set(random);
% Remove duplicates and keep only one occurrence of each number.

constraint num = card(random_set);
array[0..n] of var int: out;
constraint forall(i in 1..num)(out[i] in random_set);
constraint forall(i in 1..num-1)(out[i] < out[i+1]);
% Then, he sorts these numbers in ascending order and conducts surveys with classmates in the sorted order.

%solve

solve satisfy;

%output

output[show(num) ++ "\n"];
% The first line contains 1 positive integer M, representing the number of distinct random numbers.
output["\(out[i]) " | i in 1..fix(num)];
% The second line contains M positive integers separated by spaces, representing the distinct random numbers sorted in ascending order.
