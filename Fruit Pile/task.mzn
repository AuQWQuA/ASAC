%NOIP2004-S T2
%input

int: n;
array[1..n] of int: fruit;
%输入文件包括两行，第一行是一个整数 n(1<=n<=10000)，表示果子的种类数。第二行包 含 n 个整数，用空格分隔，第 i 个整数 ai(1<=ai<=20000)是第 i 种果子的数目。

%description

array[1..n,1..n] of var int: stat;
array[2..n,1..2] of var 1..n: merge;
var int: stamina;

constraint forall(i in 2..n)(merge[i,1]!=merge[i,2] /\ stat[i-1,merge[i,1]]!=0 /\ stat[i-1,merge[i,2]]!=0);
constraint stat[1,1..n]=fruit;
constraint forall(i in 2..n)(stat[i,merge[i,1]]=stat[i-1,merge[i,1]]+stat[i-1,merge[i,2]] /\ stat[i,merge[i,2]]=0 /\ forall(j in 1..n where j!=merge[i,1] /\ j!=merge[i,2])(stat[i,j]=stat[i-1,j]) );
%每一次合并，多多可以把两堆果子合并到一起
constraint stamina=sum([ stat[i-1,merge[i,1]]+stat[i-1,merge[i,2]] | i in 2..n]);
%消耗的体力等于两堆果子的重量之和。

%solve

solve minimize stamina;
%你的任务是设计出合并的次序方案，使多多耗费的体力最少，并输出这个最小的体力耗费值。 

%output

output[show(stamina)];
%输出文件包括一行，这一行只包含一个整数，也就是最小的体力耗费值。输入数据保证这 个值小于 231。


