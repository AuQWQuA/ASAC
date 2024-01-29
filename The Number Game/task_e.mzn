% CSP2019-J T1
% Input

string: numstr;

% Description

int: num_length = string_length(numstr);
var int: one_num;

% Constraint to count the number of "1" in the string
constraint one_num = sum(i in 1..num_length where numstr[i] = "1")(1);

% Solve
solve satisfy;

% Output

output ["\(one_num)"];
