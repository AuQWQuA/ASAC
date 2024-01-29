%NOIP2012-S D1T2
%input

include "alldifferent.mzn";

int: n;
int: a;
int: b;
array[1..n,1..2] of int: minister;

%description

array[0..n,1..2] of var int: number;
constraint number[0,1]=a;
constraint number[0,2]=b;
constraint number[1..n,1..2]=minister;
%a 和 b，分别表示国王左手和右手上的整数。接下来 n 行，每行包含两个整数 a 和 b，之间用一个空格隔开，分别表示每个大臣左手和右手上的整数。

array[0..n] of var 0..n: order;
constraint order[0] = 0;
constraint all_different(order);
%让这 n 位大臣排成一排，国王站在队伍的最前面

array[1..n] of var int: money;
constraint forall(i in 1..n)(money[i]=product(j in 0..i-1)(number[order[j],1]) div number[order[i],2]);
%每位大臣获得的金币数分别是：排在该大臣前面的所有人的左手上的数的乘积除以他自己右手上的数，然后向下取整得到的结果。

var int: answer;
constraint answer=max(i in 1..n)(money[i]);

%solve

solve minimize answer;
%国王不希望某一个大臣获得特别多的奖赏，所以他想请你帮他重新安排一下队伍的顺序，使得获得奖赏最多的大臣，所获奖赏尽可能的少。

%output

output[show(answer)];


