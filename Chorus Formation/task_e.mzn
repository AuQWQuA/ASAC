% NOIP2004-S T3
% input

int: N;
array[1..N] of int: T;
% The first line of the input file is an integer N (2<=N<=100), representing the total number of students. The second line contains n integers separated by spaces, where the ith integer Ti (130<=Ti<=230) is the height (in centimeters) of the ith student.

% description

array[1..N] of var bool: Select;
var int: discard_num = sum(Select);
% The music teacher wants to ask (N-K) students to step out in order to form a choir with the remaining K students.

constraint exists(i in 1..N where Select[i] == false)(
  forall(j in 1..N, k in 1..N)(
    (j >= k) \/ Select[j] \/ Select[k] \/ (((k > i) \/ (T[j] < T[k])) /\ ((j < i) \/ (T[j] > T[k])))
  )
);
% Choir formation means that for K students numbered from left to right as 1, 2, ..., K, with heights T1, T2, ..., TK respectively, their heights satisfy T1<...<Ti>Ti+1>…>TK (1<=i<=K).

%solve

solve minimize discard_num;

%output

output ["\(discard_num)"];
% The output file consists of a single line containing an integer, which represents the minimum number of students needed to step out.
