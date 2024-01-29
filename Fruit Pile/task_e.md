**Fruit Pile**

**Problem Description**

In an orchard, Duoduo has picked all the fruit and divided them into different piles according to different kinds of fruit. Duoduo decided to put all the fruit into one pile.

In each merging, Duoduo can merge two piles of fruit together, and the energy expended is equal to the combined weight of the two piles of fruit. After n-1 times of merging, there's only one pile left. The total energy expended by Duoduo in merging the fruit piles is equal to the sum of the energy expended in each merging.

Since it takes a lot of effort to carry the fruit home, Duoduo tries to save as much energy as possible when merging the piles. Given that each fruit has a weight of 1, and that the number of fruit types and the number of each fruit are already known, your task is to devise a order scheme of merging that minimizes the amount of energy Duoduo expends, and output the minimum amount of energy cost.

For example, there are 3 kinds of fruit, the number of which is 1,2,9. You can first combine piles 1 and 2, and the number of fruit of the new pile is 3, and the energy cost is 3. Then, merge the pile with the original third pile, and the number of fruit of this new pile is 12, and the energy cost is 12. So Duoduo's total energy cost=3+12=15. It can be proved that 15 is the minimum energy cost.

**Input**

The input file contains two lines.

The first line is an integer n (1≤ n ≤30000), representing the number of fruit types.

The second line contains n integers, separated by spaces. The i^th^ integer A~i~ (1≤ A~i~ ≤ 20000) is the number of i^th^ fruits.

**Output**

The output file has a line that contains only one integer, which is the minimum energy cost. The input data ensures that this value is less than 2^31^.

**Sample Input**

3

1 2 9

**Sample Output**

15

**Data Size**

For 30% of data, ensure n≤100;

For 50% of data, ensure n≤5000;

For all data, ensure that n≤10000.
