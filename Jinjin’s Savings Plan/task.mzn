%NOIP2004-S T1
%input

array[1..12] of int: budget;
%输入文件包括 12 行数据，每行包含一个小于 350 的非负整数，分别表示 1 月到 12 月津津 的预算。

%description

array[0..12] of var int: left;
var int: total;
constraint left[0]=0;
constraint forall(i in 1..12)(left[i]=(300+left[i-1]-budget[i]) mod 100 );
%每个月的月初妈妈给津津300元钱，津津会预算这个月的花销，并且总能做到实际花销和预算的相同。 
%因此津津制定了一个储蓄计划：每个月的月初，在得到妈妈给的零花钱后，如果她预计到这个月的月末手中还会有多于100元或恰好100元，她就会把整百的钱存在妈妈那里，剩余的钱留在自己手中。

constraint total=sum([((300+left[i-1]-budget[i]) div 100)* 100| i in 1..12])*1.2;
%计算到2004年年末，妈妈将津津平常存的钱加上20％还给津津之后，津津手中会有多少钱。

%solve

solve satisfy;

%output

output[
if min(fix(left))<0 then "-\(min([ i | i in 0..12 where fix(left[i])<0]) )"
else "\(left[12]+total)"
endif
];
%如果储蓄计划实施过程中出现某个月钱不够用的情况，输出-X，X表示出现这种情况的第一个月；否则输出到2004年年末津津手中会有多少钱。 
