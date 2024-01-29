**Placing Flowers**

**Problem Description**

Xiao Ming's flower shop has just opened. To attract customers, he wants to put a row of flowers in front of the shop, including m flowerpots. By surveying customers' preferences, Xiao Ming listed n kinds of flowers that the customers like best, numbered from 1 to N. In order to display more kinds of flowers at the door, it is stipulated that the number of the i^th^ kind of flowers should not be more than a~i~. When arranging flowers, the same kind of flowers should be put together, and different kinds of flowers should be arranged in the order of their serial number, from small to large. Try to write a program to calculate how many different arrangements of placing flowers there are.

**Input**

There are two lines. The first line contains two positive integers, n and m, separated by a space. There are n integers in the second line, separated by spaces, indicating a~1~, a~2~, \..., a~n~.

For 20% of the data, 0 \< n ≤ 8, 0 \< m ≤ 8, 0 ≤ a~i~ ≤ 8;

For 50% of the data, 0 \< n ≤ 20, 0 \< m ≤ 20, 0 ≤ a~i~ ≤ 20;

For 100% of the data, 0 \< n ≤ 100, 0 \< m ≤ 100, 0 ≤ a~i~ ≤ 100.

**Output**

There is only one line, containing an integer, indicating how many possible arrangements there are. Note: Since the number of solutions may be large, please output the result of modulo 1000007.

**Sample Input**

2 4

3 2

**Sample Output**

2

**Hint**

**\[Explanation for Sample Input and Output\]**

There are two arrangements, which are (1,1,2) and (1,1,2,2). The 1 and 2 in the parentheses indicate two kinds of flowers. For example, in the first plan, the first kind of flowers is placed in the first three positions, and the second kind of flowers is placed in the fourth position.
