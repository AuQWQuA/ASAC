%NOIP2004-S T2
%input

int: n;
array[1..n] of int: fruit;
% The input file consists of two lines. The first line is an integer n (1 <= n <= 10000), which represents the number of fruit types. The second line contains n integers, separated by spaces. The i-th integer ai (1 <= ai <= 20000) is the number of fruits of the i-th type.

%description

array[1..n,1..n] of var int: stat;
array[2..n,1..2] of var 1..n: merge;
var int: stamina;

constraint forall(i in 2..n)(merge[i,1] != merge[i,2] /\ stat[i-1,merge[i,1]] != 0 /\ stat[i-1,merge[i,2]] != 0);
constraint stat[1,1..n] = fruit;
constraint forall(i in 2..n)(stat[i,merge[i,1]] = stat[i-1,merge[i,1]] + stat[i-1,merge[i,2]] /\ stat[i,merge[i,2]] = 0 /\ forall(j in 1..n where j != merge[i,1] /\ j != merge[i,2])(stat[i,j] = stat[i-1,j]) );
% Each time we merge, Dodo can merge two piles of fruit together
constraint stamina = sum([ stat[i-1,merge[i,1]] + stat[i-1,merge[i,2]] | i in 2..n]);
% The stamina consumed is equal to the sum of the weights of the two piles of fruit.

%solve

solve minimize stamina;
% Your task is to design a merging order scheme that minimizes the stamina consumed, and output the minimum stamina consumption value.

%output

output[show(stamina)];
% The output file consists of one line, which contains only one integer, the minimum stamina consumption value. The input data guarantees that this value is less than 2^31.
