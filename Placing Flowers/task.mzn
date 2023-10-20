%NOIP2012-J T3
%input

int: n;
int: m;
array[1..n] of int: A;

%description

array[1..n] of var 0..m: B;

constraint forall(i in 1..n)(
  B[i] <= A[i]
);

constraint sum(i in 1..n)(B[i]) = m;

%solve

solve satisfy;

%output
