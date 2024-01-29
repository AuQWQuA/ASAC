int: a;
int: b;
%两个正整数 a 和 b，它们之间用一个空格隔开，表示小凯手中金币的面值。

int: max_ans=2000;

var 1..max_ans: ans;

constraint forall(num_a,num_b in 0.. max_ans)(ans!=num_a*a+num_b*b);
%有些物品他是无法准确支付的
solve maximize ans;
%在无法准确支付的物品中，最贵的价值是多少金币？
output[show(ans)];