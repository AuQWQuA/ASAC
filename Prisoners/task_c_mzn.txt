%NOIP2010-S T3
%input

int: N;
int: M;
array[1..M,1..3] of int: conflict;

%description

set of int: full_set=1..N;
var set of full_set:prison1;
var set of full_set:prison2;

constraint prison1 union prison2=full_set;
constraint card(prison1 intersect prison2)=0;

var int: value1;
var int: value2;
constraint value1=if card(prison1)<2 then 0 else 
max([conflict[i,3] | i in 1..M where conflict[i,1] in prison1 /\ conflict[i,2] in prison1 ]) endif;
constraint value2=if card(prison2)<2 then 0 else 
max([conflict[i,3] | i in 1..M where conflict[i,1] in prison2 /\ conflict[i,2] in prison2 ]) endif;
%如果两名怨气值为 c 的罪犯被关押在同一监狱，他们俩之间会发生摩擦，并造成影响力为 c 的冲突事件。

var int: final_value=max(value1,value2);

%solve

solve minimize final_value;

%output

output[show(final_value)];

