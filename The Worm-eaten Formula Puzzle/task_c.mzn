%NOIP2004-S T4
include "alldifferent.mzn";

%input

int: N;
array[1..3,1..N] of string: add;
%输入文件包含 4 行。第一行有一个正整数 N(N<=26)，后面的 3 行每行有一个由大写字母组 成的字符串，分别代表两个加数以及和。这 3 个字符串左右两端都没有空格，从高位到低 位，并且恰好有 N 位。

%description
array[1..26] of string: alphabet=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];


array[1..N] of var 0..N-1: result;

constraint alldifferent(result);

array[1..3,1..N] of var 1..N: add_num;
constraint forall(i in 1..3,j in 1..N)(add_num[i,j]=min([l | l in 1..N where alphabet[l]=add[i,j]]));
%如果这个算式是 N 进制的，我们就取英文 字母表午的前 N 个大写字母来表示这个算式中的 0 到 N-1 这 N 个不同的数字。

predicate calculate(array[1..3,1..N] of var int: cal,var int:i,var int:flag)=
i=0 \/ ((cal[1,i]+cal[2,i]+flag) mod N=cal[3,i] /\ calculate(cal,i-1,(cal[1,i]+cal[2,i]+flag) div N));
%这里的加法是 n 进制加法，算式中三个数都有 n 位，允许有前导的0。

constraint let{
array[1..3,1..N] of var int: tmp;
constraint forall(i in 1..3,j in 1..N)(tmp[i,j]=result[add_num[i,j]]);
}in calculate(tmp,N,0);
%:但是这 N 个 字母并不一定顺序地代表 0 到 N-1

%solve

solve satisfy;

%output

output[show(result[1..N])];
%输出文件包含一行。在这一行中，应当包含唯一的那组解。解是这样表示的:输出 N 个数 字，分别表示 A，B，C......所代表的数字，相邻的两个数字用一个空格隔开，不能有多余 的空格。