% NOIP2004-J T4
% input

include "alldifferent.mzn";
int: N;
int: M;
array[1..N] of 1..N: init_finger;
% The input file includes three lines. The first line has a positive integer N, representing the number of Martian fingers (1 <= N <= 10000). The second line is a positive integer M, representing the small integer to be added (1 <= M <= 100). The next line is a permutation of the integers from 1 to N.

% description

int: max_size = product([i | i in 1..N]);
array[1..max_size, 1..N] of var 1..N: fingers;

var int: ans;

predicate larger(array[1..N] of var 1..N: l, array[1..N] of var 1..N: r, var int: pointer) =
  if pointer = N+1 then false
  else l[pointer] > r[pointer] \/ (l[pointer] = r[pointer] /\ larger(l, r, pointer+1)) endif;

constraint forall(i in 1..max_size)(alldifferent(fingers[i, 1..N]));
% These fingers are arranged in a row, numbered 1, 2, 3...

constraint forall(i in 1..max_size-1)(larger(fingers[i+1, 1..N], fingers[i, 1..N], 1));
constraint let{
  var int: i;
  constraint forall(j in 1..N)(init_finger[j] = fingers[i, j]);
} in ans = i + M;
% Add the number represented by the Martian fingers to the number told by the scientist and change the order of the Martian fingers based on the result.

%solve

solve satisfy;

%output

output[show(fingers[fix(ans), 1..N])];
% The output file has only one line, which contains N integers representing the changed order of the Martian fingers. Each pair of adjacent numbers is separated by a space, and there should be no extra spaces.
