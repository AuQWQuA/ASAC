% NOIP2011-S D1T2
% input

int: n;
int: k;
int: p;
array[1..n, 1..2] of int: hotel;

% description

array[1..n*n div 2, 1..2] of var 1..n: plans;
var 1..n*n div 2: num;

constraint forall(i in 1..num)(plans[i, 1] < plans[i, 2] /\ hotel[plans[i, 1], 1] = hotel[plans[i, 2], 1]
/\ exists(t in plans[i, 1]..plans[i, 2])(hotel[t, 2] <= p));
% They plan to stay in two hotels with the same color.
% At night, they plan to choose a cafe to have coffee, requiring the cafe to be located between the two hotels they are staying in (including the hotels they are staying in), and the minimum consumption at the cafe not exceeding p.

constraint forall(i, j in 1..num where i != j)(not(plans[i, 1] = plans[j, 1] /\ plans[i, 2] = plans[j, 2]));
% They want to know how many accommodation choices there are in total, ensuring that they can find a cafe with a minimum consumption not exceeding p yuan to meet in the evening.

%solve

solve maximize num;

%output

output[show(num)];
