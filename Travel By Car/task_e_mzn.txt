% NOIP2012-S D1T3
% Input
int: N;
array[1..N] of int: H;
int: X0;
int: M;
array[1..M] of int: S;
array[1..M] of int: X;

% Description
function var int: d(var int: i, var int: j) =
    abs(H[i] - H[j]);
% The distance d[i,j] between city i and city j is exactly the absolute difference between the altitudes of these two cities, i.e., d[i, j] = |𝐻𝑖 − 𝐻𝑗|.

predicate near(var int: d1, var int: d2, var int: H1, var int: H2) =
    d1 < d2 \/ (d1 == d2 /\ H1 < H2);
% In this problem, if the current city has the same distance to two cities, it is considered closer to the city with lower altitude.

function var int: plan_B(var int: current_city) = 
let{
    var 1..N: nearest;
    constraint if current_city < N then nearest > current_city else nearest = N+1 endif;
    % Always move eastward
    constraint forall(i in current_city+1..N where i != nearest)(near(d(current_city, nearest), d(current_city, i), H[nearest], H[i]));
} in nearest;
% Little B always chooses the nearest city as the destination along the forward direction
% N+1 is used to end the trip

function var int: plan_A(var int: current_city) = 
let{
    var 1..N: second_near;
    var 1..N: nearest;
    constraint if current_city < N-1 then second_near > current_city /\ nearest > current_city /\ second_near != nearest else second_near = N+1 /\ nearest = N endif;
    constraint forall(i in current_city+1..N where i != nearest)(near(d(current_city, nearest), d(current_city, i), H[nearest], H[i]));
    constraint forall(i in current_city+1..N where (i != nearest /\ i != second_near))(near(d(current_city, second_near), d(current_city, i), H[second_near], H[i]));
} in second_near;
% Little A always chooses the second nearest city as the destination along the forward direction
% N+1 is used to end the trip

function array[1..2] of var int: travel(var int: start_city, var int: limit) =
let{
    array[0..N] of var 1..N+1: route;
    var 0..N-1: days;
    constraint route[0] = start_city;
    constraint forall(i in 1..days)(route[i] < N+1);
    constraint forall(i in 1..days)(if i mod 2 == 1 then route[i] = plan_A(route[i-1]) else route[i] = plan_B(route[i-1]) endif);
    % Little A and Little B take turns driving, with Little A driving on the first day and switching every day
    constraint sum(i in 1..days)(d(route[i], route[i-1])) <= limit;
    % If either of them cannot choose the destination according to their principles or if reaching the destination would exceed X kilometers in total, they will end the trip.

    array[1..2] of var int: total_distance;
    constraint total_distance[1] = sum(i in 1..days where i mod 2 == 1)(d(route[i], route[i-1]));
    constraint total_distance[2] = sum(i in 1..days where i mod 2 == 0)(d(route[i], route[i-1]));

} in total_distance;

array[1..M, 1..2] of var int: ans;
constraint forall(i in 1..M)(ans[i, 1..2] = travel(S[i], X[i]));
% For any given X=Xi and starting city Si, the total distance traveled by Little A and Little B.

% Solve
solve maximize sum(i in 1..M, j in 1..2)(ans[i, j]);

% Output
output["\(ans[i, 1]) , \(ans[i, 2])\n" | i in 1..N];
