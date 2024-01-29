% NOIP2008-S T4
% Input
int: n;
array[1..n] of int: numbers;

% Description
array[1..2*n+1, 1..n] of var int: stack1;
array[1..2*n+1, 1..n] of var int: stack2;

enum op = {a, b, c, d};

array[1..2*n] of var op: action;

predicate push(array[1..n] of var int: before, array[1..n] of var int: after, var int: element) =
    after[1] = element /\ forall(i in 1..n-1)(after[i+1] = before[i]);

predicate pop(array[1..n] of var int: before, array[1..n] of var int: after, var int: element) =
    forall(i in 2..n)(after[i-1] = before[i]) /\ element = before[1] /\ after[n] = 0;

array[1..n] of var int: out;

constraint forall(i in 1..n)(stack1[1, i] = 0 /\ stack1[2*n+1, i] = 0 /\ stack2[1, i] = 0 /\ stack2[2*n+1, i] = 0);
% The initial and final stacks are all empty

constraint forall(i in 1..2*n)(
    let{
        var int: t;
        var int: u;
        constraint t = count(j in 1..i-1)(action[j] = a \/ action[j] = c);
        constraint u = count(j in 1..i-1)(action[j] = b \/ action[j] = d);
    } in if action[i] = a then push(stack1[i, 1..n], stack1[i+1, 1..n], numbers[t+1]) /\ stack2[i, 1..n] = stack2[i+1, 1..n]
    % Action a: If the input sequence is not empty, push the first element into stack S1
    elseif action[i] = c then push(stack2[i, 1..n], stack2[i+1, 1..n], numbers[t+1]) /\ stack1[i, 1..n] = stack1[i+1, 1..n]
    % Action c: If the input sequence is not empty, push the first element into stack S2
    elseif action[i] = b then pop(stack1[i, 1..n], stack1[i+1, 1..n], out[u+1]) /\ stack2[i, 1..n] = stack2[i+1, 1..n]
    % Action b: If stack S1 is not empty, pop the top element of S1 into the output sequence
    else pop(stack2[i, 1..n], stack2[i+1, 1..n], out[u+1]) /\ stack1[i, 1..n] = stack1[i+1, 1..n] 
    % Action d: If stack S2 is not empty, pop the top element of S2 into the output sequence
    endif);

constraint forall(i in 1..n)(out[i] = i);

%solve

solve satisfy;

% Output
output[show(action)];
