%NOIP2012-J T2
%input

int: N;
int: M;
array[1..N,1..M] of 0..1: stairs;
array[1..N,1..M] of int: number;
int: p;

%description

function var int: distance(var int: begin, var int: target) =
if target>=begin then target-begin
else target+M-begin endif;

function var int: round_next(var int: begin,var int: d,var int: len) =
if (begin+d)<=len then begin+d
else ((begin+d-1) mod len)+1 endif;

function var int: go_up(array[1..M] of 0..1: layer_stairs,array[1..M] of int: layer_number, var int: enter) =
let{
array[int] of int: room_with_stairs=[ i | i in 1..M where layer_stairs[i]==1];
var int: stair_len=card(index_set(room_with_stairs));
var int: d=min(i in 1..M where layer_stairs[i]==1)(distance(enter,i));
var int: begin=round_next(enter,d,M);
var int: begin_loc;
constraint room_with_stairs[begin_loc]=begin;
} in room_with_stairs[round_next(begin_loc,layer_number[enter]-1,stair_len)];
%每个房间里有一个指示牌，指示牌上有一个数字 x，表示从这个房间开始按逆时针方向选择第 x 个有楼梯的房间

array[1..N] of var int: code;
constraint code[1]=p+1;
constraint forall(i in 1..N-1)(code[i+1]=go_up(stairs[i,1..M],number[i,1..M],code[i]));

var int: answer=sum(i in 1..N)(number[i,code[i]]) mod 20123;
%帮助你找到每层上楼房间的指示牌上的数字（即每层第一个进入的房间内指示牌上的数字）总和为打开宝箱的密钥
%请输出对 20123取模的结果即可。

%solve

solve satisfy;

%output

output[show(answer)];

