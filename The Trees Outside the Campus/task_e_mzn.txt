% NOIP2005-J T2
% input

int: L;
int: M;
array[1..M, {1, 2}] of int: spot;
% Some areas on the road need to be used to build a subway. These areas are represented by their start and end points on the number line.

%description

array[0..L] of var bool: index;
% We can think of the road as a number line, with one end of the road at position 0 on the number line, and the other end at position L; at each integer point on the number line, i.e., 0, 1, 2, ..., L, there is a tree planted.
var int: cnt;

cnt = sum([index[i] | i in 0..L]);
% Your task is to calculate how many trees are still on the road after removing all of these trees.

constraint forall(i in 0..L)((index[i] = 0)\/(forall(j in 1..M)((i < spot[j, 1]) \/ (i > spot[j, 2]))));
% Now, the trees in these areas (including the two trees at the endpoints of the area) need to be removed.

%solve

solve maximize cnt;

%output

output[show(cnt)];
% The output file consists of one line containing only an integer, which represents the number of trees remaining on the road.
