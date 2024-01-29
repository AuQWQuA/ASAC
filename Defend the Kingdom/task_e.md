**Defend the Kingdom**

**Problem Description**

Country Z has n cities and (n-1) bidirectional roads. Each bidirectional road connects two cities, and any two cities can be reached by a number of roads.

Z, the Minister of Defense of Country Z, stations troops in the cities. There are several requirements for stationing troops in the cities:

-A city may or may not have an army stationed in it.

-For any two cities directly connected by the road, troops must be stationed in at least one of them.

-Stationing an army in a city incurs a cost. The cost of stationing an army in a city numbered i is p~i~.

Z quickly came up with a plan for stationing troops that minimizes the total cost. But the King gave Z m requests, each specifying whether two of the cities should have troops. Z had to answer each request one by one. Specifically, if the j^th^ request of the King satisfies the above conditions for stationing (without considering any other request besides the j^th^ request), the minimum cost of stationing troops under this request should be given. If the j^th^ request of the King cannot be met, the output -1. Now please come and help Z.

**Input**

The first line has two integers and a string representing the number of cities 'n', the number of requirements 'm', and the data type 'type' in turn. type is a string consisting of capital letters 'A', 'B', or 'C' and a number from '1', '2', and '3'. It can help you get some points. You may not need to use this parameter. The meaning of this parameter is described in \[Data Size and Conventions\].

The second line has n integers, with the i^th^ integer representing the cost p~i~ of stationing troops in city i.

The next (n-1) lines, with two integers u and v in each line, indicate that there is a two-way road from u to v.

Next m lines, each with four integers a, x, b, y, indicate that a requirement is to station x armies in city a and y armies in city b, where x,y can only take the values 0 or 1:

-If x is 0, it means that city a must not host troops.

-If x is 1, it means that city a must host troops.

-If y is 0, it means that city b must not host troops.

-If y is 1, it means that city b must host troops.

Every two adjacent pieces of data in the input file are separated by a space.

**Output**

There are m lines of output, each containing an integer. The j^th^ line indicates the minimum cost to meet the King's j^th^ request, and if the King's j^th^ request cannot be met, output -1.

**Sample Input**

5 3 C3

2 4 1 3 9

1 5

5 2

5 3

3 4

1 0 3 0

2 1 3 1

1 0 5 0

**Sample Output**

12

7

-1

**Hint**

**\[Explanation of the Sample\]**

\- For the first requirement, the cost is minimal when stationing troops in cities 4 and 5.

\- For the second requirement, the cost is minimal when stationing troops in cities 1, 2, and 3.

\- The third requirement cannot be met, because not stationing troops in cities 1 and 5 means that there are no troops in either of the two cities directly connected by roads.

**\[Data Size and Conventions\]**

  ------------ ------ ---------
  Test Point   type   n = m =
  1,2          A3     10
  3,4          C3     10
  5,6          A3     100
  7            C3     100
  8,9          A3     2×10^3^
  10,11        C3     2×10^3^
  12,13        A1     10^5^
  14,15,16     A2     10^5^
  17           A3     10^5^
  18,19        B1     10^5^
  20,21        C1     10^5^
  22           C2     10^5^
  23,24,25     C3     10^5^
  ------------ ------ ---------

The meaning of data type:

\- 'A': City i is directly connected to city i + 1.

\- 'B': Any city is no more than 100 away from city 1 (distance is defined as the number of edges on the shortest path), that is, if the tree is rooted at city 1, the depth is no more than 100.

\- 'C': There is no special constraint on the tree shape.

\- '1': Guarantee a = 1, x = 1 when asked, that is, require stationing troops in city 1. No restrictions on b and y.

\- '2': Guarantee a and b are adjacent when asked (directly connected by a road)

\- '3': There is no special constraint on the inquiry.

For 100% of the data, guarantee 1 ≤ n,m ≤ 10^5^, 1 ≤ p~i~ ≤ 10^5^, 1 ≤ u, v, a, b ≤ n, a ≠ b, x, y∈{0, 1}.
