% NOIP2016-S D1T3
% intput

int: n;
int: m;
int: v;
int: e;
array[1..n] of int: C;
array[1..n] of int: D;
array[1..n] of float: K;

array[1..e] of 1..v: A;
array[1..e] of 1..v: B;
array[1..e] of int: W;

%description

set of int: Edges = 1..e*2;

array[Edges] of 1..v: Start = A ++ B;
array[Edges] of 1..v: End = B ++ A;
array[Edges] of int: Length = W ++ W;


function var int: path(var int: S, var int: T) = 
    let 
    {
        array[Edges] of var 0..1: x;
        constraint S==T \/ 
        forall( i in 1..v ) (
            if i == S then
                sum(e in Edges where Start[e] == i)(x[e]) - 
                sum(e in Edges where End[e] == i)(x[e])
                = 1
            elseif i == T then
                sum(e in Edges where Start[e] == i)(x[e]) - 
                sum(e in Edges where End[e] == i)(x[e])
                = -1
            else
                sum(e in Edges where Start[e] == i)(x[e]) - 
                sum(e in Edges where End[e] == i)(x[e])
                = 0
            endif
        );
    } in sum(e in Edges)( Length[e] * x[e] );

var set of 1..n: Change;

constraint card(Change)<=m;


var float: obj= sum(i in 1..n-1)
(
    let
    {
        var int: pcc=path(C[i],C[i+1]);
        var int: pdc=path(D[i],C[i+1]);
        var int: pcd=path(C[i],D[i+1]);
        var int: pdd=path(D[i],D[i+1]);
    } in
    (
        if (i in Change) /\ (i+1 in Change) then
            pcc*(1-K[i])*(1-K[i+1])+pdc*K[i]*(1-K[i+1])+pcd*K[i+1]*(1-K[i])+pdd*K[i]*K[i+1]
        elseif not(i in Change) /\ (i+1 in Change) then
            pcc*(1-K[i+1])+pcd*K[i+1]
        elseif (i in Change) /\ not (i+1 in Change) then
            pcc*(1-K[i])+pdc*K[i]
        else 
            pcc
    endif
)
);

%solve

solve minimize obj;

%output

output[show_float(0,2,obj)++"\n"];
