int: a;
int: b;


int: max_ans=2000;

var 1..max_ans: ans;

constraint forall(i in 2..min(a, b)) ((a mod i != 0) \/ (b mod i != 0));
constraint forall(num_a,num_b in 0.. max_ans)(ans!=num_a*a+num_b*b);
%有些物品他是无法准确支付的
solve maximize ans;
%在无法准确支付的物品中，最贵的价值是多少金币？
output[show(ans)];