**Travel By Car**

**Problem Description**

A and B decide to take A vacation trip. They number the cities they want to visit from 1 to n. The smaller city is to the west of the larger city, and each city is known to have different altitudes. The altitude of city i is h~i~. The distance between city i and j, d~i,j~, is the absolute value of the altitude difference between the two cities, which means d~i,j~ = \| h~i~ - h~j~ \|.

During the journey, A and B take turns driving, A drives on the first day and rotates every day after that. They plan to choose a city s as their starting point, drive all the way east, and end the trip by driving at most x kilometers.

Driving styles differ between A and B, with B always choosing the nearest city along the heading direction as the destination, while A always chooses the second nearest city along the heading direction as the destination (Note: in this case, if the distance between the current city and these two cities is the same, it is considered to be closer to the city with lower altitude.) If either of them cannot choose the destination city according to their principles, or if reaching the destination would take the total distance traveled beyond x kilometers, they will end their trip.

Before setting off, A wants to know two questions:

1\. For a given x=x~0~, which city could be taken as the starting point to minimize the ratio of the total number of driving distances of A to the total number of driving distances of B (if the driving distances of B are 0, the ratio can be regarded as infinity, and the two infinities are regarded as equal). If the ratio of the total number of miles driven by A to the total number of miles driven by B from multiple cities is the smallest, print out the city with the highest altitude.

2.  For any given x=x~i~ and starting city s~i~, the total number of miles driven by A and the total number of miles driven by B.

**Input**

The first line contains an integer n, representing the number of cities.

The second line has n integers, separated by spaces, representing the altitude from city 1 to city n, i.e. h~1~, h~2~\... h~n~, and each h~i~ is different.

The third line contains an integer x~0~.

The fourth line contains an integer m for the given m groups s~i~ and x~i~.

For the next m lines, each contains 2 integers, s~i~, and x~i~, representing a maximum of x~i~ km starting from city s~i~.

**Output**

The output is m+1 lines in total.

The first line contains an integer s~0~ indicating that, for the given x~0~, the ratio of the total number of miles driven by A to the total number of miles driven by B from the city numbered s~0~ is the smallest.

The next m lines, each containing 2 integers separated by a space, represent the total number of miles driven by A and the total number of miles driven by B given s~i~ and x~i~.

**Sample Input 1**

4

2 3 1 4

3

4

1 3

2 3

3 3

4 3

**Sample Output 1**

1

1 1

2 0

0 0

0 0

**Sample Input 2**

10

4 5 6 1 2 3 7 8 9 10

7

10

1 7

2 7

3 7

4 7

5 7

6 7

7 7

8 7

9 7

10 7

**Sample Output 2**

2

3 2

2 4

2 1

2 4

5 1

5 1

2 1

2 0

0 0

0 0

**Hint**

**\[Explanation of Sample 1\]**

![IMG\_256](Travel By Car/media/image1.png){width="2.7604166666666665in" height="1.8541666666666667in"}

The altitude of each city and the distance between the two cities are shown in the figure above.

If they start from city 1, they can reach cities 2, 3, and 4, which are 1, 1, and 2 away from city 1 respectively. But city 3 is lower than city 2 in altitude, so we think city 3 is the closest to city 1. City 2 is the second closest to city 1, so A will go to city 2. After reaching city 2, the cities that can be reached in front are 3, and 4. These two cities are 2, 1 away from city 2, so city 4 is the closest to city 2, so B will go to city 4. After reaching city 4, there are no more reachable cities ahead, so the trip ends.

If they start from city 2, they can reach cities 3, and 4, which are 2, and 1 away from city 2, and since city 3 is the second closest city to city 2, A will go to city 3. After reaching city 3, the city ahead is 4, so city 4 is the closest to city 3, but if they want to reach city 4, the total distance is 2+3=5\>3, so B will end the trip at city 3.

If they start at city 3, the city they can reach is city 4, and since there is no city second closest to city 3, the trip will end before it has even started.

If they start from city 4, there is no city they can reach, so the trip ends before it has even started.

**\[Explanation of Sample 2\]**

When x=7, if starting from city 1, the route is 1 → 2 → 3 → 8 → 9, the distance traveled by A is 1+2=3, and the distance traveled by B is 1+1=2. (In city 1, the closest cities to A are 2 and 6, but city 2 has a higher altitude and is regarded as the second closest city to city 1, so A eventually chooses city 2; After reaching 9, A only has city 10 to go, and there is no second choice to choose, so A can't make a choice and end the trip)

If starting from city 2, the route is 2 → 6 →7, and the distance traveled by A and B is 2 and 4, respectively.

If starting from city 3, the route is 3 → 8 → 9, and the distance traveled by A and B is 2 and 1, respectively.

If starting from city 4, the route is 4 → 6 → 7, and the distance traveled by A and B is 2 and 4, respectively.

If starting from city 5, the route is 5 → 7 → 8, and the distance traveled by A and B is 5 and 1, respectively.

If starting from city 6, the route is 6 → 8 → 9, and the distance traveled by A and B is 5 and 1, respectively.

If starting from city 7, the route is 7 → 9 → 10, and the distance traveled by A and B is 2 and 1, respectively.

If starting from city 8, the route is 8 → 10, and the distance traveled by A and B is 2 and 0, respectively.

If starting from city 9, the route is 9, and the distance traveled by A and B is 0 and 0, respectively (the trip ends as soon as it starts).

If the trip starts from city 10, the route is 10 and the distance traveled by A and B is 0 and 0, respectively.

The ratio of the total number of miles traveled by A to the total number of miles traveled by B from either city 2 or city 4 is the smallest, but city 2 has a higher altitude, so output '2' in the first line.

**\[Data Range and Constraints\]**

For 30% of data, 1 ≤ n ≤ 20,1 ≤ m ≤ 20;

For 40% of data, 1 ≤ n ≤ 100,1 ≤ m ≤ 100;

For 50% of data, 1 ≤ n ≤ 100,1 ≤ m ≤ 1000;

For 70% of data, 1 ≤ n ≤ 1000,1 ≤ m ≤ 10\^4;

For 100% of data, 1 ≤ n,m ≤10^5^, -10^9^ ≤ h~i~ ≤10^9^, 1 ≤ s~i~ ≤ n, 0 ≤ x~i~ ≤10^9^

It is ensured that each h~i~ is different.
