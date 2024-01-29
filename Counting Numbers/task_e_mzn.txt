% NOIP2007-S T1
% input

int: n;
array[1..n] of int: number;

% description

set of int: num_set = array2set(number);
int: m = card(num_set);

array[1..m, 1..2] of var int: count_num;

constraint forall(i in 1..m)(count_num[i, 1] in num_set);
constraint forall(i in 1..m)(count_num[i, 2] = count(number, count_num[i, 1]));
% Now, we need to count the occurrences of these natural numbers.
constraint forall(i in 1..m-1)(count_num[i, 1] < count_num[i+1, 1]);
% And output the counting results in ascending order of natural numbers.

%solve

solve satisfy;

% output

output[
  "\(count_num[i, 1]) \(count_num[i, 2])\n" | i in 1..m];
