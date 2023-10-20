%NOIP2006-J T4
%input

int: k;
int: N;
%输入文件只有 1 行，为 2 个正整数，用一个空格隔开: k N

%description

int: l=ceil(log(2,N));

array[1..l] of var int: idx;
var int: ans;

predicate int2bin(array[1..l] of var int: idx, var int: N,var int: pointer)=
if N=0 then true else
idx[pointer]=N mod 2 /\ int2bin(idx,N div 2, pointer+1)
endif;
%把所有k的方幂及所有有限个互不相等的k的方幂之和构成一个递增的序列

constraint int2bin(idx,N,1);

constraint ans=sum([ pow(k,i-1) | i in 1..l where idx[i]=1]);
%请你求出这个序列的第N项的值（用10进制数表示）。

%solve

solve satisfy;

%output

output[show(ans)];
%输出文件为计算结果，是一个正整数(在所有的测试数据中，结果均不超过 2.1*109)。(整数前不要有空格和其他符号)。