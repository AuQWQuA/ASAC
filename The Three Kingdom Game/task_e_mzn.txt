% NOIP2010-J T4
%input

int: N;
array[1..N,1..N] of int: value;

%description

array[1..N div 2] of var 1..N: my_tactic;
array[1..N div 2] of var 1..N: oppo_tactic;
set of 1..N: full_set = 1..N;

var int: oppo_value;
var int: my_value;


function var int: find_max(var set of int: my_set, var set of int: free_set) =
  let{
    var 1..N: my_pointer;
    var 1..N: free_pointer;
    constraint my_pointer in my_set /\ free_pointer in free_set;
    constraint forall(j in my_set, k in free_set)(value[j,k] <= value[my_pointer,free_pointer]);
  } in free_pointer;
% The computer's strategy is to try to disrupt the opponent's strongest combination at any given moment. When it's the computer's turn to pick, it will attempt to pair each of the opponent's generals with each of its currently free generals, finding the pair with the highest synergy value and selecting the free general from that pair for its army.

function var int: find_value(var set of int: tactic) =
  let{
    var int: rtn;
    constraint exists(i in tactic, j in tactic)(rtn = value[i,j]);
    constraint forall(i in tactic, j in tactic)(rtn >= value[i,j]);
  } 
  in rtn;
% The program automatically selects one pair of generals from both sides with the highest synergy value to represent its army for a 2v2 battle.

constraint forall(i in 1..N div 2, j in 1..N div 2)(my_tactic[i] != oppo_tactic[j]);
constraint forall(i in 1..N div 2)(
  oppo_tactic[i] = find_max(array2set(my_tactic[1..i]), full_set diff (array2set(my_tactic[1..i]) union array2set(oppo_tactic[1..i-1])))
);

constraint my_value = find_value(array2set(my_tactic));
constraint oppo_value = find_value(array2set(oppo_tactic));

%solve

solve::int_search(array1d(my_tactic), input_order, indomain, complete) 
maximize my_value;

var int: answer = if(my_value - oppo_value > 0) then my_value else 0 endif;
% The pair of generals with higher synergy value wins the battle. This represents the outcome of the battle, where a side with the winning pair of generals wins.

%output

output[if fix(my_value - oppo_value) > 0 then "1\n\(my_value)" else "0" endif ++ "\n"];
% Xiao Han wants to know if the computer always adheres to the above strategy in a game, whether it's possible for him to always win? If so, what is the maximum synergy value for the pair of generals used for battles in all possible victory scenarios?
