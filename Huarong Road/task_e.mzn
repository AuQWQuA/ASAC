% NOIP2013-S D2T3
% input

int: n;
int: m;
int: q;
array[1..n,1..m] of int: chessboard;
array[1..q,1..6] of int: location;

% description

int: movable = count(i in 1..n, j in 1..m)(chessboard[i,j] = 1);
int: max_steps = movable * movable;
array[1..q, 0..max_steps, 1..n, 1..m] of var int: state;
array[1..q] of var 0..max_steps: steps;

constraint forall(i in 1..q)(
  forall(j in 1..n, k in 1..m where not((location[i,1] == j /\ location[i,2] == k) \/ (location[i,3] == j /\ location[i,4] == k)))
    (state[i,0,j,k] = chessboard[j,k]) /\ state[i,0,location[i,1],location[i,2]] = -1 /\ state[i,0,location[i,3],location[i,4]] = 2
);
% On the i-th move, the empty cell is in row EXi and column EYi, and the specified movable chess piece's initial position is in row SXi and column SYi.

predicate move(array[1..n,1..m] of var int: before, array[1..n,1..m] of var int: after) =
  let {
    var 1..n: x;
    var 1..m: y;
    constraint before[x,y] = -1;
  } in
  (x > 1 /\ before[x-1,y] != 0 /\ after[x-1,y] = before[x,y] /\ after[x,y] = before[x-1,y] /\ forall(i in 1..n, j in 1..m where not((i == x /\ j == y) \/ (i == x-1 /\ j == y)))(after[i,j] = before[i,j])) \/
  (x < n /\ before[x+1,y] != 0 /\ after[x+1,y] = before[x,y] /\ after[x,y] = before[x+1,y] /\ forall(i in 1..n, j in 1..m where not((i == x /\ j == y) \/ (i == x+1 /\ j == y)))(after[i,j] = before[i,j])) \/
  (y > 1 /\ before[x,y-1] != 0 /\ after[x,y-1] = before[x,y] /\ after[x,y] = before[x,y-1] /\ forall(i in 1..n, j in 1..m where not((i == x /\ j == y) \/ (i == x /\ j == y-1)))(after[i,j] = before[i,j])) \/
  (y < m /\ before[x,y+1] != 0 /\ after[x,y+1] = before[x,y] /\ after[x,y] = before[x,y+1] /\ forall(i in 1..n, j in 1..m where not((i == x /\ j == y) \/ (i == x /\ j == y+1)))(after[i,j] = before[i,j]));
% Any chess piece on a cell adjacent (sharing an edge) to an empty cell can be moved to the empty cell.

constraint forall(i in 1..q)(
  forall(j in 1..steps[i])(move(state[i,j-1,1..n,1..m],state[i,j,1..n,1..m]))
);
constraint forall(i in 1..q)(steps[i] == max_steps \/ state[i,steps[i],location[i,5],location[i,6]] = 2);
% The target position is in row TXi and column TYi.

%solve

solve minimize sum(steps);
% Please tell Little B the minimum time required for each game or if it's impossible to complete the game.

%output

output[if fix(steps[i]) == max_steps then "-1" else "\(steps[i])" endif ++ "\n" | i in 1..q]
