%NOIP2007-J T1
%input

include "alldifferent.mzn";
int: n;
array[1..n,1..3] of int:grades;
%第 1 行为一个正整数 n，表示该校参加评选的学生人数。
%第 2 到 n+1 行，每行有 3 个用空格隔开的数字，每个数字都在 0 到 100 之间。第 j 行的3 个数字依次表示学号为 j-1 的学生的语文、数学、英语的成绩。每个学生的学号按照输入 顺序编号为 1~n(恰好是输入数据的行号减 1)。

%description

array[1..n] of var 1..n: rank;

predicate prec(array[1..n] of var 1..n: rank,int:i, int:j)=
grades[rank[i],1]+grades[rank[i],2]+grades[rank[i],3] > grades[rank[j],1]+grades[rank[j],2]+grades[rank[j],3]
%先按总分从高到低排序
\/ (grades[rank[i],1]+grades[rank[i],2]+grades[rank[i],3] = grades[rank[j],1]+grades[rank[j],2]+grades[rank[j],3] /\ grades[rank[i],1]>grades[rank[j],1])
%如果两个同学总分相同，再按语文成绩从高到低排序
\/ (grades[rank[i],1]+grades[rank[i],2]+grades[rank[i],3] = grades[rank[j],1]+grades[rank[j],2]+grades[rank[j],3] /\ grades[rank[i],1]=grades[rank[j],1] /\ rank[i]<rank[j]);
%如果两个同学总分和语文成绩都相同，那么规定学号小的同学排在前面

constraint alldifferent(rank);
constraint forall(i in 1..n-1)(rank[i]<rank[i+1]);
constraint forall(i,j in 1..n where i<j)(prec(rank,i,j));

%solve

solve satisfy;

%output

output["\(rank[i]) \(grades[rank[i],1]+grades[rank[i],2]+grades[rank[i],3])\n" | i in 1..5];
%每行是两个用空格隔开的正整数, 依次表示前5名学生的学号和总分。