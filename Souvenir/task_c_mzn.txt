%CSP-J 2019 T3
%input

int: T;
int: N;
int: M;
array[1..T,1..N] of int: P;

%description

array[0..T] of var 0..10000: coin;
array[1..T,1..N] of var int: buy;
array[0..T,1..N] of var int: souvenir;

constraint coin[0]==M;
%小伟现在有M枚金币
constraint forall (j in 1..N) (souvenir[0,j]==0);
constraint forall (j in 1..N) (souvenir[T,j]==0);
%T天之后，小伟的超能力消失，因此他一定会在第T天卖出所有纪念品换回金币

constraint forall (i in 1..T,j in 1..N) (souvenir[i,j]>=0);
constraint forall (i in 0..T) (coin[i]>=0);
constraint forall (i in 1..T,j in 1..N) (souvenir[i,j]=souvenir[i-1,j]+buy[i,j]);
constraint forall (i in 1..T) (coin[i] = coin[i-1] - sum(j in 1..N) (buy[i,j]*P[i,j]));
%1.任选一个纪念品，若手上有足够金币，以当日价格购买该纪念品
%2.卖出持有的任意一个纪念品，以当日价格换回金币

%solve

solve maximize coin[T];

%output

output ["\(coin[T])"];
