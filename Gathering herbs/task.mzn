% NOIP2005-J T3
% input

int: T;
int: M;
array[1..M, 1..2] of int: herb;
%输入文件的第一行有两个整数 T(1 <= T <= 1000)和 M(1 <= M <= 100)，用一个空格隔开，T 代表总共能够用来采药的时间，M 代表山洞里的草药的数目。接下来的 M 行每行包括两个在 1 到 100 之间(包括 1 和 100)的整数，分别表示采摘某株草药的时间和这株草药的价值。

%description

array[1..M] of var 0..1: index;
var int: total;
var int: cost;

total = sum([herb[j, 2] * index[j] | j in 1..M ]);
%每一株也有它自身的价值
cost = sum([herb[j, 1] * index[j] | j in 1..M ]);
%采每一株都需要一些时间

constraint cost <= T;
%在这段时间里，你可以采到一些草药。

%solve

solve maximize total;
%如果你是一个聪明的孩子，你应该可以让采到的草药的总价值最大。

%output

output[show(total)];
%输出文件包括一行，这一行只包含一个整数，表示在规定的时间内，可以采到的草药的最大总价值。
