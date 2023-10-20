%NOIP2007-S T3
%input

int: n;
int: m;
array[1..n,1..m] of int: number;

%description

enum choice={head,tail};
%每次取走的各个元素只能是该元素所在行的行首或行尾；
array[1..n,1..m] of var choice: take_number;
%每次取数时须从每行各取走一个元素，共 n 个。m 次后取完矩阵所有元素；

function var int: cal_score(array[1..m] of var int: row, array[1..m] of var choice: actions) =
sum(i in 1..m)(pow(2,i) * (if actions[i]==head then row[count(j in 1..i)(actions[j]=head)] else row[m+1-count(j in 1..i)(actions[j]=tail)] endif));
%每次取数都有一个得分值，为每行取数的得分之和，每行取数的得分 = 被取走的元素值*2i，其中 i 表示第 i 次取数（从 1 开始编号）；

var int: total_score;
constraint total_score=sum(i in 1..n)(cal_score(number[i,1..m],take_number[i,1..m]));
%游戏结束总得分为 m 次取数得分之和

%solve

solve maximize total_score;
%帅帅想请你帮忙写一个程序，对于任意矩阵，可以求出取数后的最大得分

%output

output[show(total_score)];
