% NOIP2006-J T2
% Input

int: n;
int: m;
array[1..m] of int: V;
array[1..m] of int: P;
% The first line of the input file contains two positive integers separated by a space: N m (where N (<30000) 
% represents the total amount of money, and m (<25) is the number of items to purchase).
% From the 2nd line to the m+1 line, each line provides basic data for item j-1.
% Each line contains 2 non-negative integers v p (where v represents the price of the item (v <= 10000), and p represents 
% the importance of the item (1~5)).

% Description

array[1..m] of var 0..1: buy;
constraint (sum(i in 1..m)(V[i]*buy[i])) <= n;
% He wants to spend no more than N yuan (can be equal to N yuan).

var int: obj = (sum(i in 1..m)(V[i]*P[i]*buy[i]));
% Let the price of the j-th item be v[j], and the importance be w[j]. If k items are selected with indices j1, j2, ..., jk, 
% the total sum to be found is: v[j1]*w[j1] + v[j2]*w[j2] + ... + v[jk]*w[jk]. (Where * denotes multiplication).

% Solve
solve maximize obj;
% Maximize the sum of the products of prices and importance for each item.

% Output
output["\(obj)\n"]
% The output file contains only one positive integer, which is the maximum sum of the products of prices and importance 
% for items that do not exceed the total money.
