%NOIP2016-S D1T1
%input

int: n;
int: m;
array[1..n] of int: face;
array[1..n] of string: person;
array[1..m,1..2] of int: instruction;

%description

function var int: ccw(var int: start,var int: num)=
(start+num-1) mod n + 1;

function var int: cw(var int: start,var int: num)=
(start+n-num-1) mod n + 1;

array[0..m] of var 1..n: state;
constraint state[0]=1;
constraint forall(i in 1..m)(
if (face[state[i-1]]=0 /\ instruction[i,1]=0) \/ (face[state[i-1]]=1 /\ instruction[i,1]=1) 
then state[i]=cw(state[i-1],instruction[i,2])
else state[i]=ccw(state[i-1],instruction[i,2]) endif);
%面朝圈外的玩具小人，它的左边是逆时针方向，右边是顺时针方向。

%solve

solve satisfy;

%output

output[show(person[fix(state[m])])];
