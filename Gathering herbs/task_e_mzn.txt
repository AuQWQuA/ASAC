% NOIP2005-J T3
% input

int: T;
int: M;
array[1..M, 1..2] of int: herb;
% The input file's first line contains two integers: T (1 <= T <= 1000) and M (1 <= M <= 100), separated by a space. T represents the total time available for herb picking, and M represents the number of herbs in the cave. The following M lines each contain two integers between 1 and 100 (inclusive), representing the time required to pick a particular herb and the value of that herb.

%description

array[1..M] of var 0..1: index;
var int: total;
var int: cost;

total = sum([herb[j, 2] * index[j] | j in 1..M ]);
% Each herb has its own value
cost = sum([herb[j, 1] * index[j] | j in 1..M ]);
% Picking each herb requires some time

constraint cost <= T;
% Within this time, you can pick some herbs.

%solve

solve maximize total;
% If you're a smart kid, you should be able to maximize the total value of herbs you can pick.

%output

output[show(total)];
% The output file consists of one line, which contains only one integer, representing the maximum total value of herbs that can be picked within the specified time.
