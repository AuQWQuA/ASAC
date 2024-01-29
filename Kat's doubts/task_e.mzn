int: a;
int: b;
% Two positive integers a and b, separated by a space, represent the denominations of coins in Xiao Kai's possession.

int: max_ans = 2000;

var 1..max_ans: ans;

constraint forall(num_a, num_b in 0..max_ans)(ans != num_a * a + num_b * b);
% There are some items that he cannot pay for accurately.
solve maximize ans;
% Among the items that cannot be paid for accurately, what is the most valuable one in terms of coins?
output[show(ans)];
