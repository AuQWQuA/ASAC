%NOIP2018-S D1T2
%input

int: T;
array[1..T] of int: n;
int: sum_n=sum(n);
array[1..sum_n] of int: a;

%description

array[1..T] of int: begin_n=[sum(j in 1..i-1)(n[j])| i in 1..T];
array[1..T] of int: max_n=[sum(j in begin_n[i]+1..begin_n[i]+n[i])(a[j]) | i in 1..T];
int: bound=max(max_n);

array[1..sum_n] of var int: b;
constraint forall(i in 1..T)(forall(j in begin_n[i]+1..begin_n[i]+n[i])(b[j]>=1 /\ b[j]<=max_n[i]));


array[1..T] of var set of 1..bound: express_a;
array[1..T] of var set of 1..bound: express_b;

constraint forall(i in 1..T)(express_a[i] subset 1..max_n[i]  /\ express_b[i] subset 1..max_n[i]);

predicate express(int: t,array[int] of var int: x,var set of int: express_x) =
forall(i in index_set(x))(x[i] in express_x) /\
forall(i in express_x)(i in array2set(x) \/ exists(j in index_set(x))(i-x[j] in express_x)) /\ 
forall(i in express_x)(forall(j in index_set(x))(if i+x[j]<=max_n[t] then i+x[j] in express_x endif));
%两个货币系统 (n,a) 和 (m,b) 是等价的，当且仅当对于任意非负整数 x，它要么均可以被两个货币系统表出，要么不能被其中任何一个表出。

constraint forall(i in 1..T)(express(i,a[begin_n[i]+1..begin_n[i]+n[i]],express_a[i]));
constraint forall(i in 1..T)(express(i,b[begin_n[i]+1..begin_n[i]+n[i]],express_b[i]));
constraint forall(i in 1..T)(express_a=express_b);
%他们希望找到一个货币系统 (m,b)，满足(m,b) 与原来的货币系统 (n,a) 等价
array[1..T] of var int: m;
constraint forall(i in 1..T)(m[i]=card(array2set(b[begin_n[i]+1..begin_n[i]+n[i]])));

%solve

solve minimize sum(m);
%且 m 尽可能的小

%output

output[show(m)];

