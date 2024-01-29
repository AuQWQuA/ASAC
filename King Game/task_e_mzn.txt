% NOIP2012-S D1T2
% input

include "alldifferent.mzn";

int: n;
int: a;
int: b;
array[1..n, 1..2] of int: minister;

% description

array[0..n, 1..2] of var int: number;
constraint number[0, 1] = a;
constraint number[0, 2] = b;
constraint number[1..n, 1..2] = minister;
% 'a' and 'b' represent the integers in the king's left hand and right hand, respectively. 
% Next 'n' lines, each containing two integers 'a' and 'b' separated by a space, represent the integers in the left hand and right hand of each minister.

array[0..n] of var 0..n: order;
constraint order[0] = 0;
constraint all_different(order);
% Arrange these 'n' ministers in a row, with the king at the front of the line.

array[1..n] of var int: money;
constraint forall(i in 1..n)(money[i] = product(j in 0..i-1)(number[order[j], 1]) div number[order[i], 2]);
% The number of coins each minister receives is calculated as the product of the integers in the left hand of all people in front of the minister, divided by the integer in the right hand of the minister, rounded down.

var int: answer;
constraint answer = max(i in 1..n)(money[i]);

% solve

solve minimize answer;
% The king doesn't want any minister to receive too many rewards, so he wants you to rearrange the order of the line to maximize the rewards of the most rewarded minister while minimizing the rewards.

% output

output[show(answer)];
