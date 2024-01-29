**Across the river**

**Problem description**

There is a single-log bridge over the river. A frog wants to jump along the bridge from one side of the river to the other. There are some pebbles on the bridge. The frog hates to step on these pebbles. Since the length of the bridge and the distance the frog jumps at once are both positive integers, we can think of the possible points the frog can reach as a series of integral point on the number axis: 0,1\... , L (where L is the length of the bridge). The point 0 indicates the beginning of the bridge, and the point L indicates the end of the bridge. The frog starts at the beginning of the bridge and keeps jumping towards the end. The distance of a jump is any positive integer between S and T (including S,T). When the frog jumps to or over the point of coordinate L, the frog is considered to have jumped out of the bridge.

The problem gives the length L of the log bridge, the range S and T of the frog jumping distance, and the position of the pebbles on the bridge. Your task is to figure out the minimum number of pebbles the frog needs to step on in order to cross the river.

**Input**

There are 3 lines.

-   The first line has a positive integer L, indicating the length of the log bridge.

-   The second line has three positive integers S, T and M, which respectively represent the minimum distance the frog jumps, the maximum distance, and the number of pebbles on the bridge.

-   The third line has M different positive integers representing the positions of these M pebbles on the number axis (the data guarantees that there are no pebbles at the beginning and end of the bridge). All contiguous integers are separated by a space.

**Output**

The output file contains only one integer that represents the minimum number of pebbles the frog must step on to cross the river.

**Sample Input**

10

2 3 5

2 3 5 6 7

**Sample Output**

2

**Hint**

**\[Data Range\]**

-   For 30% of the data, 1 ≤ L ≤ 10^4^;

-   For 100% of the data, 1 ≤ L ≤ 10^9^, 1 ≤ S ≤ T ≤ 10, 1 ≤ M ≤ 100 .
