%NOIP2011-J T3
%input

include "alldifferent.mzn";

int: N;
int: R;
int: Q;
array[1..N*2] of int: s;
array[1..N*2] of int: w;

%description

array[0..R,1..N*2] of var int: score;  
array[0..R,1..N*2] of var 1..N*2: p; % the rank of all 2N teams from 0 to R round 

predicate before(int: r,var int: id1,var int: id2) =
    (score[r,id1]>score[r,id2]) \/ (score[r,id1]=score[r,id2] /\ id1<id2);

constraint forall(i in 1..N*2)(score[0,i]=s[i]);
constraint forall(i in 0..R) (alldifferent([ p[i,j] | j in 1..N*2]));
constraint forall(i in 1..R,j in 1..N)(
    let 
    {
        var int: a=p[i-1,2*j-1];
        var int: b=p[i-1,2*j];
    } in
    (
        if w[a]>w[b] then
            score[i,a]=score[i-1,a]+1 /\ score[i,b]=score[i-1,b]
        else
            score[i,a]=score[i-1,a] /\ score[i,b]=score[i-1,b]+1
        endif
    )
);
constraint forall(i in 0..R,j in 1..N*2-1)(before(i,p[i,j],p[i,j+1]));

%solve

solve satisfy;

%output

output[show(p[R,Q])];
