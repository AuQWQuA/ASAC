% NOIP2008-S T2
% input

int: n;

% description

array[1..10] of int: sticks = [6,2,5,5,4,5,6,3,7,6];
int: L = 150;
array[1..L, 1..3] of var 0..100: equation;
var 1..L: ans;

function var int: use_sticks(var int: num) =
  if num div 10 = 0 then sticks[(num mod 10) + 1]
  else sticks[(num mod 10) + 1] + use_sticks(num div 10) endif;

constraint forall(i in 1..ans)(equation[i,1] + equation[i,2] = equation[i,3]);
% If A ≠ B, then A + B = C and B + A = C are considered different equations.
constraint forall(i in 1..ans)(use_sticks(equation[i,1]) + use_sticks(equation[i,2]) + use_sticks(equation[i,3]) + 4 = n);
% Plus and equals signs each require two matchsticks.
predicate different(array[1..3] of var int: a, array[1..3] of var int: b) =
  not(forall(i in 1..3)(a[i] = b[i]));

constraint forall(i, j in 1..ans where i != j)(different(equation[i,1..3], equation[j,1..3]));

%solve

solve maximize ans;

%output

output[show(ans)];
