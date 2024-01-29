**Cultural Journey**

**Problem Description**

There is an envoy who travels around the world. In each country he goes to, he can learn a culture, but he is not willing to learn any culture more than once, that is, if he has learned a culture, he can not go to any other country which has this culture. Different countries may have the same culture. Countries with different cultures have different views on other cultures. Some cultures will reject foreign cultures. That is, if the envoy learns a certain culture, he cannot go to the countries that reject this culture. Now, given the geographical relationship between each country, each country's culture, each culture's view of the other culture, the start and end of the envoy's trip (in the countries at the start and end of the journey, culture will also be learned), and the road distance between countries, try to find out the minimum number of steps to walk from the start to the end.

**Input**

The first line contains five integers N, K, M, S, and T, separated by spaces, respectively representing the number of countries (countries numbered from 1 to N), the number of cultures (cultures numbered from 1 to K), the number of roads, and the number of the starting point and the ending point (it is ensured that S is not equal to T).

The second line contains N integers separated by a space. The i^th^ number, Ci, represents the culture of country i. In the following K lines, there are K integers in each line, separated by a space between every two integers. The j^th^ number in line i is a~ij~, and a~ij~ = 1 means that culture i rejects foreign culture j; when i is equal to j, it means that outsiders of the same culture are excluded; a~ij~= 0 means that they are not excluded. Note that i repels j does not guarantee that j repels i. There are three integers u, v, and d in the next M lines, separated by a space between every two integers, indicating that there is a bidirectional road with a distance of d between country u and country v. It is ensured that u is not equal to v. There may be multiple roads between two countries.

For 20% of the data, 2 ≤ N ≤ 8, K ≤ 5;

For 30% of the data, 2 ≤ N ≤ 10, K ≤ 5;

For 50% of the data, 2 ≤ N ≤ 20, K ≤ 8;

For 70% of the data, 2 ≤ N ≤ 100, K ≤ 10;

For 100% of the data, 2 ≤ N ≤ 100, 1 ≤ K ≤ 100, 1 ≤ M ≤ N^2^, 1 ≤ k~i~ ≤ K, 1 ≤ u, v ≤ N, 1 ≤ d ≤ 1000, S≠T, 1 ≤ S, T ≤ N.

**Output**

The output has only one line which contains an integer, representing the minimum distance the envoy needs to travel from the starting country to the destination country. If there is no solution, output -1.

**Sample Input**

2 2 1 1 2

1 2

0 1

1 0

1 2 10

**Sample Output**

-1
