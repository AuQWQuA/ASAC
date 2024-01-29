% NOIP2014-S D1T1
% Input

int: N;
int: NA;
int: NB;

array[1..NA] of int: loopA;
array[1..NB] of int: loopB;

% Description

enum match = {win, lose, draw};

array[1..5, 1..5] of var match: table = [|draw, lose, win, win, lose|
                                          win, draw, lose, win, lose|
                                          lose, win, draw, lose, win|
                                          lose, lose, win, draw, win|
                                          win, win, lose, lose, draw|];
% The win-lose relationships between the five hand gestures are shown in the table, 
% with the table indicating the results of games between player A and player B.
% 0 represents "scissors," 1 represents "rock," 2 represents "paper," 3 represents "lizard," 
% and 4 represents "Spock."

array[0..N-1] of var int: A;
array[0..N-1] of var int: B;
var int: scoreA;
var int: scoreB;

constraint forall(i in 0..N-1)(A[i] = loopA[(i mod NA) + 1] /\ B[i] = loopB[(i mod NB) + 1]);
constraint scoreA = sum(i in 0..N-1)(if table[A[i] + 1, B[i] + 1] == win then 1 else 0 endif);
constraint scoreB = sum(i in 0..N-1)(if table[B[i] + 1, A[i] + 1] == win then 1 else 0 endif);
% It is known that A and B played rock-paper-scissors a total of N times. 
% In each round, the winner receives 1 point, the loser receives 0 points, 
% and in case of a draw, both receive 0 points.

% Solve

solve satisfy;

% Output

output["\(scoreA) \(scoreB)"];
