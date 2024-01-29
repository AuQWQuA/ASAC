include "alldifferent.mzn";
% Input
int: N;
int: M;
array[1..N] of int: score;
array[1..M] of int: cards;

% Description
array[1..M] of var 1..M: order;
array[1..M+1] of var 1..N: stay;
var int: total_score;

constraint alldifferent(order);
% Each card can only be used once.
constraint stay[1] = 1 /\ stay[M+1] = N;
% The chessboard's first square is the unique starting point, and the Nth square is the endpoint. The game requires the player to control a turtle piece to move from the starting point to the endpoint.
constraint forall(i in 1..M)(stay[i+1] = stay[i] + cards[order[i]]);
% In each turn, the player needs to choose an unused crawl card from all available crawl cards and move the turtle piece by the corresponding number of squares.
constraint total_score = sum([score[stay[i]] | i in 1..M+1]);
% The player's final game score is the sum of the scores of all squares the turtle piece has visited during its journey from the starting point to the endpoint.

% Solve
solve maximize total_score;

% Output
output [show(total_score)];
