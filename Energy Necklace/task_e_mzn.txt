%NOIP2006-S T1
%input

int: N;
array[1..N] of int: beads;
% The first line of the input file is a positive integer N (4≤N≤100), which represents the number of beads on the necklace. The second line consists of N positive integers separated by spaces, where all numbers do not exceed 1000. The ith number represents the head label of the ith bead (1 ≤ i ≤ N). When i < N, the tail label of the ith bead should be equal to the head label of the (i+1)th bead. The tail label of the Nth bead should be equal to the head label of the 1st bead.

%description

function var int: precede(var int: j, var int: len) =
    if j > 1 then j - 1 else len endif;

function var int: follow(var int: j, var int: len) =
    if j < len then j + 1 else 1 endif;

array[1..N,1..N] of var int: steps;
array[1..N] of var 1..N: choose;
constraint forall(i in 2..N)(choose[i] <= N - i + 1);
constraint steps[1,1..N] = beads;
constraint forall(i in 1..N-1)(forall(j in 1..choose[i]-1)(steps[i+1,j] = steps[i,j]));
constraint forall(i in 1..N-1)(forall(j in choose[i]+1..N-i+1)(steps[i+1,j-1] = steps[i,j]));
% When needed, the Martians use suction cups to hold two adjacent beads, aggregate them, and release energy until there is only one bead left on the necklace.

var int: ans;
constraint ans = sum([steps[i,choose[i]] * steps[i,precede(choose[i],N-i+1)] * steps[i,follow(choose[i],N-i+1)] | i in 1..N-1]);
% If the head label of the previous energy bead is m, the tail label is r, and the head label of the next energy bead is r, and the tail label is n, then the energy released after aggregation is in Mars units, and the newly generated bead has a head label of m and a tail label of n.

%solve

solve maximize ans;
% Please design an aggregation order to maximize the total energy released from a sequence of beads.

%output

output[show(ans)];
% The output file has only one line, which is a positive integer E (E ≤ 2.1*10^9), representing the total energy released by an optimal aggregation order.
