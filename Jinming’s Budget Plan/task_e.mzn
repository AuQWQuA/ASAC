% NOIP2006-S T2
% input

int: N;
int: m;

% The first line of the input file contains two positive integers separated by a space.

array[1..m,1..3] of int: items;

% From the 2nd line to the (m+1)-th line, each line provides basic data for an item with an index from 0 to (m-1). Each line contains 3 non-negative integers.

% description

array[1..m] of var 0..1: choose;
var int: ans;

constraint forall(i in 1..m)(if choose[i]=1 then (if items[i,3]!=0 then choose[items[i,3]]=1 endif) endif);
% If you want to buy an item classified as an accessory, you must first buy the main item to which the accessory belongs.

constraint sum([if choose[i]=1 then items[i,1] else 0 endif | i in 1..m]) <= N;
% He hopes to spend no more than N yuan (can be equal to N yuan).

constraint ans=sum([if choose[i]=1 then items[i,1] * items[i,2] else 0 endif | i in 1..m]);
% Maximize the sum of the product of price and importance for each chosen item.

%solve

solve maximize ans;

%output

output["\(ans)"];
% The output file contains only one positive integer, which is the maximum sum of the product of price and importance for items that do not exceed the total budget.
