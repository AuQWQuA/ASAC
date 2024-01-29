% NOIP2004-S T1
% input

array[1..12] of int: budget;

% The input file consists of 12 lines of data, each line containing a non-negative integer less than 350, representing Jingjing's budget for each month from January to December.

% description

array[0..12] of var int: left;
var int: total;

constraint left[0] = 0;
constraint forall(i in 1..12)(left[i] = (300 + left[i-1] - budget[i]) mod 100);
% At the beginning of each month, Mom gives Jingjing 300 yuan, and Jingjing will budget for the month's expenses, ensuring that actual expenses match the budget. 
% Therefore, Jingjing has a savings plan: at the beginning of each month, after receiving pocket money from Mom, if she predicts that she will have more than 100 yuan or exactly 100 yuan left at the end of the month, she will deposit the amount in multiples of 100 yuan with Mom and keep the remaining money.

constraint total = sum([((300 + left[i-1] - budget[i]) div 100) * 100 | i in 1..12]) * 1.2;
% Calculate how much money Jingjing will have at the end of 2004 after Mom returns the money she usually saves, plus 20%.

%solve

solve satisfy;

%output

output[
if min(fix(left)) < 0 then "-\(min([i | i in 0..12 where fix(left[i]) < 0]))"
else "\(left[12] + total)"
endif
];
% If there is a month during the savings plan where there is not enough money, output -X, where X represents the first month when this situation occurs; otherwise, output how much money Jingjing will have at the end of 2004.
