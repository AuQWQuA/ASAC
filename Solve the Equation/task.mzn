%NOIP2014-S D2T3
%input

int: n;
int: m;
array[1..n+1] of int: coefficient;

%description

array[1..m] of var bool: if_solution;
constraint forall(i in 1..m)(if_solution[i]=(sum([ coefficient[j+1]*pow(i,j) | j in 0..n])==0));
%求这个方程在[1, m]内的整数解
var int: solution_num=count(i in 1..m)(if_solution[i]);

%solve

solve satisfy;

%output

output[show(solution_num)++"\n"];
%第一行输出方程在[1, m]内的整数解的个数
output[if fix(if_solution[i]) then "\(i)\n" else "" endif| i in 1..m];
%接下来每行一个整数，按照从小到大的顺序依次输出方程在[1, m]内的一个整数解


