% NOIP2018-S D2T3
% input

int: n;
int: m;
array[1..n] of int: p;
array[1..n-1,1..2] of int: road;
array[1..m,1..4] of int: request;

% description

array[1..m,1..n] of var 0..1: troop;
% Each city can have a troop stationed or not stationed.
array[1..m] of var int: score;
constraint forall(i in 1..m)(
  if request[i,2] == 0 /\ request[i,4] == 0 /\ exists(j in 1..n-1)(
    (road[j,1] == request[i,1] /\ road[j,2] == request[i,3]) \/ 
    (road[j,2] == request[i,1] /\ road[j,1] == request[i,3])
  ) then 
    score[i] = -1 
  else 
    score[i] >= 0 
  endif
);
% If King's j-th request cannot be met, then output -1.
constraint forall(i in 1..m)(
  if score[i] != -1 then 
    troop[i, request[i,1]] = request[i,2] /\ troop[i, request[i,3]] = request[i,4] 
  endif
);
% But King made m requests, each request specifying whether troops should be stationed in two cities.
constraint forall(i in 1..m)(
  forall(j in 1..n-1)(
    not (troop[i, road[j,1]] == 0 /\ troop[i, road[j,2]] == 0)
  )
);
% There should be at least one city with troops stationed among two cities connected by a road.
constraint forall(i in 1..m where score[i] != -1)(
  score[i] = sum(j in 1..n)(troop[i,j] * p[j])
);
% Stationing troops in a city will incur costs, and the cost of stationing troops in city i is pi.

%solve

solve minimize sum(score);
% Find the minimum cost of stationing troops under these requests.

%output

output[show(score)];
