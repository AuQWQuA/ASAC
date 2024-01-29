% NOIP2008-S T3
% input

int: m;
int: n;
array[1..m, 1..n] of int: students;

% description

array[1..m+n, 1..2] of var int: first;
array[1..m+n, 1..2] of var int: second;

int: L = m + n - 1;

constraint forall(i in 1..L)(first[i,1] >= 1 /\ first[i,2] <= m);
constraint forall(i in 1..L)(second[i,1] >= 1 /\ second[i,2] <= n);

constraint (first[1,1] = 1 /\ first[1,2] = 1) /\ (first[m+n,1] = m /\ first[m+n,2] = n);
constraint (second[1,1] = m /\ second[1,2] = n) /\ (second[m+n,1] = 1 /\ second[m+n,2] = 1);
% Little Yuan sits at the top-left corner of the matrix at coordinates (1,1), while Little Xuan sits at the bottom-right corner at coordinates (m,n).

predicate neighbor(array[1..2] of var int: a, array[1..2] of var int: b) =
  (b[1] = a[1] /\ b[2] = a[2] + 1) \/ (b[2] = a[2] /\ b[1] = a[1] + 1);
% Notes can only be passed from Little Yuan to Little Xuan in the downward or rightward direction, and from Little Xuan to Little Yuan in the upward or leftward direction.

constraint forall(i in 1..L-1)(neighbor(first[i,1..2], first[i+1,1..2]));
constraint forall(i in 1..L-1)(neighbor(second[i+1,1..2], second[i,1..2]));

constraint forall(i, j in 2..L-1)(not(first[i,1] = second[j,1] /\ first[i,2] = second[j,2]));
% During the activity, Little Yuan wants to pass a note to Little Xuan and receive a reply. Each student in the class can help them only once, which means if a student helps them pass a note from Little Yuan to Little Xuan, they won't help again when Little Xuan passes a note back to Little Yuan.

var int: value;
constraint value = sum([students[first[i,1], first[i,2]] | i in 1..L]) + sum([students[second[i,1], second[i,2]] | i in 1..L]);
% Little Yuan and Little Xuan want to find students with the highest kindness level to help pass notes. They want to find two paths (forward and backward) where the sum of the kindness levels of students on these paths is maximized.

%solve

solve maximize value;

%output

output[show(value)];
