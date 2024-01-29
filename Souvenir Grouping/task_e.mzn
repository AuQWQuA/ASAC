%NOIP2007-J T2
% input

int: w;            % The maximum total price for each group of souvenirs
int: n;            % The total number of purchased souvenirs
array[1..n] of int: P; % Prices of each souvenir

% description

array[1..n] of var 1..n: setIndex; % Index of the group for each souvenir
array[1..n] of var int: weight;    % Total price of each group
array[1..n] of var int: num;       % Number of souvenirs in each group

% Calculate the total price and number of souvenirs in each group
weight = [sum([P[j] | j in 1..n where setIndex[j] == i]) | i in 1..n];
num = [sum([1 | j in 1..n where setIndex[j] == i]) | i in 1..n];

var int: object = sum([1 | number in num where number > 0]);

% Ensure that each group has at most two souvenirs
constraint forall(number in num)(number <= 2);

% Ensure that the total price of each group does not exceed w
constraint forall(mass in weight)(mass <= w);

%solve

solve minimize object;

%output

output["\(object)"];
