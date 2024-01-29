**The location of The Wireless Network Transmitter**

**Problem Description**

With the increasing popularity of smartphones, there is an increasing need for wireless Internet. There is one city that has decided to cover the public places in the city with the wireless network.

Suppose that the layout of the city is a grid formed by 129 strictly parallel east-west streets and 129 strictly parallel north-south streets, and the distance between adjacent parallel streets is a constant value of 1. The east-west streets are numbered from north to south as 0,1,2 \... 128, and north-south streets from west to east are numbered 0,1,2 \... 128.

The intersection of an east-west street and a north-south street forms a crossing. Stipulate that the coordinate of the intersection formed by the north-south street numbered x and the east-west street numbered y is (x, y). A certain number of public places exist at some intersections.

Due to government financial problems, only one large wireless network transmitter can be installed. The propagation range of this wireless network transmitter is a square centered at the point with a side length of 2d. The propagation range includes the square boundary.

Now the relevant government departments are ready to install a wireless network transmitter with transmission parameter d. We hope you can help them find out the appropriate intersection for the installation site in the city so that most public places are covered.

**Input**

The first line contains an integer d that represents the propagation distance of the wireless network transmitter.

The second line contains an integer n indicating the number of intersections with public places.

The next n lines each contain three integers x, y, k, separated by spaces, representing the coordinates of the intersection (x, y) and the number of public spaces at that intersection. The same coordinate will be given only once.

**Output**

Output a line containing two integers, separated by a space, indicating the number of schemes of installation that can cover the most public spaces and the number of public spaces that can cover the most.

**Sample Input**

1

2

4 4 10

6 6 20

**Sample Output**

1 30

**Hint**

For 100% of the data, 1 ≤ d ≤ 20, 1 ≤ n ≤ 20, 0 ≤ x ≤ 128, 0 ≤ y ≤ 128, 0 \< k ≤ 1000000
