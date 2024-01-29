**Epidemic Control**

**Problem Description**

Country H has n cities. The n cities are connected by n-1 two-way roads to form a tree. City 1 is the capital and the root node of the tree.

There is an outbreak of a very dangerous infectious disease in the capital of Country H. To control the outbreak and prevent it from spreading to the border cities (the cities indicated by the leaf nodes), the authorities decided to use the military to establish checkpoints in some cities, so that there is at least one checkpoint on every path from the capital to the border cities, and checkpoints can also be established in the border cities. But it is important to note that checkpoints cannot be established in the capital city.

There are now troops stationed in some cities in country H, and more than one army can be stationed in one city. An army can move between cities connected by roads and establish checkpoints in any and only one city except the capital. The time it takes an army to move from one city to another via a road is equal to the length of the road (in hours).

What is the minimum number of hours needed to control the outbreak? Note: Different armies can move at the same time.

**Input**

An integer n on the first line, represents the number of cities.

The next n-1 lines have 3 integers in each line, u, v, and w, separated by spaces, indicating that there is a road of length w from city u to city v. The input data is guaranteed to form a tree, and the root node is numbered 1.

The next line contains an integer m, representing the number of troops.

The next line contains m integers, separated by spaces, representing the serial numbers of the cities where the m armies are stationed.

**Output**

An integer indicating the minimum amount of time it will take to contain the outbreak. Output -1 if the outbreak cannot be contained.

**Sample Input**

4

1 2 1

1 3 2

3 4 3

2

2 2

**Sample Output**

3

**Hint**

**\[Explanation of Sample\]**

The first army will set up a checkpoint at point 2, and the second army will move from point 2 to point 3 to set up a checkpoint. The time required is 3 hours.

**\[Data Range\]**

Guarantee that troops will not be stationed in the capital.

For 20% of the data, 2 ≤ n ≤ 10;

For 40% of the data, 2 ≤ n ≤ 50, 0\< w \<10^5^;

For 60% of the data, 2 ≤ n ≤ 1000, 0\< w \<10^6^;

For 80% of the data, 2 ≤ n ≤ 10^4^ ;

For 100% of the data, 2 ≤ m ≤ n ≤ 5×10^4^, 0\< w \<10^9^.
