% NOIP2018-S D1T2
% input

int: T;
array[1..T] of int: n;
int: sum_n = sum(n);
array[1..sum_n] of int: a;

% description

array[1..T] of int: begin_n = [sum(j in 1..i-1)(n[j]) | i in 1..T];
array[1..T] of int: max_n = [sum(j in begin_n[i]+1..begin_n[i]+n[i])(a[j]) | i in 1..T];
int: bound = max(max_n);

array[1..sum_n] of var int: b;
constraint forall(i in 1..T)(forall(j in begin_n[i]+1..begin_n[i]+n[i])(b[j] >= 1 /\ b[j] <= max_n[i]));

array[1..T] of var set of 1..bound: express_a;
array[1..T] of var set of 1..bound: express_b;

constraint forall(i in 1..T)(express_a[i] subset 1..max_n[i] /\ express_b[i] subset 1..max_n[i]);

predicate express(int: t, array[int] of var int: x, var set of int: express_x) =
  forall(i in index_set(x))(x[i] in express_x) /\
  forall(i in express_x)(i in array2set(x) \/ exists(j in index_set(x))(i - x[j] in express_x)) /\
  forall(i in express_x)(forall(j in index_set(x))(if i + x[j] <= max_n[t] then i + x[j] in express_x endif));
% Two currency systems (n,a) and (m,b) are equivalent if and only if for any non-negative integer x, either both currency systems can represent it, or neither can.

constraint forall(i in 1..T)(express(i, a[begin_n[i]+1..begin_n[i]+n[i]], express_a[i]));
constraint forall(i in 1..T)(express(i, b[begin_n[i]+1..begin_n[i]+n[i]], express_b[i]));
constraint forall(i in 1..T)(express_a = express_b);
% They want to find a currency system (m,b) that is equivalent to the original currency system (n,a).
array[1..T] of var int: m;
constraint forall(i in 1..T)(m[i] = card(array2set(b[begin_n[i]+1..begin_n[i]+n[i]])));

%solve

solve minimize sum(m);
% And minimize m as much as possible.

%output

output[show(m)];
