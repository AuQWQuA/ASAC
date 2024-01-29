% NOIP2018-J T1
% Input
string: title;

% Description
int: title_length = string_length(title);
var int: answer;
constraint answer = sum(i in 1..title_length where title[i] != " ")(1);
% When counting the characters in the title, spaces and line breaks are not included.

% Solve
solve satisfy;

% Output
output [show(answer)];
