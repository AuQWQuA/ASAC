**Jump Rocks**

**Background**

The annual "Rock Jumping" competition is about to begin again!

**Problem Description**

The competition will take place in a straight river with some huge rocks scattered across it. The organizing committee has selected two rocks as the starting and finishing points. Between the start and finish, there are N rocks (not including the starting and finishing rocks). During the race, runners will start from the start and jump to the adjacent rocks at each step until they reach the finish.

To make the race more difficult, the organizing committee plans to remove some of the rocks so that the shortest jump distance during the race is as long as possible. Due to budget constraints, the organizing committee will remove up to M rocks between the start and finish points (the rocks at the start and finish points cannot be removed).

**Input**

The first line contains three integers L, N, and M for the distance from the start to the end, the number of rocks between the start and the end, and the maximum number of rocks removed by the organizing committee. Make sure L≥1 and N≥M≥0.

For the next N lines, there is one integer per line. The integer D~i~ (0 \< D~i~ \< L) in the i^th^ line represents the distance of the i^th^ rock from the starting point. These rocks are given in descending order of distance from the starting point, and no two rocks will be in the same location.

**Output**

There is an integer that is the maximum of the shortest jump distance.

**Sample Input**

25 5 2

2

11

14

17

21

**Sample Output**

4

**Hint**

**\[Explanation of the Sample\]**

After removing two rocks at distance 2 and 14 from the starting point, the shortest jump distance is 4 (from the rock at distance 17 to the rock at distance 21, or the rock at distance 21 to the endpoint).

**Data Range**

For 20% of the data, 0 ≤ M ≤ N ≤ 10.

For 50% of the data, 0 ≤ M ≤ N ≤ 100.

For 100% of the data, 0 ≤ M ≤ N ≤ 50000, 1 ≤ L≤10^9^.
