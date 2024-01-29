% NOIP2013-S D1T1
% Input

int: n;
int: m;
int: k;
int: x;

% Description

function var int: move(var int: x) =
    (x + m) mod n;
% Each round, the person at position 0 moves clockwise to position m, 
% the person at position 1 moves to position m+1, and so on. 
% Similarly, the person at position n-m moves to position 0, 
% the person at n-m+1 moves to position 1, and so on. 
% The person at position n-1 moves clockwise to position m-1.

int: rounds = pow(10, k);
% A total of 10^k rounds are performed.
array[0..rounds] of var int: state;

constraint state[0] = x;
% Find out which position the person at position x ends up at.

constraint forall(i in 1..rounds)(state[i] = move(state[i-1]));

% Solve

solve satisfy;

% Output

output [show(state[rounds])];
