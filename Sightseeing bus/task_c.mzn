%NOIP2011-S D2T3
%input

int: n;
int: m;
int: k;
array[1..n-1] of int: D;
array[1..m] of int: T;
array[1..m] of int: A;
array[1..m] of int: B;

%description

array[1..n] of var int: arrive_time;
array[1..n] of var int: depart_time;
array[1..n-1] of var int: save_time;

constraint forall(i in 1..n)(arrive_time[i]>=0);
constraint forall(i in 1..n)(depart_time[i]>0);

constraint arrive_time[1]=0;
constraint forall(i in 1..m)(depart_time[A[i]] >= T[i]);
%公交车在每站都必须等待需要从该景点出发的所有乘客都上车后才能出发开往下一景点。

constraint forall(i in 1..n-1)(arrive_time[i+1]-depart_time[i]>0);
constraint forall(i in 1..n)(depart_time[i]-arrive_time[i]>=0);

constraint forall(i in 1..n-1)(arrive_time[i+1]-depart_time[i]+save_time[i]>=D[i]);
%每使用一个加速器，可以使其中一个 Di 减 1。对于同一个 Di 可以重复使用加速器
constraint forall(i in 1..n-1)(save_time[i]>=0);
%但是必须保证使用后 Di 大于等于 0。
constraint k>=sum(i in 1..n-1)(save_time[i]);
%于是聪明的司机 ZZ 给公交车安装了 k 个氮气加速器

var int: travel_time;
constraint travel_time=sum(i in 1..m)(arrive_time[B[i]]-T[i]);
%一个乘客的旅行时间，等于他到达目的地的时刻减去他来到出发地的时刻

%solve

solve minimize(travel_time);

%output

output[show(travel_time)];







