%NOIP2013-S D1T1
%input

int: n;
int: m;
int: k;
int: x;

%description

function var int: move(var int: x) =
(x+m) mod n;
%每一轮第 0 号位置上的小伙伴顺时针走到第 m 号位置，第 1 号位置小伙伴走到第 m+1 号位置，……，依此类推，第n − m号位置上的小伙伴走到第 0 号位置，第n-m+1 号位置上的小伙伴走到第 1 号位置，……，第 n-1 号位置上的小伙伴顺时针走到第m-1 号位置。

int: rounds=pow(10,k);
%一共进行了 10^k 轮
array[0..rounds] of var int: state;

constraint state[0]=x;
%请问 x 号小伙伴最后走到了第几号位置。
constraint forall(i in 1..rounds)(state[i]=move(state[i-1]));

%solve

solve satisfy;

%output

output[show(state[rounds])];