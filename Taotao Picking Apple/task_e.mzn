% NOIP2005-J T1
% Input

array[1..10] of int: apple;
int: h;

% The input file consists of two lines of data. The first line contains 10 integers between 100 and 200 (including 100 and 200), 
% representing the heights (in centimeters) of 10 apples from the ground. 
% Each pair of adjacent integers is separated by a space. 
% The second line contains a single integer between 100 and 120 (including 100 and 120), 
% representing the maximum height (in centimeters) that Tao Tao can reach when she stretches her hand.

% Description

var int: num;
constraint num = count([apple[i] <= h + 30 | i in 1..10]);
% Tao Tao has a 30-centimeter high stool. When she can't reach the apples directly with her hand, she stands on the stool to try.
% Now, given the heights of 10 apples from the ground and the maximum height Tao Tao can reach when stretching her hand, 
% please calculate how many apples she can pick.

% Solve

solve satisfy;

% Output

output [show(num)];
% The output file consists of a single line containing an integer, representing the number of apples Tao Tao can pick.
