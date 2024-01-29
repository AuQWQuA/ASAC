%CSP-J 2019 T3
% input

int: T;      % Number of days
int: N;      % Number of souvenir types
int: M;      % Initial number of coins
array[1..T, 1..N] of int: P; % Prices of souvenirs on each day

% description

array[0..T] of var 0..10000: coin; % Number of coins on each day
array[1..T, 1..N] of var int: buy; % Number of souvenirs bought each day
array[0..T, 1..N] of var int: souvenir; % Number of each souvenir type held each day

constraint coin[0] == M; % Xiaowei starts with M coins
constraint forall(j in 1..N) (souvenir[0, j] == 0); % No souvenirs at the start
constraint forall(j in 1..N) (souvenir[T, j] == 0); % No souvenirs at the end

constraint forall(i in 1..T, j in 1..N) (souvenir[i, j] >= 0);
constraint forall(i in 0..T) (coin[i] >= 0);

% The following constraints model Xiaowei's actions each day:
% 1. Buy any souvenir if he has enough coins at the current price.
% 2. Sell any held souvenir at the current price to get coins.

constraint forall(i in 1..T, j in 1..N) (souvenir[i, j] = souvenir[i - 1, j] + buy[i, j]);
constraint forall(i in 1..T) (coin[i] = coin[i - 1] - sum(j in 1..N) (buy[i, j] * P[i, j]));

%solve

solve maximize coin[T]; % Maximize the number of coins at the end

%output

output ["\(coin[T])"]; % Output the maximum number of coins Xiaowei has at the end
