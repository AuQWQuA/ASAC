%NOIP2016-S D2T2
%input

include "all_different.mzn";
1..100000: N;
0..7000000: M;
0..200: Q;
int: u;
int: v;
int: t;
array[1..N] of int: A;

%description

array[0..M,1..(N+M)] of var 0..(max(A)+M*Q): S;
array[0..(M-1)] of var 1..N+M: pos;

array[1..(N+M)] of var 0..(max(A)+M*Q): sortS;
array[1..M div t] of var 0..(max(A)+M*Q):ans1;
array[1..(N+M) div t] of var 0..(max(A)+M*Q):ans2;



predicate ok(int: m)= 
    let{
        var int: val = max(S[m,1..(N+m)]); 
        var int: val0 = val*u div v;
        var int: val1 = val-val0;
        constraint S[m,pos[m]]=val;
    } in (S[m+1,pos[m]]=val0) /\ (S[m+1,N+m+1]=val1) /\ (forall(i in 1..N+m where i!=pos[m])(S[m+1,i]=S[m,i]+Q)); 

constraint forall(i in 1..N)(S[0,i]=A[i]);
constraint forall(m in 0..M-1)(ok(m));

constraint forall(i in 1..M div t)(ans1[i]=S[i*t-1,pos[i*t-1]]); 


array[1..N+M] of var 1..N+M: index_S;
constraint alldifferent(index_S);
constraint forall(i in 1..N+M-1)(S[M,index_S[i+1]]<=S[M,index_S[i]]);

%solve

solve satisfy;

%output

output[show(ans1) ++ "\n"];
output[show(fix(S[M,index_S[i]])) ++ " "  |i in 1..M+N];