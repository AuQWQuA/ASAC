**The Trees Outside the Campus**

**Problem description**

There is a row of trees on the road with a distance of l, and the distance between every two adjacent trees is 1 meter. We can view the road as a number axis, where one end of the road is at the 0 and the other end is at l. Every integer point on the number axis, 0, 1, 2\... l, has a tree on it.

There are some areas on the road to be used for the subway. These regions are shown by their starting and ending points on the number axis. It is known that the coordinates of the starting and ending points of any region are integers, and there may be overlapping parts between regions. Now remove the trees in these areas, including the two trees at the starting and ending points of the area. Your task is to calculate how many trees are left on the road after you remove those trees.

**Input**

The first line of the input file contains two integers, l and m, with l representing the length of the road and m representing the number of areas.

The next m lines each contains two different integers, u and v, representing the coordinates of the starting and ending points of a region.

**Output**

The output file includes a line that contains only an integer indicating the number of trees left on the road after removing the trees.

**Sample Input**

500 3

150 300

100 200

470 471

**Sample Output**

298

**Hint**

**Data Size**

For 20% of the data, there is no overlap between regions;

For 100% of the data, ensure that 1 ≤ l ≤ 10^4^, 1 ≤ m ≤ 100, 0 ≤ u ≤ v ≤ l.
