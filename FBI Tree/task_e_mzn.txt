%NOIP2004-J T3
%input

int: N;
array[1..pow(2,N)] of 0..1: number;
% The first line of the input file is an integer N (0 <= N <= 10), and the second line is a "01" string of length 2N.

%description

int: node_num = pow(2,N+1)-1;
array[1..node_num] of var int: tree;

predicate build_tree(int: left, int: right, var int: idx) =
    if left == right then 
        (if number[left] == 1 then tree[idx] = 0
        else tree[idx] = 1 endif)
    else
        ((if count(i in left..right)(number[i] == 0) == 0 then tree[idx] = 0 
        elseif count(i in left..right)(number[i] == 1) == 0 then tree[idx] = 1
        else tree[idx] = 2 endif) 
        /\ build_tree(left, (left+right-1) div 2, idx+1) 
        /\ build_tree((left+right-1) div 2 + 1, right, idx+right-left+1)) endif;
% If the string S has a length greater than 1, split the string S in the middle, creating equally long left and right substrings S1 and S2. Build the left subtree T1 of R from the left substring S1 and the right subtree T2 of R from the right substring S2.

array[1..node_num] of var int: last;
predicate last_order(int: left, int: right, int: last_left, int: last_right) =
    if left == right then last[last_left] = tree[left]
    else
        (last[last_right] = tree[left]
        /\ last_order(left+1, (right+left) div 2, last_left, (last_left+last_right) div 2-1)
        /\ last_order((right+left) div 2 + 1, right, (last_left+last_right) div 2, last_right-1)) endif;
% Output the post-order traversal sequence of the constructed tree.

constraint build_tree(1, pow(2,N), 1);
constraint last_order(1, node_num, 1, node_num);

%solve

solve satisfy;

%output

output[if fix(last[i]) == 0 then "I" elseif fix(last[i]) == 1 then "B" else "F" endif | i in 1..node_num];
% We can classify strings consisting of "0" and "1" into three categories: a string consisting of all "0"s is called a B-string, a string consisting of all "1"s is called an I-string, and a string containing both "0"s and "1"s is called an F-string.
