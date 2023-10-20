%NOIP2009-J T1
%input

int:n;
array[1..n+1] of int:coefficient;

%description

output[if(coefficient[i]<0) then "-" else (if(coefficient[i]==0 \/ i==1) then "" else "+" endif) endif
%如果多项式 n 次项系数为正，则多项式开头不出现“+”号，如果多项式 n 次项系数为负，则多项式以“-”号开头
 ++ if(abs(coefficient[i])==1 \/ coefficient[i]==0 ) then "" else show(abs(coefficient[i])) endif 
%对于不是最高次的项，以“+”号或者“-”号连接此项与前一项，分别表示此项系数为正或者系数为负。
 ++ if(coefficient[i]==0) then "" else ("x" ++ if(n-i+1==1) then "" else "^"++ show(n-i+1) endif) endif
%紧跟一个正整数，表示此项系数的绝对值（如果一个高于 0 次的项，其系数的绝对值为 1，则无需输出 1）。
|i in 1..n];

%solve

solve satisfy;

%output

output[if(coefficient[n+1]==0) then "" else (if(coefficient[n+1]>0) then "+" else "-" endif) ++ show(abs(coefficient[n+1])) endif];
%如果 x 的指数为 0，则仅需输出系数即可。