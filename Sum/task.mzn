%NOIP2015-J T3
%input

int: n;
int: m;
array[1..n] of int: color;
array[1..n] of int: number;

%description

var int: total;
var int: res;

constraint total == sum(i in 1..n) (sum(j in i+1..n) (sum(k in j+1..n) (if color[i] == color[k] /\ k-j==j-i then (i+k)*(number[i]+number[k]) else 0 endif)));
%满足上述条件的三元组的分数规定为(x + z) ∗ (𝑛𝑢𝑚𝑏𝑒𝑟𝑥 + 𝑛𝑢𝑚𝑏𝑒𝑟𝑧)。整个纸带的分数规定为所有满足条件的三元组的分数的和。
constraint 0 <= res /\ res <= 10006;
constraint (total - res) mod 10007 == 0;

%solve

solve satisfy;

%output

output["\(res)"];