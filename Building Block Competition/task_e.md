**Building Block Competition**

**Problem Description**

Chunchun Kindergarten held an annual "Building block Contest".This year's competition is to build a building of width n. The building can be seen as consisting of n blocks of width 1, and the final height of the i~th~ block needs to be h~i~.

Before the building starts, there are no blocks (think of it as n blocks of height 0). In each operation, the children can choose a continuous interval \[l, r\], and then increase the height of all blocks between the L and R block (including the block L and block R) by 1.

M is a smart kid, and she quickly comes up with the best strategy for building the building, which requires the least number of operations. However, she is not a hands-on child, so she would like to ask you to help implement this strategy and find the minimum number of operations.

**Input**

There are two lines. The first line contains an integer n representing the width of the building.

The second line contains n integers, with the i~th~ integer being h~i~.

**Output**

The minimum number of operations required.

**Sample Input**

5

2 3 4 1 2

**Sample Output**

5

**Hint**

**\[Explanation of Sample\]**

One of the best possible solutions is to use these blocks in order: \[1,5\], \[1,3\], \[2,3\], \[3,3\], \[5,5\].

**\[Data Range\]**

For 30% of the data, 1 ≤ n ≤ 10;

For 70% of the data, 1 ≤ n ≤ 1000;

For 100% of the data, 1 ≤ n ≤ 100000 and 0 ≤ h~i~ ≤ 10000.
