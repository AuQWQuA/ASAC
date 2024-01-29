% NOIP2010-S T4
% input

int: N;
int: M;
array[1..N,1..M] of int: height;

% description

enum water = {store, trans, empty};
% There are two types of water facilities: reservoirs and water transfer stations.

array[1..N,1..M] of var water: build;

predicate water_flow(var 1..N: x, var 1..M: y) =
  (x > 1 /\ height[x-1,y] > height[x,y] /\ build[x-1,y] != empty) 
  \/ (x < N /\ height[x+1,y] > height[x,y] /\ build[x+1,y] != empty) 
  \/ (y > 1 /\ height[x,y-1] > height[x,y] /\ build[x,y-1] != empty) 
  \/ (y < M /\ height[x,y+1] > height[x,y] /\ build[x,y+1] != empty);

constraint forall(i in 1..N, j in 1..M)
  (if build[i,j] = store then i = 1 
  % Only cities in the first row adjacent to the lake can build reservoirs.
  elseif build[i,j] = trans then water_flow(i,j)
  % To build a water transfer station in a city, there must exist an adjacent city with higher altitude and an existing water facility.
  else true endif);

var int: desert_water;

constraint desert_water = count(j in 1..M)(build[N,j] = trans \/ build[N,j] = store);
% As the cities in the last row are close to the desert and represent the arid region of the country, every city in that row must have a water facility.

var int: store_num;

constraint store_num = count(j in 1..M)(build[1,j] = store);

%solve

solve maximize desert_water * M - store_num;

%output

output[if fix(desert_water) == M then "1\n" else "0\n" endif];
output[if fix(desert_water) == M then "\(fix(store_num))" else "\(fix(M - desert_water))" endif];
