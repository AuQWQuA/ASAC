% NOIP2006-S T3
% input

int: m;
int: n;
array[1..m*n] of int: order;
array[1..n,1..m] of int: machine;
array[1..n,1..m] of int: time;

% The first line of the input file contains two positive integers separated by a space: m and n, where m (<20) represents the number of machines, and n (<20) represents the number of workpieces.
% The second line contains m * n space-separated integers, representing the given arrangement order.
% The next 2n lines each contain m positive integers separated by spaces. The first n lines represent the machine numbers used for each operation of each workpiece. The first number is for the 1st operation, the second number for the 2nd operation, and so on.
% The next n lines represent the processing times for each operation of each workpiece.

% description

array[1..m*n] of var int: begin_time;
array[1..m*n] of var int: end_time;
array[1..m*n] of var int: process;

predicate no_overlap(var int: begin1, var int: end1, var int: begin2, var int: end2) =
  begin1 >= end2 \/ begin2 >= end1;

constraint forall(i in 1..m*n)(process[i] = count(j in 1..i)(order[j] = order[i]));
% Calculate each process

constraint forall(i in 1..m*n)(end_time[i] - begin_time[i] = time[order[i], process[i]]);
% Calculate end-begin=time

constraint forall(i in 1..m*n)(
  let{
    var int: max_t = if process[i] == 1 then 0
    else max([end_time[j] | j in 1..i-1 where order[j] == order[i]])
  } in
  if forall(j in 1..i-1 where machine[order[j], process[j]] == machine[order[i], process[i]])
    (no_overlap(begin_time[j], end_time[j], max_t, max_t + time[order[i], process[i]]))
  then begin_time[i] = max_t
  else 
    begin_time[i] = min([end_time[j] | j in 1..i-1 where
      machine[order[j], process[j]] == machine[order[i], process[i]] /\
      end_time[j] >= max_t /\
      forall(k in 1..i-1 where machine[order[k], process[k]] == machine[order[i], process[i]])
        (no_overlap(end_time[j], end_time[j] + time[order[i], process[i]], begin_time[k], end_time[k]))
    ])
  endif
);
% For the same workpiece, each operation must start only after the previous operation has been completed.
% At the same time, each machine can process at most one workpiece.

var int: ans;
constraint ans = max(i in 1..m*n)(end_time[i]);

%solve

solve satisfy;

%output

output[show(ans)];
% The output file contains only one positive integer, which represents the minimum processing time.
