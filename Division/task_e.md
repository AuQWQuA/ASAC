**Division**

**Problem Description**

In 2048, in the examination room of the CSP certification, Xiaoming, as a contestant, opened the first question. The sample of this problem has n groups of data, numbered from 1 to n, and the scale of data i is a~i~.

Xiaoming designed a violent program for this problem. For a set of data of size u, the **running time** of the program is u^2^. However, after the program has run a set of data of size u, it will run an error on any one set of data of size **less than** u. The a~i~ in the sample isn't necessarily incremented, but Xiaoming wants to run the example correctly without modifying the program, so he decides to use a very primitive solution: Divide all the data into segments with **contiguous** serial numbers, and then merge the data in the same segment into new data whose size is equal to **the sum of the sizes** of the original data in the segment. Xiaoming will let the size of the new data increase.

In other words, Ming needs to find some cut-off points 1 ≤ k~1~ \< k~2~ \<\... \< k~p~ \< n, such that

$$
\sum_{i=1}^{k_1} a_i \leq \sum_{i=k_1+1}^{k_2} a_i \leq \cdots \leq \sum_{i=k_p+1}^{n} a_i
$$

Note that p can be 0 and at that time, k~0~ = 0, that is, Xiaoming can run all the data together.

Xiaoming wants the running time to be minimized while running the sample correctly, that is, to **minimize**

$$
(\sum_{i=1}^{k_1} a_i)^2 + (\sum_{i=k_1+1}^{k_2} a_i)^2 + \cdots + (\sum_{i=k_p+1}^{n} a_i)^2
$$

Xiaoming finds this problem very interesting and asks for your advice: Given n and a~i~, please find the minimum running time of Xiaoming's program under the optimal division scheme.

**Input**

**Due to the large data range of the question, a~i~ of some test points will be generated in the program.**

Two integers, n and type, are in the first line. See the program description for the meaning of n, and type denotes the type of input.

1. If type = 0, the a~i~ of the test point is **given directly**. The following input file: n space-separated integers a~i~ in the second line, indicating the size of each group of data.

2\. If type = 1, a~i~ for this test point will be **specially generated**, as described below. The following input file: Six space-separated integers x, y, z, b~1~, b~2~, m in the second line. In the next m lines, line i (1 ≤ i ≤ m) contains three space-separated positive integers p~i~, l~i~, r~i~.

For test points 23\~25 with type = 1, a~i~ is generated as follows:

Given integers x, y, z, b~1~, b~2~, m, and m triples (p~i~, l~i~, r~i~).

Guarantee n ≥ 2. If n \> 2, then ∀ 3 ≤ i ≤ n, b~i~ = (x × b~i−1~ + y × b~i−2~ + z) mod 2^30^.

Ensure that 1 ≤ p~i~ ≤ n and p~m~ = n. Let p~0~ = 0, then p~i~ also satisfies that ∀ 0 ≤ i \< m has p~i~ \< p~i+1~.

For all 1 ≤ j ≤ m, if the subscript value i (1 ≤ i ≤ n) satisfies p~j−1~ \< i ≤ p~j~, then there is

a~i~ = (bi mod(r~j~ - l~j~ + 1) ) + l~j~

**The above data generation method is only used to reduce the size of the input. Standard algorithms do not rely on this generation method.**

**Output**

Output one line with one integer, indicating the answer.

**Sample Input 1**

5 0

5 1 7 9 9

**Sample Output 1**

247

**Sample Input 2**

10 0

5 6 7 7 4 6 2 13 19 9

**Sample Output 2**

1256

**Sample Input 3**

10000000 1

123 456 789 12345 6789 3

2000000 123456789 987654321

7000000 234567891 876543219

10000000 456789123 567891234

**Sample Output 3**

4972194419293431240859891640

**Hint**

**\[Explanation of Sample 1\]**

The optimal division scheme is {5,1}, {7}, {9}, {9}. 5 + 1 ≤ 7 ≤ 9 ≤ 9, so the scheme is legal.

The answer is (5 + 1)^2^ + 7^2^ + 9^2^ + 9^2^ = 247.

Although the division scheme {5}, {1}, {7}, {9}, {9} corresponds to a smaller running time than 247, it is not a set of legal schemes because 5 \> 1.

Although the division scheme {5}, {1,7}, {9}, {9} is legal, the corresponding running time of this scheme is 251, which is larger than 247.

**\[Explanation of Sample 2\]**

The optimal division scheme is {5}, {6}, {7}, {7}, {4,6,2}, {13}, {19, 9}.

**\[Data Range\]**

---

  Test Point   n≤        a~i~≤   type=
  1\~3         10        10      0
  4\~6         50        10^3^   0
  7\~9         400       10^4^   0
  10\~16       5000      10^5^   0
  17\~22       5×10^5^   10^6^   0
  23\~25       4×10^7^   10^9^   1

---

For all the test points with type=0, make sure the final output answer ≤ 4×10^18^

All the test points satisfy: type ∈ {0,1}, 2 ≤ n ≤ 4×10^7^,1 ≤ a~i~ ≤ 10^9^,1 ≤ m ≤ 10^5^,1 ≤ l~i~ ≤ r~i~ ≤ 10^9^, 0 ≤ x,y,z, b~1~, b~2~,\< 2^30^.
