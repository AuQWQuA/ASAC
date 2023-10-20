% NOIP2017-J T4 jump

% 没找到怎么输出无解……

int: n;
int: d;
int: k;
array[1..n] of int: X;
array[1..n] of int: S;

var 0..1000000000: g;

var set of 1..n:A; 

var int :fst=min(A);

constraint (X[fst]>=d-g)/\(X[fst]<=d+g);
constraint forall(i,j in A where i<j)(
    if (forall(l in (i+1)..(j-1))(not (l in A))) then ((X[j]-X[i]>=d-g) /\ (X[j]-X[i]<=d+g))
    else true
    endif
);

constraint sum(i in A)(S[i])>=k;

solve minimize g;


