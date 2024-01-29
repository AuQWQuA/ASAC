% NOIP2015-S D2T1
% input

int: L;
int: N;
int: M;
array[1..N] of int: D;

% description

array[1..N] of var bool: moved;

var int: predist = min(i in 1..N-1 where moved[i] == false, j in i+1..N where moved[j] == false)(abs(D[i] - D[j]));
var int: predist2 = min(i in 1..N where moved[i] == false)(min(D[i], L - D[i]));
var int: mindist = min(predist, predist2);

constraint sum(moved) <= M;
% Due to budget constraints, the organizing committee can remove at most M rocks between the starting point and the endpoint.

%solve

solve maximize mindist;
% maximize the mindist, which represents the longest possible jumping distance for the players during the competition.

%output

output["mindist=\(mindist)"]
