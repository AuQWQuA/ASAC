**Pave the Road**

**Problem Description**

Chunchun is a road engineer and is responsible for laying a road of length n.

The main job of paving the road is to fill in the sunken surface. The whole section of the road can be seen as n blocks connected end to end. In the beginning, the depth of the subsidence of block i is d~i~.

Chunchun can choose a continuous section \[L,R\] every day, and fill each section of this section so that its subsidence depth is reduced by 1. When selecting the interval, it is necessary to ensure that the subsidence depth of each block in the interval is not 0 before filling.

Chunchun hopes you can help him design a solution that will make the subsidence depth of the whole section of the road become zero in the shortest time.

**Input**

The input file contains two lines, the first of which contains an integer n for the length of the road. The second line contains n integers separated by spaces, and the i^th^ integer is d~i~.

**Output**

The output file only contains one integer, indicating the minimum number of days it will take to complete the task.

**Sample Input**

6

4 3 2 5 3 5

**Sample Output**

9

**Hint**

**\[Explanation of the Sample\]**

One of the feasible best solutions is to choose in turn:

\[1,6\], \[1,6\], \[1,2\], \[1,1\], \[4,6\], \[4,4\], \[4,4\], \[6,6\], \[6,6\].

**\[Data Scale and Conventions\]**

For 30% of the data, 1 ≤ n ≤ 10;

For 70% of the data, 1 ≤ n ≤ 1000;

For 100% of the data, 1 ≤ n ≤ 100000 and 0 ≤ d~i~ ≤ 10000.
