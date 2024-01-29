**Trucking**

**Problem Description**

Country A has n cities, numbered from 1 to n, and there are m two-way roads between the cities. Each of these roads has a weight limit for vehicles.

There are now q trucks transporting goods, and drivers want to know how much each vehicle can carry without exceeding the vehicle weight limit.

**Input**

The first line has two integers n and m, separated by a space, indicating that country A has n cities and m roads.

The next m lines have three integers x, y, and z in each line, separated by a space between every two integers, which means that there is a road from city x to city y with a weight limit of z.

Note: x ≠ y, there may be more than one road between two cities.

The next line has an integer q indicating that there are q vans to carry goods.

Next q rows, two integers x, and y, separated by a space, indicating that a van needs to transport goods from city x to city y, ensuring that x ≠ y.

**Output**

There are q lines, one integer per line, indicating for each van, what is its maximum load.

If the van cannot reach its destination, output -1.

**Sample Input**

4 3

1 2 4

2 3 3

3 1 1

3

1 3

1 4

1 3

**Sample Output**

3

-1

3

**Hint**

For 30% of the data, 1 ≤ n \< 1000, 1 ≤ m \< 10,000, 1 ≤ q\< 1000;

For 60% of the data, 1 ≤ n \< 1000, 1 ≤ m \< 5×10^4^, 1 ≤ q\< 1000;

For 100% of the data, 1 ≤ n \< 10\^4, 1 ≤ m \< 5×10^4^, 1 ≤ q\< 3×10^4^, 0 ≤ z ≤ 10^5^.
