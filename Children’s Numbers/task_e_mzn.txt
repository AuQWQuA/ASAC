% NOIP2013-J T3
% input

int: n;
int: p;
array [1 .. n] of int: a;

% description

array [1 .. n] of var int: character;
array [1 .. n] of var int: score;
var int: ans;

constraint forall(i in 1..n)(
  character[i] = max(j, k in 1..i where j <= k)(sum(l in j..k)(a[l]))
);
% Define that each child's characteristic value equals the maximum sum of consecutive digits (at least one) held by the children in front of him (including himself).

constraint score[1] = character[1]; 
% The first child's score is equal to his characteristic value.

constraint forall(i in 2 .. n)( 
  score[i] = max(j in 1..i-1)(character[j] + score[j])
);
% The scores of other children are equal to the maximum value of the sum of the scores of all children in front of them (excluding themselves) and their characteristic values.

constraint ans = (max(i in 1 .. n)(score[i])) mod p;
% Calculate the maximum score among all children, maintain its sign when output, and output its absolute value modulo p.

%solve

solve satisfy;

%output

output[show(ans)];
