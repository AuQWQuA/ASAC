% NOIP2008-J T3
% Input

int: n;
int: m;

% Description

int: bound = pow(2, m);
array[1..bound, 1..m+1] of var 1..n: balls;
var int: num;
constraint num >= 0 /\ num < bound;

predicate neighbor(var int: a, var int: b) =
    abs(a - b) = 1 \/ (a = n /\ b = 1) \/ (a = 1 /\ b = n);
% Each student can pass the ball to one of their left or right classmates (either left or right).

constraint forall(i in 1..num)
    (balls[i, 1] = 1 /\ balls[i, m+1] = 1 /\ forall(j in 1..m)(neighbor(balls[i, j], balls[i, j+1])));
% The ball starts with student 1 and is passed m times before returning to student 1.

constraint forall(j, k in 1..num where j < k)(exists(l in 1..m+1)(balls[j, l] != balls[k, l]));
% Two ball-passing methods are considered different if and only if the sequences of students who receive the ball in 
% the order they receive it are different.

% Solve

solve maximize num;

% Output

output[show(num) ++ "\n"];
% The output file "ball.out" contains one line with an integer representing the number of valid methods.
