%NOIP2005-J T4
%input

int: n;
int: k;
%输入文件只有一行，包含两个整数 n(1 <= n < 10100)和 k(1 <= k <= 100)，n 和 k 之 间用一个空格隔开，表示要求 n 的正整数次幂的最后 k 位的循环长度。

%description

int: len=pow(10,k);
array[1..len] of var int: suffix;

constraint forall(i in 1..len)(suffix[i]=pow(n,i) mod pow(10,k));

%solve

solve satisfy;

var set of int: out_set={i | i in 2..len where suffix[i]=suffix[1]};
%如果循环长度是 L，那么说明对于任意的正整数 a，n 的 a 次幂和 a + L 次幂的最后k 位都相同。

%output

output[if(fix(suffix[1]) in array2set(fix(suffix[2..len])))then "\(min(fix(out_set))-1)" else "-1" endif];
%这一行只包含一个整数，表示循环长度。如果循环不存在，输出-1
